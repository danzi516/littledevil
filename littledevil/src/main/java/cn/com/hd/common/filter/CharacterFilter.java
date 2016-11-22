package cn.com.hd.common.filter;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.MDC;
import org.springframework.web.filter.OncePerRequestFilter;

import cn.com.hd.domain.uc.User;

public class CharacterFilter extends OncePerRequestFilter {
	public final static String DEFAULT_URI_ENCODE = "UTF-8";

	private String encoding;

	private boolean forceEncoding = false;

	/**
	 * Set the encoding to use for requests. This encoding will be passed into a
	 * {@link javax.servlet.http.HttpServletRequest#setCharacterEncoding} call.
	 * <p>
	 * Whether this encoding will override existing request encodings (and
	 * whether it will be applied as default response encoding as well) depends
	 * on the {@link #setForceEncoding "forceEncoding"} flag.
	 */
	public void setEncoding(String encoding) {
		this.encoding = encoding;
	}

	/**
	 * Set whether the configured {@link #setEncoding encoding} of this filter
	 * is supposed to override existing request and response encodings.
	 * <p>
	 * Default is "false", i.e. do not modify the encoding if
	 * {@link javax.servlet.http.HttpServletRequest#getCharacterEncoding()}
	 * returns a non-null value. Switch this to "true" to enforce the specified
	 * encoding in any case, applying it as default response encoding as well.
	 * <p>
	 * Note that the response encoding will only be set on Servlet 2.4+
	 * containers, since Servlet 2.3 did not provide a facility for setting a
	 * default response encoding.
	 */
	public void setForceEncoding(boolean forceEncoding) {
		this.forceEncoding = forceEncoding;
	}

	@Override
	protected void doFilterInternal(HttpServletRequest req,
			HttpServletResponse res, FilterChain chain)
			throws ServletException, IOException {
		if(MDC.get("userID")==null||"".equals(MDC.get("userID")))
		setLogUser(req);
		if (this.encoding != null
				&& (this.forceEncoding || req.getCharacterEncoding() == null)) {
			req.setCharacterEncoding(this.encoding);
			if (this.forceEncoding) {
				res.setCharacterEncoding(this.encoding);
			}
		}
		HttpServletRequest request = (HttpServletRequest) req;

		String a = new String(request.getRequestURI().getBytes("ISO-8859-1"),
				"UTF-8");

		String b = URLDecoder.decode(request.getRequestURI(), "UTF-8");

		if (a.equals(b)) {
			chain.doFilter(req, res);
			return;
		}
		b = b.substring(request.getContextPath().length());
		getFilterConfig().getServletContext().getRequestDispatcher(b)
				.forward(req, res);
	}
	
	private void setLogUser(HttpServletRequest req){
		User user=(User)req.getSession().getAttribute("user");
		if(user!=null&&user.getId()!=null){
			 MDC.put("userName",user.getUserName());  
			 MDC.put("userId",user.getId().toString());  
		}else{
			MDC.put("userId","0");  
		}
	}

}
