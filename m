Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A3E28C2B4
	for <linux-sound@vger.kernel.org>; Fri, 20 Jun 2025 12:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750421480; cv=none; b=c6wFz/qYH8/hDn/7PCcyBZ6ZXZ0zMkfYFXhVz2XXx1S2zSbX15fMI/TZkPsICcv+BHX1Nj4kUVb0DgbAlUqXFsTL5HcfLIxvputPCR5Zu+CC+OBX5WYfQei5eZP/r6AogPK7ccQ/qwAV7XU8fpDDjQbY2A39/SHfCkpPMpMsCEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750421480; c=relaxed/simple;
	bh=0N/kcpGYydm6PnWMi2EQ4bXhmSIyMp8ye4SobJ9CTcw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TaIqOef8QgMe0/4L0UgQ2PALfRLv5V+uDzjaDDnIBXRkeJgkaNH10oej4rP5V4Adc2f/3cEFZzYLevXS9tGafngS/BaLh7oGSjP2Yy7++5zI0yqm/xBwmUafdYHKW0RUCz0OI2tV4Tz4p3zKGwsJfRD5l1K3HkRTZFqpMhUOY9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YnwW59GK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UB1lR9X1; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kN0yv7Mr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=058fJKJx; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YnwW59GK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UB1lR9X1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kN0yv7Mr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="058fJKJx"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7A5021F38D;
	Fri, 20 Jun 2025 12:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750421476; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ugl3v8/nAt+d8TooVUpcSwC6++NI5kFKr9e1aG63Z0M=;
	b=YnwW59GKL25eNsqTZ0KsODA1Y8u7VBl6zL/jtXRov+1fmV5nSjgeT/udYjyDbfGEQ964EW
	5gmyxzzNfNMEbwFS2QwOSPNwsVsWSxPKH9RldVcmO44oNDbgK8G0VCmhZHdwBo0Ju8Uezu
	JTOLfuxSixpOKbl6LZlb/Ak0/Jj0/8M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750421476;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ugl3v8/nAt+d8TooVUpcSwC6++NI5kFKr9e1aG63Z0M=;
	b=UB1lR9X1C8IhKxPU6BcP48Nc+gbR+fCXp4peoMZlVljT3g8G0ucE+scA/rVLjga8KsTdZr
	9gDJLz8HlpsofEBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=kN0yv7Mr;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=058fJKJx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750421475; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ugl3v8/nAt+d8TooVUpcSwC6++NI5kFKr9e1aG63Z0M=;
	b=kN0yv7Mrz/yJ2WrSbSCHnQC9XChzzGj+S0CouQbq1h07BgXtNKVE0JsC3DjU1v3JOfu8TT
	K7RgENoneu64E3ZiCf8mztcrrgRR4iiEJwKF7tw90MjtwYJQpx3FSPzfAbrsTbFV3hQT4U
	29bzVU+RFKqv7OOx8fPrC8qjcgwKwiA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750421475;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ugl3v8/nAt+d8TooVUpcSwC6++NI5kFKr9e1aG63Z0M=;
	b=058fJKJxNB4kQwx/SYmPYZO6En33ARvtUaWR4IMryU2L2vVZJ/aoxyc0AHI+6N6pUHFxtV
	EdPIzVmlbAYgeBCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3CFF813736;
	Fri, 20 Jun 2025 12:11:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id c06ODeNPVWiOIwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 20 Jun 2025 12:11:15 +0000
Date: Fri, 20 Jun 2025 14:11:14 +0200
Message-ID: <87cyaywr31.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: joakim.zhang@cixtech.com
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	chris.chiu@canonical.com,
	kailang@realtek.com,
	geans_chen@realsil.com.cn,
	cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH V1 2/4] ALSA: hda: add no_pin_sense_update flag for jack detection
In-Reply-To: <20250619020844.2974160-3-joakim.zhang@cixtech.com>
References: <20250619020844.2974160-1-joakim.zhang@cixtech.com>
	<20250619020844.2974160-3-joakim.zhang@cixtech.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid,cixtech.com:email];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 7A5021F38D
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.51

On Thu, 19 Jun 2025 04:08:42 +0200,
joakim.zhang@cixtech.com wrote:
> 
> From: Joakim Zhang <joakim.zhang@cixtech.com>
> 
> snd_hda_jack_detect_* functions should be called when want to
> detect then report jack status immediately, however it now called
> from other points such as patch_ops.init which just want to
> judge if the device is attached and no report behaviour.
> 
> Let take corner case into account:
> 1) device is de-attached before suspended, old pin sense is not present
> 2) attach the device when device in suspended
> 3) when codec resume back and the device is attached, it will update
>    pin sense as present from codec init function (patch_ops.init),
>    when it tries to read pin sense from jackpoll delayed work,
>    the old pin sense would be present (but actaully it is not present),
>    and the new pin sense also is present, so decides no changes, cause
>    the device cannot be detected.
> 
> Add no_pin_sense_update flag to control if we need update the pin
> sense when read the hardware pin sense.

I don't understand the situation well.  Do you mean "device" in the
steps 1/2/3 as a device to be connected to the jack, such as a
headphone, not the HD-audio codec device, right?

Even with that assumption, I still don't follow your logic fully...
Basically, when snd_hda_jack_report_sync() is called, this should
report the jack state changes.  I believe we should simply call
snd_hda_jack_report_sync() unconditionally, then schedule the jackpoll
work, as done in my PoC patch.


thanks,

Takashi
