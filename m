Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793692430;
	b=AcG37VyL+nfV26jvnSggEfFli+WuMu3KSjvrkfbWNRonDcafL6fD70H+CzvzjQecXFt3
	 M5CDQeYydqoi+XNTR5RtljZYAGnRMivI8LQ2g+xI4Nv5255fNauEqCPWk4KEx51dizVTL
	 zUXTOfB3drKZMb2HS3LWPQn44pqc/4/JSeGcQodxSLedTjlRT9JQpLgi/gzJgEb/PunE3
	 duAHS7ItTMOROkfz+7s1Wau2kzWDZpo9eoZy7y9Nfa9GYh+mbOHc95bPKPwviGqUC7FL1
	 bG4P2Hti0JToOcZvqN4qoVHH1DD33CsynWXuX8RUXQLiSIr/OA7FBpo6+FhTpJ7WH5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793692430;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=NSEF6IMREPbRYJwxq5ZNXwh3i/SY6gOoEyTh0Y+96EA=;
	b=R2sdxlJ71eKgLwMFti6hxkqAOpRJXPMa21q8k0ZB9hzMR/HccNW3nRMR6aWkVR5K7DwH
	 8a/ww649/okShxwATvVTYNsc+UQMNw5YwEU8mpQveVHH37LcwTbAfrPr44YTNl7t9smvX
	 HLJvtlmgw1EMXORpptjexdGtDCZrkB2AKiiHsI8uILWFp/F98Ru4yDZawbEAggJqe9vwL
	 qpB1eKtY0Ym91/48JhPcWcLvnIkKlPSvQ+fZaIb6cJIoqHbvfc9mYJkOkR8LIbRNBSLyJ
	 t+EvYP63iA74qbFwTzpf+4KL7V1w3T4VsN1y/Q6T9Ja8o6Yg+7aQhVwf4hLSD3zuQAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qb40SwVv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E907606A324;
	Tue,  3 Nov 2026 07:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qb40SwVv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8358F1F000C1;
	Tue,  3 Nov 2026 07:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793692429;
	bh=NSEF6IMREPbRYJwxq5ZNXwh3i/SY6gOoEyTh0Y+96EA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Qb40SwVvLGaAiFuzkhDvPkpa/nM25qFo2WmwKKk4qcv/MZpcwA/D7RppEziVz54/Q
	 U+0K46+Ki7Ed5c73ZroyOWS23Pv07PVXbvh4b/Z442tbVKIW9NiuN3xSlrRcZPehtK
	 T42XrAbhha/VUDHtTO9KfVQRdscVn00zEuxbc2TXNLgInOjaIOMRAvk4W8BtcN75rV
	 eDq13Z/VY1L0dx+WXt2Wne7S2sBITzvrJv3FPsolNPeazS5Tr0gfNtiruW525U9P6i
	 jEb3Uihl6H4tlegbQak1/JWYj7ImIChO3fgYAnlqevDB5F3I4iD4Wg76HrrfxvR2Xg
	 EMpzyaZb9qyQw==
Message-ID: <sashiko-outbox-194759@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 01/22] ASoC: dt-bindings: cs42l84: Allow referenced
 dai-common properties
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Calligeros" <jcalligeros99@gmail.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261103-macaudio-v4-1-637484efe46d@gmail.com>
References: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
 <20261103-macaudio-v4-1-637484efe46d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 07:53:49 +0000
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
- [Low] ASoC: dt-bindings: cs42l84: loss of #sound-dai-cells const: 0 const=
raint
--

commit 51c8f9a50da0d86d550f375ea1f80d7bccc11075
Author: James Calligeros <jcalligeros99@gmail.com>

ASoC: dt-bindings: cs42l84: Allow referenced dai-common properties

This patch updates the cirrus,cs42l84 Devicetree binding schema to reference
dai-common.yaml, switches additionalProperties to unevaluatedProperties, and
removes the explicit #sound-dai-cells property definition.

>     ASoC: dt-bindings: cs42l84: Allow referenced dai-common properties
>    =20
>     Some consumers may wish to prepend the codec's name with a known value
>     to identify a specific codec among many and set #sound-dai-cells. All=
ow
>     this by allowing referenced properties from dai-common.yaml.
>    =20
>     Signed-off-by: James Calligeros <jcalligeros99@gmail.com>

> diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml =
b/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
> index 94062c1d9d45f..66cae8b7db5da 100644
> --- a/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
> +++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
> @@ -9,6 +9,9 @@ title: Cirrus Logic CS42L84 audio CODEC
>  maintainers:
>    - Martin Povi=C5=A1er <povik+lin@cutebit.org>
> =20
> +allOf:
> +  - $ref: dai-common.yaml#
> +
>  description: |
>    The CS42L84 is a headphone jack codec made by Cirrus Logic and embedded
>    in personal computers sold by Apple. It was first seen in 2021 Macbook
> @@ -29,14 +32,11 @@ properties:
>    interrupts:
>      maxItems: 1
> =20
> -  '#sound-dai-cells':
> -    const: 0
> -

[Severity: Low]
Does removing the const: 0 constraint on #sound-dai-cells weaken schema
validation for cirrus,cs42l84 nodes?

Documentation/devicetree/bindings/sound/dai-common.yaml only sets:

  properties:
    '#sound-dai-cells': true

However, the CS42L84 driver in sound/soc/codecs/cs42l84.c registers only a
single DAI in cs42l84_i2c_probe():

  ret =3D devm_snd_soc_register_component(&i2c_client->dev,
          &soc_component_dev_cs42l84, &cs42l84_dai, 1);

Without const: 0 in cirrus,cs42l84.yaml, dtbs_check will allow non-zero
#sound-dai-cells values even though the codec only supports 0 cells.

Also, since cirrus,cs42l84.yaml already permitted #sound-dai-cells prior to
this change, should the commit message be updated so it does not claim that
referencing dai-common.yaml is needed to allow setting #sound-dai-cells, and
should '#sound-dai-cells': const: 0 be retained here?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-macaudio-v=
4-0-637484efe46d@gmail.com?part=3D1
