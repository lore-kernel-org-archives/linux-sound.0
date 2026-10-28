Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793153713;
	b=QNQ4Pk6s2Z5M10kCCB7gxU6mlH2zzkXwEkKjLzaXWfyFvZJklvfSpSGMvitTqS2iYYTw
	 NK0AGEyXBfpzRwN5tz9UhnEnOZRCXbdjII6Z1tAk8dhta5aSP9BJZywZyeyoOPUYUdI6e
	 dWXTjnwlnUy5uvEjNurDXaL91XI6hM9Z+3lr9fNSysmaHxvrFRNVRZcsIBcBucKg0tUA8
	 npV1Wcb9RUQOW4wxIn3bkvKgzX4nKZ8Wiuf/sKOLSMkd5+PyGQ6woJn7GEWLS5w4KMKBX
	 pYDv5Le+qyHl8hTru2pp/SvIIkgbulEju2ylF1pCTLQ+sbMALoa5VdBb80H0IhT+MBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793153713;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=R4b/BpLwvmnDJlyr1MMxDdla/MCG0SHqr5vTRbszHzY=;
	b=Qk4apxgs0VzcHlnkUsy0kXZvL9E/BNSX8DSNExL3e63aPasGO+2TFP/7oAT+TbWPU3EP
	 qbopiFUX3rmLudsEcdWx8VchR7qrvasCh8iJHV/oFGbk0stHTZMq5WYkEp8q03wIZc2YK
	 1GEJc7thpiyXvf+WxtCNOHXt0LG5pVhIPI8dIgtryDBGS54Ug5V5/YhFrlg7+v0lFA8dD
	 dKTWTS1FnCf6GAXcGXGIito1iLapXQ9/9IsBChnIoxgYXKpKzxpS8oiCRcBOa5A8I2vid
	 hnVcyB4FdlTDW4DLk02FVPgwA9+1GMdwSN1PdDt0LMHsL96LIusWlWS3H0r2XBFr2ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="nxw1/t+i";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1795E606A321
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 02:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nxw1/t+i
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 932351F01825;
	Wed, 28 Oct 2026 02:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793153712;
	bh=R4b/BpLwvmnDJlyr1MMxDdla/MCG0SHqr5vTRbszHzY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nxw1/t+iOzx/IHpiewypqQrLTFjSly5pkxhx/pD6H+1DC1Il5JiDV5QxHw6emkkXh
	 ylpKVyOlRafcWD4YkVAqUWrtiu2KO4Lo0vJ3IgdnoLJGBHDAbwYXkHwQpyeEcTDd+N
	 CW61JQDGv2wiN/OH+7hiMsPk2eGv2C/xvJsIMkKg/PxiSwnxwRsygSvdciW/rRa+Vl
	 g/UTIC1pPbrNe3zHSyMtcKNBpUkrNXSzvc38g2SXKdvjlTCIMQnheDtBBJBeaClEjA
	 tOTyrvwpc1+gfOrUFuWIs0BGBj+cZhvJ5JBozUvAx3h8ea6kD+6wqoJ5i2ETEVUQ81
	 t2Ney4ib8QniA==
Message-ID: <sashiko-outbox-187336@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/11] ASoC: amd: ps: add ACP6x PCI revision ids
Reply-To: sashiko-reviews@lists.linux.dev
To: "Corey Smith" <corsmith@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261028020552.35278-4-corsmith@gmail.com>
References: <20261028020552.35278-1-corsmith@gmail.com>
 <20261028020552.35278-4-corsmith@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 02:15:12 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] ASoC: amd: ps: ACP6X_REG_END truncates SoundWire DMA scratch PTE=
 range
--

commit ad82886a02e0737dcd97ae5c1b3d4d8287cac193
Author: Corey Smith <corsmith@gmail.com>

ASoC: amd: ps: add ACP6x PCI revision ids

This commit adds ACP6x (Rembrandt) PCI revision IDs, the ACP6x register
range, and the SoundWire controller ACPI address to the Pink Sardine
header so the driver can bind to ACP6x devices.

> diff --git a/sound/soc/amd/ps/acp63.h b/sound/soc/amd/ps/acp63.h
> index d0cfbd4dafc17..b7d2666b27fc7 100644
> --- a/sound/soc/amd/ps/acp63.h
> +++ b/sound/soc/amd/ps/acp63.h
> @@ -9,8 +9,12 @@
>  #include <sound/acp63_chip_offset_byte.h>
> =20
>  #define ACP_DEVICE_ID 0x15E2
> +#define ACP6X_REG_START		0x1240000
> +#define ACP6X_REG_END		0x1250200

[Severity: Medium]
Should ACP6X_REG_END be 0x125C000 instead of 0x1250200?

Defining ACP6X_REG_END as 0x1250200 (matching the PDM-only Yellow Carp
header in sound/soc/amd/yc/acp6x.h) sizes the ACP6x register range to
0x10200 bytes. When snd_acp63_probe() sets adata->reg_range to
ACP6X_REG_END - ACP6X_REG_START, create_acp63_platform_devs() creates the
IORESOURCE_MEM resource for amd_ps_sdw_dma with a size of 0x10201 bytes,
which acp63_sdw_platform_probe() maps via devm_ioremap().

However, SoundWire DMA page table entries in ACP scratch memory start past
0x10200:

sound/soc/amd/ps/acp63.h:
    #define SDW0_PTE_OFFSET		0x400
    ...
    #define ACP_SDW_PTE_OFFSET		0x100
    #define SDW_PTE_OFFSET(i)		(SDW0_PTE_OFFSET + ((i) * 0x600))

When acp63_config_dma() in sound/soc/amd/ps/ps-sdw-dma.c programs the
SoundWire DMA PTEs during PCM hw_params or resume, it writes to offsets
0x10400 through 0x10B80 past acp_base (since ACP_SCRATCH_REG_0 is 0x10000):

sound/soc/amd/ps/ps-sdw-dma.c:acp63_config_dma() {
    ...
    sdw_dma_pte_offset =3D SDW_PTE_OFFSET(stream->instance);
    val =3D sdw_dma_pte_offset + (stream_id * ACP_SDW_PTE_OFFSET);
    ...
    for (page_idx =3D 0; page_idx < stream->num_pages; page_idx++) {
        ...
        writel(low, acp_base + ACP_SCRATCH_REG_0 + val);
        high |=3D BIT(31);
        writel(high, acp_base + ACP_SCRATCH_REG_0 + val + 4);
    ...
}

This accesses MMIO offsets beyond the declared resource and devm_ioremap()
size. Note that commit 253ce07d2a09 ("ASoC: amd: ps: modify ACP register
end address macro") previously updated ACP63_REG_END from 0x1250200 to
0x125C000 for this reason, and sound/soc/sof/amd/pci-rmb.c also defines
ACP6x_REG_END as 0x125C000.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028020552.3527=
8-1-corsmith@gmail.com?part=3D3
