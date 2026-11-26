Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795718857;
	b=k8sPxL3L30ZSkeiL9a9+6Bd3XieyrSDj/dirCN//s5TZ9M9LhKV3A1/wQHaD9YDkW7qi
	 cX8b5rC5fuLciR+xDfshGznyuc46T8xcj4BW13LX1pAZgK+koTVVcRRVESlsQhokzt0qR
	 74Tby4DD0dbxWqYpzJu35Sf2Q/qI19xstEPYoLDZhmRQRmd9pARE6A/wZIG1avSeavwfk
	 x4ZFWgWaFZZuViNgiSPZFUq+y0LxdshhIagG7Hbew2GDq1PB6lCuQQNKPnlTyBuMpCxHn
	 yZ19Xn3lffzLk/HYULMbRhnykMyDv84bv+mj4xpf91IhoYyyQdcLeETjCiWfFMz7BKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795718857;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=4oiPnk4BKoppsHYKZqKHYXcx44kelqYLbXB97dadfMI=;
	b=5TJXiIqIdLurHCixUK8O6DXdqwa2t4IBgrNH/RAavrIVwC1kbTEzXietnko+NI9rHPAC
	 RYqHUn39ldNnK19iR+obpxXs5X8tn6i4H4BrVYTkbEvTtK0iL1F6I+DyjvNQbvcjUohxR
	 K1T6gFt9cGG1h00KM1G1W9I9mg7kvrgYI4lNQ1asfg1u0AqkhUDZcTUjXx4V9d0eQsftI
	 SAf6GTaahwZizoNGjzvDY4JubrpajDTc/qBHkjYz9htCUo1SjmXI77Rry1+E9R+6W1+7x
	 Sk8SsayBWzMdHxqA/AswpXEW7Ldp9hsANga+Tnnyn6Q3Sf9dOLDdaqqm6BOJbxPkpeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=orBtDPYO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC411606A31E;
	Thu, 26 Nov 2026 18:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=orBtDPYO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08D881F000CA;
	Thu, 26 Nov 2026 18:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795718857;
	bh=4oiPnk4BKoppsHYKZqKHYXcx44kelqYLbXB97dadfMI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=orBtDPYOVaHJ9HtbaIvfjNOCT4VaRAdsXxk8JARr6fflakqdqDW0JBGpS8EKkoxvg
	 rvcJPy2qqenQQVS1c9TfCqU8TPGFgvuYm8H0nia99be7guFeqmu7GoEPL72j53AGtk
	 HHdW896/znP1b7GaVb/j0b1CajMxdPsBnfhLDt8kLM8eYOLycR52FcbsydWAItf7bC
	 trDpnPrMvjfn7MYutC1JQrh+dqNE2j6v31ebBuEKr/TmFYVCfeS7u7ZsAVmwwPKoj4
	 E6lACtQDyObaUyqPiixPctZk1SxVe8pBK7pHWv1mOBDB2Wo9MSI1lG8roLIVCDbg5p
	 bBpKA6iqaG14Q==
Message-ID: <sashiko-outbox-236033@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/7] arm64: dts: qcom: glymur-asus-zenbook-a16: enable
 WCD9378 headset codec
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-sound@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261126183806.172485-6-srinivas.kandagatla@oss.qualcomm.com>
References: <20261126183806.172485-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261126183806.172485-6-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 18:47:36 +0000
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
- [Low] arm64: dts: qcom: reversed unit-address in wcd9378c codec@3,0
  node
--

commit 07e647dd9ed11b2ee7570b697d9090d52a74d29b
Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

arm64: dts: qcom: glymur-asus-zenbook-a16: enable WCD9378 headset codec

This commit enables the WCD9378 SoundWire headset codec, its DAI links, and
the vreg_bob1_e0 MICBIAS rail on the Asus Zenbook A16 (UX3607OA).

> diff --git a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dt=
s b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
> index c253597b5a5ae..ca035f10dc6cc 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
> +++ b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
[ ... ]
> @@ -763,6 +805,44 @@ right_tweeter: speaker@0,1 {
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
Should the unit-address on wcd9378c be @0,3 instead of @3,0 to match
reg =3D <0 3> (link ID 0, instance ID 3) and the qcom,wcd9378-sdw.yaml
binding?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126183806.1724=
85-1-srinivas.kandagatla@oss.qualcomm.com?part=3D5
