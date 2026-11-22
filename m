Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364127;
	b=jXmK++8A9JTDSJd2ln6SQf5uhJzpoPZklxk9PVl4cs4tHRSqH33KXCe0eQznWBiJ/1gk
	 1UTt5uxuG4T48Zo3IbqCeaspNxKu3nfLUxnV7idazWdwbs94Qr0ogFatE+nAuL/t05Evg
	 OZldO9bmgWls6iGVW+AVAAUfYRvLG9PisXSEw8feeINj2nF9PC/FhTTj2+yu8mSM/IJZD
	 TdZTl3tFF3TI+82EslgVIKGW6pEOtx2tBf/aFog2hXYb3llLBODEkKb6987PHBRIym+3k
	 NpAqvO4QTG5HKT4ZDnnK7I+6/XYvz3xdHw69BXt1+y8kddHcdNBhEpON/ML84zo5b5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364127;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZXdUoqdbSRJd1s6e9oV0QbQ913cHDkV0icZzT/bR1R0=;
	b=AUkWSeACt1dSTxbH+lDbgPPqnRFXNjy2eesYLE6vQ078M9OmfrbgGnpowNKBaGhYEoz8
	 FGaUNqpYZq3K6qZwR5uZEjZzDFJbkBYZLisHHUXJOvDZG7R5nzDVFWrd0xbBMS7dVQqCw
	 /iBVtgI3p9IgopN/6RmRZIfpEybDE9Cs+rLbtVEHKOxS9E+mEaLJK2Ja0gAxJGVrsMBXQ
	 9QDHAkCxTZA9A6fSA3gW1evb6kP4pLmTuTQ6bUSl/1xjWdJ5AB956/K4+f6XguRUxZltF
	 A+AM/FD9FxSdYWjgnPnjcQxMjucXdFl6UHq5pj4GWbSZ9V36kL8rHmqHtQqVrEPQm6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F7ZLBf13;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xn+R2jNS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2DE606DA33
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 16:15:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E2DE606DA33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F7ZLBf13;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xn+R2jNS
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFQIdk3495085
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 16:15:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZXdUoqdbSRJ
	d1s6e9oV0QbQ913cHDkV0icZzT/bR1R0=; b=F7ZLBf13BN2DpneKCSqjS/7EyJD
	A94WvUlT1emakZgFcG5URf5GhdyVec/7ZjBK/JrcWLPpfPH4Tx6g9cAsrbdbCu8m
	Ofjx88MNGFZCtZ4n12ulVJI+y4CJ+x0EmYTHrG8ejAQznNAuLZku7vknakQ07ADF
	naUV98Q0axFU/Nssjc8sBCflRrTNCs0kU6h8KUPa8p6R3GipmnEWZzKeYu+laIgI
	baKvoQHuG/mS4YzZbuembAjfi9IIbh+AVQTqGHrfaQsFY1ZFjGxvcWEz2zL9yiYN
	pSFiN8hB3y7Ky16HuJIWe64Vb52YsqXhi5YQZnMNvxRp6UXhahbkeQvHqNg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32mgbtyb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 16:15:25 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9211604468aso39981176d6.3
        for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 08:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364125; x=1795968925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZXdUoqdbSRJd1s6e9oV0QbQ913cHDkV0icZzT/bR1R0=;
        b=Xn+R2jNSxXixcqiAP2Ug8TqFY9Fog3Ba9w/J2Z4coeYFNmNen5hxB6tT//0aPiilTc
         +czWrd+WeHajdb1HkC5wfxVO7uANlPPOat7QKO0uM+aSdF1fnGQbKeUAzh+wiN6OtGtn
         l8wEbWtzUqfvUWlOGOdsSH88hg3Itay3UqcNX/TqpXLvFvXJMGcxcAegq67LdQ2iW+PP
         JyhONMWbIIpXSzG7cmR2iCbxoqhVG6NaV3udXNtNox+Af947WKCYBPD6aSWMiHV4lSGj
         Y0uPkLTO4UyH5Q0umH4AxeDUZi6BVBRiDvLk1x11TdQ5PmpMP5ZUPivR7YC0z3TI0ywJ
         45Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364125; x=1795968925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZXdUoqdbSRJd1s6e9oV0QbQ913cHDkV0icZzT/bR1R0=;
        b=BoNvwz9lJc14Me0HhmY5SrZ+WYArCZKeHq+NXKY6bJUQ4VHvs6yD7KoMil9Rx0gC1o
         ct81Ib8vss3zYMSZLJeJ42SgSIqAxA/PZgYrNS4qY5MeEElKTvMlCUrGgs9UCOAi8rn7
         qBqgnaf2IvlTmrdkaoAP3lFkc2NvCPq7zW+fLC7bPvlSZcLeMgAq4ROnIm7PX90k48G9
         H6FvU3w3YST4URuJ1920iKpXl9tHzk/WBt84UM+yqY36P6VDuv9dPhXDrl6iSjUMdPfU
         dSVhIAyughtgSbwrJT2HhekJZrQegXR9je2fRGaw9GTeVMqRW5K2079W7N6cszzg/Sjx
         EpQQ==
X-Forwarded-Encrypted: i=1; AL+hErHXBy5tCWfGJ347QGaGIIGqsxbw8bdLZVlrlr3A7Byo4KAvmzgcHT0q8iFqRNVE94pN7hHekV4GdolgzA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+ilvVTv+W43cCNv1pWd6BXo/5xg0qQjFLoYr0aMfjXOqn79AJr
	5VpUyvYnPLdj6yK+VbiTtJHNYhp8Z9eveGKsDMZlsCCh6PmkG2c1grFT8i7+ePJh9lA78efFHOc
	Xt8OPm19bleOEb8qv/xYNYio+uzR2+SpDcydlC7sxRfp9p9vmps6fOwBCYgiPlE1kOA==
X-Gm-Gg: AZFdTZfsehbtGDUZrPLVwd7D2aC3HmygcuuukS3uroYetKbJdv3LiLZGSFKt+mHqx6K
	ZwNtYkTSmEvQ3vvoJI0cU7GZncmQO65r+eu6wv9c86Xhoj/LKkHBZmB1Q2FRDMaCNIoBujjEnU7
	rzi/dqh4MtbedLtxv8BZlp62AgXYRFB8GRVNH1vNY9LkjBGPDzobnv/ILDL8qvIx+UnN2OkC+PI
	PwWrWCTHldexoB/dc08kvnfvWnHo4qkFzhgsLLtTLgK4/DFgIbw58X7oTWa7XG1R4dD1QCtkl62
	4qMx57heaV7w/do59CJ4zw7QkA80vJqcRe95YH2B/4Y+XDDzJihNx6j4ezcfuWDLg5m+nSNseAF
	v/DeO1ukRE0WmaqMMR/doXUsWvM8nznSzOvUBVLfmHg8pq1sShejCsev8xSUtF/1p
X-Received: by 2002:a05:620a:6491:b0:93f:565f:e46 with SMTP id af79cd13be357-949bab32659mr1278943485a.52.1795364124769;
        Sun, 22 Nov 2026 08:15:24 -0800 (PST)
X-Received: by 2002:a05:620a:6491:b0:93f:565f:e46 with SMTP id af79cd13be357-949bab32659mr1278937585a.52.1795364124226;
        Sun, 22 Nov 2026 08:15:24 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:15:23 -0800 (PST)
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
Subject: [PATCH v2 23/24] arm64: dts: qcom: mahua-t14s: add WSA speaker protection VI feedback
Date: Sun, 22 Nov 2026 16:14:36 +0000
Message-ID: <20261122161437.5994-24-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX+i7Kdad/eTqE
 kn+ofWFLAwO/l+z5DiYq4rq/hjgxJyWb6jNQBKBi7wAH6C8CnJxR+HQmm606DDe2ugOb0r0yoFh
 GHJne9bst7ov3tOWZgvDWV4ZzhWrpQRbIOclCCn+2HlATSk270GjJXI7uJLmJ8gpbCVsYWjjhCo
 JtuCo35c0e1jnAjItgGxm1Ya4OR5V4pwBw3/CsZx0ImRFm4SNdDUIGu9AGFE/fB2FZIEoPmg+Y3
 IcHYCIStSp4n+Bhc/+MsWqjjgsLzF6LbMHTvtBS0+IXnqkvQkSMz7VKiFHlawrN1cnCkyBV88J9
 +3Q3FTS1UoUvcNSqfRkfYcuyhMaiMtVsO1QKg/fIE0R1ApMEXRXJrupJWu0xk3AFvGkGTI7vNtv
 Y1WtM+Dh2uTXu1xWt4sdPsgp8rxwAN1VqJHQDcymF4AE68h0EwHz2S06/xlLhiFxkB4aTOz5oEb
 g5UOrsWTn2dwfLlCm3w==
X-Authority-Analysis: v=2.4 cv=OM+yTiaB c=1 sm=1 tr=0 ts=6b03151d cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=PlqI54VOmiubEWYg86QA:9 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX2IDgdy24sh1w
 Tv3SGvX7pjQ0TQ/H1v23SXZJAM6/Fdttu9xHkkS7QbxNQNxzRHF81cpyqEMMmIpLxkRuEJ1tSCs
 qvFnVTtamMKEWM9pjgB7BFlUuhQvgPo=
X-Proofpoint-GUID: R1aNR-8Y-ktaDuxCLxadOas7XamHOMDH
X-Proofpoint-ORIG-GUID: R1aNR-8Y-ktaDuxCLxadOas7XamHOMDH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611220064

Add the V/I sense DAIs of the two WSA8845 speakers, the SoundWire VI
ports and the WSA macro VI capture DAI to the WSA Playback link, for
speaker protection. The speakers now expose two DAIs, so give them a
'#sound-dai-cells' of 1 and address the playback DAI explicitly.

The playback-side WSA SPKR codec DAIs sit next to the speaker-
protection VI capture-side DAIs on the same WSA Playback link. One
MM1 playback open brings up both chains via the machine driver's
multi_direction_codecs flag; the SP<->SP_VI control link in the
topology handles the DSP-side pairing.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts  | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
index cc7ba3c21bdf..407a8490e6ec 100644
--- a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
@@ -273,8 +273,11 @@ cpu {
 			};
 
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
@@ -789,7 +792,7 @@ left_spkr: speaker@0,0 {
 		compatible = "sdw20217020400";
 		reg = <0 0>;
 		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
-		#sound-dai-cells = <0>;
+		#sound-dai-cells = <1>;
 		sound-name-prefix = "SpkrLeft";
 		vdd-1p8-supply = <&vreg_l15b0>;
 		vdd-io-supply = <&vreg_l18b0>;
@@ -801,7 +804,7 @@ right_spkr: speaker@0,1 {
 		compatible = "sdw20217020400";
 		reg = <0 1>;
 		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
-		#sound-dai-cells = <0>;
+		#sound-dai-cells = <1>;
 		sound-name-prefix = "SpkrRight";
 		vdd-1p8-supply = <&vreg_l15b0>;
 		vdd-io-supply = <&vreg_l18b0>;
-- 
2.53.0

