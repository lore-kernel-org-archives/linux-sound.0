Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794577199;
	b=ECu1BUJtk+rILyQsfJ+seVohaI1Ww8Ta3vRId+7xsvpp4bWvU7mOQx2nXUIL4AcZZT6T
	 3NwANWNswiNxVziA/9ZGOrMply94eroZoBTewpl7bkvThkEWanO0vpDmjMzPFmhgXXMSz
	 624n7A8f4BmrRtVFOtC9k6tCv5OGM5//kGHcH9VyfV5R6/n1wTPewuLtovwoxXqN/9UXz
	 NkvClUButhCH+O601EIFPq7ZtBFoilAm+wTbZuGllwfJYnVphRX5yMFIghQA1l1iyS1yQ
	 dsiFJxy1/6HIOFI6d7LId2esYxr+98Od/1ebO9HV2F1a95zDh1DahOML7xJNSPJDn2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794577199;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9ZEN6StnDGcwWNkMo7bcZMn0/OmlreEwYdtuYN7aiwQ=;
	b=img/2Ft3SpFUrdMksPjUm4jldZffrEWAdVbc8VSn6D9D58o1iH/SsBvIDdwbro3JbOSK
	 OBMbPSYvV5hZzZGqHwpVlV8u3Ed/Gtk4bMdla+DZL0+0vnM5W7X3q3uWB0y00WYTIw5eI
	 S/Mlfp9wfflK6gj38dIOHf5P9HUry4C20nU0F/4hMbyY/rwNTBvyoD33J9n8zLQc6Lu2A
	 ik+ebL97hSwHcBdq3MeEbjaIw2OVNh1b0oPqX/D9V8i3V2TIzM6NOe4mksc75ubwhY3t8
	 jAyEsKRM1+b6tmlAYSHBaJCxwuvEjkB3olFW+DccQzIGtShzHOjZqm/ExFPgE8mU0Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Atonhrxb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66055606A323;
	Fri, 13 Nov 2026 13:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Atonhrxb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0AC71F000C4;
	Fri, 13 Nov 2026 13:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794577199;
	bh=9ZEN6StnDGcwWNkMo7bcZMn0/OmlreEwYdtuYN7aiwQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AtonhrxbRzkyxnggj/eknwA4DiyF/rTC2es+1iHCZOz/qD6dTyETmmmhvBw3gogCC
	 Ypr+Vt4LB/FX0g0TiFiJehESKljnyxgbxGMT3SZpcfYQfPYxHVS0VD9uN0cq6DtAyW
	 LNQm99PO3c9WOKiWKODKnW5YF8Ni5vkLLXc8mea6akykgKJ6phxO01fRV8ATwdCJhk
	 bM/SRzAy2SwSjtQpzzP951M0K3hGNVvidI2izjd9C7J24Kb1wPp3f0s/yM0eCxfUyz
	 NSYd++Rwbk170U/JA467jyhxSP3+t8DoySkPhZTJYwR2xUXC3ckMjFXViheaQi77Xt
	 wRtwc1kQl9USw==
Message-ID: <sashiko-outbox-212911@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: add device tree for Asus Vivobook
 16 X1607QA
Reply-To: sashiko-reviews@lists.linux.dev
To: yass27106 <yass27106@gmail.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <5cfd0705da5845b88ffe6d9e8bfeb966@gmail.com>
References: <01b2c920412848ab85493acc2d4f5fc1@gmail.com>
 <5cfd0705da5845b88ffe6d9e8bfeb966@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 13:39:58 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 7 potential
issues to consider:
- [High] arm64: dts: qcom: missing Signed-off-by trailer and commit
  message body
- [Medium] arm64: dts: qcom: missing /delete-node/ for pmc8380_6 on
  Purwa X1P42100
- [Medium] arm64: dts: qcom: missing dmic-sample-rate and
  vdd-micb-supply on lpass_vamacro
- [Medium] arm64: dts: qcom: Vivobook 16 DT inherits Vivobook S 15 panel
  and board dtsi
- [Medium] arm64: dts: qcom: Makefile missing x1-el2.dtbo target and
  alphabetical order
- [Low] arm64: dts: qcom: undocumented compatible
  asus,vivobook-16-x1607qa in bindings
- [Low] arm64: dts: qcom: split root nodes, unsorted labels, and gpu
  override style
--

commit 273985d644ee175b794950960be28ab5824da749
Author: yass27106 <yass27106@gmail.com>

> arm64: dts: qcom: add device tree for Asus Vivobook 16 X1607QA
>=20
> arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../x1p42100-asus-vivobook-16-x1607qa.dts     | 239 ++++++++++++++++++
>  2 files changed, 240 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-16-x1=
607qa.dts

[Severity: High]
This commit is missing a Signed-off-by: trailer, uses a handle instead of
a real name in the Author header, and has a raw diffstat in place of a
commit description explaining the hardware and supported components.

> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom=
/Makefile
> index 88230c4e00ea9..7332a73dbac71 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -509,6 +509,7 @@ x1e80100-qcp-el2-dtbs	:=3D x1e80100-qcp.dtb x1-el2.dt=
bo
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D x1e80100-qcp.dtb x1e80100-qcp-el2.dtb
>  x1p42100-asus-vivobook-s15-el2-dtbs	:=3D x1p42100-asus-vivobook-s15.dtb =
x1-el2.dtbo
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D x1p42100-asus-vivobook-s15.dtb x1p42100-asu=
s-vivobook-s15-el2.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+=3D x1p42100-asus-vivobook-16-x1607qa.dtb
>  x1p42100-asus-zenbook-a14-el2-dtbs	:=3D x1p42100-asus-zenbook-a14.dtb x1=
-el2.dtbo
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D x1p42100-asus-zenbook-a14.dtb x1p42100-asus=
-zenbook-a14-el2.dtb
>  x1p42100-asus-zenbook-a14-lcd-el2-dtbs	:=3D x1p42100-asus-zenbook-a14-lc=
d.dtb x1-el2.dtbo

[Severity: Medium]
Should this also define x1p42100-asus-vivobook-16-x1607qa-el2-dtbs and add
x1p42100-asus-vivobook-16-x1607qa-el2.dtb like the other X1E/X1P boards?
Without the composite rule, the build neither produces the -el2.dtb image
nor compiles the base DTB with symbol metadata for x1-el2.dtbo, which is
needed for EL2 boot.  Also, x1p42100-asus-vivobook-16-x1607qa belongs
before x1p42100-asus-vivobook-s15 in alphabetical order.

> diff --git a/arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-16-x1607qa.d=
ts b/arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-16-x1607qa.dts
> new file mode 100644
> index 0000000000000..fc572d779b311
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-16-x1607qa.dts
> @@ -0,0 +1,239 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/* Hybrid device tree for ASUS Vivobook 16 X1607QA (X1P-42-100).
> + * Base: proven x1p42100-asus-vivobook-s15 (panel, USB, boot path).
> + * Transplanted from x126100-asus-vivobook-16: audio stack
> + * (WCD9385 codec, WSA8845 speakers, soundwire, sndcard) + firmware path=
s.
> + */
> +
> +/dts-v1/;
> +
> +#include "purwa.dtsi"
> +#include "x1-asus-vivobook-s15.dtsi"

[Severity: Medium]
Does including x1-asus-vivobook-s15.dtsi without deleting &pmc8380_6,
&pmc8380_6_thermal, and &pmc8380_6_die_temp leave the third CPU cluster's
PMIC enabled on Purwa?  x1-asus-vivobook-s15.dtsi pulls in
hamoa-pmics.dtsi, so on 8-core X1P42100 where that PMIC is unpopulated,
the SPMI, VADC, and thermal drivers will probe and poll a non-existent
device at USID 6 unless those three nodes are deleted as in
x1p42100-asus-vivobook-s15.dts.

[Severity: Medium]
Does including x1-asus-vivobook-s15.dtsi directly also leave the 16-inch
16:10 Vivobook 16 (X1607QA) configured with the Vivobook S 15's 15.6-inch
16:9 2880x1620 eDP panel ("samsung,atna56ac03", "samsung,atna33xc20")
under &mdss_dp3 and other S5507-specific board definitions?

> +
> +/ {
> +	model =3D "ASUS Vivobook 16 (X1607QA)";
> +	compatible =3D "asus,vivobook-16-x1607qa", "qcom,x1p42100";

[Severity: Low]
"asus,vivobook-16-x1607qa" is not documented under the qcom,x1p42100
entry in Documentation/devicetree/bindings/arm/qcom.yaml, which causes
make dtbs_check to fail.

[ ... ]

> +&lpass_vamacro {
> +	pinctrl-0 =3D <&dmic01_default>;
> +	pinctrl-names =3D "default";
> +};

[Severity: Medium]
Should &lpass_vamacro also specify qcom,dmic-sample-rate and
vdd-micb-supply?  Without them, va_macro_probe() logs an error
("qcom,dmic-sample-rate dt entry missing") and ASoC DAPM substitutes a
dummy regulator for the vdd-micb widget instead of enabling the DMIC
supply rail.

> +
> +/ {
> +	wcd938x: audio-codec {
> +		compatible =3D "qcom,wcd9385-codec";

[ ... ]

> +&gpu {
> +	status =3D "okay";
> +
> +	zap-shader {
> +		firmware-name =3D "qcom/x1p42100/ASUSTeK/vivobook-16-x1607qa/qcdxkmsuc=
purwa.mbn";
> +	};
> +};

[Severity: Low]
This isn't a bug, but the second / { ... }; block above should be merged
into the root node at the top of the file, the &label overrides should be
sorted alphabetically, and the zap shader override can reference
&gpu_zap_shader directly instead of repeating status =3D "okay" on &gpu
(which is already enabled in x1-asus-vivobook-s15.dtsi).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/01b2c920412848ab854=
93acc2d4f5fc1@gmail.com?part=3D1
