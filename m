Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A773E5A17
	for <linux-sound@vger.kernel.org>; Mon, 18 May 2026 09:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779096237; cv=none; b=q2lEasfKHuudIEqbTrtdVkjabsAw3kGJb2fOY3JUwl3XfpNZ3HBGGvw552iA0YAO15OUyST277XIzvr1gBB0AH58wh37ftVW1Dcdsx0gsYkydAnh0bd3fCxDHQxjZgzu920t6pVw+cHEDGzcDn3w/1mIf/UQQyMnetF4sbqHcpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779096237; c=relaxed/simple;
	bh=OartzHtMjkwbtY495zYmORd7DntitjwDcZpmsbrjb5E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tlUmHfi/sYdG867Uny9swZUJxvdqdk/18qkZFuGacsBBJvxeetFzq69YOROHSisUSwc46vqjJaxzpVbUfrii74HyW4n0COvG4TeYz2vmuE4vIhje+JRibxu2IPx/uH5l0fyqS0j5Gj5M5YXPhwgttsMgyTlb0JR+oMAxNG58h3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F7y/Hyto; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JMF5LlhD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F7y/Hyto";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JMF5LlhD"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I7KtZc230808
	for <linux-sound@vger.kernel.org>; Mon, 18 May 2026 09:23:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DEneedWpQwB
	+o3i2G+K+xijFiG8S93MO38MV8xEuYUA=; b=F7y/HytoopXeqf5NpwhfH8SiEDQ
	uhfuFuR5R8nHi8N3My7WO9PtB3ZLG14U0/ev2OspTDneEm+CqjbmrcuJKmKcVAJZ
	6iXprYaEDim8a503zvvZ0n78Yj6Ns4zlpHEKJYbtRAVIUiwMx3eNMEPBAmoC1RGj
	f0A/ym+whJzDgdptUqgOwN5i8g9KZBrgr7jqWgBB3GEgco0KSRPzV40ANobwTvip
	wsYNdUhqyGfzpQas7NAT/t8VY0heQSSyeLyRjbtslQbgLg7xK+goqGYUI8AFyqkj
	teZzy2TEOX+4KwDHbZu1rB0xVnmhxLqupncmGlyG0RWwFK4o/QVgvFKavlg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h0g5p5p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 18 May 2026 09:23:54 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d812c898cso57979341cf.1
        for <linux-sound@vger.kernel.org>; Mon, 18 May 2026 02:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779096234; x=1779701034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DEneedWpQwB+o3i2G+K+xijFiG8S93MO38MV8xEuYUA=;
        b=JMF5LlhDp/XPYRbbf6GVldA3ysC9wy9ZdiGUairy2o9F6tHdOketLEZZMrLZrZNtfM
         2OdcwdQ3AxeHx4poCD7M7XvOX9EZ4SlxT0skc/1F5XE2Cc3lVlkZ3EGsWkU0ZWPrkp3I
         RLBFxrjA6byHTioigtN7svruD/4/RErI/7nJj4soKCQFd/+tVHEmPyZntXKXK/b+HO4J
         5oBgjuPYw2AZZInNseN2kQhy2DYZPZZUy8xbTb+jirWIiKjKw/6KXUud5acVuGc2kAqT
         6saK2jZCfSRHAqImyrcTLTFcC3fRc0UKYc6dWJEoAD/uFwB4PKmqwXmxfRhkLwBmkZOq
         7LXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779096234; x=1779701034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DEneedWpQwB+o3i2G+K+xijFiG8S93MO38MV8xEuYUA=;
        b=HUGpp+E/4WEQqaEsdW/8JWaRBbngAGJK7N8Hn0Kj1ED1HGjJhGfwN41pOXmr8xO2j0
         usUyROt+EaVX8G3G01L/Zrrt8An2G3yztyiXNVPQxIlqyJd3zAVxiHdSDRXjDwUMOWm4
         fCs4jNiIL+w3eNUuWu/eKEtmbjLaPbRKUpcLuigxR2lKqbYG/a3h0KM1R/GaZWEkz8B/
         v0L12qAPFsSgX7BfuyS5LaWFTOOQ+dvT6OMmt7wCiyyfHfsEeqRjkSSYQMfCaZ7sCxGc
         RRBqeov0sjO3ZfzP3IMAZtP0MGWe4oOcb7l+fEu+a+csb2VsBh4wgyucl944mYx8sJFU
         2V+g==
X-Forwarded-Encrypted: i=1; AFNElJ+Gn/tmduFHGJ4w0lpP7o3GS3ya22zRIrslGUxKlWFZefcuwfbbmVPQ4x/EwABaNak9BMan8fUt6gCy2w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEC0gRbnflJ1MHsFFLsdpJNMj0mFgtw8MOCzuB0pUZjGVRb1GX
	7iPJgLOEeTZUs9M8TSzqeZ7KgWyAUw+RyVoTITJcgeLqYm41hxEtTIP/hZZXNpBoB24uI5Ml6SS
	YfGyDUO4OnBDJxThrJ3Kus+2d6D9JVQbfCtxa5rLEfCz7ErcCo/7e1pXHQsZvusuTIA==
X-Gm-Gg: Acq92OF+XC8WtzdIsqPr+KCCSG/aVQanITRhsk1Jy7eckZrwjCMACpY+uMMrBFihxgz
	t0fhRsE1JX+5/aT9on3zLsPhydTykdr4LZZsHn4v3lSisFMdp1zL4sk8Gy2Z9auEj3ttEKskIS0
	LTkgQz3zJ19lP87l7GgsM/zdXsX+nvdgs2gwgXkvd+lDQ6hO3Mw+rfKrZfAQBWyTZxGMeI3NSgU
	MRPR2jBVBiNvbtp9WmDKcZugVqvuavW+UCFZxQOSAERy5xHng5WK+Fw6gBy7Z5RbqOxxp+bZlJa
	F92Ks+l6DNL65lVQMV6oXN9k8MpLTmKdAJbTPcYebZHqEUOTLChEM+k81Akaf4yMZ1fFUquZXtR
	lrY7jOd5rZdzrBfgvObMRi0dpBjaqK//Zs+Wvy88H3APWgNz2ptzOao0=
X-Received: by 2002:a05:622a:1f96:b0:50f:ccdd:13f1 with SMTP id d75a77b69052e-5165a03f078mr203841181cf.16.1779096233783;
        Mon, 18 May 2026 02:23:53 -0700 (PDT)
X-Received: by 2002:a05:622a:1f96:b0:50f:ccdd:13f1 with SMTP id d75a77b69052e-5165a03f078mr203840921cf.16.1779096233343;
        Mon, 18 May 2026 02:23:53 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe0fecsm33265900f8f.26.2026.05.18.02.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 02:23:52 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: jens.glathe@oldschoolsolutions.biz, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        val@packett.cool, mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Stable@vger.kernel.org
Subject: [PATCH 1/5] ASoC: qcom: q6asm-dai: do not set stream state in event and trigger callbacks
Date: Mon, 18 May 2026 09:23:43 +0000
Message-ID: <20260518092347.3446946-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260518092347.3446946-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260518092347.3446946-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA5MCBTYWx0ZWRfXx6eg3sVqcdoI
 uHmAnCEVcfpjeAG6bkXfXqmTubXMEpxs7g1cYBp7578dVSyz34JOBIScK7mtFlh2R/4WMOZWndR
 xd6CBMoLEfOlFyM2FCHtQf2neG47EGfyWjLqJdCq5+qgt+dMF//wgh9g1/44htgAiqM8YEV96th
 iCg8cbxC0nraOCEr+3iJO/V9t/Mdhx7kQBvXQuhEup+IRDZol9EnZx52/hJFLjiu18go1TwZXap
 g+XBNEZU28GT+Or2BVN/ZTguGrob6jU6JtOVhanJrQRcXGvQJKrB1UVZ0ywREW3gZ8rU5CAPteY
 1S7SND9NbLC4KECVo34jFiqAziiOhALB1pNkvgpGYFUE/DpAB/yN2OuVj+H2FaD2ls0rrdxPm9H
 m3xL+AsDLhbyyDB9JWw5IdtsMnvS1IWDsTwrgL6QCY20njfRLzHWUv1xSI+xWAMCcqCbYN0jlTf
 x3Bk2HKrIiax91Q3EPw==
X-Authority-Analysis: v=2.4 cv=W7gIkxWk c=1 sm=1 tr=0 ts=6a0adaaa cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=TpFDhmux8Oo1qIo2-XoA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: sM0jMPmzh9-24D48iMtWmuBXGVfLtpNe
X-Proofpoint-ORIG-GUID: sM0jMPmzh9-24D48iMtWmuBXGVfLtpNe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 phishscore=0 clxscore=1011 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180090

The q6asm-dai stream state is used by prepare() to decide whether an
existing stream setup needs to be closed before opening/configuring a new
one. Updating the state from trigger or asynchronous DSP callbacks can make
that state stale or incorrect relative to the actual setup lifetime.

In particular, setting Q6ASM_STREAM_STOPPED on STOP or EOS completion can
make prepare() believe there is no active setup to close, which can result
in opening/configuring the same stream more than once.

Keep stream state updates tied to prepare(), where the stream is actually
closed and reopened, and stop changing it from trigger and EOS callbacks.

Fixes: bfbb12dfa144 ("ASoC: qcom: q6asm-dai: perform correct state check before closing")
Cc: <Stable@vger.kernel.org>
Closes: https://lore.kernel.org/all/afS7rTHdc9TyIeLx@rdacayan/
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index 4f8f7db6c3d3..56f0d8913904 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -186,7 +186,6 @@ static void event_handler(uint32_t opcode, uint32_t token,
 	case ASM_CLIENT_EVENT_CMD_RUN_DONE:
 		break;
 	case ASM_CLIENT_EVENT_CMD_EOS_DONE:
-		prtd->state = Q6ASM_STREAM_STOPPED;
 		break;
 	case ASM_CLIENT_EVENT_DATA_WRITE_DONE: {
 		snd_pcm_period_elapsed(substream);
@@ -341,7 +340,6 @@ static int q6asm_dai_trigger(struct snd_soc_component *component,
 				       0, 0, 0);
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
-		prtd->state = Q6ASM_STREAM_STOPPED;
 		ret = q6asm_cmd_nowait(prtd->audio_client, prtd->stream_id,
 				       CMD_EOS);
 		break;
@@ -555,8 +553,6 @@ static void compress_event_handler(uint32_t opcode, uint32_t token,
 			snd_compr_drain_notify(prtd->cstream);
 			prtd->notify_on_drain = false;
 
-		} else {
-			prtd->state = Q6ASM_STREAM_STOPPED;
 		}
 		break;
 
@@ -1014,7 +1010,6 @@ static int q6asm_dai_compr_trigger(struct snd_soc_component *component,
 				       0, 0, 0);
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
-		prtd->state = Q6ASM_STREAM_STOPPED;
 		ret = q6asm_cmd_nowait(prtd->audio_client, prtd->stream_id,
 				       CMD_EOS);
 		break;
-- 
2.47.3

