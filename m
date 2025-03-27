Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313BB21129F
	for <linux-sound@vger.kernel.org>; Thu, 27 Mar 2025 10:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743070013; cv=none; b=U9eGWRD8EaybSmIHAczM2p+99mgUaBv8fwtspbd6GeI8TyYduM39o/vtcd3J1rMyKelwFHXnsw8bTbQWQfaaTYsZwPuI7uAoqxlUw24pSlSOWA6D+DuT+1iiD9Zn8+rv3Y4dHpqkcFH4zF7Efrilkgl/gGmcCzYp8bviMDWm3uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743070013; c=relaxed/simple;
	bh=4hK5NwvGZj3PELV41E3//V4IRXz5oGNBj9IGYps+vOQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ellgpMvxyYVFq4J6SNu0uud6YZItLJ0zfkewxGqFFAKf0jeF98LTUuedjNBTPuAp8Rmds5qlb5TmVksPV+/QMaW0DDl1nLrsrH1agE3fZTmZhf0N0h7gb6seK2kIxB6yJRlI21lGqMczqLS+5xG3UTgcUfG8WGhGH1ySuvEvmFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iEVf4+1Z; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iEVf4+1Z"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso4773295e9.3
        for <linux-sound@vger.kernel.org>; Thu, 27 Mar 2025 03:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743070010; x=1743674810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LHH3q92f3jVI2cl1PwT0LmA+qhtDvCooULm9gmNkwck=;
        b=iEVf4+1Z2VQoEpbsRejOLlpWR5/4oHbTwAxdZR9VhPZFx3E9raWHIDxVXhaApuC8/W
         L42GPG+WMryR5DP5TULzBtVtWakLInnFCa8GmFrD5nL+EFeAYXR2VBQvanwoz8DFfzpq
         u9Ur40z32K8/6JGco30L0lkOC1IpwMg+lB9VaxMFjNkpfmNFopGrEGbAtBT6jAFyUc9a
         AFdjP80yx0es6rUY5sWaavNXbs7mAh3xvIanz8LWMk5LOMz55Yv0n06aEni20LLqGpI/
         r66OsXkS1zWM72v65/fd9t9GyzBSbUBidfi8XM2eeqeQunhMWLd0s+eYz12ortzjWT1K
         dFHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743070010; x=1743674810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LHH3q92f3jVI2cl1PwT0LmA+qhtDvCooULm9gmNkwck=;
        b=S/hAotnWwge3CcAS5KQXT7C129kjUNb4Y43Rofps9N3HS81UaNzi1LEzESP1fL2I62
         9COTPiuLkw9zBBFnuvdYVxx1D/wQo+PEzkCj8XIRsGnk/6+BlcLqgnQxv6Ig0+mwVTfF
         A0Wjw10pP2Tsqb7wU4eo987xBgFdd4LP6x+g6q/5GITngx6dlghHl4hqJenPtyS5vGWL
         ZAP3/PkgisPxTFjfFOh/bY9t3E/guIE/Erigzy1V4TU+Ifgkfh2L0Q95v4suEui5toCq
         uJoQ5TQuOnvEIScSW3jGPexpdI3H3bjrUJwNpEPRtm7lXj3tywWlvVlubPZyYIpYtuI7
         y3pQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJ/KvPVQaDQTYTbLpnDAeHBZoMu57UwxkLhsMSiq/Ta06FG8Zf40Q7YP7LB22j8Ffslh4bBG7MI1ZbYw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe3WjNK0EQzOysaJPOorDfyHywfhLiKTuRKRVKQAItEqbkvvBA
	rSsAneosOKllvPwGPY0VY5bTLcUn2GXyW47aYdQ8FSA8ZzKZghpCQxoIC8YQDlI=
X-Gm-Gg: ASbGncswbLwEeMGDevt5+OA/MuGZmPhwnD3UEIuAeEwtC3JPXHRRSJRVR0oElbD9nRX
	U4wGP5iFmDylrjxYaFvU2dQi+CG+SsF08tMVjYANLxU9+QxifkC7CmeDnsamo7kCnx1JHP2YCqY
	FxDxQgSg/ksEgfB8m85RB+XqDXKDIPQfP+eZPX3MP0H6dKPDuN5GzUBE1p0MUno9LIaC4M5SbeX
	42FOQ5fs0A7KDUJ0R5gwGj4j//auoXqB4eKBLUmtsuk969lOwIr7Oed/rt9N1160jKokCtoej8m
	8UJEybatbL5Gvfmef3vucOPplO9Kt2CyEXZXKA4XD74OdNkV3f1ghht03bMUUAmG5BEmzw==
X-Google-Smtp-Source: AGHT+IGE/wvSmulXQdHaG0FP4h3r9RIUwRb2WD87idgq+VFnWxcnjSgEdf+KyFgQDYVFnJMa6Q5vdQ==
X-Received: by 2002:a5d:5f85:0:b0:38d:d9bd:18a6 with SMTP id ffacd0b85a97d-39ad1782022mr2444990f8f.42.1743070010288;
        Thu, 27 Mar 2025 03:06:50 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39ac3ce3dd1sm10843204f8f.88.2025.03.27.03.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 03:06:49 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: peda@axentia.se,
	broonie@kernel.org,
	andersson@kernel.org,
	krzk+dt@kernel.org
Cc: ivprusov@salutedevices.com,
	luca.ceresoli@bootlin.com,
	zhoubinbin@loongson.cn,
	paulha@opensource.cirrus.com,
	lgirdwood@gmail.com,
	robh@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	dmitry.baryshkov@oss.qualcomm.com,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	johan+linaro@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Christopher Obbard <christopher.obbard@linaro.org>
Subject: [PATCH v6 6/6] arm64: dts: qcom: x1e78100-t14s: Enable audio headset support
Date: Thu, 27 Mar 2025 10:06:33 +0000
Message-Id: <20250327100633.11530-7-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250327100633.11530-1-srinivas.kandagatla@linaro.org>
References: <20250327100633.11530-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

On Lenovo ThinkPad T14s, the headset is connected via a HiFi mux to
support CTIA and OMTP headsets. This switch is used to minimise pop and
click during headset type switching.

Enable the mux controls required to power this switch along with wiring up
gpio that control the headset switching.

Without this, headset audio will be very noisy and might see headset
detection errors.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: Christopher Obbard <christopher.obbard@linaro.org>
---
 .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index afea82616bc4..34d1d8927484 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -41,6 +41,7 @@ wcd938x: audio-codec {
 		qcom,tx-device = <&wcd_tx>;
 
 		reset-gpios = <&tlmm 191 GPIO_ACTIVE_LOW>;
+		mux-controls = <&us_euro_mux_ctrl>;
 
 		vdd-buck-supply = <&vreg_l15b_1p8>;
 		vdd-rxtx-supply = <&vreg_l15b_1p8>;
@@ -149,6 +150,16 @@ pmic_glink_ss1_con_sbu_in: endpoint {
 		};
 	};
 
+	/* two muxes together support CTIA and OMTP switching */
+	us_euro_mux_ctrl: mux-controller {
+		compatible = "gpio-mux";
+		pinctrl-0 = <&us_euro_hs_sel>;
+		pinctrl-names = "default";
+		mux-supply = <&vreg_l16b_2p5>;
+		#mux-control-cells = <0>;
+		mux-gpios = <&tlmm 68 GPIO_ACTIVE_HIGH>;
+	};
+
 	reserved-memory {
 		linux,cma {
 			compatible = "shared-dma-pool";
@@ -604,6 +615,13 @@ vreg_l15b_1p8: ldo15 {
 			regulator-always-on;
 		};
 
+		vreg_l16b_2p5: ldo16 {
+			regulator-name = "vreg_l16b_2p5";
+			regulator-min-microvolt = <2504000>;
+			regulator-max-microvolt = <2504000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
 		vreg_l17b_2p5: ldo17 {
 			regulator-name = "vreg_l17b_2p5";
 			regulator-min-microvolt = <2504000>;
@@ -1461,6 +1479,13 @@ rtmr1_default: rtmr1-reset-n-active-state {
 		bias-disable;
 	};
 
+	us_euro_hs_sel: us-euro-hs-sel-state {
+		pins = "gpio68";
+		function = "gpio";
+		bias-pull-down;
+		drive-strength = <2>;
+	};
+
 	usb1_pwr_1p15_reg_en: usb1-pwr-1p15-reg-en-state {
 		pins = "gpio188";
 		function = "gpio";
-- 
2.39.5

