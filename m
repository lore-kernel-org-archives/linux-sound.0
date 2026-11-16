Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794863476;
	b=tBqIkW+/r38CwBRCZPuUxtk4q+rwukYQVXOLmlttYGaYCu8ob3HrbRireZJwAnp7l/Gi
	 X7tg7gJGcGcckHjLbE2amT1sG/b05uMrSI11k5EqpbXRzd8sWnUrCqu3OZcBrdegtVXcF
	 u1W57jnbI2eAtfiMmpjD6gMipDrDQFYS83Dr5w7p+N6IcYxkNkZxP49d8r0e/xSS30a/h
	 gmlu6i8Tzww7cFTJG7MWhVocf0pJlKJWxhsmCNIPsmy6/hAPm7nlibW99AekiZx4ftP6w
	 tvqI2tE9iSmLWr/BwDnbIZmYBXqQ8s0/QvqgiZC5RYeEKP5QGqqZ5j/VzeyOPJw7JAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794863476;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=tcEe+bc7/JT5qNzYlauFqxCQisim095qkW4mQ+Iy0dM=;
	b=WOY2IjsYbMsJS/eAlcHBCTxLDz1Fxl5otg8i1Wl/gNlttFhtbn6oBtLx2mEl9cLq8pp5
	 Vy3B9GDJBrL4aaHU45fIopSUtiTGcwnxuN9nx8f60RTT6wImHxUqxJJ4X8njCqF1J3HoM
	 ALC1lcMhXcg4wxWJvc8FqmvOD6IB1PmYMQKxZA8nyq3BcR+oF/tNFmdmJEUzhpLsm2d1c
	 cO/IDyT4wrVf/JI6tKW1TwNzR5nIrX2jwVLHEcG+GDnZ0KjjqBlE8SbHmvAwLkMeiwYIG
	 aZUuF54ywAX5MIy4kALBFad+jMxw6VSgqKzpiEA1Z6B4CJrDBoqKgK0WXSfW0cYhRWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lFruDWZJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E5A606A332;
	Mon, 16 Nov 2026 21:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lFruDWZJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F35831F000C4;
	Mon, 16 Nov 2026 21:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794863476;
	bh=tcEe+bc7/JT5qNzYlauFqxCQisim095qkW4mQ+Iy0dM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lFruDWZJA343PUKNRP4hWF3us8cWMoahlYCTc3eLZA146rjfV+nhIw02RGBGWmTMV
	 by70Lk7nPtT4EbCBAUsNRKL9dTeUqkD7/cATaNMfCxW/VG7QZCBcbi/GJ5e4QgTrAG
	 odegjcvABWtjcC15F+9MPHB0KhIJ3P3F18uxaGSxyVOIE+KYC7ci4PuqoVMbL9d31s
	 vTeSXNbg3TClme22AWsVNmPQChZxIidxZS5hWCI6vg6p6iiDHEEE7fHB+N0NABeVYE
	 uGQJDqHX+cjLKAxM4e/+HxKHMhRq+Xjh0IAql5Myhyh+eRlWYkygYoYbzcjqi3Qbk8
	 O0rGvTWmy8haA==
Message-ID: <sashiko-outbox-217692@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/3] arm64: dts: qcom: add device tree for Asus
 Vivobook 16 X1607QA
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Carter" <yass27106@gmail.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <6fc5be59b56e42728e33595d5415441f@gmail.com>
References: <45f11591823b4395aa19dd3a3ee6dc90@gmail.com>
 <6fc5be59b56e42728e33595d5415441f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 21:11:15 +0000
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

commit c3f535b7ac6cd47469ae3b65340861de92f7a5bb
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

[Severity: Medium]
Should the eDP panel node under mdss_dp3 be overridden for the 16-inch
Vivobook 16 X1607QA?

x1-asus-vivobook-s15.dtsi defines the panel for the 15.6-inch Vivobook S 15:

arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi:mdss_dp3 {
    ...
	aux-bus {
		panel {
			compatible =3D "samsung,atna56ac03", "samsung,atna33xc20";
			enable-gpios =3D <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
			power-supply =3D <&vreg_edp_3p3>;
    ...
}

Without overriding this node, the 16-inch X1607QA inherits the 15.6-inch
(2880x1620, 16:9) Samsung ATNA56AC03 AMOLED panel description and binds
the atna33xc20 driver, which enforces Samsung AMOLED power-cycling delays
and DP AUX backlight control rather than matching the 16-inch panel on
this laptop.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/45f11591823b4395aa1=
9dd3a3ee6dc90@gmail.com?part=3D2
