Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B9B377A94
	for <linux-sound@vger.kernel.org>; Fri, 17 Jul 2026 13:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784295123; cv=none; b=O/tlmLzyNybdIwe4dXD2neg/wKmdX5CItMnp46lN5+ygrUINEy6rgvfAg1L8TGI+8fTUJfiMt1DDlTRNY7U4JvQHGC8gw8MnOFOZcZ9dQuw0YYjikFOGCP7pwAyQPdiUBII7jgDe3L7TwDKvi3XSU0i1MCH8FElFEW6poQfU1r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784295123; c=relaxed/simple;
	bh=IkhbR9UHLV623OBNO2RRNXe1JCNO20wukoKDIinnGJ4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eOqhzzkFWBqhDAmsyzCzFsYHudL9iZSbbtMN0UHx0m+24k4nS26zFudW6asEtxHZmxf94GYBuH57pQ3gTyGDw8TPSoJURRkId4A4dyzOarYzQXFw4WQyC2k0zRCiuj0cc3J0WkfaTZEVfwSuxigvSivANU0B+Au2UE8qLmS8Lhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=x1R7RAB+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YQtTfpCK; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tlrbSejz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OBugcCLD; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="x1R7RAB+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YQtTfpCK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tlrbSejz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OBugcCLD"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D69CE3E43;
	Fri, 17 Jul 2026 13:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784295114; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HBsP1ZFSLj7TIAcwz58HUO2IDO/gOOP8LUZ2rP61Aqw=;
	b=x1R7RAB+BOxXlC7GXg1IdNaD/RawlfaButC3kkSRZJeSl7ydsaiqhWterxei49IJioMQXv
	wYOb5bNcpQsZK7QdFxmvyApoiSRSL15T4MRRm38D/YGtJx3dw6ITT/bJGUreol7qo4ZvQ/
	kRTIeTfpY1tI5COnC6UjGOCbqtVscBs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784295114;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HBsP1ZFSLj7TIAcwz58HUO2IDO/gOOP8LUZ2rP61Aqw=;
	b=YQtTfpCKdXMmxeByYwx5+8tBk5bmr9tKFp0CwRR34K/+3olQvR+Nva6cqwoKT/XTJxr1hj
	quirjrolGdFv1TBw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=tlrbSejz;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=OBugcCLD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784295113; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HBsP1ZFSLj7TIAcwz58HUO2IDO/gOOP8LUZ2rP61Aqw=;
	b=tlrbSejzz0CBlAczaZa+rcPz1/6LHAFeVgdeKr8dKISplUqfnQp1EMzhaphDcwQ9+pVMWJ
	AO8zK5397ss0xvpqUuuk9N0r0H9RSRClUWkt4i4SCyFg90Al0WASq8r5fRHMMPZrWA7VkX
	6LnwVliBpL4/hEOAPJIqSKzRpHa/teg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784295113;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HBsP1ZFSLj7TIAcwz58HUO2IDO/gOOP8LUZ2rP61Aqw=;
	b=OBugcCLDoAXYPzd3yFQzp+Zrn0r2wtBzlLn5dsD+/QzXrTf0dGZskJj8lYpljGKgMeW21y
	RzR3YMPnWP6R2kBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BA3C3779AA;
	Fri, 17 Jul 2026 13:31:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id nYNJLMkuWmoQaQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 17 Jul 2026 13:31:53 +0000
Date: Fri, 17 Jul 2026 15:31:53 +0200
Message-ID: <878q79u4hi.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Wilko Waitz <wilko@waitz.biz>
Cc: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"tiwai@suse.de" <tiwai@suse.de>
Subject: Re: Conexant SN6140: ThinkPad E16 Gen 4 (17aa:513f) has no speaker output, wrong PCI SSID fixup selected
In-Reply-To: <PA4PR01MB9378349C3FDAD560A1428032A2C62@PA4PR01MB9378.eurprd01.prod.exchangelabs.com>
References: <PA4PR01MB9378349C3FDAD560A1428032A2C62@PA4PR01MB9378.eurprd01.prod.exchangelabs.com>
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
	BAYES_HAM(-3.00)[100.00%];
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
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: D69CE3E43
X-Spam-Score: -3.51

On Fri, 17 Jul 2026 14:23:42 +0200,
Wilko Waitz wrote:
> 
> Hello ALSA developers,
> 
> I would like to report what appears to be another Lenovo ThinkPad SN6140 fixup issue.
> 
> Hardware
> --------
> Laptop: Lenovo ThinkPad E16 Gen 4
> CPU: Intel Core Ultra 7 355
> Audio controller: Intel HD Audio (8086:e428)
> Codec: Conexant SN6140
> Subsystem ID: 17aa:513f
> 
> Software
> --------
> Distribution: CachyOS (Arch Linux based)
> Kernel: 7.1.3-2-cachyos
> PipeWire: 1.6.8
> 
> Problem
> -------
> The internal speakers produce no sound.
> 
> PipeWire, WirePlumber and ALSA all detect the device correctly. The analog sink is present and can be selected. Mixer controls are unmuted and speaker volume is at 100%.
> 
> The codec reports:
> 
> Subsystem Id: 0x17aa513f
> 
> However, during boot I see:
> 
> snd_hda_codec_conexant hdaudioC0D0: SN6140: BIOS auto-probing.
> snd_hda_codec_conexant hdaudioC0D0: SN6140: picked fixup for PCI SSID 17aa:0000
> 
> This looks very similar to the recently reported SN6140 Lenovo issues where the driver falls back to PCI SSID 17aa:0000 instead of using the actual Lenovo subsystem ID.

The above message means that the quirk entry with the vendor match is
picked up because there is no other entry matching with your PCI or
codec SSID.

> 
> Relevant ALSA information:
> 
> 00:1f.3 Multimedia audio controller:
> Intel Corporation Core Ultra Processors (Series 3) HD Audio [8086:e428]
> 
> Kernel driver in use:
> snd_hda_intel
> 
> Playback devices:
> 
> card 0: PCH
> device 0: SN6140 Analog
> 
> Mixer settings:
> 
> Master: 100%
> Speaker: 100% (unmuted)
> PCM: 100%
> Auto-Mute: Disabled
> 
> Pin widget:
> 
> GET_PIN_WIDGET_CONTROL (0x17): 0x40
> GET_AMP_GAIN_MUTE (0x17): 0x00
> 
> PipeWire detects the analog sink correctly and sets it as default.
> 
> Could this ThinkPad E16 Gen 4 (Subsystem ID 17aa:513f) require a new Conexant SN6140 fixup similar to the recently added Lenovo ThinkPad models?
> 
> If additional diagnostics are needed (alsa-info.sh output, codec dump, dmesg, etc.) I would be happy to provide them.

First of all, you'd need to test the existing quirk by aliasing via
model option with the $VENDOR:$DEVICE style of the existing quirk
entry (e.g. 17aa:20f2).  Take a look at sound/hda/codecs/conexant.c.

If none of them works, you need a deeper look and most likely
trial-and-error approaches with different pins and setups manually.


Takashi
