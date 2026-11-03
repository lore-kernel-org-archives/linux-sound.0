Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793692305;
	b=ucZRy9b4cc3NGBoSBs5IlUXnVP/Bm6VyRRYr+YzG0t9S6uockz3kzduLRqoPZawAm0u7
	 xeseV4VNuYAiafnkt87xuFxC44S4XKRIZnqWw177CwLFLwqk/wURSSlFNvO7YxRZ/5gJL
	 PMQ6uHaWNQGncm5WRSLbabeZVlXWkvzky224WhmNTVpahIREdzjrUdNVK+OhmCWbCU1Ta
	 85cXhxwYzisGxFZYJEYRJPdPcGemUyheUsptmip9G7Wma/n3yThKrkj7UcJrX5b6M1sUc
	 jQU8YPH9Ts20KbxKH9oouWfXh9FheLlzpHT2AiUQTClNZN6JwRlJALBc8cTNLSV3mnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793692305;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=54E7i17oDn8CGCVEPWqu6U/e1ZE2B0lZdUH5ZVxkCEo=;
	b=s0rkA/ywaxywZfUcuSN6fI+NpiO8z/m+AnJec7Tt44k/JXZ6Ae/ETTmDcO6M7q5rLQWR
	 6OinSYbSNk2zTCg2FQOpyYsAJ0kWNAstsSryMWBDyl0WNaDBYYDe5goWW4TnWenhreOsi
	 NVEteA/McHnpATmPlqe0tcKINTydcqDR3Eq4qTgppJ06o7zYxj/RQ+Nb99MCeDl4Al0cb
	 S1wdq0oIWaLaPTGn79AOei7xTKq/CXtEFaaVoY7kc+e1D0kIjcZpDuGIxaWI+aOe6oj2j
	 kv2xWjUa8AfIjilveh4I0TxBE1WkAjadjHvPqj1YFL+mdZ5vOTxXsnk+lrTMRwevlaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MdDm42Th;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32DD0606EE89;
	Tue,  3 Nov 2026 07:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MdDm42Th
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 594EA1F0093A;
	Tue,  3 Nov 2026 07:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793692304;
	bh=54E7i17oDn8CGCVEPWqu6U/e1ZE2B0lZdUH5ZVxkCEo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MdDm42ThvRYucjDuUvTPr+SctKbD7u7LKB7VKr8/P+zotgucaMwK6cBBi2zm1xmuN
	 IhrkJnE5TYKY6gJ/1CddVsvc4D278iOfU9fm+xlYmSUUvMPQ+0kOIQ2iLmGVLGyOBp
	 8bRxpc6gUp5ORueokwx0H2Mv3C1zKv8nhOKmH8rJZWko3sdTVqMU5C8X9zW9MEaZya
	 M91v+JMIN+blwduOflKNM3IpQZ+WHxSyCwEDH+p+Vx182eQLR/O5/fm9e4LKLpQarv
	 omaNRDGQGFgqv6Eh/l/i0+vbu+zgDWc4OZ+pfNCfBH+Ew+ra6QLBgMqCnuud90wODB
	 oUGzErUMrKznw==
Message-ID: <sashiko-outbox-194753@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 02/22] ASoC: dt-bindings: cs42l42: Allow referenced
 dai-common properties
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Calligeros" <jcalligeros99@gmail.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261103-macaudio-v4-2-637484efe46d@gmail.com>
References: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
 <20261103-macaudio-v4-2-637484efe46d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 07:51:43 +0000
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
- [Low] ASoC: dt-bindings: cs42l42: unconstrained #sound-dai-cells property
--

commit f47243ba9c859acd0c0960da3d01089789ab4531
Author: James Calligeros <jcalligeros99@gmail.com>

ASoC: dt-bindings: cs42l42: Allow referenced dai-common properties

This patch updates the cirrus,cs42l42 DT binding schema to reference
dai-common.yaml and switch to unevaluatedProperties: false so that
#sound-dai-cells and sound-name-prefix can be used.

> diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml =
b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
> index ab4c7d22dc0eb..4ac0af34c464b 100644
> --- a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
> +++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
> @@ -9,6 +9,9 @@ title: Cirrus Logic CS42L42 audio CODEC
>  maintainers:
>    - patches@opensource.cirrus.com
> =20
> +allOf:
> +  - $ref: dai-common.yaml#
> +
>  description:
>    The CS42L42 is a low-power audio codec designed for portable applicati=
ons.
>    It provides a high-dynamic range, stereo DAC for audio playback and a =
mono
> @@ -193,7 +196,7 @@ required:
>    - VL-supply
>    - VA-supply
> =20
> -additionalProperties: false
> +unevaluatedProperties: false

[Severity: Low]
As reported by Krzysztof Kozlowski on v3 [1], should #sound-dai-cells be
constrained to const: 0 under properties in
Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml?

Because Documentation/devicetree/bindings/sound/dai-common.yaml only defines
#sound-dai-cells: true as a generic placeholder, referencing dai-common.yam=
l#
in allOf with unevaluatedProperties: false without listing #sound-dai-cells
under properties leaves the cell count unconstrained during schema
validation.

Meanwhile, cs42l42_common_probe() in sound/soc/codecs/cs42l42.c registers a
single DAI via devm_snd_soc_register_component(cs42l42->dev, component_drv,
dai, 1) and cs42l42_soc_component does not implement .of_xlate_dai_name, so
only #sound-dai-cells =3D <0> is supported by the driver.

[1] https://lore.kernel.org/r/20261019-overjoyed-outgoing-wren-4fdcc7@quoll

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-macaudio-v=
4-0-637484efe46d@gmail.com?part=3D2
