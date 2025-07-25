Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BB62DE71E
	for <linux-sound@vger.kernel.org>; Fri, 25 Jul 2025 10:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753439981; cv=none; b=DkQiWNoCRTNedGqRJ6US4MrQoTbdiLLTGQBCTcjfK1BLA494cWBmqB5GnaEFhoatX5EhNBKn/7S8uDho95UJPkgxQ+UQ5Af7j38wKbHEz5TRwlyPLG/oYf9uxqcS1b3o8mWPKgrRAWBmoodNyXKTWY7BESJ+iOf0BEUTQkhaUV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753439981; c=relaxed/simple;
	bh=yYEFudnuqhhtZ+sqQ+TFTlE2skKtiAAPYNG8FKAlAuU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Oey0HuTCkKOxx2jv4j3CtNkV4emXash3TjfGb3QsXz4FLPw9CLZumyigw2bs1yIU9jOVmzfWmYILiu8yraHsR9fHXn0UFsQkMtos7EDYiqUC7ui6L3CS2bD4sgxe0V1RfRIGLYwjEhzHAJBleNAHTCtVUMBqouGXHjAuRavMdsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nLp1iyB7; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nLp1iyB7"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6159466e80aso982305eaf.1
        for <linux-sound@vger.kernel.org>; Fri, 25 Jul 2025 03:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753439975; x=1754044775; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=29HDb0CStjqCTbdMTaT8ki881uLabi0viRhzF0Cw5Io=;
        b=nLp1iyB70lqrL+bv6DH28CWGfunqCu3pR9iYK2mMjym5AUTp8m4vikDBPWwixwf8Na
         NMUBctMFSFErwgWeWuCwRurKCqID2bOnLrjTuX1KX921nxiSOQMzJeKKR0kpWSbWGNEX
         FJrWLr0/47LcQ/bGeujxtr7lPEotZwYyPX43Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753439975; x=1754044775;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=29HDb0CStjqCTbdMTaT8ki881uLabi0viRhzF0Cw5Io=;
        b=fMSSKrwu8NmVmGb2ZMWFmI/6+1bccdt/loz8v2MRjqf8EnaRZ1XEYuZbM3vFa4fcit
         e9U+PkhTmGWYD7ed9fLhgl+XAV7qin8KHABjs85yFmTt/QudE6EVGPIJ7Ue+SNoYGrJa
         zfXO517M4TWOtHxLiZVnKBE+9nie2XRNszV9OhZKxCsTefii7P200o0xcAiV0sIUDNgk
         ga6kU0fYG/pRvfPplch+RXzowfJhZ7xSj/RP9A4VlMfKZoPCyuhijPiGhYhsgfFQiI1e
         FLbRjaELQhJHDeu6K4p3HI+i+zZJl42Gd9p2XnOeZuqrmuuPFq/l17SB+ZcPc+szfDCX
         LQXA==
X-Forwarded-Encrypted: i=1; AJvYcCVBDBkh25lXufr3h7+2SptvjZLIV2eliflJsBOa9We4Odo0vMWc4Jcpue5HL9E1NupFIQqsXXxnh1+zAw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm14u2z6ZmUeF5skcJDq4P3KazBDdhxsqzXetMOdD7p/MYb6km
	Qpbu7tIY+eyx2dy/lGqHyX2u01+qV6x7IUBgfcAnzmein8IEDJD9on3OsvKOU72YMBG3DNkLvjJ
	OmYnoRg==
X-Gm-Gg: ASbGncsipsOlrY61PBaO0TerY2Q5iB1E0DH/8NAsRcv7saWVGcEECaqwpZY/we2yREB
	zJieUF0M9NvB1FVhSuUV1fm/Z2Vd32B7hxcoDF+8+B7jId5TUork/xt++m0QkDDVKrxBspGqmZx
	cLpx99eHCtLyA/xq7b1Q3GIIlCmDbAo9bTM5w+WwXiJFnl+YzLbtKWrV3JyBJgAPq4wKxuQp3ZM
	io2Ae1DCkVCGchgg/HJsInXnMWhBCDdvimSxVC+lQme7yQJsiwY6NUJcG1vx+qChjXiG9KQp8uM
	7LFS/A8ssWAn3VRVB7tybiNHAFfA6dXcfv+L0lB4ADJrt8QNlVc6fAmTuqD2RTae63ddSNkjfrK
	ryT63OdjZIBy8WM+jizS1lFVFSkdEPm08c5iYjNIyfd7kUMMWpf9g7IDyNg==
X-Google-Smtp-Source: AGHT+IEqPl3dmog/IuAqSWbdkXuNsdV3PzGdaNpVOJJSdG901KcbA+kyCjv9UxdYCriEiropL/0Ugw==
X-Received: by 2002:a05:6871:380b:b0:2ea:7d72:23f7 with SMTP id 586e51a60fabf-30701ffd28cmr701090fac.16.1753439975027;
        Fri, 25 Jul 2025 03:39:35 -0700 (PDT)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com. [209.85.160.44])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-306e1f19be4sm997829fac.32.2025.07.25.03.39.34
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 03:39:34 -0700 (PDT)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-30194d82366so1173821fac.3
        for <linux-sound@vger.kernel.org>; Fri, 25 Jul 2025 03:39:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXTgYvI07agaQzF6vL2qM558Ltg2z93ZI92zXoaqE8QLFyyN4bZqXE95sXyzSVVaK42/Jom3xvHuLL5fg==@vger.kernel.org
X-Received: by 2002:a05:6102:5799:b0:4e5:ade7:eb7c with SMTP id
 ada2fe7eead31-4fa3fac29femr330925137.12.1753439652105; Fri, 25 Jul 2025
 03:34:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-35-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-35-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 25 Jul 2025 18:33:36 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhfg_qD044bO8EOV=MckoNVtJXQ47XBeDFMPwJ9goHg-A@mail.gmail.com>
X-Gm-Features: Ac12FXyYX3cOTb6n6096sUC59Z8DCV1ifB6_qbpW9gH46tmstAs2fiwwoJYhrGs
Message-ID: <CAC=S1nhfg_qD044bO8EOV=MckoNVtJXQ47XBeDFMPwJ9goHg-A@mail.gmail.com>
Subject: Re: [PATCH 34/38] arm64: dts: mediatek: mt8195: Fix ranges for jpeg
 enc/decoder nodes
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
> The jpeg decoder main node is under the soc bus but currently has
> no ranges or reg specified, while the children do, and this is
> wrong in multiple aspects.
>
> The very same is also valid for the jpeg encoder node.
>
> Rename the decoder and encoder nodes to "jpeg-decoder@1a040000"
> and to "jpeg-encoder@1a030000" respectively, and change their
> children to use the newly defined ranges.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Despite now jpeg-encoder isn't sorted in order, I guess we all agree
it's much easier to read in this way, so

Reviewed-by: Fei Shao <fshao@chromium.org>

> ---
>  arch/arm64/boot/dts/mediatek/mt8195.dtsi | 30 +++++++++++++-----------
>  1 file changed, 16 insertions(+), 14 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8195.dtsi
> index dd065b1bf94a..35b10082bb89 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -3014,7 +3014,7 @@ venc: video-codec@1a020000 {
>                         #size-cells =3D <2>;
>                 };
>
> -               jpgdec-master {
> +               jpeg-decoder@1a040000 {
>                         compatible =3D "mediatek,mt8195-jpgdec";
>                         power-domains =3D <&spm MT8195_POWER_DOMAIN_VDEC1=
>;
>                         iommus =3D <&iommu_vdo M4U_PORT_L19_JPGDEC_WDMA0>=
,
> @@ -3025,11 +3025,12 @@ jpgdec-master {
>                                  <&iommu_vdo M4U_PORT_L19_JPGDEC_BUFF_OFF=
SET0>;
>                         #address-cells =3D <2>;
>                         #size-cells =3D <2>;
> -                       ranges;
> +                       ranges =3D <0 0 0 0x1a040000 0 0x20000>,
> +                                <1 0 0 0x1b040000 0 0x10000>;
>
> -                       jpgdec@1a040000 {
> +                       jpgdec@0,0 {
>                                 compatible =3D "mediatek,mt8195-jpgdec-hw=
";
> -                               reg =3D <0 0x1a040000 0 0x10000>;/* JPGDE=
C_C0 */
> +                               reg =3D <0 0 0 0x10000>;/* JPGDEC_C0 */
>                                 iommus =3D <&iommu_vdo M4U_PORT_L19_JPGDE=
C_WDMA0>,
>                                          <&iommu_vdo M4U_PORT_L19_JPGDEC_=
BSDMA0>,
>                                          <&iommu_vdo M4U_PORT_L19_JPGDEC_=
WDMA1>,
> @@ -3042,9 +3043,9 @@ jpgdec@1a040000 {
>                                 power-domains =3D <&spm MT8195_POWER_DOMA=
IN_VDEC0>;
>                         };
>
> -                       jpgdec@1a050000 {
> +                       jpgdec@0,10000 {
>                                 compatible =3D "mediatek,mt8195-jpgdec-hw=
";
> -                               reg =3D <0 0x1a050000 0 0x10000>;/* JPGDE=
C_C1 */
> +                               reg =3D <0 0 0x10000 0x10000>;/* JPGDEC_C=
1 */
>                                 iommus =3D <&iommu_vdo M4U_PORT_L19_JPGDE=
C_WDMA0>,
>                                          <&iommu_vdo M4U_PORT_L19_JPGDEC_=
BSDMA0>,
>                                          <&iommu_vdo M4U_PORT_L19_JPGDEC_=
WDMA1>,
> @@ -3057,9 +3058,9 @@ jpgdec@1a050000 {
>                                 power-domains =3D <&spm MT8195_POWER_DOMA=
IN_VDEC1>;
>                         };
>
> -                       jpgdec@1b040000 {
> +                       jpgdec@1,0 {
>                                 compatible =3D "mediatek,mt8195-jpgdec-hw=
";
> -                               reg =3D <0 0x1b040000 0 0x10000>;/* JPGDE=
C_C2 */
> +                               reg =3D <1 0 0 0x10000>;/* JPGDEC_C2 */
>                                 iommus =3D <&iommu_vpp M4U_PORT_L20_JPGDE=
C_WDMA0>,
>                                          <&iommu_vpp M4U_PORT_L20_JPGDEC_=
BSDMA0>,
>                                          <&iommu_vpp M4U_PORT_L20_JPGDEC_=
WDMA1>,
> @@ -3088,7 +3089,7 @@ vdosys0: syscon@1c01a000 {
>                 };
>
>
> -               jpgenc-master {
> +               jpeg-encoder@1a030000 {
>                         compatible =3D "mediatek,mt8195-jpgenc";
>                         power-domains =3D <&spm MT8195_POWER_DOMAIN_VENC_=
CORE1>;
>                         iommus =3D <&iommu_vpp M4U_PORT_L20_JPGENC_Y_RDMA=
>,
> @@ -3097,11 +3098,12 @@ jpgenc-master {
>                                         <&iommu_vpp M4U_PORT_L20_JPGENC_B=
SDMA>;
>                         #address-cells =3D <2>;
>                         #size-cells =3D <2>;
> -                       ranges;
> +                       ranges =3D <0 0 0 0x1a030000 0 0x10000>,
> +                                <1 0 0 0x1b030000 0 0x10000>;
>
> -                       jpgenc@1a030000 {
> +                       jpgenc@0,0 {
>                                 compatible =3D "mediatek,mt8195-jpgenc-hw=
";
> -                               reg =3D <0 0x1a030000 0 0x10000>;
> +                               reg =3D <0 0 0 0x10000>;
>                                 iommus =3D <&iommu_vdo M4U_PORT_L19_JPGEN=
C_Y_RDMA>,
>                                                 <&iommu_vdo M4U_PORT_L19_=
JPGENC_C_RDMA>,
>                                                 <&iommu_vdo M4U_PORT_L19_=
JPGENC_Q_TABLE>,
> @@ -3112,9 +3114,9 @@ jpgenc@1a030000 {
>                                 power-domains =3D <&spm MT8195_POWER_DOMA=
IN_VENC>;
>                         };
>
> -                       jpgenc@1b030000 {
> +                       jpgenc@1,0 {
>                                 compatible =3D "mediatek,mt8195-jpgenc-hw=
";
> -                               reg =3D <0 0x1b030000 0 0x10000>;
> +                               reg =3D <1 0 0 0x10000>;
>                                 iommus =3D <&iommu_vpp M4U_PORT_L20_JPGEN=
C_Y_RDMA>,
>                                                 <&iommu_vpp M4U_PORT_L20_=
JPGENC_C_RDMA>,
>                                                 <&iommu_vpp M4U_PORT_L20_=
JPGENC_Q_TABLE>,
> --
> 2.50.1
>
>
