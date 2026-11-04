Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793786948;
	b=l/h35X3/emyIFFT2/sCfPN9lrM+nX+Qy3B2Z5q+LBRW4mL++DztvckjPaCkWuJbORuNp
	 e/hIhyy9jFHbmBrKZyWLLuNEmBvNc0czaD4IH3iTdoyErV2KHSK3XSaSAEhdqLOF8y4b6
	 8CyC6Jqufx9VFvPsaLjZD2FpdOZmrfnXsYK3Q6kCoxZ+q4uZ84FvGq/VA6pLYchfnImDD
	 Mg86xIhKtLq27vOuzD+sD97KR4anIPJrAHsPC/ZgckpBkrv0Hto3XG6YxZjAv5rhojmWB
	 BUUZ4zCo4qCSw1U6daJWnnwJGMbIJYH0+TCA+k25QMzJWyBcCEZsLQahgw6P3yMmVgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793786948;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=9m08hNGJrQqFFcpwSUCA13zd6OgCwpmeyEz6J70Gtdw=;
	b=DWQSkgWgVtcv+075kRUNPW3t1Lmeak5Q+wehzbvzuivI+qkYKCcRL3mk+qA6BTCUaF1V
	 VUplYcBQ4hAOS8thcfMrzw461vDCM1wZ2pyD7uQQsG8ZIGEQLhWHKSW3FD8w3D+URjbo8
	 A4M2GCjrxm11eyDYTOg1zkiFKJBijVlW1e4K0Xwx68yLWEFEUvahS3oOAgrGVEkXSz7x7
	 TftMspkvNATAXyLPj/1EYayX/5ovpSbWoSUntaKK+J8voK7F+bM4vwm4bBmcduXQwtxtX
	 LAVOrsJT4fWUXbFlnyDu+ooGCn6OW5tvouIYKBOuCy/C2nJk4UowlFhxIDZi5w29BKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=VwZ5Mbh+;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626DD606A31B
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 10:09:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 626DD606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=VwZ5Mbh+
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4b4571ff080so5065645e9.1
        for <linux-sound@vger.kernel.org>; Wed, 04 Nov 2026 02:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793786946; x=1794391746; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9m08hNGJrQqFFcpwSUCA13zd6OgCwpmeyEz6J70Gtdw=;
        b=VwZ5Mbh+ywijxBhVZmyTnwSlJZ8E8ouK9Zpt/YFTmER4ypZnCuAXHG8QiBivbEFTcj
         4P2r3GgV9uIOj+boR0DdDTSHFiUgJWXMQcAKnT5XUBw5AO/K/ruuqKDZbsckTeFeFEEZ
         JA4tg54Un4JZF9sxYFMRbtSE7KnTovkc4/I0wCIG9L34qF5Kc+uJS+xUnJ6zwUSXvGRm
         p+T+NR7qdCkhS9yL21f7xga/TpnTo9M3mgRm2qL3aDy+9+BhRCCARSqvmRziGoB6a+vR
         Xr4eVnjkurCHEGscu4Rtd3+ZIvMwKQUyenEPQfDPx9tr1XEBn6rP5T8CItFnEWqgdoQu
         hx4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793786946; x=1794391746;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9m08hNGJrQqFFcpwSUCA13zd6OgCwpmeyEz6J70Gtdw=;
        b=kjpjFWyBm701Q5tEZJ5EdjxwJJQtAOXTlkkkR1IyQ2YXiCarR5dERQ6uNMZrDwjCDD
         FZxkrUoaREuAzFy4fX08kJ0Yr6K4FAo9uR9L2fQGRPATn/Oesbe8UlP+9NKNNrBsw6X/
         aGbYRwoz1a+sQM5v+qeSTnZz3vkyC1TTH83F7otWWbu+H4DuBO71a/tLbREQDiiN2vXp
         yksM9ttrLrjAyfE63UFIbA91BAt9fmClqAiuiEBL55sjtMBh9n7zEF9phL/24qsq2QGi
         tYRLiztfp5XrapdNWRx4QOSXBdo7o9CacnmozS1oOpS4alvCKV/8t401Cb1vr/u3QRVY
         miPw==
X-Forwarded-Encrypted: i=1; AKwUvBwWAkKHvBFRu9TTa/L/eSm76aCTxBazM1OdqBi/WHIaYpgdIVe19u7tL5QcNty3C7javUsXdVIXtGWQHA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZGsrU/kq6x60PipJwCp39xL+HImojwuDzTscgsu/6qHACf8T5
	OT8aIFrdrEXd1OasOXC3MxRq55pZd2QHsqMBu1CwWJNkaxV3QUu5FQq5c8G6dFOQy0Q=
X-Gm-Gg: AYBFou1T5uEEIPWUxXr+W2fDWKdBAZQUxu+LCssIYI5EnTGl/WhJnToE66hWPxL2grW
	pdktpEc01l9pLkVRjHhMofoCg8jFRtifuD5LhfE8Si9Y1xjznXKt2p6FnFFA1U9D74PeUCaOkXm
	LrreEwhB5++anaSIzNoLYisUTk/apBH8KuJJx9jztwtDJ8yMVqq9Zajcxlk0lL8zDJf9PemqCBh
	6rlmO7P3zUl4YdZQQUGy3hBOlpGdmpquCLi/UX1JiSehjVzQQEwDFa/zQn2Hn8AFK9jLLW7+Uf0
	3J4V1F7trsl1C3yiv8O0Yh2Jz+IVfM5cvbG5+rOCqskXoN0+OSEXoSyeD76MOt7IfDqoVvr4glC
	fckFNOgurcQEzQI8uzrhAp57x4s6SOtHAukT9RJiH6Uwm9dM+4ENkBsWCWpfOIzTuqACXIM531f
	R7M0cpJeq47fDeT4MdMPK69uwtOZ5rvG2lWDcbIFL42Jas+aVM8vwThAZOli5sUcVsO+3+CPQSY
	FMQwVaQBf7I6CK8UnreJws5XPCJuaEPUaZTTMlZ4cPnyITyrdjtPlvjFqcJaVSEaihTMFEmrOiJ
	thfCNbbRO2XZ2135qh2lV3PNqfQ=
X-Received: by 2002:a05:600c:c48e:b0:4a3:2f35:38b4 with SMTP id 5b1f17b1804b1-4ac16bc4829mr363600885e9.10.1793786945653;
        Wed, 04 Nov 2026 02:09:05 -0800 (PST)
Received: from [127.0.1.1] ([151.61.248.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4134ff2a3sm39589745e9.2.2026.11.04.02.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 02:09:05 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] ASoC: fsl: imx-sgtl5000: drop codec device reference
 after probe
From: Valerio Setti <vsetti@baylibre.com>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20261104022815.1484320-1-vulab@iscas.ac.cn>
References: <20261104022815.1484320-1-vulab@iscas.ac.cn>
Date: Wed, 04 Nov 2026 11:08:52 +0100
Message-Id: <179378693284.334584.13927162303295738761.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1026; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=wL/4+5mCyg+xHnS2SrTRtqVLLJgE36IXiOGlWrvNvw8=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFmvWWy2cK3/fMdg3YIfc7e99+hZeW+t+as5t+fmfrjrt
 Ufc7vq2Ix2lLAxiXAyyYoosLNPv/S4oVXtonHCyAGYOKxPIEAYuTgGYyMp4RoYVm6M7BY1U7+87
 E29+9dDXyEd5h26eMPjcvrpz48t1a3/OYGTY5KYQV1DCM2NZXKFpseyp2lsnU37m7v729NqmlOU
 qU1UZAQ==
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

> imx_sgtl5000_probe() takes a reference on the codec i2c device, but the
> successful probe path returns without releasing it. Only the error
> paths drop the reference, so every successful probe leaks the i2c
> client device.
> 
> Release the reference once the card has been registered.
> 
> Fixes: 81e8e4926167 ("ASoC: fsl: add sgtl5000 clock support for imx-sgtl5000")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
>
> diff --git a/sound/soc/fsl/imx-sgtl5000.c b/sound/soc/fsl/imx-sgtl5000.c
> index 8bcf54ef709e..8ce333eb47fe 100644
> --- a/sound/soc/fsl/imx-sgtl5000.c
> +++ b/sound/soc/fsl/imx-sgtl5000.c
> @@ -177,6 +177,8 @@ static int imx_sgtl5000_probe(struct platform_device *pdev)
>  		goto put_device;
>  	}
>  
> +	put_device(&codec_dev->dev);
> +
>  	of_node_put(ssi_np);
>  	of_node_put(codec_np);
>  

Reviewed-by: Valerio Setti <vsetti@baylibre.com>

-- 
Valerio Setti <vsetti@baylibre.com>
