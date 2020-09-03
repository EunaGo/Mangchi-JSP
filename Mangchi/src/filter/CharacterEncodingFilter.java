package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class CharacterEncodingFilter implements Filter {

	private String encodingType;

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		encodingType=filterConfig.getInitParameter("encoding");
		if(encodingType==null) {
			encodingType="utf-8";
		}

	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		request.setCharacterEncoding(encodingType);
		chain.doFilter(request, response);

	}
	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}




}
