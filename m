Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794774866;
	b=5ALXKj5NEZpeRsVTSGhBE9hFD3BFJAExvXEGi5H0SM6slqCP0jPSCkoFenQU3mlfeWVK
	 qPtjH/64WYBMLDfLl24aPdLuS2BoZvUk87fxu8G7OmL1MbkWI9K357JCEfGFRDnDhAixD
	 NUhO7AGS4iONv7H4vNbi+ZtNovSvLxqXT1bvmyaMuBrcI+xRkm/D/ST41EM8Qi/StMV8l
	 Jy9aj9gmujJgBU9yt4dPIBGKHjR7mLxs9TchLNxX0IPDy3pt7amSuFADU/iW7zg4O7qr3
	 zqoKD46OZnRCZlyDNBsiE+5TIyDo//8jx/jlMRmKvfvDwCYYWDGLn1pTWBGpZwotdLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794774866;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=zjKE1QAme1Pt9AR1gKgwWKqEbtE2dSXtZzIyUtweEsM=;
	b=sRV8XExUXYNTC/FHdZDGaU9bz8ZD6JKYqOFtaCnWRbdr/IzBx9cFbOfs24DI1HtQc6nT
	 cIgTFCcme+gXzXuTCV7bxpLe76rY7Y3NVxrYHv/x0uOICsQE7vTJFV/tucxgRbm8zz6y6
	 1Nrjql7FOGW5vdn9rLuJWLYN/CjeT26dY9wfYNKtPNXvhOXhcvnr6lxzx5MGaOjS4ZXaq
	 lTO8bsM6we4eyvYU2kVDSnjeiceYJoMsHJbg26esXTW6INIY1EpDSkyX/QxLAtwtZeyfA
	 drGFClO1GT0jHMeCdYEImjNj2crLNuZZMqbBlRa/JCUJi0g8xa+q3c5iOiVa3Ze7pMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q6cn6nwz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0885606A31F;
	Sun, 15 Nov 2026 20:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q6cn6nwz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28BF51F000C7;
	Sun, 15 Nov 2026 20:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794774866;
	bh=zjKE1QAme1Pt9AR1gKgwWKqEbtE2dSXtZzIyUtweEsM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q6cn6nwzA06PCxkNUBmaM2zstrSMUVa2rIHZes7ZNVzIJBgGoOMIMbnIhpp8Prh24
	 u8OSoogUqMBxXy+gjHGhG5WE3qtJJj2yU/Aid2yIXtPc6ri+Xe1ASJWb553nq8lUm8
	 Fr2jX4kH+tW2MgQ72GtgEQ+wy440yjQNFQRYPF+ytR0pZbMt8IMS2vKHBjMKE+XzXN
	 3mvExwTGinfLsUAkJGL2C5R0X6X1Lgjuf/wM3kJ1FwWz/Mk4BizNzjcWwEGh2KkdJN
	 Ib0YlS/dODIS7ymbvDmtjVXPOA0ys/VqwHfv9DY+OCfqWhtvVKmuCUnbLuI8V5sWvC
	 cBoAZhctVFBIw==
Message-ID: <sashiko-outbox-215837@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: Add NXP TFA9865 amplifier
Reply-To: sashiko-reviews@lists.linux.dev
To: "Venkat Yadlapati" <venkat.yadlapati@yahoo.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261116-vantage-tfa9865-v1-1-e88f0dccc427@yahoo.com>
References: <20261116-vantage-tfa9865-v1-0-e88f0dccc427@yahoo.com>
 <20261116-vantage-tfa9865-v1-1-e88f0dccc427@yahoo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 20:34:25 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] ASoC: dt-bindings: redundant sound-name-prefix in
  nxp,tfa9865.yaml
--

commit cf7a1e88df6af54e01055454b9dbda2662c5f8d6
Author: Venkat Yadlapati <venkat.yadlapati@yahoo.com>

ASoC: dt-bindings: Add NXP TFA9865 amplifier

This commit adds the Devicetree binding schema and MAINTAINERS entry for
the NXP TFA9865 mono class-D speaker amplifier.

> diff --git a/Documentation/devicetree/bindings/sound/nxp,tfa9865.yaml b/D=
ocumentation/devicetree/bindings/sound/nxp,tfa9865.yaml
> new file mode 100644
> index 0000000000000..955e25abe7494
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/nxp,tfa9865.yaml
> @@ -0,0 +1,65 @@

[ ... ]

> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: nxp,tfa9865
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  vddd-supply:
> +    description: Digital supply (1.8 V)
> +
> +  '#sound-dai-cells':
> +    const: 0
> +
> +  sound-name-prefix: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#sound-dai-cells'
> +
> +unevaluatedProperties: false

[Severity: Low]
Is sound-name-prefix: true needed here?  dai-common.yaml# references
component-common.yaml#, which already defines sound-name-prefix, and
unevaluatedProperties: false permits properties from referenced allOf
schemas without re-listing them when no extra constraints are added.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-vantage-tf=
a9865-v1-0-e88f0dccc427@yahoo.com?part=3D1
