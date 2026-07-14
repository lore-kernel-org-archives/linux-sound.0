Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD9B2DEA98
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 05:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784007208; cv=none; b=u4xGBwENgYSU8g1x3rPHG8/VD0HFTyCNLyoGLCkldriRYp4/GznC016E+XQeQ3l9rxXEqGxprTEDjsodT4jpJTBr/W+0Ya/0b9SWsxb8DoXA6/qmvYbEpQC153Irf8mbFyHOZ8ZrKtNheL15ZVvXuIVquFuVQXyRwdj25FBZn1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784007208; c=relaxed/simple;
	bh=bsPuXO1EZ5qcSVdN0NFBq9rpmgqWzTVjbQiwQTi/zWw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TyKKA+wRILLNjrzv3x+upJ+efyQiTfxKvlbbl1jYyNWGscM2+wf7ag/44+PX7ywPb0o+laOMffmC5TJwvsmrObDIZkYASJWyM14MDvGAKPpM0H/sYeCFjRms8KRkeut7vrzwABzwOowi3KxwvTi9U3xmQRaPrjVqR3y66h07wTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mq/qdj2J; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7Kvqaxer; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mq/qdj2J; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7Kvqaxer; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mq/qdj2J";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7Kvqaxer";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mq/qdj2J";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7Kvqaxer"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 74C903E1F;
	Tue, 14 Jul 2026 05:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784007205; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UU8RJAZ176LU/Qmfp8iDT6A6ZAyMdwfpbUgyFwdAVTQ=;
	b=mq/qdj2JgEA2SJtEt2Z29RpFWy2qNyM9gdkYhczfNE9T39SyceOBLAAbB3OkGvvVGqGvR2
	oatkfaVnVMoD+6QUhMP19VSP+evQL1653SfgALM23/JcBMIHoegkEe01PSbmDRZoAqZdIo
	2ycuWHe2X9Edk50CJv5MPvwqPzAKGZY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784007205;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UU8RJAZ176LU/Qmfp8iDT6A6ZAyMdwfpbUgyFwdAVTQ=;
	b=7KvqaxerWqLopXAiYTahP/A5BsdJ02ydFFNHkv7c0ochW76yi/IKkpNqHodNO5bfaXG1yD
	XAwwUqD76unyQdBw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="mq/qdj2J";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=7Kvqaxer
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784007205; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UU8RJAZ176LU/Qmfp8iDT6A6ZAyMdwfpbUgyFwdAVTQ=;
	b=mq/qdj2JgEA2SJtEt2Z29RpFWy2qNyM9gdkYhczfNE9T39SyceOBLAAbB3OkGvvVGqGvR2
	oatkfaVnVMoD+6QUhMP19VSP+evQL1653SfgALM23/JcBMIHoegkEe01PSbmDRZoAqZdIo
	2ycuWHe2X9Edk50CJv5MPvwqPzAKGZY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784007205;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UU8RJAZ176LU/Qmfp8iDT6A6ZAyMdwfpbUgyFwdAVTQ=;
	b=7KvqaxerWqLopXAiYTahP/A5BsdJ02ydFFNHkv7c0ochW76yi/IKkpNqHodNO5bfaXG1yD
	XAwwUqD76unyQdBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3EFAE779AE;
	Tue, 14 Jul 2026 05:33:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +xfqDSXKVWpCAgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 14 Jul 2026 05:33:25 +0000
Date: Tue, 14 Jul 2026 07:33:24 +0200
Message-ID: <87se5mjftn.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Chris Chiu <chris.chiu@canonical.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	tiwai@suse.com,
	kailang@realtek.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: hda/realtek: Add inverted LED quirk for HP ZBook 8 G2a
In-Reply-To: <CABTNMG0iB9fGd9AAfvjjzsZULUaXr=sX_ZDL6riAAMgVZhnKqg@mail.gmail.com>
References: <20260713020839.3822602-1-chris.chiu@canonical.com>
	<87qzl7yzd9.wl-tiwai@suse.de>
	<CABTNMG0iB9fGd9AAfvjjzsZULUaXr=sX_ZDL6riAAMgVZhnKqg@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 74C903E1F
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

On Tue, 14 Jul 2026 03:55:53 +0200,
Chris Chiu wrote:
> 
> On Mon, Jul 13, 2026 at 6:09 PM Takashi Iwai <tiwai@suse.de> wrote:
> >
> > On Mon, 13 Jul 2026 04:08:39 +0200,
> > Chris Chiu wrote:
> > >
> > > HP ZBook 8 G2a 14 and 16 (SSIDs 0x103c:0x8f94, 0x103c:0x8f95) use
> > > Realtek ALC245 codec with TAS2781 amplifier via I2C. These models
> > > require inverted speaker mute LED handling compared to the existing
> > > ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED quirk.
> > >
> > > The existing quirk produces opposite LED behavior: when speaker is
> > > muted, the LED turns off (should be on), and when unmuted, the LED
> > > turns on (should be off). This patch adds a dedicated quirk that
> > > properly handles the inverted LED polarity.
> > >
> > > Code flow explanation:
> > > - With HP pin (hp_pin != 0): Uses standard HDA LED framework via
> > >   alc245_fixup_hp_mute_led_coefbit() for full control interface
> > >   support, enabling both manual control and direct hardware updates.
> > >
> > > - Without HP pin (hp_pin == 0, speaker-only laptops): Registers
> > >   direct vmaster_mute hook (alc245_hp_spk_mute_led_update_inverted)
> > >   to control LED during mute operations, ensuring LED feedback
> > >   without headphone jack detection capability.
> > >
> > > Both paths use inverted LED update logic to correct polarity and
> > > maintain backward compatibility with existing systems.
> >
> > So there can be multiple models with the same SSID and they have
> > different hardware configurations?
> >
> 
> The new SSIDs 0x8f94 and 0x8f95 actually have the same hardware
> configuration as the old 0x8f40, 0x8f41, 0x8f42, 0x8f62 but different
> GPIO polarity. I tried to request that they remain aligned but received no
> positive response.

I guess v2 patch is broken in anyway, and that's the reason I asked
about the same SSID -- this one adds the entry for only 103c:8f95, so
I thought it's a change only to a single SSID.  But the patch showed
that it already had 103c:8f94 with the non-existing inverted quirk...

I saw that v3 corrected it, but then the question remains: why do you
need to figure out the hp_pin dynamically?  It's a static
configuration, and you can know beforehand, no?


thanks,

Takashi
