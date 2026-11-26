Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795719186;
	b=Y+c7b6uTHZpCyOfVZF9HLh3gwy9O9+XWlqerlI5jQiolJ3+go6UfHY5aHgk9L3hcoDD7
	 vYues4QPqWhKkRwfXo1d/+WxJPzUi9TuDXMVfUNM1KEgJK2QK8BqlgFA++yeDrNrltA/m
	 YmJxC9S9S/ONWC81is7/asLoWQOkq2Bak/8PqBMaXecMHh7R4mn8POL0ZIBYSdXOHRcmN
	 0h5SXfUPrBBcoBpexWa103x7tmK4JYhhcz2iHY4/H50BVTpXQx2iUOYLwxK7a8pINJDV6
	 t9NZb201kBE7JjB/0IdniqEpeu1QJu6HB+jtsFf+GSOEkA3xqpCQKaj9WjOFjkgsO6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795719186;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=xQr2HXLncCBQLK2N1j7sTEWqGT87X2DB1dYIjFaZgKQ=;
	b=WtmAB9cd+BdkvJgDzjRP50CxMta9A9jGKFtJg8CFSrE6vQ9Rsfl1ExUf7rblrcWAugk1
	 zrWzpYD9HPgG9Zk5mLI0YH53Zd039oqwbPSbtR8tuCsSSY8kBN5XNIppvc1OhIUY65DMr
	 okxIkIoKEMBOeiOXCiqUw+Ab4dpasQoMshEngNmWYJSKqNyJpXgtLHd2XScYlwWZlyX2o
	 NpnNdkR9Eec3EXkK2vhquJ1GTGiwpO3IY0hgz9Ipzed7q4SpraaIbHwRTElSb/de8iRAq
	 7ZBxNZ6zZaXWB/8NXcsDhZ4+kQM01V0DAwbzXQxqvNGsF9pBiGzA6vbaXfIuk/hCRbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j4CRgiBO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F366606A336;
	Thu, 26 Nov 2026 18:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j4CRgiBO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCD7A1F000D1;
	Thu, 26 Nov 2026 18:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795719186;
	bh=xQr2HXLncCBQLK2N1j7sTEWqGT87X2DB1dYIjFaZgKQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j4CRgiBOySIH8qLU0VU4pp8mWeOGuSaljCSc0fcmXQv1LGHFNS6wP4VkcdjD0yNwk
	 GP8s0SpURj2pKNnHD0agE0CmDycYTQkF3KtJzhYAlj6bXv9acEpyYmk2Qd37vQYJyk
	 G/344Fu3PODvJh00WBkmTsf4fsydF1NNG92PLwqskvi5SEoB15j4SQMuZyI4pz4lyH
	 OAChcWR/hU15edbgrwtibf9hKjheblmIzBorzowEWbLhTwx2xnyZFnjFwL/iv68Cw2
	 K64Zw72+GHiPLg+9S9ngPzbW6ZDHowS1pBTiMpZaf+KFMo14qsbsfepNcmSFLwP5Bl
	 6ZyGo8H2P8m7w==
Message-ID: <sashiko-outbox-236036@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/7] arm64: dts: qcom: glymur: add LPASS macros and
 RX/TX SoundWire
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-sound@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261126183806.172485-2-srinivas.kandagatla@oss.qualcomm.com>
References: <20261126183806.172485-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261126183806.172485-2-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 18:53:05 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [High] arm64: dts: qcom: glymur: missing qcom,glymur-lpasscc.h breaks
  DTB build
- [High] arm64: dts: qcom: glymur: unmatched lpasscc compatibles defer
  swr1/swr2
- [Low] arm64: dts: qcom: glymur: invalid qcom,ports-ch-mask property on
  swr2
- [Low] arm64: dts: qcom: glymur: undocumented macro compatibles and
  node order
--

commit b4bcd1d941eb74e432e52172d9eb6873d424ecc0
Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

arm64: dts: qcom: glymur: add LPASS macros and RX/TX SoundWire

This commit adds the LPASS RX/TX macro codecs, LPASS audio clock
controllers, and RX/TX SoundWire controller nodes to glymur.dtsi.

> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/q=
com/glymur.dtsi
> index 165dfa11f17f5..e3bba14bf36c7 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -9,6 +9,7 @@
>  #include <dt-bindings/clock/qcom,glymur-gcc.h>
>  #include <dt-bindings/clock/qcom,glymur-gpucc.h>
>  #include <dt-bindings/clock/qcom,glymur-tcsr.h>
> +#include <dt-bindings/clock/qcom,glymur-lpasscc.h>

[Severity: High]
Does dt-bindings/clock/qcom,glymur-lpasscc.h exist in the tree?  That
header is missing (LPASS_AUDIO_SWR_RX_CGCR and LPASS_AUDIO_SWR_TX_CGCR are
defined in dt-bindings/clock/qcom,sc8280xp-lpasscc.h), which breaks the
DTB build for all Glymur and Mahua boards.  Also, this #include is placed
out of alphabetical order after qcom,glymur-tcsr.h.

> @@ -4669,6 +4670,73 @@ q6prmcc: clock-controller {
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
> +			resets =3D <&lpass_audiocc LPASS_AUDIO_SWR_RX_CGCR>;
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
> +			reg =3D <0 0x06a90000 0 0x1000>;
> +			clocks =3D <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_CO=
UPLE_NO>,
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
> +
> +		lpass_audiocc: clock-controller@6a94000 {
> +			compatible =3D "qcom,glymur-lpassaudiocc";
> +			reg =3D <0 0x06a94000 0 0x1000>;
> +			#clock-cells =3D <1>;
> +			#reset-cells =3D <1>;
> +		};
> +
> +		lpasscc: clock-controller@7680000 {
> +			compatible =3D "qcom,glymur-lpasscc";
> +			reg =3D <0 0x07680000 0 0x10000>;
> +			#clock-cells =3D <1>;
> +			#reset-cells =3D <1>;
> +		};

[Severity: High]
Will lpass_audiocc and lpasscc ever bind to a driver without fallback
compatibles such as "qcom,sc8280xp-lpassaudiocc" and
"qcom,sc8280xp-lpasscc"?

Neither "qcom,glymur-lpassaudiocc" nor "qcom,glymur-lpasscc" is matched by
drivers/clk/qcom/lpasscc-sc8280xp.c (or documented in
Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml), so no
reset controller is registered for either node.  When swr1 and swr2 probe
with "qcom,soundwire-v3.1.0" (where sw_clk_gate_required is true),
qcom_swrm_probe() calls devm_reset_control_get_optional_exclusive(dev,
"swr_audio_cgcr"), and __fwnode_reset_control_get() returns -EPROBE_DEFER
indefinitely because the resets phandles resolve to unbound provider
nodes.

> @@ -4787,6 +4855,38 @@ lpass_vamacro: codec@7660000 {
>  			#sound-dai-cells =3D <1>;
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
> +			resets =3D <&lpasscc LPASS_AUDIO_SWR_TX_CGCR>;
> +			reset-names =3D "swr_audio_cgcr";
> +
> +			pinctrl-0 =3D <&tx_swr_active>;
> +			pinctrl-names =3D "default";
> +
> +			qcom,ports-sinterval-low =3D	/bits/ 8 <0x00 0x01 0x03 0x03 0x00 0x03 =
0x1f 0x1f 0 0 0 0 0 0>;
> +			qcom,ports-offset1 =3D		/bits/ 8 <0x00 0x01 0x02 0x00 0x00 0x00 0x00 =
0x0b 0 0 0 0 0 0>;
> +			qcom,ports-offset2 =3D		/bits/ 8 <0x00 0x00 0x00 0x00 0xff 0x00 0x00 =
0x0b 0 0 0 0 0 0>;
> +			qcom,ports-hstart =3D		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0x00 0x00 0=
x00 0xff 0xff 0xff 0xff 0xff 0xff>;
> +			qcom,ports-hstop =3D		/bits/ 8 <0xff 0x0f 0xff 0xff 0xff 0x0f 0x0f 0x=
0f 0xff 0xff 0xff 0xff 0xff 0xff>;
> +			qcom,ports-word-length =3D	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0x01 0x=
07 0x04 0xff 0xff 0xff 0xff 0xff 0xff>;
> +			qcom,ports-block-pack-mode =3D	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xf=
f 0x00 0x01 0xff 0xff 0xff 0xff 0xff 0xff>;
> +			qcom,ports-block-group-count =3D	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0=
xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
> +			qcom,ports-lane-control =3D	/bits/ 8 <0xff 0x01 0x00 0x01 0xff 0x03 0=
x02 0x02 0xff 0xff 0xff 0xff 0xff 0xff>;
> +			qcom,ports-ch-mask =3D		/bits/ 8 <0xff 0x01 0xff 0xff 0xff 0x03 0x01 =
0x03 0xff 0xff 0xff 0xff 0xff 0xff>;

[Severity: Low]
Is qcom,ports-ch-mask a valid property for qcom,soundwire-v3.1.0?  It is
not defined in Documentation/devicetree/bindings/soundwire/qcom,soundwire.y=
aml
(which sets unevaluatedProperties: false) and is never parsed by
drivers/soundwire/qcom.c.

> +
> +			#address-cells =3D <2>;
> +			#size-cells =3D <0>;
> +			#sound-dai-cells =3D <1>;
> +
> +			status =3D "disabled";
> +		};

[Severity: Low]
Are "qcom,glymur-lpass-rx-macro" and "qcom,glymur-lpass-tx-macro"
documented in Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.y=
aml
and qcom,lpass-tx-macro.yaml?  Neither compatible is in the bindings yet,
which causes dtbs_check warnings.  Also, under /soc@0, lpasscc
(clock-controller@7680000) is placed before soundwire@6c80000 and swr2
(soundwire@7630000) is placed after codec@7660000, out of ascending
unit-address order.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126183806.1724=
85-1-srinivas.kandagatla@oss.qualcomm.com?part=3D1
