Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FEE123D295
	for <linux-sound@vger.kernel.org>; Fri, 25 Jul 2025 11:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753443910; cv=none; b=D5Moyh53T+e2dPBehPJbHf9R6Qrvmt/LYqYwjSce8WuIM3AO2QsqknrpFraPwmWYFVdJ5WnwyxKjFpGD4HO3FHJsGGbqagaTkiG6ep4PbTjGx+RsIhw9nwryUoCiKmP4ke2uHqlbQnejv00mBBIqJvstsTOiXQ71vQ7iPOYSpKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753443910; c=relaxed/simple;
	bh=AyRroNoAAfZMLYMuOWzL5KFUvjXMr31GJOyZqB2g5AQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SDj4us7+kQPpOaqhTjdJDVAgcyIaH7xFb8dbpn5xxUS7mWk4PdJ6Vib7lUj5r571q5rlJIV97QZtUh8z2B8Xh/3UvDPenb2cD4wJOIJHpVFrzTr1rt6qTnW4J5kWyG7WfrXUxUeAQBGERMVMj/dz9aiLF4dDXS4PEwbXM0Ay99I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SchLfVah; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SchLfVah"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-31e41cfa631so2294683a91.2
        for <linux-sound@vger.kernel.org>; Fri, 25 Jul 2025 04:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753443908; x=1754048708; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t63BOHgVickClQUeVRs7VclE4TnB0fFJ8koSEGsWT2s=;
        b=SchLfVahCfmcAjw6lK+nV293gyD6mmsa1G0kJvnknjl4wot2/cFtKeQ1o+V/vuBDzm
         1TgueKfPor3z8zF4nufnE1XhPngv954BOtynyeHldY8B11yw48FISHlyqMIGpBs8NENZ
         1nkz6OCHp3ghYALp8InwBsNKoJZn+8sOkL1e0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753443908; x=1754048708;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t63BOHgVickClQUeVRs7VclE4TnB0fFJ8koSEGsWT2s=;
        b=oJGhwlqGJ6SGwjcpY+B3YRIpmZ0DeQ58xN5fqm4Obz4SGEsklH9vx1QnWWHchDgGJl
         /GI1u+3AADpIyH6+/9Qq6WReIlPYdMK1F3jFUe4BqZewgfe+HM+pND29pazIpdPifbpF
         tWmTeOglgZ0GOuVNYJLYbFRYxoQKTBfLARX8/GOvJf/32qi+uln6tODUjGURtV93HydY
         phMf9OxvGi7+yYMz8TKzW0uJ4a8JRC4wXt5ldWpgi46xrUH2+WGiYjmzhgsSkhf9syFi
         8b8Amx1mD7ALFxUz7kI4ZqikyOq3Gj0TDoDkJsznAXwvamXZatQMLgegh57gg1UXd4W/
         4U0w==
X-Forwarded-Encrypted: i=1; AJvYcCWA4HZVWPSHC20NszzLJ2QALkhF1lNQ5VOLQ6MpUJeJkg9sbKJiJZ7mlz/qH0GpWqC6Qhz2aRTucaR1Kw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyL9i/Yvz+qtzNIDH5MUZF+Z1O5rhcm2IbOKaLIIovWYLmDHMAk
	bh7c8M6e+ILhnlnXH2hupmOHXhkgv/aHfSY2TXC3Hp6lCY/tI3xJXRKAo2J3OMnmXzOb1zfg3e9
	yRwZ4Vh/B
X-Gm-Gg: ASbGncsAoAMC3lGWoxLyRJ6W814X4MsTMrtwPKcwRXTs2ViLNfR6xGj5sTXx4aJsjxi
	Yw/TFx91/PKvu1hdoBbvTesrY73hG/cfJCzyH7ea+kwVOB7Dw5ISXAQYfSPth/JZTUTcsI0wjNY
	frxlmITPR9dFkO+i3axJFLYz/loGOQ511cbTC8hEG+JeHA1b6XdA0+GCvm9KuPhcZdZD9VaZGob
	bNiULLMBKCM9f8pKxLDF61A9LO9n1sWwWbgYelAgMy4Vayn7vw7W1kPZK//DafiwTtYOvBjp6JO
	Prh+KQDRdG7jZ0EzRdYeCwfzSoCN4tXFg9g0o8bnVBTZwevvlRF/Ag5rqYEJNKn3/UHpLBbtef2
	oRCsGmyOvaTOxOR1d8KuetZaLPYZkl0FwRUzaNNMHEXP92qakxBLhwA2G35dFGX6+Oz2R
X-Google-Smtp-Source: AGHT+IEXMfE3Bb11hd0dLDE7NFgKoFPs/Ai08gv5HFBL2FY4hKS8HzqsspUn3AweuYCav1IoNUzTUg==
X-Received: by 2002:a17:90b:2e0e:b0:311:f05b:86a5 with SMTP id 98e67ed59e1d1-31e776207cfmr2808998a91.0.1753443908335;
        Fri, 25 Jul 2025 04:45:08 -0700 (PDT)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com. [209.85.216.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e66270edasm3383703a91.9.2025.07.25.04.45.08
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 04:45:08 -0700 (PDT)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3138e64b42aso2022772a91.0
        for <linux-sound@vger.kernel.org>; Fri, 25 Jul 2025 04:45:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVpsa6E5tKr4Ml+BB9NFghYTRVoIXJ5KoSeCymd8CXTbokGMsob8ix3IBZDarmF5z2TGDxfT9J9bMzvbA==@vger.kernel.org
X-Received: by 2002:a05:6102:3053:b0:4e6:67f6:e9af with SMTP id
 ada2fe7eead31-4fa3fa71860mr256656137.9.1753440125688; Fri, 25 Jul 2025
 03:42:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-27-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-27-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 25 Jul 2025 18:41:29 +0800
X-Gmail-Original-Message-ID: <CAC=S1ni_6YRK0RWheKZJDgCknaZzPsde0J4dFdmkNhY7HMMD+w@mail.gmail.com>
X-Gm-Features: Ac12FXwspafB6XO0s33DaaDCIfXTapXC0TbPbPDsXvwxpmO6Wfy_iIb8kWhO-Rk
Message-ID: <CAC=S1ni_6YRK0RWheKZJDgCknaZzPsde0J4dFdmkNhY7HMMD+w@mail.gmail.com>
Subject: Re: [PATCH 26/38] arm64: dts: mediatek: acelink-ew-7886cax: Remove
 unnecessary cells in spi-nand
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, 
	daniel.lezcano@linaro.org, mwalle@kernel.org, devicetree@vger.kernel.org, 
	linus.walleij@linaro.org, linux-remoteproc@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	olivia.wen@mediatek.com, shane.chien@mediatek.com, linux-gpio@vger.kernel.org, 
	linux-phy@lists.infradead.org, airlied@gmail.com, simona@ffwll.ch, 
	herbert@gondor.apana.org.au, jassisinghbrar@gmail.com, jiaxin.yu@mediatek.com, 
	andy.teng@mediatek.com, chunfeng.yun@mediatek.com, jieyy.yang@mediatek.com, 
	chunkuang.hu@kernel.org, conor+dt@kernel.org, jitao.shi@mediatek.com, 
	p.zabel@pengutronix.de, arnd@arndb.de, kishon@kernel.org, 
	kyrie.wu@mediatek.corp-partner.google.com, maarten.lankhorst@linux.intel.com, 
	tinghan.shen@mediatek.com, mripard@kernel.org, ck.hu@mediatek.com, 
	broonie@kernel.org, eugen.hristev@linaro.org, houlong.wei@mediatek.com, 
	matthias.bgg@gmail.com, tglx@linutronix.de, mchehab@kernel.org, 
	linux-arm-kernel@lists.infradead.org, granquet@baylibre.com, 
	sam.shih@mediatek.com, mathieu.poirier@linaro.org, fparent@baylibre.com, 
	andersson@kernel.org, sean.wang@kernel.org, linux-sound@vger.kernel.org, 
	lgirdwood@gmail.com, vkoul@kernel.org, linux-crypto@vger.kernel.org, 
	tzimmermann@suse.de, atenart@kernel.org, krzk+dt@kernel.org, 
	linux-media@vger.kernel.org, davem@davemloft.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2025 at 5:50=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> There is no need to specify #address-cells and #size-cells in a
> node that has only one non-addressable subnode, and this is the
> case of the flash@0 node in this devicetree, as it has only one
> "partitions" subnode.
>
> Remove those to suppress an avoid_unnecessary_addr_size warning.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

> ---
>  arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts =
b/arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts
> index 08b3b0827436..30805a610262 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts
> @@ -98,8 +98,6 @@ &spi0 {
>         flash@0 {
>                 compatible =3D "spi-nand";
>                 reg =3D <0>;
> -               #address-cells =3D <1>;
> -               #size-cells =3D <1>;
>                 spi-max-frequency =3D <52000000>;
>                 spi-rx-bus-width =3D <4>;
>                 spi-tx-bus-width =3D <4>;
> --
> 2.50.1
>
>
