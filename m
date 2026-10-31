Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793461953;
	b=C7ZOZ3QCYf9AB5gXRM4Y36v9FHCruHPOkOZ+aGfU+2oe6bjWnqDP0R6MjGBBmkMfBWe9
	 SJX/Tz07a71HN7UklgjWwEMo6tPUjXcii1gGfOP4GROiY6wEiWgA+76kk17V10poetOz+
	 hxHF8RIj8Cl4ICWQQ19mHS1fo7WPxIV6N/Ma63wmn2mrBLtmG7TeCYkdc4fC6Ri/p6eG8
	 GQ3RWR/TTcy7ewc3OaLDPG/r/EenBEOklGXFX3A0WBI5w6HLnTwk5BG9aeUOM23X+jXqv
	 98ce32d0wtzxuy7FYRcMz1nihTIH+jGUi66M4+z3ay9KSp9rDLYruQ9nW+jPp78V+dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793461953;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spamd-Result:X-Spam-Score;
	bh=s6dmbkR3QxM9zdAcjbmxjOGEJkPuuqdvYu3/ZWC3Ngw=;
	b=4FJmWQ9bxjvK3eaIRmw+z2gDzw4gqVNwcbRDSWA4eS9y41qKwmCin74nrjuEKE3lAN51
	 CEDrpMzyPABGTvAhmN+SDhpreIG9BMrV3q14eUWfKM3Vr5vk8Spz0O1+2cy/nr64QIW3+
	 HEWzbuwaoTyneVPP9A4XvwxuryAkDj+nR+acbWCEKdinv1g+cLsMvllgH+X40DuU3lmVQ
	 trfnpeLUiYbZVIWZsNfmhCY9iFNkhZoC/agvHcIS5N6M84YRK0TU1oI0UoV6ME6KN3FAg
	 tweB4bHZwrNzttUzZ0bSAoXcf4wlqVB7xf5B2eAyi2Ri8Jf8INLUpfTRuXbn62v0ctw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=g+54Jp+p;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=6jHwnsE1;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=g+54Jp+p;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=6jHwnsE1;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB07F606A31A
	for <linux-sound@vger.kernel.org>; Sat, 31 Oct 2026 15:52:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB07F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=g+54Jp+p;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=6jHwnsE1;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=g+54Jp+p;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=6jHwnsE1
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A1F4D22313;
	Sat, 31 Oct 2026 15:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793461950; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s6dmbkR3QxM9zdAcjbmxjOGEJkPuuqdvYu3/ZWC3Ngw=;
	b=g+54Jp+pjPz/wKAnN7/EJLhJGHiVE+F0A01LvucVr9FC5kw8U2c8h7cWrBHpIabKRx50fO
	jPzZ7/zGSIWOgFWT/ILfQbDrAF/WIUARR876++l2Pp8QprAl2hygOLVcY7g7th6c7Vd0el
	jR1Hk3Rh6kBhqCqGWa3Y+lgFoP2d7mo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793461950;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s6dmbkR3QxM9zdAcjbmxjOGEJkPuuqdvYu3/ZWC3Ngw=;
	b=6jHwnsE1fVYX6t9qdWDOi9r5Rr07KMJ/sUyA9TjK66kx5Cpdqy7QFWU2TNHOjKZKcxRaKc
	k129az9+k++okeCA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=g+54Jp+p;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=6jHwnsE1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793461950; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s6dmbkR3QxM9zdAcjbmxjOGEJkPuuqdvYu3/ZWC3Ngw=;
	b=g+54Jp+pjPz/wKAnN7/EJLhJGHiVE+F0A01LvucVr9FC5kw8U2c8h7cWrBHpIabKRx50fO
	jPzZ7/zGSIWOgFWT/ILfQbDrAF/WIUARR876++l2Pp8QprAl2hygOLVcY7g7th6c7Vd0el
	jR1Hk3Rh6kBhqCqGWa3Y+lgFoP2d7mo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793461950;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s6dmbkR3QxM9zdAcjbmxjOGEJkPuuqdvYu3/ZWC3Ngw=;
	b=6jHwnsE1fVYX6t9qdWDOi9r5Rr07KMJ/sUyA9TjK66kx5Cpdqy7QFWU2TNHOjKZKcxRaKc
	k129az9+k++okeCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3B5D713432;
	Sat, 31 Oct 2026 15:52:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id c881BL4O5mppJQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 31 Oct 2026 15:52:30 +0000
Date: Sat, 31 Oct 2026 16:52:29 +0100
Message-ID: <8733tlsw8y.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Guobing Yin <yinguobing@gmail.com>
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for Huawei WRT-WX9 (ALC256, 19e5:320d)
In-Reply-To: <CA+2LKoO7He4DciWnx7qcwndwpZNxA4R1FMTpXGSTVK_k9J6Svg@mail.gmail.com>
References: <CA+2LKoO7He4DciWnx7qcwndwpZNxA4R1FMTpXGSTVK_k9J6Svg@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: A1F4D22313
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -12.51

On Thu, 29 Oct 2026 09:13:31 +0100,
Guobing Yin wrote:
> 
> Hi,
> 
> this is a one-line quirk addition for a Huawei MateBook WRT-WX9 whose
> Realtek ALC256 codec reports subsystem ID 19e5:320d.  The patch is
> attached.
> 
> Problem: headphone insertion is never detected.  The "Headphone Jack"
> control stays off, PipeWire keeps the speaker route selected, and audio
> comes out of the internal speakers and the headphones at the same time.
> Unplugging the headphones leaves the speakers working, so only insertion
> detection is broken.
> 
> Cause: the existing quirk for this machine family is registered for
> 19e5:320f only, so this variant receives no fixup at all.  Applying
> ALC269_FIXUP_HEADSET_MODE makes jack detection work.
> 
> Evidence from the affected machine (kernel 7.0.0-38-generic):
> 
>   lspci -nn:
>     00:1f.3 Audio device [0403]: Intel Corporation Cannon Point-LP
>     High Definition Audio Controller [8086:9dc8] (rev 30)
> 
>   codec:  Realtek ALC256, vendor 0x10ec0256, subsystem 0x19e5320d
>   DMI:    HUAWEI WRT-WX9 / WRT-WX9-PCB, BIOS 1.39
> 
>   Without the fixup:
>     $ amixer -c0 cget numid=12 | tail -1
>       : values=off            # headphones are plugged in
>     $ hda-verb /dev/snd/hwC0D0 0x21 0x0f09 0x0
>       value = 0x0             # pin sense never reports presence
>     PipeWire: analog-output-headphones -> "not available"
> 
>   Booting with snd-hda-intel.model=headset-mode (the same
>   ALC269_FIXUP_HEADSET_MODE fixup):
>     $ amixer -c0 cget numid=12 | tail -1
>       : values=on
>     $ hda-verb /dev/snd/hwC0D0 0x21 0x0f09 0x0
>       value = 0x80000000
>     PipeWire: analog-output-headphones -> "available"; the speaker is
>     muted automatically on insertion and unplugging restores speaker
>     output.
> 
>   HDMI audio profiles and the internal microphone keep working with the
>   fixup applied.
> 
> The attached patch just maps 19e5:320d to that fixup.
> 
> I am not subscribed to the list, please keep me in Cc.
> 
> Thanks,
> yinguobing <yinguobing@gmail.com>
> From: yinguobing <yinguobing@gmail.com>
> Date: Thu, 29 Oct 2026 16:08:00 +0800
> Subject: [PATCH] ALSA: hda/realtek: Add quirk for Huawei WRT-WX9 (ALC256, 19e5:320d)
> 
> On the Huawei MateBook WRT-WX9 whose ALC256 codec reports subsystem ID
> 19e5:320d, headphone jack presence detection never works: the
> "Headphone Jack" control stays off, PipeWire keeps the speaker route
> active, and audio plays from the internal speakers and the headphones at
> the same time.  Unplugging the headphones leaves the speakers working, so
> only insertion detection is broken.
> 
> The existing quirk for this machine family is registered for 19e5:320f
> only, so this variant receives no fixup at all.  ALC256 on this board
> needs ALC269_FIXUP_HEADSET_MODE; without it the codec's jack detection is
> never enabled and GET_PIN_SENSE on the headphone pin (0x21) always reads 0.
> 
> Verified on the affected machine by booting with
> snd-hda-intel.model=headset-mode, which applies the same fixup: the
> "Headphone Jack" control then reports "on" when a plug is inserted,
> GET_PIN_SENSE on pin 0x21 returns 0x80000000, the "Headphones" port
> becomes available in PipeWire, and the speaker is muted automatically on
> insertion.  HDMI audio profiles and the internal microphone keep working.
> 
> Add a SND_PCI_QUIRK entry for 19e5:320d using ALC269_FIXUP_HEADSET_MODE.
> 
> Signed-off-by: yinguobing <yinguobing@gmail.com>

Applied now.  Thanks.


Takashi
