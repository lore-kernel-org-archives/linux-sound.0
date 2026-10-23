Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775618;
	b=rDK+ddGZcM43VzGwwMKoParNYS/RENzl91EChrrblQeMQZGrREKbdbRic2qFSQ5JZRE4
	 c6EWxqUmx/xKp0Nl+iXtTOGvCYR2NLFDrSBU+oRR2vfv3xTEjUnmfaL8WkC0z80f4pw/r
	 SH99Cs3Wt6VMzaq+25NTDFPFd4iZSYsepQKPiDLnmnFIezXQRSbsKAqGnSsM3PNzIGnKU
	 kmkhgWHc6fYDIfrMnQnnvYtCuH/D29ibHMPj9cPN65aufDp1qkpsmYWwH/7WgfYR7SQF3
	 o97/3LwhB78DolsorIepbWkWJIWSWIgZ/W9HpharLDhJcCUcCo5DGGDorCal7OdP3CQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775618;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0RaoJf1quXYWRkDgnF0+UKFcSUDOACQJ5dkLWQMqNDo=;
	b=u9kO0XK7DLsHINLoxG4EGOK3yb4RebnlPSFEUb9exKl6FhRX/HD3gs2zPh6wI5gPkKiB
	 HUsHl05tmCf0zBge/7K2cOMBB1kRC9u0hgm5i+mEizueyZXZd4toZRZ/LFzlbbP1FLrij
	 fgBwSwxnOhDWKf7RqVeZJPKWLHS3UJ8afBbdxoXXRUQHbicPsOZdn9REEBwL7fumPTP6T
	 YMRmcln8pPsoDW6DTWY4oPyOt+iGUTD6UpJxukZ0QPx3IOwWVjygND5yiwLgqKU13VqXo
	 JvP1cSCkf5GG0CEATke2OOfeR3wA+P4YO5Z+mbHIpFPd+WYxtuj+0rrWKmYsqIDHQbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CPeE9K52;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jDNgySCA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B07606A31E
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 17:13:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43B07606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CPeE9K52;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jDNgySCA
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NG3goG2930960
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 17:13:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0RaoJf1quXY
	WRkDgnF0+UKFcSUDOACQJ5dkLWQMqNDo=; b=CPeE9K529Dr5esSobebjLOZOJmn
	lC7XXPUB2BhZt8WFuvJhrtNQLzNm3glP8Lpdvcwasg6vfan8GbezAjEsj4gcbxpr
	qS2QvuPvrJY1zwFrvQeRNDzQLsgHXxycCQAGo0HGYlfp8/XC8AFs2t2Rtd9QQeE+
	wLXlHCmnCVt03gMhBE+qHTLqNuuvQMEuUv2XdNDjTHx+PzQ0UHo2KpxByoncWlL7
	e+iBRwfP37yaZHHym3l2HQSsNA/yBZ/66koZ0D21s20eLt/OduPHLiDP2oldZFN0
	sCTgg9DctvSgeVolatlJU7EsZFJ3BX0tG3Hlads4JlfGadaezQZVJOGHrGw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgas6r8c8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 17:13:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e82060977so226133585a.1
        for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 10:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775614; x=1793380414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0RaoJf1quXYWRkDgnF0+UKFcSUDOACQJ5dkLWQMqNDo=;
        b=jDNgySCAGDqPFOm8WeJw/bnsGCKYAxZM8As1HC3sVfyuFB2FP4TMkp6J2Z3tcZY31d
         OExh9NnHxkZPY7AEOlp+nMbS2vJQqfTvLlzxQ38Mr971jVwTIgtIzFArlZlEK/T3lp/+
         Bu1rQlHHA43W2Iijk684jYri88rTP5HtFsujyL15Yz4M25n1JyUHABCE6p53DgbWmUVV
         29gD6t1tBeg6Xh0QQtzUnPn1Utuu+0onMhnm8SOhNW8s+NUnRWnNivNAXK72MLP8W7aK
         G4AcBqxBGSQfsRlRQZ1fSucoIoRQR7O7OqTiFgTY+mZRBfXxc5+JuR3sgKlVyUk8ugFR
         QERA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775614; x=1793380414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0RaoJf1quXYWRkDgnF0+UKFcSUDOACQJ5dkLWQMqNDo=;
        b=Rp8tPtqm2vB+Jh10yJrI9eKjRjVRbazjoX2FpTGdJaLG/QQ9IZv3KTFuvQH851+rJK
         yDDAvsApGqKcWVCenez99L0iJz9hXJxSNKgm0ZqRKywavK60g6eZZbjY/x5HNRckcV9L
         xlXSlc2YcFps9ves1UCuSttUQAapsnFQEGtBPoaC+sxivI19Ty8uNqSgabgtWLAidzJl
         HTlaTuMz+2WBFwGSZdvH2I3FLRNbVgoFU5II7zXf/woFBdgls0ICmKm6Z/ryWCts9sa1
         KcBj4eB2OodFHik0kt+0l7291OsMv1CmsFGBy6j94aNjvpbBQ0+Cukt6gNQe7gEqI2o8
         +qGA==
X-Forwarded-Encrypted: i=1; AKwUvBxcuODXEzOnQuPJsXuXjDm1YhqrlOxP/TBumzs5I8NufC2+fI5kjgzDlf5B+QOWB/m0PMJPpGjACGdBjA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLZgJlmAVNc9M+I5E+WBH38zT4D1AAlxiOa3t5e24F72pcVPrbj
	TzwgTHO3PQZh4dx44C36iiltrCh3D9123AS9M16TV0Cumqsnf+h9VH4PU4BAez3PLokPdhASU6j
	IV1kqb/IHuiYbNgqw5EH2PxgbcROhuCuHj9YYLmPpPajb0W3kwEXjgy8MTyimGKzpug==
X-Gm-Gg: AYBFou1nlzbKSZvc5W27dH74YBzmc2qFhYwhZCPFgp22lFbE7W4OifmZiyXPRezJNie
	x0HQXdPdLyWLDSDcacyLKyidIcRacIiqNBQhhtCFpEWXZ1CeNiX/pum8D7IBgvssOhpLfzj7C4h
	dMgq33FDxm7iCUKGNTfZqoWYaySWW2H8C2kOFDXU6O8E8FHpehCtM1QDluLo35sSkzFYUGIdpyx
	Q1IJOvwDIBXz6eP3x9rQpwHzkMeKguX21NG6mwDeGYdyABgkvrRPkpNB3XJt/VHfJg+aUdBHY48
	LAuJzGEDlPLnTpvAfnZnPbBEyVytv4xLkKbLb7yCOoOma94mQ+RTg3zhriw5czZ1/O91G8237zv
	XxeHNZ1Wo8UB1
X-Received: by 2002:a05:620a:270d:b0:939:5d22:d1f0 with SMTP id af79cd13be357-93f624b1fa5mr963959185a.2.1792775614090;
        Fri, 23 Oct 2026 10:13:34 -0700 (PDT)
X-Received: by 2002:a05:620a:270d:b0:939:5d22:d1f0 with SMTP id af79cd13be357-93f624b1fa5mr963954685a.2.1792775613589;
        Fri, 23 Oct 2026 10:13:33 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d4104b5sm1043841f8f.36.2026.10.23.10.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:13:32 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        stable@vger.kernel.org
Subject: [PATCH 2/7] ASoC: codecs: wsa884x: Accept temperatures across the full trim range
Date: Fri, 23 Oct 2026 18:13:11 +0100
Message-ID: <20261023171316.819857-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023171316.819857-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171316.819857-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX3vEzYvlTvNpI
 QhqHCjK4nFDIbPCCiPz+N9QDKJGYRsoV1tSJwNuSwXwmF1kt5TFcFNtE5kxxDsn5mdmv3IlmCDj
 mm8rrmnY9ilIlTY8Fnh3gOXRclVyhYjzNlplRHXtINRb+MBJAnxKQlN97ZrnJJJmtCbarngny5d
 BCn9a9xTzc7X4j/8uyc6xusZwT26lGJOSFQMOKROShcdI3WOnV/ZjH9zVPlL+DAUsa23tn3AkBk
 k4mJXX9DpD2qGz0MggT4s4qs7HWp5D62F/R0P6PKKvJYFQeqJPTboBM9YUSjXcy81he6Llutll0
 R3uY+hKKLvyZ55O2KVyJo1+//fp1wImkoZa9OJEFwcTKZTWCtTgJZdZYG6hsDHQt4VgGY1YWjx7
 2LUGZXR6GLAxLirGJcW8aIvWsFwluXjCDCi1LZUezwda0vDQL2znFbY5iKPiNwhyhu8V7uzZhkv
 7gdGjIxmK+zLJVmojDA==
X-Authority-Analysis: v=2.4 cv=DK0acCNb c=1 sm=1 tr=0 ts=6adb95c0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KF22LIoASRNQ4hJq_1YA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 4fL5fB2U6lzL12hBpasL-cOXyTxERzlr
X-Proofpoint-ORIG-GUID: 4fL5fB2U6lzL12hBpasL-cOXyTxERzlr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX9fWw6wjr2TgN
 vIHgCUvCgzi/HmyjydT9u239bgb0nKThXxR3nbdH7+NXG+Uz9jWyxWkPckVhvEwfrjfuhBLP89z
 E7GjtEQollTyzVKfxBbvzwR3hKHPzQY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230067

wsa884x_get_temp() rejects any reading outside 5..45 degC with -EAGAIN.
A speaker that has been playing, or sits in a warm laptop, easily runs
above 45 degC, so its temperature becomes unreadable when it matters.

The check only needs to drop bogus conversions, such as the all-zero
reading before the PA is first enabled. Bound it by the -10..150 degC
two-point trim range instead.

Fixes: 6b99dc62d940 ("ASoC: codecs: wsa884x: Implement temperature reading and hwmon")
Cc: stable@vger.kernel.org
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/wsa884x.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
index a367c94bfb4d..f0857c0588d5 100644
--- a/sound/soc/codecs/wsa884x.c
+++ b/sound/soc/codecs/wsa884x.c
@@ -720,10 +720,11 @@
 
 /*
  * Device will report senseless data in many cases, so discard any measurements
- * outside of valid range.
+ * outside of the two-point trim range. Do not narrow this to ambient: a
+ * speaker that has been playing easily runs well above 45 degC.
  */
-#define WSA884X_LOW_TEMP_THRESHOLD	5
-#define WSA884X_HIGH_TEMP_THRESHOLD	45
+#define WSA884X_LOW_TEMP_THRESHOLD	WSA884X_T1_TEMP
+#define WSA884X_HIGH_TEMP_THRESHOLD	WSA884X_T2_TEMP
 
 struct wsa884x_priv {
 	struct regmap *regmap;
@@ -1929,8 +1930,8 @@ static int wsa884x_get_temp(struct wsa884x_priv *wsa884x, long *temp)
 	dev_dbg(wsa884x->dev, "Measured temp %ld (dmeas=%d, d1=%d, d2=%d)\n",
 		val, dmeas, d1, d2);
 
-	if ((val > WSA884X_LOW_TEMP_THRESHOLD) &&
-	    (val < WSA884X_HIGH_TEMP_THRESHOLD)) {
+	if (val >= WSA884X_LOW_TEMP_THRESHOLD &&
+	    val <= WSA884X_HIGH_TEMP_THRESHOLD) {
 		wsa884x->temperature = val;
 		*temp = val * 1000;
 		ret = 0;
-- 
2.47.3

