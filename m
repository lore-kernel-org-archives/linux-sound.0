Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A48E3FB07F
	for <linux-sound@vger.kernel.org>; Thu,  9 Jul 2026 09:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783588409; cv=none; b=eLeAO+NemlrnvcTNzCU7kkMNNYkp3VRD9ceHzOufhjcxDCUljAp23yu3OoMugUJz3rBTGEO0z7VljIZYPGGuuvH013zUl7wn6KaQlHl7dPGvHfvb9169U3xEoYLPmxxmvZa7BG9QoEi6VApB8p6gtgEb3U4A0FNlI5Wp9C9gTZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783588409; c=relaxed/simple;
	bh=YqK41BPiywUYJSPlCkEyrJekCOGhYn44tfraqEue+YQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ftmR0jkysLy7AeOcNb4hNqnALgMQvVJXpZSHS5NDWX3UmF4K8CeeDku9vgSvFiEZ+OeEatFpF+oBwbPWm802MLDoyP+ECu8KP4q8olx/gi86Dye4UOhoma7sgmCJDwT7ISpKzm4RblwEfr3yvNSEtqRdGarOls6PdKX9vXfufFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=W6pQo8dD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4B1vhMdC; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jWdxq0yw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=EXBU00Ws; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="W6pQo8dD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4B1vhMdC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jWdxq0yw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EXBU00Ws"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D596675DCF;
	Thu,  9 Jul 2026 09:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783588405; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HeVkEuNtfOdMvXuU2uFnmzfMgZGiGcfLadUo5CM92F0=;
	b=W6pQo8dD7cYTKP7pBzF6qZ93HIZkeTR8c7Sg/aUwkMY73N4KwPyTv0A/8gb6n5QhQ0JJW4
	QI1vBGMgGd6MbxxEbVWyjn2g3NsMEHHdK2hWx8ZA0O++Ep/su3afS094mDm9G79WaxXebv
	OqxEGamUytj46AuxPG+tW9dUPgzerZg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783588405;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HeVkEuNtfOdMvXuU2uFnmzfMgZGiGcfLadUo5CM92F0=;
	b=4B1vhMdC0ZlWcqSyu4YQF1SrYILPQTtv3n5hPfPO5Kq74z5K4HTq0xZaY+ADuG0rjytOAX
	VycnrTesW2m0fZAA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=jWdxq0yw;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=EXBU00Ws
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783588404; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HeVkEuNtfOdMvXuU2uFnmzfMgZGiGcfLadUo5CM92F0=;
	b=jWdxq0ywkRyryUVlI4WpYb2p+llI0+top/B0XsqNiMP1vsUkIspsQPmuAJneP8Xj3w0N+/
	ix0Ve6r3hlQn5KbQJYKAw6KlPTP5IP9vbK0pR5X26AhnTRwotwsMhMpk9KLwibCA2mDPPD
	i1eQF7ttLKphf10rIAT4UqmvSwwDV/0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783588404;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HeVkEuNtfOdMvXuU2uFnmzfMgZGiGcfLadUo5CM92F0=;
	b=EXBU00Ws7Dt8oSATj8V2bIgtHDh+DeyHA2Zkcv+NAikxdDv6/GQQ6MEbzf+cGAzgB1BmIG
	FLZYXZ9XDUIAmrBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A9322779AA;
	Thu,  9 Jul 2026 09:13:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id enpbJzRmT2r/MAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 09 Jul 2026 09:13:24 +0000
Date: Thu, 09 Jul 2026 11:13:24 +0200
Message-ID: <875x2o4jbf.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kailang <kailang@realtek.com>
Cc: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Re: Fixed Headphone noise issue for Dell QCM1255
In-Reply-To: <34b990cb56914148ba02fa8e9d176479@realtek.com>
References: <34b990cb56914148ba02fa8e9d176479@realtek.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: D596675DCF
X-Spam-Score: -3.51

On Thu, 09 Jul 2026 09:27:14 +0200,
Kailang wrote:
> 
> Hi Takashi,
> 
> This platform booted with Ubuntu 24.04 with Pipewire audio server. So, it has pop
> noise with headphone. But it's normal with Pulseaudio server.
> This patch was the workaround. Connect the headphones to DAC 0x2.
> The popping sound will disappear.
> 
> This solution was approved by Dell.
> 
> Thanks.
> Kailang

Applied now.  Thanks.


Takashi
