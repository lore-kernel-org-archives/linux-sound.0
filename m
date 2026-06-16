Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1AD385D9D
	for <linux-sound@vger.kernel.org>; Tue, 16 Jun 2026 20:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781640900; cv=none; b=hnn7ariZC5//g4odeNW0U8aWGIjFMvEToMjyolw+vlxz7t4CzYwv6NgXcjeRspScsOI6lTuxwfwIT0a8rl7cOmaeCcP4E6rjlPaAlncZwwK2Ynevv4GlYa71fH1wNZqLuDwYhOQyvKU2tMVS7KIchduM3nfc5gkJmap6h+wiN6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781640900; c=relaxed/simple;
	bh=ODwdSoU7cqmB/7e1YsfTUheHlnTIX2vwYFihEXMDSfI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KKnuIYt/y1c84HzuJSsdAXwTu2jrXKKcp+MheWveHtUtdnIM17mE2+QjxXwAySxWiCyuUfRMbB4Z34fRAPLuTMoOKyAT+nNfceIVyRcU1H+CVXmA96B8a2JBxgX0N5QDck4qX8JxhMP9TmRWL00/icERAXDbD86JCLE5aQwrepM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kc4G34iS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZcMzzF/M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kc4G34iS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZcMzzF/M"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GIOlI84038365
	for <linux-sound@vger.kernel.org>; Tue, 16 Jun 2026 20:14:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BNn1Y3z1D+8
	dRX7RzMyWh4L6G1MgZA+3f5EQFzZKjbg=; b=kc4G34iSWLnifCCD9JjC2kiZsdN
	j7Or0ZlNU/q8wkev6/ydsUG12zBM5aJi2ghtuzfWBRQe629OahN5GfNrP2WAV3Xc
	Fq14YvS7bc7T3a1I5Jx2XTwDg5aWbWRHrHUPC0UC8kho80xW0dzROJh10Qx1UJ76
	JkFXgLd016k8GluUXdIcA/tKPbybMMx3+4a29neTIwcQFwXm4AbqDd4SPmxfyVoH
	OdRTz6qq2TN4xMAHm8Cz/Ovz4YgI8haq5lCzHY74gQuKVWOjdMElnCX3vm5Sn86b
	WrA63AGRAk6xcl7g+9GuuckQo9B5RMGDaRZhJ7d1gT8dAhuK7PHM9dbWazw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu1763r2u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 16 Jun 2026 20:14:57 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c6a997c400so1357325ad.1
        for <linux-sound@vger.kernel.org>; Tue, 16 Jun 2026 13:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781640897; x=1782245697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BNn1Y3z1D+8dRX7RzMyWh4L6G1MgZA+3f5EQFzZKjbg=;
        b=ZcMzzF/MYMJ/hxats3rF8BWCLM9olqUC7TqjyXZ37HZ/cSlAqWRphsU81xDSk5t1XX
         gyUl3f0dBpxLn9BHgjut4QoY86UTR+zxhUa6lv13tFV+++ISv8r01GU0HHVoflG9jdGN
         qrAIslTylfS/B3WhOPnnDLtCiG5B4E01SfgDOq8tXS+3aDQ6uXcW7t8oqqRtDV9PGM2d
         Ruyw+JD1owH6oSYghqqBwf7Y13u+/5g6rYli6Nx69174e/8WLhiPiUSPgtYbztbujhd/
         wOXE0K6nC7G4PjUSPcT6UTb2SvPOMH+rlpDq7u+98wp5gCa3/l0XASv2ZpmXN0K1Z1IG
         V1IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781640897; x=1782245697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BNn1Y3z1D+8dRX7RzMyWh4L6G1MgZA+3f5EQFzZKjbg=;
        b=ddatch4GF3eHgoU2n+EjOebS5G9mj6I7rko43gF3TgKP2YRxfaOXQ8/3oDr9OmXAP4
         leG/ENMx2qPrQNdbmwNU8r7sR11EhEZs+LKWGR8FMhbSEGYY84ebglf38kW/YBWVl1HN
         unXdAl2GKISFDA8GqQUrDoWues/XpFLnT0CoRTMExO+sMlH9Uq3sDFjsctvwsX1o1lK5
         dyF242818x/bryahaChB1kDslY7g6uYnuiq+pGg83CElkBOkKdxO8bdG7vAdLVAsC2AU
         9K69rNpV9leE/Lb0s+9DNuPHRvu5ymnvvijNXbstg9cMp1g4j5nl76//1kqFgVlmPdh0
         7I8A==
X-Gm-Message-State: AOJu0Yzm/XO7mL0sFkUb4pF3ipwG/MJ/wNKaaiazOJpCuhE7j7f+jz7+
	iygXvfuS+eWWUIDluzykngA4oOtzDC3Mc4NOHKLBZU+/YSFVmkRUTkNWnhV9Y6IsCiQZ5N7GmPT
	uZ4Qpz9WRmo0uQ3BV8Zkv3dda7DdrcAX0+LPhd8nhFG4u7udYoPncQ6wwqMWKfvCI5g==
X-Gm-Gg: AfdE7clXcDXQa256qnqLzfQo3T4BmOQNrtNR8M6igL01hNAmGT8HbPJUdBQfjnGGwsm
	aSuFKjuDrOtnZmJgxX4CfjJx4/5ovbQCFZjQwrkt96S1QvagkvJ1NSEoml6l971FTlSM1gN1uZS
	lj6a0YBRk6Uhn1WVYkC5DMMeL1c4X3yZHJaanDYkIqv1ovCb0c6yDMTg/kGHHtR8yWZdz06TUvF
	wEzC83gUKKYtrVP9ZpQUmyIc/P6/OgzvKYhFRU+FB+R4A7n7B8YixtEjHEN81wXItcxZBCofxZ9
	xLFk6aUyJmpG3AEc+TvEDgzTZQ2swhEUQK38gS/UUramduG569QI4HV/WWDxU+qorBGRggz3rXN
	0n5S1ZueDFdlMqD5RfQlAmGAHn2LT6DQDQAeDtZQxusVIbtA3LebKeW8DLA==
X-Received: by 2002:a17:903:37c5:b0:2bf:1aa9:6c8a with SMTP id d9443c01a7336-2c6bcfd164bmr1794665ad.12.1781640897279;
        Tue, 16 Jun 2026 13:14:57 -0700 (PDT)
X-Received: by 2002:a17:903:37c5:b0:2bf:1aa9:6c8a with SMTP id d9443c01a7336-2c6bcfd164bmr1794565ad.12.1781640896810;
        Tue, 16 Jun 2026 13:14:56 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4328abe7bsm136385985ad.49.2026.06.16.13.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 13:14:56 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Subject: [PATCH v1 2/8] arm64: dts: qcom: shikra: Add QAIF CPU node for audio
Date: Wed, 17 Jun 2026 01:43:09 +0530
Message-Id: <20260616201315.2565115-3-mohammad.rafi.shaik@oss.qualcomm.com>
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
X-Proofpoint-GUID: rYPDL72QtjwSMWgysdFXRY6tbu-MHuZh
X-Proofpoint-ORIG-GUID: rYPDL72QtjwSMWgysdFXRY6tbu-MHuZh
X-Authority-Analysis: v=2.4 cv=I4RVgtgg c=1 sm=1 tr=0 ts=6a31aec1 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=u7cSe3xy4d7cT3VL5CEA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDIwNSBTYWx0ZWRfX8gGZrETTJPsT
 HHsnNtnrlwdaI5jN+56Qqwij8ctSkiLbcEI1zY5OyzUWy0IH/dH2pHOLnGB/MlxGuRWJxKhznYc
 zs0MEqo1YIMKy6iPjxjE2W2x74B+5Ps=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDIwNSBTYWx0ZWRfXwaKH529jixX0
 iWCQzCI5/HBkD3NgyQ/IoEPSHcIXhQau5FlzKWfpCXD+jdeRgS4HdaKxTD7Ysf3ETFYRWxcbWc9
 f29iEtu2FYSfKEOPzcMh7/sPy5dC5lj03680Ol09t3heUm2sVfNATJBcBGoFijZ2uKLrAhU0kws
 rZAxbHvAMAvNUzjckY2yHDpI+2+6sgCjZzK8dsCEbw6xz6cPssmh9FbNaHc+whv06wIv3SI+i3J
 8ja8t67m88m93C/CqM1ptz0QsENYCs40HN7h7Q4mMA7x/l3FvmZ1MArSppfHdBqO+cnS9wG+/xT
 2hcb1Fv/A3ChQriyYdM1oWNAV5yC+sHXKgU0piEJUjI0DYKnZCgby7jshJQuwFtMGFHchTDhddf
 e0LDrPlF+1akiX+jwpmtnf8eBm3PYur0IwRZ6TPbzPwhGdyE5JbtN21Qenkn98m7OXN2ozfg9vP
 JuivApHhycZ8MHbGk6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160205

Add the QAIF CPU endpoint in shikra.dtsi so board files can connect LPASS
front-end links to backend codecs.

Describe the MMIO region, interrupt, IOMMU mapping and required clocks for
the QAIF block. Keep the node disabled at SoC level; board dts files enable
and consume it in subsequent patches.

Co-developed-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 46 ++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index bc4ad2bcbbec..e58c87fc8cb0 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -2017,6 +2017,52 @@ dispcc: clock-controller@5f00000 {
 			#power-domain-cells = <1>;
 		};
 
+		qaif_cpu: audio@a000000 {
+			compatible = "qcom,shikra-qaif-cpu";
+			reg = <0x0 0x0a000000 0x0 0x20000>;
+
+			interrupts = <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			clocks = <&gcc GCC_LPASS_CONFIG_CLK>,
+				<&gcc GCC_LPASS_CORE_AXIM_CLK>,
+				<&audiocorecc AUDIO_CORE_CC_AUD_DMA_CLK>,
+				<&audiocorecc AUDIO_CORE_CC_AUD_DMA_MEM_CLK>,
+				<&audiocorecc AUDIO_CORE_CC_BUS_CLK>,
+				<&audiocorecc AUDIO_CORE_CC_AIF_IF0_EBIT_CLK>,
+				<&audiocorecc AUDIO_CORE_CC_AIF_IF0_IBIT_CLK>,
+				<&audiocorecc AUDIO_CORE_CC_AIF_IF1_EBIT_CLK>,
+				<&audiocorecc AUDIO_CORE_CC_AIF_IF1_IBIT_CLK>,
+				<&audiocorecc AUDIO_CORE_CC_AIF_IF2_EBIT_CLK>,
+				<&audiocorecc AUDIO_CORE_CC_AIF_IF2_IBIT_CLK>,
+				<&audiocorecc AUDIO_CORE_CC_AIF_IF3_EBIT_CLK>,
+				<&audiocorecc AUDIO_CORE_CC_AIF_IF3_IBIT_CLK>,
+				<&audiocorecc AUDIO_CORE_CC_EXT_MCLKA_OUT_CLK>,
+				<&audiocorecc AUDIO_CORE_CC_EXT_MCLKB_OUT_CLK>;
+			clock-names = "lpass_config_clk",
+				"lpass_core_axim_clk",
+				"aud_dma_clk",
+				"aud_dma_mem_clk",
+				"bus_clk",
+				"aif_if0_ebit_clk",
+				"aif_if0_ibit_clk",
+				"aif_if1_ebit_clk",
+				"aif_if1_ibit_clk",
+				"aif_if2_ebit_clk",
+				"aif_if2_ibit_clk",
+				"aif_if3_ebit_clk",
+				"aif_if3_ibit_clk",
+				"ext_mclka_clk",
+				"ext_mclkb_clk";
+
+			iommus = <&apps_smmu 0x1c0 0x0>;
+
+			#sound-dai-cells = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+		};
+
 		audiocorecc: clock-controller@a0a0000 {
 			compatible = "qcom,shikra-cqm-audiocorecc";
 			reg = <0x0 0x0a0a0000 0x0 0x10000>,
-- 
2.34.1

