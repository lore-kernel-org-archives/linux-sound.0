Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795194720;
	b=Hwt3+hAl3wbjcSqBakKS4hpYVVsdRMhVCS5gL6EhmQF04Y6/etT745d4gdKtkaCpl90t
	 0k8PFq98Ys3eRK6wjUH5+rPSxHWPWIxuUeLh3XkU27OsJ3qkv4X7yC/zIxRSwqqgRMCUp
	 AEgDdQsp+NXtF3DtnQ6Ur/mBfeG1C0jNunhcoBAlcjUXVwnQh6c15EGdGwUiLRNSgYv5t
	 OjT4+79aWWXFLP1sj6v2BBY6V2IZe26vz5z3PwJDiUXaEjIylBLmBaROfX7YDcNhCiQHJ
	 B7TL0mbJjDIG7bkXD+cvetOUcLkeyIrUBjisz08j8pugs6fzxVmk74z5QCVvLV/pKWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795194720;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spamd-Result:X-Spam-Score;
	bh=C4WNcrWy6IW/AdCMObiWivkaWamwO5g/wk7Z2a8B9eQ=;
	b=vi4FaSuhLTGai3acyA3uzIHBuspVr99Dn9iXjKO3QlISY2n0W5B7TZU8bCInR0nuwF5h
	 kERqCZKeGHkuy48BH2C5CRQvKIqMEPHqWu2qyIZFpkntXAg0QNk/+2GehG4tlsWFBrRXL
	 W9HEzo+HGSjuHf2xIp2y07wpU0XpWMA3I7Nj+eF0UaBiUmKrvd6jUiJWeZIF0snFQrJW1
	 RrZLhGNtKQ8bvKG+93lz9dN8IFBZlo7wK9hFCt1SXHw285op9dO4yz9nHz/UzE3tWAsdM
	 bsYmJe7w0eQSb2VugeN/JEgn/AkvVcfjwZmmTUosPifW3pd/bMKY0dEOO7XBdl/s19A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=hznXqWE3;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=V3orJQl0;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=hznXqWE3;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=V3orJQl0;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E14606A331;
	Fri, 20 Nov 2026 17:11:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72E14606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=hznXqWE3;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=V3orJQl0;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=hznXqWE3;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=V3orJQl0
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 444381F81C;
	Fri, 20 Nov 2026 17:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795194715; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C4WNcrWy6IW/AdCMObiWivkaWamwO5g/wk7Z2a8B9eQ=;
	b=hznXqWE3ppzce+qx3hCvdhyfL6SyMsV8V2jMUkT1ydnxC6m3MlTlhzJ84rogwnjIiYCQD1
	bGd/8yGTBndxq+48v6cFAbpr/ce+gAY3zMSU1VYtrddtw9CzvlyNoxEknAL+KKwi+QA9kI
	4zwqVD6y/5/+mvlO9xDQYUs3gQgBluE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795194715;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C4WNcrWy6IW/AdCMObiWivkaWamwO5g/wk7Z2a8B9eQ=;
	b=V3orJQl07rr8FOkdhXcI9x9DLXP2sDOSmlqrCfGNHB4E1TKX9UKu81apzoZj4sA4RC0oH4
	yErjupCHGT6XuuBQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=hznXqWE3;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=V3orJQl0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795194715; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C4WNcrWy6IW/AdCMObiWivkaWamwO5g/wk7Z2a8B9eQ=;
	b=hznXqWE3ppzce+qx3hCvdhyfL6SyMsV8V2jMUkT1ydnxC6m3MlTlhzJ84rogwnjIiYCQD1
	bGd/8yGTBndxq+48v6cFAbpr/ce+gAY3zMSU1VYtrddtw9CzvlyNoxEknAL+KKwi+QA9kI
	4zwqVD6y/5/+mvlO9xDQYUs3gQgBluE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795194715;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C4WNcrWy6IW/AdCMObiWivkaWamwO5g/wk7Z2a8B9eQ=;
	b=V3orJQl07rr8FOkdhXcI9x9DLXP2sDOSmlqrCfGNHB4E1TKX9UKu81apzoZj4sA4RC0oH4
	yErjupCHGT6XuuBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DA6ED1342D;
	Fri, 20 Nov 2026 17:11:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 3xzSK1p/AGv9UgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 20 Nov 2026 17:11:54 +0000
Date: Fri, 20 Nov 2026 18:11:54 +0100
Message-ID: <8733svwhph.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Akhil Arul <akhilarul324@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	shenghao-ding@ti.com,
	baojun.xu@ti.com,
	Carmel@aperio.ai,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/tas2781-spi: Set tas_hda->dev in probe
In-Reply-To: <20261120125729.135171-1-akhilarul324@gmail.com>
References: <20261120125729.135171-1-akhilarul324@gmail.com>
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
X-Rspamd-Queue-Id: 444381F81C
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
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -12.51

On Fri, 20 Nov 2026 13:57:29 +0100,
Akhil Arul wrote:
> 
> tas2781_hda_remove() is shared by the I2C and SPI drivers and uses
> tas_hda->dev for component_del() and for the runtime PM calls.  The I2C
> probe sets that field, the SPI probe does not, so for SPI it stays NULL
> from the devm_kzalloc().  Unbinding the device through sysfs then warns
> in component_del() and crashes on the NULL device in pm_runtime_get_sync():
> 
>   WARNING: drivers/base/component.c:839 at component_del+0x149/0x170
>   Call Trace:
>    tas2781_hda_remove+0x16/0x60 [snd_hda_scodec_tas2781]
>    device_release_driver_internal+0x19e/0x200
>    unbind_store+0xa4/0xb0
>   Oops: general protection fault, kernel NULL pointer dereference 0x1d1
>   RIP: 0010:__pm_runtime_resume+0x1a/0x90
>    tas2781_hda_remove+0x23/0x60 [snd_hda_scodec_tas2781]
> 
> The same path runs from the driver remove callback and from the
> component_add() failure path in tas2781_hda_spi_probe().
> 
> Before the common library was introduced, the SPI driver had its own
> remove function that used tas_priv->dev.  Set tas_hda->dev in
> tas2781_hda_spi_probe(), as the I2C driver does.
> 
> Tested the probe/unbind path with KASAN and lockdep enabled: without this
> change, unbinding the device gives the warning and oops above; with it,
> unbind, bind and unbind again complete without any splat.
> 
> Fixes: 28a09d9e42c5 ("ALSA: hda/tas2781: Create an independent lib to save the shared parts for both SPI and I2C driver")
> Reported-by: Carmel Okun <Carmel@aperio.ai>
> Closes: https://lore.kernel.org/linux-sound/AS2PR02MB10038DB2CE8CAE659D35B9F1AC8792@AS2PR02MB10038.eurprd02.prod.outlook.com/
> Cc: stable@vger.kernel.org
> Signed-off-by: Akhil Arul <akhilarul324@gmail.com>

Applied now.  Thanks.


Takashi
