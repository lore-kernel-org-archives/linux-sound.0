Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3461D63F3
	for <linux-sound@vger.kernel.org>; Mon, 20 Apr 2026 12:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776688395; cv=none; b=HyNlocYieOhhFnNKjiRSTt4o+7rA2odnPJ1adR3s1k1qs7LdoJmjd7z32y46QQteljD7ZqhArBlNvV2tQfNI0l7RXUYsIM7lFaKpLRlF4FOiF5o6DZN1L9iTy/kV8qvNxEk+PKE3XrmajmfYTHXx6HKML/vzt7MJW/hpqO7Ow/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776688395; c=relaxed/simple;
	bh=ouN2T9zodtnGRFKEDJT3a7cOKWhNDFwWELKSz0rhc0w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n8QlzDCyjrx1zkwLhNW+5snt3qSzr/E6/S3dDOMIfxySiMUDLV3jrMQ4W4QmzpXleQfQcrNalNyJXqSLBvK+Xkcdewe7YMMDyu/sz3l8JbRY90EgJKn5g7p0/u1P0Y8i4ZXc0/SH7jrpX8ocJ0nG+AzK9DgkVSZxH50RMrZVc+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=M1N0OqMk; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="M1N0OqMk"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488d2079582so35079285e9.2
        for <linux-sound@vger.kernel.org>; Mon, 20 Apr 2026 05:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1776688391; x=1777293191; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vywUgRyvHiyb8Tcpyclkx71VYCcveacoMI82OHms9l8=;
        b=M1N0OqMk+uWjKQRIYI0OyaTX1K8F2HmFCZf0WT5zTHMJ9P4bOboGbYPJWlDshk26Aw
         s+F90I7mPz/s4+9m0EUo+2xz3iUHpFmVr2aim/zzgQl8qZCH3sV5IKBJzcChN9Hrj3Or
         sSwLuXJ2CarFRej+ezqVLRYDii8q9XfnKpFC7s5ejsqwwplFODD86mgY7jHoRIQ1eJmC
         P8tlxFSaoeyb0aK+5Ifl5uzyW9TN++KrwaXU2qgkRKjIKuQNeCjz6UKOv3CWnnKR7jtF
         F08kVcN87RJU5ensJMu12/D/krZQqcAgSgBGjLk5hrf41gfvAQ8EQY3emDgOjlI5OD34
         NbVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776688391; x=1777293191;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vywUgRyvHiyb8Tcpyclkx71VYCcveacoMI82OHms9l8=;
        b=B2EfppoEWsz6TYDrnQnR6Mbmx8c4fcRTI0ZMHVSxYP8Bp/Eo/DwPHxzRvjxHCk9MCN
         i5eYAYCNDYltM4Ga/DM9GhbXmVwNp/y07jDJAuf3kZu3tb9xVXGATcO9vqkv+E0Gc2bT
         M+0jLxu3xi4xKsbkGpEtkOc6Eor0PpYyPZd2RiMtSQWepONhOJvxG9yIASBPbTGZTmNs
         eXqftsXP1OeUCK20aoSBLgPcZEoqKtDXAQ3pMYjR5a+EaJmlCDq0XwJlWISb+6rVv+3y
         M9rgybPj2/JfOPmilhlfaSfF6g4tKInJgZ37ZsmFlF/lgDEypIMEXBrpRr9G2bFS8A1f
         LvPw==
X-Forwarded-Encrypted: i=1; AFNElJ/yBM3xkxBLGve+XAn+OaBlEU7odeMpl47KMkKY/OGvck72hloksUGLdDR+e1SwfS5If1MEYh0tyPEfng==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf0JxskeZQu3g4hcZOuIV4qn4l/y+OChH4NHf1XNKsKJMk6UE/
	mEG2Hf56SlcR7Q/LV263ryBBB4HDL0X+wzTclLcp3cEJucm6fnIRCYsmGDJz8hWpl3w=
X-Gm-Gg: AeBDiesvCJ0F/CSbGerrHwToVENoKT1B5uSVs3WnqYEv0flMnIissK9hpH4BGJgE2d9
	ZvA1w3AFgXDBu6JuTVbUZN4wWNlGcreQm7GdnedHKGXF/IkwfyuDnXR02ubsv6oV7FdAQIZ052x
	lKfm6L4oFnnrKEqusbVWguh5XJt7DwPL2DqsCiboMcBv8sGFJ5nXu3vswRnoQbjIdFv+A74dKGe
	BkpQt54/2hVYRbSqc3xAvKPTW+FICEvl0qMTIIna23dSdljHJ1sQRf3heGvh9wECQA25a8i9cmM
	RJIGwWsKY01e5uF2o37klnDq36JuHLvR0c2DXrA71ix8rUWAaaGD3Qr8mpZ+MU2LHEFRCVbu7OO
	ySP/A1YxApwMy0LoyFe4nPTc51vm9evvkOfg3ZLJSNFttf+mb3e00GtMlsvf9aoC1JRxvXJWefz
	/TSr0fE6RNebGyGmMMoLs59XucaN39nMlCXP+6UbmJNA==
X-Received: by 2002:a05:600c:8582:b0:486:fab9:a578 with SMTP id 5b1f17b1804b1-488fb7556b9mr147084635e9.11.1776688391119;
        Mon, 20 Apr 2026 05:33:11 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a52583fe7sm19933615e9.13.2026.04.20.05.33.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 05:33:10 -0700 (PDT)
Message-ID: <631893a8-d5de-49f8-9d7b-a20db4a8ed08@tuxon.dev>
Date: Mon, 20 Apr 2026 15:33:09 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: sashiko.dev review (Re: [PATCH v4 01/17] dmaengine: sh: rz-dmac: Move
 interrupt request after everything is set up)
To: vkoul@kernel.org, Frank.Li@kernel.org, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 p.zabel@pengutronix.de, geert+renesas@glider.be,
 fabrizio.castro.jz@renesas.com, long.luu.ur@renesas.com
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, stable@vger.kernel.org
References: <20260411114303.2814115-1-claudiu.beznea.uj@bp.renesas.com>
 <20260411114303.2814115-2-claudiu.beznea.uj@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260411114303.2814115-2-claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

 > commit b3dfdd5fbd2463db407b1396ee1ae79801cb96bf
 > Author: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
 > dmaengine: sh: rz-dmac: Move interrupt request after everything is set up
 > This patch moves the channel interrupt request to the end of the channel
 > probe function to prevent the IRQ handler from accessing uninitialized
 > data. It also replaces dma_alloc_coherent() with dmam_alloc_coherent()
 > to simplify the error path.
 > > diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
 > > index 625ff29024de0..9f206a33dcc6b 100644
 > > --- a/drivers/dma/sh/rz-dmac.c
 > > +++ b/drivers/dma/sh/rz-dmac.c
 > [ ... ]
 > > @@ -1210,16 +1207,6 @@ static int rz_dmac_probe(struct platform_device *pdev)
 > >  dma_register_err:
 > >     of_dma_controller_free(pdev->dev.of_node);
 > >  err:
 > > -   channel_num = i ? i - 1 : 0;
 > > -   for (i = 0; i < channel_num; i++) {
 > > -           struct rz_dmac_chan *channel = &dmac->channels[i];
 > > -
 > > -           dma_free_coherent(&pdev->dev,
 > > -                             sizeof(struct rz_lmdesc) * DMAC_NR_LMDESC,
 > > -                             channel->lmdesc.base,
 > > -                             channel->lmdesc.base_dma);
 > > -   }
 > > -
 > >     reset_control_assert(dmac->rstc);
 > >  err_pm_runtime_put:
 > >     pm_runtime_put(&pdev->dev);
 > > @@ -1232,18 +1219,9 @@ static int rz_dmac_probe(struct platform_device *pdev)
 > >  static void rz_dmac_remove(struct platform_device *pdev)
 > >  {
 > >     struct rz_dmac *dmac = platform_get_drvdata(pdev);
 > > -   unsigned int i;
 > >
 > >     dma_async_device_unregister(&dmac->engine);
 > >     of_dma_controller_free(pdev->dev.of_node);
 > > -   for (i = 0; i < dmac->n_channels; i++) {
 > > -           struct rz_dmac_chan *channel = &dmac->channels[i];
 > > -
 > > -           dma_free_coherent(&pdev->dev,
 > > -                             sizeof(struct rz_lmdesc) * DMAC_NR_LMDESC,
 > > -                             channel->lmdesc.base,
 > > -                             channel->lmdesc.base_dma);
 > > -   }
 > >     reset_control_assert(dmac->rstc);
 > >     pm_runtime_put(&pdev->dev);
 > >     pm_runtime_disable(&pdev->dev);
 > >  }
 > While this patch fixes the initialization races, does it leave a similar
 > vulnerability exposed during teardown?
 > Since devm_request_threaded_irq() is used to allocate the interrupts, they
 > will remain active until after rz_dmac_remove() and the rz_dmac_probe() error
 > paths complete.
 > If an interrupt fires during or just after rz_dmac_remove(), could the handler
 > attempt to access hardware registers while the device is in reset or powered
 > down by pm_runtime_put()?
 > Would it be safer to explicitly free or disable the IRQs before asserting the
 > hardware reset and disabling runtime PM, or perhaps manage the reset and PM
 > states via devm actions to guarantee correct teardown ordering?

On either failure or remove path the device is with runtime PM put (clocks being 
disabled) and in reset state. The controller cannot generate interrupts from 
this state.

However, to keep this series simple, I'll add this in a cleanup patch after the 
current series will be merged.

