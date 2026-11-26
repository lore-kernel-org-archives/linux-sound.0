Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795715537;
	b=KFfl/exT03GmZ4UZxUp3bB31HCvHDedzFcVoMlCE3sb2ktz0NcBEL4t0kNUaBg715I/n
	 M5A3/IVKB+MlxYWfYpCLjxPusnBBUvNa48RMHTg+XiidpeNOqEDqCwG30TfmxoBRjPyhP
	 O+wzYx3l2UF79hJUR7funZvsNpxb0EgXXsLQ1NFzt7lCJmHtAytRZkHpSRrGI5HBlzL3e
	 H8SM0d5ZSVXi1w89lBskvtH9vd63H8YQYVG7AV+qKaDWuJdxS5v4/QR45FxslXDTXGSB9
	 TiLmamEp3OeX0CBr6D4z1ShrZMhZtAqPDkMqYUTsvS/TrukeFMxb48z2z7C0HqU2Btg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795715537;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=e2qPZaCwApnkHeNTxU5gmYVTrcRMGjT5CR7CxpFXYAY=;
	b=qb+qnksELtD2s6cLIGqNa9qrk30ET3Rlu/9tgRSXtL43n2PG70s58Jp1FXl3+LGUZ6Hz
	 NbN4YnL//mZjeaONRmc/Vjv8gtCaixSWNzJCH8soEL5r98OIPSTl28Agav9oIK45sMB0O
	 t/1U84Wu7MwDCKYvM2GeCVMxKzJg0OVUR64bIvSxq9PSMu5+hMzB06xpYeW3ljrkkRpSQ
	 oVl3D++gMlEvuJGeTrN+dYjmvEqrZcr9PbZtOtyP+o3/BDFWkDfSUqc+I513vIRBpkkqG
	 pEdwWFBcdaz5HL5F5sqngqjnAmwUzFGAQdQ/FM3UQsvOAMyuQf5PzOHi3FdRwQsS3+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PYTvcMN9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF41606A31C;
	Thu, 26 Nov 2026 17:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PYTvcMN9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A5C81F000C6;
	Thu, 26 Nov 2026 17:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795715537;
	bh=e2qPZaCwApnkHeNTxU5gmYVTrcRMGjT5CR7CxpFXYAY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=PYTvcMN9lZW7fyQ9+GY6Ol6crsOkGmkg9KNQrPPGvNVNHlzHKvECvaFn5Ba6w4OH8
	 uhVH985MnqUqoxjyFHLE/ea5iWNgXpeMbOmlT/2PAhBlEiJqXyB9e/PiPTYHv4rfdJ
	 VH7npLAJz6UcgCHSCG/z2mET+bhgQuq8Vsbkg8B9UIJ9vMGrk4i5FMNofGzMxvU+Ks
	 tIC39zzbmsu5YCnA6CdCfpxpv/NBiH1XEo2CHPeYtDmwUF3WEckuPngRzrvB+XEZ6E
	 T4syiBgZtNPTRzrTzuWH6BWLvGHJ1etFhJlJfHiSAIGk1SCO67tVSJiwxD6bQ2OgGe
	 /RF1YGt8RFzbg==
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 3/4] ASoC: xlnx: formatter: set a 64-bit DMA mask
From: Mark Brown <broonie@kernel.org>
To: Dhanunjanrao Katta <katta.dhanunjanrao@amd.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Michal Simek <michal.simek@amd.com>, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 naveen.gaddipati@amd.com
In-Reply-To: <20261125114839.3642735-4-katta.dhanunjanrao@amd.com>
References: <20261125114839.3642735-1-katta.dhanunjanrao@amd.com>
 <20261125114839.3642735-4-katta.dhanunjanrao@amd.com>
Date: Thu, 26 Nov 2026 17:52:11 +0000
Message-Id: <179571553180.142532.15022384187541501041.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1284; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Bgbg9/4roZ2jmgAhJQvlkgRt3vbL3rcl5gZVwVsDy7o=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI5Cs/4NBs/u5h45Mb7M6xF93x2NH1x+CfUKXnMNOOm0
 s+LR7vDOkpZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjCRHxcZGX7Xi01zso31OLnU
 f8O6NtFVk5Zd/DW7/uitQw93rhDuV2JlZGhZlfNgjouXzkPj62FmkaHL/nSbP7hw7TBXlSO/YbC
 IGSMA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> hw_params splits the ring buffer address over the LSB and MSB buffer
> address registers, but the device is left on the default 32-bit mask.
> The coherent buffer therefore always comes from below 4G and the MSB
> register is only ever written as zero.
> 
> Set a 64-bit mask so the buffer can sit in high memory as well.
> 
> Signed-off-by: Dhanunjanrao Katta <katta.dhanunjanrao@amd.com>
> ---
>  sound/soc/xilinx/xlnx_formatter_pcm.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/sound/soc/xilinx/xlnx_formatter_pcm.c b/sound/soc/xilinx/xlnx_formatter_pcm.c
> index fa7419439ec7..57901c9466a0 100644
> --- a/sound/soc/xilinx/xlnx_formatter_pcm.c
> +++ b/sound/soc/xilinx/xlnx_formatter_pcm.c
> @@ -8,6 +8,7 @@
>  
>  #include <linux/bitfield.h>
>  #include <linux/clk.h>
> +#include <linux/dma-mapping.h>
>  #include <linux/io.h>
>  #include <linux/module.h>
>  #include <linux/sizes.h>
> @@ -598,6 +599,11 @@ static int xlnx_formatter_pcm_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct clk *axi_clk, *aud_mclk, *axis_clk;
>  
> +	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));

Is this always safe, can we have instances restricted to 32 bits?

-- 
Mark Brown <broonie@kernel.org>
