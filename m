Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529FE2D8783
	for <linux-sound@vger.kernel.org>; Fri, 25 Jul 2025 10:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753439046; cv=none; b=hGNWOEtAEf+cPhRpobH+z8CzydNCLCLK1SFNdZU9gnQc3IzscCkxWfpewdyOvoTMYQOXlb3iTU2l3pFjiBsjKhsPrQmlvg/VwektF1Y4DuIZwjKm/4qAzjy/K8tvWdjscy/FTG2wM2YATEvtFpgrPzoZ+7Eng3ISitzjqujnsqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753439046; c=relaxed/simple;
	bh=2XXVnmKfKOuWrZjQTjDdYxCXEPvU5YjHEeLez+QHVDs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LrPnleGojPgxrddRG8MYeSwg7y1GzwtZRWOR+y+EFrHT4KQseOC27HICzVqZp/K+g4dt3gimVMQ/N5ElA1lWa+o4aC0NHtNrfGQ2gkD6FQnXAaPioxWQny8zGgow8XPujWqCRa9X9oV/G84KTTdjTiTJ/G9zQpsyABUeNtigwo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cthHpa8k; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cthHpa8k"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-73ff32d8b87so1160608a34.1
        for <linux-sound@vger.kernel.org>; Fri, 25 Jul 2025 03:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753439044; x=1754043844; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s9CPe4n6W7cHa+GL0hIjIVMWtvIyx6LwWGjspV/N2Ok=;
        b=cthHpa8kfYDBbRt8rGmQl9ly9gIJCXQ9kZGAKozJ7mBH/Td+piYini5xwWV83E06cL
         H+VfNLeQTQ79LfV3g1yIoQZoKqbT5gt7QKj+w6OpbprY0n9p1FkKxkoj6Zo2v1ibN2Jo
         fGb9CwOnz0YT7wPug6mIZDJKR3HOTq6bhojFg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753439044; x=1754043844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s9CPe4n6W7cHa+GL0hIjIVMWtvIyx6LwWGjspV/N2Ok=;
        b=RfTseM/RZbEERJRopu0SqqiWNZvBPzr/cmNHJ/noCoUk7XpdXALIbiqOFYu2VjvBp9
         ryj+aSIWW1cnqZQ1SJrub0Yn+yxAamKde1h5yeWFP0mEt+GIOjE1s4GMI9h/ILG2eyag
         NCpwsTTbRUnQ7M/SC+b2uPQ2CawNX5NUNz4rjXI10rJOBXNeQq0f6FhYGmR1qLzFQ0V/
         m3IZ/LrxPdrhP4u2ChCHIxzyYuakMqL42Oz4Ulr4wwYAqJTUpDvE3Y326aeqKH4JW+8d
         m9on8mccZWfZxPOht3gNoqhEnBMkNs6e/fxYbLREUqS0A9RZfEPQ/uSpDcyVa4N/rZky
         qfEg==
X-Forwarded-Encrypted: i=1; AJvYcCUgW+pHtanCGEsWCtLgUMc9GDinvVSppFtVVR+Uf7KsdPJf9PVQDwrg2G5VqUg0cIjCYCga6GMA9crdkw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfDn3ifWmwRw4p5q0Hq4w/apKq3yiP1CNTOQPEkhvETR8mZFmD
	BqCTcjIHC7L28+SmLjR1OPkFhVpAePgh5dGeasCgo94LStV5sKLtTIsnE3flc5Cp/pEVwOOOYG9
	6Jqo=
X-Gm-Gg: ASbGnculqhm/5iFSgVDoVkrJm3TvLCvCa8PpQQ3xMuXMVl2sQge0h4T2g41sCV2UN7l
	VeDmMrfUK8hrZgxNH4Kem4BP3PKZvSPhGsM6g8nY1RecHSZH/R1ACfpZrqNjufKjFZlCR1bDSHH
	YwkrtKHal8yA4+4c/fJ1oLkWC/fXD2gxb6Ev5PBDHgys9e45XRcaGFb5jEGihDI3HJWKgWu4cHZ
	VxEA+DLCusYq5VxvAy5E6Z9YvBoAORLTKHCR6+ZcyNLmt2SqFJ1SVrR+r/QmdAWK+SnTiPFvrLw
	/rt5sBvHyA3/6sim4mQGSadRTE7ZneqldWfhTVXOCwF1Vaycf0qd1omROPWx7LLzuvfIFJjlvXW
	ejffF3p6WdXMVaIebFSbiEx9RD1TPd1GDfU+pv5OrBhiF/iKFZyJoTgHpmQ==
X-Google-Smtp-Source: AGHT+IEPxUHz+z/PunNw6UW4MsBcl5GDjXWSqt5L1M8N0EVof2CV5Jpjo5nKMKlNyQwac5OhIiGI3A==
X-Received: by 2002:a05:6830:6c83:b0:735:a61d:5764 with SMTP id 46e09a7af769-7412fda6fdemr2554393a34.9.1753439044025;
        Fri, 25 Jul 2025 03:24:04 -0700 (PDT)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com. [209.85.210.43])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7412d2ad564sm622446a34.39.2025.07.25.03.24.03
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 03:24:03 -0700 (PDT)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-73e8cc38e80so1470220a34.1
        for <linux-sound@vger.kernel.org>; Fri, 25 Jul 2025 03:24:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWwTQad6p4FwO5jnzZcseO9KU8ov+6FpX7eDJMs3bKb7Zd76/fFz0h0v3GX3oNJlEmdoqfCtkhu4fHDIg==@vger.kernel.org
X-Received: by 2002:a05:6102:1623:b0:4fa:dd4:6877 with SMTP id
 ada2fe7eead31-4fa2eb0ce5dmr2502816137.4.1753438693359; Fri, 25 Jul 2025
 03:18:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-31-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-31-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 25 Jul 2025 18:17:35 +0800
X-Gmail-Original-Message-ID: <CAC=S1niM4ddPSaOM9uMRQuUS8HwPw+gtxe9kGUggWQx6uio5eA@mail.gmail.com>
X-Gm-Features: Ac12FXzF0-E5XCOaIf5MFeMvqjYMvWSzSdwqzh1uEwhsUpfXPcd-rqBecXNopmU
Message-ID: <CAC=S1niM4ddPSaOM9uMRQuUS8HwPw+gtxe9kGUggWQx6uio5eA@mail.gmail.com>
Subject: Re: [PATCH 30/38] arm64: dts: mediatek: pumpkin-common: Fix pinctrl
 node names
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
> Fix the pinctrl node names to adhere to the bindings, as the main
> pin node is supposed to be named like "uart0-pins" and the pinmux
> node named like "pins-bus".
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

> ---
>  .../boot/dts/mediatek/pumpkin-common.dtsi      | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi b/arch/arm6=
4/boot/dts/mediatek/pumpkin-common.dtsi
> index a356db5fcc5f..805fb82138a8 100644
> --- a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
> @@ -198,8 +198,8 @@ &usb_phy {
>  };
>
>  &pio {
> -       gpio_keys_default: gpiodefault {
> -               pins_cmd_dat {
> +       gpio_keys_default: gpio-keys-pins {
> +               pins-cmd-dat {
>                         pinmux =3D <MT8516_PIN_42_KPCOL0__FUNC_GPIO42>,
>                                  <MT8516_PIN_43_KPCOL1__FUNC_GPIO43>;
>                         bias-pull-up;
> @@ -207,7 +207,7 @@ pins_cmd_dat {
>                 };
>         };
>
> -       i2c0_pins_a: i2c0 {
> +       i2c0_pins_a: i2c0-pins {
>                 pins1 {
>                         pinmux =3D <MT8516_PIN_58_SDA0__FUNC_SDA0_0>,
>                                  <MT8516_PIN_59_SCL0__FUNC_SCL0_0>;
> @@ -215,7 +215,7 @@ pins1 {
>                 };
>         };
>
> -       i2c2_pins_a: i2c2 {
> +       i2c2_pins_a: i2c2-pins {
>                 pins1 {
>                         pinmux =3D <MT8516_PIN_60_SDA2__FUNC_SDA2_0>,
>                                  <MT8516_PIN_61_SCL2__FUNC_SCL2_0>;
> @@ -223,21 +223,21 @@ pins1 {
>                 };
>         };
>
> -       tca6416_pins: pinmux_tca6416_pins {
> -               gpio_mux_rst_n_pin {
> +       tca6416_pins: tca6416-pins {
> +               pins-mux-rstn {
>                         pinmux =3D <MT8516_PIN_65_UTXD1__FUNC_GPIO65>;
>                         output-high;
>                 };
>
> -               gpio_mux_int_n_pin {
> +               pins-mux-intn {
>                         pinmux =3D <MT8516_PIN_64_URXD1__FUNC_GPIO64>;
>                         input-enable;
>                         bias-pull-up;
>                 };
>         };
>
> -       ethernet_pins_default: ethernet {
> -               pins_ethernet {
> +       ethernet_pins_default: ethernet-pins {
> +               pins-eth {
>                         pinmux =3D <MT8516_PIN_0_EINT0__FUNC_EXT_TXD0>,
>                                  <MT8516_PIN_1_EINT1__FUNC_EXT_TXD1>,
>                                  <MT8516_PIN_5_EINT5__FUNC_EXT_RXER>,
> --
> 2.50.1
>
>
