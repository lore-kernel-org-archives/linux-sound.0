Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775911;
	b=aI2vmDinPVsnODnOUtazB56k8bTWApQd2xDICHJ0i/rPUYu1g69iZB+1ijdO9ankw1kn
	 +qbhzJo4JHQ3CjLnDoV4a2c2xlwrZBfcq4zx4pmbHf87ULYpyM62JEo3AT1llcxJssqR7
	 lguikj2iLQ6KSzjeSsiK7Pzb/d3I0flMvrNAbNorasPu9k5AG3I9sS5S6FSzFvjgus26N
	 MwmRbohtlKeNrXC2WqmwbwnS8vM9QRa+x7RslPfkCfcxFNa57hlz75phzHJcjjzBPCqjp
	 0F3dmeTnEyoeXn3kTlYkLmg0AUmXUa61qKgK7TjQSoNBcE+2ttr5Hj2kVVBuo4S5o0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775911;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+nuqdJUBgvzq3TkkAc7l1O26WfkuwK6Nh8uA2GYF0o4=;
	b=FMRSSTZaidf4tITWAbapFb7Rw3/JNviQeJQvX8EEfCWGnDv40jPwBVkxxAKKzqsUI+JS
	 rsN6L0KccQSmoWVb6mk1kQAU8ymm5atJbd8em5e1Tf/Y/2JfGTKZepOtepYTZySBo3tsF
	 KFpD0yhFggLIqyJoD48xx4xCCrsKBRs2kUHM2zFYj39igztKi9RfPh+PYBOaO5y9pCAh3
	 zikAAkmC9goj8AFf+grWiFfLrWcdEx7soLLf0KXWt2OEPfU3AtC3aQ6Tssf/xGQEgpwl7
	 xgSqYL4Ay40TAPMmPUidoVZPooGOL9k7+OIFHf3Eq9U0Tc9biqORLcwCbJsa9K2yHtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R45wIbQg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VetaSVmQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E479606E9D6
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 17:18:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E479606E9D6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R45wIbQg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VetaSVmQ
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NG3jQo2931019
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 17:18:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+nuqdJUBgvz
	q3TkkAc7l1O26WfkuwK6Nh8uA2GYF0o4=; b=R45wIbQgErXsxYdYO1+Z/I7bC1J
	5d4RNR2zv4FYzqgC34lY9duBrZ/xFRw8HUGTsrjbL5lPqa3AB8s8gdHkRoKMwefs
	IvsHWvvVSSfkR05tt0Vd3XV/fXJ/XB54sPBcqDZ1GJeQOTsJwv+MG8MaV6lx8CJf
	BvdahcESu2MGZjr45UbdqcHn5lqcPrWqpmMprb5DrJLDP/3EAmw9EVpGV+NW7jgl
	Xnrrv1DiYsJSjGzGLWm3fPqGu8ayFg4kTgwQGm3A1lXHSUeBGwpmvWk1UugJYJTe
	mxbVMTGUHEe5NWM8MSGmcuBo1QYoOKHQ/5mBbnebitm5UHvzhGdkJtCJg6Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgas6r8xj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 17:18:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f1e62510cso277445885a.1
        for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 10:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775909; x=1793380709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+nuqdJUBgvzq3TkkAc7l1O26WfkuwK6Nh8uA2GYF0o4=;
        b=VetaSVmQRVXif5aLmH2WoNwan4zvnfkl7uhA6V4q3b4TnTRv+GdyiSFHjbO0JPuWm2
         blsRrI/cIDMRnvCYI+lhQomai303gm2xcy6Ko/W65Qf9Olf2t4C+JZ1eVhqw5G2jLK5w
         +7jHtTaIiJdCT7ouiw3jnb0YRKpnCbRe+OVNka5caqjowL27x183My4/hcGkftI9TS+7
         QnPOGaSsnT9I3VHAtKorHpP6JsnuC28wwW5iYighCr+qoSnxkmfBsg7/TkURBqTBE85/
         EizWQArBtj20DdiIYO4lDDVRBs0dj9cB4XJW5NZQnfvXuFX1ANH54AxSfT0k0kGjdzsE
         /eLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775909; x=1793380709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+nuqdJUBgvzq3TkkAc7l1O26WfkuwK6Nh8uA2GYF0o4=;
        b=GMgguUY/etbnRgjoe5K7bzrQXTWSa6BIVNhxwmjjWhA9pINGlgzDfII/LdTc2K81Zn
         S4cCVUZEbDuCi2gCMpreLTO9qHOEFo4V1pVWRnDVbcGjDywk/JvZCzdBHHTaxOEUXdHN
         lubNKRMN4dobeIWnxSs3yRGCQvRyr4OTQqWgsDRtRsb22fsPypK4njGoYlbCT5qZqBq7
         UegCLwa+bvDAG18ESzVbmr281PUaFhO6Xw25esX/qDjHZJDOUoQN7590yRuRwMVh+xgO
         aiM9mEUsfGDHrGnaV/YV0lL5fr6x0HOeExG+2yuwGqAiLGjnGQ8YvgUgfUWvOhLM3mOs
         iiUg==
X-Forwarded-Encrypted: i=1; AKwUvBzk2Cj2fcIrCLq4grY4/DSvQ1Sh19/q8BklxxpycqeSulIIneX/C9gd6XlMo+9Xqdik5HTmrY2669hkzg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIGawQbew6p6OfYBwsxnhnxeGYLZUPjZ9LLtWsQL1wHJC+5OQBC
	uBd2hIfnnYQuLd+f1m6/tuDYlOoHrWdngXwXkX0IXQsR7cC7LR+IdV8ry/F/MZCzTKegknsdHTc
	Lbh6ShylTlTGerdGlf/9lghwGOSLr1Z86pPz9YxaICdOmanFbeZ961GY00z8WAk+OHw==
X-Gm-Gg: AYBFou36gISiDBm/uS7zWT2mQLClm/CEZzn+wvqG5s4+aqBJYc/XoI/v6qT5X6OfFiS
	JaMUaod76DrDE62dMM9Kf05xApKHteCaDjxGBJq0S5M0gLuxxT7Or1Rs3TH0ynsnXoY0cbn2RqO
	uCrFoJStw7/omQBjbsCctYjH+XK4gbwbkHs1773pLYrEHhurtrzPYEIBUNo0kWInqCVswIfub5H
	BWqddA7jAOCT7xo1SJRz99M8X3xM+CjR0Afd+h5+Sms1DibquI+PWwcfk6G9VPW3H6IAWxmhczc
	vyTGFvhjgPv9+IjJwZyO6BM8gZtI1/N7CwXoticpe/wIbPIwbNpv6eZYlrpbN/7WbaxjFp60+3z
	HheNd9Sb1vaJT
X-Received: by 2002:a05:620a:1a10:b0:93e:d854:4b83 with SMTP id af79cd13be357-93f6f782fa2mr545741385a.22.1792775908750;
        Fri, 23 Oct 2026 10:18:28 -0700 (PDT)
X-Received: by 2002:a05:620a:1a10:b0:93e:d854:4b83 with SMTP id af79cd13be357-93f6f782fa2mr545734885a.22.1792775908118;
        Fri, 23 Oct 2026 10:18:28 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:18:27 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [RFC PATCH 23/23] arm64: dts: qcom: mahua-t14s: add WSA speaker protection VI feedback
Date: Fri, 23 Oct 2026 18:14:33 +0100
Message-ID: <20261023171433.820092-24-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfXycJ4g2+UyouX
 Gp8UQOzkkIg8PTf3ERHLnLmUI08ALGIYnlAPWW0k4I39X5A8yGNPZOaVzN5nMhTncpZChdrul+X
 H/T4q0mPQb0iv0QOrPgK0rxNMOtZuaPYNnw228EY3o+crw423+9Xgm4JgfUZ2hiidlhISaz/dJ+
 jQ+73Rz45Mpg81iCwpgue0g30J9BXYz/UPOl/QMmJvIvAbNmfqZbN+T0Ln6fN0sm9fmBHkr6fL4
 V1bRTJqK7NRiw5IaTTrJdzsYPY3+W5TZqw4feAwLJ4vrJ7QLwTUCaAnAcvKGrJoRBSMlaYgXPWo
 2TsjHd8JWxDCy/bCQIQAg8/H/19+wNMBDYdbaCCD6saMkz7BGc3iN/4KgWeHxMEsUApUEnJNVJw
 8Zso2xUX39IIh/z3OILEZh4atKSRom/kjUSyqsNzJNw++yKsIFm7yTT6yvF6PLlpmgfhSoXLXEW
 wxCqLaFJN6eRzytdwsQ==
X-Authority-Analysis: v=2.4 cv=DK0acCNb c=1 sm=1 tr=0 ts=6adb96e5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=07M9w8tHMIt6-5hUJIIA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: wW7Du6r_sFSwCnwcgeETC1Vh5SkjnWC8
X-Proofpoint-ORIG-GUID: wW7Du6r_sFSwCnwcgeETC1Vh5SkjnWC8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX8AidKSaCY0Cn
 LibiOiLjbcmksYbIEpQIQ4cTWubUkk6uyM/o7vmlXrTqmf/0ezEjXr5aE3WQbFyNUoQJPvHorgm
 lY/gUMUJWeIGHcvWeGnyTuZ/1O7rLaQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230067

Add the V/I sense DAIs of the two WSA8845 speakers, the SoundWire VI
ports and the WSA macro VI capture DAI to the WSA Playback link, for
speaker protection. The speakers now expose two DAIs, so give them a
'#sound-dai-cells' of 1 and address the playback DAI explicitly.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
index 26d6d8285e04..d6a921b3c713 100644
--- a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
@@ -268,9 +268,20 @@ cpu {
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
-				sound-dai = <&left_spkr>, <&right_spkr>,
-					    <&swr0 0>, <&lpass_wsamacro 0>;
+				sound-dai = <&left_spkr 0>, <&right_spkr 0>,
+					    <&swr0 0>, <&lpass_wsamacro 0>,
+					    <&left_spkr 1>, <&right_spkr 1>,
+					    <&swr0 12>, <&swr0 13>,
+					    <&lpass_wsamacro 2>;
 			};
 
 			platform {
@@ -928,7 +939,7 @@ left_spkr: speaker@0,0 {
 		compatible = "sdw20217020400";
 		reg = <0 0>;
 		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
-		#sound-dai-cells = <0>;
+		#sound-dai-cells = <1>;
 		sound-name-prefix = "SpkrLeft";
 		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
 		vdd-io-supply = <&vreg_l18b_e0_1p2>;
@@ -940,7 +951,7 @@ right_spkr: speaker@0,1 {
 		compatible = "sdw20217020400";
 		reg = <0 1>;
 		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
-		#sound-dai-cells = <0>;
+		#sound-dai-cells = <1>;
 		sound-name-prefix = "SpkrRight";
 		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
 		vdd-io-supply = <&vreg_l18b_e0_1p2>;
-- 
2.47.3

