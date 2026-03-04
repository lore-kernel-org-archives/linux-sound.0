Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EE33976AF
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 11:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772622556; cv=none; b=l7DVKMTRQbA6CgPHRt0oSbcCj/+5bTCznPc0CQ+LPhj5S0u+Xc/H9q5zpFMjp92oOUx/RpRH6grWLUpidBCN5/eEcxtkVSVziOrbuGjt6xbsi62Nl+xr77JYdTJ7tRSJCRzX4pONEfxfapKuN7V94Oq6cq1/pn8bLkiJFoZP0Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772622556; c=relaxed/simple;
	bh=7MkQaw8+6WErb6OQVO9IawLRGgmva++XkydmKdEEsPk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IomBVBlT0oW9sSZ19tZav4ws5nfHEWmPpVMuwNLX7pRTqASbTSGjCvP83Hz53bWImbgyHHFwOr9QqELAQW2KrYrUm7PmkqHHOlmfLb+/zAbHIhoiFOMWWLpb5971gr69bcOhlS9nymm0fGZtriQz5UvahOGkYdmsz9UW1uyzOck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QV5+l6SC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=iZozPZIj; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QV5+l6SC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=iZozPZIj; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QV5+l6SC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iZozPZIj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QV5+l6SC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iZozPZIj"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2A12E3E7E6;
	Wed,  4 Mar 2026 11:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772622553; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZLMNWFvD/36OGceuPTklWyoC8wBxYYe0Ho5waeOHLME=;
	b=QV5+l6SCiCOo+ZwscrD0mzKN9Z7HhscP5RnqO6cd/wpf6YUOJTUsoh7u39pZ7OGM5Udw1m
	vpioGCYF9GU4O8QDZuat1CiJLVcireqcD7D7f3beDHKzLqW+wSSGL6ljugphWJbltV/YFx
	2ZhzxeuuhsISzRMD7xfwo9IeVgk7ztk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772622553;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZLMNWFvD/36OGceuPTklWyoC8wBxYYe0Ho5waeOHLME=;
	b=iZozPZIjUSij1MdND5fpJHOkN3UFtOOIet7LPG08SAl47jEg1J8Cbd5tU7iVh6Q3018DDf
	HBrBLSgkCd02qdCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772622553; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZLMNWFvD/36OGceuPTklWyoC8wBxYYe0Ho5waeOHLME=;
	b=QV5+l6SCiCOo+ZwscrD0mzKN9Z7HhscP5RnqO6cd/wpf6YUOJTUsoh7u39pZ7OGM5Udw1m
	vpioGCYF9GU4O8QDZuat1CiJLVcireqcD7D7f3beDHKzLqW+wSSGL6ljugphWJbltV/YFx
	2ZhzxeuuhsISzRMD7xfwo9IeVgk7ztk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772622553;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZLMNWFvD/36OGceuPTklWyoC8wBxYYe0Ho5waeOHLME=;
	b=iZozPZIjUSij1MdND5fpJHOkN3UFtOOIet7LPG08SAl47jEg1J8Cbd5tU7iVh6Q3018DDf
	HBrBLSgkCd02qdCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D1BD43EA69;
	Wed,  4 Mar 2026 11:09:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 5zHcMdgSqGmuNwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 04 Mar 2026 11:09:12 +0000
Date: Wed, 04 Mar 2026 12:09:12 +0100
Message-ID: <87342fx353.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Rong Zhang <i@rong.moe>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Cryolitia PukNgae <cryolitia@uniontech.com>,
	Arun Raghavan <arunr@valvesoftware.com>,
	linux-sound@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: Re: [PATCH v3 0/8] ALSA: usb-audio: Add quirks for linear volume devices and deconflict VID
In-Reply-To: <20260303194805.266158-1-i@rong.moe>
References: <20260303194805.266158-1-i@rong.moe>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Tue, 03 Mar 2026 20:47:55 +0100,
Rong Zhang wrote:
> 
> Some quirky devices tune their volume by linearly tuning the voltage
> level (linear volume). In other words, such devices has a linear TLV
> mapping of DECLARE_TLV_DB_LINEAR(scale, TLV_DB_GAIN_MUTE, 0).
> 
> The series mainly adds quirk flags MIXER_PLAYBACK_LINEAR_VOL and
> MIXER_CAPTURE_LINEAR_VOL to represent this case respectively for
> playback and capture mixers. Afterward, apply these quirk flags on them.
> 
> Some MV-SILICON devices with these quirks also have another quirk: VID
> conflicts with Focusrite Novation (0x1235). Hence, add support for
> string-descriptor-based quirk table entries and define an entry for MV-
> SILICON to deconflict them.
> 
> Some improvements to the logic of volume range checks is also included
> in the series to help identify quirky devices with linear volume.
> 
> Changes in v3:
> - Adopt __free(kfree) on string buffers as it turns out to be able to
>   handle ERR_PTR() gracefully (thanks Takashi Iwai)
> - Improve readability by replacing the goto pattern with
>   `p->usb_string_match && p->usb_string_match->*'. The compiler should
>   generate equivalent control paths thanks to the optimizer
> - Link to v2: https://lore.kernel.org/r/20260302185900.427415-1-i@rong.moe/
> 
> Changes in v2:
> - Separate [PATCH v1 6/9] into https://lore.kernel.org/r/20260302173300.322673-1-i@rong.moe/
> - Alloc string buffers with kmalloc() instead of on stack (thanks
>   Takashi Iwai)
> - Get string descriptors in a neater way (ditto)
> - Tiny differences compared to Takashi's sugeestion:
>   - Use `IS_ERR_OR_NULL() || strcmp()' instead of `!IS_ERR_OR_NULL() &&
>     strcmp()', so failure in getting the string descriptor won't
>     resulting in quirk flags being applied to irrelevant devices
>   - Use trivial goto cleanup patterns instead of `__free(kfree)' as the
>     latter can't handle ERR_PTR()
> - Tiny differences compared to my previous reply:
>   - Use usb_string() as Takashi suggested instead of usb_cache_string(),
>     so that we can retrieve the errno and print it out on failure
> - Link to v1: https://lore.kernel.org/r/20260301213726.428505-1-i@rong.moe/
> 
> Rong Zhang (8):
>   Revert "ALSA: usb: Increase volume range that triggers a warning"
>   ALSA: usb-audio: Add helper function for volume range checks
>   ALSA: usb-audio: Improve volume range checks
>   ALSA: usb-audio: Support string-descriptor-based quirk table entry
>   ALSA: usb-audio: Deconflict VID between Focusrite Novation &
>     MV-SILICON
>   ALSA: usb-audio: Add QUIRK_FLAG_MIXER_{PLAYBACK,CAPTURE}_LINEAR_VOL
>   ALSA: usb-audio: Add linear volume quirk for Hotone Audio Pulze Mini
>   ALSA: usb-audio: Apply linear volume quirk on MV-SILICON devices

Applied all patches now to for-next branch.  Thanks.


Takashi
