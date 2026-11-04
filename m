Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793791426;
	b=htCZp/uXZ7iOMndtpcvonZa4WC4UwwTV0WmhO42Alle9P4LjXxNau38H2MPFvEy3ZQ88
	 kHiKPUE0T4aNm/A0ymSfzQQzm1GeavL/JkmUOzIS3FC6ZxIxT3kMsuWBrFX8AHDjAAvLg
	 DLEbQ+BxhmIPo1r64bIrMdECHtx1Vtg2r4ARQe4xQcuofNVtmUburL3NZUDPchhW+Yjck
	 PP3Ou30ak0Yr7ZFgfouI6DpnfePWDCLaomp6GDuiWhAoOXy095jv18dEdATKFOBLTuGh4
	 MMei/0A5+nFx1odvagfFAxBux3t/pwt/Y/ehSyfUljcGTSFAoYBxLWR4ojp4lQuciyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793791426;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ggRw8+tEFLNOkk9bHJIbKmZDiUQm8BxVL6/k41FBf50=;
	b=lMidlrTFNFknasWwdCNxq1BUJHWJMZQlVktolrUu4M9Qw/lDsz97gHf+7oTv0Rv3gqLE
	 4RcrYiktmonrO6exx4/Qd2vr4zN4/RxUQIRFbDOar1y8EaNdnH1+mLnHkNia3I1NAJq3W
	 7wU0Qqc3/7JSrmT8u34HMOcDhAw2aOdjy17bUeOfHXNWCoWShFTexFUF4de5ekvpL/LHQ
	 vpH2t3hR7KFajD1Xpu+ljwNzTD84aD1QbcwuWdsiFG/+0WYMwMXFZtnaZfhzYKtfqZhG+
	 RAy0/b41W5fcrkjAph+zA3GF5fNSJD/xxIaJqWNvkBE2t00bTZVMMi4MN7deUYm+QUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QPT3REo5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1939606D807;
	Wed,  4 Nov 2026 11:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QPT3REo5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D82DF1F00A15;
	Wed,  4 Nov 2026 11:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793791426;
	bh=ggRw8+tEFLNOkk9bHJIbKmZDiUQm8BxVL6/k41FBf50=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QPT3REo5GG/2pAlG89KMrgk0SHNIl/Aa+IHsv2SrToU7bCX+Xhqk+ilI+RxLrBHqE
	 c0cEcthdnfG95doNbJ3WH3hVh1wTzmq2JUrBlBayd/vKw1oNuGl2+kra0QbmpwKaF+
	 FaJzDasQC7F3m09kVoToT6iaadVn4MbEJgLPUe86/zjU9XCm2s4PCDT2reuQa+SMuj
	 95pIuPTQs6McTRp+Br+rVPq5FwZJ2YnmybUJx62eNaLtNoRKRLUxapjRw7pLzYgLhs
	 NBh9GEGYS7yZSbIzFkRJFX7frVMbZpyipzNu0zJoICopWLv2WIXbodgSy33VKGwZoe
	 LDcif1TnQURfg==
Message-ID: <sashiko-outbox-197164@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: sound: Add Tegra268 ADMAIF support
Reply-To: sashiko-reviews@lists.linux.dev
To: Sheetal <sheetal@nvidia.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261104111836.1100527-2-sheetal@nvidia.com>
References: <20261104111836.1100527-1-sheetal@nvidia.com>
 <20261104111836.1100527-2-sheetal@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 11:23:45 +0000
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
- [Low] dt-bindings: sound: unwieldy per-compatible conditionals in tegra21=
0-admaif
--

commit 8b302b26b4687658ab926b6d8c1160f749d509a9
Author: Anupama Kunkulagunta <akunkulagunt@nvidia.com>

dt-bindings: sound: Add Tegra268 ADMAIF support

This commit adds the nvidia,tegra268-admaif compatible string and its
per-compatible DMA channel constraints for five RX and five TX channels to
the Tegra210 ADMAIF device tree binding schema.

> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-adma=
if.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.ya=
ml
> index 2ce4049f94acc..054bacf602349 100644
> --- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml

[ ... ]

> @@ -134,6 +135,27 @@ allOf:
>            minItems: 1
>            maxItems: 64
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: nvidia,tegra268-admaif
> +    then:
> +      properties:
> +        dmas:
> +          description:
> +            DMA channel specifiers, equally divided for Tx and Rx.
> +          minItems: 1
> +          maxItems: 10
> +        dma-names:
> +          items:
> +            pattern: "^[rt]x[1-5]$"
> +          description:
> +            Should be "rx1", "rx2" ... "rx5" for DMA Rx channel
> +            Should be "tx1", "tx2" ... "tx5" for DMA Tx channel
> +          minItems: 1
> +          maxItems: 10

[Severity: Low]
This isn't a bug, but in Documentation/devicetree/bindings/sound/nvidia,teg=
ra210-admaif.yaml,
the top-level properties section leaves dmas and dma-names as bare true
booleans:

  dmas: true

  dma-names: true

while the allOf section already contains three per-compatible if-then blocks
for nvidia,tegra210-admaif, nvidia,tegra186-admaif, and
nvidia,tegra264-admaif. Adding a fourth per-compatible if-then block here f=
or
nvidia,tegra268-admaif duplicates the dmas and dma-names descriptions,
minItems/maxItems bounds, and dma-names pattern structure again.

Since the per-compatible conditionals in this schema are becoming unwieldy
due to variant differences, would it be cleaner to split the variants into
separate schema documents or factor the shared dmas and dma-names definitio=
ns
into the top-level properties section instead of piling on another
conditional block?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104111836.1100=
527-1-sheetal@nvidia.com?part=3D1
