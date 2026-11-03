Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793692738;
	b=XWzt7E8kxo4FL6LlSSO1e2O0q33UoRJ0NEO7woDA8B2Y0we+Cx5PLxxeHhJMH1etWLca
	 2AzDtSPxN6s4taKfJnsCnF/Nb/YPibpOWuJ+c1tWvpO/vKnSofXygSxQdWMKSeyaNrayf
	 eTURm1K9fP33jT/Xwt1cEw1+zxC8tnlpritTCNbMYXA2c0j+th+vHIkPw6kTi5m8GJgJC
	 7c7dniYPmvljvCwCQL2p6BQa51LvhBooo0lcrFZlBGYmqG5s9uTl65g3RVnsVu5eMXWUf
	 TtUxCpvDPvuo0PFSE64wl8CsKeh/OV6DPYFdZBzG6zLJguQ1hkLziXoTxcoWcBaDJ8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793692738;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=LDkwUPzmjdfRONwaHupqKDUAz44VqFEVdwFb3Eppasg=;
	b=23ApXZVV7JHezTYSRIey9mkEzZJKwHmoGtjCGSbbduCI5Spd6XJpBfsog/gtC4wYy7zZ
	 OV1KhQoJE5BiRoc5L2HsgP1pW5vzEBSJaBJPycEBQzhqeEeanqtTeO53bKqcdLWm+5HuO
	 xlz8D7qI+vSwiwWM82hwJ0KhkkLrCqptbDuxXzX+R4p3Kevbaoor/L3Y2CgrRQTK3Mv/m
	 XS2cTtHhpMgDGWlJX8FXYsP2xq6lkp4LVuuQWkbh+7jQsrDRYasNhFSW2OswpDaYqOm1V
	 g4VamW69v5HH3WtYx4qDaPBeuHbkqdOoTzzcFKHmdFUS96ZBjykmA7IwYMUxpiqlMkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cD3jQjDX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E481606A32C;
	Tue,  3 Nov 2026 07:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cD3jQjDX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5AF51F00A17;
	Tue,  3 Nov 2026 07:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793692738;
	bh=LDkwUPzmjdfRONwaHupqKDUAz44VqFEVdwFb3Eppasg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cD3jQjDX+FHYClLxGbd5BMtTA4ivFZ/K5wxxc4riqav3yaVmcYdcVWYFigpdM85mm
	 f6yYwLZIVOI01ArOogsnoyPom94Kj/yyta1+Aiy/RTxAsCckYbZW65y0+GaBfMlLct
	 S+nXIm3hMAWLskc+NiWWegoDjyz0DeaMlefHRo4HVTrA8GTfUrXp1X8TxuuMUu4KQ/
	 eZFlGpz8YB9dJZH4qnk0cOMOJJJd/omVSMfdUJ8WAYqegkow9XadSaSKWc/9cxwtgO
	 ahInj2duq1i1kWpl4HXBxqPKxAP60H1QHTjCrzc2ni+CgqO+xIxJVPghCCXLX0f6+b
	 lma5mtGpN+mIQ==
Message-ID: <sashiko-outbox-194781@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 04/22] ASoC: dt-bindings: Add binding for Apple
 Silicon Mac audio
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Calligeros" <jcalligeros99@gmail.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261103-macaudio-v4-4-637484efe46d@gmail.com>
References: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
 <20261103-macaudio-v4-4-637484efe46d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 07:58:57 +0000
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
- [Low] ASoC: dt-bindings: apple,macaudio: drop unnecessary #address-cells/=
#size-cells
--

commit 7babcc38fd08c53ef9be38d7c4acfca64730a1a5
Author: Martin Povi=C5=A1er <povik+lin@cutebit.org>

ASoC: dt-bindings: Add binding for Apple Silicon Mac audio

This commit adds a Devicetree binding schema for the primary audio
subsystem found on Apple Silicon Macs, integrating the SoC I2S peripheral
and codecs for the headphone jack and speaker arrays.

> diff --git a/Documentation/devicetree/bindings/sound/apple,macaudio.yaml =
b/Documentation/devicetree/bindings/sound/apple,macaudio.yaml
> new file mode 100644
> index 0000000000000..7a97ce5bb7a1d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/apple,macaudio.yaml
> @@ -0,0 +1,195 @@

[ ... ]

> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +  model:
> +    description:
> +      Model name for presentation to users
> +    $ref: /schemas/types.yaml#/definitions/string
> +
> +patternProperties:
> +  "^([a-z]+-)?dai-link$":
> +    description: Node for each sound peripheral such as the speaker arra=
y,
> +      headphones jack, or microphone.
> +    type: object
> +    $ref: tdm-slot.yaml#
> +    unevaluatedProperties: false

[ ... ]

> +required:
> +  - '#address-cells'
> +  - '#size-cells'
> +  - compatible
> +  - model

[Severity: Low]
Are #address-cells and #size-cells needed in this binding?

The only child nodes permitted under the sound node match the pattern
^([a-z]+-)?dai-link$ with unevaluatedProperties: false, which forbids unit
addresses in the child node names and disallows reg and ranges properties
on the child nodes. The parent sound node also sets additionalProperties:
false without allowing ranges or dma-ranges.

Because these properties are marked as required, any conforming devicetree
source file will trigger a dtc avoid_unnecessary_addr_size warning when
compiled with W=3D1 in scripts/dtc/checks.c:check_avoid_unnecessary_addr_si=
ze():

	FAIL(c, dti, node, "unnecessary #address-cells/#size-cells without \"range=
s\", \"dma-ranges\" or child \"reg\" or \"ranges\" property");

Should #address-cells and #size-cells be dropped from properties, required,
and examples in Documentation/devicetree/bindings/sound/apple,macaudio.yaml?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-macaudio-v=
4-0-637484efe46d@gmail.com?part=3D4
