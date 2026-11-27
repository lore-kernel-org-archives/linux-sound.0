Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795796417;
	b=Tuw8TaET2A1Fjjl5wGmYv/qugy/JfIyAlR4JUHAqvegn4XQlwQv5lBLIez9d+W/heHbf
	 SaOYFRzuMlch1oWnqzC+gsRm0anawmo4OGSqqX1EFgB3PsKLq1rJTGOBzZXpZc67iRgUQ
	 tnavsk+WUj4Dc8VmxPcKFHl2mq2KZ4y5EYBK1Ok6XGt5ciP4JeA0H2hmjmleAMTlbOlO/
	 wbROGef3nH1QBLS48ImFD9dMZMfs3aV8U75L/9FV0B1prFt5VtNpFvWtJ48L2RIQ5K9L2
	 RxsR1WY8fjrq8Cid4xIzi3aJkvnNewib00p+uvLrJu5BZ0VXb2NZMYZxBPZgvofRzwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795796417;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=1vXTXQCs0X9N8jrDwyfagQIKQlTafSyTHo5dQMe7GJU=;
	b=LK8UxpbMbQ5apmZzMa4jyhnfCxFnCNJ6SL4qOAUuQyf7cXnVy5UZBpHQWkqO5sHy86YM
	 Cj9za/IvPF03jRKwrWYZeg5FH2L7N6JJCx3L052YGRp/yx5mwJ5ULZA6B0G2kh4yD/eei
	 MvmvdL9R99uQvvuhopr5llnu7n8nywt+DJ7ToAZwl5xXaAqLDv2dFIXYfW99sYPzYLPdS
	 HkqT+vVWGkR6ihNQFd38S7sh39/BSBKq8ephuK0UmKVDbzvPAb1/SmwD4lJewP3iJr9T/
	 ki0W9yiGAMa8YEMcaY8cVUFXJxSgJ5r5Fyd/c+PHke0i29lXo4dKfiUX7bDlGBNaycQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="NMX1uB/+";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF32606A31C;
	Fri, 27 Nov 2026 16:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NMX1uB/+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7E9E1F00893;
	Fri, 27 Nov 2026 16:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795796417;
	bh=1vXTXQCs0X9N8jrDwyfagQIKQlTafSyTHo5dQMe7GJU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NMX1uB/+kiyIvoWG6RhYboNlbhluLwD3LZPD/i7qCY/GIvpApZK41W0hJOzM8kjgy
	 wN2e5XEollAUpCwvAxbts6Tg+ExjzlZ9c+edBgdEQCWMyPaSm4xMRjPGIFgAxXNJhF
	 gxxbjjrrYY43V28ACxpgG0WFF4O9J7kIjrq18/te7P/W+NqNKp4VX74MVbkQbRMUyS
	 b2sHDmI8H6YfN/mhYgig/V5V8M9U2wmUy8O3AmFp9gbgZwETS27OREwN9nBjBJPEpC
	 0VyBq7Q6eO4nmi2lAzmjvkTr1V8P8J8MOoOrABmTtGcaz8j7oWVlsvCsx4U2p0tEuR
	 Vup/ra8P4sQeg==
Message-ID: <sashiko-outbox-237869@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/7] arm64: dts: qcom: glymur: add LPASS macros and
 RX/TX SoundWire
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-sound@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261127155520.358909-2-srinivas.kandagatla@oss.qualcomm.com>
References: <20261127155520.358909-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261127155520.358909-2-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 16:20:16 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [High] arm64: dts: qcom: glymur: unmatched lpasscc compatibles defer
  swr1 and swr2
- [High] arm64: dts: qcom: glymur: lpass_rxmacro fails probe due to
  unhandled codec version 2.9
- [Low] arm64: dts: qcom: glymur: undocumented lpass-rx-macro and
  lpass-tx-macro compatibles
--

commit 8d403c82a4073e4e3d1e793a05a1ce2568c6a1a7
Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

arm64: dts: qcom: glymur: add LPASS macros and RX/TX SoundWire

This commit adds the LPASS RX/TX macro codecs, the LPASS audio and reset
clock controllers, and the swr1 and swr2 SoundWire controller nodes to
glymur.dtsi.

> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/q=
com/glymur.dtsi
> index 165dfa11f17f5..9cb7506656fba 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -4669,6 +4669,66 @@ q6prmcc: clock-controller {
>  			};
>  		};
> =20
> +		lpass_rxmacro: codec@6a70000 {
> +			compatible =3D "qcom,glymur-lpass-rx-macro", "qcom,sm8550-lpass-rx-ma=
cro";
> +			reg =3D <0 0x06a70000 0 0x1000>;
> +			clocks =3D <&q6prmcc LPASS_CLK_ID_RX_CORE_TX_MCLK LPASS_CLK_ATTRIBUTE=
_COUPLE_NO>,
> +				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +				 <&lpass_vamacro>;
> +			clock-names =3D "mclk",
> +				      "macro",
> +				      "dcodec",
> +				      "fsgen";
> +
> +			#clock-cells =3D <0>;
> +			clock-output-names =3D "mclk";
> +			#sound-dai-cells =3D <1>;
> +		};

[Severity: High]
Will lpass_rxmacro fail to probe with -EINVAL on Glymur?

When lpass_vamacro probes first as the fsgen clock provider,
va_macro_set_lpass_codec_version() sets the global LPASS codec version to
LPASS_CODEC_VERSION_2_9.  Unlike the VA and WSA macro drivers,
rx_macro_probe() in sound/soc/codecs/lpass-rx-macro.c does not handle
LPASS_CODEC_VERSION_2_9 in its switch (rx->codec_version) statement and
falls into the default branch, returning -EINVAL before registering the
lpass_rxmacro DAI or the iface clock needed by swr1.

> +
> +		swr1: soundwire@6a80000 {
> +			compatible =3D "qcom,soundwire-v3.1.0";
> +			reg =3D <0 0x06a80000 0 0x10000>;
> +			clocks =3D <&lpass_rxmacro>;
> +			clock-names =3D "iface";
> +			interrupts =3D <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
> +			label =3D "RX";
> +
> +			pinctrl-0 =3D <&rx_swr_active>;
> +			pinctrl-names =3D "default";
> +
> +			resets =3D <&lpass_audiocc 0>;
> +			reset-names =3D "swr_audio_cgcr";
> +
> +			#address-cells =3D <2>;
> +			#size-cells =3D <0>;
> +			status =3D "disabled";
> +		};
> +
> +		lpass_txmacro: codec@6a90000 {
> +			compatible =3D "qcom,glymur-lpass-tx-macro", "qcom,sm8550-lpass-tx-ma=
cro";

[Severity: Low]
Are "qcom,glymur-lpass-rx-macro" and "qcom,glymur-lpass-tx-macro"
documented in the Devicetree bindings?  Neither compatible appears in
Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml or
Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml, which
will cause dtbs_check warnings.

[ ... ]

> +		lpass_audiocc: clock-controller@6a94000 {
> +			compatible =3D "qcom,glymur-lpassaudiocc";
> +			reg =3D <0 0x06a94000 0 0x1000>;
> +			#clock-cells =3D <1>;
> +			#reset-cells =3D <1>;
> +		};

[ ... ]

> @@ -4772,6 +4832,37 @@ lpass_lpicx_noc: interconnect@7420000 {
>  			#interconnect-cells =3D <2>;
>  		};
> =20
> +		swr2: soundwire@7630000 {
> +			compatible =3D "qcom,soundwire-v3.1.0";
> +			reg =3D <0 0x07630000 0 0x10000>;
> +			interrupts =3D <GIC_SPI 761 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&lpass_txmacro>;
> +			clock-names =3D "iface";
> +			label =3D "TX";
> +
> +			resets =3D <&lpasscc 0>;
> +			reset-names =3D "swr_audio_cgcr";

[ ... ]

> @@ -4787,6 +4878,13 @@ lpass_vamacro: codec@7660000 {
>  			#sound-dai-cells =3D <1>;
>  		};
> =20
> +		lpasscc: clock-controller@7680000 {
> +			compatible =3D "qcom,glymur-lpasscc";
> +			reg =3D <0 0x07680000 0 0x10000>;
> +			#clock-cells =3D <1>;
> +			#reset-cells =3D <1>;
> +		};

[Severity: High]
Should lpass_audiocc and lpasscc include "qcom,sc8280xp-lpassaudiocc" and
"qcom,sc8280xp-lpasscc" fallback compatibles (and be documented in
Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml)?

No driver matches "qcom,glymur-lpassaudiocc" or "qcom,glymur-lpasscc"
(drivers/clk/qcom/lpasscc-sc8280xp.c only matches the sc8280xp compatibles).
When a board enables swr1 and swr2, qcom_swrm_probe() requests the
"swr_audio_cgcr" reset from lpass_audiocc and lpasscc, and
__fwnode_reset_control_get() will return -EPROBE_DEFER indefinitely because
neither reset provider ever binds.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127155520.3589=
09-1-srinivas.kandagatla@oss.qualcomm.com?part=3D1
