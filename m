Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793154136;
	b=UYUY3DpUJ/428bPIebJ86cpkLjWQ/LfXMdBxklDtzLuxtGpu+INmjAxIdV6kqfsD7hzI
	 swwQmpQDRQ9XuNfqh4WD/q/t/6m+U5p711oxp0UzT1y9zTNH+waQAYFO45jTCaiEe+Gr8
	 oKi4I0I1cHkmh1qD000uG0WGCYuNgw1e5aosEgPhmNqPJd+MXDex6lcwUaQki9fuSgDcd
	 jV4wD3pnScaGexj3Fv6XFjlnnTzktHVkcQxEd4yxWRnA5OXVNO6Ez+brSJxtqFmvjsUhm
	 4j/W7+fluOv3iJGoVqi5y7gp1BZPKBTpVAaGjQG4IoaYplGtrRDHq/EIITxQKFkJJMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793154136;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=tIOXl3SXp3dhRnPdErWr63AOlAUWUTUocUFKnZss3qc=;
	b=U8KZyrJehb9Tl1YeSuIQrP+yKq3ekdoO3SNdKNkKgMpd5fVHHd+X1QSD4c+bBByOBIPI
	 zEAJ5S2KfJcFRj9PCzgdZkrdyc4x/xNNNlEjZ3BbDID/gjpZ7Tea7414ZAnB531YV2Y8y
	 0gA1E7NoE7rbCi0dgMA+C0DEHSMq0iLQRruiOnYEaiMnE+W/lRfhy8lEnYXCczcaCCm0E
	 xp4gTc+5uUvDJyFrLm8BYpRVgKkUrc9gGMM4pKNOVozM787Xsy6pm+VvMVRjGa1PdcCrY
	 kyaY1WH2hWmR1irRZRZbTHr56ahSiWS3z8Ays8ybEuyY7CSptip3q2VyWOWCHsxwEhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IF0gJNQd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EAB606A321
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 02:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IF0gJNQd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1097B1F031E5;
	Wed, 28 Oct 2026 02:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793154135;
	bh=tIOXl3SXp3dhRnPdErWr63AOlAUWUTUocUFKnZss3qc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IF0gJNQdVcyENJ1JV9o6rYtU885LC9+uYVcWXUWnpYAQ+uB3ttJOjfrg3ELSvChZ1
	 YX9yy42bV9k13s9DVHoJksg0b+AWDAGQ6yLWw2ohQRrpNlxLJy+Ku4Jl1RosbepJ5E
	 YxSWb9syfVcVhPz8z4tuauqHvX2DrXWHieeC+E4saGY2WpMYYfBzlR5O46stibsvGR
	 5naQ2SmZyKxKC+VFu3f7KmQUuUxUvMIm2LXrYcOzcsvSM0sBIAUz7IZZCdClY+TAGj
	 2d92t2eRPMlEEzgN7VAD8Cf8CZsgsQhj4S0HA462NiGVR9TyME3UUyiMFgGsxRznfk
	 9cpqq1zA+ZfCQ==
Message-ID: <sashiko-outbox-187341@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 8/11] ASoC: amd: acp: add ACP6x SoundWire quirks and
 machine support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Corey Smith" <corsmith@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261028020552.35278-9-corsmith@gmail.com>
References: <20261028020552.35278-1-corsmith@gmail.com>
 <20261028020552.35278-9-corsmith@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 02:22:14 +0000
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
- [Medium] ASoC: amd: ACP6X_REG_END truncates MMIO range needed by acp63_co=
nfig_dma()
--

commit d2bc6f9f5ef056a066db2b434d5d1ed6b31dee36
Author: Corey Smith <corsmith@gmail.com>

ASoC: amd: acp: add ACP6x SoundWire quirks and machine support

This commit adds ACP6x support to the generic AMD SoundWire machine driver =
by
reusing the ACP6.3 CPU pin mapping and the amd_ps_sdw_dma and acp_ps_pdm_dma
platform components. It also adds a DMI quirk for the HP Dragonfly Pro ONE
(board 8A7F).

> diff --git a/sound/soc/amd/acp/acp-sdw-legacy-mach.c b/sound/soc/amd/acp/=
acp-sdw-legacy-mach.c
> index a8b62817b2344..69880de6b99f7 100644
> --- a/sound/soc/amd/acp/acp-sdw-legacy-mach.c
> +++ b/sound/soc/amd/acp/acp-sdw-legacy-mach.c

[ ... ]

> @@ -337,6 +353,8 @@ static int create_sdw_dailinks(struct snd_soc_card *c=
ard,
>  		return -ENOMEM;
> =20
>  	switch (amd_ctx->acp_rev) {
> +	case ACP6X_PCI_REV:
> +	case ACP6XR_PCI_REV:
>  	case ACP63_PCI_REV:
>  	case ACP70_PCI_REV:
>  	case ACP71_PCI_REV:

[Severity: Medium]
When create_sdw_dailinks() binds ACP6X_PCI_REV and ACP6XR_PCI_REV SoundWire
DAI links to amd_ps_sdw_dma.0, does acp63_sdw_dma_hw_params() ->
acp63_config_dma() end up writing SoundWire PTEs beyond the MMIO resource
range configured for ACP6x?

In sound/soc/amd/ps/acp63.h, ACP6X_REG_END is defined at offset 0x10200 from
ACP6X_REG_START:

    #define ACP6X_REG_START		0x1240000
    #define ACP6X_REG_END		0x1250200
    #define ACP63_REG_START		0x1240000
    #define ACP63_REG_END		0x125C000

In sound/soc/amd/ps/pci-ps.c, snd_acp63_probe() uses this range for ACP6x,
and create_acp63_platform_devs() passes it as the IORESOURCE_MEM resource to
the child platform devices:

    if (pci->revision =3D=3D ACP6X_PCI_REV || pci->revision =3D=3D ACP6XR_P=
CI_REV)
            adata->reg_range =3D ACP6X_REG_END - ACP6X_REG_START;
    else
            adata->reg_range =3D ACP63_REG_END - ACP63_REG_START;

acp63_sdw_platform_probe() in sound/soc/amd/ps/ps-sdw-dma.c then maps that
resource via devm_ioremap(&pdev->dev, res->start, resource_size(res)), which
only covers 0x10201 bytes (up to ACP_SCRATCH_REG_0 + 0x200).

However, when a SoundWire PCM substream is configured, acp63_config_dma() in
sound/soc/amd/ps/ps-sdw-dma.c writes PTEs into scratch memory at:

    sdw_dma_pte_offset =3D SDW_PTE_OFFSET(stream->instance);
    val =3D sdw_dma_pte_offset + (stream_id * ACP_SDW_PTE_OFFSET);
    ...
    writel(low, acp_base + ACP_SCRATCH_REG_0 + val);
    high |=3D BIT(31);
    writel(high, acp_base + ACP_SCRATCH_REG_0 + val + 4);

Since ACP_SCRATCH_REG_0 is 0x10000 and SDW_PTE_OFFSET(stream->instance) is
0x400 for SDW0 and 0xa00 for SDW1, these writes span offsets 0x10400..0x10b=
7f,
which is past the 0x10200 limit set by ACP6X_REG_END (unlike the 0x125C000
end address used in sound/soc/amd/acp/acp-pci.c and
sound/soc/sof/amd/pci-rmb.c).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028020552.3527=
8-1-corsmith@gmail.com?part=3D8
