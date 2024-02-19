Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6783229408
	for <linux-sound@vger.kernel.org>; Mon, 19 Feb 2024 10:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708339723; cv=none; b=EV6W8nDgEN4mTMG7o4knyG0xPaaDsQF6MbuW5lrJpmeTCTNnt5GSPteXIwySk6WIlNmt0vgjhjbAa3D73iyc3OoI6CaeTMXLxFAhzT8QJvhgbks9/V01pp60NEJV07S8YnlrUM4Kp83MJO+merRNVUhcdSUJpMt6TH/GAICoY2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708339723; c=relaxed/simple;
	bh=EqCIpG/PPOh4m5BbqXiQIMwlxaTu08JfQSAfZfXhEL4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XSdMkWpRLGOZTRlu19XEDOU09BhjBgwpiHXclPo31LtiqaGeLgjMujCNXINej+N6c7gkAfmy4fz95sQZdTCGWufMrOlO/XAaFIXKGV1+FkDNJ79dsRL1U0IKM1IEJwjB304Try1RH+h4xKqC6ImnCI4caN7W641MSDQSHXANUUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Yck08Bwn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=93/8CFd/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Yck08Bwn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=93/8CFd/; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Yck08Bwn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="93/8CFd/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Yck08Bwn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="93/8CFd/"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 81525222EE;
	Mon, 19 Feb 2024 10:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708339719; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=m0vWR+AgeIXx3F6LQjl2+OHx7ZzoAMv8GVQZ14xiWoI=;
	b=Yck08BwnaApwB+SYiq9OJ9JhVuJt9cEA5edFWTQmc8oJgvTPR2DKft2e86Y8wRG+qSMpGf
	EhZ6NU/igfLMWhKWUJLzlPyYp0InPcYWHNgQUOtmZ+Z4r+aH5na7mM/V0SmkKMNoKT9UfH
	b9VgBsrWxfOWz0sxtitPSOLzakv5sP8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708339719;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=m0vWR+AgeIXx3F6LQjl2+OHx7ZzoAMv8GVQZ14xiWoI=;
	b=93/8CFd/fWYcT8x9tzGYXEO4eHe091DCobE/k7sKR6UCVBWLPLyk6D2bN8AQAK50l8D2f6
	JIIuM5zFX7WFMIAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708339719; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=m0vWR+AgeIXx3F6LQjl2+OHx7ZzoAMv8GVQZ14xiWoI=;
	b=Yck08BwnaApwB+SYiq9OJ9JhVuJt9cEA5edFWTQmc8oJgvTPR2DKft2e86Y8wRG+qSMpGf
	EhZ6NU/igfLMWhKWUJLzlPyYp0InPcYWHNgQUOtmZ+Z4r+aH5na7mM/V0SmkKMNoKT9UfH
	b9VgBsrWxfOWz0sxtitPSOLzakv5sP8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708339719;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=m0vWR+AgeIXx3F6LQjl2+OHx7ZzoAMv8GVQZ14xiWoI=;
	b=93/8CFd/fWYcT8x9tzGYXEO4eHe091DCobE/k7sKR6UCVBWLPLyk6D2bN8AQAK50l8D2f6
	JIIuM5zFX7WFMIAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5321013647;
	Mon, 19 Feb 2024 10:48:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id dEcxEgcy02W+KQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 19 Feb 2024 10:48:39 +0000
Date: Mon, 19 Feb 2024 11:48:38 +0100
Message-ID: <87ttm4ohkp.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jay Ajit Mate <jay.mate15@gmail.com>
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz
Subject: Re: [PATCH] ALSA: hda/realtek: Fix top speaker connection on Dell Inspiron 16 Plus 7630
In-Reply-To: <20240219100404.9573-1-jay.mate15@gmail.com>
References: <20240219100404.9573-1-jay.mate15@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Yck08Bwn;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="93/8CFd/"
X-Spamd-Result: default: False [-0.72 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_SOME(0.00)[];
	 BAYES_HAM(-2.91)[99.62%];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 FREEMAIL_TO(0.00)[gmail.com];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -0.72
X-Rspamd-Queue-Id: 81525222EE
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Bar: /

On Mon, 19 Feb 2024 11:04:04 +0100,
Jay Ajit Mate wrote:
> 
> The Dell Inspiron 16 Plus 7630, similar to its predecessors (7620 models),
> experiences an issue with unconnected top speakers. Since the controller
> remains unchanged, this commit addresses the problem by correctly
> connecting the speakers on NID 0X17 to the DAC on NIC 0x03.
> 
> Signed-off-by: Jay Ajit Mate <jay.mate15@gmail.com>

Thanks, applied now.


Takashi
