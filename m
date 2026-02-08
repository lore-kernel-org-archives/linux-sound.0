Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442CD33BBB8
	for <linux-sound@vger.kernel.org>; Sun,  8 Feb 2026 08:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770539132; cv=none; b=H3OKNIiZ9Xh03B+3ND8yJ2cxwqCaoM21afrqTZGCwdULycf3lPzd2N75YJ4aEidmORkhLVwBPlOGfl9oc2HKgY5KE1m5LrGotu+Tj8GlPmJ5jOW1LoGbh2ZuLPftOBQrxbT+hKqm2LZdHY464HyY+Ow68VAiGyuWURkKXFJbfjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770539132; c=relaxed/simple;
	bh=faFR92bZ7BZKZrskjnPmB/d7oBaBvifnJn8IXKqJxUI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V5xxrntnjhncwSKx+ZZMQY1rlq9r1vnVFAd9dn+RmjNgeA+t9VdJpbBGkpzp3HIpb+aIlsFWpuVXGm94YTlZlRM6t7dzIhb9xS+CJJI/TTTywVBQH1U5VpBvMl6ZVl1rgjvbl+03A8WboUjnJrCHzmpO7iglkjON6IunA2jnNxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ukd3djoG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lQWad9ev; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iTdm4WZ5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=EtQpD2tM; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ukd3djoG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lQWad9ev";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iTdm4WZ5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EtQpD2tM"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3253D3E6FA;
	Sun,  8 Feb 2026 08:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770539130; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xG2Qom/pP99D1JYSj7ayPkwReGbl3Wf/fTghvN8UA+w=;
	b=Ukd3djoG7QeKGAeApbR8Ui5CYWEcxRxrm2uesMv3z4VwPHvsVx7078HIY/y4/pcdHeGGH4
	ghZR8AQv20XWDH5CNz1Sj/jqY9BQDURxSh6QYiQvpJoLLalCwJzmSvY/Yla+DqEbI37QcR
	idymZ7PCaN4/bu/6giY/79BrpC/Tfek=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770539130;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xG2Qom/pP99D1JYSj7ayPkwReGbl3Wf/fTghvN8UA+w=;
	b=lQWad9ev9FBk8NDuVWUJK+SUQ/xL/anJpGVXb+BJMfDYorJIST0P8Zlx9xbwgtM1E+en0b
	CkpitrTldwlc1vAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=iTdm4WZ5;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=EtQpD2tM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770539129; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xG2Qom/pP99D1JYSj7ayPkwReGbl3Wf/fTghvN8UA+w=;
	b=iTdm4WZ5Kf64eNplNQw3cE2V9Km3EdJbvS/olLGub1N96sH3f6or+A6Vb5fjnTA052lSSc
	soU4dqM4JHAKKPGogEF0+LDUzl7nF3RtHlMslB1jvd5+C4pCxoTMqK+A1jrU1QGiJT38f3
	o0ojBVTzNfu9JOMFYLVocdniAHaYEqc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770539129;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xG2Qom/pP99D1JYSj7ayPkwReGbl3Wf/fTghvN8UA+w=;
	b=EtQpD2tMV24fFs0JuycyOz9BAI08St3XNEg4VBO1NJoRebxpDBUG4ZtLDRjwb3k1PC1JZ+
	jBiZZWUv6/EiCwCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BF5FC3EA63;
	Sun,  8 Feb 2026 08:25:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id PdxZLXhIiGmQMAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 08 Feb 2026 08:25:28 +0000
Date: Sun, 08 Feb 2026 09:25:28 +0100
Message-ID: <871piv8ww7.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Illia Barbashyn <04baril@gmail.com>
Cc: tiwai@suse.com,
	Jaroslav Kysela <perex@perex.cz>,
	Stefan Binding <sbinding@opensource.cirrus.com>,
	Kailang Yang <kailang@realtek.com>,
	Chris Chiu <chris.chiu@canonical.com>,
	Edip Hazuri <edip@medip.dev>,
	linux-sound@vger.kernel.org (open list:SOUND),
	linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH] ALSA: hda/realtek - Enable mute LEDs on HP ENVY x360 15-es0xxx
In-Reply-To: <20260207221955.24132-1-04baril@gmail.com>
References: <20260207221955.24132-1-04baril@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Rspamd-Queue-Id: 3253D3E6FA
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 

On Sat, 07 Feb 2026 23:19:37 +0100,
Illia Barbashyn wrote:
> 
> The mute and mic-mute LEDs on HP ENVY x360 Convertible 15-es0xxx
> (PCI SSID 103c:88b3) do not work with the current driver.
> 
> This model requires a combination of COEFBIT and GPIO fixups to
> correctly control the LEDs. Introduce a new fixup function
> alc245_fixup_hp_envy_x360_mute_led and add a quirk to apply it.
> 
> Signed-off-by: Illia Barbashyn <04baril@gmail.com>

Applied to for-next branch now.  Thanks.


Takashi
