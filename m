Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795794939;
	b=O548ESQqs9IKLNj+lAYw7sHG/Ok6zFueio1dEQFIwHpW5S3qHhZlfQrwx+tJo/kLabFj
	 zGAH9JpZGYz2IPyxicvaUcQi3RHo6+orD2K1uZFuX6YOy/a1I2DgbS+pGIYXokW2YVFi3
	 YcUIUu3vmUZnwuTljnvhOiiToTtezjwXM1V4YVF10fpedGSIWEPn/lOPeswOprtBlzLP3
	 IcBmvc4FsCOhxPtOtg12zHAMtx5AP0Ot2JTcgoEDXUPxKL56WFBXEJ/LH0Hsc3IRE85Ge
	 LlrgUBsMIs8wDz9G18iUlqlYDkZyWmHK2ljXPTTweruc7Mj3tuvtXHAv2luSgHpEe5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795794939;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dZvmTbygxl/XClFljr1KmcHrdVRr51qfi7CDWubHxqs=;
	b=lkGnLOpvxCDm7QyePjGuKc1lciKxfyvQA/1G4g9t7rQGJhC/FpcAbB9q5h+TjMZamgje
	 hcH8wIs6jxAcqs3ZFo4CrRiF4gkViL481RemK/2j73wnqydbUSX1TcwFUoNdu/dFBjbvr
	 0EvKVA9/Y4nGPoq1y13tsAw0Y/DvV60HQs8bS1/cVYH1iPNqrZxLfYfAKnKM8NNxsHXLU
	 dUoE8g+nVK69c1j4NdO/3ZsJ1tsZWiqNa56BG4IYbZNlVCNC/+6hR0pu0zRAs8P57Ds/+
	 lMwJKVFLFT4f3QKPVtoe4+Py/SFzMC3AQAT6w4SL/A7xoMgOnBwlKJDRXjuOMzIW3oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DLFbTXj4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iQyGesAr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7AC606A33D
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 15:55:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA7AC606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DLFbTXj4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iQyGesAr
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARFpDTm2712128
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 15:55:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dZvmTbygxl/
	XClFljr1KmcHrdVRr51qfi7CDWubHxqs=; b=DLFbTXj48d+iUKP8MXY1V6LJ7c/
	B5zTgkap38t4G7/IkaS+Fldgw5YmxoZmneh7zmU4HfNM8AE7505B30YK7VnhhOw0
	3yqNCnsZsk5q4siT3zmYCLcCMgwE+oWmCH2oTcqnv7kNU1yt16kHW4TpVwYgRIMd
	0Ul6xNnNYzcJ08o1lQ5Dh/dUMpAPSZxACipq4YFPoDREcQkSRyi/xSBmaQqJ0Zyv
	t/KfREBLp/hbEjM2DThaK1kdV6ZZ+rOILuZlPGD8QouRVSXvSBDvCcvqLAwUsVUf
	NogBmCWdfTqGdQUORppRp96UHkSLvoByQjRi9xvgx833jR/SoaVYonS+TYw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74gat4uj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 15:55:37 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-92125ff2d08so79842646d6.2
        for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 07:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795794937; x=1796399737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dZvmTbygxl/XClFljr1KmcHrdVRr51qfi7CDWubHxqs=;
        b=iQyGesArv3JICEV2GW5sQcBTospM8v4985n1HgyLkb/STM5iEo4UhdYbuTbkSryfcZ
         eUBT95gxDK4SvRri86nAeJH6Xl+5/u7YW2fkuutLLeMk+8zr21GFOoB/ZuWcIc67Bag/
         my03uMeAKXL50IHk9qVLrswPyi7N/Zqbk2cXxhrrJHt37tIFLp5DFJfxfoq2FbteUQST
         ZGEILQ3uqWbcezEziKkizJhCeYCW1+wny3RCvhgFBTeLbs0b2mr+G/vLaPwWAJzPg7jM
         GQpGeiDA7dQBVy8D3YkE74HoB60zXseBwf53J+TqshTduw6jKCtbbFCBrOcnlTizL95a
         d6nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795794937; x=1796399737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dZvmTbygxl/XClFljr1KmcHrdVRr51qfi7CDWubHxqs=;
        b=aXEKNW4afsEA0/DG80yMz0w8Ta1e2cXB/0WySuJ11n1u2jGKxX2En0IS9F/BZSMzDb
         c5r6e3Rr8Q7Mc5Gwkb1+333M210EJBMpn28mwru3Stu5YFkExrhtEOUGTCwYNrASxTv5
         jF/nPSECGxGja5eqymVpvbu1sdywpPuBC8mtGTpDYxTPLaOOa/9ECy8r01epNrmZ1Q7i
         avImvAouQs3OlE4j6PG80qvBFe0Yx9v7tlEuPYAkiUG6y4AsGH2U7qOcjtfV9zCo8kf+
         z8JlGCFfu6qBxzsARaLoIhbAg9OmM/mGlYFHLswofeOHU9/ZthUBL1NPmvKx0rEy3AMp
         h5Nw==
X-Forwarded-Encrypted: i=1; AL+hErEJ6ePYSSmFYo44JxI5uCBEdxwix3rCjyCAGwcMuOQKeHszaKK2aFAvHqZc+/C9o1UseG98cKmVpuAg0Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z/bdRFbyMawr2WNfxOWMcacCa1KRtJ3egwiOxnUwbKwWt/asETT
	aVDe4A0TYqXq4LrBu1GhVL9eCy6r3LPxl4c44gtDqWnHFrpDiKX1DCXsROCwFt0QptH/l4DnRy+
	golqQpc3AL3NnVbmQFjcY4ZpQfw/y8d+8pGGqciFwvG9RI8yw9pU6a+yA5CsI7kuBFQ==
X-Gm-Gg: AZFdTZdruZBTKVpLP/hRPsu/C7Xzvj8trCPsAHFeexddg/EKZxXqqWy/TpowH3z6TQk
	bwGVI5DCeuWVEZtLkYhLIfidg70rm5lihBacGc51WHQ2B2JlBTso+wZR+VMhcjo9JEdvFZdMqgY
	ZBB1dnTQDlh2yW1TvysJbNKBGgSZ66ELJuEfQmxTsH1M0dtrUqNcrKH4/qTZYJgHYgIw5e1HRFd
	xEGfMmRMhohdgXHfGXImEw7PDVMxujoMfq1clH73GUZLCpYJOr1+gOu3bAulvp7BHTpPxc8Y1PM
	yNNEHwgZwpZoOJZtI9qx23Di40X48tavWTkpuuCu0UtsEQtd0+M1x1ez4toiO52FYZ5g2HY9Lkg
	nAYmDd6Zvg89ncdBHhjB78F7qwoZhV3I7Z8kDTl6yiewfacIZBZsTF7d9020U6ll2
X-Received: by 2002:a05:620a:468e:b0:949:6027:7580 with SMTP id af79cd13be357-949bab7df00mr4612601085a.83.1795794936869;
        Fri, 27 Nov 2026 07:55:36 -0800 (PST)
X-Received: by 2002:a05:620a:468e:b0:949:6027:7580 with SMTP id af79cd13be357-949bab7df00mr4612595985a.83.1795794936461;
        Fri, 27 Nov 2026 07:55:36 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf6804sm47272636f8f.10.2026.11.27.07.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:55:35 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konrad.dybcio@oss.qualcomm.com, abel.vesa@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 2/7] arm64: dts: qcom: glymur-crd: enable WCD9378 headset codec
Date: Fri, 27 Nov 2026 15:55:15 +0000
Message-ID: <20261127155520.358909-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127155520.358909-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261127155520.358909-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: jZfd17seUDAaGokTvlCvyta9yl4kQ1oV
X-Proofpoint-GUID: jZfd17seUDAaGokTvlCvyta9yl4kQ1oV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA2MyBTYWx0ZWRfXxU3ZczSKlGFv
 qJ1GGXwiXbBDYgsyjxqSAkITULJPMsDfknmT+X7/dwa2/akrW96cOfS3rH1Hlp4hVyqujvMfc8N
 2oAVAulgtw5GUnRbxujDxEAKQMUy60OG8EazCH0ODb/k47/YKtqbCpicqyjSqbmzF7h2cNljziB
 /79N9h+GUfu52eBxvVb29MZcnLXOhL2S4gMklZ3GvVp4eTrK+wQ/YQ2VvXqsEhe4m+UYloh99hD
 h+6l/myZPZJGrPysdIUNJhr3PqksH13hb+lrJfLPIxhH92Pu/eAxNE0OpFjG4RhLPrth3lSj47Z
 dJRl792o6bhM3lIV+GVLOLT26N7WcJcGY6BYMGQxcVKiyFGh3dETMgidCMUopV9EatGhU+D+uED
 1nfB2Qf/MpjE33CyEVSdZ39K50XUGi7oHTzVBfeXmkLSRM/AA0yCkg+6joPX4QPEK+otcoI/0EE
 YOp8Y3VemxPXYi3bjxw==
X-Authority-Analysis: v=2.4 cv=I5bw19gg c=1 sm=1 tr=0 ts=6b09a7f9 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=imSGFiSTgn8yRhLT7isA:9 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA2MyBTYWx0ZWRfX7ZzrWx5OP04N
 AN6IK59m6jIWJ88Sru/kJGlLtuMiRR9rx1vINbYuWot1kMT5ocTAXm6R+038aGXAzQMVeIF1HRX
 T0/1iJYGIcS7mLznl6C9L4JnXdZ7OF0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270063

Enable the WCD9378 SDCA-compliant headset codec on SoundWire.  swr2
is the SDCA primary and swr1 is a DATA-only multi-master dependent
(lanes 2/3); the WCD Playback and WCD Capture DAI links run through
the LPASS RX/TX macros.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 84 +++++++++++++++++++++++-
 1 file changed, 83 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 3a9cd5f3ec2b..8e0dd2956882 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -242,7 +242,10 @@ sound {
 				"VA DMIC2", "vdd-micb",
 				"VA DMIC3", "vdd-micb",
 				"VA DMIC4", "vdd-micb",
-				"VA DMIC5", "vdd-micb";
+				"VA DMIC5", "vdd-micb",
+				"IT 41 Playback", "HPHL_OUT",
+				"IT 41 Playback", "HPHR_OUT",
+				"TX SWR_INPUT1", "OT 36 Capture";
 
 		wsa-dai-link {
 			link-name = "WSA Playback";
@@ -263,6 +266,38 @@ platform {
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
 
@@ -791,6 +826,45 @@ right_tweeter: speaker@0,1 {
 	};
 };
 
+/* WCD9378 multi-master: swr2 primary + swr1 dependent (DATA lanes 2/3). */
+&swr1 {
+	num-lanes = <2>;
+
+	qcom,multi-master-mode = "dependent";
+	qcom,multi-master-peer = <&swr2 0>;
+
+	status = "okay";
+};
+
+&swr2 {
+	num-lanes = <2>;
+
+	qcom,multi-master-mode = "primary";
+	qcom,multi-master-peer = <&swr1 5>;
+
+	status = "okay";
+
+	wcd9378c: codec@0,3 {
+		compatible = "sdw20217011000";
+		reg = <0 3>;
+
+		pinctrl-0 = <&wcd_default>;
+		pinctrl-names = "default";
+
+		reset-gpios = <&tlmm 191 GPIO_ACTIVE_LOW>;
+
+		vdd-buck-supply = <&vreg_l15b0>;
+		vdd-rxtx-supply = <&vreg_l15b0>;
+		vdd-io-supply = <&vreg_l18b0>;
+		vdd-mic-bias-supply = <&vreg_bob1_e0>;
+
+		#sound-dai-cells = <1>;
+
+		qcom,sdca-compliant;
+		qcom,port-mapping = <2 2 3 4 5 6 7 8>;
+	};
+};
+
 &remoteproc_soccp {
 	firmware-name = "qcom/glymur/soccp.mbn",
 			"qcom/glymur/soccp_dtb.mbn";
@@ -961,6 +1035,14 @@ wcn_wlan_bt_en: wcn-wlan-bt-en-state {
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
 	wcn_sw_en: wcn-sw-en-state {
 		pins = "gpio94";
 		function = "gpio";
-- 
2.53.0

