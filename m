Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794645672;
	b=1/exo+2ZsyAyidIklGk7KpCdUChwTf9+SrUGi+Sj5fiEdPQcskOkSMscv6B844Derfn2
	 yJEWummGIsxt+EdgWGv3JxoYCkQbBa1RWOUyusCetKiHkl2/4qZApAMeRHeYL1YmSSq5l
	 gbnnFJdh9yeQD9Qojtpje2h2q+JdVcgBhBhClziKjsmNPeejRx3joRJletifGKKp9kRBt
	 62MLTawbAU6QmyF+5lvbX7M4oaWsGaoEU5MyTTiczynELSUUZc52vjN1aGWTZunHcNzGv
	 63Bgz/ELukseJpbv00ac3oRs5d1m0VTIdS/2R4DxI1lozOuLqnjLSqsB9gK70b5ewIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794645672;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Th+cGiAcjlVJRTo6ec+9adOWEJWc1H/mrgEsPGtKGJc=;
	b=2hfqUbBqageAFPW0f1/nIuMkWLBHdX+NKsKsw1tMmNJh8vmZeOKGKItBlParIkfsoPum
	 W/zz1Wq2xp3c7qL1xDmhuXkZH3oYTEt14Yyl+4NNbvTh5lZKuBxO7OTvLQlx5eqKQMmhj
	 64NViy1EmfCGYxTy4S+ozzgf3+gZxxtRHXX02FufZ2PnUTqwbYpscd+RaFfR+mg2jbWCE
	 nKaXYnoA2ZecI6JUMA7OcKfexap1+ebTiSnlFPNTApd7bl3P/zFw2rCH3De7xAg5dVthQ
	 /xqIwr14pq+LSzsaySCPqv3FcKgtPcRFHg7XR7xhkLeJcC1BEIuc4+dvocf+rc7fyHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hJa03TIr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C563606A331;
	Sat, 14 Nov 2026 08:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hJa03TIr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97A461F000C4;
	Sat, 14 Nov 2026 08:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794645671;
	bh=Th+cGiAcjlVJRTo6ec+9adOWEJWc1H/mrgEsPGtKGJc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hJa03TIrS/2IKPqsjIEVrsvUUp7XgqnZ3q7WavPpjmmB+ZoAWOCV4/2Cq+otRtIe3
	 gNpZqtQNcPOmWdGdtDnfteysSbqxDUG/y2utW5yPud45cAz6p1WSfvNCvjKCUHbrcc
	 OOmovZnHOsnkeT1rvmTX9YAoYfnwiZp1fpGIQkeFLxWpbbFw198XaAGk6AR/ehK9W/
	 lVKwUeDNiIcek+5kEYq7J45/RjmHJ/FaB0o5b5ujzWE4QDYlm8MXW2lXRO8df1Q2lC
	 B0O+TAmGZZKG+PAQUrO+Q24TlOqFwBziXquLQff2rHYxu4O5Ph8io4oiDm6SO24zm9
	 VXDSOi2EAt8Aw==
Message-ID: <sashiko-outbox-214287@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] arm64: dts: qcom: add device tree for Asus
 Vivobook 16 X1607QA
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Carter" <yass27106@gmail.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <6ffb6f7ab9794a49a50771d23b3a1e1f@gmail.com>
References: <2dc9301fc1ec46cdb66dc49a85f721b1@gmail.com>
 <6ffb6f7ab9794a49a50771d23b3a1e1f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 08:41:11 +0000
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
- [Medium] arm64: dts: qcom: x1607qa inherits 15.6-inch s15 eDP panel
  node
--

commit 246e79ebfb4556e9bdaf80bc90837e339e322fb1
Author: Daniel Carter <yass27106@gmail.com>

arm64: dts: qcom: add device tree for Asus Vivobook 16 X1607QA

This commit adds the device tree for the 16-inch Asus Vivobook 16 X1607QA
laptop based on the Qualcomm X1P-42-100 SoC, building on
x1-asus-vivobook-s15.dtsi.

> diff --git a/arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-16-x1607qa.d=
ts b/arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-16-x1607qa.dts
> new file mode 100644
> index 0000000000000..3877809dcb33a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-16-x1607qa.dts
> @@ -0,0 +1,232 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2026, Daniel Carter <yass27106@gmail.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "purwa.dtsi"
> +#include "x1-asus-vivobook-s15.dtsi"
> +
> +/delete-node/ &pmc8380_6;
> +/delete-node/ &pmc8380_6_thermal;
> +/delete-node/ &pmc8380_6_die_temp;
> +
> +/ {
> +	model =3D "ASUS Vivobook 16 (X1607QA)";
> +	compatible =3D "asus,vivobook-16-x1607qa", "qcom,x1p42100";

[Severity: Medium]
Should this device tree override the eDP panel node under mdss_dp3
inherited from x1-asus-vivobook-s15.dtsi?

arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi:&mdss_dp3 {
	...
	aux-bus {
		panel {
			compatible =3D "samsung,atna56ac03", "samsung,atna33xc20";
			enable-gpios =3D <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
			power-supply =3D <&vreg_edp_3p3>;
	...
}

Per Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml,
samsung,atna56ac03 is the 15.6-inch 3K (2880x1620) Samsung AMOLED panel for
the Vivobook S 15, and samsung,atna33xc20 binds panel-samsung-atna33xc20.c,
which applies Samsung AMOLED EL_ON3 power-cycling delays and DP AUX
backlight control rather than standard eDP panel sequencing for this
16-inch laptop.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/2dc9301fc1ec46cdb66=
dc49a85f721b1@gmail.com?part=3D2
