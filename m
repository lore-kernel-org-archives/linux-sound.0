Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63F243CEC2
	for <linux-sound@vger.kernel.org>; Thu,  5 Feb 2026 17:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770311660; cv=none; b=l8BXktRsqv/I/byV3BAyB9W+g0qotQ3eLJGtTgrnHLlGkXK67H+IjvU8YUezEI4kUODYVsgNaE0SUJxHTvmNbZ9lgaLNKXJUjMUMFEw5Q4cQG743Ue2Met/1Z+44rkwJ3tld9SSZEiwoSiQRmp4QO5wQv1EJkoBxFzsWMNKNP2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770311660; c=relaxed/simple;
	bh=MELEMTjec5vaBpCEJT88+rEEETlPjpeLlEwa5LTMeTE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cq63vfMNr6dbK3Ctj6jPwYN1tU83eH03qEP19uEoMdv7xd506V+rT3faBU0kjxkkLRawW3tKOlAHbJ4PYXHn493gvjR2vMIapslajbaSX2IBuEO2tufoWIgKDdD+PWdyALIix4lbbSyywmel68j4FpDvFiTxybXswiFrlkouFPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GgfHFTl7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HolfHozf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GgfHFTl7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HolfHozf"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615EOiIW4129222
	for <linux-sound@vger.kernel.org>; Thu, 5 Feb 2026 17:14:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yYDv/MOnY4V
	DCdh1TrAl/JagxkvVShJkBH2OQjhFFyA=; b=GgfHFTl7zi5gWc1C0A55QfPlP6w
	SupVD9o1H7ev0947LZHADmeqINMslo0cGdmTAnKCYfdXVcPAw+S3PC0yqyYG6bqJ
	ZUtMCCvlEqV7TZphlOkgBw4E3NTSAjNTQQl2d7wIN3140/IkqK25Pri36f81mvnV
	HUM/a+uVLZUuzLJ062oHZMAlGhvbKOwsegARMOxWeZyowcwJROPJ2hKZnHwZWhXx
	VvtCv94DQUkp7OsD2C64bLHVASYA/DA4y3/sBpV+3PyBzVOfJFmY+ChAlfWYP7co
	c0smO6J285PJcDdeDkG6u247SL7F0RBCIpTTttceTlrKkGsQ92g0dJaaSlA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4vxhrk0s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 05 Feb 2026 17:14:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70b6a5821so291812385a.0
        for <linux-sound@vger.kernel.org>; Thu, 05 Feb 2026 09:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770311658; x=1770916458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yYDv/MOnY4VDCdh1TrAl/JagxkvVShJkBH2OQjhFFyA=;
        b=HolfHozfr+CdIoc1luGmwv+SLkltIJ6e23b0PaRTw9gRCc6Igpjn7PfXrdLeGpt6RW
         ICTo/uKu9fMGErYCeuzWUVuk8QnOxonqyRU86b13CGK5UxnWG7K376eYZYBgJt6oZBjI
         NDsO3tDEkqG2PtQJ3ps1wH0HeKQzYqjDIDiaPG3lXrxBQQ24ZFxzCiTx+FxxQer+VI/p
         H8bebAo9BfvWIaFRbJmNxjBq61qT63g03GTdvPyXf4phmsxw0pzgPwHgwV4Hk1FU2g4u
         nBcCuy4AHcQGt88CiHBx5QOvPdZy6LOUlkfnKg1dAheAeISTuLDtEQsc5IDb/bTn6PY+
         9oAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770311658; x=1770916458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yYDv/MOnY4VDCdh1TrAl/JagxkvVShJkBH2OQjhFFyA=;
        b=hTcPjPuVksquVEsBkwRaBKzGnvMzvKfAhTpmF8IJT999yVeJUZWimhUXdCMHRCHjaC
         IrcV7xafNQ3EOxGfpxkdWWWrrUbigz7uNVEramXMI1NcrH2W03b2eayR30R0nSENf234
         BNDTh+k3P9ID1vc2mrNrNlUTQ+stBNpcF/hfPeiO5Gm172COBiZ/03GqX02YLlX4oJdb
         j+lMpW0TDOBcSNrqQqYgVOVjqEUtsHCymRVOf+/5GeuhISYF3IENbfrk2Qdk7WfLqP/a
         FjYvAQY4Ve8/Ja8ivHu6AEANCI0yyd7mfQ0LdjDEZwPvJsQOSe/0pWVcocuAW5KK9+bV
         mLQA==
X-Forwarded-Encrypted: i=1; AJvYcCVCTzCfVYmpLBs1fwURjpHrTK35mzKv+CVLdVJrNtjfLMR5u91XnbV335+rf1AxSOAF3YpvBpUYsn3sRA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yya/GPFN+wIiOoIBL8GkDqsCVFOrbcwL3YYVfq2FUlEA4MUa7NJ
	B/cS/iv1XsKv4gmP1TGIzyUesrVmFH6/+FyzWlUN4vBwVvyPce8Mn++qzOKAOiw1miKgAdssAyA
	PQ/F9DrMVd942YaVQynymvptZI8+9+UA3YH8hjx5NqDOAZEZKFikr+8M6JRNMgsD7wA==
X-Gm-Gg: AZuq6aJkwCiM3InE20hzzMbdBjG7fMGXC2gXukE5yr/6Y7ksKpY+PhjFP4KPiQmFiSJ
	16Z7hcvM4Ejq0C8cjjYAN+acFT/PNVysnFyWW8ZTaoJVBiHhL3xyds5RhUghDtGXHX1gQ6f7hcO
	tJ5JySYVzVCCSkBGjIJLaGsZ8NzYenMlYB71VdwPddWuoj5HFr7vzMI1ZvjLLo1GeZEamyd6twe
	YfrN5fl2DI4CMcDeFSH3KhPooYS5OwCtmzPmkCFtl5efLLAXu9H9AMecVTV4qXY3aspGEJKS8Kn
	MiIDZaJdgtiw18KsLevhg2+4xauT4QqF+EhzD3oK08tOh/Bp0q2Da6K4tPDGQfxyHt6+OzUZUXT
	1vout46Oog6une8VyuY6NpGgpzq8G8LWDPgM5RocY5QQ=
X-Received: by 2002:a05:620a:2550:b0:8c9:fa97:75ae with SMTP id af79cd13be357-8ca2f9fdd07mr921337385a.75.1770311658071;
        Thu, 05 Feb 2026 09:14:18 -0800 (PST)
X-Received: by 2002:a05:620a:2550:b0:8c9:fa97:75ae with SMTP id af79cd13be357-8ca2f9fdd07mr921332285a.75.1770311657542;
        Thu, 05 Feb 2026 09:14:17 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43618057f87sm14802849f8f.21.2026.02.05.09.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 09:14:17 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
        cnor+dt@kernel.org, srini@kernel.org, perex@perex.cz, tiwai@suse.com,
        alexey.klimov@linaro.org, mohammad.rafi.shaik@oss.qualcomm.com,
        quic_wcheng@quicinc.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Stable@vger.kernel.org
Subject: [PATCH 02/10] ASoC: qcom: q6apm-lpass-dai: Fix multiple graph opens
Date: Thu,  5 Feb 2026 12:14:03 -0500
Message-ID: <20260205171411.34908-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260205171411.34908-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260205171411.34908-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GLoF0+NK c=1 sm=1 tr=0 ts=6984cfea cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=G9hKNilMzbK2xivVM74A:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: z51yFO1D1k8DzesX3hYq_2OQGLnaOFZ7
X-Proofpoint-ORIG-GUID: z51yFO1D1k8DzesX3hYq_2OQGLnaOFZ7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDEzMCBTYWx0ZWRfX1rL8l7hG1qhH
 ELGC1fTbLIJFWDaM9d/IhQcKFPoykS4Q6KLwudGXcawXxsh7WH+fZXWWXmdRts9BWK66YPecxp4
 dANny6kE6n9H8VuG/GJ3I07xxAW0tLZtOijEf3pKSbfz/WBCpUzW0T6BMQjtZ9U4o+uiZrQi2Kz
 +Tyk+yPF2BsuyrqoT8xkerReLJA2B6kXK+tEi32C9Mp7+IvD3Y6pvBnm1ws1e0VzqwmAZ254VFL
 Zv0DYHMvmKs+C0d0zjBclqKC3B6bP1BQe4iTGjaOlFt1Q4qDja9EMtanbQJ5St0latsLweRwMZY
 XI5RS6lUq2zbCc7YYogMCk7rTJHlDABSdwDm8YKawxhf8KDucMjz3fLRguuej7l/t+rRG4ujWYp
 rMXb/1t3tSnjTc5OGDb8iM8sXQGvFb2b3QOpH+nXP3udhPwhDqGArR4qfJjC+2gqR+juiuoi1up
 XNsv21M1OTEERrCu0mA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_04,2026-02-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050130

As prepare can be called mulitple times, this can result in multiple
graph opens for playback path, fix this by checking if there is already a
graph instance.

This will result in a memory leaks, fix this by adding a check before
opening.

Fixes: be1fae62cf25 ("ASoC: q6apm-lpass-dai: close graph on prepare errors")
Cc: Stable@vger.kernel.org
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index 528756f1332b..f68d4b4974f3 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -181,7 +181,7 @@ static int q6apm_lpass_dai_prepare(struct snd_pcm_substream *substream, struct s
 	 * It is recommend to load DSP with source graph first and then sink
 	 * graph, so sequence for playback and capture will be different
 	 */
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK && dai_data->graph[dai->id] == NULL) {
 		graph = q6apm_graph_open(dai->dev, NULL, dai->dev, graph_id);
 		if (IS_ERR(graph)) {
 			dev_err(dai->dev, "Failed to open graph (%d)\n", graph_id);
-- 
2.47.3

