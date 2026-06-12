Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29FB33123D
	for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 21:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781300571; cv=pass; b=JaZ+HvDZi9h04aay/OTvw0zRDfA0uv2HYniO/inw1bBroFRGU74+/qBXuEuL5t3QmiJrdFScBEC6wStmSR+y3gfZwgFAlsC95mKad1fOux6Jz72zOO2FoC0UKcfDJRAmzPl5x82Q2IUhFkXP6+liLvJns8uaXEboGSxA0u60MlA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781300571; c=relaxed/simple;
	bh=Y3EEbGOYPpMP5EWHBh2QepkaHZONirE7XdqpYFAxN3Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oib/8ljexbANYrDqo+oZVcwdjJPfg+ZUuWhIrnVqXA64nW5Z+wopSwToy/4PNDVnZFRowHcdUFGeoAM4fDKWiVFXB+aSLyzKMmR0CnhD9iumGJNME8jqgnygWs76p18E1PhYCAHpa+QWkKbTP11GL61vhpr9tVvdBvsOnTyMOiw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Asp/XAhW; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Asp/XAhW"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2bf1cda2b17so11567495ad.1
        for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 14:42:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781300570; cv=none;
        d=google.com; s=arc-20240605;
        b=FQTevG3W/iDoVRCefmGtcSnfHtyyha8xT198SPyztLPhVxU+SItru7gfqqPByfk2L8
         0cRrxE88Azaii45itjhKdIxLAAmTSCF4uDHHeuOW8p3Z8ViglKnuTTHwLCCHj4EZ22va
         fpBtQ2/TKnuppZ0MHZHp7sz/laLnLOUZ15toyOhWxOTgaHjYMaedcAuzU7KDXXaS6sSr
         DK/r9LDSnblklC23cpQ8gcOaNagD1j/6LdpB7tbp/DbAsX44VbvanrZAWa6Mr+WxWmOL
         vxlMR78UafaKCDw55Z+3mPsDjSuqj+oRnN3X0VJtFvTuqoDSX+hl855qVDwpfgsgs8Si
         exjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1vJ1NEAP1pi8XKUKeidNyFAtITrieBzkmoPXCAEf4CA=;
        fh=8E2ch4u8DxGs50WcvrlSwh4ncXLw7TwjP1kAc7OJOj4=;
        b=GZ8YcRmJco4/Fgf+4Umtx4/Neq8Q7trY3yTcjqRcItvlk/kvA7Z6GcRYrRHKtqv7oj
         V4XSiFXdKPTVsHC5zyW9qs48/pyfCXgWfue/ZcfNnXN1Ok55hIUYpJac3u6tJch47GsP
         cjEH/GaaqxBs0AkJgokeW2GGRjCmtZ1yaiABf7jK7g18mrclCVX8TcKpsgOUnO/m1JVD
         At5flmXB1Y6fcS/cAiakg9NB9IxbQMHdm3wheeRnrvV5MxM6f/f5ZEb5hdWiDR55W91f
         pJ9BaBwCtPyeOG7YENtV0ltLjhK//vE+UvexWLPt9qV8nUxvR4GHaSFJ0IVZghlgFW+w
         udzg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781300570; x=1781905370; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1vJ1NEAP1pi8XKUKeidNyFAtITrieBzkmoPXCAEf4CA=;
        b=Asp/XAhWuDsH8iil3ysMCOTv+AzKk8K6xoeyKPpJu26mV6TibWjtlW0gSuXhpNVA1X
         o5LLIKVQHsgENLb1Am4RAPo0SYCxW/bQZcv+qa6GWrJ/wqaCWqH/upLGtW1jJZk8n5iW
         1hfvAsDgrn7VlkRuimlr3wdW9l6T3qyIdp/zUv/9Dc2VWFrX0qYky/PmMa2Mi9h9iZh3
         a/lmq8kj2D/41WgD4ErmQhO86V/JV6Rnsp4UDe6SLuCPn0EQPKgQzB7jhHrhBwYru4qT
         JDEjqs7fzplOvdP4XgOJoNHxiUer6EULILbaxnbPfX/eF1raJ8VpZSCIC5w9I8uEYVC/
         7O9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781300570; x=1781905370;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1vJ1NEAP1pi8XKUKeidNyFAtITrieBzkmoPXCAEf4CA=;
        b=dyGLNv28U4kQEcWKxhl2L28wH6QH/w3mh8uoFPIB9nupTVIusEoYLLgAnCEFLrZgnX
         YvmJy6yzfmYbz2Ae0dlUbbcpIPCcoulByaqtL8/tJTdvSM9Lk4BrEyOq2yuqy/ieQ6Mw
         qZpDfD9IvRWiV3uq3cVe1zWm9Mo7HKYm5LQdMaw8gE7m+YEpEWFndIcZdYsG3z4dtB9i
         vOMTEQFo3swVp4/R2rxemgczPH7ZUebWrf8GIcZ22ZSBx5+MapZ1TFmzR7wIwWKRPtMt
         Wwkn+x+pRk1IsjM0A8ZCGAG0eV9qrln4Y45BdXhWQ1YC5OdtQCcSn/WF/3r3VGUixj8O
         jzNg==
X-Forwarded-Encrypted: i=1; AFNElJ/r5RJL2ZMAIc/0EnfrhasP0Y7t5Up8Ek8nnWYX8mXYCINqMttTLJMgRKzTVqH0dHjvaN+izogXkSdSdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YynonPjHOIX6wV4JDlRxPPJdJw76xcgGLpVSe/5iNn2Jq/c99me
	1D6S59/Nrfj76enZRHH9BoFwKnG9UBiIFTI73mfjkWBxYxJlHumiYWFf2W5GtBywMPN57olL2uK
	10Wx+K8zM1rNBp2srMmnnfrEtgqttNKI=
X-Gm-Gg: Acq92OFNxeWre2OD33XfIzzW7iF97G4/WU3yj3IKMZlMKpiYX+MPLoE/bSDeLHELr6A
	nwYq1zEj0MgiTNnPWpqZ6jdtEoTWTbHLU4E0ckAT7awbrOerdz5Q8whG8BwS1xY09QcTM7FtI/v
	QyxEX4yw0zsxPmVunT/fajO+fcUgXsZZgqA5PK/dnmWS0UYYpsbyaC7M6eZ9QuSPNWF/6e4CjwY
	Y+4qgI1RgG6PID1U3K9jyA9JfML46nANdSLtEV7mou+Un+TDMjhGNWNE7FlFBm2dpsf4KCRsU9M
	lT2fU16iNba3A5lI6Y3wqsudaq8pNpJ1olrSnAvQwm5VIVzNFFPcdATWWfIeXnqpB2s4/ylJ
X-Received: by 2002:a17:903:2290:b0:2c1:88a1:9839 with SMTP id
 d9443c01a7336-2c3fb4ec546mr42132845ad.11.1781300570163; Fri, 12 Jun 2026
 14:42:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260612132639.78086-1-phucduc.bui@gmail.com> <20260612132639.78086-12-phucduc.bui@gmail.com>
 <aiwgIjVqa4PeGjRQ@sirena.co.uk>
In-Reply-To: <aiwgIjVqa4PeGjRQ@sirena.co.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 13 Jun 2026 04:42:38 +0700
X-Gm-Features: AVVi8CcQ5wnxCnP2P6gAEQ2cG8ISmqVV88AetkLUV34w5sJRMS1FX2oxjLgXEA0
Message-ID: <CAABR9nFAaLgjUURzJjuH+vHwkExK2sq7Nu2jKC1Ge5+gLxFfiA@mail.gmail.com>
Subject: Re: [PATCH 11/11] ASoC: fsl: mpc5200_psc_ac97: Use guard() for mutex locks
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

Thank you for the review.

>
> > -     dev_dbg(psc_dma->dev, "cold reset\n");
> > +     scoped_guard(mutex_lock, &psc_dma->mutex) {
> > +             dev_dbg(psc_dma->dev, "cold reset\n");
>
> mutex_lock not mutex?

Sorry for this oversight.

As mentioned in the cover letter, all files were compile-tested except
mpc5200_dma and mpc5200_psc_ac97.
I'll take a closer look next week and send a v2.

Best regards,
Phuc
