Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795694273;
	b=v+lOPHkaLwK/zAy5XMQpve3XyFlk9aIeWg1iHlMusiiZJY4tmoLu9HuM87AuAA0rA4ew
	 X+TX5YuviGXWHwsbWmN8KveUC4fXWRHm0pgZfLeh1UAooKUiv0uEAlS041w9g0cOQ1USK
	 0uoFFzDfgpHROj5qMOMYuoYi3Mz6BfxNHyHii8iuMwf4+US8XN+xp3c6qrVlW65R7bJGD
	 I7V/YQluunIZZD8OjsQIwCyXz1GZMIDq5Sdk36Ek0c0ts3nd0Hr7eB10no4JrwGtsmOd4
	 kVSqpaj+zGL+3V9FtkTKRWxeMNxw87+cnOgN0cRVfMKEpeh4B5jwXuvZVbFBs6qj9hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795694273;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=O4UlguUYdmoiiwueiPudRL71BwenmWhQeCRuMEXVRYM=;
	b=lRnQHqLKWx81b+t9r8SbVJ+rOTnUkOWLOv6P/TUg7BdN9r135+F8hlyACqHibwPD2moF
	 A5DluWT25V/XWp8d1kNbXFQFtD3OW7scfGgz0AHIqrH+a9l4vpM6hWhunDLUN6Uo0NdLV
	 nomkrTUie1dEe4+dyTxNZ/2UMiW4XNA/50aYyjy7ouDceVVpRtRT2/tOwtmqvInlbYgeh
	 Qd5tWb6Ug+OEV3qEvjlj8Lu+3XTCPFeu6Xbs2IpYXeFumBk6mDmhYSp/OJMvEGsZy7iKN
	 IzKfSZLOGUBprXObMoEr5sb3SvfXaDnLN1V2aUyjShhcCpjUGvoaTILenTQ9OLvBmGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F8sOxO0A;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IemUFAfC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BAA606A680
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 11:57:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79BAA606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F8sOxO0A;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IemUFAfC
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVn0f633205
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 11:57:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=O4UlguUYdmoiiwueiPudRL71BwenmWhQeCR
	uMEXVRYM=; b=F8sOxO0AnlWIWVoyxuxc1a0y6ka3xj8a2lFBTi8Y8XAWfGkqEaL
	7xyddG8pM5+v2BrzXrH4DOp5+DfF0og7QkwFth1gW9pWphGNG6stvcIp8IM6QhTy
	XIbNmKewXtPELG8nLqtZaz1p/AC3xiAq6w93TT1jRnLrju5sAa8PadpSnFR6V2DO
	2LqGOZIcJ1sIP2+7XJOBiiHulJ5oGs7NJYr21+aL8F7IacqY3HLh0araOHCvkP07
	qySkF3Ci1EpiggKLnHb4dWwitY7ESXj6AjEdhzX/L3tmpHNisb+i6yiYzRb0SaTG
	b1zWnu2iWweLB/FP5Fik1rsn5NdUS1IawzQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6gne0wxy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 11:57:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f5844cb60so1168027385a.0
        for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 03:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795694271; x=1796299071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O4UlguUYdmoiiwueiPudRL71BwenmWhQeCRuMEXVRYM=;
        b=IemUFAfCrNX9Nbrc/WD0J6k9sDWyxbPyy2nDZxYIjmxT5BQJAF0QZgTLtuQzW2iGVD
         SZBU/yP+sANMO1CKV8lLv+r/pgJ1Tt3N3WLMg1h3FAHQz606AKYNYUf9mbXxr+DHogKt
         BDfUiPQnI64PyKD1RDZXhznRJqgKNqgrv41TFaBSRQHpnJYoJqW5z3eFMPmxzAkuCyY/
         98KZW8Y1fPb51vaREyas8wphQOArhOb7D/Lb17Y6vCve/QXcmTdyc2hllFezNrGUETpB
         VOj3lked/50zsrc657GQW4NALNAGk/ZNmqh/xPGnJ5Euh/+F3mVCReJuvZ5IGVZdSFCG
         0VZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795694271; x=1796299071;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O4UlguUYdmoiiwueiPudRL71BwenmWhQeCRuMEXVRYM=;
        b=QcAJDxmiJeCFesZ0SbAC+3tdnw7A60BQ4a9rm6M1aMQTihJlc1faYSoCsj3B6KggbX
         cWXMy7nqRaVHuprJKMW1XFZhOSsB868po8M/zfGd3l8+y7Cf4+lfcFmQkgP3BFggyKAS
         pJ0n0KfkswRAOR7XqSeZkLconbmWsWEHPSaN6vJXrgI/qe9/3rSQomRlscsb97iviYTq
         by6beYQvEcHjMJKEDAriVblEUemnUr7ujXcsMGlPLrKFrQYj9o/yFbEM380SY50UkK9a
         p3JY9Iz5e6EQ4Sgr0GpoystMyD3shdqO3maiaEbxcsHpxtusbzY5tWnGrukJYh73pTOY
         mO7g==
X-Forwarded-Encrypted: i=1; AL+hErEy3r7AzHWq8I7VyWjB+H68BKIsCqJgjGCf4SMsh0c/X/p3QHE/p4Ko3QnSiF9WBkUpPAsRdnOXeDVrgg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+TQMSX+8eiWbbdVI2yd82M132cRcX8LdL6gvkdBAZutArKHeNY
	3KFPD1TIYx3ADN2JxgcOF/oUs8lyZgRq8olc9giVsOc6chy+3XxB5F9QT2cbMim3Ye7Wql+d2hn
	hK0OC26f43WKPtpB9aca7iPZrVGOlKZWjIN/HhdhK26xOVuttfjZ3m0ZJE7fFiQLo+Q==
X-Gm-Gg: AZFdTZeHWkPKhTWOx0xrh174CNmQssG2jqPk7smVdcot8GKCb/JGqlGqjFGqt2Er0Ed
	P5ofcHsFvJ2tiPi6TDAGUZXM89rDQMQpWZI8MvyK2coGNnXfYbwzNyxR1CrFNr0AaENsKlAxTQJ
	t+U1XcWnfomS3CA1jeLXxhOF9ZXx4IqY3j1u3tov6UUhkODa9G/v48LLnQAfwP/Q4BDjDn50HxF
	hlvIc7qAAlQbRdNBFk/B+udh16RyU4SUBXVvvkSOSYVstF3mS5jap/Abw0kwNBV88tAXrkY8jvN
	/MZFo1SquCMhlssbcLea+sV86yE4sMlXFryVbhyl+oLDw1Xk/FPBYM1k/oIrHQh3lpkKSrWqJPG
	UoPbyq5GRjiDB4aITP0JrvxY3fjIcoMxBtOshh9S+zygU8JFj03mASsB8a29Wp8wH
X-Received: by 2002:a05:620a:4409:b0:949:5f22:e849 with SMTP id af79cd13be357-949b37208dbmr3685688485a.35.1795694270730;
        Thu, 26 Nov 2026 03:57:50 -0800 (PST)
X-Received: by 2002:a05:620a:4409:b0:949:5f22:e849 with SMTP id af79cd13be357-949b37208dbmr3685686485a.35.1795694270343;
        Thu, 26 Nov 2026 03:57:50 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf6804sm39533135f8f.10.2026.11.26.03.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 03:57:49 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Michael McAllister <me@michaelmcallister.org>,
        Riccardo Mereu <r.mereu@arduino.cc>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ASoC: qcom: q6dsp: add S24_LE and S32_LE to MI2S playback DAIs
Date: Thu, 26 Nov 2026 11:57:38 +0000
Message-ID: <20261126115738.1765949-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
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
X-Authority-Analysis: v=2.4 cv=XpVvqlF9 c=1 sm=1 tr=0 ts=6b081ebf cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=mYXs2Ah8ihme7N4CQtEA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0NiBTYWx0ZWRfXw8iFGQrzmEpM
 TduaTUnGEv4mqu/FccgHdesSueKgUNPpKpIDMLLYpQkplbXXmV5jLqbQFKJmu/586Dfjj6RTNOc
 3SKPdGa4TyKsYhj+vUE+Ob8lLZR2fRkX2pyT3p5ry0rHcNddl4mHeSeSMqVTtEDpqcQVqtHp1Dj
 /DTK6gjbPr/88ZnTPcQ4P2zIGNBIWx7WUiAk5j4Kh7y1CGgeGLlZCY1MVfL2zw4dfVjCRo54B1c
 fhQv2V5OQaNah+CV0Cpqr2IS4mw/rUJh4hZzTNebO+TrSnQJtWQXwX2JgefN1178C4jF9w2vO2p
 2kG78MIpEzPdOsNf7jWLSbQh/D9pyoJJZ2CbSdMuaRxKarWE8G8y8ehj6bNy9E2/Gz7QzA/vzA4
 8KTXpsNuMN3eppbLRYnmu5CIjRIRcm/aRAuPDMTmLMJbPwxwkLUwcj5yP9MotvQ18VD+0NPRw59
 P7fSyP19G4BUjSUPCTA==
X-Proofpoint-GUID: 6cblono3ueCEKhB1Y918Fmciry0OcFEA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0NiBTYWx0ZWRfXzRlENpVl04eN
 BlEJ7TaEMI/2m3IB8kxAPwmjs/NxWfKR7UCS2da0EHq9CymsrcM/u2i4uL9BwgfW2RElZHWWpv2
 C+XVZRUkYJIY7kbYlUYQq9V0Di0YJmM=
X-Proofpoint-ORIG-GUID: 6cblono3ueCEKhB1Y918Fmciry0OcFEA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260046

The DSP supports 24 and 32-bit samples on the MI2S ports. However, the
Primary through Quinary MI2S playback DAIs only list S16_LE, except
Primary, which also lists S24_LE. This stops the machine driver from
running these backends with 32-bit slots, which some I2S sinks need,
like the ANX7625 DP bridge.

Add S24_LE and S32_LE to these DAIs. That matches the Senary and LPI
MI2S DAIs. Also have q6routing pass 32 bits per sample to the ADM for
S32_LE. Without that, the session would keep the default 16 bits.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
[riccardo: rebase onto the reworked lpass-ports, fix indentation,
 add commit description]
Signed-off-by: Riccardo Mereu <r.mereu@arduino.cc>
---
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c | 19 ++++++++++++++-----
 sound/soc/qcom/qdsp6/q6routing.c         |  3 +++
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
index f422346a50c6..49902abf8d2d 100644
--- a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
+++ b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
@@ -389,7 +389,8 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
 			.rates = SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_8000 |
 				 SNDRV_PCM_RATE_16000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE |
-				   SNDRV_PCM_FMTBIT_S24_LE,
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S32_LE,
 			.channels_min = 1,
 			.channels_max = 8,
 			.rate_min =     8000,
@@ -416,7 +417,9 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
 			.stream_name = "Secondary MI2S Playback",
 			.rates = SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_8000 |
 				 SNDRV_PCM_RATE_16000,
-			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S32_LE,
 			.channels_min = 1,
 			.channels_max = 8,
 			.rate_min =     8000,
@@ -443,7 +446,9 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
 			.stream_name = "Tertiary MI2S Playback",
 			.rates = SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_8000 |
 				 SNDRV_PCM_RATE_16000,
-			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S32_LE,
 			.channels_min = 1,
 			.channels_max = 8,
 			.rate_min =     8000,
@@ -470,7 +475,9 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
 			.stream_name = "Quaternary MI2S Playback",
 			.rates = SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_8000 |
 				 SNDRV_PCM_RATE_16000,
-			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S32_LE,
 			.channels_min = 1,
 			.channels_max = 8,
 			.rate_min =     8000,
@@ -498,7 +505,9 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
 			.rates = SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_8000 |
 			SNDRV_PCM_RATE_16000 | SNDRV_PCM_RATE_96000 |
 			SNDRV_PCM_RATE_192000,
-			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S32_LE,
 			.channels_min = 1,
 			.channels_max = 8,
 			.rate_min =     8000,
diff --git a/sound/soc/qcom/qdsp6/q6routing.c b/sound/soc/qcom/qdsp6/q6routing.c
index 0a55d1f384d4..5e532b8336df 100644
--- a/sound/soc/qcom/qdsp6/q6routing.c
+++ b/sound/soc/qcom/qdsp6/q6routing.c
@@ -1170,6 +1170,9 @@ static int routing_hw_params(struct snd_soc_component *component,
 	case SNDRV_PCM_FORMAT_S24_LE:
 			session->bits_per_sample = 24;
 		break;
+	case SNDRV_PCM_FORMAT_S32_LE:
+		session->bits_per_sample = 32;
+		break;
 	default:
 		break;
 	}
-- 
2.53.0

