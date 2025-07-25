Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A6F2D374E
	for <linux-sound@vger.kernel.org>; Fri, 25 Jul 2025 11:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753443864; cv=none; b=kTn1wxxy48YAB9XWa84ok8T5t9cviHZrkVZAWm/WyhApCSCdYwUg+ZoHvYhQnT+g4aHadUjit4ehguuqHj0C2CNsQXjDwmj+WZwaFwVh6D0NOE/nf6pi6NN284SWBSuJHX7ABbPcMeQaeB8d4LOIxhWD7KZEdxJIJ7JjLvDKhoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753443864; c=relaxed/simple;
	bh=KqH01V/ZQOGZhBJpHb3zgphhQB1Sh25Ttt4gkVmURXc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RSwu0W7Vu91voLHvCxnkQ7++Ai4oaQASvXsu/tvgYhDOvxRCEGb3DSNej8b4/+GGfoTpFSjlncnDbCDzT7P7atW3glu5er7PvmIMEiooTVGD3gf1l/wPCvUGgcOQzAAeKqXPO6xc42RA/DYdCKR38yzhdjLxThn/hrQTA5Ij3Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=k3ildTVq; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="k3ildTVq"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-2ea6dd628a7so1051600fac.1
        for <linux-sound@vger.kernel.org>; Fri, 25 Jul 2025 04:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753443861; x=1754048661; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YfE909p8Iq119G3J/2SxiBSXlMMdz4SFa3hpgANK2k8=;
        b=k3ildTVqb3IULjHOyGV9Uw+jhHp784Yhdr03s28T4kYU9v/SVtbux7diiCdmWU7/7Z
         slOgSTBU5qToCULCT9mAxc8fiDH4Vl8N3ISQPX375mgjf2lCe9y1qmur4PsPNOXe72wk
         Ctz91TBx8iALwva22FtjSLUdzMgImW9L9qG1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753443861; x=1754048661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YfE909p8Iq119G3J/2SxiBSXlMMdz4SFa3hpgANK2k8=;
        b=Mbg80Ff9Xo6yMfH4/bLaCFEh8wFclQXbi0hUO3EpPwQ6b6qMJfpnelpJJs2YneugIu
         LA2XrSJ0lqNG88lwOFPqhnzAL7xV2Ghtah7+dbBcoOib987yzvuadSPYW7bc0yccwdwj
         /ag1WNkJlXWYVOZtAQjJ1uOi595GdRKET6GjKUGTZ5lyp5Zag2m5jb1GocKFKganyY2D
         suhqliU8f22RhcuIt8TbvtXAJdOeZ+soQtmmEJI5Sq8CFZ96/hJdY5BHqMJ5jyH6Xvl2
         /FC7K1bq7pm6wkVLMPtIhgTgelJFtbphqcrSWUQfiPCkMr1d/FQ6X9c1sXoZyG1++ta7
         URrA==
X-Forwarded-Encrypted: i=1; AJvYcCUGWmd2F28rzSHVeV1K8gJ4vBZB0jI5SZVe+AwInqIW8+X6nWuOnDEhsUM6bnWs/LKzkVbgBIItbQa3LA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwChG61uCdnsqx7SDyVnj753PkkgtT6dZYTcuS+cEZpK16kt+UH
	aRQp7FidCzLoYX4rRBMxoyQBFnDlSaJJOHVrH59ZvhyamU+bktvx8KABUNaV2IPUREOYmICdAwu
	CebtX7w==
X-Gm-Gg: ASbGnctUKJNPLruw6oUqdPjbR1NsF8qRZ6yqE7OOmHvKFVoddJTlfscMSFh5jhOrN/b
	7DZIGANAY2eGe8hrijGchhG3RDO2+t1x/qQo6+lzeg7Itc+YBWdzwywENb4jzrl6hZDjNGuRRr0
	UUhog3tpBtsEQw07yJ+lG53xuzHG8GqzHZk8g2RM7ZabaAW6TRCvxkgUtBIiweTHgGYxCG8XUkC
	TdnPHiBtFMmgH9ArXjQPrKdUIr9KmlIC6RznlNRySGVovycCExZVgHTAugBF8fauXOuudLzXXTv
	1Mt8ooTwAk8N+kTWL2wlgikEo7wLZmRr7ViHezvc231F6tNK8quX4TJ8qwKzqSkHIQ0hYYfgnJx
	V88EVi9eAngysYTBXOcljTq3KA5neWhrUz290hZYVr4/pdSmzrD0m7DKCIZZOVw==
X-Google-Smtp-Source: AGHT+IGLI9nc3yeTw3HWmenePwOoMbIzX2EOVa9lzot/YgHXvvaWXHx+bwehB0zf4hTSKUWlu1IL0A==
X-Received: by 2002:a05:6871:39c7:b0:306:c0b8:49f1 with SMTP id 586e51a60fabf-30701f098f0mr932945fac.19.1753443861510;
        Fri, 25 Jul 2025 04:44:21 -0700 (PDT)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com. [209.85.167.169])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-306e1f7b1b1sm1026176fac.41.2025.07.25.04.44.20
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 04:44:21 -0700 (PDT)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-41b7d124016so1031311b6e.1
        for <linux-sound@vger.kernel.org>; Fri, 25 Jul 2025 04:44:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVfwXsnNJ9EDO9d1+04Nm6w86hFRcC3SFU5l7/EXWUJcu737sQmdDjjT3AtAVTtgVrnZDJMjmdezyNW0g==@vger.kernel.org
X-Received: by 2002:a05:6102:3713:b0:4e9:b7e3:bdcd with SMTP id
 ada2fe7eead31-4fa3fad468amr285963137.12.1753440273293; Fri, 25 Jul 2025
 03:44:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-24-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-24-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 25 Jul 2025 18:43:57 +0800
X-Gmail-Original-Message-ID: <CAC=S1njhu11nHpyMULbK6PE-BLrBMq+d397pDU6gBzgo7xivXg@mail.gmail.com>
X-Gm-Features: Ac12FXyc7RkTIKa4HnSlf_SM-GYdwIREUn6AcAkOBKhNuekdCdvFzy29o7Ufs68
Message-ID: <CAC=S1njhu11nHpyMULbK6PE-BLrBMq+d397pDU6gBzgo7xivXg@mail.gmail.com>
Subject: Re: [PATCH 23/38] arm64: dts: mediatek: mt7986a: Fix PCI-Express
 T-PHY node address
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
> The PCIe TPHY is under the soc bus, which provides MMIO, and all
> nodes under that must use the bus, otherwise those would clearly
> be out of place.
>
> Add ranges to the PCIe tphy and assign the address to the main
> node to silence a dtbs_check warning, and fix the children to
> use the MMIO range of t-phy.
>
> Fixes: 963c3b0c47ec ("arm64: dts: mediatek: fix t-phy unit name")
> Fixes: 918aed7abd2d ("arm64: dts: mt7986: add pcie related device nodes")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

> ---
>  arch/arm64/boot/dts/mediatek/mt7986a.dtsi | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/=
dts/mediatek/mt7986a.dtsi
> index 559990dcd1d1..3211905b6f86 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> @@ -428,16 +428,16 @@ pcie_intc: interrupt-controller {
>                         };
>                 };
>
> -               pcie_phy: t-phy {
> +               pcie_phy: t-phy@11c00000 {
>                         compatible =3D "mediatek,mt7986-tphy",
>                                      "mediatek,generic-tphy-v2";
> -                       ranges;
> -                       #address-cells =3D <2>;
> -                       #size-cells =3D <2>;
> +                       ranges =3D <0 0 0x11c00000 0x20000>;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
>                         status =3D "disabled";
>
> -                       pcie_port: pcie-phy@11c00000 {
> -                               reg =3D <0 0x11c00000 0 0x20000>;
> +                       pcie_port: pcie-phy@0 {
> +                               reg =3D <0 0x20000>;
>                                 clocks =3D <&clk40m>;
>                                 clock-names =3D "ref";
>                                 #phy-cells =3D <1>;
> --
> 2.50.1
>
>
