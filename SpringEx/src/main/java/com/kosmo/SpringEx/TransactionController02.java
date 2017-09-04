package com.kosmo.SpringEx;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import ex05Transaction02.TicketDAO;
import ex05Transaction02.TicketDTO;

//@Controller
public class TransactionController02 {
	
	//servlet-context.xml 설정파일에서 생성한 DAO빈 자동주입(injection)
	private TicketDAO dao;
	@Autowired
	public void setDao(TicketDAO dao){
		this.dao = dao;
	}
	
	//트랜잭션 처리없이 구매하기
	@RequestMapping("/transaction/buyTicketYesTS.do")
	public String buyTicketYesTS(){
		return "transaction/buyTicketYesTS";
	}
	//구매처리 페이지
	@RequestMapping("/transaction/buyTicketYesTSAction.do")
	public String buyTicketYesTSAction(TicketDTO dto, Model model){
		
		//실제 티켓 구매 DB처리
		dao.buyTicket(dto);
		model.addAttribute("ticketinfo", dto);
		
		return "transaction/buyTicketYesTSAction";
	}
}
