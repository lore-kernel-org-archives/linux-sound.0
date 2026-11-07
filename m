Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794068021;
	b=DWuCwYlG+17iVuVAPBANBYUERylQDihdFmuj0MOv8E2Ky4/x6w1/tnPOGlJ+JOJSIM9Z
	 gn7g55Thn6ZyYpUCXojz4wZ8in6A9obYgnfOAqMB8eq6I/1yySO93mWztC3PobTxjSIat
	 6wavtHGX3x1oed0Ltp9pU4MWQnSNdGdqEVo0UweoSZTQ54ykxmaomukp7k2uAVReJMi+4
	 5IXp7t1hnH9kVNN0YLDXGsN1WK7N9D0iLi0pJ8Wwj+X2BRV1rPbpJFRSXirbaN3V8s1J2
	 n3XP62bVnuNuGELfxgVL59YzhJemFaXb6saS+nEsJsb1D9LmLdu5+9MAtFUbymmzy1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794068021;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=uY783uy1qr8sHfdP9kEjOufVSVKJHo8En8fQKYPWkDU=;
	b=1zhkdt+P38xdO2Kt32TOu0ATkRI9iuf5DuJ6SyZfN5aWWpGxHaSOp9fogrieUtBSzv6G
	 LmO9oxbFjOjVGwBnOxeFnZ0Zf9UnwixSZGDjzGlLkjAmbfZ6b1Cj3VAMKlcfhBKu//d+V
	 9/2mURWcvTJ6aYCEBbaLF0HLdlFlQ3RbKa1q4YioEt4Bpz94b8h+LP9aSAwNav/FeON2I
	 0LtJkGpDcs/9DgrcDXZq55sD5Tcw9lWy9vWHpm8o214QDMNJVwWympJanOuLEYOW0gHFy
	 A/BO3zzBeIpfn+/gDeXw1/4Jf3WPXL1QXhi4kaOVUbnpagA0Ys8qWXyLCzxSs+xrW8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Yedwbp/3";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05669606A32D
	for <linux-sound@vger.kernel.org>; Sat,  7 Nov 2026 16:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yedwbp/3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94DCE1F0089F;
	Sat,  7 Nov 2026 16:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794068020;
	bh=uY783uy1qr8sHfdP9kEjOufVSVKJHo8En8fQKYPWkDU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Yedwbp/3S+g7tkqMeN1F41hAVdTqqUBHFWYAxeQDzp0oYnmSgaGNVXtKbfbMyr5f3
	 Hsx84woC9kOJSby+tHmzMWRV4YVBM8aNvqyibDmF5FWwXP/BWZwtN4TZBFur9SGP1w
	 PP0FW0op2T0MdKgAA7CPaayoz6NdZBfNmtMefNOH3t7qnLjmowhCci5Ow0i9nJUewQ
	 QE9KX0WDZ6jv0foadrWSHXMb9AYjsILeLM24D+pICs6yxuRw2+GhxXh3473Oxsu96y
	 wisCuD7a6S/nrViqT4iiyJ+XlXGFO78begsKCq3gA1rRpQSmvByEipiCxKMYEuJVV2
	 DV8I/92OdnF5g==
Message-ID: <sashiko-outbox-203029@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 02/25] soundwire: amd: program pad SCHMEN and OE
 control for ACP 7.0/7.1/7.2
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vijendar Mukunda" <Vijendar.Mukunda@amd.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261107154659.3358223-3-Vijendar.Mukunda@amd.com>
References: <20261107154659.3358223-1-Vijendar.Mukunda@amd.com>
 <20261107154659.3358223-3-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 16:13:40 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Low] soundwire: amd: Fixes tag cites ACP 6.3 refactor instead of ACP
  7.x commits
- [Low] soundwire: amd: amd_enable_sdw_pads() writes pad registers
  before acp_rev check
--

commit feea96d1feca02ca2e3cb0b4f0b3f33fab424dca
Author: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

> soundwire: amd: program pad SCHMEN and OE control for ACP 7.0/7.1/7.2
>
> ACP 7.0/7.1/7.2 hardware requires SCHMEN control and
> output-enable (OE) registers to be programmed as part of the pad enable
> sequence, in addition to the existing keeper and pulldown writes.
>
> Update amd_enable_sdw_pads() to program ACP_PAD_SCHMEN_CTRL and
> ACP_PAD_DISABLE_OE_CTRL for active pads. Pass acp_rev to
> amd_enable_sdw_pads() and restrict these writes to ACP 7.0/7.1/7.2;
> ACP 6.3 is unaffected.
>
> Define per-register masks in amd_init.h replacing generic local defines
> in amd_init.c.
>
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> Fixes: cf0ddbc29dfa ("soundwire: amd: refactor soundwire pads enable")

[Severity: Low]
cf0ddbc29dfa ("soundwire: amd: refactor soundwire pads enable") only
supported ACP 6.3, which is unaffected by this change, and predates both
struct sdw_amd_res.acp_rev and the ACP 7.x definitions.  Should this cite
2c0ae8ef1e5e ("soundwire: amd: add support for ACP7.0 & ACP7.1 platforms")
and 34b1cb4ec286 ("soundwire: amd: Add support for acp7.2 platform")
instead so stable tooling does not attempt backports to ACP 6.3-only trees?

> diff --git a/drivers/soundwire/amd_init.c b/drivers/soundwire/amd_init.c
> index b4f45bdf3c171..032697ea35906 100644
> --- a/drivers/soundwire/amd_init.c
> +++ b/drivers/soundwire/amd_init.c
> @@ -16,37 +16,49 @@
> =20
>  #include "amd_init.h"
> =20
> -#define AMD_SDW0_PAD_CTRL_MASK				0x60
> -#define AMD_SDW1_PAD_CTRL_MASK				5
> -#define AMD_SDW_PAD_CTRL_MASK		(AMD_SDW0_PAD_CTRL_MASK | AMD_SDW1_PAD_CT=
RL_MASK)
> -#define AMD_SDW0_PAD_EN					1
> -#define AMD_SDW1_PAD_EN					0x10
> -#define AMD_SDW_PAD_EN			(AMD_SDW0_PAD_EN | AMD_SDW1_PAD_EN)
> -
> -static int amd_enable_sdw_pads(void __iomem *mmio, u32 link_mask, struct=
 device *dev)
> +static int amd_enable_sdw_pads(void __iomem *mmio, u32 link_mask, u32 ac=
p_rev, struct device *dev)
>  {
> -	u32 pad_keeper_en, pad_pulldown_ctrl_mask;
> +	u32 pad_keeper_mask, pad_pulldown_mask, pad_schmen_mask, pad_oe_mask;
> =20
>  	switch (link_mask) {
>  	case 1:
> -		pad_keeper_en =3D AMD_SDW0_PAD_EN;
> -		pad_pulldown_ctrl_mask =3D AMD_SDW0_PAD_CTRL_MASK;
> +		pad_keeper_mask =3D AMD_SDW0_PAD_KEEPER_EN_MASK;
> +		pad_pulldown_mask =3D AMD_SDW0_PAD_PULLDOWN_MASK;
> +		pad_schmen_mask =3D AMD_SDW0_PAD_SCHMEN_MASK;
> +		pad_oe_mask =3D AMD_SDW0_PAD_OE_CTRL_MASK;
>  		break;
>  	case 2:
> -		pad_keeper_en =3D AMD_SDW1_PAD_EN;
> -		pad_pulldown_ctrl_mask =3D AMD_SDW1_PAD_CTRL_MASK;
> +		pad_keeper_mask =3D AMD_SDW1_PAD_KEEPER_EN_MASK;
> +		pad_pulldown_mask =3D AMD_SDW1_PAD_PULLDOWN_MASK;
> +		pad_schmen_mask =3D AMD_SDW1_PAD_SCHMEN_MASK;
> +		pad_oe_mask =3D AMD_SDW1_PAD_OE_CTRL_MASK;
>  		break;
>  	case 3:
> -		pad_keeper_en =3D AMD_SDW_PAD_EN;
> -		pad_pulldown_ctrl_mask =3D AMD_SDW_PAD_CTRL_MASK;
> +		pad_keeper_mask =3D AMD_SDW_PAD_KEEPER_EN_MASK;
> +		pad_pulldown_mask =3D AMD_SDW_PAD_PULLDOWN_MASK;
> +		pad_schmen_mask =3D AMD_SDW_PAD_SCHMEN_MASK;
> +		pad_oe_mask =3D AMD_SDW_PAD_OE_CTRL_MASK;
>  		break;
>  	default:
>  		dev_err(dev, "No SDW Links are enabled\n");
>  		return -ENODEV;
>  	}
> =20
> -	amd_updatel(mmio, ACP_SW_PAD_KEEPER_EN, pad_keeper_mask, pad_keeper_mas=
k);
> -	amd_updatel(mmio, ACP_PAD_PULLDOWN_CTRL, pad_pulldown_ctrl_mask, 0);
> +	amd_updatel(mmio, ACP_SW_PAD_KEEPER_EN, pad_keeper_mask, pad_keeper_mas=
k);
> +	amd_updatel(mmio, ACP_PAD_PULLDOWN_CTRL, pad_pulldown_mask, 0);
> +	switch (acp_rev) {
> +	case ACP70_PCI_REV_ID:
> +	case ACP71_PCI_REV_ID:
> +	case ACP72_PCI_REV_ID:
> +		amd_updatel(mmio, ACP_PAD_SCHMEN_CTRL, pad_schmen_mask, pad_schmen_mas=
k);
> +		amd_updatel(mmio, ACP_PAD_DISABLE_OE_CTRL, pad_oe_mask, 0);
> +		break;
> +	case ACP63_PCI_REV_ID:
> +		break;
> +	default:
> +		dev_err(dev, "unsupported ACP revision 0x%x\n", acp_rev);
> +		return -EINVAL;
> +	}

[Severity: Low]
Should acp_rev be checked before programming ACP_SW_PAD_KEEPER_EN and
ACP_PAD_PULLDOWN_CTRL so that an unsupported acp_rev (such as 0x7b or 0x7f
from amd_sof_acp7x_probe()) does not modify pad registers before returning
-EINVAL?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107154659.3358=
223-1-Vijendar.Mukunda@amd.com?part=3D2
