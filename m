Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364128;
	b=ytYlxHXhoPchMDINg077XFXU08b5IG1nwImF7eq+lXurCGPCqxs8rccpi0tg3Uvqvqkl
	 sHafKSrNZ/RGhkfYM7a7MmoUvaNcuA9QbXHBT9TeVZOEzQGJsB6cOCrsJA880/VvYpAwk
	 9QA5V9cTWkoyZ/L1MMSwM/ioGAqM/AUqa2PUgdcLevfscGuzZghO+XWUPGO3BJp/E+efJ
	 eQXn+jrcWMFmncWi+OzcjWdBZRvZ44KJtLeb8nKknR9yYWrgTqwTmpf+QJi8KkPGgbApd
	 G1SmdtrbTypMo7U/Mu8rpJRZ54iqZZhkWpJpxkGIzM+nDcOBfbnkSyVD9tDbFr4opxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364128;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=j6uKzRJ8kCYGlP/+QGRq3eRVGcpdCYk0Sxg2glGxdVU=;
	b=1Xg6UVULC1IyaPI5YI5ow5ydFQDanKmhV+kGkpmurSf5VTZRSyy0iSwO8rz+cCdbnJUA
	 Lwq//QJWzcRDbHOX46r4t5iLqf8gAWqxD1kw5a0Pa82e6KOICbgylPDajsNwfOaEinFW6
	 KlO6zcg6Tvv7DU91arTOhbLQUvvuzLdVIeITpYts6AWQeI4jd65CP9dXqpXZSmbcT7/Sh
	 VCJF3yuV2+0y3Wjv0PVTi2DvaVSAvCkZJxRw1a4sJ3oPOwp5fgVeJDm2lTrKrhsP4hwZX
	 EjYW93vXCHv/cIkt6N6IwdQp0CeIyvHcYLh89VjsvtxHBkKa5bioJgbHlV6n9f7CL6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PL0+5ech;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="S1TrmRQ/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E799460A380C
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 16:15:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E799460A380C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PL0+5ech;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S1TrmRQ/
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFQpUu3853423
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 16:15:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=j6uKzRJ8kCY
	GlP/+QGRq3eRVGcpdCYk0Sxg2glGxdVU=; b=PL0+5echE2wMGsS+yaH0I00U4xS
	JYtrWDJWmnzwKiDnzrn1X5YNiNvu7mUSO2w5bD/CSHyN+cxtUVnTzsHdRAhL+1hn
	z0BVMhKZi6Ww3JyknGztcrzJxp2yJLpoBf8u3b4UKBBteK/TjlPEg5Im2h5XoV33
	/V5s1NRrkbb52yIZSLm9QoInh+EJ+6orMBwToHq7wXLptv5dGt9vqe4Fhea8zeul
	ciZwq6J/65Y4fm9cWbBesPR0aFbpX07p6mn5klv4Jnpzg3bu5+3lwPdtIuMOx8kT
	5ozOI5Lf9mDJIXzXhN6RQkR5YEEgh/l85dnpiVpdmdab/drEGnWGDmBFWWQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33cu3r45-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 16:15:26 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91256a7b7b3so40546666d6.2
        for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 08:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364126; x=1795968926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j6uKzRJ8kCYGlP/+QGRq3eRVGcpdCYk0Sxg2glGxdVU=;
        b=S1TrmRQ/9GxMj/PovrcY8LwG9Q5yHW5V83enfCX4DiKUeck9a1alHnziylSCXRpuZV
         lqL7IEWU4UsPHdz+KRnIUkqP4L5NlrXghPBtRspv375Kl0hwkjj4GQ7sUTWJkqqclHoW
         4AGIwHxjoKqW0gqCc7eWaxikPtSL63cTf6huoa4T0TX8N454WhXSeOQ4X009jsnTOttG
         9UdhXB0UkM7Tr5OHgaB0CExPJlJtBJUOJxYbR9Cgm+TxcnY9gzhtCptGEnr0DHRfwL3+
         69rIClkeZI4RwgA7+zXURVw6wXh1wPEp43mYjEo65tO8rFePAVyTaCGsTpcMJK6Uyih9
         HKFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364126; x=1795968926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j6uKzRJ8kCYGlP/+QGRq3eRVGcpdCYk0Sxg2glGxdVU=;
        b=nLA0EkeGq6XBcIrIfJ6qivYUkqneId4XDKjEEzBfvIZQNP6D9YOSe27i7OfSXZWaUD
         0+fWAXmZPe908aAZXigmtMuZgLHkONy8Oem2yT7mIRe1lld5W7B7+TNcDKaFKc7w+oDo
         86KYEZ4KXTSRdr0ttYXJr1YWI+W/cchx/P0Smfg8jSnobivlcJmPCfJ1s9KX+bTTIUvN
         huvi1W28r8DffM4XEzBCXmQtG88q5wcByP/i3kNOpO3IsiDfEohUBYY48CHKGFaUNvlr
         yJd1WBfuU35cnDIo+eB8OPQI6kxsLTafL7ID8OcMjHp/9zEddrZKdj4P8YZUie6f1xU0
         6izw==
X-Forwarded-Encrypted: i=1; AL+hErFVc/v2wq9PZ/00fF5jA6OjanoGlwaIiRijKsLcp7Nz0XSF8Wpv+0fkRVge5HclixzjWzJ3DUe+C5eicQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8nk4/HcxFVtVyPOffnVNrdppD29hkYTut7bLm5EKi174JEhZvB
	reJPKX6qt62XD4Rq5lUWN0DXbfkF5mx+ry3I0ZSPE3krCqLYBkC3gRRb2my4saHKuyZYCfP2rwf
	jQV0tlpNyb3K3Xg5zbrwluO2SePK1GDSTFUZZ0mYg9kM+O0mSi9aIbLh9QkMU9DzsKw==
X-Gm-Gg: AZFdTZdaatntTJ/i0pp4+dYlNKewDRRyh+/zamTPVPxDDKO/zum1X2PCOkFg1RdfuEp
	X2ECTAtnbpiEWFFszQ6MOig274NfK0z/5kx3qBEj0H4ffJ6xhgZWPfkUA+vMtvtX0pgIPfvLu6I
	38j2jGe9/8/vj7uHO68/PIx7QERTP4uimMrjKTLkcPhB2MM0h+8W9Swa4LVxLKaDxMN7CbflW3G
	XCbJymC4BbosEbJy+9kHigOnJjldaQ3+hLLrhk9abY4WUWivtLmXIvfFoRDNe6zCtZsBZkb6CGH
	8k5QPggY5NdbHQJGGUT0VoH86n3i+fOmGEhWFl6vZYe5NU2rnvrDD2cPnc0Tc4z9OXL9g6Vv6hg
	memwNxLJyEcS/lOyvLgDOqWoaCJpxnUTLbFf6aMpz4hW8qPFCZaC0EhAtuV06g1k9
X-Received: by 2002:a05:620a:130f:b0:93f:365b:42bc with SMTP id af79cd13be357-949ba9dade9mr1496074285a.52.1795364126169;
        Sun, 22 Nov 2026 08:15:26 -0800 (PST)
X-Received: by 2002:a05:620a:130f:b0:93f:365b:42bc with SMTP id af79cd13be357-949ba9dade9mr1496068785a.52.1795364125757;
        Sun, 22 Nov 2026 08:15:25 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:15:25 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 24/24] arm64: dts: qcom: x1e78100-t14s: add WSA speaker protection VI feedback
Date: Sun, 22 Nov 2026 16:14:37 +0000
Message-ID: <20261122161437.5994-25-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: TZSAF4Yxa9s99dza5ed0mzhsV1sh04k8
X-Proofpoint-ORIG-GUID: TZSAF4Yxa9s99dza5ed0mzhsV1sh04k8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX6gC0m5mJhpkF
 lAIhMZbvvXzL/ou6J/WBPOQ5gdIML5M9OOxPjsdPGMacMX1Z8E9oNlbbuxSx817NYnPwKpuX7oK
 Py3LUdb+kcaDUp4RCeJI5Rky3+kEt5oV4xODl1djnRHdPPyKZEV4t/4fbmxWio+xQYmo7gGeh2j
 RArZfw4tBvYMJBKC5u7iBB16berfftfgBE3+4JCYfp5FfPnjt4BlRGoKkKtoaakDFP/op/agRuu
 oX3uwCF7zNUexw0ZsPKOkoAQWTN3q81lQkAnPnULX+3ZiI9TfDbWChg2hAj2d6R/WvgAP6UtftQ
 8k5RdoYv0m1o0vPr1agJsosMlpJCGezeFGNyTRDTN1vIGjBfAQiWaIhEk+uT9Pe84xE1GbNgb5G
 yDsZzOCzk0nREhPlBVsIY4nzDCjoOFbbKdxZ91ZSPX2PuYPPif4z+iOSS6O+/wq6X5lVS3ojoR6
 ttlC33ugQti9FGKLBpA==
X-Authority-Analysis: v=2.4 cv=MM71C8Zl c=1 sm=1 tr=0 ts=6b03151e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=07M9w8tHMIt6-5hUJIIA:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX5C39+Bfc4cUi
 5/VFRW7YBm3ZLPdOlWFK8IDQ4XFaHkf5F6cGqgc0L819xk1EwB+jJxI7m/vsPM/kBMZ5/wraloV
 0w/M7d0+ueBcQQhKyVHt2daSQtlfaZ8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0 spamscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220064

Add the V/I sense DAIs of the two WSA8845 speakers, the SoundWire VI
ports and the WSA macro VI capture DAI to the WSA Playback link, for
speaker protection. The speakers now expose two DAIs, so give them a
'#sound-dai-cells' of 1 and address the playback DAI explicitly.

The VI sense master ports (10 and 11) are picked up from the VISENSE
slot of the per-speaker qcom,port-mapping, which differs from the
mahua-t14s Gen 7 layout (12/13).

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 1536ad8d4793..2c7166e15097 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -477,8 +477,20 @@ cpu {
 				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
 			};
 
+			/*
+			 * WSA SPKR playback-side codec DAIs plus the WSA
+			 * speaker-protection VI capture-side DAIs. One MM1
+			 * playback open brings up both chains via the
+			 * machine driver's multi_direction_codecs flag;
+			 * the SP<->SP_VI control link in the tplg handles
+			 * the DSP-side pairing.
+			 */
 			codec {
-				sound-dai = <&left_spkr>, <&right_spkr>, <&swr0 0>, <&lpass_wsamacro 0>;
+				sound-dai = <&left_spkr 0>, <&right_spkr 0>,
+					    <&swr0 0>, <&lpass_wsamacro 0>,
+					    <&left_spkr 1>, <&right_spkr 1>,
+					    <&swr0 10>, <&swr0 11>,
+					    <&lpass_wsamacro 2>;
 			};
 
 			platform {
@@ -1452,7 +1464,7 @@ left_spkr: speaker@0,0 {
 		compatible = "sdw20217020400";
 		reg = <0 0>;
 		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
-		#sound-dai-cells = <0>;
+		#sound-dai-cells = <1>;
 		sound-name-prefix = "SpkrLeft";
 		vdd-1p8-supply = <&vreg_l15b_1p8>;
 		vdd-io-supply = <&vreg_l12b_1p2>;
@@ -1464,7 +1476,7 @@ right_spkr: speaker@0,1 {
 		compatible = "sdw20217020400";
 		reg = <0 1>;
 		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
-		#sound-dai-cells = <0>;
+		#sound-dai-cells = <1>;
 		sound-name-prefix = "SpkrRight";
 		vdd-1p8-supply = <&vreg_l15b_1p8>;
 		vdd-io-supply = <&vreg_l12b_1p2>;
-- 
2.53.0

