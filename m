Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793861352;
	b=leFvv3pMRF1FYG4qFxcvF92xf0RFF1pXy6dfbcjRxYz7TpdBxvv5dI0WEPL4j1hpZvCP
	 svmuqCbPOt/M14hjMJ13ukLnbd73kqAINMa0J0jzhW9l533Fg3nVe4yP2KEWqkit95KpK
	 +tvpZ0G+bPVrkqnfTW8j6GrngYwaCBmTWHiK9vWKqEgoIvKYvQ2sANrokvSzYd+JUqsKG
	 aWZGB67OFFF2JEVCuK+uvhuSG5CdMgKp3mOF6boZBnCUEzCN+CkWZ5ot3atg1jEfb91J5
	 wU8SjKl/iCKSYKw1x+96J5PzcAshJ65xBYbMEl58yEWDx56qHGxJsutIPS7AtQmHweQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793861352;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dqJik3giojyQdxTVlYt/SVYHbelelREmDC0vou6fiGs=;
	b=BnRC3m/nt0CocxYcQP67piDaIby+WMkNjQO3WFhKWoawBYf8rQb8rU93zm96o9ewwC/e
	 A1k/4v3JZ/faMpmAMAkmX0ik0YY0yOKedpJT5fsoZrPTCJp+Hf70+s2mUwZYpjyhgUurr
	 u+We75R51BIVIHo+ZJVie6k2g8ihmUoSJbEOy5p7eTtH6C3xt75835r4PYVTeaeTHQXWQ
	 2o4cquYvmgt0LjLZA/nOUhwCw/SOl17+JsfmpA5be7/bxJvJiV1HM+S1q3jLkoMZhxhUW
	 9IoBLuFte0FL4WCYthERm4VepjYndzmNYz6PXcoBEsrAlkO9bkEsw6DKhDmSN2fAmiw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d00ACOtS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F154606A32C
	for <linux-sound@vger.kernel.org>; Thu,  5 Nov 2026 06:49:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F154606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d00ACOtS
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso193459a91.0
        for <linux-sound@vger.kernel.org>; Wed, 04 Nov 2026 22:49:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793861352; cv=none;
        d=google.com; s=arc-20260327;
        b=ZkekYFDSZvQdaie7OIp76C8vKm729rA3xiHjbzf3M1bTQU91PV5Qsg1kp/Op1AEL8n
         99eJ0GPJ7rNJOYK3NlU2IB1SaH5YtGHR0Izb525ddQSllWTGgLZYVt2g3/IDTmUFhsKt
         pa7JFC1LI4jujlVujUHbkJQyBAVYawTKz2ClTpu2SphFe0sQpAFBviRDn3qb8yJfgCnO
         LS4K8nivtd+u4DVPPI9fnYM7S0Dn/TPy8mhpt8CeAcFGciVgZLbykBi/IwaZp+ObS4vg
         8hnFvbJZkdPi5/t5hW9kJZeCSVH2Qmst4xFDRAuAQgeW8WXODl6H9x1z9uRU5ybx3YCB
         bVzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dqJik3giojyQdxTVlYt/SVYHbelelREmDC0vou6fiGs=;
        fh=gGgD206+TU4rJNgukVtNu7SpIb9OlPEMI7xwSgWrhII=;
        b=quaUWiLq9kwcX1TYr8V+A/WDQHoC+LeqLE54DBJhlLPDgJ+geufYnqwY/HD4YcBs93
         ZE4qkep6sbC64l+V3I/ekD8q9ARl2NQ9e/Zsc9vSZIYd4QPlYrAPMllhdGKJYBOHwdvz
         kKPEOybkYJp828Z6C6EHYmdjkYTbsJZHWceltU0xv4+X1rhB3LF7vpAR38Nr7ZZgD3ds
         1VKvgPXckQv1iDJcdB8TnkHs+HQ4sLTujXdug8B28sMcMXJ/QstyMVcoEIRDPvRpoVFA
         peWHYkSDXrz2+GQ6XDacokedSTKUPaQ3+GfWDFjiDcmIumL7TznoAGHNTvI8FB8KZpkP
         347g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793861352; x=1794466152; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dqJik3giojyQdxTVlYt/SVYHbelelREmDC0vou6fiGs=;
        b=d00ACOtS9HcN/J2BXx4D9RIH+3xexy6Xeiwc6YHiGHWqOjqyZMrURvS0t4zaLvqkSG
         ML9QcZnD8mbM8NPo9UKnDj6w+PpvJT9xTyuq0pQEu6IStZPWuAN8ulpy6voaLDV67qR9
         uvI8jxHoZKRqb8jJY2S9vkDbraArQZO8KykqS+sCTmjAAdmvnmEk0J8B5kUu1ewcFqOl
         H8VWfjQMjzNdvrM8r6lUEqR0LHuUPny5WJuG7IJ2hZ9QCmPBNy2tQFns5Q2HbJsPkiox
         9TB/Lewqo2B+jHlfBIctwdE/Ho1mhnmgxH+Ngskrnj9VYWWJ8tXCEBg0vIrS908EdefD
         Al/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793861352; x=1794466152;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dqJik3giojyQdxTVlYt/SVYHbelelREmDC0vou6fiGs=;
        b=SQRTisKHRSeyvoRwAj5goWbBbnhSVIr3/XsB93zu/sJtydH2djxx7rIzCOLc9KzLz1
         5HRHVTr7QzFEtt8gze123qHWk18XxgALk/wWtrc+8n7g3/zjw/leJodl87wr0r/lk5bq
         h8kYQw3tAGSPBVfI9nigqEEzNlraOB+bKhC8zrUGLuz9k/lM8RGaCjSUw8dRfqiileFn
         UxxyZRdRuufFujw6ncT7Vuc1KWLIkIJ/etkBEBoLzJVdvDreDfSrykrIccBnCpaMuEUI
         uv90yMxFNxa7Cwdqn1JOs1qaIZO+D17uHC2067dokoEaQUW/u7IvlDTU6BpS2DZGMml9
         6fHg==
X-Forwarded-Encrypted: i=1; AKwUvBxN7/DqKqlajBSmryNkiB6B9MczufrigMtBBSopLwNlElMrXOXYJsfDyUiAk3xzYElgTILxkebsvlYNRw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/dyefUfc3wx3WGtFi6ZDJgWjLHCJ8litKMyALnOCiaCGcp6CXV
	ZzcXj54l1Xnu96DYlQpFvc654VTbiQpa3+Z3qjaz/9Pzj453QOlUIJWmJuEkCB0MiAnnLOK0TZZ
	i7UPW6xLSAmMzMGUh3GGf7ESqcg/26kc=
X-Gm-Gg: AYBFou15VdsdNtJWeo96KTVMt/eV0rmO7tszIF4SJpHiaTNnoCJ50vb/WnBtuJns1Sh
	jEdhEd5D4+MuKYXvzPHfE8fmVBbacTmK9DmyCth+RhrzePweCJMDgnSDiwGArNONtzliaX42Ylp
	yu0xANCdAXqkwyxq0daVz97aPfvJbOCXeFcKz0/UOu8aak4mqOVKfLZj3c7GOssdLprGwHceTMb
	u683kfKihbn4K+gkHon3gwmg5q6vgXypvbx7DdGnJahs8t8IWMccelvteA9LhTz5yDkY8OxCWEk
	r5EVob2FmsaXRmryfk8vJO8pOwcsHkVwq3P2Rtj12TDFMNbJ++z1pcsPCx9nBq0ppk+GVa/yRAp
	uZdcKPMHDAT3gJvSfGlnUfrB3lbbi5JZ0NKJ8
X-Received: by 2002:a17:90b:5145:b0:3b0:a7b5:c044 with SMTP id
 98e67ed59e1d1-3b0afbf69bamr928353a91.1.1793861351672; Wed, 04 Nov 2026
 22:49:11 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-imx-sgtl5000-cleanup-v1-1-62739fbb4a25@baylibre.com>
In-Reply-To: <20261104-imx-sgtl5000-cleanup-v1-1-62739fbb4a25@baylibre.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 5 Nov 2026 14:48:43 +0800
X-Gm-Features: AclHuK9RYtMW40xJ2QKN3LFb2Z1eP_S0Ak6cnyuxLFg7_4CvqzYMgBFsDCsykmE
Message-ID: <CAA+D8AO6dy8Jn+yAaSmdQ2Zh0r_L_ChCAOhpQ-AJh1k+C_usrA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl: imx-sgtl5000: release codec clock right after
 reading its rate
To: Valerio Setti <vsetti@baylibre.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 6:48=E2=80=AFPM Valerio Setti <vsetti@baylibre.com> =
wrote:
>
> The 'codec_clk' is only used in 'probe' to read its rate, which is then
> cached in clk_frequency and used by 'imx_sgtl5000_dai_init()'. Holding th=
e
> clk until 'remove()' serves no purpose.
>
> Release the clock right after reading its rate. This allows turning
> 'codec_clk' into a local variable, simplifying the probe error path and
> dropping the 'remove()' callback, which has nothing left to do.
>
> Signed-off-by: Valerio Setti <vsetti@baylibre.com>

Reviewed-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Shengjiu Wang
> ---
> While reviewing [1] I realized that the driver could be simplified a bit.
> 'codec_clk' is only used in the 'probe()' function with 'clk_get_rate()',
> so it can be a local variable there. Also it must be put when no more
> used, still in the 'probe()' function.
> This allows to remove 'imx_sgtl5000_remove()'.
>
> This patch does not depend on [1] and they are addressing different thing=
s.
> The two should apply cleanly on 7.4-rc1.
>
> [1] https://lore.kernel.org/all/20261104022815.1484320-1-vulab@iscas.ac.c=
n/
> ---
>  sound/soc/fsl/imx-sgtl5000.c | 24 +++++++-----------------
>  1 file changed, 7 insertions(+), 17 deletions(-)
>
> diff --git a/sound/soc/fsl/imx-sgtl5000.c b/sound/soc/fsl/imx-sgtl5000.c
> index 8bcf54ef709e..032ea3e066bd 100644
> --- a/sound/soc/fsl/imx-sgtl5000.c
> +++ b/sound/soc/fsl/imx-sgtl5000.c
> @@ -20,7 +20,6 @@ struct imx_sgtl5000_data {
>         struct snd_soc_card card;
>         char codec_dai_name[DAI_NAME_SIZE];
>         char platform_name[DAI_NAME_SIZE];
> -       struct clk *codec_clk;
>         unsigned int clk_frequency;
>  };
>
> @@ -54,8 +53,9 @@ static int imx_sgtl5000_probe(struct platform_device *p=
dev)
>         struct device_node *ssi_np, *codec_np;
>         struct platform_device *ssi_pdev;
>         struct i2c_client *codec_dev;
> -       struct imx_sgtl5000_data *data =3D NULL;
> +       struct imx_sgtl5000_data *data;
>         struct snd_soc_dai_link_component *comp;
> +       struct clk *codec_clk;
>         int int_port, ext_port;
>         int ret;
>
> @@ -129,13 +129,14 @@ static int imx_sgtl5000_probe(struct platform_devic=
e *pdev)
>                 goto put_device;
>         }
>
> -       data->codec_clk =3D clk_get(&codec_dev->dev, NULL);
> -       if (IS_ERR(data->codec_clk)) {
> -               ret =3D PTR_ERR(data->codec_clk);
> +       codec_clk =3D clk_get(&codec_dev->dev, NULL);
> +       if (IS_ERR(codec_clk)) {
> +               ret =3D PTR_ERR(codec_clk);
>                 goto put_device;
>         }
>
> -       data->clk_frequency =3D clk_get_rate(data->codec_clk);
> +       data->clk_frequency =3D clk_get_rate(codec_clk);
> +       clk_put(codec_clk);
>
>         data->dai.cpus          =3D &comp[0];
>         data->dai.codecs        =3D &comp[1];
> @@ -185,22 +186,12 @@ static int imx_sgtl5000_probe(struct platform_devic=
e *pdev)
>  put_device:
>         put_device(&codec_dev->dev);
>  fail:
> -       if (data && !IS_ERR(data->codec_clk))
> -               clk_put(data->codec_clk);
>         of_node_put(ssi_np);
>         of_node_put(codec_np);
>
>         return ret;
>  }
>
> -static void imx_sgtl5000_remove(struct platform_device *pdev)
> -{
> -       struct snd_soc_card *card =3D platform_get_drvdata(pdev);
> -       struct imx_sgtl5000_data *data =3D snd_soc_card_get_drvdata(card)=
;
> -
> -       clk_put(data->codec_clk);
> -}
> -
>  static const struct of_device_id imx_sgtl5000_dt_ids[] =3D {
>         { .compatible =3D "fsl,imx-audio-sgtl5000", },
>         { /* sentinel */ }
> @@ -214,7 +205,6 @@ static struct platform_driver imx_sgtl5000_driver =3D=
 {
>                 .of_match_table =3D imx_sgtl5000_dt_ids,
>         },
>         .probe =3D imx_sgtl5000_probe,
> -       .remove =3D imx_sgtl5000_remove,
>  };
>  module_platform_driver(imx_sgtl5000_driver);
>
>
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261104-imx-sgtl5000-cleanup-371e704e5de6
>
> Best regards,
> --
> Valerio Setti <vsetti@baylibre.com>
>
