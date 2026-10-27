Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793103016;
	b=Hbufx8IZALy44g/2fyf7YWKU8E2s1g1jsxKqQIrAep3MYx9Bk9tCXBYJE4rTZ0jnc8iJ
	 nunYGFzQGuIwOHSG/DS4QeCp1YlIC2KigdfqwKzAMkAjmg+Q3MGCF7ZJFyE7UIhct2Ifc
	 kdY7GdeS4H4eIduiEE4ss5VgeM/kNR1AZXWZcJl3l0lW4hMt7zoV8pcXIrsM4iQqtshdm
	 JZVz0f8sJ7MzYgC3dVkxBujgGqbL3XR3yHfX8fDZFlH93zFj8Geb9Iw+DUU4EQvszFQkh
	 NfsZdLwtCONEq8vJXPLN+s/qy1Nl7GKT+Zh9JVIcYtM1QxH0Yp0KIglRieTwGxWfFEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793103016;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ftXmQnUHyRVhjiltJKQd4FUTfGsoLRMmp/Ufda/3wVs=;
	b=MiwzomdzSenjZU+FxTrUeopJ6iGGY7KW2GQhgN2DVga9haQS7UrTyUEyTKaiufKxjJaJ
	 46cNDHgFwJMBCXDpP7pp6NHPPDaG9pTtkZnyU08ye3IBAEFCvAIgj6kJRKL43VIHwl8d5
	 +Xr+y7WPnRzwEatWRXudVT4rjMHAU0nXkWz9cTIp/jotyVX4lppFdeMI5atKbEzq3tCNe
	 SOOmkFBk4uALZ0smt9V2OP4tiG8e2KrkBQo2MREXBN+dW8gabMdd9psOmih2ZOk32+I/i
	 +Hz/c1My9UprdAwRpkJuu3DytgNzkFb7XyZc+/mpFMbUe7tanE+4Ct480rRt7xhv0eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZlYNfapb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44083606A326;
	Tue, 27 Oct 2026 12:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZlYNfapb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A09B81F01825;
	Tue, 27 Oct 2026 12:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793103015;
	bh=ftXmQnUHyRVhjiltJKQd4FUTfGsoLRMmp/Ufda/3wVs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZlYNfapbD1s4zy69SjZ1qDRLihm+0r9jZccu2L4LccBAUgPAJZuhF4kKUMXsd5bIw
	 dsc+iOPmlnIeJ5HwfeZ+wb66Lbi3fqV9rAdiRDFN/YySLgKrWOKtAXTWgXYn/wYkhi
	 BQqKzl/DO9FUoMKlg9izycrU4o9MudvWJ0OLoElwswEBBF2QBzUNpMJm3ni0YhbRvK
	 KEYEIPjOP9LGJD5FMixwbsa35adPjoYQQrNQWONn9PfILo0LLMLnYzfuwC93wNvm43
	 FW8jJBN2oJY8Py3HpyS7n9vLcW8tSnhIhFeRC4hNi8x1f3qmTXNhsUGUwd3zSlEJrR
	 KlL9QkiU2IX/g==
Message-ID: <sashiko-outbox-186513@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 5/7] ASoC: dt-bindings: wlf,wm8994: Update
 #sound-dai-cells property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261027120019.93611-6-clamor95@gmail.com>
References: <20261027120019.93611-1-clamor95@gmail.com>
 <20261027120019.93611-6-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 12:10:15 +0000
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
- [Medium] ASoC: dt-bindings: wlf,wm8994: #sound-dai-cells const: 1 breaks =
existing DTs
--

commit c9447e4a210bccb381d9588b9e0794f2b80cb590
Author: Svyatoslav Ryhel <clamor95@gmail.com>

ASoC: dt-bindings: wlf,wm8994: Update #sound-dai-cells property

This commit updates the #sound-dai-cells property in the Wolfson
Microelectronics WM8994 audio codec binding from const: 0 to const: 1.

> diff --git a/Documentation/devicetree/bindings/sound/wlf,wm8994.yaml b/Do=
cumentation/devicetree/bindings/sound/wlf,wm8994.yaml
> index 0db04a90ac6b3..39bf1af7c3ab8 100644
> --- a/Documentation/devicetree/bindings/sound/wlf,wm8994.yaml
> +++ b/Documentation/devicetree/bindings/sound/wlf,wm8994.yaml
> @@ -69,7 +69,7 @@ properties:
>    SPKVDD2-supply: true
> =20
>    '#sound-dai-cells':
> -    const: 0
> +    const: 1

[Severity: Medium]
Does replacing const: 0 with const: 1 break dtbs_check validation and
backwards compatibility for existing in-tree device trees?

All existing in-tree device trees using wlf,wm1811 or wlf,wm8994 specify
#sound-dai-cells =3D <0> and reference the codec with a 0-cell sound-dai
phandle:

arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi:
    wm1811: audio-codec@1a {
        ...
        gpio-controller;
        #gpio-cells =3D <2>;
        #sound-dai-cells =3D <0>;

arch/arm/boot/dts/samsung/exynos4412-midas.dtsi:
    wm1811: audio-codec@1a {
        ...
        gpio-controller;
        #gpio-cells =3D <2>;
        #sound-dai-cells =3D <0>;

arch/arm/boot/dts/samsung/s5pv210-aries.dtsi:
    wm8994: audio-codec@1a {
        compatible =3D "wlf,wm8994";
        reg =3D <0x1a>;

        #sound-dai-cells =3D <0>;

The corresponding sound card bindings
(Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml and
Documentation/devicetree/bindings/sound/samsung,aries-wm8994.yaml) and
machine drivers (sound/soc/samsung/midas_wm1811.c and
sound/soc/samsung/aries_wm8994.c) parse a bare codec phandle via
of_parse_phandle(codec, "sound-dai", 0) and hardcode the three codec DAIs.
Meanwhile, sound/soc/codecs/wm8994.c registers three DAIs without a custom
.of_xlate_dai_name callback, so snd_soc_get_dlc() in sound/soc/soc-core.c
supports both 0 cells and 1 cell.

Should #sound-dai-cells in
Documentation/devicetree/bindings/sound/wlf,wm8994.yaml use enum: [0, 1]
instead so that both existing 0-cell device trees and 1-cell consumers rema=
in
valid?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027120019.9361=
1-1-clamor95@gmail.com?part=3D5
