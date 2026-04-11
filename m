Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A571C5D7D
	for <linux-sound@vger.kernel.org>; Sat, 11 Apr 2026 08:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775894641; cv=none; b=rUbDZoktbhCg2zwyMNIxx+8s/J/WbMVXotMoILTsib9pIy7sFSrIG2X0tI/WKGXOqEEWojG4kHXRcaNyq1OiOah/2vC5QstS9cn5/W8/chU8IorYcdB/acHL4di2tY5Mg6IWeDCUxnp2G3nWcpPHc+KhpQGPRdzqIPxQi6idLOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775894641; c=relaxed/simple;
	bh=kmhcqb9pwXggVTWItXL7MFsoU4eIlFzuxupup33e7r4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UdnKtqSsFC6OWK5yK0Kz1ywwerVccLnzMPg7OsVGO3iJiM14wN+cL7C3bhlGgz6KfNTwDrkZdqTazzgG5OA4nJ725+1HAGf4IZWAOB/UM/y+RQsHe7Vvo8SX6Q74ggBfUzs5knK3sLoZCZIV0nCvnVxmiqwa8XHepCNDhwmZWE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ek7yEcw8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xZy9iuxE; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ek7yEcw8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xZy9iuxE; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ek7yEcw8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xZy9iuxE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ek7yEcw8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xZy9iuxE"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B083F6A7FD;
	Sat, 11 Apr 2026 08:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775894631; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6JbzfffqTvIRjilL5Thiw5KxCO4YfkehzCoMbHjCFGI=;
	b=ek7yEcw823JlIuWBBgyC/G3BU3n2La4p72msS9FxBdi/Lr6LKbPrOVN+KeOVTP4HNcIhtz
	4sdESUxtFqGIGk8/Vyf238neYAEPAXmvO9gd/Tr/lKGhiYloE+kWikBp4WYrn7+gb3A/BQ
	UUZguK7gKcxsHINFsP50X1EWJJ5e6aE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775894631;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6JbzfffqTvIRjilL5Thiw5KxCO4YfkehzCoMbHjCFGI=;
	b=xZy9iuxEtA5HAyna/kq2R47TycymfOer2UUSEBER1unDm2hdjKup4jAMGSFxK0E3G9OheT
	UQVJix9C2Q9tn7Dg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ek7yEcw8;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=xZy9iuxE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775894631; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6JbzfffqTvIRjilL5Thiw5KxCO4YfkehzCoMbHjCFGI=;
	b=ek7yEcw823JlIuWBBgyC/G3BU3n2La4p72msS9FxBdi/Lr6LKbPrOVN+KeOVTP4HNcIhtz
	4sdESUxtFqGIGk8/Vyf238neYAEPAXmvO9gd/Tr/lKGhiYloE+kWikBp4WYrn7+gb3A/BQ
	UUZguK7gKcxsHINFsP50X1EWJJ5e6aE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775894631;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6JbzfffqTvIRjilL5Thiw5KxCO4YfkehzCoMbHjCFGI=;
	b=xZy9iuxEtA5HAyna/kq2R47TycymfOer2UUSEBER1unDm2hdjKup4jAMGSFxK0E3G9OheT
	UQVJix9C2Q9tn7Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 75FF34A0A3;
	Sat, 11 Apr 2026 08:03:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id np0tG2cA2mnBWAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 11 Apr 2026 08:03:51 +0000
Date: Sat, 11 Apr 2026 10:03:50 +0200
Message-ID: <87bjfpgbyx.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Rong Zhang <i@rong.moe>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 0/3] ALSA: usb-audio: Refactor mixer checks and add check for sticky mixers
In-Reply-To: <20260411-uac-sticky-mixer-v1-0-29d62717befd@rong.moe>
References: <20260411-uac-sticky-mixer-v1-0-29d62717befd@rong.moe>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: B083F6A7FD
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Fri, 10 Apr 2026 19:49:01 +0200,
Rong Zhang wrote:
> 
> All callers of get_min_max*() ignore the latter's return code
> completely. This means to ignore temporary errors at the probe time.
> However, it is not optimal and leads to some maintenance burdens.
> Besides, get_min_max_with_quirks() is too lengthy and hard to read.
> 
> Some devices' mixers are sticky, which accept SET_CUR but do absolutely
> nothing. Registering these mixers confuses userspace and results in
> ineffective volume control.
> 
> Patch 1 makes get_min_max*() return -EAGAIN for temporary errors, and
> check against it in the callers of get_min_max*(). If any other error
> occurs, bail out of the caller early.
> 
> Patch 2 moves the volume control resolution check code into a function
> as it's relatively self-contained.
> 
> Patch 3 checks if a mixer is sticky by setting the volume to the maximum
> or minimum value and checking for effectiveness afterward, and prevents
> the mixer from being registered if it turns out to be sticky.
> 
> Quirky device sample:
> 
>   usb 7-1: New USB device found, idVendor=0e0b, idProduct=fa01, bcdDevice= 1.00
>   usb 7-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
>   usb 7-1: Product: Feaulle Rainbow
>   usb 7-1: Manufacturer: Generic
>   usb 7-1: SerialNumber: 20210726905926
>   (Mic Capture Volume)
> 
> This series is separated from https://lore.kernel.org/r/20260409-feaulle-rainbow-v1-2-09179e09000d@rong.moe
> 
> Signed-off-by: Rong Zhang <i@rong.moe>
> ---
> Rong Zhang (3):
>       ALSA: usb-audio: Add error checks against get_min_max*()
>       ALSA: usb-audio: Move volume control resolution check into a function
>       ALSA: usb-audio: Do not expose sticky mixers

Applied all three patches now.  Thanks.


Takashi
