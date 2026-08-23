Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450E0364042;
	Sun, 23 Aug 2026 09:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787475909; cv=none; b=f8eJmqAb2Y44yMAsMFU08TcHg6awTcih2C6/tHI95I0aUUV5BwzbZXNW9sVJfER43JA7s6G5wvLDvBKBuyCVEdXdSllAzkU1FXGkD8d3IVAvTUD0EApuTUqIrJ06fKN/RF7hZofIzwKlwhUBsbCf/Ja7Sasr+2O99d7pBTOcZmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787475909; c=relaxed/simple;
	bh=s3tRzvedsaJNk3Dv+AayP49cjrUIwcrgd7ASbnrlY3w=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qab30bmKV65OhZjTLwU2bEioqQSYywieFfB54lEhmM8bXP0Ty8MYI22GQOb0KS5D25ZNQwjqu2uvt9SZp0wmj0ezXmkA99DEQfJbByK/Wdoy+KISVlM+RBGejS8kdrVmN2II7TumnxICu06KHSNklLPso5NrxU2WMmB2pvSI1Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MS5MQ8aD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SwHq/uSy; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=geNGI8Hw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sV5uYDE5; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MS5MQ8aD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SwHq/uSy";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="geNGI8Hw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sV5uYDE5"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8080C862A9;
	Sun, 23 Aug 2026 09:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787475899; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MAIqgHGxQTBaSi78xltQYJxat07GDNiZBgvTCxWmzes=;
	b=MS5MQ8aD9OL8BcSQGhXtLzHC8sd1aIQO2d+bXSm+BeEwPE6M5l35pXs+UD4b97JEbUEln/
	TulTyoYg+AKHnK72tF3nqmn4mvSl5pudRaLCgUIl3F/MtPfdkfFt2E2t17ppZou8K2hBSZ
	p8E7bS1zoTphplxc7i42KPhPFV23eUw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787475899;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MAIqgHGxQTBaSi78xltQYJxat07GDNiZBgvTCxWmzes=;
	b=SwHq/uSyQPzqqOP8lj7ezG8tCu5ng27OUGsbZjDz/q6YKcCjQYb96hi1vH4B0EOfsRUQn8
	/5WlfmHnf5/F08AQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787475895; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MAIqgHGxQTBaSi78xltQYJxat07GDNiZBgvTCxWmzes=;
	b=geNGI8HwNJuIi8/Oixo3BhDOQQ3sGNKvIGN+UukDGelaHFpJD8Q5az0wAANDR7EB8MGL5U
	fPVEXsKha7Od3kG5AjddhAvLyGO1C4gSRlkbVgVoU5Z3KFFUzv9VcUul6arJfkN6gwFqVa
	Gwwqva8pMs8RtTrl1gieinO5SOpaR5c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787475895;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MAIqgHGxQTBaSi78xltQYJxat07GDNiZBgvTCxWmzes=;
	b=sV5uYDE5hBIYd99gjkIJdk1dYE6fi+biAxKa4DO0JRrDthGUEaDPytWf5pQYNp8nbhvspC
	i9wohJHc4Ic/9wAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 36BB013332;
	Sun, 23 Aug 2026 09:04:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EB5lC7e3imqDDgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 23 Aug 2026 09:04:55 +0000
Date: Sun, 23 Aug 2026 11:04:54 +0200
Message-ID: <87h5klw6kp.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Rong Zhang <i@rong.moe>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexander Niemeyer <adventureFAN@gmx.de>
Subject: Re: [PATCH 0/4] ALSA: usb-audio: Demote the severity of sticky GET_CUR
In-Reply-To: <20260823-uac-demote-sticky-check-v1-0-a8cbe572edff@rong.moe>
References: <20260823-uac-demote-sticky-check-v1-0-a8cbe572edff@rong.moe>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-0.996];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmx.de];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,lwn.net,linuxfoundation.org,infradead.org,suse.de,vger.kernel.org,gmx.de];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Sat, 22 Aug 2026 20:52:27 +0200,
Rong Zhang wrote:
> 
> Currently, a mixer is disabled when its GET_CUR is sticky, causing
> userspace to fall back to soft mixers, unless
> QUIRK_FLAG_MIXER_GET_CUR_BROKEN is set. This leads to issues on some
> wireless headphones with broken GET_CUR but effective SET_CUR, which use
> poorly-performed lossy codecs and are prone to audible distortion at low
> volume. They have to set the quirk flag to reeanble the mixer.
> 
> Considering that users can always opt into soft mixers if they need it,
> i.e., when SET_CUR is stubbed, demote the severity of sticky GET_CUR by
> marking GET_CUR as broken and only provide mixer values from the cache.
> The mixer itself is still registered.
> 
> The default behavior of sticky check now becomes what
> QUIRK_FLAG_MIXER_GET_CUR_BROKEN originally does, so the quirk flag is no
> longer needed.
> 
> On some devices, whether their GET_CUR being sticky depends on whether
> hotpluggable components are present. When the hotpluggable components
> are missing on probe, their GET_CUR behavior is classified as broken.
> Therefore, reverse QUIRK_FLAG_MIXER_GET_CUR_BROKEN as
> QUIRK_FLAG_MIXER_GET_CUR_OK, so that it can be set to prevent the
> heuristics from gating GET_CUR.
> 
> Note that even if the quirk flag is set, init_cur_mix_raw() should still
> initialize the mixer value to cval->min, otherwise restoring the bogus
> saved value on the first channel could lead to unbalanced channels.
> 
> The first user of QUIRK_FLAG_MIXER_GET_CUR_OK is Logitech PRO X
> Wireless, whose Playback mixer's GET_CUR somehow becomes broken when the
> microphone is detached, so set QUIRK_FLAG_MIXER_GET_CUR_OK to prevent
> the mixer behavior from depending on whether the microphone is attached.
> The device also needs QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE as the minimum
> mixer value doesn't work properly.
> 
> Reported-by: Alexander Niemeyer <adventureFAN@gmx.de>
> Closes: https://msgid.link/6262cbbd-d1f2-4c9d-a1c7-9c5d12636f4b@gmx.de
> Closes: https://msgid.link/7984832b-86f6-4934-bfc0-1ed70218973a@gmx.de
> Signed-off-by: Rong Zhang <i@rong.moe>

Applied all four patches now.  Thanks.


Takashi
