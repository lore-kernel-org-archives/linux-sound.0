Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABFA0388E4E
	for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 07:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784102370; cv=none; b=IqSb1e/6Z90xjmnm6SMa1E/ivaNBWphG1ZFKrGic+VvUwRvs/EHqxiGJSmhivJR+dtk8fO2VntW5GHFrb315pdS/Shcq3HM4WQCqe5HuDnlBvmNHoldc5ErxrJnAamz4nSwU0AeWxmQvirW15ZhLjU4iYzdROhikKN7PxUwpo9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784102370; c=relaxed/simple;
	bh=VhylyxJQCADE9xDA+XdSmghqq4IRpQtzGtuFVSDcQ20=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aVJFyNb5SGY5bYglddOKPEPHoi5uzH1AmmLI5m8sz8ukFe5DUcQv+e6Y3Ul6a4NumuUtzYqkF4Bz5Rm5QajTha37dFhimyOMC6Gr/xVgSUkrtTatiVIvHZ1MxXHKopNm2bS7LqxcwjhVat6Psqf5kd95ZMWT1yHoDn0ubdfI7WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fZQECmMC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Qq+sOQzU; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2DzMQuqb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qn6NObp8; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fZQECmMC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Qq+sOQzU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2DzMQuqb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qn6NObp8"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A805F3E01;
	Wed, 15 Jul 2026 07:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784102367; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WACp3m63EF5pCNiv+mV3W8gnkRgIyNM8rtths6qw68Y=;
	b=fZQECmMCltRfnUkbGlRwKWiHNnV898FeD09kuyMoqySxEiBYLl8GnFsd5D13LysNzlOHWP
	hoyS5NAEPBpVww0dj4fd6eg/jgXoh5d07uv4SNBQHSnMJixYqGH0KvVBYKLPcaZd/TrtNX
	kmv7VDwSRdlK2ofaWurNtErdNQj/6ao=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784102367;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WACp3m63EF5pCNiv+mV3W8gnkRgIyNM8rtths6qw68Y=;
	b=Qq+sOQzU/tK72+kqCZb+Pj7PShj2NYqTC4ANBpT0Jndma1mdepoTX6dB6essyx+EX1U3P7
	EsdXP77Nnel9cwDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=2DzMQuqb;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=qn6NObp8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784102366; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WACp3m63EF5pCNiv+mV3W8gnkRgIyNM8rtths6qw68Y=;
	b=2DzMQuqb29MnMCwDpJWjTAB6Bez6MnbR/xOlqTOYMCaJE+MKK/SOXFWLWYEOGyT3IkLdHK
	BI4+5yxYr4gC9Nv+yQ+wlijQmg2K/rOrrlQg80ffT0/FILZWYqM12LWBCv2N3KGlnlkW+b
	mPOJqU/NHl+Wi2OnFX8RXQ3j8b2uRcU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784102366;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WACp3m63EF5pCNiv+mV3W8gnkRgIyNM8rtths6qw68Y=;
	b=qn6NObp853APwdVgnnmDOOxgRqbiJVWemWppOGMVTV3QVNYRH/98GKYEpHHDOyo+758F6Z
	nh72qsmyBMW7x/Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7474E779AD;
	Wed, 15 Jul 2026 07:59:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id RpI9G949V2ogQAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 15 Jul 2026 07:59:26 +0000
Date: Wed, 15 Jul 2026 09:59:25 +0200
Message-ID: <87jyqwy97m.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Chris Chiu <chris.chiu@canonical.com>
Cc: tiwai@suse.com,
	kailang@realtek.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] ALSA: hda/realtek: Add inverted LED quirk for HP ZBook 8 G2a
In-Reply-To: <20260715041855.63264-1-mingshuo.chiu@rakuten.com>
References: <20260715041855.63264-1-mingshuo.chiu@rakuten.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: A805F3E01
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[canonical.com:email,suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

On Wed, 15 Jul 2026 06:18:55 +0200,
Chris Chiu wrote:
> 
> From: Chris Chiu <chris.chiu@canonical.com>
> 
> HP ZBook 8 G2a 14 and 16 (SSIDs 0x103c:0x8f94, 0x103c:0x8f95) use the
> Realtek ALC245 codec with a TAS2781 amplifier via I2C. They share the
> same hardware configuration as the existing 0x8f40/0x8f41/0x8f42/0x8f62
> models but have inverted speaker mute LED polarity, so the existing
> ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED quirk drives the LED backwards:
> off when muted and on when unmuted.
> 
> Add a dedicated quirk with inverted COEF values. These are speaker-only
> models without an HP pin, so the LED is driven directly through the
> vmaster_mute hook; there is no need to probe the HP pin at runtime since
> the configuration is static and known per SSID.
> 
> Signed-off-by: Chris Chiu <chris.chiu@canonical.com>

Now it looks much better.  But the patch isn't applied cleanly on the
current code.

Could you rebase to the latest tree and resubmit?


thanks,

Takashi
