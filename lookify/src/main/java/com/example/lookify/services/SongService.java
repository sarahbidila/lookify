package com.example.lookify.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.lookify.models.Song;
import com.example.lookify.repositories.SongRepository;

@Service
public class SongService {

	@Autowired
	private SongRepository songRepository;
	
	public List<Song> allSongs(){
		return songRepository.findAll();
	}
	
	public Song oneSong(Long id) {
		return songRepository.findById(id).orElse(null);
	}
	
	public Song createSong(Song song) {
		return songRepository.save(song);
	}
	
	public void deleteSong(Long id) {
		songRepository.deleteById(id);
	}
	
	public List<Song> topSongs(){
		return songRepository.findAllByOrderByRatingDesc();
	}
	
	public List<Song> findByArtist(String artist){
		return songRepository.findByArtistContaining(artist);
	}
}
