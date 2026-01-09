Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D453A2E1F01;
	Fri,  9 Jan 2026 19:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767985285; cv=none; b=eVFrJZ2ygF/R8Qs3zfg1gxPljZZybjvMLIvX8M5ReV1yi5G0ojl4T0SOEsIL28MVhqqtfkU7O6o99Li1juYKcbUYOcrx2szUP+51hlOfjpj0KkZDqD34GXSH2gfj5zRbyC+AB0Tslz52oLDORkvhnko1YdVtEjX01UznJLRUrC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767985285; c=relaxed/simple;
	bh=/+lrxkVehubKsrVVczd15HSWDKwhHLXrCQ192MoIxKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gc1EJ1ocEe13j/It6lrPOlfvhM2LVbyL1lIM2eUPXnrobZKdy0aDfJFqLakstz1eqCTzZZbPHvgNAOEdUpyw9VwOlC01ppUoD8zUlBUnusKcN1wORYGDht2Xz05uwypoHL3LIndhfHQhRZ8/x5h9oStB1dDTx8NeGd8wNpik4is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=B+SZyvIa; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="B+SZyvIa"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=dh/vK8xe3zPatuuQ1IGcsu4BM9M6sSODFR2WoCbzXDw=; b=B+SZyvIallOxPNX4D2N6YceP71
	3Bv1hSnZPUWr1GE7gI19FizzWtp/F0XC37W/vwwfYmH0qeiSKQkNXnAzHq+nuAlRnqiIvGgA0Ex9H
	s48rNPkrsGMTLcUs5mg4PF99Ek5CrYaoDN9CoZWP6k3jUndng8QmBiECXSfzBwe9ccT1Dg3XkHtma
	8V03lF1CrYhe4kHKh55iybAcRQQr9qS9bxN2axEzeqBjyZBowP7XccL77aCNN5cRP+zvA1YgV4GzG
	nvPV2s8BzIucclxVPLoyVBvdjzAgBWK2x/nDjoFFcJOtOP+TgfwrELIykIGouBLg5xAU+l3+T9a2U
	UTfddRdQ==;
Received: from [192.76.154.238] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1veHjN-001fbn-80; Fri, 09 Jan 2026 20:01:05 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: dt-bindings: rockchip-spdif: Allow "port" node
Date: Fri, 09 Jan 2026 20:01:05 +0100
Message-ID: <4963354.V25eIC5XRa@phil>
In-Reply-To: <20260108224938.1320809-1-robh@kernel.org>
References: <20260108224938.1320809-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Donnerstag, 8. Januar 2026, 23:49:36 Mitteleurop=C3=A4ische Normalzeit s=
chrieb Rob Herring (Arm):
> Add a "port" node entry for Rockchip S/PDIF binding. It's already in use
> and a common property for DAIs.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  Documentation/devicetree/bindings/sound/rockchip-spdif.yaml | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml =
b/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
> index 32dea7392e8d..56c755c22945 100644
> --- a/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
> +++ b/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
> @@ -70,6 +70,9 @@ properties:
>    "#sound-dai-cells":
>      const: 0
> =20
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +
>  required:
>    - compatible
>    - reg
>=20




