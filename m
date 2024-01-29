Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FEB154436
	for <linux-sound@vger.kernel.org>; Mon, 29 Jan 2024 15:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706543319; cv=none; b=DF8jY1AFjTGJ4IIGLZ3W8Ud6qyfj/wKCL9JWdTVkeQJENv8F+SqYQiPTZhN2nAWmIXgtAgr5P3XeC8KLRihWzZ0X5UtJLK803UeONSiYKrNM0pLG+yJkrthzCfi1oPgY8Vm8vUAoP11jpAR5JmNSZKvIocG3+rvsx7BQrP5kKYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706543319; c=relaxed/simple;
	bh=ZBeINZczaGWk7YpO/vUWjA9wH+oqPxsQELbhYWq5XlU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DzdrAobn+/NPwcFyl1DHZj4X+iZhCgNFmgkTPXb2e2ORDpssIWR8pXFdh2JRTaSDTFRvZu+6vyaj480+5LyZoRHCjoAy36YOVx333c/VDuJpoey9mm0asFQCRW0oXkYXI5T+ocJrT2FS0esbjsr2HWpCzdaI19UQ/zDUj09aJvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=I8Ev72vM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sCJocLu7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=laAwEwRW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fkzYpioS; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="I8Ev72vM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sCJocLu7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="laAwEwRW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fkzYpioS"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 93B971F7F5;
	Mon, 29 Jan 2024 15:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1706543315; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r2piSA/L0xGXRF3p4mL65FwT4JjlOO72QInXPEV3YXQ=;
	b=I8Ev72vMkM8hIH9ZjNz2F80DC4ZMniWAlkeJoKjr4LsZno6WkcYa3NFFWqpPRs9Qq4rfM+
	5sXtzyzJtFRxB8mZz8gDqlwFGTGtMXmxct6WOmLvkhNpjBI6qSoR6rVTocgVN1rEcEUidM
	S/KucNMWh2T4YIShJwUqujeheoOViqc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706543315;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r2piSA/L0xGXRF3p4mL65FwT4JjlOO72QInXPEV3YXQ=;
	b=sCJocLu7ISblTsBFJnxXB9w53nNKIlfbiZFAAVbbj0KmuyJsltxQNY1H8868pApwqM+q/r
	ScGTl5htHFtVNaDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1706543313; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r2piSA/L0xGXRF3p4mL65FwT4JjlOO72QInXPEV3YXQ=;
	b=laAwEwRWIy+EYFplD+Vp13TzOVSK5YMjYCbRrnktKY+Iux3bP7Mwd6GwmtIaXQAM4UmO1M
	EYF/u1kUuqLp7e8yH64m6tokblg28kdE7r0juuqwQhXw6vlsYhc9xE5qwgLCUA4URN/wIh
	fDpuEJaYHLqIe8331YIiX61kmqKLjQo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706543313;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r2piSA/L0xGXRF3p4mL65FwT4JjlOO72QInXPEV3YXQ=;
	b=fkzYpioSMebr2PMwwGe84OUFkyLB6I49j3UV8hhkDuSLiQkllD/B/pJHmeMHDsjl1PP46D
	xPX1tX5PwteKbhBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 751CB13647;
	Mon, 29 Jan 2024 15:48:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id q2BoG9HIt2UCSgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 29 Jan 2024 15:48:33 +0000
Date: Mon, 29 Jan 2024 16:48:33 +0100
Message-ID: <87jzns5eem.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Alexander Tsoy <alexander@tsoy.me>
Cc: linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH] ALSA: usb-audio: Check presence of valid altsetting control
In-Reply-To: <20240129121254.3454481-1-alexander@tsoy.me>
References: <20240129121254.3454481-1-alexander@tsoy.me>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=laAwEwRW;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=fkzYpioS
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[3];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,tsoy.me:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Spam-Score: -3.51
X-Rspamd-Queue-Id: 93B971F7F5
X-Spam-Flag: NO

On Mon, 29 Jan 2024 13:12:54 +0100,
Alexander Tsoy wrote:
> 
> Many devices with a single alternate setting do not have a Valid
> Alternate Setting Control and validation performed by
> validate_sample_rate_table_v2v3() doesn't work on them and is not
> really needed. So check the presense of control before sending
> altsetting validation requests.
> 
> MOTU Microbook IIc is suffering the most without this check. It
> takes up to 40 seconds to bootup due to how slow it switches
> sampling rates:
> 
> [ 2659.164824] usb 3-2: New USB device found, idVendor=07fd, idProduct=0004, bcdDevice= 0.60
> [ 2659.164827] usb 3-2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> [ 2659.164829] usb 3-2: Product: MicroBook IIc
> [ 2659.164830] usb 3-2: Manufacturer: MOTU
> [ 2659.166204] usb 3-2: Found last interface = 3
> [ 2679.322298] usb 3-2: No valid sample rate available for 1:1, assuming a firmware bug
> [ 2679.322306] usb 3-2: 1:1: add audio endpoint 0x3
> [ 2679.322321] usb 3-2: Creating new data endpoint #3
> [ 2679.322552] usb 3-2: 1:1 Set sample rate 96000, clock 1
> [ 2684.362250] usb 3-2: 2:1: cannot get freq (v2/v3): err -110
> [ 2694.444700] usb 3-2: No valid sample rate available for 2:1, assuming a firmware bug
> [ 2694.444707] usb 3-2: 2:1: add audio endpoint 0x84
> [ 2694.444721] usb 3-2: Creating new data endpoint #84
> [ 2699.482103] usb 3-2: 2:1 Set sample rate 96000, clock 1
> 
> Signed-off-by: Alexander Tsoy <alexander@tsoy.me>

Thanks, applied now.

But at the next time, please put maintainers to Cc, so that it can be
caught better.


Takashi
