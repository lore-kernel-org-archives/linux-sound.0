Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793695929;
	b=rC4OkUOV7fs0+dJr70vvgJyyWEKWgFj55pYSbTTJUmgyRbZ/OnF1uzZU7TUc1/zeJM11
	 u4Wouto6e+P9i0QgtBAPO4fBPN1Hzd/rNQNxemVZEGud1ymeBfZ3w3hkK3ZrWFgDmRmIb
	 E4wa/ggVOIY+D6gct23HwXu+YoqZNeKxRoQ4T2GXuZg8rrzLaS4XPm6QRti90XrlONlTE
	 FjX1+iE5noVM2kviwtlGC6F1N5/Zy1GP2LcSxeQ1CJiIVRLys0WWML819PVacG4u2Xtnx
	 9b4nQHAF7JzNeVdEVZ7nD7y177tm8mmkOSpmTFVfpwNjjcShC+jm7jOeBscXTTkTG2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793695929;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=JQdXkRbY5tBUk/8uhoReaqjfvCnLIIFiCpm3rkQK68E=;
	b=fkjsBJgh6VEAJ9L6+bRd8iKQhEzWmH+8elc1XUVCMC1CAB32vZxmCnwgBgIVS4Uq4JZB
	 ug/O/SDfbcQ9STVesOewk1vB2C22gpugcHhhfkgj60EbLRzQilnLsDFyKS10tJPzA5vsj
	 X5VkvHqkBUq/S9BYF7k71XWj653d38VcuRJnmiZWoI/8DWQgAALBQu8nUlG+KPdE8MjSw
	 Y182YlCVpf4zL30vl5y1oKFPTk5rgWgQV84ytlT+vkIrzwFr43gpMe2riEfDM4Dcu5k4U
	 1mmVcI5gk1fnr0pXKrEbiFtuRbM+Cwv89nJ6MKujPBWn3m1K1DqL0UFL5wgj0hRjlrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="LQZon/u/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9748D606A326;
	Tue,  3 Nov 2026 08:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LQZon/u/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB6FD1F000C1;
	Tue,  3 Nov 2026 08:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793695929;
	bh=JQdXkRbY5tBUk/8uhoReaqjfvCnLIIFiCpm3rkQK68E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LQZon/u/U+FTcAZ33zUurlNH2pcmGzeMTP5Uy1Opuzddb7BnftkW4RB+AVpLx/wTC
	 3ns0EG2Z/Cr8FOZm49IaFiIjvjm5gsvdqX3MWnK2Hg29nh64o/7xcqIPLfJmE4dqE2
	 Uv4MGxl+cOvkVyLi4An/+tSR4QvqvZsq2S+WGXZJKhfAe+Dg+ANLCytWHyp9pNWrfo
	 pIN+zFMraDZSzteO7vmRMifVN7EKAmuDfsLCaliV0UPkOEOMMhrZPXJ9Nb02Ft1KMt
	 +bQ9+Y7ce7ZaKkA3OOD+J+P4LQJOiIqj8o21s9/NRy5GJ7Mi80suYymOXSTMl3CF/8
	 72DLew2yS1sYw==
Message-ID: <sashiko-outbox-194889@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 13/22] arm64: dts: apple: t8103-j293: Add
 speaker/headset jack nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Calligeros" <jcalligeros99@gmail.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261103-macaudio-v4-13-637484efe46d@gmail.com>
References: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
 <20261103-macaudio-v4-13-637484efe46d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 08:52:08 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] arm64: dts: apple: unnecessary #address-cells/#size-cells in j293 s=
ound node
- [Low] arm64: dts: apple: duplicate &i2c2 and root node blocks in t8103-j2=
93.dts
--

commit 7afed482bafffba735ddfd1d14a91b354bbef084
Author: James Calligeros <jcalligeros99@gmail.com>

arm64: dts: apple: t8103-j293: Add speaker/headset jack nodes

This commit adds device tree nodes for the TI TAS5770L speaker amplifiers
and Cirrus Logic CS42L83 headset jack codec on the M1 MacBook Pro (J293),
and wires them up to the macaudio sound card node.

> diff --git a/arch/arm64/boot/dts/apple/t8103-j293.dts b/arch/arm64/boot/d=
ts/apple/t8103-j293.dts
> index 1d074b9e60183..6980247b94e55 100644
> --- a/arch/arm64/boot/dts/apple/t8103-j293.dts
> +++ b/arch/arm64/boot/dts/apple/t8103-j293.dts
> @@ -133,5 +133,119 @@ &displaydfr_dart {

[ ... ]

> +&i2c2 {
> +	status =3D "okay";
> +
> +	jack_codec: codec@48 {

[Severity: Low]
This isn't a bug, but arch/arm64/boot/dts/apple/t8103-j293.dts already
has an earlier &i2c2 reference that sets status =3D "okay", as well as an
existing root / node at the top of the file:

arch/arm64/boot/dts/apple/t8103-j293.dts:
    / {
        compatible =3D "apple,j293", "apple,t8103", "apple,arm-platform";
        ...
    };
    ...
    &i2c2 {
        status =3D "okay";
    };

Could the earlier &i2c2 block be merged with this one and the sound node
placed into the existing root node to avoid duplicating both blocks in the
same file?

[ ... ]

> +/ {
> +	sound: sound {
> +		compatible =3D "apple,j293-macaudio";
> +		model =3D "MacBook Pro J293";
> +
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;

[Severity: Low]
Does defining #address-cells and #size-cells in the sound node trigger a
dtc avoid_unnecessary_addr_size warning when building DTBs with W=3D1?

Although Documentation/devicetree/bindings/sound/apple,macaudio.yaml lists
#address-cells and #size-cells on the sound node, the child nodes
(headphone-dai-link and speaker-dai-link) do not have reg or ranges
properties, so check_avoid_unnecessary_addr_size() in scripts/dtc/checks.c
warns on this node under W=3D1.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-macaudio-v=
4-0-637484efe46d@gmail.com?part=3D13
