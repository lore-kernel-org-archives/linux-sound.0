Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0712746A
	for <linux-sound@vger.kernel.org>; Fri, 25 Jul 2025 11:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753444629; cv=none; b=njJhpJWo4s5FCVVCIKfzmPvmPl+t0hd+HTc7WaHqmhOnSCkt/ztLXWIff/VSxCGRwxHl4rNvfKF2wEkhjBsfZQ95SpqSUKkBfijPl/VR71mXUnmpCBoQomf7zEiJQXpZgq8A9LiNVFF3SCkJlA7Of086UZgLYng4gtZ7S8OwNEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753444629; c=relaxed/simple;
	bh=wuFFxAizy2X1aAZ/SF2x06cfnVSKnpsKMko3UN4we2M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aEodSZy4vXXvaTS5K4zD8V7h9C2rGR0cztTsK7kHhBDSVpisRCc970Cfmod4ks5HbZA1I4Y/VBbsthoZj3t99QQVQJsyUe2W1n+t2Au8tb6Ghk7P+UNKO8tueugXNAeFYP7QH0yXeD5IjAcqsmW6GYIP3uj3mvxN2JOvk5LTsWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Dc0Y7ZHb; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Dc0Y7ZHb"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7dfc604107eso178219985a.2
        for <linux-sound@vger.kernel.org>; Fri, 25 Jul 2025 04:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753444626; x=1754049426; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IaRYlYWMnL5FdToAvFBY21N9TEhebXI6JAmJStjizl0=;
        b=Dc0Y7ZHbKC/Ss4TL6ZTPdrFbqQ0UfZsMNhwukoG47aYRsXfadSi4WeVBrlVdTMxxee
         zJosMWEGOOiYcJ0hH8wxcAN/NfK+r0SB5BnxmR0FGeEIt+yXZmrZ2ODvOhcz3yJB3EfO
         h+PPf1sp27GdI55T86u2LmDVgQjAL5bsUa2xk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753444626; x=1754049426;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IaRYlYWMnL5FdToAvFBY21N9TEhebXI6JAmJStjizl0=;
        b=Sf9Qj1uHiYQ+i/7xtUvBSjgh5V4F7rrQZI+k5uTjb9KtUmpHE9uMlWr4NWQ0BGAxx9
         fDcOZFXtJ4MTfo3e0Vsf/2PBOgjfOQe/fXnhUhSlSXzZAqTMyXxu8nImt0wXGb1MKDCF
         AKCWWm8HKFheF1KLI/bUG4uuYnofbw2qDNN0fn2FaE5tiKFwHYlHVRxJqskAGJESZGmF
         sKgwMoKCuZiKqEZumsaA0R+U5y1xsuAj5VfBipozKbg9tM+01aWo0fQNzdVA3ApUW9bE
         nQk9VSSIN8TBXfL6e27lOokMW/HGo7E4QZ7+Z5RzFIy9IN32XQr6kR9gDS3qFx0utBsi
         DaLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXN0dgFEHn5b3SOaA9ymWkHuu4lBl9FbtYXut+Qkf2yADtj2eatjFylQWXuS9BFcHEjN9MMtVf4j2nADQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXgkNE9pL7m3m/fIOq/TC9H9gZ5hSzk0XlQGjWup3y7K5saSMX
	Pafxq0bskBvlkN1UUv26XNFzImZmjy+XohUDSk8/TtabxVO9+ThZKODQFGnvdnoiXMvMDeV6AHx
	H9bk=
X-Gm-Gg: ASbGncvFGgOUZako1da4ai6RN1ZYfAx6cXO0HSH0gvHJBr3yp9oLmOv/e6+T8HEr2CP
	7TW2IuRimZu/VIyHfiHI8nHGpZht1F5kx/YKOwdO9PTD2oRjRiZp8rz8SwnzHfqsVbGuzmnS4X3
	u16v9ygprP2P+KRNXcjNSuXqmF46n4tS0ptFRuIOSHUisq5P6jwhe874waj3REJSsy+Wyg9wPfI
	WiM1oWRpwLMcBSkcMDVj96mH1wmljGXehELrwyalkHBw9LiDX1SBjDzPFWUd+cdfGXrT/Nq0QSV
	pwdO6TyJ+XN9w/w0bP+mTK0aPwFIEQ8MRVV5i4CiDzowkatb+jnOinHR42iK7ThHBXWArSpHP58
	ODTd14MaLHvB+qa7/FjuRs2CjFrvl+b9M7SpOGNVV/x0aCvCJJDfbOZzwIE89rQ==
X-Google-Smtp-Source: AGHT+IGwY9jIMPJ90CPurBltGhpKkPD/DxKhMFNBOPrVnCrSlvTfBsiZeKT9VBA8RusBsKSwEQnpLw==
X-Received: by 2002:a05:620a:2549:b0:7e3:2e12:19ce with SMTP id af79cd13be357-7e63bf519bfmr163197585a.26.1753444626135;
        Fri, 25 Jul 2025 04:57:06 -0700 (PDT)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com. [209.85.160.181])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e632d73715sm245884685a.33.2025.07.25.04.57.05
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 04:57:06 -0700 (PDT)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4ab8403b6daso20714841cf.2
        for <linux-sound@vger.kernel.org>; Fri, 25 Jul 2025 04:57:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVvDOF5d6uGScoY/m0n3LpnCf5qtWZfnX0l3faVatDVWs3V/POlEypRsEJ0PyZwQmd+tlkJfytSDVrgzQ==@vger.kernel.org
X-Received: by 2002:a05:6102:cce:b0:4e6:4e64:baeb with SMTP id
 ada2fe7eead31-4fa3ff55fbamr323634137.17.1753441040390; Fri, 25 Jul 2025
 03:57:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-18-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-18-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 25 Jul 2025 18:56:44 +0800
X-Gmail-Original-Message-ID: <CAC=S1nh5bF6kZe7TFA_EGPGt8Xp_rfuc-rkeXgjRCU=QEtZQiw@mail.gmail.com>
X-Gm-Features: Ac12FXw-hSTS0fHSbHXeHNK-nhzfyTLOXfpWf3gYQQXz8LA0IhEjugCIp682sPw
Message-ID: <CAC=S1nh5bF6kZe7TFA_EGPGt8Xp_rfuc-rkeXgjRCU=QEtZQiw@mail.gmail.com>
Subject: Re: [PATCH 17/38] arm64: dts: mediatek: mt6797: Fix pinctrl node names
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

On Thu, Jul 24, 2025 at 5:48=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Change the pinctrl node names to adhere to the binding: the main
> nodes are now named like "uart0-pins" and the children "pins-bus".
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

> ---
>  arch/arm64/boot/dts/mediatek/mt6797.dtsi | 40 ++++++++++++------------
>  1 file changed, 20 insertions(+), 20 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt6797.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt6797.dtsi
> index 0e9d11b4585b..be401617dfd8 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6797.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
> @@ -135,71 +135,71 @@ pio: pinctrl@10005000 {
>                 gpio-controller;
>                 #gpio-cells =3D <2>;
>
> -               uart0_pins_a: uart0 {
> -                       pins0 {
> +               uart0_pins_a: uart0-pins {
> +                       pins-bus {
>                                 pinmux =3D <MT6797_GPIO234__FUNC_UTXD0>,
>                                          <MT6797_GPIO235__FUNC_URXD0>;
>                         };
>                 };
>
> -               uart1_pins_a: uart1 {
> -                       pins1 {
> +               uart1_pins_a: uart1-pins {
> +                       pins-bus {
>                                 pinmux =3D <MT6797_GPIO232__FUNC_URXD1>,
>                                          <MT6797_GPIO233__FUNC_UTXD1>;
>                         };
>                 };
>
> -               i2c0_pins_a: i2c0 {
> -                       pins0 {
> +               i2c0_pins_a: i2c0-pins {
> +                       pins-bus {
>                                 pinmux =3D <MT6797_GPIO37__FUNC_SCL0_0>,
>                                          <MT6797_GPIO38__FUNC_SDA0_0>;
>                         };
>                 };
>
> -               i2c1_pins_a: i2c1 {
> -                       pins1 {
> +               i2c1_pins_a: i2c1-pins {
> +                       pins-bus {
>                                 pinmux =3D <MT6797_GPIO55__FUNC_SCL1_0>,
>                                          <MT6797_GPIO56__FUNC_SDA1_0>;
>                         };
>                 };
>
> -               i2c2_pins_a: i2c2 {
> -                       pins2 {
> +               i2c2_pins_a: i2c2-pins {
> +                       pins-bus {
>                                 pinmux =3D <MT6797_GPIO96__FUNC_SCL2_0>,
>                                          <MT6797_GPIO95__FUNC_SDA2_0>;
>                         };
>                 };
>
> -               i2c3_pins_a: i2c3 {
> -                       pins3 {
> +               i2c3_pins_a: i2c3-pins {
> +                       pins-bus {
>                                 pinmux =3D <MT6797_GPIO75__FUNC_SDA3_0>,
>                                          <MT6797_GPIO74__FUNC_SCL3_0>;
>                         };
>                 };
>
> -               i2c4_pins_a: i2c4 {
> -                       pins4 {
> +               i2c4_pins_a: i2c4-pins {
> +                       pins-bus {
>                                 pinmux =3D <MT6797_GPIO238__FUNC_SDA4_0>,
>                                          <MT6797_GPIO239__FUNC_SCL4_0>;
>                         };
>                 };
>
> -               i2c5_pins_a: i2c5 {
> -                       pins5 {
> +               i2c5_pins_a: i2c5-pins {
> +                       pins-bus {
>                                 pinmux =3D <MT6797_GPIO240__FUNC_SDA5_0>,
>                                          <MT6797_GPIO241__FUNC_SCL5_0>;
>                         };
>                 };
>
> -               i2c6_pins_a: i2c6 {
> -                       pins6 {
> +               i2c6_pins_a: i2c6-pins {
> +                       pins-bus {
>                                 pinmux =3D <MT6797_GPIO152__FUNC_SDA6_0>,
>                                          <MT6797_GPIO151__FUNC_SCL6_0>;
>                         };
>                 };
>
> -               i2c7_pins_a: i2c7 {
> -                       pins7 {
> +               i2c7_pins_a: i2c7-pins {
> +                       pins-bus {
>                                 pinmux =3D <MT6797_GPIO154__FUNC_SDA7_0>,
>                                          <MT6797_GPIO153__FUNC_SCL7_0>;
>                         };
> --
> 2.50.1
>
>
