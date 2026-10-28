Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793154038;
	b=omGSXiHG937G/Gvih4tSQIcifkJ/ogb+Mnomdri2qh9ujvAx4sMIqPmQGexqFrRPshZV
	 c5+RRZ52h2QBHgGSBKlDIohfPL/9nbcvOHlyWPUN3NKcXuHu0mFq84eA3ZuiR6xUMu8B3
	 JdktLIeWPkGwWwA31R0Y7WuySEwR+kkTcft+BVSHGMDOmxhYPwZzNNO1sN5KLXuD1aekc
	 Q2pW9q3d1cx//2Jy7mSQFlLK+wgy472y8mHNBPCv2+okC3DSoVP/N2wMXshhRwFRjuDjm
	 0H9hp33qtI1pneyC9nxjDsuZIiqsCxHLf5W2af+jRrMcfPj8VSECi2XqNoBIoApoThw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793154038;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=YI/qKYe3yTJY7grIID+NWGXt9W9A1T16xply5aOukEo=;
	b=LrlGIHyovTkim5cuYcasgbGoGri+eFO9K09yaQyS9z1eeWCWZ7WMaoG1V4+Pl/MA09Dy
	 bgLLXRUwq5CjdmC77zw5G3I5JlR/II098z9Dsd/cdybecdosTcbQBJGwZpX6jQOYmKhKV
	 MAu+M+Q/mSEF+TiFVFyEwk2C2MDhGvJiVoMFNvEw3fluyIQiR9Tj6F21nQJVKmm1576fE
	 DycgnEN+eeCdO+r0M3RfTb0r1Ruxz5W17OtO+N0Z/IQQ0H9EHZr3yxcJKk2VVdwYaWhru
	 ikHGnmStnMAQaLuUlXDZ5etZwhGvfxE7dl/j8rVLnIjv/QZsaWoJTspm9OWoavYIimg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YYy18cF0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF91606A31A
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 02:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YYy18cF0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70A141F01825;
	Wed, 28 Oct 2026 02:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793154037;
	bh=YI/qKYe3yTJY7grIID+NWGXt9W9A1T16xply5aOukEo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YYy18cF0UtkPRR2kxJp/X5mSJcIZtteolj7UHayKUsbZ7L2X3qk/m9w3Pc5DBYEga
	 z5nEWjS7Ck57mdAP/O+9u74FsFaRxYmCTzX5Ac78QtuvGNnqZqNpwEJXprr1XmTZbK
	 LVGaYuMD1H4UPUrknjp3XGy0RbzXTaqMJZgPntR13G8mrEEMSRhe764mIXtnVw2FIg
	 uNO44mxqL6LMUu+g+8JBPSRgJ6uuJHeSPLCfpXnI2YniCRm1SyRvhMjnatdvmgDQGc
	 rDVNBFZfwKvcDNVkUGiy2SaQKQNYY0yhaDn0JV0X9SRHAkJKHxYK6upAcUMFyWWc/J
	 HJfMxxbdPO5dA==
Message-ID: <sashiko-outbox-187338@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 7/11] ASoC: amd: ps: probe the ACP6x SoundWire stack
Reply-To: sashiko-reviews@lists.linux.dev
To: "Corey Smith" <corsmith@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261028020552.35278-8-corsmith@gmail.com>
References: <20261028020552.35278-1-corsmith@gmail.com>
 <20261028020552.35278-8-corsmith@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 02:20:36 +0000
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
- [Medium] ASoC: amd: ps: truncated ACP6x reg_range in snd_acp63_probe()
--

commit 936e882d9f0167141cc5ea00f82706fe1b5cf051
Author: Corey Smith <corsmith@gmail.com>

ASoC: amd: ps: probe the ACP6x SoundWire stack

This commit enables probing ACP6x (Rembrandt) PCI revisions in the Pink
Sardine PCI driver when the FLAG_AMD_LEGACY_SDW quirk is set, wiring up the
ACP6x register range, hardware ops, SoundWire controller address, and machi=
ne
tables.

> diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
> index b604db4942dd6..235cb1ef25f14 100644
> --- a/sound/soc/amd/ps/pci-ps.c
> +++ b/sound/soc/amd/ps/pci-ps.c

[ ... ]

> @@ -487,7 +514,7 @@ static int create_acp63_platform_devs(struct pci_dev =
*pci, struct acp63_dev_data
>  		}
>  		adata->res->flags =3D IORESOURCE_MEM;
>  		adata->res->start =3D addr;
> -		adata->res->end =3D addr + (ACP63_REG_END - ACP63_REG_START);
> +		adata->res->end =3D addr + adata->reg_range;
>  		memset(&pdevinfo, 0, sizeof(pdevinfo));
>  	}

[ ... ]

> @@ -622,7 +664,10 @@ static int snd_acp63_probe(struct pci_dev *pci,
>  		goto release_regions;
>  	}
>  	adata->addr =3D addr;
> -	adata->reg_range =3D ACP63_REG_END - ACP63_REG_START;
> +	if (pci->revision =3D=3D ACP6X_PCI_REV || pci->revision =3D=3D ACP6XR_P=
CI_REV)
> +		adata->reg_range =3D ACP6X_REG_END - ACP6X_REG_START;
> +	else
> +		adata->reg_range =3D ACP63_REG_END - ACP63_REG_START;

[Severity: Medium]
Is ACP6X_REG_END - ACP6X_REG_START large enough for the amd_ps_sdw_dma
platform device resource on ACP6x?

For ACP6X_PCI_REV and ACP6XR_PCI_REV, snd_acp63_probe() sets adata->reg_ran=
ge
to ACP6X_REG_END - ACP6X_REG_START (0x1250200 - 0x1240000 =3D 0x10200).
create_acp63_platform_devs() then uses adata->reg_range to set the end of t=
he
IORESOURCE_MEM resource passed to amd_ps_sdw_dma, which
acp63_sdw_platform_probe() in sound/soc/amd/ps/ps-sdw-dma.c maps with a size
of 0x10201 bytes:

sound/soc/amd/ps/ps-sdw-dma.c:acp63_sdw_platform_probe() {
	...
	sdw_data->acp_base =3D devm_ioremap(&pdev->dev, res->start, resource_size(=
res));
	...
}

However, when configuring a SoundWire PCM stream during hw_params
(acp63_sdw_dma_hw_params() -> acp63_config_dma()) or system resume
(acp63_restore_sdw_dma_config() -> acp63_config_dma()), acp63_config_dma() =
in
sound/soc/amd/ps/ps-sdw-dma.c writes page table entries to ACP_SCRATCH_REG_0
(0x10000) + val:

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
}

Because SDW_PTE_OFFSET(0) is 0x400, SDW_PTE_OFFSET(1) is 0xA00, and
ACP_SDW_PTE_OFFSET is 0x100, these SoundWire DMA PTE writes occur at offsets
0x10400..0x10B7C, past the 0x10200 end of adata->res and the requested
devm_ioremap() length.

ACP6X_REG_END (0x1250200) comes from the DMIC-only driver where PDM PTEs st=
art
at PDM_PTE_OFFSET (0x0) and only need 64 bytes of ACP_SCRATCH_REG_0. Should
ACP6X_REG_END or adata->reg_range be large enough to cover the SoundWire PTE
region in ACP_SCRATCH_REG_0 as well?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028020552.3527=
8-1-corsmith@gmail.com?part=3D7
