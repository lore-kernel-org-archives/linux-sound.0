Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F828494
	for <linux-sound@vger.kernel.org>; Wed, 11 Sep 2024 07:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726040227; cv=none; b=tDqkk1q06jzketFTg6CmIbz4Am+zvM5u/lNuMeMffT+xtkKSmBUWpkvTbZH4O6I5fx3disW9GsKMQMG2InI9mitPzVfaI5WBI6e7zbqDcQ1rFxHx13wqlEjxk09V30VwYRdNnWyXiYXeE8jF90gQhilGolCqSxH2Bye8gsBlMZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726040227; c=relaxed/simple;
	bh=Cbv68Bb1aUEULz2VgTK4zgraa/cfHVp/jHhFAJ4Kcwo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BUhpFqmXLVJMMSnczHkffPta6iHWd/hh+gSnD0E0eCz4QUfxH3NxLZS92lN2xHNuDTXu4vMxs7/8SPfs+NOTSG9XCekL/6HWtRN6SCF0SaFN9/i/yqCvmGYmr1uh+r5LARVB/Gw5Y4emen/3bxsDQUjcFd/pIcwwOl2IWR4bm8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hNPZ/OrH; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hNPZ/OrH"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4280ca0791bso60095645e9.1
        for <linux-sound@vger.kernel.org>; Wed, 11 Sep 2024 00:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726040224; x=1726645024; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sPAIeHqH94LHrW9+Y+CLBWKJXSXUEXjJ8Ef+H1QOZx0=;
        b=hNPZ/OrHrJNStBT0gzPXq20dHY8QF37L9GmIV3/sNaLnmYXFKzdXnnb+jk1CH3qZKb
         b4AVq0lKnnnyJRiHo9/H1DDkU1XLBCC0+qPBJR66BTrRbBW1gCK8sEUtWS0wnPGEVhlY
         qWPS0/HzQi3cp7ESLD0xNIyFuFG8BPDvgTc8g8EAY8RvTMsCZM9Q0siXcOkDciO7KRoR
         VwnKoBnSU+YbMe/UCjY+/c7dxIDY6Rjbl7W/CV9Sm6fWGw7K1qbe9m4hYAN7QHdL0tTM
         xlQMcLL7JSaVFu4ZoUE9KL47u6CYcHLnuqLTNU+wUh6gTZZIAXtwZGWsDOq+ffrz9OVi
         cUrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726040224; x=1726645024;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sPAIeHqH94LHrW9+Y+CLBWKJXSXUEXjJ8Ef+H1QOZx0=;
        b=sSEBJngrq4jn9T9ymc5zHXqmWIvlNKnc0PKOn29mk2EkoRou9SImHkl8/X6OWnR1bn
         gLP0QW51sbxrhatokbAsj24exguLetcuOlH9wrRX3yH/QjUlzVUI0z1NWwxAtMSDpeYy
         Fa0cjeepNwW/izxLtX+bCZ72z9qr0BbWQWDVg6hrbTBzB6r+ncZo4B/LLJQtySo9tHDU
         ahd0tEgqn32OgV3MMBNePutVHf3ud3rpeH8EHgg3rtRlZeOy68VtXGZ+2XYCzKAQN8Sv
         5fyuLdWi/zb9vMLsZqARZ8BqG53/QAGUrnQONb1OCph7NS1Q9fogc/sDCBvcGVKOqmyX
         WVKg==
X-Gm-Message-State: AOJu0Yzf9WSmnkkfud4xleCnbPP6+NuncJko3BriUTy2eripEgR+4QM8
	CspJqB3nZSBJq+lteEo1etX70wcuGRXGyudsWNFjbKU2Ma8aTr3W3I3DBReeA/w=
X-Google-Smtp-Source: AGHT+IGQvJrQ1mJ8l+9Sf+siG13aMY4P7H0tJZJfATJqKRvr0QbuvMXWZ0ihbTVFWPxwIspNgmQCfQ==
X-Received: by 2002:a05:600c:1e04:b0:42c:b8da:c791 with SMTP id 5b1f17b1804b1-42cb8daca53mr74199595e9.1.1726040224005;
        Wed, 11 Sep 2024 00:37:04 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42cc1374f61sm31975895e9.1.2024.09.11.00.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 00:37:03 -0700 (PDT)
Date: Wed, 11 Sep 2024 10:37:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Yingkun Meng <mengyingkun@loongson.cn>
Cc: linux-sound@vger.kernel.org
Subject: [bug report] ASoC: Add support for Loongson I2S controller
Message-ID: <d0b41d6d-86ae-43fe-b505-097f9f43e11f@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Yingkun Meng,

Commit d84881e06836 ("ASoC: Add support for Loongson I2S controller")
from Jun 15, 2023 (linux-next), leads to the following Smatch static
checker warning:

	sound/soc/loongson/loongson_i2s_pci.c:131 loongson_i2s_pci_probe()
	error: 'i2s->regmap' dereferencing possible ERR_PTR()

sound/soc/loongson/loongson_i2s_pci.c
    73 static int loongson_i2s_pci_probe(struct pci_dev *pdev,
    74                                   const struct pci_device_id *pid)
    75 {
    76         const struct fwnode_handle *fwnode = pdev->dev.fwnode;
    77         struct loongson_dma_data *tx_data, *rx_data;
    78         struct device *dev = &pdev->dev;
    79         struct loongson_i2s *i2s;
    80         int ret;
    81 
    82         if (pcim_enable_device(pdev)) {
    83                 dev_err(dev, "pci_enable_device failed\n");
    84                 return -ENODEV;
    85         }
    86 
    87         i2s = devm_kzalloc(dev, sizeof(*i2s), GFP_KERNEL);
    88         if (!i2s)
    89                 return -ENOMEM;
    90 
    91         i2s->rev_id = pdev->revision;
    92         i2s->dev = dev;
    93         pci_set_drvdata(pdev, i2s);
    94 
    95         ret = pcim_iomap_regions(pdev, 1 << 0, dev_name(dev));
    96         if (ret < 0) {
    97                 dev_err(dev, "iomap_regions failed\n");
    98                 return ret;
    99         }
    100 
    101         i2s->reg_base = pcim_iomap_table(pdev)[0];
    102         i2s->regmap = devm_regmap_init_mmio(dev, i2s->reg_base,
    103                                             &loongson_i2s_regmap_config);
    104         if (IS_ERR(i2s->regmap))
    105                 dev_err_probe(dev, PTR_ERR(i2s->regmap), "regmap_init_mmio failed\n");

return dev_err_probe()?

    106 
    107         tx_data = &i2s->tx_dma_data;
    108         rx_data = &i2s->rx_dma_data;
    109 
    110         tx_data->dev_addr = pci_resource_start(pdev, 0) + LS_I2S_TX_DATA;
    111         tx_data->order_addr = i2s->reg_base + LS_I2S_TX_ORDER;
    112 
    113         rx_data->dev_addr = pci_resource_start(pdev, 0) + LS_I2S_RX_DATA;
    114         rx_data->order_addr = i2s->reg_base + LS_I2S_RX_ORDER;
    115 
    116         tx_data->irq = fwnode_irq_get_byname(fwnode, "tx");
    117         if (tx_data->irq < 0)
    118                 dev_err_probe(dev, tx_data->irq, "dma tx irq invalid\n");
    119 
    120         rx_data->irq = fwnode_irq_get_byname(fwnode, "rx");
    121         if (rx_data->irq < 0)
    122                 dev_err_probe(dev, rx_data->irq, "dma rx irq invalid\n");
    123 
    124         ret = device_property_read_u32(dev, "clock-frequency", &i2s->clk_rate);
    125         if (ret)
    126                 dev_err_probe(dev, ret, "clock-frequency property invalid\n");
    127 
    128         dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
    129 
    130         if (i2s->rev_id == 1) {
--> 131                 regmap_write(i2s->regmap, LS_I2S_CTRL, I2S_CTRL_RESET);
                                     ^^^^^^^^^^^^

    132                 udelay(200);
    133         }
    134 
    135         ret = devm_snd_soc_register_component(dev, &loongson_i2s_component,
    136                                               &loongson_i2s_dai, 1);
    137         if (ret)
    138                 dev_err_probe(dev, ret, "register DAI failed\n");

Same.  Seems like a missing return statement.

    139 
    140         return 0;
    141 }

regards,
dan carpenter
