Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6EE38AC99
	for <linux-sound@vger.kernel.org>; Tue, 16 Jun 2026 20:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781640920; cv=none; b=l9s9VXkKcHYz/YA3aygn6a9YkgJVRwX496/5ksAThoC9VjYAwfcZXAZikD6jlNJ2Sh02p99SweUxXDmHEYyfV7Ch22iPZpW6QQfP0QURmkf6t1lm8nu9oAxYNKFdPy+w1/J42jwkuCLnUMvgtLFQfkgz6ggDwyk8Jh4seur6D0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781640920; c=relaxed/simple;
	bh=90V0FlfPTJPkqqBkSjOmRA+aO6OFiJGhDlEU1re5SAk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ax2VDCYkT+RWrFz3m4rbz2eECFLUPtGIsRjQnBS1unqe46PLX5HqEjSYjSCKwQHBnbEthsqxigklI7vcZSpcU8OTx3OajZkfkTqRxEU+YvjdNRR6oQ7k8yUaCu9Xkuf4zqFP6tPO8CPxZWLVgHw0XzIlibS/NHvvd6Rttx/9XI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i+2LQfI7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kxo9X0Np; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i+2LQfI7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kxo9X0Np"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GIORNV3913499
	for <linux-sound@vger.kernel.org>; Tue, 16 Jun 2026 20:15:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=53e3TnI4YtK
	3eiHimozcR6Vdlld3sUnHJUSIasjV7MM=; b=i+2LQfI7Q8XrKUi57fX3l0QMgup
	YWj2phEhRPn1xbkqpRp+qf/HOHhZUvPLVHdHBZgFFTpXx0Xs3j8csD+lrlqEO77b
	AmOaF7F3jxlPoT6xeZVuyZ2ltinkmIgWYHgou+aq64q+PZWtYv8t8adcN5IP4Ypb
	O7YlZqPo7yLQgb12AJ3Yw+oR8aZARlCVB3euHpxmIa5nYkkZIx2uSrX+DXs9ftM2
	lJB+NDk1BUwDC6wINyrNR2NnjQag87mxvdUE2RFaVMZ681HagQ2R+Jv2CoirgPbr
	nZ/NRE90fnmTA/lKHVhLMYj3uXvr7vHl+/8Gm+8wrMk4uurc2OlyN9fm3Kw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu0a7v0ne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 16 Jun 2026 20:15:17 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c6a9bbcc53so6736255ad.2
        for <linux-sound@vger.kernel.org>; Tue, 16 Jun 2026 13:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781640917; x=1782245717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=53e3TnI4YtK3eiHimozcR6Vdlld3sUnHJUSIasjV7MM=;
        b=kxo9X0Np20/qC+hU+XYJhN4h+yE2B2z82t5Gs++6kr2YmYtqY9krHbV5RqtH9eCnIB
         3e02fsfvXtA2HKaWfuzcoX3RS1xa6rasp9daJuDvB1MTY2Q0yzHW+WwQPqb5jzllkssQ
         ++MAquPnMQ8+tu+7XterMbffTzwVP0KQ7oZcFGFFPpVlzlmb0ci/ptw7/BobEForM6k6
         V6xa2RNki+UGYZ1FB5ETQyGf0XrIm4bYx7HPQyTXHOTEb0xM+s1onbSC1xriI8UIfktZ
         lrPmoySsjGa1/FDnA3H1ejOleR8F4n3c3ETedPGuf2IEa1hwrSZqzFvc08V/lrnDO2gJ
         fYEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781640917; x=1782245717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=53e3TnI4YtK3eiHimozcR6Vdlld3sUnHJUSIasjV7MM=;
        b=bY4p1xngauLIFA+tzduteGrb/5IVz3haJerhpub77gJVLCeq3iCO4yRE/uyuGD6y/t
         riYK2T0S9EcPaEeVZfRO2riX8dZCGhZsgM/q+n3J+vJ2LnWWkiXOad8kS1wqWp5sAsVp
         C7rB+2x9DplsioMCDMSyeacF5mOOfgk0foK/3PeGnNbAdhxVAirE85GrQrqIW1pwRUd7
         Aot76iva2AnluZSDXWa2piippmwRKZOlzEyAgOvjSfbINQYJaePt3Ulhrt5kWXoJ4BdK
         DO6EuLX8Uti6qBDEjjPT6qcwgBpFzG+4qxhyUyLx1qHyxJnTU0KYJEz99TamCvdj+JLu
         W2bQ==
X-Gm-Message-State: AOJu0YxNYgaazNoBuI2nji6BjvLGi9UJxrYJblTi3BcG8h+EyzizgjFO
	Is+nkFdW4yNwTbudlEDnn9y4RbYLZVQ8MZ0NQ/TYs/RzijXlAhJ1tBuek6JrhHPhrSQONZAfNXU
	ugsaGO1/5xxOt47uLogJARQtRjm4sy1boiL1NXbT4JUhxFgRKxsO83eJMnZRbMyZ7ag==
X-Gm-Gg: AfdE7cm+4Fqd3mtABJcR0qYoZs0SP7GgOjn5u/RJUNapV5l6B3TIruxXiVGPNX1MSv3
	yFKdOp4REPtzDiN5afMvojiCREXjkDMCAangJ0HgQh22ePEQA1w5i1yf2nKunpsDi6Q0vfnq0o2
	z5HNU16FqTbwsoiBFqu1N88rIKESbb08SuTP37xClrm2j9bpI1gbFU1692f9KHhMjsB8ZtmGyoC
	Wl8cTZCip5nJZ7ChZwb+Jit150I2RN6HXfbFOtaU0rcFEeqzwNEljX/ktDVBpt5LR+XOt6go1x+
	CQAPTUSMXHF/EEh9eUoqryOF4AU/ECGchG7wdOvwEC3OH2r524YfD3AUaY9FZQI/VRoPy3yk5nw
	y94a5OjgBkxMC9nfbWuReakFNbEPqQp4DFlDHOSGbmrNmbqhRqlgtkNiyQQ==
X-Received: by 2002:a17:902:ce88:b0:2c0:d8ee:7d73 with SMTP id d9443c01a7336-2c6bc28e44dmr5286925ad.37.1781640917251;
        Tue, 16 Jun 2026 13:15:17 -0700 (PDT)
X-Received: by 2002:a17:902:ce88:b0:2c0:d8ee:7d73 with SMTP id d9443c01a7336-2c6bc28e44dmr5286595ad.37.1781640916758;
        Tue, 16 Jun 2026 13:15:16 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4328abe7bsm136385985ad.49.2026.06.16.13.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 13:15:16 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Subject: [PATCH v1 7/8] arm64: dts: qcom: shikra-iqs-evk: Enable sound card support
Date: Wed, 17 Jun 2026 01:43:14 +0530
Message-Id: <20260616201315.2565115-8-mohammad.rafi.shaik@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDIwNSBTYWx0ZWRfX/UMiUi6BQWhK
 VJC2zqfvQsCWMEvrZc+GZ4Ma8e0dgJhpGKptZEUWEaQ1mMr7vmFHIlYd0V6XSY0KYDnou1O4469
 7f4EXqKjeodq8nuZ1mvhz+v+oLxSnTienziI+la1ghv17nHaR8xes+uvgQ7G4/3WtX6b/agtXxE
 q11lgwMdsuPLiKDCVPoxd8uIM7nMu+XxON2P2WyXr97ujUaG5BD2zto+WvUiHci8N48on/h7FC2
 BXwVgJrlDe9e5OyAUPk6+dj+M2VpMwIl7/F+PLG94lmCnDYUv3n5ejVGjp2E+sbb4PvtS5fkyi9
 EqAw1aWkvZqDKvGqm78eIlHjr5ZIsupYOoi5SVxoHe3TChTnwTKnU3QkK8dymnxSfZtYz6pAgkV
 AVNtM3PTLwrZT44ERn+H/1hH9I5R2DKPoGEJpYm+PVZRvbVrCmxHQ5v48FTvdKEJ8iQvxj8yeNt
 nJKAt4IunH1d2Hnn6EA==
X-Authority-Analysis: v=2.4 cv=JKALdcKb c=1 sm=1 tr=0 ts=6a31aed5 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=gAFAZ2oFMDLOpEcE9BkA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: zuVJoMTts1fGXbMenzHAxZs4Wk-fgXnZ
X-Proofpoint-GUID: zuVJoMTts1fGXbMenzHAxZs4Wk-fgXnZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDIwNSBTYWx0ZWRfX5RfDv82dlvWQ
 p7G4zImwmll6Z7JZiRoUunuoyF9eqwaRwg0B/jZ8GJsIHphowxDa268lV/YLkuKwc5gqgYwGIX3
 r3mbm2P0idg/5sAECCS6c3S7B+8QFKU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160205

Enable the IQS EVK audio card using MAX98091 on I2S0 for primary
playback/capture and VA DMIC capture through q6apm backend links.

Add board clock and pinctrl states required for codec IRQ, external
mclk and digital mic routing.

Co-developed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 143 ++++++++++++++++++++
 1 file changed, 143 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index fd691d53a0fa..62f405578172 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -23,6 +23,75 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	sound {
+		compatible = "qcom,shikra-iqs-sndcard";
+		model = "shikra-iqs-evk";
+
+		pinctrl-0 = <&i2s0_default>, <&ext_mclk2_active>;
+		pinctrl-names = "default";
+
+		audio-routing = "IN34", "Headset Mic",
+				"Headset Mic", "MICBIAS",
+				"DMICL", "Int Mic",
+				"Int Mic", "MICBIAS",
+				"Headphone", "HPL",
+				"Headphone", "HPR",
+				"Speaker", "SPKL",
+				"Speaker", "SPKR",
+				"VA DMIC0", "vdd-micb",
+				"VA DMIC1", "vdd-micb",
+				"VA DMIC2", "vdd-micb",
+				"VA DMIC3", "vdd-micb";
+
+		pri-i2s-playback-dai-link {
+			link-name = "Analog Playback";
+
+			codec {
+				sound-dai = <&max98091>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai PRIMARY_MI2S_RX>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		pri-i2s-capture-dai-link {
+			link-name = "Analog Capture";
+
+			codec {
+				sound-dai = <&max98091>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai PRIMARY_MI2S_TX>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		va-dmic-dai-link {
+			link-name = "VA DMIC Capture";
+
+			codec {
+				sound-dai = <&vamacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
+
 	vreg_wcn_3p3: regulator-wcn-3p3 {
 		compatible = "regulator-fixed";
 		regulator-name = "wcn_3p3";
@@ -68,6 +137,36 @@ vreg_pmu_ch1: ldo4 {
 	};
 };
 
+&i2c3 {
+	status = "okay";
+
+	max98091: audio-codec@10 {
+		compatible = "maxim,max98091";
+		reg = <0x10>;
+
+		pinctrl-0 = <&max98091_default>;
+		pinctrl-names = "default";
+
+		interrupts-extended = <&tlmm 28 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&q6prmcc LPASS_CLK_ID_MCLK_2 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "mclk";
+		assigned-clocks = <&q6prmcc LPASS_CLK_ID_MCLK_2 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		assigned-clock-rates = <12288000>;
+		#sound-dai-cells = <0>;
+	};
+};
+
+&q6apmbedai {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	dai@16 {
+		reg = <PRIMARY_MI2S_RX>;
+		clocks = <&q6prmcc LPASS_CLK_ID_AUD_INTF0_IBIT LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "bclk";
+	};
+};
+
 &remoteproc_cdsp {
 	firmware-name = "qcom/shikra/cdsp.mbn";
 
@@ -103,6 +202,36 @@ &sdhc_1 {
 	status = "okay";
 };
 
+&tlmm {
+	dmic_eldo_en_default: dmic-eldo-default-active-state {
+		pins = "gpio71";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+		output-high;
+	};
+
+	ext_mclk2_active: ext-mclk2-state {
+		pins = "gpio110";
+		function = "ext_mclk";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	i2s0_default: i2s0-default-active-state {
+		pins = "gpio105", "gpio106", "gpio107", "gpio108", "gpio109";
+		function = "i2s0";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	max98091_default: max98091-default-state {
+		pins = "gpio28";
+		function = "gpio";
+		bias-pull-up;
+	};
+};
+
 &uart8 {
 	status = "okay";
 
@@ -114,6 +243,20 @@ bluetooth {
 	};
 };
 
+&vamacro {
+	clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_CLK_ID_TX_CORE_NPL_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+	clock-names = "mclk",
+		      "npl";
+
+	pinctrl-0 = <&dmic01_default>, <&dmic23_default>, <&dmic_eldo_en_default>;
+	pinctrl-names = "default";
+
+	qcom,dmic-sample-rate = <4800000>;
+
+	status = "okay";
+};
+
 &wifi {
 	vdd-0.8-cx-mx-supply = <&pm8150_s4>;
 	vdd-1.8-xo-supply = <&vreg_pmu_xo>;
-- 
2.34.1

