Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838BA386C05
	for <linux-sound@vger.kernel.org>; Tue, 16 Jun 2026 20:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781640907; cv=none; b=XOC4xaMcwr/PMWTpJCoiXxsZrD0ksRlPAym7dIfWWvVa7A2/jvxWY5vKPeu/U6g2ogk1ohD/x+yr748HjOdW6O+6lML+EJoapekiK1q6eMQDW7YES9BRztrnOUUt2rcXGMQoVYs79u8p6xux1fqwwUzujaOqCFjrXJFLl5T+iRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781640907; c=relaxed/simple;
	bh=KBFBZwrujTG9inalXa4ycF5lm9sglzFWJLDvgKHDRUs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fVoEubWbi92uEelyZNx8RvGzt5cKySGpRIiM9ZKbr6N3xDRDFVDgRiFFL1tgDRx/B1ZH+vN+y5R+Z2+dV4tGk/75cv3BACCu2fkDRFJDiO7piqNSZL4t5bFLiy1j9+rSiuMD2SkBaPr/V2hijYpWJeTgS4X4/njUF+GizkqwF4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nDANkykV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zmy7CgYK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nDANkykV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zmy7CgYK"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GIOj0x2544544
	for <linux-sound@vger.kernel.org>; Tue, 16 Jun 2026 20:15:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=z7KU4LEbOgB
	f/iaK3Hv7v/YJfdCIa62CS+r2d5DnE3A=; b=nDANkykVnMjbK1ugv25VyHIULev
	d+xhCQUNnVAuI46nE/11Yrv588tAfLGQDzcyI/9+Vwlbi6EDd/YnXSKphVN8wQ8K
	4fh+z/9qAjeE8fYULsXIA4FakCraI2gg6GNhWKrTmIxYKvYTca6HcVerZoifL2eK
	u0+XEofjD7CaS5uw5xjgWEj8+pZsYJrAyJt9qL/FG/CprtgtKsTfwkVSI5s7azc7
	Os5MDeuJxrXdqoTgVlhyKxGpuBK+YYsAUn+jKvZJ9n4+aq3qMCXn+LWrtRHDP3L4
	WrrvOsgWk8dY+f5Rq7DkYtJ+bCSQ6eKZtD5T4Mk6mK4+HS7069Z4UUxQmWw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu3ct33ju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 16 Jun 2026 20:15:05 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c6bc237b5aso2421165ad.2
        for <linux-sound@vger.kernel.org>; Tue, 16 Jun 2026 13:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781640905; x=1782245705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z7KU4LEbOgBf/iaK3Hv7v/YJfdCIa62CS+r2d5DnE3A=;
        b=Zmy7CgYKn8jHJLCwn99u3F0dYPm6Mi0GHlo3clif5OH/Nwh9xYYhvy4uZBGvSHV+GA
         /spdGjChRDXjMSU3r71Lh39GccGqoPhrd0IFxC8MNuxGjeW9wWqbgyMOJkidIiJzKJz1
         w1ScWdNjrcq44/HC8ZB290kHzveU79US1rWN16ibKGK4TZSl6weJjPPGp2BtErZkSgRK
         To0zKIkMn6vtO8a8b43ByGhxtU3c2U1A4XEoPUMkk28dQ6YyG8b3J4JvUVqd8D9ytod6
         9ZYmY0anAaHN3t1sMAPh+8H6Abf/wi+dDlO8Tfnc6/ZfQY2u/G9W/By685DboAxbcLTk
         kYyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781640905; x=1782245705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z7KU4LEbOgBf/iaK3Hv7v/YJfdCIa62CS+r2d5DnE3A=;
        b=VhMfqCJG5gNSxVD90bLucqmKK1f1kVE58kQUY89XwIqNZTeElSUMODkzfp11sBzOOe
         Gk1iADG1pBcTUQ984ppB0oxcetWjTTCYfW8AM1BbK+tATXBXKszWTpuARbYG7gyCzOzP
         CohLSsoBgIamsrv0aF4a3imQDrsYJlynKgzlKFEcMET+RMLxhXBgGDyPzW0Dy76HhGq7
         f+0A78zSt82x8deehezbjkkE+JRh246xuNz3HN5qYbEoiZ8RoX96RiWCH2ibw8DZn0p4
         f224DDjS+gkrmAmnmKVJkOjeIK5zC1KB+PFfv1O1Rgt3Zp6hkR4NhzXt07tBcE87qYOv
         y8IQ==
X-Gm-Message-State: AOJu0YzPoHHAISOsbU1ftJQuRK61KXtR2YEiOLtkjnTD+Ayn4tzj8wwS
	bLf4idBQxmFJf/C9i7noAm1dEaZlBSFcs0I19WjFUMlkq6c8WG/OiZK9TKnAAeGqZAnEhuay8wZ
	BizLfg80kbuuZItMMaxSRP3muIXd06noAnhQasJ3G69CTCNmnOuwRLWv1gi7hwd7cZg==
X-Gm-Gg: AfdE7cmXsdT5RJZAh9NBssgW1dXKJkHWXEcDiJ+BIjvJIMVCfk0aW8VEFgx7/FFYniA
	aMHkC2S06139d4evbFh80ULoMRUSJrZVHAWpShe62L5APXEGqbaEOB6U+tVAkZjPF9WlRfAGdea
	gCDLXTf00Teaz9x2cVLDvLPOXD9UAaDVZHqLBBjZrxQ1eY1iGHEOnfkhJP9Dsnx0AW9+uo0KSRl
	aaI8Ci07/MtW5GVXRQlFGkMxXr5kPfhG1InwaYRJrdotC4B5FMfLPLkaEjMmDulOcN8s9DbHSu5
	zOlqauUzEu0gKXOfTFNRzVHsK/Z6mdN0WlpCVRolQ/J5r8uLWZ5UidC/VBjQlzY2GaGuk7ibCYG
	qJS5+kBvtjo8/Mc955DsiUybIFwjEp2+wl0/TQCUtBEN8MY6wj1xvEnD0Jg==
X-Received: by 2002:a17:902:e892:b0:2c2:f675:32c5 with SMTP id d9443c01a7336-2c6bc256394mr5575785ad.29.1781640905219;
        Tue, 16 Jun 2026 13:15:05 -0700 (PDT)
X-Received: by 2002:a17:902:e892:b0:2c2:f675:32c5 with SMTP id d9443c01a7336-2c6bc256394mr5575455ad.29.1781640904764;
        Tue, 16 Jun 2026 13:15:04 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4328abe7bsm136385985ad.49.2026.06.16.13.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 13:15:04 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 4/8] arm64: dts: qcom: shikra: Add soundwire and macro nodes
Date: Wed, 17 Jun 2026 01:43:11 +0530
Message-Id: <20260616201315.2565115-5-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260616201315.2565115-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260616201315.2565115-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=SoCgLvO0 c=1 sm=1 tr=0 ts=6a31aec9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=QvYcBxd3YisHp5ETNPQA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: Q4S8XRULJIp8zf2EyBFTjYO_RMg8FIDh
X-Proofpoint-ORIG-GUID: Q4S8XRULJIp8zf2EyBFTjYO_RMg8FIDh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDIwNSBTYWx0ZWRfXwC0xY/0PkAao
 OFxONmIZ4+54AUXMZVpXZLiutJ1dVCb5X2nfOF4pcLMU08TcAaroGUVXifJJIsFgRQPHmL1wEuV
 B9wPMPdO79dZxuUYV575SfiKikVbYbcKhBoMeb0c0JnkwU2j1WnEeoa/mgJAShBilJJFhIVxHu/
 pKJBx/GnYNGIOklluxNFVk7cd92TKsvuhS+X0V/QXlzfWmhkRohQK3rKnPsWKTtjR8R9JvS/2pJ
 TRPY1VP5gdt0smwLmnl6fWKwCtsc4kiV73E2wNIegxRl9y/3ga3H80IdlVQklbci3TU3/L4nZrb
 mbMSzFwT2nVT+F3VCL/JC2mLr+nNaAQpIo24Y1FOOpFwVrYTfNiPeg7/s93mau8h3BHHUJG/Wal
 HNcb3GP3vjSSCsCaYk9RarwLv4qk55kVYQm+8p12/sovE9VWj21CKq9/bzxWRYNJbAGjgd/IMqN
 1K8OPBpXk9UnQEAToKw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDIwNSBTYWx0ZWRfX4Wp/LdY8ijWU
 lNLH3CEvkZn7kpHngbIy/deCHfRNMZeOMFBWmx38803k4VQW03nc82Pysb2SUmhSmblwT4jni98
 MDXL9nJ8R0QK4z1MwrGGRIrN053nP1Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606160205

Add SoC-level SoundWire masters and LPASS RX/VA macro nodes, along with
DMIC and SWR pinctrl states required by the audio data path.

Keep these nodes disabled in shikra.dtsi so board dts files can selectively
enable and configure them.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 171 +++++++++++++++++++++++++++
 1 file changed, 171 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 3df09cfd17a4..0ed73b948588 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -833,6 +833,70 @@ rclk-pins {
 					bias-bus-hold;
 				};
 			};
+
+			dmic01_default: dmic01-default-state {
+				clk-pins {
+					pins = "gpio96";
+					function = "dmic";
+					drive-strength = <8>;
+					output-high;
+				};
+
+				data-pins {
+					pins = "gpio97";
+					function = "dmic";
+					drive-strength = <8>;
+					bias-disable;
+				};
+			};
+
+			dmic23_default: dmic23-default-state {
+				clk-pins {
+					pins = "gpio98";
+					function = "dmic";
+					drive-strength = <8>;
+					output-high;
+				};
+
+				data-pins {
+					pins = "gpio99";
+					function = "dmic";
+					drive-strength = <8>;
+					bias-disable;
+				};
+			};
+
+			tx_swr_active: tx-swr-active-state {
+				clk-pins {
+					pins = "gpio105";
+					function = "swr0_tx";
+					drive-strength = <8>;
+					bias-disable;
+				};
+
+				data-pins {
+					pins = "gpio106";
+					function = "swr0_tx";
+					drive-strength = <8>;
+					bias-bus-hold;
+				};
+			};
+
+			rx_swr_active: rx-swr-active-state {
+				clk-pins {
+					pins = "gpio107";
+					function = "swr0_rx";
+					drive-strength = <8>;
+					bias-disable;
+				};
+
+				data-pins {
+					pins = "gpio108", "gpio109";
+					function = "swr0_rx";
+					drive-strength = <8>;
+					bias-bus-hold;
+				};
+			};
 		};
 
 		pmu@c91000 {
@@ -2114,6 +2178,113 @@ audiocorecc: clock-controller@a0a0000 {
 			status = "disabled";
 		};
 
+		rxmacro: codec@a040000 {
+			compatible = "qcom,shikra-lpass-rx-macro";
+			reg = <0x0 0x0a040000 0x0 0x1000>;
+
+			pinctrl-0 = <&rx_swr_active>;
+			pinctrl-names = "default";
+
+			clocks = <&audiocorecc AUDIO_CORE_CC_RX_MCLK_CLK>,
+				<&audiocorecc AUDIO_CORE_CC_RX_MCLK_2X_CLK>,
+				 <&vamacro>;
+			clock-names = "mclk",
+				      "npl",
+				      "fsgen";
+
+			#clock-cells = <0>;
+			clock-output-names = "mclk";
+			#sound-dai-cells = <1>;
+			status = "disabled";
+		};
+
+		swr0: soundwire@a060000 {
+			compatible = "qcom,soundwire-v3.1.0";
+			reg = <0x0 0x0a060000 0x0 0x10000>;
+			qcom,swr-master-ee-val = <0>;
+
+			interrupts = <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			clocks = <&rxmacro>;
+			clock-names = "iface";
+
+			label = "RX";
+			qcom,din-ports = <0>;
+			qcom,dout-ports = <5>;
+
+			resets = <&audiocorecc AUDIO_CORE_CSR_RX_SWR_CGCR>;
+			reset-names = "swr_audio_cgcr";
+
+			qcom,ports-sinterval-low =	/bits/ 8 <0x03 0x1f 0x1f 0x07 0x00>;
+			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x0b 0x01 0x00>;
+			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x0b 0x00 0x00>;
+			qcom,ports-hstart =		/bits/ 8 <0xff 0x03 0xff 0xff 0xff>;
+			qcom,ports-hstop =		/bits/ 8 <0xff 0x06 0xff 0xff 0xff>;
+			qcom,ports-word-length =	/bits/ 8 <0x01 0x07 0x04 0xff 0xff>;
+			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0x00 0x01 0xff 0xff>;
+			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0x00>;
+			qcom,ports-lane-control =	/bits/ 8 <0x01 0x00 0x00 0x00 0x00>;
+
+			#sound-dai-cells = <1>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		vamacro: codec@a078000 {
+			compatible = "qcom,shikra-lpass-va-macro";
+			reg = <0x0 0x0a078000 0x0 0x2000>;
+
+			pinctrl-0 = <&tx_swr_active>;
+			pinctrl-names = "default";
+
+			clocks = <&audiocorecc AUDIO_CORE_CC_TX_MCLK_CLK>,
+				 <&audiocorecc AUDIO_CORE_CC_TX_MCLK_2X_CLK>;
+			clock-names = "mclk",
+				      "npl";
+
+			#clock-cells = <0>;
+			#sound-dai-cells = <1>;
+			clock-output-names = "fsgen";
+			status = "disabled";
+		};
+
+		swr1: soundwire@a080000 {
+			compatible = "qcom,soundwire-v3.1.0";
+			reg = <0x0 0x0a080000 0x0 0x10000>;
+			qcom,swr-master-ee-val = <0>;
+
+			interrupts = <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-names = "core", "wakeup";
+
+			clocks = <&vamacro>;
+			clock-names = "iface";
+
+			label = "VA_TX";
+
+			qcom,din-ports = <4>;
+			qcom,dout-ports = <0>;
+
+			resets = <&audiocorecc AUDIO_CORE_CSR_TX_SWR_CGCR>;
+			reset-names = "swr_audio_cgcr";
+
+			qcom,ports-sinterval-low =	/bits/ 8 <0x01 0x01 0x03 0x03>;
+			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x01 0x01>;
+			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x00 0x00>;
+			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff>;
+			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff>;
+			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff>;
+			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0xff 0xff 0xff>;
+			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff>;
+			qcom,ports-lane-control =	/bits/ 8 <0x01 0x02 0x00 0x00>;
+
+			#sound-dai-cells = <1>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		sram@c11e000 {
 			compatible = "qcom,shikra-imem", "mmio-sram";
 			reg = <0x0 0x0c11e000 0x0 0x1000>;
-- 
2.34.1

