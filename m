Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795718305;
	b=Qt8gOSHDeLe4WPvv82gkfdKNk8rFJzNktIwNYoYcYzKT2tBa5ie4R2n7Y27OpRZQzTUk
	 17vS5PTwIngl7+NGfTkVbXN+ujcJ42ac9j+h0SZACjJs9IhD+Rv5gmSII3tIBnubqC2d7
	 SlVYoObCFb/GzUov/Xp3Mir9X1fbG6+I94q+j89BuQUq02lhSR/DcFZVlYVzFh5kF2RGd
	 vj3jim/Fc/fpSmTzYLDx86yJgsuQVMQnc5BYHL2my9OfIg+E0AYk6cNwZCyYl8BKKfxq3
	 gvgafILZ9nMPxHWEPBRacFbFYij8IGqPB93yVTRqqjXIhoiT13d1LxqlG2mjxf2HhFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795718305;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=BfVcGVrBRqJ7zIMdhtS1zygXckuAwk4N3NK9IAnInWE=;
	b=Xbvzgg7R000jH6zOO3mQ8LstG565IYgU8CyK0EHGabrNOlbD+5AW/Wnq5kIMpZUevtaS
	 6lTQ2F4Z2IHzMTytViGcQEdtXRRoAU39aqSjgE9fePtcb/amTfKMK7BdbHDQS4tK//k9G
	 nJvviPeIJsj3ANZgqK0KmiZTIFn5Yu9jHS+BUTEliykXdRwd8IEKCyKBSKXKnP9Mg49Rx
	 0zLP0WO8lDVBCtlZC9BjgTaZKUENCrOOB6RbAh7ajidI0dRIvjdbJ2yaDWh6j/M+Esz/K
	 kFx4YzqE5W5Dzq8A1t8OqJmoBPmHNUrj6gmZbas285Wi1GvjqPeoas12ceUxvPkRJIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iUycXkHi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M6DVRbv6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BFE606A6B9
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 18:38:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8BFE606A6B9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iUycXkHi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M6DVRbv6
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFuLMK275927
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 18:38:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BfVcGVrBRqJ
	7zIMdhtS1zygXckuAwk4N3NK9IAnInWE=; b=iUycXkHiF84UIPqvgnjW2Lq5L7+
	bpqHRWR9MYTgLVVTXbo6pzYLBi25Y6rYyGloCPQ1LhtteRUQoN7ZBKvDULG5j2w4
	SDVzI7pjcmdfovfAyOrrofivFVj5BIZe79R0PT8oYO1byR4npkaSECLaMAW4xTpJ
	3sHHVZEwzloOb14lBooXk5DUEOQdMyvNDwh5E+HGchxqU7lv1+ONR1t/9jjAUoe2
	dT0yZlsAi8iyPgj6JJtMrn4eVrBSaOnxuAyg2ERxz4EZEvTZ4K+JAHHfv1wYBHWb
	iQssYxMZ26u2aOvBmEQ62WNmQ87fzzwkfQASjCEvr3qHMSqVYZN1PVqhvbg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6hm820vy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 18:38:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9495c71055bso454802285a.2
        for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 10:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795718303; x=1796323103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BfVcGVrBRqJ7zIMdhtS1zygXckuAwk4N3NK9IAnInWE=;
        b=M6DVRbv6ECDiKiz66wAAhP8RfF5QPDNku3xsfNysoTHqlmD5SNIVuBGSvYTZthGEbs
         4T+SZdnjy6fR9vTBIEJ5rIJyGnTYoSKb3ZTRwEW8PW3ll8RLhtf30puolPMZm55eoyMA
         0EIzYPZ0xQqKxMfPFZqf9t2lJIkcRMDnCgGAtmIBlRDnzATG1xlAMEj/LNkFaAinoUEh
         zcQ68x5v19DGFd417dNef4LnKd6+4voy/DqnmLpWN7FjEUCgUHtjmlJzau8IzMiiHf9X
         /kVpQbNZxI/T8cMrI4hDDBMWSQc4FGk0FqO9aGY+t0iwfl9Skz9YKbYumKidMdlVk9mw
         thRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795718303; x=1796323103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BfVcGVrBRqJ7zIMdhtS1zygXckuAwk4N3NK9IAnInWE=;
        b=wqUHNhkvwnzWDT4vbViqeAGGIhhs0Zi3EhUKOU4XXGHSZ3gDhBcq79z3ri0G280M8J
         0NoAqQQtVLVsgoy2NIpPuGu2NBL8z3t0Ku8feEttExTLL6fsJA/r/OhPGQ/JTliv1k4o
         Q2ZcwFQ7PTaicGmQkBBL01Yazr2rfiXQC6kIfOG7+8NWm1Oyr8iBqS3MiVWI35AiSgRa
         V7T1xqcdUPOkFQZ1R55GwNmgyU5Ob9QMWyimk4GSL30lulXyoY2uAv1qGAf8sYANR6BJ
         qHL7LgkT2j2Z28WMx27je2NYdQZUX7n+0W109GhBnV/ecVv9+hrsIb75x/VFfTXUBs1U
         OGiQ==
X-Forwarded-Encrypted: i=1; AL+hErG+9xNE4iG+X7jGDo89VvXsjOzG8ybrPKApYI1XejwgEkXdoI6Gx6IsFChXCXf+oKUqZDJPKXGYzdJnsA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8mjM5+o0apUXjDdMj13NF7tyyj5Rk4h6fvzGCKyffq+mKID7mq
	S/At0vI0HpSkBlSW+sjv0+8DnOJmCajc865VFvWsNqpSjMKAVY7LH7CgQFSOycNyjFF/eR7l2Ls
	pSrTFYcXa1F2iQ83sK2AnmuGx8S777X4mbtRoOSx7BeeWUAG+Pnw7uxtC4UTcdIpohg==
X-Gm-Gg: AZFdTZd7K1H826GFOGY/5Gq38cPmA1MK22fsOP92cMIRF5zS6UEIL6rNg/ipIXFzu50
	1puu0cIYSdNFjab0BIAG+woX8Yho69kw417PlmD/edZbYc3CvR2vBw2D3C09PND5vCoujC4+1iE
	qgeIS4Qc5oEwcPqM6lI9w0NN1nxVf+zhLzcsE72LC4uz5CARGLS5tEc0aC0QF5STq14o0+xnMEv
	RfDZs2Z56UgERoef66P4W3Bv8C/qPdX1BrrPTeDKXUf6FYEE/EaYpy8FMzRww5pvEVJqZivAZrn
	FeCEfictQsYxzkZsBm7skbe0uThmQDlyTjKJF/k2CZqIq58wpFU0NT7hWeR8i9KWpU3PqdoperO
	WXESRZg/S78NYXpvdBfWrHmk5KWaYS/zWsm/KUq3bq+2cqjZcTcaVgcwcTaG+ilZA
X-Received: by 2002:a05:620a:19a3:b0:949:7acd:3c37 with SMTP id af79cd13be357-949bab678bemr3935502585a.66.1795718303203;
        Thu, 26 Nov 2026 10:38:23 -0800 (PST)
X-Received: by 2002:a05:620a:19a3:b0:949:7acd:3c37 with SMTP id af79cd13be357-949bab678bemr3935499885a.66.1795718302848;
        Thu, 26 Nov 2026 10:38:22 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f7bc1sm239659035e9.3.2026.11.26.10.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:38:22 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konrad.dybcio@oss.qualcomm.com, abel.vesa@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 3/7] arm64: dts: qcom: mahua-t14s: enable WCD9378 headset codec
Date: Thu, 26 Nov 2026 18:38:02 +0000
Message-ID: <20261126183806.172485-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126183806.172485-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261126183806.172485-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: I2dOMzpGrIGRMnRsqXU__FpHFdCCpozY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA3MyBTYWx0ZWRfX+SatkoX9d+4O
 uv8haSk2B6DIH5xbfQum/YmNunyerJ4L5HdLJaekLSnabJupy1m9V669bl47GHH/fGYn9ZyxrFe
 CvdZyup1Ptt/swKCEf8von6Wq8CV3Gc=
X-Proofpoint-GUID: I2dOMzpGrIGRMnRsqXU__FpHFdCCpozY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA3MyBTYWx0ZWRfX9xVJc8osBcJ1
 x0aHLjj0xXrDGmtWcBZtcQQ0g+/s7otuoEFkgKodd6hFprcWiJsoZJSHsNniKicPtj4t7R76S7V
 x0R8HpZxzH6pmM8Dj9Lsil/QONSn9gd49OLl8kKtWXD3krZpQnLbticqhyn6Km2c6SLm3dmi9tf
 z5kHKBwY2LYZq8bWRn5bYByjdrHvmydB4P/aMa1jxpbMwjzT0+Lm7l9acUmnitHgxL7epBO5fnI
 93dnm032ZsMKxIwlcKZXbCohdLCpUR6lac/IJA2p5aFHbwl1JeOS9ev9XCMWbf9rFhONvkcS27V
 dElepqYRjKXr+mipBvwJUM6jIdvUesIfsd2MRQjim9fXFxE63UV4F+bLsCfSr92H2n29+sl1Z7u
 zIS3J/wpo+82Xd++IKuahLxQicUWbgJ1rNpoGoAh04ECVaLObb+dFX5FFv9R4lbx5mSSBb/JldZ
 7GLYTIn4enYbRvUpYrg==
X-Authority-Analysis: v=2.4 cv=O/usLx9W c=1 sm=1 tr=0 ts=6b087c9f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=M8yDIIM4nUrurVDekmcA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260073

Enable the WCD9378 SDCA-compliant headset codec on SoundWire,
matching the Glymur CRD wiring.  swr2 is the SDCA primary and swr1
is a DATA-only multi-master dependent (lanes 2/3); the WCD Playback
and WCD Capture DAI links run through the LPASS RX/TX macros.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   | 83 ++++++++++++++++++-
 1 file changed, 82 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
index bad49ba5443f..84be12c07f6b 100644
--- a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
@@ -254,7 +254,10 @@ sound {
 		audio-routing = "SpkrLeft IN", "WSA WSA_SPK1 OUT",
 				"SpkrRight IN", "WSA WSA_SPK2 OUT",
 				"VA DMIC0", "vdd-micb",
-				"VA DMIC1", "vdd-micb";
+				"VA DMIC1", "vdd-micb",
+				"IT 41 Playback", "HPHL_OUT",
+				"IT 41 Playback", "HPHR_OUT",
+				"TX SWR_INPUT1", "OT 36 Capture";
 
 		wsa-dai-link {
 			link-name = "WSA Playback";
@@ -273,6 +276,38 @@ platform {
 			};
 		};
 
+		wcd-playback-dai-link {
+			link-name = "WCD Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_0>;
+			};
+
+			codec {
+				sound-dai = <&wcd9378c 0>, <&swr2 0>, <&lpass_rxmacro 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		wcd-capture-dai-link {
+			link-name = "WCD Capture";
+
+			cpu {
+				sound-dai = <&q6apmbedai TX_CODEC_DMA_TX_3>;
+			};
+
+			codec {
+				sound-dai = <&wcd9378c 18>, <&swr2 1>, <&lpass_txmacro 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
 		va-dai-link {
 			link-name = "VA Capture";
 
@@ -760,6 +795,44 @@ right_spkr: speaker@0,1 {
 	};
 };
 
+/* WCD9378 multi-master: swr2 primary + swr1 dependent (DATA lanes 2/3). */
+&swr1 {
+	qcom,multi-master-mode = "dependent";
+	qcom,multi-master-peer = <&swr2 0>;
+	num-lanes = <2>;
+
+	status = "okay";
+};
+
+&swr2 {
+	qcom,multi-master-mode = "primary";
+	qcom,multi-master-peer = <&swr1 5>;
+	num-lanes = <2>;
+
+	status = "okay";
+
+	wcd9378c: codec@3,0 {
+		compatible = "sdw20217011000";
+		reg = <0 3>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&wcd_default>;
+
+		qcom,sdca-compliant;
+
+		qcom,port-mapping = <2 2 3 4 5 6 7 8>;
+
+		reset-gpios = <&tlmm 191 GPIO_ACTIVE_LOW>;
+
+		vdd-buck-supply = <&vreg_l15b0>;
+		vdd-rxtx-supply = <&vreg_l15b0>;
+		vdd-io-supply = <&vreg_l18b0>;
+		vdd-mic-bias-supply = <&vreg_bob1_e0>;
+
+		#sound-dai-cells = <1>;
+	};
+};
+
 &tlmm {
 	gpio-reserved-ranges = <4 4>,   /* EC TZ Secure I3C */
 			       <10 2>,  /* OOB UART */
@@ -881,6 +954,14 @@ tpad_default: tpad-default-state {
 		bias-disable;
 	};
 
+	wcd_default: wcd-reset-n-active-state {
+		pins = "gpio191";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+		output-low;
+	};
+
 	wcn_wlan_bt_en: wcn-wlan-bt-en-state {
 		pins = "gpio116", "gpio117";
 		function = "gpio";
-- 
2.53.0

