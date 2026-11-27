Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795794943;
	b=iEeqgefyGzg1/7Jv4xSauEbONHUoh4aYl08ZhTujEwp4UPpkcCHBb2q+JiqxWO2U5avB
	 Xgdz4eZaONm0BS2JdS4xawYCYFdA8BiBTScdZEOO++Qi6CbbRm4c2mo0XLbNLHmrWmSvj
	 qtEq3oqubqKzgifpeRROKe0KY73S/S9DEiCCgH55ZJ5X384izVSJYC6AykVgBtQErqe2x
	 YXcExVqZLMSpxBVIfYOMqjJ+HK6LNaUBMlCgrutF97rHRvwv/7mQS3CVE4VqyB5foF0v6
	 4PhyXYPcT5NXwfylZ1Y1voe2r1QJA9cm8V1age+kmMdX7MY0y9VNdHYQSpV5z9YdwgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795794943;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rG4kr1Dab3RBza5xdIKbdkUSrFDK0iKFNsbeuPBvbQc=;
	b=eb1eojQrqRedUtDPQecIcUqL6ktCKqjuIjeqSXzePQCUNX0a+xXuZs6Q00khyebOF3DL
	 vYkp67NC79aAypmM7+vGXu7f4pragggScRugftPz61Jw1AZ3LcT6kNlAl9spc2oG9T4cV
	 QIv1SgLwgdZdJ8HAysMeG31UN5y1hemBs9MersgtBU/jwaCdl3vpn8eGRVxZs75XsJPfl
	 k5WjV/UiDbByc6vii36rg+9mLwTaAHjCH4z8JdOOncwyW3uzMlfoTPnNkyTo/XEtge6v5
	 BypuXx0qtQIBPvSHmAtKxNCiaYb1ExmeL+TyNspMoDmYnB9z3v7kVuAReKkDUkjdfOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VV8XkmTA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LzxJcOoP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60FA606A6BC
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 15:55:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D60FA606A6BC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VV8XkmTA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LzxJcOoP
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARFpTxx2211124
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 15:55:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rG4kr1Dab3R
	Bza5xdIKbdkUSrFDK0iKFNsbeuPBvbQc=; b=VV8XkmTA2AIyfOcHypJJ0qWuqQz
	au7QkqKzUvtqdux6pms9+IN5SP92H3BP10OUVJFismpodw7Fp+1FnuU7df5bYIAy
	vzfhL/gejcpDitBFxjDZz1SlWTZiyJ8sEqb3WF7uEWS3HMvGvhwrDFqtEIengowY
	9JsOGz6ywojNwe/aG5NLmt0wdD9IgKXN04Hliv7HqvIO14aUoWLlZp+WvuVSSPQg
	rSdRqZLDI3o4XG5UgHRS7XC6Y5nkNYwtUQ9g0T7d2v6A64Qy52ib2w4ZRVCBf0+B
	3JIYrvYdz2IGplbi4i8gynSjJeDi2wdDQb/IonnQ6KXQ3R1n59+ki6/Uejg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u55up3n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 15:55:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9495af07676so1216989185a.2
        for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 07:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795794941; x=1796399741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rG4kr1Dab3RBza5xdIKbdkUSrFDK0iKFNsbeuPBvbQc=;
        b=LzxJcOoPvOWUdsjuT3JSFnVpzRUjcEp4+BcVYqPfOTH6os5LjgHSUgkDnzLk36nFln
         27iyfyyHQWxEhZD0czFiqv9q3AmR1TEHatRp5nQ4/kwO+Hr7CTNcV7k2wRZii7lVNXzi
         qEgEZIKihGA6YiWfu/0rwHGPtU+cYUpgbeZVHVmjMZaWFfpXTyJtCNc0PKbKpKUfpMkg
         7N0krsnS1pN+QTJP7lTnWMTt8AFZw0GA/QU/L1NlkpSsjIjk1b/37ck+ld2om6qZHFuv
         BLupdq/sM+SqKhkC2/7yLN6fJyLOJhgHsDXqdYcTjknsbXpNna3ekkXY19cSgnzpGZr6
         P1eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795794941; x=1796399741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rG4kr1Dab3RBza5xdIKbdkUSrFDK0iKFNsbeuPBvbQc=;
        b=OeTcQ1PkMyiQn0B04uQrf5dqXna9lotD1ZThNKEPfhjc9TFMMnA6QCurEksbwyJrOU
         aW6tVsZ0EedAoZpjiJE1kFHLcK8ZWnu5PRRf4gA+Y7j4rDq6b2hGEdVqM7XI8eb4xNcI
         ok7PAkr6cHkF82PZGlrK7lW/3Nh2/jyUyQqnN3Ot6+ZTMR/dNHvpvOQFGpMGMXZIHw5y
         6qWRRnO4BlIdOzJnb6BOQabpRDoeVj4qL3NawpwFdS7kPdv2+HfxaKhhro1UHUkLocgn
         8P5FOot6d63y+yNVYB5+FMEplSbXINUqrVbMBLj6z6A6y6+2dFwsjCDpRvidrCB1XzjK
         f67Q==
X-Forwarded-Encrypted: i=1; AL+hErEukF1IrGai0lu/V2XSAxcrHnvNqHd3PcNzkk0ji40eIxE0hqG4pVKgjFMq8WE0+XnYTHV2uUg+Of5jNA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/3Jv9UDMzKAP5fQ4m8B1V7kDKq7x8/crWG9DYs1V8Aqca2EnDV
	Zfx1gFuKeIlFWEoNeF4J9joLJKeKJ1DcEzZgags+tNjmPM3d+S8NolKvimwrfOWBW48m6RhIVU6
	fpMcYtE8wxwEYMfs+1jrZYdV9rMkC6EC56SV9qtX+R3rX0jK6HaTXQHDhrmVELkQg2g==
X-Gm-Gg: AZFdTZdjc/c7dI055GB2g9STkZVTf0EjLqtApDTCgS2g2nqyNXlLb3f0VsQFB0LYVo6
	ddCEi62Hds9DbhugVyHP5QgzhNJNNk+nBPuF6LoS1B7ohVViIKUVrFEmyhPgZe2kxbKDSXMsP2i
	A60M/iIy6F7aMNI5V2VJKfLGsTQdPZWtSXZmjXRwVbWlV5Lh1VleDIDB3ZzntEmJTn9zGt5u73r
	5tg1xREGYHpCpXNRa0isUmABnOQHgvQ99i8twmxdCluMKeJ3INBv5w7cRoSwtUUBaTHbpoJ6Sws
	OEknx8SludqkhNDy3T7Iuy8KLp+O5MqX4dKF4lQvfqp40qIH1Rwfj7lO8gwuuUaWtlYA0QjyQbR
	0OaHiB+ss3xSTZSmVuPBKHp2gPJiBnzSh0gcW7e5KWkCxAle6BZEhn6Tdb+AO1Pm1
X-Received: by 2002:a05:620a:44c2:b0:945:dd80:75d7 with SMTP id af79cd13be357-949ba9a5803mr4563575585a.41.1795794941138;
        Fri, 27 Nov 2026 07:55:41 -0800 (PST)
X-Received: by 2002:a05:620a:44c2:b0:945:dd80:75d7 with SMTP id af79cd13be357-949ba9a5803mr4563572085a.41.1795794940729;
        Fri, 27 Nov 2026 07:55:40 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf6804sm47272636f8f.10.2026.11.27.07.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:55:40 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konrad.dybcio@oss.qualcomm.com, abel.vesa@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 5/7] arm64: dts: qcom: glymur-asus-zenbook-a16: enable WCD9378 headset codec
Date: Fri, 27 Nov 2026 15:55:18 +0000
Message-ID: <20261127155520.358909-6-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA2MyBTYWx0ZWRfX1KtGqt0xeNiQ
 LWSFyFMS0bPU/hSnNEx4rkYrOpRHFHTUcaFEeYP08IMYacWfatiXPM3TL4lHkTKJCuiO8mNCXgS
 wLPGC6pwHair28aXZuTNc5+kjaaelDM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA2MyBTYWx0ZWRfX3TZCVEgariC2
 u2rMC/elvx6mFZzP0uaZp3M3NKtHg7VAV2wYK3Yyv8XxVO8bos9smC15a4JD65iIPpJKl0sh1Bn
 gxBjfWwPd9sQbS5JGIbUCQWL72n3fnlMgXPSFiPATyWQfL9p7oDGYckqcEKG9L0Onlakc8SIS++
 qJCxmnrot2PUmxUessKmKF55TxHwQdFjrC7OUFcEl212NXz9kjbn+GyGTSq0I4xo89WyhSMagHM
 CB8j5AUA/M9pCjevyYzoAOjvGLCglGT8jmdTZNHzBtIcGqNFAkLVjCZhwA2kBtulDM5GKbgQMUk
 t8FUX0UeaOKBAJnho95rCEhEJKMVUlHVoYLlrmnzeKElOqrzOBiG+COZRc/PNS+wIz84jBK8YjC
 RxudlRTUxdddNVlw+9fYli2vQippAS82Xj8H6rC22znpbwixxvmYo+BT6IKXT1NBfgLSTyXuZ6Y
 jRwiaG9BRcI5IB08seQ==
X-Proofpoint-ORIG-GUID: YCl900spzLIlGXEWPidxbpoYkg0twS_T
X-Authority-Analysis: v=2.4 cv=Z795j3RA c=1 sm=1 tr=0 ts=6b09a7fd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=HoGlWSY98BlP11pXvYkA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: YCl900spzLIlGXEWPidxbpoYkg0twS_T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270063

Enable the WCD9378 SDCA-compliant headset codec on SoundWire,
matching the Glymur CRD wiring.  Adds vreg_bob1_e0 as the MICBIAS
rail.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../qcom/glymur-asus-zenbook-a16-ux3607oa.dts | 91 ++++++++++++++++++-
 1 file changed, 90 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
index c253597b5a5a..3922d3eebdf9 100644
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
@@ -763,6 +805,45 @@ right_tweeter: speaker@0,1 {
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
 &tlmm {
 	gpio-reserved-ranges = <4 4>, /* EC Secure I3C */
 			       <10 2>, /* OOB UART */
@@ -920,6 +1001,14 @@ wake-n-pins {
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

