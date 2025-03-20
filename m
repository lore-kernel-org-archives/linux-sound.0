Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED81221F35
	for <linux-sound@vger.kernel.org>; Thu, 20 Mar 2025 11:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742471810; cv=none; b=nSQfFi29jx1CjF1Z40Cj6VDFM+vawZCOiHsYufx/v3zuISQaRU8Cd6XdNbe7vr6v/0DpXQbEYxq1NQYi36tz/IGEAODEJ4wN7kGsKGDV/7/2u7KLKERUNLSxT2+ZezWrzVcM1SLiPnlhPNaTVGeO6ASh7SMnJ2Pwdoib4BfZdnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742471810; c=relaxed/simple;
	bh=cqZk3AtNNaRSyK3WSkjjmRwxCoEdwQtOrf4qTgoOi30=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eeHIm/avCCPfBaPbuxO59p6wjmHeAGsV/P2JK8VwCNQzQGIt+XsTAckjL45Kp4OgnK3rvBrpwGeppMjNxKfKE1e04dj9SwvGOywH4043/tVuzWmoxBpUTAWG/7bGGnPXrbxvHkVV0jlcHW/gqA0+E7M94qvgNnWHWll+dwqLzIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d9JYz6hj; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d9JYz6hj"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-399749152b4so285449f8f.3
        for <linux-sound@vger.kernel.org>; Thu, 20 Mar 2025 04:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742471807; x=1743076607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eYk31Su+89lU6oJN18njTVNWWCpqg8vmtkTowip21t8=;
        b=d9JYz6hjtqL0XlLwEWRt1o7YbNodyVIv4a8rPRJ7bUJT2kCtpD2cQEzlL7yPJYskof
         VWCWfz3QdDWAf5bZvClMVdhDbeQU2j2/8rx6c55Zx97Ml5OkK3XOa8Qno3hpo8gx+6se
         xvGJmUS4ij46udZh4cd5eDJ0vZO4bztA/RG7KsCAcy+g2pNSDJ/9XXwmfL20+INMeEr0
         mUMyu2HGF5nauDuq7lib4t6veeaWygwdaEIEKai17oWoCL7RFNMxWQywbT7G2DE7ft8B
         ll7ZfLjU4cFz5gK+lmylS6EobB+tikBgphxSuiWV9bCHIf6CXw6KjN/Ew32JTSAAGnSI
         Qkrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742471807; x=1743076607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eYk31Su+89lU6oJN18njTVNWWCpqg8vmtkTowip21t8=;
        b=bkwumnRyWbgbsmVfxHXay7t6TBNpqGknxfwDkYm/7msnBM4tpXJZOdsTzU1hB0/op1
         raYPM+WmWnYmLdB1DaF81Svo5fkABwSMAVIMoaSMkvvy2lPP+zMa2pPSKHK2B6bTO9Om
         SWNq6RHrgbdzPFq5WBLi5+xS7z+LKLxu6pWTYZ4npIDggb8AlJz4H9ekkcIQCeRh5FWC
         OV3f4auEma/O5I751TcuekP3szEJmV2hEHBKDbW39Pqz3PkYRK/Asi68g2N6R5DLk90r
         TbI/812XPXefr+sKN/uBJ6HUta4tGgsPi6SWTDXiJfReI+HS31fB5LxGCncOIQuJQ6nL
         Xm+A==
X-Forwarded-Encrypted: i=1; AJvYcCXUdlH6WmlzqYnCNyP/pscvQ+Pas/VAyVNmGd4xY5JCsPXxc/BfvYgjLtEj7KM0yhRQjrZLE1iUhfYiIA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0vzyV2hIKfKgbaRqEbV+g3otwZ7ZuCQAk4/TArhYMhIDyqsjw
	841JfKRNsmfewBN3RwNCP+yFp7PBxvjXVOiTK8iwQx+Rj1SLixrlYq9uOQ0LXUs=
X-Gm-Gg: ASbGncusgxST2a7y1WycjdSTu3W0ZP1/PSEDqX7MR2dnOZtM518C++kmu+d1fJLFycV
	v/BPH8AaX9HkmBeZAvaGhSCfUUSLc2SKrRjxudISiLIAK7xFfAQdN8G+OpyX0o6Fr26WkIhHlV/
	aOeWP78xP5/34LWxWwcGQHatKhVT3bODXiMTuSu0go23KS7DfGXA7DSTxqEQoS7Me+V0eZ8kHht
	kqyGS5sueRnuhwZ3oaM3Cg+GOOTFXqYrFP9T3DnlCT+0KFiMVOQb3qE/qhMekcSrVRH3RW8q8E0
	I6+naedgM3IQkPK7K0yn+DfrV8/Qq2AhxIhci1PCJGJbV/ggDMrTkh00yQeITd5k0thdSA==
X-Google-Smtp-Source: AGHT+IGbXLSBtSTdwWHcTNezYYv5v0xUo49S544UTd7/7NFqCyxLiZZUUSnqA8Pb3yJx5M6ETPpJAw==
X-Received: by 2002:a05:6000:1785:b0:391:c78:8895 with SMTP id ffacd0b85a97d-39973b32028mr4631527f8f.50.1742471807037;
        Thu, 20 Mar 2025 04:56:47 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c888117csm23257857f8f.44.2025.03.20.04.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 04:56:46 -0700 (PDT)
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
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 5/5] arm64: dts: qcom: x1e78100-t14s: Enable audio headset support
Date: Thu, 20 Mar 2025 11:56:33 +0000
Message-Id: <20250320115633.4248-6-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250320115633.4248-1-srinivas.kandagatla@linaro.org>
References: <20250320115633.4248-1-srinivas.kandagatla@linaro.org>
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
---
 .../qcom/x1e78100-lenovo-thinkpad-t14s.dts    | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
index b2c2347f54fa..b40775c20493 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
@@ -19,6 +19,16 @@ / {
 	compatible = "lenovo,thinkpad-t14s", "qcom,x1e78100", "qcom,x1e80100";
 	chassis-type = "laptop";
 
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
 	wcd938x: audio-codec {
 		compatible = "qcom,wcd9385-codec";
 
@@ -36,6 +46,7 @@ wcd938x: audio-codec {
 		qcom,tx-device = <&wcd_tx>;
 
 		reset-gpios = <&tlmm 191 GPIO_ACTIVE_LOW>;
+		mux-controls = <&us_euro_mux_ctrl>;
 
 		vdd-buck-supply = <&vreg_l15b_1p8>;
 		vdd-rxtx-supply = <&vreg_l15b_1p8>;
@@ -367,6 +378,13 @@ vreg_l15b_1p8: ldo15 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
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
@@ -942,6 +960,13 @@ int-n-pins {
 		};
 	};
 
+	us_euro_hs_sel: us-euro-hs-sel-state {
+		pins = "gpio68";
+		function = "gpio";
+		bias-pull-down;
+		drive-strength = <2>;
+	};
+
 	kybd_default: kybd-default-state {
 		pins = "gpio67";
 		function = "gpio";
-- 
2.39.5

