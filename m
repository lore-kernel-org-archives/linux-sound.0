Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972D03C109A
	for <linux-sound@vger.kernel.org>; Thu, 17 Sep 2026 04:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789619910; cv=none; b=EohUXg3NwX/mjzUkB+SYoncOC+Hngs/Il/vOUPX6xY0XwtJFSj3mbKcUmmG0Uc5aw3wx2jDA82zrAxh2lrp2vEJD0fk9f1RtCnseILkNlQg8+Cs8zzdhMJxaydnB9K1fqUPud5/YBVZLk7Eqi+DF8yOmnKKchVgzSrIE87s1Ym8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789619910; c=relaxed/simple;
	bh=SOV9jDO8GOlRCmornBB7OfFab2xr3q5d1uV+VfkbaNI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uz7Hi5jWsoJiECAlNNHYPyeZnysvVbu6SjByqOc4ZDBs8LDWZLvfutsNmsiV3AhCUHTFdMsoenfmuNxCwgLd/nsyMuyPGG7HJi1vq/wd/yex+ATK7qloZ4mFe4U224MLPB5N7yYbIfzX4QTfQ6fXGT4r/UkwWb53bluqM44knQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ddYxuVpl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aAb/8Ntn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ddYxuVpl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aAb/8Ntn"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H1gZJW3897297
	for <linux-sound@vger.kernel.org>; Thu, 17 Sep 2026 04:38:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U5+92k94YxTQHHecRbmgdArr12KipPi0NK/Izeo3Geg=; b=ddYxuVpl5SKum7vb
	TWg96g13MCzVFwiTjVzu0sTdPpG+k/wMpK7EUqy5KKOHgE41nltEYOTndQW2j5HB
	gbUTe6dDgucJJtlVRSbyWDRxyElrC5eM7qn78UN9ZAFFoRkbAjnJCx/dLkxcw6sr
	ZwglLssqnEENFmGUD3GlND0jUqwHZvMIHt8I3bObyUXTYaeZ+2JERfDr+SExQXAG
	jBe9TtDbuncuyW0/MzYIQ/37+ZPYviqW3NypBzwTSJvEBSfOYqaaPOUUcy5Inap0
	NHYeEt7crNB0AaK46clNIIhfkqTrzJZ5dK+dURCFN44H1AaYON65c5UcseV0dhrY
	YyW8hA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy6atbqk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 17 Sep 2026 04:38:27 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-396901263b6so815268a91.2
        for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 21:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789619906; x=1790224706; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U5+92k94YxTQHHecRbmgdArr12KipPi0NK/Izeo3Geg=;
        b=aAb/8NtnuHujNdhlpX4rq1eAN2SoNHb+BT2Kg7AxooAzkaRckeEhCS/rXtrUmv8eC9
         Tg79ni7bZsl0p6l04px568nwb9T/nBv971t+eGkhFiCgq7D25vXNhMYkqpmBiYz8dMt0
         AvUqXVirI2NapXJFt2CIiVA0iPuIxrPHESYkdbvXxPYBLY3VFyCiwlEzSpVfOoapTEtM
         glY7Vknmbda1SuryJ+rSJkgSqEfZp7LgNIqipGg3GyPVYRaxWFtkGintitdTl3nKYUWx
         BUn1Z9DWiqDEyA5s2rsAnVagpp2suuSaSV6xHM+Ug4tT2ZpbqTp+CtuKBIvmKjkt7VY3
         rP9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789619906; x=1790224706;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U5+92k94YxTQHHecRbmgdArr12KipPi0NK/Izeo3Geg=;
        b=Qcdb5C4Gcvs8+9SVfQOe+pKIeZgo3qVdKvYqdFdp1sqOYz7Gier06enWngDaS1zGMW
         Xh2BWUA53PZb+MYNJyC7yWbbZOW8xaVAYy4JFYVeBqQ0+QUHJI2aNhN6sxzD5uAaQdd8
         gnLVqFQu4Xceb6rMA0w4Kfr3d1zkPWKwbuKcBOPJci0+nIv6X3U58a3K1PMkEn610f9E
         uQK1ZiHteaYFdMNOSvzBua7g96o90J81yEHB57CKY34Jwd7DDTteF+8b35/QuxJGJFv7
         3TPcg68T9lnvsOty1iYodgbTeIS/FzYp1MDBg1VoResZ46LGGcjhTeDqhqrSU8owEYQM
         OWHA==
X-Forwarded-Encrypted: i=1; AKwUvByyw1hyGoKMC3MnGLo372cfNuz6V7f6dGkfZIwCDPpCMB+pWQ1AX6nUv8rHPr9g78mFGYLowLJMT0/qdg==@vger.kernel.org
X-Gm-Message-State: AFuF++klVRPmTtISkl6zKJnZvOY4OpiXdrWOoh9KbpR4pWpLUGKao1E2
	suLkK3IEcnJOj3fLc0s9aADrrz4GbOTRLTrnW7ElMZqD5feYtSj8G7NSk0P3AdNOgdqZfznE8aJ
	RT4baLu8u0y6JaUOXCym3/zEvtk4a8KdweVxSu5GGPQymGxC2ZHROxU00H12QtkD0zw==
X-Gm-Gg: AYBFou1CiYfdoVx15e5umoCv/owsqFWi/buLqRYqtdT5Nvo7/Y1fyUfMra0DZ6g0bsw
	GS17BN6U3RDD3VdqaZMhAjkPqm9kbJ7r6DPaUjmCWuo5QJdEopCl5F4AunCpeLVFZLlprYO6Aoc
	zlcyAI5TryjYmnn4De85rVCqGpZKfxyIqlv7iuKNsVemR34VaoUI6QBmKYa/2JZmssApxhbXysV
	KqvkaAW3x4Sa9u4kjuJb8MGBnxtxP8MtpV2fK6jlR2eWjh11SaC62f5q0dqtEpEZh0c8WBL9Oex
	dTunJS2EigeECzoEgj4AYfJvmF0a9bW2ADu8msF2Ra1yqhzlQvGv8JmdSoahzXPOFBYCmz24TX5
	ST7XMEcpu/bbB/cbDQk454fW5Y/UMa/xHMtlG
X-Received: by 2002:a17:90b:3b91:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-39e1e2bf7a7mr15585934a91.6.1789619906210;
        Wed, 16 Sep 2026 21:38:26 -0700 (PDT)
X-Received: by 2002:a17:90b:3b91:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-39e1e2bf7a7mr15585863a91.6.1789619905788;
        Wed, 16 Sep 2026 21:38:25 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a9fd38sm12357376eec.13.2026.09.16.21.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 21:38:25 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 10:07:36 +0530
Subject: [PATCH v3 7/8] arm64: dts: qcom: shikra-iqs-evk: Enable sound card
 support
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-shikra_audio_dts-v3-7-9a49e1ca6370@oss.qualcomm.com>
References: <20260917-shikra_audio_dts-v3-0-9a49e1ca6370@oss.qualcomm.com>
In-Reply-To: <20260917-shikra_audio_dts-v3-0-9a49e1ca6370@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789619867; l=4088;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=SOV9jDO8GOlRCmornBB7OfFab2xr3q5d1uV+VfkbaNI=;
 b=NFGiksqVqZk6Bh651mL1HsehAuBd8zzu2uDQcIwZIWi2f+ezvpywh5kXmmkymzuDEqKqYXibf
 FchPMroDX4XDkvCnuttMdyq6KdYynKIcKK8S6nyE5sdwy4T/JO97iLY
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-GUID: nRi31V7QLLDvmQ5nMnoPMzftul3_OIL8
X-Proofpoint-ORIG-GUID: nRi31V7QLLDvmQ5nMnoPMzftul3_OIL8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDA1NiBTYWx0ZWRfXyz0BVYNrMD3E
 HStZ2c+V/WJroU82aonAox2YKp5XIVrkje51MJtj2nCvfnAr0rr7Fnqy3nJnCZF+C0hfoJ5TX+N
 d7tGd09KDYXYzgI7wqD8xrJg/TueGA6RaEMvsYAIouFKfNLa7+8dSIiScO6SlG9NjKzjIfeSzot
 fkyThbYFHuoUATSoHE0W4iKTgU0medm/YXINoJf9qKqJ/CkYohXU5lIFwhESrpoxxjG4+0t8LBc
 Iah17VPS3eJk0kgPhjMBughKb/eaJjyhcUM7DzIkHbeUWH2kDP28VXcxEUF2K4ey90KCu8IJPyA
 eO79Hkpqo26uq8eLvRwlmC2trV47fG2+SG0jrLPQKOS7V1+zbyGTLS9vyORTDjJRO2E70/+gmwA
 WR2pzYFO8UtDWLL9OjKmwMygIMmY4ZrfZzpKPd80ata+nUJrRfTkeAXyJAepBSjQnT3K0d9dULN
 NVH3VqacCzDkLmhqxag==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDA1NiBTYWx0ZWRfX1uFo4b1MrMhP
 o4LLIKUO7L7FacLpQEkMRmkwX66mMvgFP1uwQdJLHYurnZKpJv8XT7JPQv/xYnJc/hUf4CeKKuj
 mSmbxxroA6e5dC5mPKNNFyGcULdtNdA=
X-Authority-Analysis: v=2.4 cv=VIRIDNPX c=1 sm=1 tr=0 ts=6aab6ec3 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=wLb_nwxRshEjtDnoXkMA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170056

Enable the IQS EVK audio card using MAX98091 on I2S0 for primary
playback/capture and VA DMIC capture through q6apm backend links.

Add board clock and pinctrl states required for codec IRQ, external
mclk and digital mic routing.

Co-developed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 144 ++++++++++++++++++++++++++++
 1 file changed, 144 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 543d769125ef..54c840a748c8 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -21,6 +21,105 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
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
+};
+
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
+		clocks = <&q6prmcc LPASS_CLK_ID_QAIF_IF0_IBIT LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "bclk";
+	};
 };
 
 &remoteproc_cdsp {
@@ -80,3 +179,48 @@ &usb_2_hsphy {
 
 	status = "okay";
 };
+
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

-- 
2.34.1

