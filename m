Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B77C210F4A
	for <linux-sound@vger.kernel.org>; Fri, 25 Jul 2025 12:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753445841; cv=none; b=F1zaz+PLKU4qxwlPGRFtbCOIYLwWCrTBu71+wmFWI9KaJRW0J1nnH3wjNCYlYd46Ewz486LhIausCBddDfXpfaBFm11XqJJ6d53OEvqqXLFIP89o9kiDWNtlGKtZ6zBqB5o3hGOtds5JV5o7jn6QD8FJVbg34Q+AriLmUAIuFDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753445841; c=relaxed/simple;
	bh=IU7jvnAwzmp5GuJHgplXAk58lqyd9tH4hjc214tIw4o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XnPfeXwNhE+VicDaWIIOWnlxsWgZHT2G1gm2pLmP9aMIyHf/bidlSspxHlYjtET734AF+GodGDjXRd/nVJFA2XYxGfAnagWB/6iYbFQXTwFuGsRC2RVICL9Bj3dtMSw0k/5mZIjN+vNM5bhSDonVQSTa+S8FUd9d5lJu6MhJq28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LyvqPpkm; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LyvqPpkm"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-70e5d953c0bso25273897b3.1
        for <linux-sound@vger.kernel.org>; Fri, 25 Jul 2025 05:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753445838; x=1754050638; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=liSvRWA4OuPhKZFuMFSYIULFcTNts/JUeGi4znSdmNM=;
        b=LyvqPpkmkBZPg1ata+McoJawh+91q8TmqDo6kcY4tnalXLVXJIFgHVcx3uxMeHJtzw
         u2A+9CCR+yjlzr2cvhf1jEB8y140lDeGCqcd6TfNbBDg9ojGrg/L9/L6DjJzQ0rem2FN
         DkE4P9eotHtTgzpsg+fURHKRV2v66EE5cNUuY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753445838; x=1754050638;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=liSvRWA4OuPhKZFuMFSYIULFcTNts/JUeGi4znSdmNM=;
        b=ZeM06NTwE+iZG6518VLw2BY3q0wHTWXEX5H4XeXHNhIDGWkEL4wyotGvrFCYyrMXdJ
         QfLxGRHePKsAGjSR5jclpsW9bLKvavCHgcQ3MWf/bTC7YqVAV/VPR2ueVQr4+YCkKmQ1
         NIQpTjpijgeId5TENNBOEc38iJtcS6LqUwA0hs1Kz11TJ4VZSmtaAZ47tMl2a8GYhGr5
         jbIAQmef69xKuWar/nxvQQZogkGV9u12OY/IveRKT+QuTY5Oh9+ek8LDOTef/OzpQSAv
         1ZjJ/59w6tHcyUd3LdJG0AeZ7pukF8aolaQM3Hwn50oW1Vt4mT7G0+it72x+ancwafna
         UZwg==
X-Forwarded-Encrypted: i=1; AJvYcCVXbRTwVkPOCrx3L1EyfHO6AGgMMw+Gq3ZFvUvKdQLsP/IsuKM99WcD8Ohiw+CrR8LEBSnFCLlN2fjBBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YytLpL66zul3gZAJvmcjk06J4j4AdJYDgYj7QIcpfi0apENaHrB
	bFJ+GM1uauNCI35vO7v6kRXMVaxGk7vZPDb4S9DgxO5HHIshD4j/RfJDJjsVdakKoU6i9YI855B
	WJS0=
X-Gm-Gg: ASbGncvMpJOWIEuKk16mYY40JlzmRc/FjNOdwuO9xySo90O6BM+GDMyIipFxu51TJKG
	134TCU8rc9Ec0M9vlTzW6Ukm8aOJNPgiqcDe3+yKyadt0Yo40wNbPKgel9i5pIhQhK2vJcCCxie
	9MxGJT+ed8MFiN2g+CV/qMIvL0eh/3PmCIPUq2r3og15QwPuto49IYSkZXEosYxraMJ2hZBZmWA
	YkdVrId7MH0i52+Y1sP88lnaEBEw61e3Cko+6CDDffWFuVKQj5uTaLCvmu8c6QoYKZZUwPRy2dw
	fbVhkHGX6/AipTftjNM+kXfG+gsLoomUcfRy/Nwd7m6np5mFAPsQJ3mqa/BH+8q0xGJxl+GyVjl
	z9bEgmv3ZO7GGAOigUfAo5KnTONtOzg8GPBS121XyqVinN3h8uPae/8eJ8QsrE2xc+vFCmMGX
X-Google-Smtp-Source: AGHT+IEPBoegCmzh1cQaEcYfwY+qCyJMdmEtv5kAEc5TG9nzl59JrpXdfcPbLvEKwaDq4A7rZOQSnw==
X-Received: by 2002:a05:690c:4d43:b0:710:f39f:a2bc with SMTP id 00721157ae682-719e3568ab0mr23179197b3.8.1753445838123;
        Fri, 25 Jul 2025 05:17:18 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-719cb81bf53sm8271827b3.43.2025.07.25.05.17.17
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 05:17:18 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e8defed8130so338454276.1
        for <linux-sound@vger.kernel.org>; Fri, 25 Jul 2025 05:17:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVS7q2ba0XXOb1qYWDQYsMi38VtzjLppzOG8OnJ2u7PYQk6YPPD5hP6Hv6ws+5Aj6j0UpQDMOkAMjLTKg==@vger.kernel.org
X-Received: by 2002:a05:6102:6891:b0:4dd:b82d:e0de with SMTP id
 ada2fe7eead31-4fa3ff44195mr308667137.17.1753440019738; Fri, 25 Jul 2025
 03:40:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-38-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-38-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 25 Jul 2025 18:39:43 +0800
X-Gmail-Original-Message-ID: <CAC=S1njv7qrL0LyhZsp=HVdxxDo2bA7FbCkMVqJ9R9qpg-0hMw@mail.gmail.com>
X-Gm-Features: Ac12FXzAeqGgOrEJjRR1J4ryO0U3L8RJWv4_H_TyT4RYPsIpmGY3ViSbTr41uno
Message-ID: <CAC=S1njv7qrL0LyhZsp=HVdxxDo2bA7FbCkMVqJ9R9qpg-0hMw@mail.gmail.com>
Subject: Re: [PATCH 37/38] arm64: dts: mediatek: mt8395-kontron-i1200: Fix
 MT6360 regulator nodes
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

On Thu, Jul 24, 2025 at 5:51=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> All of the MT6360 regulator nodes were wrong and would not probe
> because the regulator names are supposed to be lower case, but
> they are upper case in this devicetree.
>
> Change all nodes to be lower case to get working regulators.
>
> Fixes: 94aaf79a6af5 ("arm64: dts: mediatek: add Kontron 3.5"-SBC-i1200")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

> ---
>  .../mediatek/mt8395-kontron-3-5-sbc-i1200.dts    | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dt=
s b/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts
> index 4985b65925a9..d16f545cbbb2 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts
> @@ -352,7 +352,7 @@ regulator {
>                         LDO_VIN2-supply =3D <&vsys>;
>                         LDO_VIN3-supply =3D <&vsys>;
>
> -                       mt6360_buck1: BUCK1 {
> +                       mt6360_buck1: buck1 {
>                                 regulator-name =3D "emi_vdd2";
>                                 regulator-min-microvolt =3D <600000>;
>                                 regulator-max-microvolt =3D <1800000>;
> @@ -362,7 +362,7 @@ MT6360_OPMODE_LP
>                                 regulator-always-on;
>                         };
>
> -                       mt6360_buck2: BUCK2 {
> +                       mt6360_buck2: buck2 {
>                                 regulator-name =3D "emi_vddq";
>                                 regulator-min-microvolt =3D <300000>;
>                                 regulator-max-microvolt =3D <1300000>;
> @@ -372,7 +372,7 @@ MT6360_OPMODE_LP
>                                 regulator-always-on;
>                         };
>
> -                       mt6360_ldo1: LDO1 {
> +                       mt6360_ldo1: ldo1 {
>                                 regulator-name =3D "mt6360_ldo1"; /* Test=
 point */
>                                 regulator-min-microvolt =3D <1200000>;
>                                 regulator-max-microvolt =3D <3600000>;
> @@ -380,7 +380,7 @@ mt6360_ldo1: LDO1 {
>                                                            MT6360_OPMODE_=
LP>;
>                         };
>
> -                       mt6360_ldo2: LDO2 {
> +                       mt6360_ldo2: ldo2 {
>                                 regulator-name =3D "panel1_p1v8";
>                                 regulator-min-microvolt =3D <1800000>;
>                                 regulator-max-microvolt =3D <1800000>;
> @@ -388,7 +388,7 @@ mt6360_ldo2: LDO2 {
>                                                            MT6360_OPMODE_=
LP>;
>                         };
>
> -                       mt6360_ldo3: LDO3 {
> +                       mt6360_ldo3: ldo3 {
>                                 regulator-name =3D "vmc_pmu";
>                                 regulator-min-microvolt =3D <1800000>;
>                                 regulator-max-microvolt =3D <3300000>;
> @@ -396,7 +396,7 @@ mt6360_ldo3: LDO3 {
>                                                            MT6360_OPMODE_=
LP>;
>                         };
>
> -                       mt6360_ldo5: LDO5 {
> +                       mt6360_ldo5: ldo5 {
>                                 regulator-name =3D "vmch_pmu";
>                                 regulator-min-microvolt =3D <3300000>;
>                                 regulator-max-microvolt =3D <3300000>;
> @@ -404,7 +404,7 @@ mt6360_ldo5: LDO5 {
>                                                            MT6360_OPMODE_=
LP>;
>                         };
>
> -                       mt6360_ldo6: LDO6 {
> +                       mt6360_ldo6: ldo6 {
>                                 regulator-name =3D "mt6360_ldo6"; /* Test=
 point */
>                                 regulator-min-microvolt =3D <500000>;
>                                 regulator-max-microvolt =3D <2100000>;
> @@ -412,7 +412,7 @@ mt6360_ldo6: LDO6 {
>                                                            MT6360_OPMODE_=
LP>;
>                         };
>
> -                       mt6360_ldo7: LDO7 {
> +                       mt6360_ldo7: ldo7 {
>                                 regulator-name =3D "emi_vmddr_en";
>                                 regulator-min-microvolt =3D <1800000>;
>                                 regulator-max-microvolt =3D <1800000>;
> --
> 2.50.1
>
>
