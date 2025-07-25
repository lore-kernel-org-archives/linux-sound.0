Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E023D994
	for <linux-sound@vger.kernel.org>; Fri, 25 Jul 2025 12:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753445026; cv=none; b=XWUd8f9edo7NhV+48MAVTaJ3i/98fhpQD4gTlbGi31mzldBbegB3gX1e9LKHD0bgb8mxfUdC8fTcL5d4vYzl6Rzn7PbzxOT3fwxmGjoEohGjSDl84TUKSGBnPcsEd6HmwRjno1ne9J0FFBUy2PRwTgy7qC+B89wfptc8OMY8Fgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753445026; c=relaxed/simple;
	bh=/FWxLS8hqus1+HRqR+NgfMdxvAEHUA0sDpoYtqNCdMg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MkhFIW/tLYRdXY8pFj+lwO2OOOZ5TSCXKgejaN0RouMnVfR87reDOxWmH5/F37kqyospdEn/ZuX78qnP6KyoKRWlridY6jTAmTlp1LIiY1BTkhz1OLZNM7mEMfdRN54uiqVo1PeavCQgMaY/ZSbxEoRyiJbdvqULnVaX1/VrNYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=a3QL2TaX; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="a3QL2TaX"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-41b7d12401bso1265503b6e.1
        for <linux-sound@vger.kernel.org>; Fri, 25 Jul 2025 05:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753445023; x=1754049823; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6mqK1RSBPE9C31GyE2vJbWJ8NDfAV+1bNXjXR8+rtBo=;
        b=a3QL2TaXd+CI2y5Evplyu/8cdk84z58a+T581u4PzqM+0bv4ouY2/AYXx4uWpg4O3H
         Y1YJy+0r1YCP+omTskvjVGFw5ZGbAW7m5hzPzcptEXReFg+QLOME/ybKcwgpZrkGj6Xu
         K89iF0QUSh3srHulgIZukX+AeojwBGOBvXn9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753445023; x=1754049823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6mqK1RSBPE9C31GyE2vJbWJ8NDfAV+1bNXjXR8+rtBo=;
        b=JklaWiLpPY0sQQyU3fdbwXUeJSuWrEGu5NO8rsjp1z7fVSQKNJNKa26Vz5ECskkY29
         HAeeVwnjn8DkidNezED9Mmi5q+MZJGwdABV3sE6luGDnEcwNxhNZ81nf2Wgo+/tcMJpF
         RfA96hqJlVVtK1HgqkNMKMI6UDxLncOt9S7SO3DPFIGeRB1lELcsVbJvinrgidKD/bam
         qBlzAdReF5MBArrIdEitl3LX21vtdAHHy9s+KpstD2RnA4Dz0skxIEks7GV3IwnXLbb8
         eyr0p1O0VzkEs6uMjR6nXnkCFYmEsp4b8y/kBnGb6xHrbg13G9Squ+wlCERx1Ue+p2CL
         j6zA==
X-Forwarded-Encrypted: i=1; AJvYcCX2JITNgG6ShWGi2+Gqy2VxdDehZTbPWYhm5m0uqoFuC3yimWO8wTevPdBoyjYhKO7rIMqihGu3Q/NQKg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7zY5Ef+xSVRZADPc+sVpwZJZv5GusYP8btEDrdZCrnEF8530z
	paIKl0sBoM9Fcif3TQaA6nvZlLCi0CA51tgYxzl48XvxyfOYiJ5ZU3JM6LGuOBf5d4V0HmQEl+Z
	F6EY=
X-Gm-Gg: ASbGnctEwzqDcbifXJKRMQ5SVWdu/TvtOYVjyGTm+086PnfAUXkt2CjKh+3M/Pr7urV
	AqyL39T5repE5moDByGifyELq4fc6O3zbtSr5cGAJGZa6AE03fNGl5W1axSVkXEtkZdwC6bArpu
	adfO2DsQKOq0EZkFSYvLRoAGBK4Gj3rlVXCCEdMLx3ffvYKKF4sQvLsYH4ZEe5QsxNOLrxyEvLI
	TZBnDg3pF6KVvne2nZSsj5+mIqZ5b5IYPCw8c8w1gsu5XAgp4zADeiYpRfYAGH45JsRzrVn6AY8
	afKI02aliEDxk77oRW3HKVEQJTx4Wx+VlZhLWrwDkh4y4cciPcGZuZn/rfubAz32PaWg9E536+D
	e5tvB2OPdmSxRb/0IYPXhjEOT3JP0QOSsTJ3FPHMfib33i/q4CVI9F/CWdA==
X-Google-Smtp-Source: AGHT+IGrLWroKBd2lf0AEbmd9prX5lqImcfl50mW+0s57rkGXwUQxClGGIkAW1BFl13WgBxEy/nPDQ==
X-Received: by 2002:a05:6808:4fcd:b0:40a:52e5:37d3 with SMTP id 5614622812f47-42bb70fad8cmr547527b6e.3.1753445022687;
        Fri, 25 Jul 2025 05:03:42 -0700 (PDT)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com. [209.85.210.41])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-42a3059e891sm602041b6e.8.2025.07.25.05.03.42
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 05:03:42 -0700 (PDT)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-73e88bc3796so816428a34.0
        for <linux-sound@vger.kernel.org>; Fri, 25 Jul 2025 05:03:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW3WxOhHJVy0IQfjC9jIEQRMuyWDbw3VbnYMbS6q4Y8Are75zilrYHCE1OKXZLxehLJTISWNcErHoz/5A==@vger.kernel.org
X-Received: by 2002:a05:6102:5a92:b0:4eb:502c:569a with SMTP id
 ada2fe7eead31-4fa3fb3f3f9mr285813137.9.1753440864290; Fri, 25 Jul 2025
 03:54:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-19-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-19-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 25 Jul 2025 18:53:47 +0800
X-Gmail-Original-Message-ID: <CAC=S1njpbfARTSBwddCeeO+c0vvf=GVaD6+QhauJOki0NS9dTQ@mail.gmail.com>
X-Gm-Features: Ac12FXy3jzZS4uZ6X5J7uIwzpvgV1oXiUrEGuonvNPTbsP1Oacxt9m6NF-3FvZA
Message-ID: <CAC=S1njpbfARTSBwddCeeO+c0vvf=GVaD6+QhauJOki0NS9dTQ@mail.gmail.com>
Subject: Re: [PATCH 18/38] arm64: dts: mediatek: mt6797: Remove bogus id
 property in i2c nodes
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
> All of the I2C nodes in this devicetree has a bogus "id" property,
> which was probably specifying the I2C bus number.
>
> This property was never parsed and never used - and besides, it
> also gives dtbs_check warnings: remove it from all i2c nodes.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

> ---
>  arch/arm64/boot/dts/mediatek/mt6797.dtsi | 10 ----------
>  1 file changed, 10 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt6797.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt6797.dtsi
> index be401617dfd8..f2d93bf6a055 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6797.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
> @@ -285,7 +285,6 @@ uart3: serial@11005000 {
>         i2c0: i2c@11007000 {
>                 compatible =3D "mediatek,mt6797-i2c",
>                              "mediatek,mt6577-i2c";
> -               id =3D <0>;
>                 reg =3D <0 0x11007000 0 0x1000>,
>                       <0 0x11000100 0 0x80>;
>                 interrupts =3D <GIC_SPI 84 IRQ_TYPE_LEVEL_LOW>;
> @@ -301,7 +300,6 @@ i2c0: i2c@11007000 {
>         i2c1: i2c@11008000 {
>                 compatible =3D "mediatek,mt6797-i2c",
>                              "mediatek,mt6577-i2c";
> -               id =3D <1>;
>                 reg =3D <0 0x11008000 0 0x1000>,
>                       <0 0x11000180 0 0x80>;
>                 interrupts =3D <GIC_SPI 85 IRQ_TYPE_LEVEL_LOW>;
> @@ -317,7 +315,6 @@ i2c1: i2c@11008000 {
>         i2c8: i2c@11009000 {
>                 compatible =3D "mediatek,mt6797-i2c",
>                              "mediatek,mt6577-i2c";
> -               id =3D <8>;
>                 reg =3D <0 0x11009000 0 0x1000>,
>                       <0 0x11000200 0 0x80>;
>                 interrupts =3D <GIC_SPI 86 IRQ_TYPE_LEVEL_LOW>;
> @@ -334,7 +331,6 @@ i2c8: i2c@11009000 {
>         i2c9: i2c@1100d000 {
>                 compatible =3D "mediatek,mt6797-i2c",
>                              "mediatek,mt6577-i2c";
> -               id =3D <9>;
>                 reg =3D <0 0x1100d000 0 0x1000>,
>                       <0 0x11000280 0 0x80>;
>                 interrupts =3D <GIC_SPI 87 IRQ_TYPE_LEVEL_LOW>;
> @@ -351,7 +347,6 @@ i2c9: i2c@1100d000 {
>         i2c6: i2c@1100e000 {
>                 compatible =3D "mediatek,mt6797-i2c",
>                              "mediatek,mt6577-i2c";
> -               id =3D <6>;
>                 reg =3D <0 0x1100e000 0 0x1000>,
>                       <0 0x11000500 0 0x80>;
>                 interrupts =3D <GIC_SPI 88 IRQ_TYPE_LEVEL_LOW>;
> @@ -367,7 +362,6 @@ i2c6: i2c@1100e000 {
>         i2c7: i2c@11010000 {
>                 compatible =3D "mediatek,mt6797-i2c",
>                              "mediatek,mt6577-i2c";
> -               id =3D <7>;
>                 reg =3D <0 0x11010000 0 0x1000>,
>                       <0 0x11000580 0 0x80>;
>                 interrupts =3D <GIC_SPI 89 IRQ_TYPE_LEVEL_LOW>;
> @@ -383,7 +377,6 @@ i2c7: i2c@11010000 {
>         i2c4: i2c@11011000 {
>                 compatible =3D "mediatek,mt6797-i2c",
>                              "mediatek,mt6577-i2c";
> -               id =3D <4>;
>                 reg =3D <0 0x11011000 0 0x1000>,
>                       <0 0x11000300 0 0x80>;
>                 interrupts =3D <GIC_SPI 90 IRQ_TYPE_LEVEL_LOW>;
> @@ -399,7 +392,6 @@ i2c4: i2c@11011000 {
>         i2c2: i2c@11013000 {
>                 compatible =3D "mediatek,mt6797-i2c",
>                              "mediatek,mt6577-i2c";
> -               id =3D <2>;
>                 reg =3D <0 0x11013000 0 0x1000>,
>                       <0 0x11000400 0 0x80>;
>                 interrupts =3D <GIC_SPI 95 IRQ_TYPE_LEVEL_LOW>;
> @@ -416,7 +408,6 @@ i2c2: i2c@11013000 {
>         i2c3: i2c@11014000 {
>                 compatible =3D "mediatek,mt6797-i2c",
>                              "mediatek,mt6577-i2c";
> -               id =3D <3>;
>                 reg =3D <0 0x11014000 0 0x1000>,
>                       <0 0x11000480 0 0x80>;
>                 interrupts =3D <GIC_SPI 96 IRQ_TYPE_LEVEL_LOW>;
> @@ -433,7 +424,6 @@ i2c3: i2c@11014000 {
>         i2c5: i2c@1101c000 {
>                 compatible =3D "mediatek,mt6797-i2c",
>                              "mediatek,mt6577-i2c";
> -               id =3D <5>;
>                 reg =3D <0 0x1101c000 0 0x1000>,
>                       <0 0x11000380 0 0x80>;
>                 interrupts =3D <GIC_SPI 83 IRQ_TYPE_LEVEL_LOW>;
> --
> 2.50.1
>
>
