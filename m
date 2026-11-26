Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795719000;
	b=fMTRvxqK7LkACm5YGeIel9qeqGNMA447LPMs24QRoWqUiVcgMtaIOqSpetIMPyahGIQd
	 l1nOV8/9xSxfyCdNNNSkwYVTuedokZvsEU2dVUlKU+6pKgfhy+j0GKGgtwGfumJlA2aHh
	 P0/6sz69uhxqrWHR5PSGhKQVayXQTr0s29wp6xovS5fVCczSezmWvLv1woN23oqy6X8Mb
	 ZgYlLnOodO5ltLkKDUHCa6Dh8jFgxKyi4grRuQVOXqPvFnV2enJCFoXnjFr1ry8DQRTkE
	 /az7wXjn/W3jvvs19AtklOWYGOz959JjOjInpsXzgioT2Pgw/xMYyR/+T+xTl9r1nEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795719000;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=jLtT3v/hHF87VwRc3dXwwdt5vQ6kMiJljjFOoVV4GW0=;
	b=BuaNB/XaaMNecLLyr7tRbqRxclJkvw0CHptR+XhWVgbsmPaMO9delk5pslzKxxWUiJN9
	 Zz4BkRUYjzc5IOUWsuzdYFFNLbJQECGHnxZJ+BllQQpUB9YNeM7dRlJG7EtLzvUG3QOXO
	 KcwJ4C5g06fLQiu1Wrz+klqGhahA6N+zygFAigIIMSua7Bo+WZNTeVKWNM13896sKp1hj
	 fHUIw3zastieD9FDckfm5cQIeg1EJbN6RMKD+Siad7tM8MCoH7VFP6qz3hYz4GCJWXHPB
	 /XagXSMKmsJ+xZzxgr0i923fMggD7/7KCxVswJc9xU1D2R7NMbMemZg674C9MUYdURA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pw0ZRCPs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A44A606A31C;
	Thu, 26 Nov 2026 18:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pw0ZRCPs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35A051F000C4;
	Thu, 26 Nov 2026 18:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795718999;
	bh=jLtT3v/hHF87VwRc3dXwwdt5vQ6kMiJljjFOoVV4GW0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Pw0ZRCPsIAJq1bALozCWoh3I1Li839849+iMfpCHVyBDggu7rKW8e3uFWuqRF2TXz
	 L/+Jo/OgZwiguf6iC38c4h4GY9KLc9M1kRvTtY54GUiR0lFrGOSudblQY2b7XQugzV
	 rBraBJjF9nQoWDG/WiaEpO3I4Mfg/NbtM/i2qtMWWsWAPXhcN3Z+p66pfALln0cPBY
	 1+5vGSKYJz7hYRlz1C6NI+UCP5x+/wYREgONVg4yv/h+F0fTODGUh4Aoy5XwSYFiQW
	 nzh5aYELEOWlf9i0L8SFOb8LKPwAna7C7yh2IdqBrOZmXeSL8upXlIPYy6U6xQC3NA
	 XdmZvl5HTsYnw==
Message-ID: <sashiko-outbox-236034@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/7] arm64: dts: qcom: glymur-crd: enable WCD9378
 headset codec
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-sound@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261126183806.172485-3-srinivas.kandagatla@oss.qualcomm.com>
References: <20261126183806.172485-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261126183806.172485-3-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 18:49:58 +0000
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
- [Low] arm64: dts: qcom: glymur-crd: reversed unit-address in codec@3,0
  for reg <0 3>
- [Low] arm64: dts: qcom: glymur-crd: non-standard property order in swr
  and wcd nodes
--

commit 89daa162b345f778b119d25e91fe91d54941becc
Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

arm64: dts: qcom: glymur-crd: enable WCD9378 headset codec

This commit enables the WCD9378 SDCA headset codec over SoundWire (swr2
primary and swr1 dependent) along with the playback/capture DAI links and
reset GPIO pinctrl state on Glymur CRD.

> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/d=
ts/qcom/glymur-crd.dtsi
> index 3a9cd5f3ec2b8..be0a2cf10f543 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi

[ ... ]

> @@ -791,6 +826,44 @@ right_tweeter: speaker@0,1 {
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
Should the unit-address on wcd9378c be codec@0,3 (or audio-codec@0,3) to
match reg =3D <0 3>?  SoundWire slave reg cells are <link_id instance_id>,
so @3,0 reverses the link ID and instance ID relative to reg and the
qcom,wcd9378-sdw.yaml binding example.

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
precede vendor-specific qcom,* properties (num-lanes before
qcom,multi-master-* in &swr1 and &swr2, and reset-gpios, vdd-*-supply and
#sound-dai-cells before qcom,sdca-compliant and qcom,port-mapping in
wcd9378c), with pinctrl-0 placed before pinctrl-names.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126183806.1724=
85-1-srinivas.kandagatla@oss.qualcomm.com?part=3D2
