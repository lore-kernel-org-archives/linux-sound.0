Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795365547;
	b=Hp11YibEOw9BmJg7ZvrvFbGVFZpUhAIzIaFvGnvdE9gnfIjoqfoNQFyIP7kdsM5ezX7N
	 p8mmVdSMdJzDF/VL8hMQ7h9obGG34rnmkWTD8hf7HuwKVG7vTftHPfcry6bBSOZLqtqOa
	 6Twxsb2rK/GIuqO7sjzQ7/Zy566FLWnSmXVjgfrB9W8R3anJw2CltwA1I6P3z9zez/tck
	 IgG6jQ6npEJpDxxSVKjP1HeKqe9wXs0geLHwZXYo39ixQ2HoQQncBIhOdF4tbtPBE2TzY
	 kTLjhiRW0mfAdmGvSWVtOv4FNkkwL5rkg8vP7tZULTKJUsYkAtCpy+7X+pjyCnQ3W6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795365547;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=34QMfa42+j/TZzNn7Ym2PfhWdmHuhRB1HZu/gZrYcZU=;
	b=Maz1VocxDUjkJJK3xkleuW4zsdg0q7AgHxBX9PRly0YBPViqbS0NTcrdXbI8+VxrC0uh
	 Mb7g53CCTcZtfnNwUwnabA1TEcbQ9sswpGp4aUR8iHOeceZysAo5By7ywK1jOtclnCkLx
	 JLNwHOMKGwOf9iK+TuMS9NSjNRcBgkZHG1z0xKRxLgozDBcTnHInvkhUQOyP/sBNY/eEm
	 OUFbgi7HBYsINTGywrO965seCgOhkkRkdWim4u04DkLjtUT1J7ohfH8kp5dWt/jwNdwL2
	 JnqRfslNhwhJiXI8YPyzFO+G/DxUvMoi9XSzcEAlk046DCSpb5Q5yzoVWzuSDt0kFsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XVJuGDGC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739C9606A320;
	Sun, 22 Nov 2026 16:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XVJuGDGC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9799D1F000CA;
	Sun, 22 Nov 2026 16:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795365546;
	bh=34QMfa42+j/TZzNn7Ym2PfhWdmHuhRB1HZu/gZrYcZU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XVJuGDGCWEzCv3Z1z3LzWHqb+kZzz+8BaDxz0G4UF7jyznvGTJxyZGWu7uXjjAmK4
	 fn8GGrHjkHgucdcSNW8hDK0eIHjQXOUBxyIOI0QRPSNbftcszK3yxDkfKyLY7780Wv
	 Cw/RSNphNHZw3rqtXn4Nm4E8CrHKZsUbBMzXXxIHRy8ANdqTVSTXypcKUrs1ZLz15+
	 pRcHkh1/QrIt3pOfwgKIt5Z8zDSUkzbJEkQ//hUyUoTiOjb8BtW4qwzQ/CJC+xacaR
	 spPzV4xejH7gbs4mV+2/vmZeRtECJqK8kI2+L612yjKavMT55lABKaMg+6as6b4gmG
	 79SwecmZIFQcg==
Message-ID: <sashiko-outbox-228115@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 22/24] arm64: dts: qcom: glymur-crd: add WSA speaker
 protection VI feedback
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261122161437.5994-23-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261122161437.5994-23-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 16:39:06 +0000
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
- [Low] arm64: dts: qcom: glymur-crd wsa-dai-link sound-dai exceeds
  binding maxItems
--

commit 8ab83f1947839b4f7156f526acb14af8beb8c7f8
Author: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

arm64: dts: qcom: glymur-crd: add WSA speaker protection VI feedback

This commit adds the WSA8845 speaker V/I sense DAIs, SoundWire VI ports,
and WSA macro VI capture DAIs to the WSA Playback link in
glymur-crd.dtsi, and updates the speakers' #sound-dai-cells to 1.

> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/d=
ts/qcom/glymur-crd.dtsi
> index 3a9cd5f3ec2b8..8b477df6901a0 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> @@ -252,10 +252,16 @@ cpu {
>  			};
> =20
>  			codec {
> -				sound-dai =3D <&left_woofer>, <&left_tweeter>,
> +				sound-dai =3D <&left_woofer 0>, <&left_tweeter 0>,
>  					    <&swr0 0>, <&lpass_wsamacro 0>,
> -					    <&right_woofer>, <&right_tweeter>,
> -					    <&swr3 0>, <&lpass_wsa2macro 0>;
> +					    <&left_woofer 1>, <&left_tweeter 1>,
> +					    <&swr0 12>, <&swr0 13>,
> +					    <&lpass_wsamacro 2>,
> +					    <&right_woofer 0>, <&right_tweeter 0>,
> +					    <&swr3 0>, <&lpass_wsa2macro 0>,
> +					    <&right_woofer 1>, <&right_tweeter 1>,
> +					    <&swr3 12>, <&swr3 13>,
> +					    <&lpass_wsa2macro 2>;
>  			};

[Severity: Low]
Does expanding codec/sound-dai to 18 entries exceed the maxItems: 8 limit
for qcom,glymur-sndcard in
Documentation/devicetree/bindings/sound/qcom,sm8250.yaml?  Running
dtbs_check on the boards that include glymur-crd.dtsi fails schema
validation unless maxItems is updated in the binding.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122161437.5994=
-1-srinivas.kandagatla@oss.qualcomm.com?part=3D22
