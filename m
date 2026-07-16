Received: from mail-m49206.qiye.163.com (mail-m49206.qiye.163.com [45.254.49.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9556D31716D;
	Thu, 16 Jul 2026 09:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784195865; cv=none; b=LprAGKj6z66IE1PdAWP/JJHi88Ora5vVb1JNDOzzHxn6yBBwIZN6UNt1CmZo5AxBFZQAxW3d3ueCWFlL1pw6u+OtG7DaTJkATncdM+rfA5+U1zWETErC4rPzsdkQYyDZBdr4tenWz+GfMiFrEvAV5H8BPj8hC39JXOgGFGMRMVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784195865; c=relaxed/simple;
	bh=9MVu3h2TTHAPPzWoTWilO603EJ1DSCcmYvinWFklY+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I4OUHsxoZR+gKEnysblHKeauqDJ1X3tPhI2RXuipxOXGJlh9zWb5dWKo6k+/XRCT9i74R9FSDL4Rzi2sjRS7jzGY2EJuAAh8BRhWmW5AbRjzEBaIikN5s3Xw8QlXgOqY+q+htijUsIiy4Rrke4aHqAOr+s1+hugiNpEgDX4rLQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=YmfBkgub; arc=none smtp.client-ip=45.254.49.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="YmfBkgub"
Received: from tsdl-HP-EliteDesk-880-G6-Tower-PC.. (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 466f33bfd;
	Thu, 16 Jul 2026 17:52:24 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
To: mohammad.rafi.shaik@oss.qualcomm.com
Cc: andersson@kernel.org,
	broonie@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	drake@endlessm.com,
	hongyang.zhao@thundersoft.com,
	katsuhiro@katsuster.net,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	lgirdwood@gmail.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	matteomartelli3@gmail.com,
	neil.armstrong@linaro.org,
	perex@perex.cz,
	robh@kernel.org,
	rosh@debian.org,
	srini@kernel.org,
	tiwai@suse.com,
	zhoubinbin@loongson.cn
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: qcs6490-rubikpi3: Add audio support
Date: Thu, 16 Jul 2026 17:52:17 +0800
Message-ID: <20260716095217.2855206-1-hongyang.zhao@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <7c905a1c-f65e-4ef5-a65c-2be83ff820ba@oss.qualcomm.com>
References: <7c905a1c-f65e-4ef5-a65c-2be83ff820ba@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9f6a5773b009d5kunme5e0f0279f142
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCSkhCVkNDTkpJGkxCSklDQ1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVCQk
	lOS1VKS0tVSkJLQlkG
DKIM-Signature: a=rsa-sha256;
	b=YmfBkgubYcqBt7KESDAwVsm/f3kvdhBO3c5JvG54aA96QnMVWsbgevRq4lWu+1mnF2qhrDXcUaQF2HOKEridxXZaDb7EecycWjLdMr+WdcT5o+/ggpQnMeJwTxVIoPfxlw8n160IV79+vBgOQRe3HnaZTU6O09X8X6gn4l4fc2I=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=Ep01KusOgUcg83aHRrCrtmBum+1A5c5+kWDQYQuYo4M=;
	h=date:mime-version:subject:message-id:from;

Hi Rafi,

Thank you for the review.

On 7/15/2026 7:32 PM, Hongyang Zhao wrote:
> > RubikPi 3 uses the AudioReach firmware path for its external audio
> > interfaces. The primary MI2S interface connects to an ES8316 codec for
> > headset playback and capture, while the quaternary MI2S interface feeds
> > the LT9611 HDMI bridge.
> >
> > Enable the AudioReach description and add the three DAI links. Describe
> > the primary MI2S MCLK and bit clock inputs under the backend DAI so the
> > machine driver can control them. Add the primary and quaternary pin
> > configurations to the sound card and make the LT9611 codec DAI
> > addressable.
> >
> > Describe the ES8316, its 3.3 V enable supply, 19.2 MHz MCLK and inverted
> > GPIO jack-detect signal. Route the codec headphone outputs and microphone
> > input to the board headset connector.
> >
> > Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> > ---
> >   .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts | 159 +++++++++++++++++++++
> >   1 file changed, 159 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
> > index d8a9a7e47bdc..7b010823d692 100644
> > --- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
> > +++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
> > @@ -19,6 +19,7 @@
> >   #include "pm7325.dtsi"
> >   #include "pm8350c.dtsi" /* PM7350C */
> >   #include "pmk8350.dtsi" /* PMK7325 */
> > +#include "qcs6490-audioreach.dtsi"
> >
> >   /delete-node/ &adsp_mem;
> >   /delete-node/ &cdsp_mem;
> > @@ -128,6 +129,23 @@ fan0: pwm-fan {
> >   		pinctrl-names = "default";
> >   	};
> >
> > +	vreg_es8316_3v3: regulator-es8316-3v3 {
> > +		compatible = "regulator-fixed";
> > +
> > +		regulator-name = "vreg_es8316_3v3";
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +
> > +		gpio = <&tlmm 117 GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +
> > +		pinctrl-0 = <&es8316_power_on>;
> > +		pinctrl-names = "default";
> > +
> > +		regulator-always-on;
> > +		regulator-boot-on;
> > +	};
> > +
> >   	vreg_eth_1v8: regulator-eth-1v8 {
> >   		compatible = "regulator-fixed";
> >
> > @@ -727,6 +745,26 @@ &gpu_zap_shader {
> >   	firmware-name = "qcom/qcs6490/a660_zap.mbn";
> >   };
> >
> > +&i2c0 {
> > +	status = "okay";
> > +
> > +	es8316: audio-codec@11 {
> > +		compatible = "everest,es8316";
> > +		reg = <0x11>;
> > +		#sound-dai-cells = <0>;
> > +
> > +		clocks = <&q6prmcc LPASS_CLK_ID_MCLK_1 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> > +		clock-names = "mclk";
> > +
> > +		interrupts-extended = <&tlmm 63 IRQ_TYPE_LEVEL_HIGH>;
> > +
> > +		pinctrl-0 = <&es8316_jack_detect>;
> > +		pinctrl-names = "default";
> > +
> > +		everest,jack-detect-inverted;
> > +	};
> > +};
> > +
> >   /* Pin 3, 5 in 40-pin connector */
> >   &i2c1 {
> >   	status = "okay";
> > @@ -740,6 +778,7 @@ &i2c9 {
> >   	lt9611_codec: hdmi-bridge@39 {
> >   		compatible = "lontium,lt9611";
> >   		reg = <0x39>;
> > +		#sound-dai-cells = <1>;
> >
> >   		interrupts-extended = <&tlmm 20 IRQ_TYPE_EDGE_FALLING>;
> >   		reset-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
> > @@ -978,6 +1017,27 @@ &pon_resin {
> >   	status = "okay";
> >   };
> >
> > +&q6apmbedai {
> > +	#address-cells = <1>;
> > +	#size-cells = <0>;
> > +
> > +	dai@10 {
> > +		reg = <PRIMARY_MI2S_RX>;
> > +		clocks = <&q6prmcc LPASS_CLK_ID_MCLK_1 LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>
> Drop this; it is already enabled from the codec node.
>
> Why is the same clock being enabled in two places?

Agreed. I removed MCLK from both Primary MI2S backend nodes. They now
describe only BCLK, for example:

	dai@10 {
		reg = <PRIMARY_MI2S_RX>;
		clocks = <&q6prmcc LPASS_CLK_ID_PRI_MI2S_IBIT LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
		clock-names = "bclk";
	};

The ES8316 codec node is the sole MCLK consumer. The corresponding
machine data also no longer enables CPU-side MCLK.

>
> > +			 <&q6prmcc LPASS_CLK_ID_PRI_MI2S_IBIT LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> > +		clock-names = "mclk",
> > +			      "bclk";
> > +	};
> > +
> > +	dai@11 {
> > +		reg = <PRIMARY_MI2S_TX>;
> > +		clocks = <&q6prmcc LPASS_CLK_ID_MCLK_1 LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> > +			 <&q6prmcc LPASS_CLK_ID_PRI_MI2S_IBIT LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> > +		clock-names = "mclk",
> > +			      "bclk";
> > +	};
> > +};
> > +
> >   &qupv3_id_0 {
> >   	firmware-name = "qcom/qcm6490/qupv3fw.elf";
> >
> > @@ -1014,6 +1074,69 @@ &sdhc_2 {
> >   	status = "okay";
> >   };
> >
> > +&sound {
> > +	compatible = "thundercomm,qcs6490-rubikpi3-sndcard";
> > +	model = "QCS6490-Thundercomm-RubikPi3";
> > +
> > +	pinctrl-0 = <&mi2s0_data0>, <&mi2s0_data1>, <&mi2s0_mclk>,
> > +		    <&mi2s0_sclk>, <&mi2s0_ws>,
> > +		    <&lpass_qua_mi2s_sclk>, <&lpass_qua_mi2s_ws>,
> > +		    <&lpass_qua_mi2s_data>;
> > +	pinctrl-names = "default";
> > +
> > +	audio-routing = "Headphone Jack", "HPOL",
> > +			"Headphone Jack", "HPOR",
> > +			"MIC2", "Mic Jack";
> > +
> > +	mi2s-playback-dai-link {
> > +		link-name = "MI2S-LPAIF-RX-PRIMARY";
> > +
>
> What does "MI2S-LPAIF-RX-PRIMARY" represents?

The original name was intended to describe the primary MI2S receive
path through LPAIF, but I agree that it was not clear.

Following the naming used by other Qualcomm sound card device trees, I
have changed the DAI link names to:

- "Primary MI2S Playback"
- "Primary MI2S Capture"
- "HDMI Playback"

>
> > +		codec {
> > +			sound-dai = <&es8316>;
> > +		};
> > +
> > +		cpu {
> > +			sound-dai = <&q6apmbedai PRIMARY_MI2S_RX>;
> > +		};
> > +
> > +		platform {
> > +			sound-dai = <&q6apm>;
> > +		};
> > +	};
> > +
> > +	mi2s-capture-dai-link {
> > +		link-name = "MI2S-LPAIF-TX-PRIMARY";
> > +
> > +		codec {
> > +			sound-dai = <&es8316>;
> > +		};
> > +
> > +		cpu {
> > +			sound-dai = <&q6apmbedai PRIMARY_MI2S_TX>;
> > +		};
> > +
> > +		platform {
> > +			sound-dai = <&q6apm>;
> > +		};
> > +	};
> > +
> > +	quaternary-mi2s-playback-dai-link {
> > +		link-name = "MI2S-LPAIF_RXTX-RX-PRIMARY";
> > +
> > +		codec {
> > +			sound-dai = <<9611_codec 0>;
> > +		};
> > +
> > +		cpu {
> > +			sound-dai = <&q6apmbedai QUATERNARY_MI2S_RX>;
> > +		};
> > +
> > +		platform {
> > +			sound-dai = <&q6apm>;
> > +		};
> > +	};
> > +};
> > +
> >   /* Pin 19, 21, 23, 24 in 40-pin connector */
> >   &spi12 {
> >   	status = "okay";
> > @@ -1228,6 +1351,29 @@ &sdc2_data {
> >   	drive-strength = <10>;
> >   };
> >
> > +&lpass_tlmm {
> > +	lpass_qua_mi2s_sclk: qua-mi2s-sclk-state {
> > +		pins = "gpio0";
> > +		function = "qua_mi2s_sclk";
> > +		drive-strength = <8>;
> > +		bias-disable;
> > +	};
> > +
> > +	lpass_qua_mi2s_ws: qua-mi2s-ws-state {
> > +		pins = "gpio1";
> > +		function = "qua_mi2s_ws";
> > +		drive-strength = <8>;
> > +		bias-disable;
> > +	};
> > +
> > +	lpass_qua_mi2s_data: qua-mi2s-data-state {
> > +		pins = "gpio2", "gpio3", "gpio4";
> > +		function = "qua_mi2s_data";
> > +		drive-strength = <8>;
> > +		bias-disable;
> > +	};
> > +};
> > +
> >   &tlmm {
> >   	pcie1_reset_n: pcie1-reset-n-state {
> >   		pins = "gpio2";
> > @@ -1366,6 +1512,12 @@ m2_vcc_pin: m2-vcc-state {
> >   		input-disable;
> >   	};
> >
> > +	es8316_jack_detect: es8316-jack-detect-state {
> > +		pins = "gpio63";
> > +		function = "gpio";
> > +		bias-disable;
> > +	};
> > +
> >   	lt9611_vcc_pin: lt9611-vcc-pin-state {
> >   		pins = "gpio83";
> >   		function = "gpio";
> > @@ -1395,6 +1547,13 @@ pcie0_wake_n: pcie0-wake-n-state {
> >   		bias-pull-up;
> >   	};
> >
> > +	es8316_power_on: es8316-power-on-state {
> > +		pins = "gpio117";
> > +		function = "gpio";
> > +		drive-strength = <2>;
> > +		bias-pull-down;
> > +	};
> > +
> >   	wifi_power_on: wifi-power-on-state {
> >   		pins = "gpio125";
> >   		function = "gpio";
> >

Best regards,
Hongyang
