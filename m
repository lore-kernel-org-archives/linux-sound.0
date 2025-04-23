Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CC6FC08
	for <linux-sound@vger.kernel.org>; Wed, 23 Apr 2025 11:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745408842; cv=none; b=WMD/MUMdnaeJSxZdP0xyWUKXCD/Qht2DS8Nhij4MraCdcAN3XFHz42pynMzqo2RwOilmLMlEgVAd0wiAXDZ0lsHPxkZCsY58xVEG4jbaydaOAvmHvjCzcNhDrgNEredpE93YFFi0ssUf6ks49Vli3G0xAPMfZP4UqZmyfEjl0nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745408842; c=relaxed/simple;
	bh=J7o+J3sOhod/BG2La9tNXJBFRxfgeyQovBfOa75a8SY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FrI3Sv94/oPJ+g+mEuSyFguqkVpHIuaPHx7Zfc75N9dXsdzTufyrIaaA+0VUyyEr/FMF3UUdMyly2ZCszo5DMChxMXpkw1/Co/WSrScYWbjBCLY0UtqNBOew5JzVjojtGDio+IeHves0NrUudtoE8NEKiSh9lPL6N1Y2LJHnQ+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NXDvk3L7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Hj2rWPm8; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NXDvk3L7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Hj2rWPm8; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NXDvk3L7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Hj2rWPm8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NXDvk3L7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Hj2rWPm8"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A438621194;
	Wed, 23 Apr 2025 11:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745408836; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=57vLByY/nZX92pp4ezXqBzpXnygzhQGo6x+xeB9i/mI=;
	b=NXDvk3L7kRVTjfjgpUtVuyhN4gUv8c35JVMLpzcTLfgDYiJPDAdg8RS+F1VPSLgt+r4ZZ1
	b441QNCXslxv06PN5noPifYGcwbh4U20NVOyxA9K7v6e5uVU/lkPS71i8xX0+kJFPioOv9
	7yEgznHt0/PKpHkEHojGQRG/TRqBbwY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745408836;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=57vLByY/nZX92pp4ezXqBzpXnygzhQGo6x+xeB9i/mI=;
	b=Hj2rWPm8Pmt2PC3DGC5ZBygd4vUqi9W9/UxeW0Np7yjT+x9dNIgEyqSlSMnIE8PiSp7N8m
	7YYnmUcRHKMwgQBQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=NXDvk3L7;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Hj2rWPm8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745408836; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=57vLByY/nZX92pp4ezXqBzpXnygzhQGo6x+xeB9i/mI=;
	b=NXDvk3L7kRVTjfjgpUtVuyhN4gUv8c35JVMLpzcTLfgDYiJPDAdg8RS+F1VPSLgt+r4ZZ1
	b441QNCXslxv06PN5noPifYGcwbh4U20NVOyxA9K7v6e5uVU/lkPS71i8xX0+kJFPioOv9
	7yEgznHt0/PKpHkEHojGQRG/TRqBbwY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745408836;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=57vLByY/nZX92pp4ezXqBzpXnygzhQGo6x+xeB9i/mI=;
	b=Hj2rWPm8Pmt2PC3DGC5ZBygd4vUqi9W9/UxeW0Np7yjT+x9dNIgEyqSlSMnIE8PiSp7N8m
	7YYnmUcRHKMwgQBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8E26313691;
	Wed, 23 Apr 2025 11:47:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id fpfVIUTTCGjIOAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 23 Apr 2025 11:47:16 +0000
Date: Wed, 23 Apr 2025 13:47:12 +0200
Message-ID: <87msc73xrz.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/4] ASoC: Intel: byt*: Avoid OOB array read from the map name
In-Reply-To: <61e9c9b8-9ab1-4b6d-adfe-41848bc6b30c@redhat.com>
References: <20250415083144.6588-1-tiwai@suse.de>
	<61e9c9b8-9ab1-4b6d-adfe-41848bc6b30c@redhat.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: A438621194
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Tue, 15 Apr 2025 11:12:56 +0200,
Hans de Goede wrote:
> 
> Hi Takashi,
> 
> On 15-Apr-25 10:31 AM, Takashi Iwai wrote:
> > While reading bug reports, I casually stubmled on a UBSAN warning
> > about the array OOB access, and this looks like a real bug in ASoC
> > Intel driver code.  So here is a series of quick fixes for them.
> 
> Thank you for your work on this.
> 
> If we are going to do this I think we should also try to make
> the handling of invalid map values set as quirk consistent
> between the drivers. ATM we have:
> 
> bytcht_es8316: invalid map does not log anything, behaves as "INTMIC_IN1_MAP"
> bytcr_rt5640:  invalid map gets logged as an error, but not fixed, behaves as "none"
> bytcr_rt5651:  invalid map does not log anything, behaves as "DMIC_MAP"
> bytcr_wm5102:  invalid maps get logged as warn_once, overriden by a default map
> 
> Note the "behaves as" leaves out the problematic OOB array access,
> this is for the rest of the code.
> 
> The above means that your fixes for the bytcht_es8316 and bytcr_rt5651
> are not entirely correct since you use a map name of "none" for invalid
> values which does not match the behavior.
> 
> And for the bytcr_wm5102 code your fixes are not necessary because
> it does:
> 
> static void log_quirks(struct device *dev)
> {
>         switch (quirk & BYT_WM5102_IN_MAP) {
>         case BYT_WM5102_INTMIC_IN3L_HSMIC_IN1L:
>                 dev_info_once(dev, "quirk INTMIC_IN3L_HSMIC_IN1L enabled\n");
>                 break;
>         case BYT_WM5102_INTMIC_IN1L_HSMIC_IN2L:
>                 dev_info_once(dev, "quirk INTMIC_IN1L_HSMIC_IN2L enabled\n");
>                 break;
>         default:
>                 dev_warn_once(dev, "quirk sets invalid input map: 0x%lx, defaulting to INTMIC_
>                               quirk & BYT_WM5102_IN_MAP);
>                 quirk &= ~BYT_WM5102_IN_MAP;
>                 quirk |= BYT_WM5102_INTMIC_IN3L_HSMIC_IN1L;
>                 break;
>         }
>         switch (quirk & BYT_WM5102_OUT_MAP) {
>         case BYT_WM5102_SPK_SPK_MAP:
>                 dev_info_once(dev, "quirk SPK_SPK_MAP enabled\n");
>                 break;
>         case BYT_WM5102_SPK_HPOUT2_MAP:
>                 dev_info_once(dev, "quirk SPK_HPOUT2_MAP enabled\n");
>                 break;
>         default:
>                 dev_warn_once(dev, "quirk sets invalid output map: 0x%lx, defaulting to SPK_SP
>                               quirk & BYT_WM5102_OUT_MAP);
>                 quirk &= ~BYT_WM5102_OUT_MAP;
>                 quirk |= BYT_WM5102_SPK_SPK_MAP;
>                 break;
>         }
> 	...
> }
> 
> and log_quirks() gets called before using FIELD_GET(BYT_WM5102_OUT_MAP, quirk) /
> FIELD_GET(BYT_WM5102_IN_MAP, quirk) as array indexes.
> 
> IMHO it would be best to drop patch 4/4 and for the other 3 machine
> drivers I would prefer to instead modify their log_quirks() to be like
> the bytcr_wm5102 code both for consistency and so that the behavior
> of the code is guaranteed to match the map-name from the array.

I have no preference, and it'd be appreciated if you can just take
over and resubmit as you like ;)


thanks,

Takashi

> 
> Regards,
> 
> Hans
> 
> 
> 
> 
> > ====
> > 
> > Takashi Iwai (4):
> >   ASoC: Intel: bytcht_es8316: Avoid OOB array read from the map name
> >   ASoC: Intel: bytcr_rt5640: Avoid OOB array read from the map name
> >   ASoC: Intel: bytcr_rt5651: Avoid OOB array read from the map name
> >   ASoC: Intel: bytcr_wm5102: Avoid OOB array read from the map name
> > 
> >  sound/soc/intel/boards/bytcht_es8316.c | 11 ++++++++---
> >  sound/soc/intel/boards/bytcr_rt5640.c  | 11 ++++++++---
> >  sound/soc/intel/boards/bytcr_rt5651.c  | 11 ++++++++---
> >  sound/soc/intel/boards/bytcr_wm5102.c  | 27 ++++++++++++++++++++------
> >  4 files changed, 45 insertions(+), 15 deletions(-)
> > 
> 
