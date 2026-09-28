Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D33E374E73
	for <linux-sound@vger.kernel.org>; Mon, 28 Sep 2026 11:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790594057; cv=none; b=WSdHgiqgGXuWfs3oOj3RrQiL0iRl7EsKgrMSL3PuUo4aC80Jf04iuzlUV7J3HJBJ6vuROzDQL09Ay14M8nx+6gZMiCcGIDvgxmPNrGIeRhn/yrDoxFmp0/nP6OCFOG8cUyKe3t3fyFejzpCqxirPEwJc+HUGfY1Jgrz/RA3Wg80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790594057; c=relaxed/simple;
	bh=fw/gt6JJW4WBC0kseEBQC24S8IE3y1U+VUak1r0Uw38=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D7J5NZDd5Oub7RZSehUQOCHLUqxw0FqefJYx11LrVG8VBv1aYP52wTXOxsXUrk38UEqiY5FDd23u9IGgfAHtaO4h4WuQ9EK997CY4kG6z0PFdNRwvVdF9qO5N99Wxb9vgRYpVGXU6sE5kfaAQevpau50cZ5A8ge5ILvdP0IFqU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pBf05svj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uR89qvy8; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PqhivVoB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JNXRWiEL; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pBf05svj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uR89qvy8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PqhivVoB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JNXRWiEL"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7052A226EE;
	Mon, 28 Sep 2026 11:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790594050; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7FWcxxcnNwXoj2XMZS6ViDxVz6MS+7ah3uQOs3oCiYw=;
	b=pBf05svj1fGMUVaMahCKxtbQKwpVX1iOQIPW2DvilEhVB2AmwB7X8p5sTzr1xP9QvsTYvw
	4k+1EgvicmeL/l67rHirhFNi38FsZrhvUX7iSdnOR2HMQtG61DTCDGe4Arxqey4o1w/l3F
	Y3FQkTL/S7CsX30Q6/lMTQWkwG+cAUU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790594050;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7FWcxxcnNwXoj2XMZS6ViDxVz6MS+7ah3uQOs3oCiYw=;
	b=uR89qvy8DGfxdBIMZcsK+eQyofxFCfaos/ndBPkDKo/wOP3zjS4FmzwyQPg2Fp9tUACk0R
	IXH/I7gQxdsaCrDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=PqhivVoB;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=JNXRWiEL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790594046; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7FWcxxcnNwXoj2XMZS6ViDxVz6MS+7ah3uQOs3oCiYw=;
	b=PqhivVoByBboSn7rhaAdYXN5j6CAtIgvW3YmhiKkp4qAzasLG7zdjDHbz373eBdzjlZh+F
	S2cqikJc/0+Vn32mfFgG+qXcRlZVClKT6s2vePw57Udv3W/aAXli33dMjkNU/IHmhL5yw5
	6rJEYeMT4FdhYgMd1w2sKXoEM+ikfvQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790594046;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7FWcxxcnNwXoj2XMZS6ViDxVz6MS+7ah3uQOs3oCiYw=;
	b=JNXRWiELtjK57v6Ysd254kLqMslS+tpPTtfZ8bROJqJEPnxEuc0CSJIGDEcmOQT4XsPFio
	7zjbi5hWSgCGT8CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 25837133F1;
	Mon, 28 Sep 2026 11:14:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0MyzOP1LumrILgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 28 Sep 2026 11:14:06 +0000
Date: Mon, 28 Sep 2026 13:14:05 +0200
Message-ID: <874if97hmq.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Achilles Zhang <bnqzzdf@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Add native DSD quirk for HiBy FC4
In-Reply-To: <20260921024344.391912-1-bnqzzdf@gmail.com>
References: <20260921024344.391912-1-bnqzzdf@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 7052A226EE
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Mon, 21 Sep 2026 04:43:43 +0200,
Achilles Zhang wrote:
> 
> The HiBy FC4 with USB ID 32bb:0004 advertises its native DSD
> stream as UAC2 RAW_DATA with a 4-byte, 32-bit subslot. Without a
> quirk snd-usb-audio leaves this alternate setting as
> SNDRV_PCM_FORMAT_SPECIAL, so userspace cannot select a native DSD
> format.
> 
> Mark the device with QUIRK_FLAG_DSD_RAW so the existing generic raw
> DSD handling exposes the stream as DSD_U32_BE.
> 
> Tested on an FC4 at DSD256. With the quirk the playback alternate
> setting changes from SPECIAL to DSD_U32_BE and reports DOP=0,
> bitrev=0; native DSD256 playback works correctly.
> 
> Signed-off-by: Achilles Zhang <bnqzzdf@gmail.com>

Applied now.  Thanks.


Takashi
