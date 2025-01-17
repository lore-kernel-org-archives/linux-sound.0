Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C651FECA6
	for <linux-sound@vger.kernel.org>; Fri, 17 Jan 2025 11:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737114722; cv=none; b=jDkagxpQTaxpllMG3WVpizSjrvZ5LxRob5lmL4MEclGyZZP9MEB04KuIKfftyaqwEafaS7vfa52EeIIY5LUwyJy87DHjmk51Y/2DfSJlot3dyr0pmtCbhQltbvZX0/NmSfyt5/kHDOB/LoX9pqo+4llSEPKI7i39FvCrfO8QWCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737114722; c=relaxed/simple;
	bh=xwCWCIDVfn4ljQgFgns26pvg+plF0yfuzXPTokcNkqY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=YDjf/RvLqmBEg9vqaUtkOpxDW6yXM5twGtfXrqIxmJNdqQE7l8ADv+9rEkv6PspmNN3sAoIylMRFfacKGMwtdgIw2I2dRl2u79BsxvCHhVirkIJCWMPKltOOdhJBWnOKE+GNNswbFJqzMFaVk+Avv8f5wSGZ4r6vmJYR34QMUTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=JwiXnVRM; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="JwiXnVRM"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4361f664af5so21473465e9.1
        for <linux-sound@vger.kernel.org>; Fri, 17 Jan 2025 03:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1737114719; x=1737719519; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=umzbMSBjj46+zs1yQ9Kml6XKWdNkQzuAfOK6WAMVw/Y=;
        b=JwiXnVRMyFBl6Eihpwrr+qUCAhq3cM9QBLGz1Ar4IxTnrwfeMKTyoIbDZTCnSPa1ye
         gNS+89L8yRbPTWMn+80Fc8YJakDfD+sHVYtQyhnVCAxidjq/U6fmDKWfkt1OMtk2Aa7B
         JUfLm+PA7tRjWgCfPvoPB6SQBahns6gUTkCL7OkdAAvJ4MpfrOGz6QKYB8PTe0l1CQK2
         q4Bmd64Q/4wA1njz5tIzPN2XFzj82zk1s5iZ7uhasmTsvj0lCijN+yBWLnOG2AcP+Lq6
         MocgwIC/r2N22tQrQciKvMLmhagssSphX2+GMIqVC1h+sFIAwsJZxRzpmr4rH9Y3Q0H4
         34UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737114719; x=1737719519;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=umzbMSBjj46+zs1yQ9Kml6XKWdNkQzuAfOK6WAMVw/Y=;
        b=lg1HAoP4Kvl/CMvM+EBw4ZclMcbbVEY05+K9j5UtS8sx6n3RdPCnwc2joZKsBjrPoQ
         rQo2iGnYi9CuIMPPvdmia931Ax67rkGvN/LO5oFgDVTmpPWClgKDnjHL6uE0E3m147gj
         Zh58O22e/ODbqgvkli+2VKbW06yF7pXqIIkWmmI0zfCgBJuiaCSPQT78m4c9PxhdpoM9
         XkEJHVjt3Jj3CBByOGHgORQCtEPxEkwvu3fJLuZiDLKVv6Z+ASK37SYrNxvc6uEuXmR+
         z5LFsTf+e5VPmFcNxTbPVQSkwlhVvIg+aPfj7JRxdLXX4IDqcgITd6c6sSPjKjyvn9qK
         2PCg==
X-Forwarded-Encrypted: i=1; AJvYcCWJIWkhe/tUWsdseQjTmV3IbCwSdNCrA9a9Pph8vmPORxF1ApPB1LkVXOaJH/6MmLtyy4S36nXtdbuAqw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl6gTNI1S0XkgzUa47l77vsPgiM1BMw/RDaBb8cLJ4NXVLert3
	4krbsYsEx/w1D8o8VELr2kTMshsfXBFn0honwFjqOMqAm7C4fuiIoUcCz+XoU4w=
X-Gm-Gg: ASbGncvQ3D0dU3E7rpuY1YLgPN/sKDYaAZeRxN3PLThLmiRoRnvHDndf3tT5Go0zfBq
	hiJpXhtOmhz7/qYYE3iujd6dAy/WpbTAgJUSdRvYxiLsOJ8fSRCV791ggyej+xyqaDnOvfJCORI
	FACHTT5wZdUsw5kMwr1QIe411zKVdXTj/WYLuhFL/Fd+Fsff+Aa5Clp89dC+Rgl87Jqeao3sCme
	r6cbOP8Jt6HuhJwkUD9WYl6Y5szu3SzjKXsaUXMY5xBmqC6mcZa40CiVITFppoUdw==
X-Google-Smtp-Source: AGHT+IE4kQUYANidWG36nYutNXYRmfHEWSkKEVnx3dSgIu3dG++0ldqKCDbRAujA8YCCuBSVUPPU4Q==
X-Received: by 2002:a5d:5f56:0:b0:38a:9f47:557b with SMTP id ffacd0b85a97d-38bf57a97bcmr2347139f8f.40.1737114718508;
        Fri, 17 Jan 2025 03:51:58 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf32845e8sm2342552f8f.97.2025.01.17.03.51.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jan 2025 03:51:58 -0800 (PST)
Message-ID: <8ff70298-8a9c-4228-b064-f46ec81f6d15@tuxon.dev>
Date: Fri, 17 Jan 2025 13:51:55 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH] ASoC: renesas: rz-ssi: Clean up on error in probe()
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Biju Das <biju.das.jz@bp.renesas.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <14864a18-c256-4c7d-b064-ba1400bed894@stanley.mountain>
Content-Language: en-US
In-Reply-To: <14864a18-c256-4c7d-b064-ba1400bed894@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Dan,

On 15.01.2025 08:55, Dan Carpenter wrote:
> Call rz_ssi_release_dma_channels() on these error paths to clean up from
> rz_ssi_dma_request().
> 
> Fixes: 26ac471c5354 ("ASoC: sh: rz-ssi: Add SSI DMAC support")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  sound/soc/renesas/rz-ssi.c | 42 ++++++++++++++++++++++++--------------
>  1 file changed, 27 insertions(+), 15 deletions(-)
> 
> diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
> index 3a0af4ca7ab6..4b3016282717 100644
> --- a/sound/soc/renesas/rz-ssi.c
> +++ b/sound/soc/renesas/rz-ssi.c
> @@ -1150,35 +1150,47 @@ static int rz_ssi_probe(struct platform_device *pdev)
>  		ssi->irq_rx = platform_get_irq_byname(pdev, "dma_rx");
>  		if (ssi->irq_tx == -ENXIO && ssi->irq_rx == -ENXIO) {
>  			ssi->irq_rt = platform_get_irq_byname(pdev, "dma_rt");
> -			if (ssi->irq_rt < 0)
> -				return ssi->irq_rt;
> +			if (ssi->irq_rt < 0) {
> +				ret = ssi->irq_rt;
> +				goto err_release_dma_chs;
> +			}
>  
>  			ret = devm_request_irq(dev, ssi->irq_rt,
>  					       &rz_ssi_interrupt, 0,
>  					       dev_name(dev), ssi);
> -			if (ret < 0)
> -				return dev_err_probe(dev, ret,
> -						     "irq request error (dma_rt)\n");
> +			if (ret < 0) {
> +				dev_err_probe(dev, ret,
> +					      "irq request error (dma_rt)\n");
> +				goto err_release_dma_chs;
> +			}
>  		} else {
> -			if (ssi->irq_tx < 0)
> -				return ssi->irq_tx;
> +			if (ssi->irq_tx < 0) {
> +				ret = ssi->irq_tx;
> +				goto err_release_dma_chs;
> +			}
>  
> -			if (ssi->irq_rx < 0)
> -				return ssi->irq_rx;
> +			if (ssi->irq_rx < 0) {
> +				ret = ssi->irq_rx;
> +				goto err_release_dma_chs;
> +			}
>  
>  			ret = devm_request_irq(dev, ssi->irq_tx,
>  					       &rz_ssi_interrupt, 0,
>  					       dev_name(dev), ssi);
> -			if (ret < 0)
> -				return dev_err_probe(dev, ret,
> -						"irq request error (dma_tx)\n");
> +			if (ret < 0) {
> +				dev_err_probe(dev, ret,
> +					      "irq request error (dma_tx)\n");
> +				goto err_release_dma_chs;
> +			}
>  
>  			ret = devm_request_irq(dev, ssi->irq_rx,
>  					       &rz_ssi_interrupt, 0,
>  					       dev_name(dev), ssi);
> -			if (ret < 0)
> -				return dev_err_probe(dev, ret,
> -						"irq request error (dma_rx)\n");
> +			if (ret < 0) {
> +				dev_err_probe(dev, ret,
> +					      "irq request error (dma_rx)\n");
> +				goto err_release_dma_chs;
> +			}
>  		}
>  	}

The code block ending here is entered only if !rz_ssi_is_dma_enabled(). If
that is true there are no DMA channel to be released. Maybe better would be
to move this code block on the failure path of the rz_ssi_dma_request() as
also proposed here:
https://lore.kernel.org/all/CAMuHMdU+_NuLp2FuwwcLfJRe2ssMtp=z7fqcsANgYfFehTNJGg@mail.gmail.com/

Thank you,
Claudiu

>  

