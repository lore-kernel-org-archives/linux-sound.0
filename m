Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B22224225
	for <linux-sound@vger.kernel.org>; Fri, 25 Jul 2025 11:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753444743; cv=none; b=Z9wtd75wdkQCd4g1t1bPl+HuTqfCZbb2PBCUtnPsVqi9iewBIGLLKB65DQ8MUMpdeJz4f0+iFD8f3t5Oxtw/Ah13Mg9iMhP0jZ49MjzPrtOVOBSHQitVrA5BmKbe6sL2fvRtuAhQtKxUp6Z4Rq98GkDvHfZb94Wz3rSuaNnH5Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753444743; c=relaxed/simple;
	bh=7Lq+L8ybIKzJFE7aCP8K4OUgb0w5TEGi1D/8HV86VOI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mhV7QRPsZSDuTNzaFRPis7ZtSCSuRTEhU/xQ22sFTIgmhTg2dvo6lXV5MUUcPUEtvDVeWyfjQ4oudhHgzmCex5Oue0/KTASl4bD6D6jmdZqXbsDPHSTFL5etTGMzEf7U/+SqLxkq/8zspQgZytME3YiUD+9S+Ps/fgDq3A2nga0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mdb5I2wo; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mdb5I2wo"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6fac7147cb8so27130996d6.1
        for <linux-sound@vger.kernel.org>; Fri, 25 Jul 2025 04:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753444740; x=1754049540; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5hJBa13s79OQWhYLxMwSe1UwJVG9FUdchi7fOARwLxY=;
        b=mdb5I2wo5LEgAMIfy8n8mnIrgDUiG6x6ChjMmyHUR5YN8U1g+w94oSz6mQTE/oZZDX
         weXFTBPTC4WfC9NgU1sn9MGhTHnM+uglDVNgZ5p+OMXeAPI7Tr7NI2/4SxWDD477rhvF
         /csFE54BEAzASrIyOn4Zzz+wYJa7l+oyl1UDs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753444740; x=1754049540;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5hJBa13s79OQWhYLxMwSe1UwJVG9FUdchi7fOARwLxY=;
        b=UQ7ICJhCQPNnz4pqF1CUGNRRosljbuU1jVtFyoRd0flOLxKVzUmSWw498LcYwMoEip
         pIFAy6pCXH5c5UzCnTrM4fIEtV8tcFLgNjHhFIdeyTCMXyUmII5HOihOPv48WwXmre+0
         0vK4Kitnr7S6cNAhI2dEIlCihJ8OU2UquUg28jo9GFYBrwiVlx8py92eplI5z+3Oq0lt
         pNvRH7EAFk9Omm7JE1beedE+RI+pSka2YaCbdDmebsMohn9VqpJcrEv9tHpVgy5dSP/M
         EWWkO1tjAEbe9N4G80k5pJtviwt4zsy4QhrDdy2e/Ug8JOh4kVUvJJcZu6NRHQyKZ6D+
         UuYg==
X-Forwarded-Encrypted: i=1; AJvYcCW1zxWbF8WV6XbkEO6NTlI5gS4Vr1T10Z8l3EV1u6PWVCQZGGO45ExoqBbLZanYYtY+vQLbB5wqFotooA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTzq2Qzi/c5mrSOAmZUGRJmuH/vOV7dL1ZI9aCLuUfdQU7x6Hz
	JFRl7IBe0cAFEvJkXpXQiQpUN4CMpE0aBqRpznY9/mWFQ6FL+0q/FZ7zGSmbHSN16J9mdofab6s
	S6LM=
X-Gm-Gg: ASbGnctHvFfzLUBOQg5GwfcSPjSZwY+xP4ociAfvqd0uFNYHYShcIa20VA5Jcu7C3Tr
	vWx95j4c0h9U2oB6LVi0piF5OLoU8Y1toMyohwjUMirlz9UJjWJSn9GJ71O7FyKKA1x7/DB9oy0
	U7cH1b6O1ypy/ylA9FzxJpsl5xfKEg+do/zPMW/JloxGcIpOnuuSahbEnM9eSH11nLCiDMczLNM
	ZSJue2pdjA2w2ae6sXYwDFczTEtRoX/+x1/jQ1dsdKduSZPqFyTDeaRRtWftMP5SMcaXv+V2kJA
	wUE6um1ytuYqVK8DG3+tj1BIIe8K+jHj5xgJhPxkU0QsANOXx7WWgVR52mO+/m0hq1hdgIxEEqb
	KIZ/XoTQBkZdmG+CVqJo2WZMPNwDQL5/XOWOTIzOGw49czk2gwrSb8MNb3g==
X-Google-Smtp-Source: AGHT+IEwFRZ+G3V8wGSyfUEPfzvSDar6XH8vXZ0txW7kx/WCrYfSYg6aMrnRFIyexCVkVmngX8uSQA==
X-Received: by 2002:a05:6214:508b:b0:704:fa73:6141 with SMTP id 6a1803df08f44-707205e6861mr20586306d6.40.1753444740252;
        Fri, 25 Jul 2025 04:59:00 -0700 (PDT)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com. [209.85.219.48])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7070fb36aa0sm24959896d6.24.2025.07.25.04.59.00
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 04:59:00 -0700 (PDT)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-7072628404dso2141866d6.2
        for <linux-sound@vger.kernel.org>; Fri, 25 Jul 2025 04:59:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVf2kB54gw11X9BSByjIKc8vduHqwkH5e676v71xdsk+Mcy+fX37cl6qqcTLnqhmJgrcTZ+6xRZLE8OIw==@vger.kernel.org
X-Received: by 2002:a05:6102:6891:b0:4dd:b82d:e0de with SMTP id
 ada2fe7eead31-4fa3ff44195mr316348137.17.1753440787376; Fri, 25 Jul 2025
 03:53:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-20-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-20-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 25 Jul 2025 18:52:31 +0800
X-Gmail-Original-Message-ID: <CAC=S1nguRWyG3ubmSFE95_zgsCjjq4dxGWr5ErV9-Yu2+mTmpw@mail.gmail.com>
X-Gm-Features: Ac12FXzhNEGCOc6TL2wVpoG5kEXhC599YdNWu941VvXlO0dL7_W9Jc4if8EyMHA
Message-ID: <CAC=S1nguRWyG3ubmSFE95_zgsCjjq4dxGWr5ErV9-Yu2+mTmpw@mail.gmail.com>
Subject: Re: [PATCH 19/38] arm64: dts: mediatek: mt6795: Add mediatek,infracfg
 to iommu node
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

On Thu, Jul 24, 2025 at 5:49=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The "M4U" IOMMU requires a handle to the infracfg to switch to
> the 4gb/pae addressing mode: add it.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

> ---
>  arch/arm64/boot/dts/mediatek/mt6795.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt6795.dtsi
> index e5e269a660b1..38f65aad2802 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> @@ -427,6 +427,7 @@ iommu: iommu@10205000 {
>                         clocks =3D <&infracfg CLK_INFRA_M4U>;
>                         clock-names =3D "bclk";
>                         interrupts =3D <GIC_SPI 146 IRQ_TYPE_LEVEL_LOW>;
> +                       mediatek,infracfg =3D <&infracfg>;
>                         mediatek,larbs =3D <&larb0 &larb1 &larb2 &larb3>;
>                         power-domains =3D <&spm MT6795_POWER_DOMAIN_MM>;
>                         #iommu-cells =3D <1>;
> --
> 2.50.1
>
>
