Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FFCB2F12D4
	for <linux-sound@vger.kernel.org>; Wed, 26 Nov 2025 03:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764126456; cv=none; b=cFw+HT2glnDx48mZVwmgSb/fX+yyoVCne0hSyPkPNit+L2bGCkagXIkT5ZTso3KWJaHzJ9bOZ2ruw6hEYuZ4PX09BRrSF5Tf6RURGGNpw9M5UKf9wXRX0RK/BHwkJ4/pk0gwt/7tmpqbIMbKxVzElKnHOUragjivnrBUgay8PTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764126456; c=relaxed/simple;
	bh=QsWe06GBaOUbKyHikmts+/36t/sKn3iT0ivuwiHBG48=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cC4wsuC+AlIRs45RBhuxuUzxMIAVIbiEnxx6KhUaTM3xxQAg1qgGuWQt4J5/guZq/suhFcuvGL8qwRIGr4UwwhqXblnVcO4iMhlQRyl5F2+CehSfuB7R4ovfXTD3LrIExpHz5fyc6UmrDIybrFM+w4W2xmSvGKjksCuOxo+eZ+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hp1k/REC; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hp1k/REC"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2955623e6faso72761985ad.1
        for <linux-sound@vger.kernel.org>; Tue, 25 Nov 2025 19:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764126454; x=1764731254; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eY0pcDERUjgoEEcK9xxbVSj3spxlN7vhGwg4+2FcY/c=;
        b=hp1k/RECEbJCCgs6s1xurIBw017bDAGHSBqtBMlBETgIRABX3xn0AO5ZYsFPSLSOQP
         OHiD/qw1HdCUhwX+7hSag/fiefeb5ivP0azzfWRIL0Iq3rk/oPqwF+lYg7ZvTKgDB+Z2
         MzmpavTP0+LbvrgXHusCCWqSoXsL23aYtsLfx0LqJLNmBWT7OlDekC5N1QERQ4FV/Q4T
         8I6EDN6nyeyubidrw44ZevBvjf/D6iey28yxzFxqS580tAPjAsHWfHz4Cg1//tt/N5Ol
         3/iQ1HEbs/vLv35+8SnYGg+iWVD3N/Km94wYQgzptUiT/CwAzvbz5U0Atl4Ak57/6gHK
         /9ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764126454; x=1764731254;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eY0pcDERUjgoEEcK9xxbVSj3spxlN7vhGwg4+2FcY/c=;
        b=qG7yCdfiw2rnk1kyLbBsdjMeYg8AZ3Duig+5pCS3ibfMqZgbq00HdKFwDJ/ePLD5Vp
         5UoJlH3hYBCfaXlPl7ydwc0nenD6Piegd/PUMeZ1+AWhTbDcQ9r974EPdLa4G2R2Yzdu
         WB+k3ep7IQohaWnOLSZb3mnS/jBFXRhQgeXX6k0C/bT9h7D5vbmBNVa0JPTZ+phEH4no
         VQ0XbqRUzyzwz6wI6KowK3swoThf7wAn4LR8klLIkWEmOJmFN7Tf5anLQcAxwVVCjVIi
         DC7jH8Zdh650RjFNtPYT7CvBSG1TWusp5wdEt/M5TXacuAisR5QcYQTu1OjSZXxcZjwX
         LdQA==
X-Forwarded-Encrypted: i=1; AJvYcCXLLpzbQhSk9vtWCdsK3ItmsK5+SOTa+rcQD32Td898qLDqs4EnoT7rS5BkCv+J82oztBJJLv3u2VBfeA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0ZXC3v46hfQ/a5GBQZzVvIEYu0WItYnEpuNjbJXqObGzxRIWJ
	ew+kQM+scAsMEu+Vqc+szgXAZBdLMdZUS/YWnCoob+WofM99Jf1Unta0f+m1r3c72rCMktXjGgZ
	Ijw812IrQp9b5K2TePOUpk9qHntqUmU8=
X-Gm-Gg: ASbGncsQnhAwK+YqaOwswcPaoK+TygmWkJ+1P2IvZ/3+7WCmVQwxMsOo6NtExYDBWSu
	s3/Cag+ePWw/iS4zKAZAOjwWklNXrBrTBk9e2YHgzNRA7+YCI8FRN360J7kwwU8luee46XlIQz9
	tTdExqQZsqhTLLPvnt5/1UNyTyORguc8Zke+MV2hRkh59+WgrLBlpTlB4BUYyvBWELpGp/SvYSy
	5Y/dCXaw/ibfbH5rMTv0w7qW6CDKY8DLod3lQfNA9xbRws8R6G5z/0rRAt5vg9lEkaa+fY=
X-Google-Smtp-Source: AGHT+IFFg/D2z3lQmIYlqpWgxX94sTlaZ5yd+DZ7R2BIRgEfCPRJzE3/s+/VWYQ3udV/+cdHMX44TwAqzuWNyW/le5E=
X-Received: by 2002:a17:903:2acc:b0:298:33c9:ed9e with SMTP id
 d9443c01a7336-29bab169ab8mr62518365ad.28.1764126453648; Tue, 25 Nov 2025
 19:07:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125101334.1596381-1-alexander.stein@ew.tq-group.com>
In-Reply-To: <20251125101334.1596381-1-alexander.stein@ew.tq-group.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 26 Nov 2025 11:07:20 +0800
X-Gm-Features: AWmQ_blIAktxcZbVljGntxUziif_7LFuT8bNxvakIOqTxB0_4vsIgkUA0aXXSeI
Message-ID: <CAA+D8AOChOYy_OY0er8d+3_XxkzG-fTUonWviF=j=AMyooCPUg@mail.gmail.com>
Subject: Re: [PATCH 1/1] ASoC: fsl_xcvr: use dev_err_probe() replacing
 dev_err() + return
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 25, 2025 at 6:14=E2=80=AFPM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Use dev_err_probe() to simplify the code. This also silences -517 errors.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Reviewed-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
shengjiu wang
> ---
>  sound/soc/fsl/fsl_xcvr.c | 86 ++++++++++++++++------------------------
>  1 file changed, 34 insertions(+), 52 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
> index 5d804860f7d8c..07c9fef45b0f0 100644
> --- a/sound/soc/fsl/fsl_xcvr.c
> +++ b/sound/soc/fsl/fsl_xcvr.c
> @@ -1548,28 +1548,24 @@ static int fsl_xcvr_probe(struct platform_device =
*pdev)
>         xcvr->soc_data =3D of_device_get_match_data(&pdev->dev);
>
>         xcvr->ipg_clk =3D devm_clk_get(dev, "ipg");
> -       if (IS_ERR(xcvr->ipg_clk)) {
> -               dev_err(dev, "failed to get ipg clock\n");
> -               return PTR_ERR(xcvr->ipg_clk);
> -       }
> +       if (IS_ERR(xcvr->ipg_clk))
> +               return dev_err_probe(dev, PTR_ERR(xcvr->ipg_clk),
> +                                    "failed to get ipg clock\n");
>
>         xcvr->phy_clk =3D devm_clk_get(dev, "phy");
> -       if (IS_ERR(xcvr->phy_clk)) {
> -               dev_err(dev, "failed to get phy clock\n");
> -               return PTR_ERR(xcvr->phy_clk);
> -       }
> +       if (IS_ERR(xcvr->phy_clk))
> +               return dev_err_probe(dev, PTR_ERR(xcvr->phy_clk),
> +                                    "failed to get phy clock\n");
>
>         xcvr->spba_clk =3D devm_clk_get(dev, "spba");
> -       if (IS_ERR(xcvr->spba_clk)) {
> -               dev_err(dev, "failed to get spba clock\n");
> -               return PTR_ERR(xcvr->spba_clk);
> -       }
> +       if (IS_ERR(xcvr->spba_clk))
> +               return dev_err_probe(dev, PTR_ERR(xcvr->spba_clk),
> +                                    "failed to get spba clock\n");
>
>         xcvr->pll_ipg_clk =3D devm_clk_get(dev, "pll_ipg");
> -       if (IS_ERR(xcvr->pll_ipg_clk)) {
> -               dev_err(dev, "failed to get pll_ipg clock\n");
> -               return PTR_ERR(xcvr->pll_ipg_clk);
> -       }
> +       if (IS_ERR(xcvr->pll_ipg_clk))
> +               return dev_err_probe(dev, PTR_ERR(xcvr->pll_ipg_clk),
> +                                    "failed to get pll_ipg clock\n");
>
>         fsl_asoc_get_pll_clocks(dev, &xcvr->pll8k_clk,
>                                 &xcvr->pll11k_clk);
> @@ -1593,51 +1589,42 @@ static int fsl_xcvr_probe(struct platform_device =
*pdev)
>
>         xcvr->regmap =3D devm_regmap_init_mmio_clk(dev, NULL, regs,
>                                                  &fsl_xcvr_regmap_cfg);
> -       if (IS_ERR(xcvr->regmap)) {
> -               dev_err(dev, "failed to init XCVR regmap: %ld\n",
> -                       PTR_ERR(xcvr->regmap));
> -               return PTR_ERR(xcvr->regmap);
> -       }
> +       if (IS_ERR(xcvr->regmap))
> +               return dev_err_probe(dev, PTR_ERR(xcvr->regmap), "failed =
to init XCVR regmap\n");
>
>         if (xcvr->soc_data->use_phy) {
>                 xcvr->regmap_phy =3D devm_regmap_init(dev, NULL, xcvr,
>                                                     &fsl_xcvr_regmap_phy_=
cfg);
> -               if (IS_ERR(xcvr->regmap_phy)) {
> -                       dev_err(dev, "failed to init XCVR PHY regmap: %ld=
\n",
> -                               PTR_ERR(xcvr->regmap_phy));
> -                       return PTR_ERR(xcvr->regmap_phy);
> -               }
> +               if (IS_ERR(xcvr->regmap_phy))
> +                       return dev_err_probe(dev, PTR_ERR(xcvr->regmap_ph=
y),
> +                                            "failed to init XCVR PHY reg=
map\n");
>
>                 switch (xcvr->soc_data->pll_ver) {
>                 case PLL_MX8MP:
>                         xcvr->regmap_pll =3D devm_regmap_init(dev, NULL, =
xcvr,
>                                                             &fsl_xcvr_reg=
map_pllv0_cfg);
> -                       if (IS_ERR(xcvr->regmap_pll)) {
> -                               dev_err(dev, "failed to init XCVR PLL reg=
map: %ld\n",
> -                                       PTR_ERR(xcvr->regmap_pll));
> -                               return PTR_ERR(xcvr->regmap_pll);
> -                       }
> +                       if (IS_ERR(xcvr->regmap_pll))
> +                               return dev_err_probe(dev, PTR_ERR(xcvr->r=
egmap_pll),
> +                                                    "failed to init XCVR=
 PLL regmap\n");
>                         break;
>                 case PLL_MX95:
>                         xcvr->regmap_pll =3D devm_regmap_init(dev, NULL, =
xcvr,
>                                                             &fsl_xcvr_reg=
map_pllv1_cfg);
> -                       if (IS_ERR(xcvr->regmap_pll)) {
> -                               dev_err(dev, "failed to init XCVR PLL reg=
map: %ld\n",
> -                                       PTR_ERR(xcvr->regmap_pll));
> -                               return PTR_ERR(xcvr->regmap_pll);
> -                       }
> +                       if (IS_ERR(xcvr->regmap_pll))
> +                               return dev_err_probe(dev, PTR_ERR(xcvr->r=
egmap_pll),
> +                                                    "failed to init XCVR=
 PLL regmap\n");
>                         break;
>                 default:
> -                       dev_err(dev, "Error for PLL version %d\n", xcvr->=
soc_data->pll_ver);
> -                       return -EINVAL;
> +                       return dev_err_probe(dev, -EINVAL,
> +                                            "Error for PLL version %d\n"=
,
> +                                            xcvr->soc_data->pll_ver);
>                 }
>         }
>
>         xcvr->reset =3D devm_reset_control_get_optional_exclusive(dev, NU=
LL);
> -       if (IS_ERR(xcvr->reset)) {
> -               dev_err(dev, "failed to get XCVR reset control\n");
> -               return PTR_ERR(xcvr->reset);
> -       }
> +       if (IS_ERR(xcvr->reset))
> +               return dev_err_probe(dev, PTR_ERR(xcvr->reset),
> +                                    "failed to get XCVR reset control\n"=
);
>
>         /* get IRQs */
>         irq =3D platform_get_irq(pdev, 0);
> @@ -1645,17 +1632,13 @@ static int fsl_xcvr_probe(struct platform_device =
*pdev)
>                 return irq;
>
>         ret =3D devm_request_irq(dev, irq, irq0_isr, 0, pdev->name, xcvr)=
;
> -       if (ret) {
> -               dev_err(dev, "failed to claim IRQ0: %i\n", ret);
> -               return ret;
> -       }
> +       if (ret)
> +               return dev_err_probe(dev, ret, "failed to claim IRQ0\n");
>
>         rx_res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "rx=
fifo");
>         tx_res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "tx=
fifo");
> -       if (!rx_res || !tx_res) {
> -               dev_err(dev, "could not find rxfifo or txfifo resource\n"=
);
> -               return -EINVAL;
> -       }
> +       if (!rx_res || !tx_res)
> +               return dev_err_probe(dev, -EINVAL, "could not find rxfifo=
 or txfifo resource\n");
>         xcvr->dma_prms_rx.chan_name =3D "rx";
>         xcvr->dma_prms_tx.chan_name =3D "tx";
>         xcvr->dma_prms_rx.addr =3D rx_res->start;
> @@ -1678,8 +1661,7 @@ static int fsl_xcvr_probe(struct platform_device *p=
dev)
>         ret =3D devm_snd_dmaengine_pcm_register(dev, NULL, 0);
>         if (ret) {
>                 pm_runtime_disable(dev);
> -               dev_err(dev, "failed to pcm register\n");
> -               return ret;
> +               return dev_err_probe(dev, ret, "failed to pcm register\n"=
);
>         }
>
>         ret =3D devm_snd_soc_register_component(dev, &fsl_xcvr_comp,
> --
> 2.43.0
>
