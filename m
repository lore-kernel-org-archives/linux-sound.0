Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5594B2EB878
	for <linux-sound@vger.kernel.org>; Tue, 27 Jan 2026 17:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769535091; cv=pass; b=JbJItmm+X/CH9i6/flF1S9D4naEdoRodEqZC8EazkaZtEMEUB56Ea+8/k2Ty6CX/h8q/+0ZymKT3VCncLM/rPsgjqg9FaRh7kCFiB63+rw7cnmo6K5uRhsOBu75IWdKWGDDkypRIh2kCDKAzoktAc0nHpiJTQtdkC8EVvmEZxak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769535091; c=relaxed/simple;
	bh=ChEJDfVdJB4XenSiI79lCbvGmTZx22Fnpzjb1GyA/3s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kQDYnDNf2+VNQ5uI0kPD6ZWihJZMvnitdZ8W7msaii3WpCLGGYDrWR09MityRhDJL40z/zEBzp44H5fzA6pquU0QNUmK78r9NVJf6n6jR8Ydo3V6ZyyQRa/JdfwSoZ/DHNpZM7oAJLj/HLiV8W+CruDfjv2gK/p/+yhx3DGNnh0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jg2gNQJs; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jg2gNQJs"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-50334dd44d2so3964171cf.1
        for <linux-sound@vger.kernel.org>; Tue, 27 Jan 2026 09:31:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769535089; cv=none;
        d=google.com; s=arc-20240605;
        b=Hli6k1hDi+LqO7ViS682IDLREt6ZevZHRm7vkuwVp32OQJC4mgCsPGOF6pMC3A4JU+
         cjWKUbhh8qYticB5IIMXv8V37bkquVVH15/oVd0ReVuVCgo17k8GLVrC7GaTaudkWri9
         wO4d6wE1siYLUD7XFcakt0sxmY0hGMR5trJsV8jOZYYR3HkikHC82Z37kWiT9q45xshd
         852SW+HdPuP6scBqQ5rnQxJFZsQ2lJ/g2JgdkeT7F2gexX1lA/SYmq8xA7eoiwme+PVX
         jNklLmChhJmgsWYHaNm2GT8ZfkElQYCxNUPnPQIvakTuoEWwd6mAOYhSydjX22q6oU1T
         BHWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PlNmfFoygixWkI7H3Z8R3RRT3c5a4skQJi9DgZ6SblU=;
        fh=iBi30pc4IJXTo8t2xH7qvtMbhcJHQr29goLwFOcaVYw=;
        b=f0MSEcG1l/v0xiVh+Bt7X4BW3usM9HH7RduVOIDaRbCoE9ck/NfNuz6rlGZQuV91O4
         NSW+GoHOmoF0q6hs96/+p0mp6OYthfIcTBeAE9nA+Rg3O70dmCNyCQwITg3/RG5Txb1A
         Io4OxDknTm31Y8o7DOvQpm3GJFCt36k8C3BiMtHDQBzu2nJf+BGDg1TNl2wHbgg/ynD2
         Fef6U4J4J9tzv2YDiUNMI5Ws4d1hOx2ATBAy02iPgHEtn0UmLVkTp5byZflFfkDkRnvf
         Fokg9XuijYEkoi11wBR3nKjXNVqEZBnuorQ06h2+Bi016dMXRBmfcopIj3DD9MvXSp5/
         e2ZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769535089; x=1770139889; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PlNmfFoygixWkI7H3Z8R3RRT3c5a4skQJi9DgZ6SblU=;
        b=Jg2gNQJsUk6RHBT8mJkWQUt1hpNS7SdDmVkdBZIVSMxOikl9MoucXgu1mnOXsIoXi9
         lqScKocctfoxJYoFNEhJFYk0ohQzBajIYhovB0WG/qMMBHe2Tc3S7Ji1tZ9+GcUdX5jY
         vX5I9TaQx6Txuaglnicp5Et3ZguuQQMUb7sLDvNxvTCq2BSnZgTh+NSYDdj2b/9uxAzJ
         l5rmLeyvimC+OE8AdkVSV0H9Ezav6mESzflH86hGeQMakw/RXUyfUw9KX9AFj6WDAK4K
         Fe8JhSluPf53vSBlsdJ/J8OOYkTw1dSPq53itLs5joe3wJ/n1/7YE9s3ycrO8xs35xxM
         6Pfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769535089; x=1770139889;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PlNmfFoygixWkI7H3Z8R3RRT3c5a4skQJi9DgZ6SblU=;
        b=qAyf/ElAdjlqyDo+R2ycrqZzI4iFquR/WZNy6zNRBKQaGTAzDoqgDWWOWxQCapvtfN
         GClOloKj/MzQ/dFeiMaK2gqwlclPX9xnTNvZDrwcOO1kyx+IKIwjW8pQ/6NmLwO/N2vn
         sH3QhTCh8yVZv95pReKxI3qwGfP81xBaro0MM75jYrHjfRk97usvuxsQUAuwMMwWtalr
         TVHqCl6Ea2+vxg0Od4C7hyTgMg1JgOw7Q1+kjCXVHmClumXNFZkQ4uHp5sVCn7YfolGp
         gd5fJSblOUAQYjKSM20SJUXI+AcepBR7bbAwaHAS+AtctwdjAkBbumThF1VQjQovH3i3
         993w==
X-Forwarded-Encrypted: i=1; AJvYcCVTKZPtGd4XzYHqUHzRjdnF485vZn5RYlrXUvmf0XgyqXIsyZf73sIyQFCPaxIyhdnJnh3fNGxLKsw0Mw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGQmmDIPYsDWLlA0oVWuq4majNwFAwai568j9tfpaFaPMouSuW
	vFyKW/hSksSgFW25jf7MuHYnK4Bir1pIggCYopLwF6FCZBOF/w6O+OiZ79QMcO8Bw8/9tdatjm+
	m4JO31ZgN0H3k2y+2lNswqKLbxGL/4F0=
X-Gm-Gg: AZuq6aLNxRyEnPSOugLn5gGMwnExNRFT2crxHnGp9Zdcr02SwdVzzR0B0RJLfAzmOIe
	nI19v8YoOAe0SdfKGkLQROC8OGwrj2SMTUDw6Eb7N5QWTYHCKo61SzrZALYhfvvmfwrM+0tRR/W
	d2XTxHsbfFy0sXXc9cCrtzxJZnsdMBJBuHmkjElmZ9FIYiFW48uD4AyvSrUSluog+SvAT5kxcuO
	PembEQJ9qx9KBgN78b8tQG/no8y1tYATzJYacdsRKW8RlqhRX9cUbKDjv2tq+upH0CrNuU=
X-Received: by 2002:ac8:5a85:0:b0:503:2f49:6f81 with SMTP id
 d75a77b69052e-5032fc262a9mr32087791cf.74.1769535089137; Tue, 27 Jan 2026
 09:31:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260127-rockchip-spdif-cleanup-and-bsp-sync-v1-0-a7c547072bbb@collabora.com>
 <20260127-rockchip-spdif-cleanup-and-bsp-sync-v1-4-a7c547072bbb@collabora.com>
In-Reply-To: <20260127-rockchip-spdif-cleanup-and-bsp-sync-v1-4-a7c547072bbb@collabora.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Tue, 27 Jan 2026 21:31:18 +0400
X-Gm-Features: AZwV_QiRBuULTXUycKkcZHEVy2gS4ko9kDhO5KYckrC2F3g82wjmaKUQO-30ews
Message-ID: <CABjd4YxVQfp=ZuovBhAzqX9pDBnBmntQoxkr5vXnToPc3pRARw@mail.gmail.com>
Subject: Re: [PATCH 04/10] ASoC: rockchip: spdif: Use dev_err_probe
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Heiko Stuebner <heiko@sntech.de>, 
	Sjoerd Simons <sjoerd.simons@collabora.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sebastian,

On Tue, Jan 27, 2026 at 8:08=E2=80=AFPM Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:
>
> Cleanup the probe routine a little bit by using dev_err_probe
> instead of dev_err.
>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  sound/soc/rockchip/rockchip_spdif.c | 18 ++++++------------
>  1 file changed, 6 insertions(+), 12 deletions(-)
>
> diff --git a/sound/soc/rockchip/rockchip_spdif.c b/sound/soc/rockchip/roc=
kchip_spdif.c
> index 841ef499ed7f..20ed64c1fa42 100644
> --- a/sound/soc/rockchip/rockchip_spdif.c
> +++ b/sound/soc/rockchip/rockchip_spdif.c
> @@ -279,11 +279,9 @@ static int rk_spdif_probe(struct platform_device *pd=
ev)
>                 struct regmap *grf;
>
>                 grf =3D syscon_regmap_lookup_by_phandle(np, "rockchip,grf=
");
> -               if (IS_ERR(grf)) {
> -                       dev_err(&pdev->dev,
> +               if (IS_ERR(grf))
> +                       return dev_err_probe(&pdev->dev, PTR_ERR(grf),
>                                 "rockchip_spdif missing 'rockchip,grf'\n"=
);
> -                       return PTR_ERR(grf);
> -               }
>
>                 /* Select the 8 channel SPDIF solution on RK3288 as
>                  * the 2 channel one does not appear to work
> @@ -334,16 +332,12 @@ static int rk_spdif_probe(struct platform_device *p=
dev)
>         ret =3D devm_snd_soc_register_component(&pdev->dev,
>                                               &rk_spdif_component,
>                                               &rk_spdif_dai, 1);
> -       if (ret) {
> -               dev_err(&pdev->dev, "Could not register DAI\n");
> -               return ret;
> -       }
> +       if (ret)
> +               return dev_err_probe(&pdev->dev, ret, "Could not register=
 DAI\n");
>
>         ret =3D devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
> -       if (ret) {
> -               dev_err(&pdev->dev, "Could not register PCM\n");
> -               return ret;
> -       }
> +       if (ret)
> +               dev_err_probe(&pdev->dev, ret, "Could not register PCM\n"=
);

Shouldn't this one return the error code, instead of falling through
to 'return 0'?

>         return 0;
>  }
>
> --
> 2.51.0
>

Best regards,
Alexey
