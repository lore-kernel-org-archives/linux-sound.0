Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795788071;
	b=nNwf+Gge9qdvpcqbapuxoW9KjpGQEiSn6pbijLMON3PoGK7VpeVgH1s1jYPnfd5BdOXu
	 0+znNta6X7NGyw4u5k5zBAqaJ8zb7jSEyHV+Xp4knURopg9TiCUBguSwczChD4AVI6RHj
	 ws+Y6VtDzJAbRJe8YGlKt0UlKiWVXLW4pW6tHhapk8zxQSdnbmTldXsymH1XDUQ3UzHLe
	 OymFFSlKmXjjcvx2JA/gVzpPiZfxoYwXoRELqrT4cWW1cOFCJsuKQLIH+cyg/TJVaacA4
	 WaLrx16H1SAQ0QvkGOugPfbavUP+WHc0G1aioOOv3NRkaPaRhhOst3hfKMlKc7C88ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795788071;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=b/RjVZytl4U7onEEBW1fC3PHJ/3e3B7ie9vDK951TfE=;
	b=gOOLULaw2rEAjJ1uqM6qsH+ThZB1AGpOsrzX4tTgsPF8R3MgabH8Eue4iQNyjdzO23RC
	 W4/aSOYAgSczJNeCX3SUTobHFxqbUgcimtqP77e0nStnTIrEIwjgrWWfzYe1PHN483MfL
	 w/k0WFSyRBLr2SWsTgGZsj8fU6RsrKvHa6R9Gia4DnacT92LXNCztyveBEsqsX8eME2rE
	 1MvGoAnBS+W9q00SRMjiC4N49yK0Ts3TMIN7/NrzpzfzFlPS+lDwc9vYKDdyoFSMNBaaS
	 GtmeKhoVYLEGvHP0zcrr7Ry/IER/wf+oxpOLcfSEPKvL4x9Znqe0aFC/jkh3REEPz0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JdIbRhFn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D790606A31E;
	Fri, 27 Nov 2026 14:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JdIbRhFn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D62BD1F000C1;
	Fri, 27 Nov 2026 14:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795788070;
	bh=b/RjVZytl4U7onEEBW1fC3PHJ/3e3B7ie9vDK951TfE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JdIbRhFnrQdorPmMF+9E8EK8KKgLclWuG4mGgiI0Q7wYUuhDxxuwJdhk+KNRwQiuJ
	 6Ka72MlcgOcUB8WewCYWveOir18mNYHpz8cYLYr9vf4CIQz7gjsInCq07ZKwSA7Tc8
	 YPi7rCStg6CfMxIZwXJPebNkoUNi/+MxlMx4qvFolRSNtuH1dCemPay3SDGfZabXbQ
	 d7QuDxR7Uu2gx5xWhEsndezQ3SgjTOPS8LQ6ZftS4Plj5pE6YBTCtOm9WyO5TJEj1z
	 wv9Atrtg5Iz3EF+vd5W/R93+n8mgUdRfbrOLeDCYi4LSCu7xZTxtug6VFw6R65m2e+
	 sTSFhD5592vog==
Message-ID: <sashiko-outbox-237528@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] ASoC: dt-bindings: qcom,wcd9378-sdw: add
 non-SDCA (mobile) mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ravi Hothi" <ravi.hothi@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261127-b4-wcd9378-v3-v3-1-397e5ba2da55@oss.qualcomm.com>
References: <20261127-b4-wcd9378-v3-v3-0-397e5ba2da55@oss.qualcomm.com>
 <20261127-b4-wcd9378-v3-v3-1-397e5ba2da55@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 14:01:09 +0000
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
- [Low] ASoC: dt-bindings: qcom,wcd9378-sdw: qcom,port-mapping not
  required for RX node
--

commit 14ae46e896909f194da940d46755798a8c5dcc39
Author: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

ASoC: dt-bindings: qcom,wcd9378-sdw: add non-SDCA (mobile) mode

This commit updates the WCD9378 SoundWire binding to describe the
non-SDCA (mobile) split RX/TX device topology alongside the existing
SDCA-compliant single-device topology.

> diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yam=
l b/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
> index 62d85b1dca7f2..03ee4a4deea61 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml

[ ... ]

> @@ -58,24 +69,93 @@ properties:
>    vdd-mic-bias-supply:
>      description: Mic bias supply.
> =20
> +  qcom,micbias1-microvolt:
> +    description: micbias1 voltage
> +    minimum: 1800000
> +    maximum: 2850000
> +
> +  qcom,micbias2-microvolt:
> +    description: micbias2 voltage
> +    minimum: 1800000
> +    maximum: 2850000
> +
> +  qcom,micbias3-microvolt:
> +    description: micbias3 voltage
> +    minimum: 1800000
> +    maximum: 2850000
> +
>    '#sound-dai-cells':
>      const: 1
> =20
>  required:
>    - compatible
>    - reg
> -  - qcom,sdca-compliant
> -  - qcom,port-mapping
> -  - reset-gpios
> -  - vdd-buck-supply
> -  - vdd-rxtx-supply
> -  - vdd-io-supply
> -  - vdd-mic-bias-supply
> -  - '#sound-dai-cells'
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +  # The device reaching the control register space owns the codec-wide
> +  # resources and exposes the DAIs. A data-only device describes nothing
> +  # but its own data path.
> +  - if:
> +      anyOf:
> +        - required:
> +            - qcom,sdca-compliant
> +        - required:
> +            - qcom,rx-device
> +    then:
> +      required:
> +        - qcom,port-mapping
> +        - reset-gpios
> +        - vdd-buck-supply
> +        - vdd-rxtx-supply
> +        - vdd-io-supply
> +        - vdd-mic-bias-supply
> +        - '#sound-dai-cells'
> +    else:
> +      properties:
> +        reset-gpios: false
> +        vdd-buck-supply: false
> +        vdd-rxtx-supply: false
> +        vdd-io-supply: false
> +        vdd-mic-bias-supply: false
> +        '#sound-dai-cells': false

[Severity: Low]
Should qcom,port-mapping remain in the top-level required list?

Moving it into the then branch leaves qcom,port-mapping optional for the
non-SDCA playback (RX) peer device, which hits the else branch even though
it needs qcom,port-mapping to describe its data path.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127-b4-wcd9378=
-v3-v3-0-397e5ba2da55@oss.qualcomm.com?part=3D1
