Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793693757;
	b=3UmuujkvQz/uluU1cOebzZ+OmxnXW3gkoCfADkH470nSXIYjWA3Jcm1Jy8K/LKxO0WCS
	 yfJwMEc5nIUm8NAx7gTL37sUkbasmD6ZJxToDKkratepyoKQud9uRhs6SNjGXLHovBdGr
	 4PwaY+PEQSiJUhIij0e7lqPwqTcc8ZLzTURbZ+ojbpglPPZIbBzGo2fbeihDruzigPDD9
	 SIXtapPSjw/lRIeN8bHilluJhwJae2vtK/ue5eFJEkSacu8rOQ1Ljvdp/HcVMDZCb09Rr
	 COl3uxo6dVVCnygXHRW9NvZS9AF55QXjgeg9nZbBCS5YizgbTxZr8jtrvZdcbOy66wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793693757;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=oMEG94uXx3ths6Q0X6yf4IGn6gzot/8TgdAvgghHqOY=;
	b=wS9JUU7Mg+9twG9oUFsmWqs2JexZV0yvg/amh1LDTRMjrIa1DsPhA+L8k1BPiXbUu9HY
	 d7c09TD4PE/4B/0jgLzBVK0/Ka6hHp+ZVKdP+itlGeWeXuyYc8inzSIeLENGw80z+oSFE
	 9/HZBjnPmChu+OfwbLPN0gKwUnm1PpoNykSadWP8OHuYfMyNX9a5tIId/papuem4681np
	 diejV+ZgTKRpfbu7xStbe2o+lQEaaaRXzJ28vtsZ/v/UoT0hLW9boSNFTh6tTKaoPqkoc
	 7cRJJcnLrBRSdQcNzAoX7F33Yq64VS1fNY3z3f88xNJdZk092fIoaoMqxhT2uFgCF9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=St9xxpH6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABC8606A324;
	Tue,  3 Nov 2026 08:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=St9xxpH6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89F671F0093A;
	Tue,  3 Nov 2026 08:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793693756;
	bh=oMEG94uXx3ths6Q0X6yf4IGn6gzot/8TgdAvgghHqOY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=St9xxpH62LJnKBWqAuN6h+mtqExwxr/O+WTYhRLombHHi82pjySJSRK+Mlmdz+sXz
	 LFEMn/U7xvZogi8j6TKZWoZJoiYqRBjgxQDOdv0Pk0Gy1mHFR8/RmC/0o4/iOr4wrl
	 mFXy4eK06DhWaw+3hMVQDsfhJZS54//q0tsKFH4TVROzG2wLuN0CCeu8mkqMW4KJDX
	 uDob9/lish7aUUY9B49rlyURagAZJvfPBkcQSH8avTm0txSEej2zPO4eIcDAuGLQXk
	 FaJAg3m7TeCpmlm7XUnslrNdnsMygHdvzdcqkYWC9WS+n49VpVNaeBE/C99ZCr2+oq
	 lW/G7wWBF5dYg==
Message-ID: <sashiko-outbox-194812@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 11/22] arm64: dts: apple: t8103-j274: Add
 speaker/headset jack nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Calligeros" <jcalligeros99@gmail.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261103-macaudio-v4-11-637484efe46d@gmail.com>
References: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
 <20261103-macaudio-v4-11-637484efe46d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 08:15:56 +0000
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
- [Low] arm64: dts: apple: t8103-j274: unnecessary #address-cells/#size-cel=
ls in sound
- [Low] arm64: dts: apple: t8103-j274: duplicate &i2c2 and root node blocks
--

commit 5f98a7f1339930a19f607ba0ee5a326410be0b76
Author: James Calligeros <jcalligeros99@gmail.com>

arm64: dts: apple: t8103-j274: Add speaker/headset jack nodes

This commit adds the TI TAS5770L speaker amplifier and Cirrus CS42L83
headset jack codec nodes to the M1 Mac mini (J274) device tree, along
with the sound node linking them to the MCA controller.

> diff --git a/arch/arm64/boot/dts/apple/t8103-j274.dts b/arch/arm64/boot/d=
ts/apple/t8103-j274.dts
> index 1212852251e07..2fcadd77b1c90 100644
> --- a/arch/arm64/boot/dts/apple/t8103-j274.dts
> +++ b/arch/arm64/boot/dts/apple/t8103-j274.dts
> @@ -75,4 +75,74 @@ &i2c2 {
>  	status =3D "okay";
>  };
> =20
> +/* Audio codecs */
> +&i2c1 {
> +	status =3D "okay";
> +
> +	speaker: codec@31 {
> +		compatible =3D "ti,tas5770l";
> +		reg =3D <0x31>;
> +		interrupts-extended =3D <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
> +		shutdown-gpios =3D <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
> +		#sound-dai-cells =3D <0>;
> +		ti,imon-slot-no =3D <0>;
> +		ti,vmon-slot-no =3D <2>;
> +	};
> +};
> +
> +&i2c2 {
> +	status =3D "okay";
> +
> +	jack_codec: codec@48 {
[ ... ]
> +	};
> +};
> +
> +/ {

[Severity: Low]
As reported by Sashiko on v3 [1], arch/arm64/boot/dts/apple/t8103-j274.dts
already has an &i2c2 block just above &i2c1 that sets status =3D "okay", as
well as a root / { ... }; node at the top of the file:

    / {
    	compatible =3D "apple,j274", "apple,t8103", "apple,arm-platform";
    	model =3D "Apple Mac mini (M1, 2020)";
    	chassis-type =3D "desktop";

    	aliases {
    		ethernet0 =3D &ethernet0;
    	};
    };

Could jack_codec be placed inside the existing &i2c2 block (or replace the
earlier stub) and the sound node be placed inside the existing root / node
instead of opening duplicate &i2c2 and / blocks in the same file?

> +	sound: sound {
> +		compatible =3D "apple,j274-macaudio";
> +		model =3D "Mac mini J274";
> +
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;

[Severity: Low]
Does defining #address-cells and #size-cells in the sound node trigger a
dtc avoid_unnecessary_addr_size warning when building dtbs with W=3D1?

Neither the sound node nor its headphone-dai-link and speaker-dai-link
child nodes define reg, ranges, or dma-ranges properties, which causes
check_avoid_unnecessary_addr_size() in scripts/dtc/checks.c to warn:

    FAIL(c, dti, node, "unnecessary #address-cells/#size-cells without \"ra=
nges\", \"dma-ranges\" or child \"reg\" or \"ranges\" property");

Should #address-cells and #size-cells be removed from both the sound node
here and Documentation/devicetree/bindings/sound/apple,macaudio.yaml?

[1] https://lore.kernel.org/r/20261018-macaudio-v3-10-abdff7741dea@gmail.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-macaudio-v=
4-0-637484efe46d@gmail.com?part=3D11
