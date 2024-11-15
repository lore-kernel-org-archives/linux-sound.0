Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0621DFFD
	for <linux-sound@vger.kernel.org>; Fri, 15 Nov 2024 07:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731654246; cv=none; b=NFNC2K65zKngF8kXlq231GL0ADJGkq1a2DHsc+hrOmiOHw6v8WuyqE0bWmQtyuSLY1vSIPOx8Lw2ftJpZ2zXoPYY6PpFRttVRDL+p+lqMD/Mh6NsUoL/iqIBZbSLrYuSRD1JZYSSh10DM9+J0g4tRMFBHV6/uacwyolwg1lSD+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731654246; c=relaxed/simple;
	bh=/gQa+AAzsMOCTBdSpSgTZeMXYgSmQafHAN36EAUBUCY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WGje/dNZvAGYA8wCCvDCluiby0Tay+8IvNr5yrMWgjwaFC0KmSYGOIkoSy8318zyfTjM4Z803+7YlfQZUieI3lQmpHreE16elYEy3Ack5Z0QmAmLDU3wCZMid3/bz1HZQv/jJEgvrywoLl8xcccYXbuSc4bua4Cwe3y1hB5RJ0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xq10XJxc; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xq10XJxc"
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3a4e5a7b026so1233825ab.3
        for <linux-sound@vger.kernel.org>; Thu, 14 Nov 2024 23:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731654242; x=1732259042; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HsPrhcE+0wOhQ0UFNclRCtmPomSqHnfw2nB7AfJcaYw=;
        b=Xq10XJxcu0nO4lcUmE6k5UeawAnyFO74M7Tw9nrwPGDybH32Y4z2HVaznJqfLA7xkb
         KQ6VGwRNCwo7uf1ShZcs1XRlZOgvwLonao3uRIin0bXcb55rjfveNGLk0h0OKgLK49Bv
         zYBaBOXmnptq1xRh3FPXWkJ/G8RIIPv+HlAUzwYysuOIyLb06JULy1R7yy2NetuYSLC1
         XRpyrsloTl1nbvOYby/39hvo0T193pvy8D8aYcxj+Bt+bPmEkbzxmEbSxIgnrvZOFArx
         b2pfvTmqj8P1n8ZVuvIdUn+LFnIB1Fhayb+Y/xhOrz+lI98mVzP6AqcIPZ8PaoTQUIPz
         yopw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731654242; x=1732259042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HsPrhcE+0wOhQ0UFNclRCtmPomSqHnfw2nB7AfJcaYw=;
        b=ONpe8JPxFZcuEFzfL7EvCW8PuM4rCeeZCdf/X1cKJY0X4KQh6XdKgXiJNpjbtkkHhS
         kWapPHqalJzPt+oyO2Kqvj89Y9Iv2J3ufb9IcvovFkArVbknAR7Tb8EWSzWus8OxUFD4
         0w8wewWgUbzmqmiTbB646AF4dNl2U9xskEHt2aPJdVoGtadFs6MoWmW2TDmbCPqp+zKW
         5yFAAVd9CGsT2IYaSmGtgfjIBlA61s2bfDCm0smlhBhpkdkymu+IbxmONGAA15FELNmG
         djPKYfAdt9SrJSob2orom0GyeEbOBDtoCCeOa0/Di69ElNMrCidXcr5HWzM/3mY5/nVr
         LK1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUpcawvaTT/MwlCZI0OVDxJgTjRf2MQQxwbjQKbuwbiKCLdw8PzI9j1EgaAfgdpu/OPOsua9qt992rRyg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIUgwo1cgolmmM0LUPN3earQ5ZGPjmFQXMKKBhad8RVFhj/2cT
	CFlHMC4JC4PKCX/rF7ngUadUBFNmhPUzAaIstXRkiMb/DQMV49XhqhqWRFYvNhI6ad51suyUEOG
	CnTYE7T+DSXtdPcEOhdhrijOTLjg=
X-Google-Smtp-Source: AGHT+IEtsEzuxTFVYUEtGRJ17ltNdc3B8CWdUjAK/NkVesj+VHxHxo69gD7qxhlfC640Txa54IvI2/V23E1N9t8qlpw=
X-Received: by 2002:a05:6e02:1d88:b0:3a6:ac4e:2659 with SMTP id
 e9e14a558f8ab-3a74800f183mr17959245ab.6.1731654242441; Thu, 14 Nov 2024
 23:04:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241115065610.39112-1-hanchunchao@inspur.com>
In-Reply-To: <20241115065610.39112-1-hanchunchao@inspur.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 15 Nov 2024 15:03:50 +0800
Message-ID: <CAA+D8AMG5VpOk2PXOqUaLV1XwyBa3B2Mbdnc0+v3ArwWmkC5uA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: imx-audmix: Add NULL check in imx_audmix_probe
To: Charles Han <hanchunchao@inspur.com>
Cc: viorel.suman@nxp.com, kernel@pengutronix.de, s.hauer@pengutronix.de, 
	shawnguo@kernel.org, tiwai@suse.com, perex@perex.cz, broonie@kernel.org, 
	Xiubo.Lee@gmail.com, imx@lists.linux.dev, inux-arm-kernel@lists.infradead.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 15, 2024 at 2:56=E2=80=AFPM Charles Han <hanchunchao@inspur.com=
> wrote:
>
> devm_kasprintf() can return a NULL pointer on failure,but this
> returned value in imx_audmix_probe() is not checked.
> Add NULL check in imx_audmix_probe(), to handle kernel NULL
> pointer dereference error.
>
> Fixes: b86ef5367761 ("ASoC: fsl: Add Audio Mixer machine driver")

The fixes tag should be:
05d996e11348 ("ASoC: imx-audmix: Split capture device for audmix")

Best regards
Shengjiu Wang

> Signed-off-by: Charles Han <hanchunchao@inspur.com>
> ---
>  sound/soc/fsl/imx-audmix.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/sound/soc/fsl/imx-audmix.c b/sound/soc/fsl/imx-audmix.c
> index dcf770b55c4b..231400661c90 100644
> --- a/sound/soc/fsl/imx-audmix.c
> +++ b/sound/soc/fsl/imx-audmix.c
> @@ -274,6 +274,9 @@ static int imx_audmix_probe(struct platform_device *p=
dev)
>                 /* Add AUDMIX Backend */
>                 be_name =3D devm_kasprintf(&pdev->dev, GFP_KERNEL,
>                                          "audmix-%d", i);
> +               if (!be_name)
> +                       return -ENOMEM;
> +
>                 priv->dai[num_dai + i].cpus     =3D &dlc[1];
>                 priv->dai[num_dai + i].codecs   =3D &snd_soc_dummy_dlc;
>
> --
> 2.31.1
>
