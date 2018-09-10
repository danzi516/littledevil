package cn.com.hd.service.company;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.com.hd.domain.company.CommodityPromotion;
import cn.com.hd.domain.company.CompanyCommodity;
import cn.com.hd.domain.company.CompanyMember;
import cn.com.hd.domain.company.MemberBillFlow;
import cn.com.hd.domain.company.MemberCommodity;
import cn.com.hd.domain.company.MemberConsume;
import cn.com.hd.domain.company.MemberRecharge;


@Service("memberPaymentService")
public class MemberPaymentService {
	@Resource
	MemberCommodityService memberCommodityService;
	@Resource
	MemberBillFlowService memberBillFlowService;
	@Resource
	CommodityPromotionService commodityPromotionService;
	@Resource
	CompanyCommodityService companyCommodityService;
	@Resource
	CompanyMemberService companyMemberService;
	@Resource
	MemberRechargeService memberRechargeService;
	@Resource
	MemberConsumeService memberConsumeService;
	
	@Transactional
	public void memberBuyCommodity(MemberBillFlow memberBillFlow){
		MemberCommodity memberCommodity = new MemberCommodity();
		memberCommodity.setCompanyMemberId(memberBillFlow.getCompanyMemberId());
		memberCommodity.setCompanyId(memberBillFlow.getCompanyId());
		memberCommodity.setConsumeCash(memberBillFlow.getBillCash());
		memberCommodity.setPayCash(memberBillFlow.getPayCash());
		memberCommodity.setIsDelete("1");
		memberCommodity.setUserId(memberBillFlow.getUserId());
		memberCommodity.setCommodityId(memberBillFlow.getCommodityId());
		memberCommodity.setNumber(0);
		//memberCommodity.setPromotionId(memberBillFlow.getPromotionId());
		memberCommodityService.insert(memberCommodity); //添加商品记录
		memberBillFlowService.insert(memberBillFlow); //添加流水
		CompanyMember companyMember = new CompanyMember();
		companyMember.setId(memberBillFlow.getCompanyMemberId());
		double cash = companyMemberService.selectByPrimaryKey(memberBillFlow.getCompanyMemberId()).getCash()-memberBillFlow.getPayCash();
		companyMember.setCash(cash);
		companyMemberService.updateByPrimaryKeySelective(companyMember); //更新余额
	}
	
	
	@Transactional
	public void memberBuyPromotion(MemberBillFlow memberBillFlow){
		MemberCommodity memberCommodity = new MemberCommodity();
		memberCommodity.setCompanyMemberId(memberBillFlow.getCompanyMemberId());
		memberCommodity.setCompanyId(memberBillFlow.getCompanyId());
		memberCommodity.setIsDelete("1");
		memberCommodity.setUserId(memberBillFlow.getUserId());
		memberCommodity.setNumber(0);
		memberCommodity.setPromotionId(memberBillFlow.getPromotionId());
		int promotionId = memberBillFlow.getPromotionId();
		CommodityPromotion commodityPromotion = new CommodityPromotion();
		commodityPromotion.setPromotionId(promotionId);
		List<CommodityPromotion> commodityPromotionList = commodityPromotionService.selectBySelective(commodityPromotion);
		for (int i=0;i<commodityPromotionList.size();i++){
			CompanyCommodity CompanyCommodity = companyCommodityService.selectByPrimaryKey(commodityPromotionList.get(i).getCommodityId());
			memberCommodity.setPayCash(CompanyCommodity.getRealPrice());
			memberCommodity.setConsumeCash(CompanyCommodity.getCommodityPrice());
			memberCommodityService.insert(memberCommodity);//添加商品记录
		}
		memberBillFlowService.insert(memberBillFlow);//添加流水
		
		CompanyMember companyMember = new CompanyMember();
		companyMember.setId(memberBillFlow.getCompanyMemberId());
		double cash = companyMemberService.selectByPrimaryKey(memberBillFlow.getCompanyMemberId()).getCash()-memberBillFlow.getPayCash();
		companyMember.setCash(cash);
		companyMemberService.updateByPrimaryKeySelective(companyMember);//更新余额
	}
	
	@Transactional
	public void memberConsume(MemberBillFlow memberBillFlow){
		MemberCommodity memberCommodity = new MemberCommodity();
		memberCommodity.setId(memberBillFlow.getMemberCommodityId());
		memberCommodity.setIsDelete("0");
		memberCommodityService.updateByPrimaryKeySelective(memberCommodity);
		memberConsumeService.insert(setMemberConsume(memberBillFlow));
		memberBillFlowService.insert(memberBillFlow);
	}
	@Transactional
	public int memberCash(MemberBillFlow memberBillFlow){
		CompanyMember companyMember = companyMemberService.selectByPrimaryKey(memberBillFlow.getCompanyMemberId());
		double cash = companyMember.getCash();
		double payCash = memberBillFlow.getPayCash();
		if(cash<payCash){
			return 1;
		}
		else{
			memberConsumeService.insert(setMemberConsume(memberBillFlow));
			companyMember.setCash(cash-payCash);
			companyMember.setId(memberBillFlow.getCompanyMemberId());
			companyMemberService.updateByPrimaryKeySelective(companyMember);
			memberBillFlowService.insert(memberBillFlow);
			return 0;
		}
	}
	@Transactional
	public void memberRecharge(MemberBillFlow memberBillFlow){
		CompanyMember companyMember = companyMemberService.selectByPrimaryKey(memberBillFlow.getCompanyMemberId());
		if(companyMember!=null){
		double cash = companyMember.getCash();
		double payCash = memberBillFlow.getPayCash();
		companyMember.setCash(payCash+cash);
		companyMember.setId(memberBillFlow.getCompanyMemberId());
		companyMemberService.updateByPrimaryKeySelective(companyMember);
		MemberRecharge memberRecharge = new MemberRecharge();
		memberRecharge.setCompanyMemberId(memberBillFlow.getCompanyMemberId());
		memberRecharge.setCompanyId(memberBillFlow.getCompanyId());
		memberRecharge.setRechargeCash(memberBillFlow.getBillCash());
		memberRecharge.setPayCash(memberBillFlow.getPayCash());
		memberRecharge.setIsDelete("1");
		memberRecharge.setUserId(memberBillFlow.getUserId());
		memberRecharge.setRecorderId(memberBillFlow.getRecorderId());
		memberRecharge.setBalanceState("0");
		memberRechargeService.insert(memberRecharge);
		memberBillFlowService.insert(memberBillFlow);
		}
	}
	
	//设置MemberConsume
	public MemberConsume setMemberConsume(MemberBillFlow memberBillFlow){
		MemberConsume memberConsume = new MemberConsume();
		memberConsume.setCompanyMemberId(memberBillFlow.getCompanyMemberId());
		memberConsume.setCommodityId(memberBillFlow.getCommodityId());
		memberConsume.setCompanyId(memberBillFlow.getCompanyId());
		memberConsume.setConsumeCash(memberBillFlow.getBillCash());
		memberConsume.setPayCash(memberBillFlow.getPayCash());
		memberConsume.setIsDelete("1");
		memberConsume.setUserId(memberBillFlow.getUserId());
		memberConsume.setConsumeType(memberBillFlow.getFlowType());
		return memberConsume;
	}
	
	
}
