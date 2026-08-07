Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FEBD3B2FD0
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 22:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786143420; cv=none; b=npOC1UCAx7J9EZr++xUyZIgmFBSXhE2RxC2PWYhqlWPkPWExjJDaA8RsdTqG1FfdofuuLUHV7nSTOuPMXuKAQ+Nerou8eRJ58d3HD7H2AGhf048a9YqmFYKjV67Pl0E7EMmLWLD4anvMbkf7Ovy9QUj5hFwiyZHzHC57O0m3Psw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786143420; c=relaxed/simple;
	bh=kWDE/FTDl6sqiYTfUg6YnEwEYtS9ZEf+xZ375s7184Q=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QLVDA0VlSvTcmAGwDA1ZBCOwFi7UH2oydNIyFoS+avTXjbN0B1gY7YV5CcYvxLOp2ieNhYF8YeuScH1qgteqhi3EYI+PGRleJn43ObW/MehHkGlGC8iUB4fFgM8zZnxN8lC7q9t4XrRqH6c8OZO//O/rImgb6SBhV/voBMUFI8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QJixRRmI; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QJixRRmI"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so723055e9.2
        for <linux-sound@vger.kernel.org>; Fri, 07 Aug 2026 15:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786143417; x=1786748217; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WWHQrKkplC0WYi76yok/S4SnvzljhW3mlGtup9LzYK0=;
        b=QJixRRmIndx9ZPIxLfYBO3QB1JSPTFp9Z3Yaq9rivxfiUadYq2HKmsZPW2vE4Gtv0I
         P7IBx6zhMlAtelVgvCrg2MM8v28AlLRihOWtt84Uzd44ZEMg6koBsAs6YN3x/rRNUKoF
         u+QeVNhxQkzOGLVtlJBfs+K+H2AfjrO8QLPO5J+WqXBi9mBHAlMJuOvLJxY1NWWpv2yy
         bdbf7iqXqsSV/JxtNqwp2iOALnxUmmTDqGYDqwDrrGlgdyUNlhHTnJXWiP+kPgrvv6Ie
         zVZXUfnTfvr5Iiu/P+qJmxtmRhXvYSobSy0sVLpmPH0j5LF9TpWCuhlNv1S3E58QTL33
         NlSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786143417; x=1786748217;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WWHQrKkplC0WYi76yok/S4SnvzljhW3mlGtup9LzYK0=;
        b=PyiesU2E9jIIKPnwBz7ze1Gj+EsVbh0m42807ZoUAOLQJkbqTb2PeuKG1dZYkBD/Pp
         qC/QSh9Qdvrh/vPERtvvcPL6VwCPHh2r4GjYAOknmzeQCtOqFLYeZKQyYVcRob5hHhIJ
         xiPj8i9WjYv3ZK1jAPW5bvHQwFGN1kp7k91nfQorWRSzxKxFKCs6ZpbTKknYYyHell+o
         Dx9IlQO2Wp8a9GChfPGT+UoBHCdXnqM7U9GPMfHk1HiN9E2bxJ4KvNf+v60u8bRIKLsE
         aQmG9D4XFhNYXc1r1IKNF6v1IITrxFgXvRmBLVnjKUT4VyiDGHEv1T+HPF2oiy4mK2fP
         1D1w==
X-Forwarded-Encrypted: i=1; AHgh+RoxVdVqlkqJp/JTEgojWzmjtYZats6otuAwASd2osh2esNpLlkpuuL62C0Ary4XoZx/ThAp7jRykQNB0g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLoLEPIzAwgXMXLJyoLfbumLBLwX/ChIyOJ53acCS4adonMmiP
	3bUeY1s6o37mu38ZltphjenYS8rdPI89umdezrBfOJ5ADFHyM32MhTlV
X-Gm-Gg: AR+sD10P2j9RXYhG//Gfh7arhYN4KWQzjsRczEPxH0Od9HhFqNOcZTrWiuJCoWhedXv
	pBHESOCUMTqWgTRpbHc6SJm5D5fKSevoD7Iy/cxjHWn8AFDI+u95XMvZJhhHSoEvIMhP8g7tgdS
	/Y6HqgCZgvWgVtueG/ktEY/eM21fDQeSMnhKgI/7YppEDm0olMVCi/f5vYZwilfiNdmM83d68KE
	oZA3ZPDe4K+/9m4C7R3Oxa/wb0l9Q+d/eKiKGEvRBQIZpirgoM53kUBa7abC392m5MlVXLMHhYN
	RUYWPDdlH/sQtnFMBeaAsT0Z5P1Jtm04PRI0luFGyu4Hw4WrT7k233Nlw+ElDA87s6ZiyZAfIBH
	Hjc5Rabfem4ER4U6qQ8Bu4RzKTK38VfJmXssauf6Nv3ESYP0GTFbdogcxcpPHvXAYWEca+HPuIp
	oNHVj6pjOxpyv9YMsYCl/HbRfDiHrgOJGVrfbjvQjVCotOPAgaRSK57Lw06LFAMChU7wJkZCPfr
	sbaMMt1xIecOIsTxkleRM3AdNj0HqQHLUqz0ZFbMcW+toU=
X-Received: by 2002:a05:600c:840f:b0:496:c1f3:e8fb with SMTP id 5b1f17b1804b1-4994e71ffafmr333123705e9.8.1786143417357;
        Fri, 07 Aug 2026 15:56:57 -0700 (PDT)
Received: from Ansuel-XPS. (host-87-19-255-168.retail.telecomitalia.it. [87.19.255.168])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995427a244sm180639745e9.10.2026.08.07.15.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 15:56:56 -0700 (PDT)
Message-ID: <6a7662b8.6220df5f.3c6b34.4460@mx.google.com>
X-Google-Original-Message-ID: <anZitWJCkH5j0Zyg@Ansuel-XPS.>
Date: Sat, 8 Aug 2026 00:56:53 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Darren Ye <darren.ye@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Rosen Penev <rosenp@gmail.com>,
	bui duc phuc <phucduc.bui@gmail.com>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v5 4/4] ASoC: airoha: Add AFE and machine driver for
 Airoha AN7581
References: <20260807200936.201827-1-ansuelsmth@gmail.com>
 <20260807200936.201827-5-ansuelsmth@gmail.com>
 <8146f434-1e16-4ebd-80a4-b9c27bfa45af@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8146f434-1e16-4ebd-80a4-b9c27bfa45af@sirena.org.uk>

On Fri, Aug 07, 2026 at 11:52:58PM +0100, Mark Brown wrote:
> On Fri, Aug 07, 2026 at 10:09:34PM +0200, Christian Marangi wrote:
> > Add support for the Sound system present on Airoha AN7581 SoC. This is
> > based on the mediatek AFE drivers.
> 
> > Also add the machine driver to create an actual sound card for the AFE.
> 
> This should be more patches, the machine driver should be a separate
> patch at a minimum.  Possibly PCM and ETDM drivers too.
> 

Sooo you are suggesting 3 patch? one for machine, one for basic pcm and one
for etdm?

> > +static int an7581_afe_pcm_dev_probe(struct platform_device *pdev)
> > +{
> > +	struct an7581_afe_private *afe_priv;
> > +	struct reset_control *reset;
> > +	struct mtk_base_afe *afe;
> > +	struct device *dev;
> > +	int i, irq_id, ret;
> > +	void *base;
> > +
> > +	afe = devm_kzalloc(&pdev->dev, sizeof(*afe), GFP_KERNEL);
> > +	if (!afe)
> > +		return -ENOMEM;
> 
> We allocate afe here with devm_kzalloc() so everything is zero...
> 
> > +	afe->irqs = devm_kcalloc(dev, afe->irqs_size, sizeof(*afe->irqs),
> > +				 GFP_KERNEL);
> > +	if (!afe->irqs)
> > +		return -ENOMEM;
> 
> ...then we allocate an array using a size read from the struct which must
> therefore have zero elements.  We also didn't assign dev, either we
> should assign it and use it consistently or we should drop it and use
> &pdev->dev like the first allocation.
>

Nono these were just my mistake with moving code... I already fixed them...
sorry for the mistake.
 
> > +	/* register component */
> > +	ret = devm_snd_soc_register_component(&pdev->dev,
> > +					      &mtk_afe_pcm_platform,
> > +					      NULL, 0);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "Cannot register AFE component\n");
> > +
> > +	ret = devm_snd_soc_register_component(afe->dev,
> > +					      &an7581_afe_pcm_dai_component,
> > +					      afe->dai_drivers,
> > +					      afe->num_dai_drivers);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "Cannot register PCM DAI component\n");
> > +
> > +	platform_set_drvdata(pdev, afe);
> 
> The component registration might result in a card being instantiated so
> we need the driver data initialized before we try to register.

Sorry this was asked to be moved in the previous revision by another
review. I will revert following the pattern done in other AFE driver...

-- 
	Ansuel
