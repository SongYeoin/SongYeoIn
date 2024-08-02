package com.syi.project.chat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.syi.project.chat.model.MessageVO;
import com.syi.project.chat.repository.MessageRepository;

@Service
public class MessageServiceImpl implements MessageService {

	
	private final MessageRepository messageRepository;

	@Autowired
	public MessageServiceImpl(MessageRepository messageRepository) {
		this.messageRepository = messageRepository;
	}

	@Override
	public MessageVO createMessage(MessageVO message) {
		return messageRepository.insert(message);
	}

	@Override
	public List<MessageVO> getAllMessage() {
		return messageRepository.findAll();
	}

	@Override
	public MessageVO getMessageOne(String id) {
		return messageRepository.findById(id).orElse(null);
	}

	@Override
	public void deleteMessageById(String id) {
		messageRepository.deleteById(id);
	}

}
