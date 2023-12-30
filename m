Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C2C2561
	for <linux-sound@vger.kernel.org>; Sat, 30 Dec 2023 01:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="my0mHFSP"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3bbd1fab03cso1510470b6e.1
        for <linux-sound@vger.kernel.org>; Fri, 29 Dec 2023 17:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703898936; x=1704503736; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HwYkWgW1JHFwHvKLkXgGkLtuxkESioOUkd0sKPpnaIU=;
        b=my0mHFSPFru/K8rFM3UX9bMbfBChoKqc4tazvE5/cwJgUWicVBQGLuBRzV5bYUjZan
         IuneWe5DqR8dpBfhInXkQ6a2K9x/y0EcVDg3JDL+MqF/3orGkn5EwerwD8UrF1ya65t3
         kGuujOklZwTnLQxYcaQMizE9DisvwMiHJMLsGqs3M3Zt495Rw0LZmsCasDNsVL0Fxsn6
         nAD6FRlDMl2WNiVDr3UZt9koSaJJvojoXQs8J+9mPcBqiRsdvauCJWiXrWxhhPFRj/tW
         EDLnfTqsyzqBfjP4hoM52OCVIw2btGoFG5evZ3+Z++pei6zqFBfqzkZTVY12LtB8z7cQ
         mLBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703898936; x=1704503736;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HwYkWgW1JHFwHvKLkXgGkLtuxkESioOUkd0sKPpnaIU=;
        b=sx4jAC9V/dMr6BPK1cN3+0WsbsfVHNU2blkUOmC4xJ7gcgYAE1nsMuEt3zI9NYz92Y
         9kaLIeCbV8SXDTNWqdnAN0MkQsTA8x55mWL1QuDuu7+kuhQGItrsGMttbeHmINp+dvrX
         k4taLFtX5phnBX6cFX7D6wnTNFqPNGBEObS1OY92CRk/9tVdwEQGb10y724t1rKHtB+a
         DTEVW/FmySVQTotfv82jdk2doZ/mwkKkWFRwWea5lJPVQs63ihHbEilEbT7aydCms1X2
         9LUQLeG0HIM7LXCjg9JiXsCRStJ0DZVGtWKLR3oMk5SaaVwqoBpjYWI+ffYSe2XRCtAt
         Rqhw==
X-Gm-Message-State: AOJu0YyvxwT0uz5MfymzPhc6IC1UXMgxY70xVhwh7gm81L94t/H0BU1m
	47/9shDVTpelGDpabEP2Ols=
X-Google-Smtp-Source: AGHT+IFbD+NJ8KKxSyBuM/2zWnmoJaFtMMEPvhGP6kUb7RSliwzyAEmZJ8k4WNnXnaQDYSTsQJI4dQ==
X-Received: by 2002:a05:6808:bcf:b0:3bb:9145:1f04 with SMTP id o15-20020a0568080bcf00b003bb91451f04mr14967900oik.115.1703898936062;
        Fri, 29 Dec 2023 17:15:36 -0800 (PST)
Received: from geday ([189.115.92.220])
        by smtp.gmail.com with ESMTPSA id p1-20020a17090adf8100b0028c19646c85sm13850113pjv.42.2023.12.29.17.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 17:15:35 -0800 (PST)
Date: Fri, 29 Dec 2023 22:16:06 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: opticXC <aabishmalik3337@gmail.com>, tiwai@suse.com, perex@perex.cz,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 6.6.7 1/1] ALSA: hda/realtek: mute led fix for HP
 Pavilion 14 ec1xxx series
Message-ID: <ZY9vVmMPKoMRN90p@geday>
References: <20231218203659.32948-2-aabishmalik3337@gmail.com>
 <87msttxhtt.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87msttxhtt.wl-tiwai@suse.de>

On Fri, Dec 29, 2023 at 02:24:14PM +0100, Takashi Iwai wrote:
> On Mon, 18 Dec 2023 21:37:00 +0100,
> opticXC wrote:
> > 
> > The HP Pavilion 14 ec1xxx series uses the HP mainboard 8A0F with the ALC287 codec.
> > It needs the ALC287_FIXUP_HP_GPIO_LED quirk to enable the mute led.
> > 
> > 
> > Signed-off-by: opticXC <aabishmalik3337@gmail.com>
> > ---
> >  sound/pci/hda/patch_realtek.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
> > index e45d4c405..416cda983 100644
> > --- a/sound/pci/hda/patch_realtek.c
> > +++ b/sound/pci/hda/patch_realtek.c
> > @@ -9881,6 +9881,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
> >  	SND_PCI_QUIRK(0x103c, 0x89c6, "Zbook Fury 17 G9", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
> >  	SND_PCI_QUIRK(0x103c, 0x89ca, "HP", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
> >  	SND_PCI_QUIRK(0x103c, 0x89d3, "HP EliteBook 645 G9 (MB 89D2)", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
> > +    SND_PCI_QUIRK(0x103c, 0x8a0f, "HP Pavilion 14-ec1xxx", ALC287_FIXUP_HP_GPIO_LED),
> 
> The entry has a coding style problem; it uses 4 spaces instead of a
> hard tab stop.
> 
> Please use a hard tab stop and resubmit.

Hi Takashi, I also think his Signed-off-by line is a no-go unless he can
prove opticXC is a legal name.

Thanks,
Geraldo Nascimento

> 
> 
> thanks,
> 
> Takashi
> 
