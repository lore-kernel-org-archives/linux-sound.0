Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C59E768EA
	for <linux-sound@vger.kernel.org>; Thu, 17 Sep 2026 04:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789619899; cv=none; b=OuVULYw9C7SyRwr8R0IyxtyFCHz0KWCmZyCUVlOumMFYzC2nGzv4/wIyz3y1Swu2jVvmA8ZQ2IaICBCB7oPfbL7N6h0uUbfdj+fWISyLKM2c7YeenN9z494ROX6j4s87ICkTgLwXZV/LocESQFq+/pN+6k083qmVZ3L0IG84GOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789619899; c=relaxed/simple;
	bh=tJiIhJjKgTlsYOZcHKJ+TsVwQYjgzqcKhJZaAT4zloQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L08+cB6qDnOxt37nTXPyU6Mdky+fJR/m+eLghCgniz2JsDZYz17Aza+M+9KKVhYm1hFlSEYm5885DljvD8b4oFoze6XnURmi8rLgMIyX86NO/JzC+BI9ReNMW+PiZTcvHqpNFXeyI80+mEnSoDAKlLcXyTUk9YY/iqC0BieQKgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XZilpUjp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T7LYReWw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XZilpUjp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T7LYReWw"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H22XxB3559699
	for <linux-sound@vger.kernel.org>; Thu, 17 Sep 2026 04:38:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DuE7m4mhrs94KZg4oJw8Gz2NDY26mkIXr6BuHt6kAco=; b=XZilpUjp6iE5vWyA
	jmgsFqR68q3gHrjaHZiNj9Quj560HCAekFxp9qTsGwvLFCtuMFVRkZfVposTOUNW
	6dDrL4HSxOxi6CSALe3f8Re0sT/TSI6Skah83Iul2jgaK54kv2xn8vhyS8uqqWkS
	PL5uP8m6KtFyeGZhN+H/YPJ/vlAAoKMyDFlijKv+ANrCV1WlnSViyIDQpXQcHVrf
	W1TWcz1u05gPhio6cWCvVTa8ItcIomS+4Nug9S9YWOY4hmLyDQSYqrP47R9J9t5B
	dx+R7yNbKjSaCQVj5FF6LXtZhbSxzdRGko/Brr2yzSe6uMA57yQq8lgzDQv30Sze
	A9IUGw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy7hacf6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 17 Sep 2026 04:38:13 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8696b921ac0so761615b3a.3
        for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 21:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789619893; x=1790224693; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DuE7m4mhrs94KZg4oJw8Gz2NDY26mkIXr6BuHt6kAco=;
        b=T7LYReWw6e1Nv9FvQSqVVIovp3hmzuhwcoREaQ2x3u7q+eNbiBmPouyRGSocJU4wQy
         nuyx+WLu+szAe2duQK2j/F8skYz6KHolJD4v5H7t6cud2OTnuuMU/SNXS88i7QrhThHs
         6+X2GZKEAasYxFpgCVEJVXlxNVSl/vlqOXNgaJeiTCW2PkH92YYz/g8mJIPPoU2moWff
         KiVxlm0fgP/0EvL8/O/B++ELjXJUwEkcUxF5BvjGts777yqBO+yA6jiianJNN6AQ5XE4
         jGxzTuY1iI4HUBOL6p15W/JUciAYKi5TFQ6Rb5Hrg3a3TA9eGh6W6Bl/CiB0zLh535kQ
         HIww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789619893; x=1790224693;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DuE7m4mhrs94KZg4oJw8Gz2NDY26mkIXr6BuHt6kAco=;
        b=iaUq5hNde8Jy74c1bt19ocqnXO8YQs8B9DqIgIAHDlSll/tRwwO0+kCn0AwLS3/dxF
         jTQ2V2UvsbWgJT3fyyWOAJpxtx0E2HwvPRDeq49pXq7nVvFURmpOP2MgsFTMsU86MDU2
         ucb+XvLNd6CN2zetqXFW0RcUGiLvsfEIRw8NP3CMjqDoYRDbOqIBlPR/wMu8+2eTvbdC
         r0J7tMM+Qwx0aL3XqGorrjLtQN40GFv+21k5we1yvdgkdWpDF9voDp4LYwnWJ2piNBuV
         n+Y1oo4HftsfNybPMhxuI8iP46PlG17UWhp9YkV3DAD13zAAicV3Vz7XyhwigvPoRGiC
         l8OQ==
X-Forwarded-Encrypted: i=1; AKwUvBxEQy1+FZi+e9kR6I6Ykke+vIHkUybHrxaL2SXml0REc0roGnknDnfKUrESCcIsB0W6oPB6JTn54oPJyg==@vger.kernel.org
X-Gm-Message-State: AFuF++lbNftF/FHP9Lap3YoxqTeRg0rywEF+Pj6nYOPHgQja9F4hrBLo
	M0fLBRebzUHy6Rx/Q5FMgfi7IPPHRYNFWrhXHzyCnvoyRvVrn9C+0zpfS9lZlLVgL9mOUDCKice
	1WWH/bidwU/O5j1Ki25tQZbjPhJWfOV2x/ElJffdWf26bdAFE7BMIreW4Afd3Dwci/DyLB1CUeg
	==
X-Gm-Gg: AYBFou3Z63oi746G/EIgi7kYsE7g7bcWuErchkQgHIym7A1qRAFIl8mlfltk/nXUR7m
	pSgJdSerh4eyqPD7pU2xcIjgxaWxwL75N63gv3uBFSrExWZzVVzFZBbMXNAnaYyHkQa8w1zTKDv
	eJXQ/UbVgC7VBqk5pWFA4YjbHQntVfGzjxkuzwxY9hb32fFkeh/SXBgsVhfqcafPX6z7jzQE2nd
	r5hHes8qVMxr3FGoZAkjNrSErztHxhqycsTfpFFVZ/6HCNf7ifzLaFqsTXSZ/1cySTTm0YLGqAX
	0PHIuwHtiMElBlvziTOFkyoa8bMVVg4dbZgTr/0d1MRGrDinbpgSucuJuzMuo7Vy/pnTPtlCfjl
	t7RaBLOwvjzroB0zkqsWsKLbUyD3VSHPhAiz2
X-Received: by 2002:a05:6a20:7355:b0:3d3:ae40:51e4 with SMTP id adf61e73a8af0-3dd5f73b6a9mr13046426637.24.1789619892576;
        Wed, 16 Sep 2026 21:38:12 -0700 (PDT)
X-Received: by 2002:a05:6a20:7355:b0:3d3:ae40:51e4 with SMTP id adf61e73a8af0-3dd5f73b6a9mr13046368637.24.1789619892113;
        Wed, 16 Sep 2026 21:38:12 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a9fd38sm12357376eec.13.2026.09.16.21.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 21:38:11 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 10:07:33 +0530
Subject: [PATCH v3 4/8] arm64: dts: qcom: shikra: Add soundwire and macro
 nodes
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-shikra_audio_dts-v3-4-9a49e1ca6370@oss.qualcomm.com>
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
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789619867; l=5559;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=tJiIhJjKgTlsYOZcHKJ+TsVwQYjgzqcKhJZaAT4zloQ=;
 b=nC3i5yNg0TE1aBNyZKCsSB3F90ec3xefgw278uuin/V0s/dckqfBKphsPEDZW2x6wcjwernQR
 4JlfKs+ZWz1CcwRzn8k6JlxQS38mt+kKzJqzqFcV7U2aV8KswHiPsTK
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDA1NiBTYWx0ZWRfXyKTuXR03wAKJ
 HNQv1seL6C/jCKrs0TXh39sTgaXoszMhphiipDwH2MBHjRFREs5B9PivSefncTq0bIARG59VeEX
 NwmIMGU/EVAicyU0z0tTgmk/fof3lUh0budsmG1+839/phK05EbOYbkysJ3iwnA97V07OMTLrKT
 nX0TY6JguNO/2XHnh/gwH+B0Rm+q8mhhorVwKNS0cFJN4a5bk8l04XBX4MhnKhJsgqnKLzV2xaJ
 lYD3AU7ClREscDn9ogVBzZVALTPe942YgNfyqAqAM5Zm+oJaH2lZc+LPIXRj0inPh5+LE5Er79x
 Wt4vJq2H6528va7Zlre6PVqViomVy8dasiqBDbVKAMRvagko4+TWsI7Jzb2XnyZjnJ0HRP5/7Jt
 xcQhxEAr7cmt5HQbNKLJMXMpO8klLArGz60JgVTrTF7Xbg1VvnnYY0nRGxAbGp7va1GRxQl8eyb
 /8NRF34OniY8qlICM8w==
X-Authority-Analysis: v=2.4 cv=L8aI0OT8 c=1 sm=1 tr=0 ts=6aab6eb5 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=SBFx_aHcOOkmsUdThYYA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: 3furDmi7AePmmccJfJk47J54SzgMLZQd
X-Proofpoint-ORIG-GUID: 3furDmi7AePmmccJfJk47J54SzgMLZQd
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDA1NiBTYWx0ZWRfXy8w6ayYieOxm
 6DNLzIWvGqdXxcSTytJxgBdVKG4cE9POxE1fUELggPXvyrZEYtYEPcbbRlae8rS9M3Mxmer+EPu
 8ZdZd4pjtxLpr+Xoja0GOycWZYq1hLk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170056

Add SoC-level SoundWire masters and LPASS RX/VA macro nodes, along with
DMIC and SWR pinctrl states required by the audio data path.

Keep these nodes disabled in shikra.dtsi so board dts files can selectively
enable and configure them.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 172 +++++++++++++++++++++++++++++++++++
 1 file changed, 172 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 21e4e6a7e12a..ec0a3cd4a27d 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -953,6 +953,70 @@ rclk-pins {
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
@@ -3677,6 +3741,114 @@ qaif_cpu: audio@a000000 {
 			status = "disabled";
 		};
 
+		rxmacro: codec@a040000 {
+			compatible = "qcom,shikra-lpass-rx-macro";
+			reg = <0x0 0x0a040000 0x0 0x1000>;
+
+			clocks = <&audiocorecc AUDIO_CORE_CC_RX_MCLK_CLK>,
+				 <&audiocorecc AUDIO_CORE_CC_RX_MCLK_2X_CLK>,
+				 <&vamacro>;
+			clock-names = "mclk",
+				      "npl",
+				      "fsgen";
+
+			#clock-cells = <0>;
+			clock-output-names = "mclk";
+			#sound-dai-cells = <1>;
+
+			status = "disabled";
+		};
+
+		swr0: soundwire@a060000 {
+			compatible = "qcom,shikra-soundwire";
+			reg = <0x0 0x0a060000 0x0 0x10000>;
+
+			interrupts = <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			clocks = <&rxmacro>;
+			clock-names = "iface";
+			label = "RX";
+
+			pinctrl-0 = <&rx_swr_active>;
+			pinctrl-names = "default";
+
+			qcom,din-ports = <0>;
+			qcom,dout-ports = <5>;
+
+			resets = <&audiocore_csr AUDIO_CORE_CSR_RX_SWR_CGCR>;
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
+
+			status = "disabled";
+		};
+
+		vamacro: codec@a078000 {
+			compatible = "qcom,shikra-lpass-va-macro";
+			reg = <0x0 0x0a078000 0x0 0x2000>;
+
+			clocks = <&audiocorecc AUDIO_CORE_CC_TX_MCLK_CLK>,
+				 <&audiocorecc AUDIO_CORE_CC_TX_MCLK_2X_CLK>;
+			clock-names = "mclk",
+				      "npl";
+
+			#clock-cells = <0>;
+			clock-output-names = "fsgen";
+			#sound-dai-cells = <1>;
+
+			status = "disabled";
+		};
+
+		swr1: soundwire@a080000 {
+			compatible = "qcom,shikra-soundwire";
+			reg = <0x0 0x0a080000 0x0 0x10000>;
+
+			interrupts = <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-names = "core", "wakeup";
+
+			clocks = <&vamacro>;
+			clock-names = "iface";
+			label = "VA_TX";
+
+			pinctrl-0 = <&tx_swr_active>;
+			pinctrl-names = "default";
+
+			qcom,din-ports = <4>;
+			qcom,dout-ports = <0>;
+
+			resets = <&audiocore_csr AUDIO_CORE_CSR_TX_SWR_CGCR>;
+			reset-names = "swr_audio_cgcr";
+
+			qcom,ports-sinterval-low =	/bits/ 8 <0x01 0x03 0x03 0x03>;
+			qcom,ports-offset1 =		/bits/ 8 <0x00 0x01 0x01 0x01>;
+			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x00 0x00>;
+			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff>;
+			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff>;
+			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff>;
+			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0xff 0xff 0xff>;
+			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff>;
+			qcom,ports-lane-control =	/bits/ 8 <0x01 0x00 0x00 0x00>;
+
+			#sound-dai-cells = <1>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+
+			status = "disabled";
+		};
+
 		audiocorecc: clock-controller@a0a0000 {
 			compatible = "qcom,shikra-audiocorecc";
 			reg = <0x0 0x0a0a0000 0x0 0x10000>;

-- 
2.34.1

