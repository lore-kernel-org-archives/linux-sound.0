Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795719026;
	b=Za282ei65i3ypRiMF9OrceWclil+11J2mP8SXCQbk4RcS3+F6dH/Fo8MK1dAsTeFen8/
	 tRfhxcdtkwlbpez0fJJY/pqOmU5Em29Ngxqa8hbKbSu9Ej7/TgxJpaK/rq24TcVDH3+nv
	 8mWLyid9rsh60/swBaq2AOQBS0rWAigKf16nlcyzt0ShgVOlMskAw9Qguk2hbt8JQ+FK9
	 GW27baAHekeScUQdEXsaxwLme+nGEBxUYqVn7xxuUhntHDwcMs1A7VcohupyAadF6iW4Q
	 0AQvlv/MLeyNZmTvaNrzS2z+mU5mh3iEFf9iyiIOvbcHBcn5yIdYN7LWIH3RNULLW0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795719026;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=upKRcQ8SQIUeYxIXjE/Ws7eOvE3RgRgNE32vG12Gt3w=;
	b=d+dlP9WRSZF94DBpND5zTFphTySbcRCEI1qOZi3xglK8rXXC4BdS/5NCGwrGVTnq/KJU
	 /ayIW/wLK1srVw/PuTD4uE8wChmcODT6d77/zroy9eXDhVaQcKnrUbbQgiuD+DvsDYlwN
	 hN9p/JO94VMbUr0OwWqdSwG4kjdXQv1z7XYDZJUs7cH7UuMsfID118RCIZ9rMV8YuffCq
	 RR0Nj4jIWUrT+gsJO5XmWn2dHQVuOtgRKr2zZo5tZTB+1GiNGelOm8POgMVQZPSwzndv7
	 BPuEDDbPoKHAL/8RzPDC6rNXzJwukc2+nyjhXykKtDt5CoJ4iepMmsrxJoEe3haGzEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="kt2U/xOp";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F6C606A31C;
	Thu, 26 Nov 2026 18:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kt2U/xOp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 412A71F000C4;
	Thu, 26 Nov 2026 18:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795719025;
	bh=upKRcQ8SQIUeYxIXjE/Ws7eOvE3RgRgNE32vG12Gt3w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kt2U/xOpqZPgCdFQpVC+on0Mz3z2PExVlRGPupzhTCY56fBgqYFWrLW4v2pZxDR+F
	 D0BKsf0PiSfZ2bCIQNvEWOOVvd1QjKadnfO33nMuz9dUhBwbgVTdFMJDbG58Yd1rOF
	 VDl35yL/kYzCwgpPVRjjNSYzIRkgAIAhrHtSLfeWchiiuAdi4SYGzN5x46lrSXNCoN
	 YEtiLjJb10kzlH68cz/CDiPfpVrQk6aJJRkckT334OEsopU4+Cl/v6vuSvOdBTrvHs
	 y3RoiO8ama67KNmaOLS1bs3zIBslbQgtJ/BkfMN9LU25jjVnsisx7k/32x1JhcGQTD
	 to+pCGILrAh0w==
Message-ID: <sashiko-outbox-236035@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/7] arm64: dts: qcom: mahua-t14s: enable WCD9378
 headset codec
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-sound@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261126183806.172485-4-srinivas.kandagatla@oss.qualcomm.com>
References: <20261126183806.172485-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261126183806.172485-4-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 18:50:24 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Low] arm64: dts: qcom: reversed unit address codec@3,0 on wcd9378c
  node
- [Low] arm64: dts: qcom: non-canonical property order in swr1, swr2,
  and wcd9378c
--

commit d90cb139af676ea03da26198b6708de77cb64730
Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

arm64: dts: qcom: mahua-t14s: enable WCD9378 headset codec

This commit enables the WCD9378 SDCA-compliant headset codec over SoundWire
on the Lenovo ThinkPad T14s Gen 7, configuring the swr1 and swr2 SoundWire
controllers, TLMM reset pin, and audio DAI links.

> diff --git a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd=
.dts b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
> index 2d6578edcc823..42e2ecb569928 100644
> --- a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
> +++ b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts

[ ... ]

> @@ -742,6 +777,44 @@ right_spkr: speaker@0,1 {
>  	};
>  };
> =20
> +/* WCD9378 multi-master: swr2 primary + swr1 dependent (DATA lanes 2/3).=
 */
> +&swr1 {
> +	qcom,multi-master-mode =3D "dependent";
> +	qcom,multi-master-peer =3D <&swr2 0>;
> +	num-lanes =3D <2>;
> +
> +	status =3D "okay";
> +};
> +
> +&swr2 {
> +	qcom,multi-master-mode =3D "primary";
> +	qcom,multi-master-peer =3D <&swr1 5>;
> +	num-lanes =3D <2>;
> +
> +	status =3D "okay";
> +
> +	wcd9378c: codec@3,0 {
> +		compatible =3D "sdw20217011000";
> +		reg =3D <0 3>;

[Severity: Low]
Should the unit address on wcd9378c be codec@0,3 instead of codec@3,0 to
match the Link ID and Instance ID cell order in reg =3D <0 3>?

> +
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&wcd_default>;
> +
> +		qcom,sdca-compliant;
> +
> +		qcom,port-mapping =3D <2 2 3 4 5 6 7 8>;
> +
> +		reset-gpios =3D <&tlmm 191 GPIO_ACTIVE_LOW>;
> +
> +		vdd-buck-supply =3D <&vreg_l15b0>;
> +		vdd-rxtx-supply =3D <&vreg_l15b0>;
> +		vdd-io-supply =3D <&vreg_l18b0>;
> +		vdd-mic-bias-supply =3D <&vreg_bob1_e0>;
> +
> +		#sound-dai-cells =3D <1>;
> +	};
> +};

[Severity: Low]
This isn't a bug, but per the DTS coding style, standard properties should
precede vendor-specific qcom,* properties, and pinctrl-0 should come before
pinctrl-names.  In &swr1 and &swr2, num-lanes is placed after
qcom,multi-master-*, and in wcd9378c, pinctrl-names precedes pinctrl-0 while
qcom,sdca-compliant and qcom,port-mapping are placed before reset-gpios, the
vdd-*-supply properties, and #sound-dai-cells.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126183806.1724=
85-1-srinivas.kandagatla@oss.qualcomm.com?part=3D3
