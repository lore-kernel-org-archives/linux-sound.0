Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795794941;
	b=s9+kaaUBXwjZ9xozxIs+7MlXZfN3Mg9/bm/N3THlKt1B570XiqJyXS3aigDwo8iDIsKK
	 yPIde7WVsK61w8Uy2bhbfb8Qvk1SAi5n5rVR/s3jkDTIOl5KCTlEUFcwz5YHqxk5MQETU
	 FtkUf+isr7GT5XpcV/X282Xis/SH7oT8cjmHLHpyWkCKZuc6WNLkWApZIMRc4IFS4OEeH
	 Yp3YiD8NbUO/d4I4j4fn+mWfIdIZ2uESezpfGw+QuTibthv8R+tPANd5SjACh+YAPxxfw
	 FcOmq5NMyH55qvITr7OVyDteByq8b4F4LKEh9iyw9+z5KwWbkOWF76xgwb8mk+Vfa9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795794941;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AlSrlFLmZffwL3k7gDfM1QEVNvHBDX3zqYtjiRgM0LA=;
	b=2AQFSS0Np2g3kKTsYR9mPU5Jwt1pyeAug2ozpLZFuSp35nXYlWSyvdj9ofc4ykmu1AZH
	 WTD82wDCU0nJvJnNgbuK/J8YK9Y+GPHg43Xzp1gG9du4JV76KzQZtspvt2XryqQmChxS5
	 6RgwZQmND+fYRZ5yFY7B/JDcE2JZh8Xa2awn1M6HMwaUMY1U1hFMZDlC0LVMR/PmSPEtx
	 MNTJB2OrvTUVOe6MgKwpdKzppkC1BXRNqEUdh+Kl7XzhCIHzjeqzNUlfKRiEVQ9MgKxc1
	 8VhOlRzcxshbqHWAoxk35uz/1EKUEce/tSTumBkjdJI76ZeGwrNRG2mzDen14mmmI2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cstmriLc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h1M6lUFF;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6422A606A6AF
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 15:55:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6422A606A6AF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cstmriLc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h1M6lUFF
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARFpCTW2925117
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 15:55:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AlSrlFLmZff
	wL3k7gDfM1QEVNvHBDX3zqYtjiRgM0LA=; b=cstmriLc0cm87GqjflUjx8V48QG
	ZegzPBBCid+HEXcWRYX8bQGwbpws+VNQIM1udvuRI3/FR3BOSEa/0i3dSTK3bZCL
	sc40j4VEYPbJgpBTue+6iOg3YQ7eZ7KRRyhi6x4aOrtUKMzfLI8hCy31j2OtwFoS
	x4mU7gGb0gRjoW4bzb8NHbM7jR33yo/0tS+5zwcgQXwZDQ+a0G1Tn0XE4HJiQVlL
	ctUheAa39+lcmzwjI/ah0LmI/zGZSCMYD3TQPZ5q4Ct1r6B/zdd8hbhuazbrzsFZ
	pQvOk4R4kHKeM9gsaukzwWvqRuqYFgfze3cxqoQVUiBlLJbXqKT2vDSXFDQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73uhjbak-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 15:55:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-94967c6d4f4so923590585a.2
        for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 07:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795794939; x=1796399739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AlSrlFLmZffwL3k7gDfM1QEVNvHBDX3zqYtjiRgM0LA=;
        b=h1M6lUFFDy+eIt+2/EgPrcuXNt+3bD3jWNzo+0JSycMfZ1Lf9q0aJiYuYpaHBjvkxp
         nupkz10cFKJwTbU9qAXoCqSZwQZPzLoOe0bQkRZJ61KMmbypT60R/KEXlkVVEVfe2xl+
         JdHG/2qe5vmiliGaA27VTkrzk9U/Jc/OPk520VALWVTG9+Bw6+IBxc4ieDN9k3US552U
         9DZ6tDVmQkdnYoQGYZNVRyZXGd+ZCqDh56pHGl+XZ5hb3V+WYwGB8Mqd+8Ca453KHBWY
         7fc6UOm9p4RyHWNP/6aIsdiCM9PgDQfpRBW+H1hJcJmIQqGRTHRx9XWQCv17U2RcCyhO
         t9Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795794939; x=1796399739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AlSrlFLmZffwL3k7gDfM1QEVNvHBDX3zqYtjiRgM0LA=;
        b=P+vZLk2lgMTh5uDOQGMJ7zAOJQWz+unRsT54QhXtpYYFT45+yglVoy3k7ybNYb36Rv
         QzdQtIWBnfP5XkqUtUUmnOYr5vrxW7IrNaN7KpbVmI6DOHdslLthjJ6E0Xyk/EzwHoCy
         0I7yfnYIPOgNtULq8t4Iy8W+vrFY/5gKvJZnWEUjsNt3lv9fZFoefhHG2Ys8M+Mp1b9i
         UFy+P6l31TtIyHvKPKFhW4kVFcLdClBCWvBlHDg2RT2EdroUqURekg7MeuPgGBF2DlIo
         +PCwpEw4WbdlWj6BEo0W6FvIKR6hyvC+fDjC1nPUgZIcML1KDbze6XxJseS6DaMk831f
         TnRg==
X-Forwarded-Encrypted: i=1; AL+hErEZbCYo72c3vf9QvGwfkifWxiHrIU/yJ7Aa2UNP4dXEUjY+Tp8jB55y/Autep3d98QfLyRn9x5nZFa+Lw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+TZoSE/NLv385KeJH7vIKXb4BtrhlujAloSzEaOvex2kTTBNF+
	k8dsaqVlybR3ZlbOuS3MtCgYEJLJohDoAM7DTOagM9QTbsDEzQFQ6Yvm6iIOkwgUl6v6Rf9k3QM
	u2LGzfKEXGaP27FkNvsnUd4ZKqz0vvlcuON31oU6tFqKozEhgVP5YU5LCE63QZV461g==
X-Gm-Gg: AZFdTZdCVDTPb4AoCk97SEV3U6R0r3sJfe+amDJneWgJSxDt/Y6mgELsc4SeY8yFNEi
	zXOiOTKpzfaIX+6kYsSsXmtwZRTkyioHfyzANqpsbdgQOhUa7Y/wP2KLk47V32iFEoM1SQd4WSK
	WEBPxTqbYgKEOjLrexF1B9XCueGzSZfLq70d5rqai2WD0A0D5EPBSeDCaXuvEIiLIVYGJcWqBQ+
	EC2lekQ6ZiAR5ZlpHrXhMB504c3kAwZT4RezblGKGlqfolpy8FEsTzPft2Olhz4B6r8a6YQ1T02
	JmGg2VcXYdP7C+BjuZeXodyABMgU5RWMpq01HuUO4ISUvCW64reu3o22CB1HzknAFGD/MGchcn/
	3wtzYM4QSaS5pl/gmavPy/DUfFvaIIeURMaHkb9db4XxWR+EcvYOwYMazHQdojQ1v
X-Received: by 2002:a05:620a:45a3:b0:949:6e15:e1d3 with SMTP id af79cd13be357-949ba8246f8mr4306428685a.3.1795794938696;
        Fri, 27 Nov 2026 07:55:38 -0800 (PST)
X-Received: by 2002:a05:620a:45a3:b0:949:6e15:e1d3 with SMTP id af79cd13be357-949ba8246f8mr4306421085a.3.1795794938133;
        Fri, 27 Nov 2026 07:55:38 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf6804sm47272636f8f.10.2026.11.27.07.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:55:37 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konrad.dybcio@oss.qualcomm.com, abel.vesa@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 3/7] arm64: dts: qcom: mahua-t14s: enable WCD9378 headset codec
Date: Fri, 27 Nov 2026 15:55:16 +0000
Message-ID: <20261127155520.358909-4-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA2MyBTYWx0ZWRfX8zwqRFyTlyzk
 KtqSX5dEklR+o+6Q7EMLHDAMiKBzeEx7DWu5uPSqMEole69GIC5G8PTilRi9+h4h+EoRVsrKo2q
 8LIRXnUP9n0NQ8n2S/WLhHnzemeByx4=
X-Proofpoint-ORIG-GUID: mKpEqI5iF9z6GA9fbHn8l-Z3TPB4vSKC
X-Proofpoint-GUID: mKpEqI5iF9z6GA9fbHn8l-Z3TPB4vSKC
X-Authority-Analysis: v=2.4 cv=BbBNQbt2 c=1 sm=1 tr=0 ts=6b09a7fb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=M8yDIIM4nUrurVDekmcA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA2MyBTYWx0ZWRfXxUz9EZUJoucw
 IgQ0BTVosQtvMn4rOOvWbSEHyLGIh3KBcWTsO6D2EhAZtNhtbFY4G9K916h9rBvQ1bH0ydTEO9v
 KDyyS3QEh9uCiTyLGpt1xR5pX0DH8r4E/ovB+S1sb4pukakU04ltmZ2Va8yRez/ubL5pzar63XJ
 Cn8uKiNlG3z7UDMBWnacG4bzGezTSWqrQ9ZSsShIqLYvBvnuekcgLb07LsVMZltECbrs8TzI2cS
 sbFkGvOaP4hKuygvtAVaUYnbNQcjw/3pyIXZlFGl5AYLyUtgAt7l5b98Wjwck39drNT9gXFfV2e
 Kd131251d6eTw3piLb0DBcNCwjX4SkqITEOi5izuGi7RR7ixEAPx5v8ed6GP+haKxffHGf/sllC
 3UsXqr49ON1GcHZbf00TOnrXvek1OPo6FlbhXQqjPJwx5dByWSDMjATeXsF5Tt/c9GGkbQyjh8n
 qf2XXA7CBuwEgdM8gMw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270063

Enable the WCD9378 SDCA-compliant headset codec on SoundWire,
matching the Glymur CRD wiring.  swr2 is the SDCA primary and swr1
is a DATA-only multi-master dependent (lanes 2/3); the WCD Playback
and WCD Capture DAI links run through the LPASS RX/TX macros.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   | 84 ++++++++++++++++++-
 1 file changed, 83 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
index bad49ba5443f..34ec5a52aa02 100644
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
 
@@ -760,6 +795,45 @@ right_spkr: speaker@0,1 {
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
 	gpio-reserved-ranges = <4 4>,   /* EC TZ Secure I3C */
 			       <10 2>,  /* OOB UART */
@@ -881,6 +955,14 @@ tpad_default: tpad-default-state {
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

