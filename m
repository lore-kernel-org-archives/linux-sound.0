Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795365472;
	b=T6YlifEMGznRYHxkNdTe+d4JQdr8kewxlfWab6TR1n1N9tFsbg6RyPGgD8Um/epgjhkJ
	 K08vmkUA+IwN2vk8GM1VpvrWhvv4i/i4F9mKMZeaXyjIgsdEwC9fwHD/zbnxxK9qXnpIQ
	 W7nByT+dNMwpsGDIzIT3I5fqFj0+1BG2ahIfMnKGhwYbxLVZhwBvd0QMZpb+ghYtgqQwK
	 UU7iMCikhcLKY8DFyGWHs9uuOK9OZN3rVkyGo85SzBfOQCJwETB6pnCw+jBCEqa0eYCnM
	 cJLR+c+cQDYWHm7CfDkoDYz/uofdIGWcLWWWE5FVh3NhP6CRw+KzoxJE7h4WynB1Ykw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795365472;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=bXN6FWjrY6C70eflxzl8Fh02K6+Cm6eVqEyaZxX2awo=;
	b=U0lbrk7C93BxiGZcY/iSz9g1+Cn6C0O6So4wOY8n4R9/1FKXbtfrwHl6dGVA1abMf9+t
	 IZJWU7WSM/2zVZ2zUUYLObcyoVb+mv5uOqJuXoCnQn5OvzsKFwUAS+rpQKXQJ0wx7gC6j
	 2bHLvynssf5x6MNI7s8cC+DS1JOFK5k2wX7Q+ineJ0a4r5TX2YPZm2tEFraU5t/SXrMcJ
	 touFb0QUASHQe+2VW+nM+v8mMgh/YMM9T7mzQnb3Ie/pMShEqn43p3KU84oJ/S3SNHQAr
	 qV+aRFV1EvvIc+75ZxJ9Z29YhueLLV0YqxnV77cn+Pa+cJI16eyuaoQE0N24QyiBP7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YFHsL0g5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B311606A320;
	Sun, 22 Nov 2026 16:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YFHsL0g5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CD581F000C0;
	Sun, 22 Nov 2026 16:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795365471;
	bh=bXN6FWjrY6C70eflxzl8Fh02K6+Cm6eVqEyaZxX2awo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YFHsL0g559vgZBM5nlKmkH2DxlmI4ZbSU0CU9EZyykSQzjYZcrifzles2rPODJDXL
	 pfNtnpiJW+0rib7UPFv3LG+X+9iSNP5bePWZ7Dq6c/YEuYAvA3SZRLvK2Hwr1c6kF2
	 9tWBw0YAJi+n9e6HSYEs7kxwqX70RkjhA0PBCpweSOEZ0LRq0Urbm+2iYoZQM6GiNs
	 TQLnvZ0NZqXHOj4gJvAs6PVLBf0bnULHCgxD/j0sZH0Sz2BYwqu1MXUMtZ25AN1fqG
	 A/BtruxM8qQvnWcdYqN7J7YrUQY4EhDh7uqH3lkBbfZT48QFxqJdpB39XZC0RJEqb8
	 pUzXgqibcfGWw==
Message-ID: <sashiko-outbox-228111@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 24/24] arm64: dts: qcom: x1e78100-t14s: add WSA
 speaker protection VI feedback
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261122161437.5994-25-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261122161437.5994-25-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 16:37:51 +0000
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
- [Low] arm64: dts: qcom: x1e78100-t14s: wsa-dai-link codec sound-dai
  exceeds maxItems
--

commit 5cf1ae53e98ac53524b425fd8d73f1d229ada7c3
Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

arm64: dts: qcom: x1e78100-t14s: add WSA speaker protection VI feedback

This commit adds the WSA8845 V/I sense DAIs, SoundWire VI ports, and WSA
macro VI capture DAI to the WSA Playback link in the Lenovo ThinkPad T14s
device tree, and updates the speaker nodes to use #sound-dai-cells =3D <1>.

> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi =
b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> index 1536ad8d47933..2c7166e15097d 100644
> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> @@ -477,8 +477,20 @@ cpu {
>  				sound-dai =3D <&q6apmbedai WSA_CODEC_DMA_RX_0>;
>  			};
> =20
> +			/*
> +			 * WSA SPKR playback-side codec DAIs plus the WSA
> +			 * speaker-protection VI capture-side DAIs. One MM1
> +			 * playback open brings up both chains via the
> +			 * machine driver's multi_direction_codecs flag;
> +			 * the SP<->SP_VI control link in the tplg handles
> +			 * the DSP-side pairing.
> +			 */
>  			codec {
> -				sound-dai =3D <&left_spkr>, <&right_spkr>, <&swr0 0>, <&lpass_wsamac=
ro 0>;
> +				sound-dai =3D <&left_spkr 0>, <&right_spkr 0>,
> +					    <&swr0 0>, <&lpass_wsamacro 0>,
> +					    <&left_spkr 1>, <&right_spkr 1>,
> +					    <&swr0 10>, <&swr0 11>,
> +					    <&lpass_wsamacro 2>;
>  			};

[Severity: Low]
Does this 9-entry sound-dai list exceed the binding limit for
qcom,x1e80100-sndcard?  Documentation/devicetree/bindings/sound/qcom,sm8250=
.yaml
caps codec sound-dai at maxItems: 8, so make dtbs_check will fail unless
the schema is updated.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122161437.5994=
-1-srinivas.kandagatla@oss.qualcomm.com?part=3D24
