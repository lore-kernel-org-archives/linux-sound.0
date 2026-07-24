Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919B8402BA1
	for <linux-sound@vger.kernel.org>; Fri, 24 Jul 2026 11:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784892654; cv=none; b=CY5G3Da8x6c5c5MEx4LAstj/Vw6BYpwrFRPdzHYL6RGakNezHTWCPiHVJPMy2aFJWYSk4oF908gOYKEf0uq3P8EmizE7NxWYzeSD6gYKpPG2s9lDTxLRTu9WvVO3Xu9jaJBtBN6UKD3+8j+eqfxH2DFM6vXMIBGPmSxrfzfLB5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784892654; c=relaxed/simple;
	bh=DEpVqkw/AAMearoiJE6HNYqXJnDSc4WXO6TIfgftmU4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QSMkzR2o78lPWtG15fA4EF0ep9slwj6ceTSaKOGcwsBPbFcaSOdnJiWqzS0z/AM/wGh2jpgtLtY7NBf1KQ89QkjCxe1kkXj2bGnTANpdccBig28tAYr68DqkENchbnL5wti1JO2+C49/gDzU9eF8/soueI8gBbT3Abhsz8NBLk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tRjWGzfS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ibgL64mq; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tRjWGzfS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ibgL64mq; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tRjWGzfS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ibgL64mq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tRjWGzfS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ibgL64mq"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3B4757B6D9;
	Fri, 24 Jul 2026 11:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784892645; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DOG4g2DBMc5DSI1ZkSxfyIYPsI0K+FvAVfr89lcKPfg=;
	b=tRjWGzfSo7L+JieM/XH8+AidOGgMg7crMe1SqrbluaD+UCYubHbDsOaOqbaV8oSe2uF/Oy
	qqtQOITJ+30pzj1SxUlPrfRrU0memIm4oaHXBt/knY8nLkWHy1t59rJtlISOo7LWXN/7r0
	9Zw/txp6cNruGq7vbA5DhvqLyHOtUFE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784892645;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DOG4g2DBMc5DSI1ZkSxfyIYPsI0K+FvAVfr89lcKPfg=;
	b=ibgL64mqliBi7vGuZ+islongWYVGKSfE5kG6iD/u008ujqnvOf6HPVmES/rHJXue4uk/vz
	3s+M828IW3HOQhDQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=tRjWGzfS;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ibgL64mq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784892645; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DOG4g2DBMc5DSI1ZkSxfyIYPsI0K+FvAVfr89lcKPfg=;
	b=tRjWGzfSo7L+JieM/XH8+AidOGgMg7crMe1SqrbluaD+UCYubHbDsOaOqbaV8oSe2uF/Oy
	qqtQOITJ+30pzj1SxUlPrfRrU0memIm4oaHXBt/knY8nLkWHy1t59rJtlISOo7LWXN/7r0
	9Zw/txp6cNruGq7vbA5DhvqLyHOtUFE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784892645;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DOG4g2DBMc5DSI1ZkSxfyIYPsI0K+FvAVfr89lcKPfg=;
	b=ibgL64mqliBi7vGuZ+islongWYVGKSfE5kG6iD/u008ujqnvOf6HPVmES/rHJXue4uk/vz
	3s+M828IW3HOQhDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 093C9779BA;
	Fri, 24 Jul 2026 11:30:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +xTvAOVMY2pMLwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 24 Jul 2026 11:30:45 +0000
Date: Fri, 24 Jul 2026 13:30:44 +0200
Message-ID: <87v7a4d3q3.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Rong Zhang <i@rong.moe>
Cc: =?GB2312?B?uvrBrMfa?= <hulianqin@vivo.com>,	"perex@perex.cz"
 <perex@perex.cz>,	"tiwai@suse.com" <tiwai@suse.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ALSA: usb-audio: Add iface reset and delay quirk for JKY Technology Q2A
In-Reply-To: <2cb27fb80f6fbdbd3b72138ce2d33c878e4e8049.camel@rong.moe>
References: <TYUPR06MB6217BD7BF1AE9B308295FFFCD2CF2@TYUPR06MB6217.apcprd06.prod.outlook.com>
	<2cb27fb80f6fbdbd3b72138ce2d33c878e4e8049.camel@rong.moe>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 3B4757B6D9
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Fri, 24 Jul 2026 13:08:38 +0200,
Rong Zhang wrote:
> 
> Hi Takashi, Lianqin,
> 
> On Fri, 2026-07-24 at 08:29 +0000, ºúÁ¬ÇÚ wrote:
> > Setting up the interface when suspended/resuming fails on this card.
> > Adding a reset and delay quirk will eliminate this problem.
> > 
> > Note: This device misuses the Apple VID (0x05ac) & PID (0x110b).
> 
> The device's VID conflicts with Apple's, but there is no PID conflict,
> right?
> 
> If a manufacturer uses other's VID, it's a VID conflict. The device
> falls into this category.
> 
> If the manufacturer uses the same PID among different products, it's a
> PID conflict. I don't think it's the case of the device, unless JKY
> Technology reuses PID 0x110b for products other than Q2A.
> 
> > 
> > usb 1-1: New USB device found, idVendor=05ac, idProduct=110b
> > usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> > usb 1-1: Product: Q2A
> > usb 1-1: Manufacturer: JKY Technology
> > usb 1-1: SerialNumber: 330270D2251225
> > 
> > Signed-off-by: Lianqin Hu <hulianqin@vivo.com>
> > ---
> >  sound/usb/quirks.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
> > index 0de7c9d94259..ad2ce384e32d 100644
> > --- a/sound/usb/quirks.c
> > +++ b/sound/usb/quirks.c
> > @@ -2200,6 +2200,8 @@ struct usb_audio_quirk_flags_table {
> >  
> >  static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
> >  	/* Device and string descriptor matches */
> > +	DEVICE_STRING_FLG(0x05ac, 0x110b, "JKY Technology", "Q2A", /* JKY Technology Q2A */
> 
> Hence, I don't think it's necessary to match "Q2A" here.
> 
> Meanwhile, in any case, the comment should describe the VID/PID conflict
> instead of repeating the string descriptor(s) being matched, and the
> strings should break into another line.
> 
> See how commit b13031ca112a ("ALSA: usb-audio: Deconflict VID between
> Focusrite Novation & MV-SILICON") describe the conflict and arrange
> lines.
> 
> > +		   QUIRK_FLAG_FORCE_IFACE_RESET | QUIRK_FLAG_IFACE_DELAY),
> 
> Bad indent.
> 
> This is the first DEVICE_STRING_FLG() item, so please don't set a bad
> example. I would prefer:
> 
> 	DEVICE_STRING_FLG(0x05ac, 0x110b, /* VID conflicts with Apple */
> 			  "JKY Technology", NULL /* Q2A */,
> 			  QUIRK_FLAG_FORCE_IFACE_RESET | QUIRK_FLAG_IFACE_DELAY),
> 

OK, then I scratch the commit now :)
Please resubmit the corrected patch.


thanks,

Takashi
