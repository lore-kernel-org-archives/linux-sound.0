Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794603111;
	b=CV4S2+1wkTkfESGcVtoy2intd+mc6imF2EuUQVxbll6aHUk9lM7DU+bZIf9nw8q5bzHm
	 NT+FqAfIPoBRWh4/K6qTtLAIJ16kan/r5bvj5hD0QUlx2AIAFkeBlV0GJkmAw1wjKPnWM
	 2cmjTSPKYD1FJaBa4MRG3/gZH7LhniT8tNQoOrEmRn+vI+b7flvzpRlnt/Y6ag0d6H1t6
	 QuP3YU78F3FLU5nZk+TmLCGvKrUUAZh9QUnFUw0RV8Urj+G0OgodUUdy3VrKazvocyZw7
	 r6PObGavMP9BIbHpVtSs3pHe/aKcMbxitfMflVD2URDhoaLxb5eAv11+RZLk9PaPUHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794603111;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=TxDR5uoVi29IYdzO/SmccK9SUSlSLp5OZsh0EFtgquc=;
	b=2eDddn4SvJtV0hGENE0imrMcCEI8TAPpB/f2mAVnHHDuhe2HOqL/uR5NuwZLvsTGDCBd
	 lZ0PKojiD8d6nZNMnY4jQpaprQ6ikazDqMM/vFaHrvBVSX7t/VNdwBBTp3kfx3JN+WE+3
	 5k3p7eyIQNSZNE3caI+iCgQD1QwEQdZCtRNZNwlFwM82FkD3N7kyF9nFV5QbM+DIp/CId
	 /DNoPIGmqghtHfD4v8zuOHM6iYHuORRCFhNXedFc7ljaUnwe5PODEgNLLL8LRhvNnmPu7
	 0KoPYkwb1opzLVLUAdbsoCYQb7HQmU0jwMEt0yNighl8xw/ybd7Zf64SI4/ZqrwhJQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SxiVF640;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708F4606A331;
	Fri, 13 Nov 2026 20:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SxiVF640
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B26131F000C4;
	Fri, 13 Nov 2026 20:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794603111;
	bh=TxDR5uoVi29IYdzO/SmccK9SUSlSLp5OZsh0EFtgquc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SxiVF640ylULF2WKIumdrchh2J1L+dI9WDixWgGUorjS85Te3ckTcOynVKoDpVvdX
	 EdwSS27P38NrkYcT4QNO4yBe19tgTO1ILU6xFHdQWurHWkhEJ0VJizi/HNCkjToJGV
	 5pLEROzf7euUgmAL9kSTzCyZT6JdorI7SFtXYl/8t65yAjLHrD7xclb58EvalblTXQ
	 Rb+bFzDanbD/4dOZ14tMJ+aFFduuKL4x4j8gcWzWOBsgC0y7vdSSCaAn8MIfN9ZtHL
	 E3NRXxM5CZVmgXs0bowpJOVj4nFXPqwZt8VPtCKilNCG0tl5476iahvLKI58Y2Rw7E
	 uxWlekBVlpOPw==
Message-ID: <sashiko-outbox-213684@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: add device tree for Asus
 Vivobook 16 X1607QA
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Carter" <yass27106@gmail.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <bee078b697b74da694b5f9e6f518c0fb@gmail.com>
References: <2c4a807496c04047b6d5735e3946dd16@gmail.com>
 <bee078b697b74da694b5f9e6f518c0fb@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 20:51:50 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 6 potential
issues to consider:
- [High] arm64: dts: qcom: missing Signed-off-by trailer and commit
  message body
- [Medium] arm64: dts: qcom: missing /delete-node/ for pmc8380_6 on
  Purwa X1607QA
- [Medium] arm64: dts: qcom: missing qcom,dmic-sample-rate and
  vdd-micb-supply on vamacro
- [Medium] arm64: dts: qcom: missing x1-el2.dtbo target and
  &gpu_zap_shader reference
- [Medium] arm64: dts: qcom: x1p42100-asus-vivobook-16-x1607qa: wrong
  inherited eDP panel
- [Low] arm64: dts: qcom: split root node, unsorted nodes, and style
  violations in DTS
--

commit 0106da8e8437e65f83503717cf06104fc06ff24c
Author: Daniel Carter <yass27106@gmail.com>

> arm64: dts: qcom: add device tree for Asus Vivobook 16 X1607QA
>=20
> arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../x1p42100-asus-vivobook-16-x1607qa.dts     | 237 ++++++++++++++++++
>  2 files changed, 238 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-16-x1=
607qa.dts

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

[Severity: Medium]
Should this also define x1p42100-asus-vivobook-16-x1607qa-el2-dtbs with
x1-el2.dtbo and build x1p42100-asus-vivobook-16-x1607qa-el2.dtb, sorted
alphabetically before x1p42100-asus-vivobook-s15?

scripts/Makefile.dtbs only passes -@ to DTC for base DTBs referenced by a
composite *-dtbs rule.  Without the -el2-dtbs rule, neither the pre-merged
-el2.dtb is built nor are __symbols__ emitted into the base DTB, so
x1-el2.dtbo cannot be applied for EL2/KVM boot.

In addition, at the bottom of x1p42100-asus-vivobook-16-x1607qa.dts, the
GPU zap-shader firmware is specified via a nested zap-shader child under
&gpu (along with a redundant status =3D "okay" already set in
x1-asus-vivobook-s15.dtsi) instead of referencing &gpu_zap_shader directly
as x1p42100-asus-vivobook-s15.dts and x1-el2.dtso do.

> diff --git a/arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-16-x1607qa.d=
ts b/arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-16-x1607qa.dts
> new file mode 100644
> index 0000000000000..0092ae3db9cc8
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-16-x1607qa.dts
> @@ -0,0 +1,237 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2026, yass27106-hue <yass27106@users.noreply.github.com>
> + */

[Severity: High]
The commit message is missing a Signed-off-by: trailer certifying the
Developer's Certificate of Origin, and its body contains a pasted git
diffstat instead of a description of the ASUS Vivobook 16 (X1607QA)
hardware and why it shares x1-asus-vivobook-s15.dtsi.  The copyright
header here also uses a GitHub handle and noreply address rather than the
author's name and routable email address.

> +
> +/dts-v1/;
> +
> +#include "purwa.dtsi"
> +#include "x1-asus-vivobook-s15.dtsi"

[Severity: Medium]
Does this need to delete &pmc8380_6, &pmc8380_6_thermal, and
&pmc8380_6_die_temp after including x1-asus-vivobook-s15.dtsi?

x1-asus-vivobook-s15.dtsi transitively includes hamoa-pmics.dtsi, which
defines pmc8380_6 (SPMI USID 6), pmc8380_6_thermal, and pmc8380_6_die_temp
for the third CPU cluster on 12-core X1E80100 SoCs.  On 8-core X1P42100
(Purwa) platforms that cluster and its companion PMIC are unpopulated, so
leaving these nodes enabled causes the SPMI PMIC, temp-alarm, GPIO, VADC,
and thermal drivers to probe and poll absent hardware, just as
x1p42100-asus-vivobook-s15.dts avoids with /delete-node/.

> +#include "x1-asus-vivobook-s15.dtsi"

[Severity: Medium]
Does the 16-inch Vivobook 16 (X1607QA) really use the 15.6-inch Samsung
ATNA56AC03 panel inherited from x1-asus-vivobook-s15.dtsi?

x1-asus-vivobook-s15.dtsi configures the mdss_dp3 aux-bus panel node with:

arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi:
	aux-bus {
		panel {
			compatible =3D "samsung,atna56ac03", "samsung,atna33xc20";
			enable-gpios =3D <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
			power-supply =3D <&vreg_edp_3p3>;

Without overriding the panel node for this 16-inch (16:10) laptop, the
board binds the panel-samsung-atna33xc20 driver for a 15.6-inch 2880x1620
(16:9) AMOLED panel with Samsung EL_ON3 power sequencing and DP AUX-only
backlight control instead of the actual panel and backlight configuration.

[ ... ]

> +&lpass_vamacro {
> +	pinctrl-0 =3D <&dmic01_default>;
> +	pinctrl-names =3D "default";
> +};

[Severity: Medium]
Are qcom,dmic-sample-rate and vdd-micb-supply missing on &lpass_vamacro
(along with the vreg_l1b_1p8 LDO1 definition in &apps_rsc regulators-0)?

va_macro_probe() logs "qcom,dmic-sample-rate dt entry missing" when
qcom,dmic-sample-rate is omitted, and its "vdd-micb" DAPM regulator widget
falls back to a dummy regulator without enabling the 1.8V LDO1 DMIC micbias
rail unless vdd-micb-supply =3D <&vreg_l1b_1p8> is provided as on other X1
boards.

> +
> +/ {
> +	wcd938x: audio-codec {

[ ... ]

> +	sound {
> +		compatible =3D "qcom,x1e80100-sndcard";
> +		model =3D "X1E80100-ASUS-Vivobook-16";
> +		audio-routing =3D "SpkrLeft IN", "WSA WSA_SPK1 OUT",
> +						"SpkrRight IN", "WSA WSA_SPK2 OUT",

[ ... ]

> +&swr0 {
> +	status =3D "okay";
> +
> +	pinctrl-0 =3D <&wsa_swr_active>, <&spkr_01_sd_n_active>;
> +	pinctrl-names =3D "default";

[Severity: Low]
This isn't a bug, but several parts of this file diverge from the
devicetree coding style:

- The root node / { ... }; is split into two blocks with phandle references
  in between instead of a single root node block at the top of the file,
  and chassis-type =3D "laptop" duplicates x1-asus-vivobook-s15.dtsi.
- The top-level &label references, the DAI-link child nodes under sound,
  and the cpu/codec subnodes in wcd-playback-dai-link and
  wcd-capture-dai-link are not sorted alphabetically.
- In &swr0, status =3D "okay" is placed before pinctrl-0 and pinctrl-names
  instead of as the last property before child nodes.
- Multi-line property continuations in audio-routing, wsa-dai-link
  sound-dai, and the remoteproc firmware-name properties are aligned
  assuming 4-space tabs rather than 8-column kernel tabs.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/2c4a807496c04047b6d=
5735e3946dd16@gmail.com?part=3D2
