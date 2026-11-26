Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795718308;
	b=FmwtXh481nb72TLJsIgZzMqS8DLDRMr5rbSCGxsAeTbIIxuahHMUBNWJwYyGow5JnOY2
	 cM+CTATENKYQtj6dPDj0pioyB3rgEdROiBRiBxcGiUE5HqYp5ggzDhG/UfsdjyID4C8cX
	 RRH1no2xI11T56tZ6RFFFzUqmujVL2veC7AfaIzvGbpX5zuIHfGbHFyrd+ujQgbFYE7SF
	 K12D3uumqbW7L66+Wk3vsExvCW28blaaPu5ftMR/sJJLLmOafbIXkpdlTEVnfE6bjamhA
	 kLH+mIOMHWeFbbtbFDW25JVNCuFjIwBBNQT5uHizH1mpCNUFLXX4IlYtxSA0JGeFVOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795718308;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rZ77rrPbpTMti4JAz9Xa5Id0mArJS7dhs7MItMO1ANA=;
	b=a+94/BDn91VtzNnQotmgGqi0x8j5YfnNT9kBjjxBrivUjJ5cqid3ac+R/myXUu+sHLAB
	 uOyszmKgItaONWofQ1BDkEuARI77XDiV1cxxPxUNLAdZkMSQW2EGU2QTi912lwTE8nS7G
	 ybZzhkW2f+tTXtC0N4Zud6Yg25r79xs85n8L0CrESrQp7L+nsx/VreXIPDAJFjsr9zO8A
	 pDv6CF/qB5mLauO0ojM5wcmvIYOHUe584TVsD01+Aal8s2NbLnVHzzGEf7va979/evvqi
	 iYCozmkWbnY2Nc5zOMb63fKLSOssNQn54K2Ak9tOQJtNW9Uek8bPI7paBwG28PSaUwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fUE1YKph;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eVl49IfZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7098C60A2617
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 18:38:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7098C60A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fUE1YKph;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eVl49IfZ
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFu4tR4049053
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 18:38:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rZ77rrPbpTM
	ti4JAz9Xa5Id0mArJS7dhs7MItMO1ANA=; b=fUE1YKphOZWoz+N54PNqlhiZohq
	S+3ResfSUS1JUfKlSiZuT3i9zpi9nqVy2gmjd9akn/ewSRtXKs777tLqTONWoVG1
	Tu8veF2r2LM4YzOUVgBYYIe+12gQp0ljSW1VSNzUwrlDRty6sAvaRuHMc0juOzI5
	74llgG+wyqE6cuFLkPGj60OShnUSmtJeZ7zPOQ/pNCtblgcKWHJVkt2sUd+f2MnD
	nGNmf2W2081w52M75ulPUb6t04vtSUA0Btv+EIaxkAdrCUVRT9WfbQrGGibZ8iXw
	OrJqyzOnYG09zWVojmohC7IaLbdj4V1S5IkfpVZvCRWqQgJd8NAvhRZmpKA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6f8rjjxq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 18:38:26 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-55bc8181defso129250541cf.0
        for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 10:38:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795718306; x=1796323106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rZ77rrPbpTMti4JAz9Xa5Id0mArJS7dhs7MItMO1ANA=;
        b=eVl49IfZCJ0V6WYzLGDHCAzGfo+qTKh2lDRjdclhMmnwEv2Mf4P0mXJWA6L2IoWfnO
         jbrG+jrwvuTT/xNr4GE9p2IxPYp3QeTCj2PPM0fengQWDZmmYDJNVHIIH9ZYPWJQrpwD
         NJXxMyHCG+Y9KiuPgAjci1/DtyNw2XNqLyMQnCgYbwBgOcerj+WBgnCD6cKbBTQ/Hy6b
         2Ao9ogFLZZoeRIXueqFtMqnAjvnm2lGbyNPl9+2gr5r0RaPZlgoaLkhhu40ValA1ToYa
         XKpKUXe7MTFMVRRHUWN8yeoN8ZubuPn3Jbs7L9+J1Jc9/FEy7AZzvVn8c6bw/LEBfVOw
         Q8NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795718306; x=1796323106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rZ77rrPbpTMti4JAz9Xa5Id0mArJS7dhs7MItMO1ANA=;
        b=21rFdSCNLz4mqnsTTDV2+Ck7n1XqdlaiMGjATahoqfBueMU5zghgXywft06TXn04xA
         sSp9hLlZaKqWpImGjbwG7rY1A4U3bUOSke4/17G8HgKmMUt6FvfE0ef2Yx2BMbP7Yh+z
         8H/plupvHZBEC+aVaYlL/ks9ze3do/e8VvBn2F9BLUK8QeIklEM+9X59YDiSVUoSN0iy
         fpAh/7WGpHTdkD6le8Ak5DVm9ZUKSlMB8II6ljoOv/AxSvWryzT6omIEyEgtwWocvtHn
         gzlUZ3xlmgNhZNgNyyDCLi4sQ7FWscPyRcEboqiryPUyCVOCGbisAvFcsm8TbYUgtOAv
         C/DA==
X-Forwarded-Encrypted: i=1; AL+hErFO74OFK3XFXHBh5XOoohl1JHz3doWEq919abDhiDfA9h2ZMEZ6IHGSj35q7ZDf40hpElBJ/mfdPkcU+w==@vger.kernel.org
X-Gm-Message-State: APuU4Z+QRWPE1OZOEdFSZoOjuqTfFwoyrX4qX18UhZBYOydfXbIue6m7
	tbHcJRuA2YqIsR73SMBYnevCR4AQGy258OumC2GZCFrzwmYAreJvTNt4Lj6+rwt/zgCNs3R92wX
	2iW2YWf3QTGT6cS1hRuGyvcfeFU9MEYe8rOt4V6KasfH1fyWINabqagWOnHM7dlQlTQ==
X-Gm-Gg: AZFdTZe0os5kTVG/q/pHvHi4pZlEIdBni4FIjMzCyXyrwyHdkf9emB08ND8vYXpAuGe
	NNz8wVW7/0QCSnUDVSt5caUKlFY6rj521chdmSnz3CNXoGyQQDeEvDDfmJ5Ipme47p9sKgx3ZMf
	UvQWy/q6lWi3E10XvEUCm8K5ixhcsGroPnpf/tJCkPWzGr2JVRn8sHuCa4qhIqUIf85i6npfSlE
	GPMEO9y+d+cJCiQqWWpDnztljFMpBy9YDbujXPZzLgoGTvMWUhrGwRMk7CwbC5mpybmO8O79X21
	sX+M/2XoY0l91VjxbGgq6eM6sdhOOEnIjtVOOytfeH8RVezdxd5NTNGoeQtH6gPE7WVp1PQVj5s
	hdjVRP+N+UvoEGjmMgoFVQQgYdosJlEb31I1666toSPw26KSafPebt2JJEEq342FY
X-Received: by 2002:a05:620a:2585:b0:949:727a:44e8 with SMTP id af79cd13be357-949ba9e6390mr3996341085a.35.1795718305842;
        Thu, 26 Nov 2026 10:38:25 -0800 (PST)
X-Received: by 2002:a05:620a:2585:b0:949:727a:44e8 with SMTP id af79cd13be357-949ba9e6390mr3996336885a.35.1795718305415;
        Thu, 26 Nov 2026 10:38:25 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f7bc1sm239659035e9.3.2026.11.26.10.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:38:24 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konrad.dybcio@oss.qualcomm.com, abel.vesa@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 5/7] arm64: dts: qcom: glymur-asus-zenbook-a16: enable WCD9378 headset codec
Date: Thu, 26 Nov 2026 18:38:04 +0000
Message-ID: <20261126183806.172485-6-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA3MyBTYWx0ZWRfXx4RYqT/zHlyQ
 scXPXLUihexE0ZawEeeZqJsGkxYlep/q6fPRdKhAturr2eb0ZRdMIKr9vrk9h8bqAD6SvOfj+Uz
 I8oLPZqo0lrCZ57tgaBzN+mAy10Tt8cnDZRsj5fZteRy6X7Q33y9LvKFr/DgUMl/EZtMBfjRhtj
 6AaABy+gKxApl4tsR6B8IItstQ/+CSlfX/Qph3lDW3UxAOI+Q7XiTLezNVUnITuRzR2wQTMj3P2
 axyTBgUCd6dxuxQRi0GikqWMrIcoi0YPDQtmEVGv1DiJoSSpPGKjE7yTr1rdkG6wm5T0Ex1wPE4
 FnosRtnGp3WaPa71V666MZ5p+QW7NtJ327dPpEidNimL41KtnMRmjN78PCnYt2l2V2plZqoySbU
 ECoafc6bUIM/R4dQUjiXOhr5qoNFfY5D7QZHbfIXfERUk/kdH3IFdqhasLEI/PqDqI8DQmFje+L
 Tg/e2Bg95IWF9xco8Rw==
X-Proofpoint-GUID: 8OO9VYLc0PlVcgzLWe1rL3m1El3L6LSA
X-Proofpoint-ORIG-GUID: 8OO9VYLc0PlVcgzLWe1rL3m1El3L6LSA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA3MyBTYWx0ZWRfX7Px8M2cJ9okb
 ggkOFiRhDg0WCVczDZyIhMRq4tnWaZaUUhEKbZI445P78cqSRhsq5bPt3nnKVINIApqQKPXM2WU
 yZSetj3Ff26b+kOPxX+tBgU7YEBxjKQ=
X-Authority-Analysis: v=2.4 cv=FuOQbGrq c=1 sm=1 tr=0 ts=6b087ca2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=xQsMbUBcp26Z66NZsYQA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260073

Enable the WCD9378 SDCA-compliant headset codec on SoundWire,
matching the Glymur CRD wiring.  Adds vreg_bob1_e0 as the MICBIAS
rail.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../qcom/glymur-asus-zenbook-a16-ux3607oa.dts | 90 ++++++++++++++++++-
 1 file changed, 89 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
index c253597b5a5a..ca035f10dc6c 100644
--- a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
@@ -272,7 +272,10 @@ sound {
 				"WooferRight IN", "WSA2 WSA_SPK1 OUT",
 				"TweeterRight IN", "WSA2 WSA_SPK2 OUT",
 				"VA DMIC0", "vdd-micb",
-				"VA DMIC1", "vdd-micb";
+				"VA DMIC1", "vdd-micb",
+				"IT 41 Playback", "HPHL_OUT",
+				"IT 41 Playback", "HPHR_OUT",
+				"TX SWR_INPUT1", "OT 36 Capture";
 
 		va-dai-link {
 			link-name = "VA Capture";
@@ -308,6 +311,38 @@ platform {
 				sound-dai = <&q6apm>;
 			};
 		};
+
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
 	};
 
 	wlan-connector {
@@ -351,6 +386,13 @@ m2_e_uart_ep: endpoint@0 {
 };
 
 &rpmh_vregs_b_e0 {
+	vreg_bob1_e0: bob1 {
+		regulator-name = "vreg_bob1_e0";
+		regulator-min-microvolt = <2200000>;
+		regulator-max-microvolt = <4224000>;
+		regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+	};
+
 	/* Unused */
 	vreg_l2b0: ldo2 {
 		regulator-name = "vreg_l2b0";
@@ -763,6 +805,44 @@ right_tweeter: speaker@0,1 {
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
 	gpio-reserved-ranges = <4 4>, /* EC Secure I3C */
 			       <10 2>, /* OOB UART */
@@ -920,6 +1000,14 @@ wake-n-pins {
 			bias-pull-up;
 		};
 	};
+
+	wcd_default: wcd-reset-n-active-state {
+		pins = "gpio191";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+		output-low;
+	};
 };
 
 &uart14 {
-- 
2.53.0

