Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFDAD2D8396
	for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 08:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760691401; cv=none; b=BvYp7ASctfUXwxYy785vGNtLLjDGzON7efkhdf57H4WlE2ihcpHn1wOYHVyK2KsC5J9f02CrIvMJJ+g+TadEfHcjHk/UO7obeCYYZhM/elinWqn1HASoFDJPHI1uS2s6E3cXVe6DdyN271a/7+hjtlgBDhRL0zKsYyUEBmvXlhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760691401; c=relaxed/simple;
	bh=xJ9ewBKmUOcp7y1OOXagWe0RLhZPnHfQRgccA5gcwCw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dph3Nz5d4xN53dh0aQLVRCCScu8kD5d8cfVTWxjo3GzVbOlOMJEFb6Adf9Ki5mY16Vi4ILWHScyfAEDpak+jGiGwcoU7x7WCXfzUrJVP6qMEk81OYvioJzPAwp6QdFMzG4faeX6vI42OT8EHkgms7PgpOwBXeDATa7bFY/G9fFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y+5pZSdK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y+5pZSdK"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59H8DUGh022287
	for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 08:56:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HLTr0qwAyjy
	py8cQSzVdRdWFvvEMv8L8lE7ajdfrlhc=; b=Y+5pZSdKuMh+SRNrogEKtF6KYjd
	TozBO2qtdkfBE7Ztr9MWJ+4AwjifZWT1w2hmBY92nBjEaukcGdWWgiZQiC+PaSum
	pqYIjsMZePaPWRdUf8PMghtFxrw2Rq1mSiVCRktkXKFn7w15EZwnhnpOVKvyQ3RP
	/O4gHwPlSl7iwnZ0RTJFrCO2of/5ASDyP92Tp3NSkcMlkqjPGFyqY8uK+fcvl4XM
	2SPIee9X6fu4ewNDouDsm3BZWExg6nlAtyWVdmVpGKUCFMQq3Lm2ybiefeDxP7qy
	Yh0ytmOc/QaNXSSuUTChmI1Om0PjwElxQmTp/53+CndtQ6LtAz5XXSp4mrA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rtrtghka-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 08:56:37 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-78e5b6f1296so50534486d6.2
        for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 01:56:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760691397; x=1761296197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HLTr0qwAyjypy8cQSzVdRdWFvvEMv8L8lE7ajdfrlhc=;
        b=TBwjEHUEfuVk19b+3B0USyfNPpTad8l7GISDZNthsgoEEX7WjiGbpS9qyIEfDF96g0
         9PgLsO2QlMXnlYljYrD/ba3nP3q3YKT6Otz9hEa1fikAIcwBWdLA2I6YeZ6PqysL0sbU
         RSkUO0pKCnAPDaIGEO5nfYhrbMBjOul8/UEektOckc8ActIktj4zQ+fdlO5jDpjZCgpa
         zLqKFHZ328uaUINN10LoIUiVVNimhVeb4qDSno0Fg/kmkjSnkSNWYAa6f4COLyNMg0XF
         23GySrERxtBw/I1XIct9S5NU7HVTfrxtET40J7WBXAvskQuNJgWXHKXHKl2+uZeYOHeR
         npgw==
X-Forwarded-Encrypted: i=1; AJvYcCViHPEflWBlmZi8n4FooFQjYMSjkOq1eFrU6+TQIAWclLF1gqnoKl6+TgGMiUc1wvwZdAhIn4rNQXU0FA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1HETxWs0+im1ySsfVItRvlqtJAaAFnrhzjUJt5g8EeP74/Tnp
	V5ZhpxwvNopYEhsjllO/+eyQBgRbVGZ8eOuUWBdnjBkBQTPqL7xTrsURF/09r2pOTg/h4xd6n0k
	l7FnMCuc+lwXbRpvZaORNMweYQS8YxceHH1MUo51/WPRZY4fWd1ptRLpwbLBc/yDKmw==
X-Gm-Gg: ASbGnctXQ0DVYeEa10ecGM+N/s3VAH8eBfw6JufKV7oQVE8VRsHQ+km2EwuiSLo19Lo
	JWFNG5VH9X70OaenDjWvEZ3e+QrvHCT2+ybSextynZXJHr3TVRyAvBiOgLYAgGVwwH20+LRafZg
	/nL0nwP+bRV2wltcy14mCfc6qB+XHyWqXsJx6XKQ1Z2AQ+6SXH82+x5LuqgQI+1Sej2oQKHr9mj
	j1HSLhZ+lGZTuJLTQrfB6XMBoVsWAuW8l0+PJpV9pWTWOYDTxcwfU76Bj74LsZL8STpgaRxF3KU
	MnAhozO1bJpJU1NjDtu1mb3vTvHfgX9kyznfs1ZowDbj5Oov6QYn5AprC+8D18uIiFQ/4/cJTy/
	lIn8KfObp0CG1
X-Received: by 2002:ac8:7c54:0:b0:4da:3218:e8da with SMTP id d75a77b69052e-4e89d263059mr42429371cf.17.1760691396904;
        Fri, 17 Oct 2025 01:56:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGiJl3aHFmjmNgCLDQr4OtAu7l19M62+p30JfjEUZEfWKYdayPHQpd/eRhXsqwlIUUFFwADg==
X-Received: by 2002:ac8:7c54:0:b0:4da:3218:e8da with SMTP id d75a77b69052e-4e89d263059mr42429211cf.17.1760691396380;
        Fri, 17 Oct 2025 01:56:36 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4711444d919sm70764985e9.14.2025.10.17.01.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 01:56:35 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 11/12] ASoC: qcom: q6asm-dai: Use guard() for spin locks
Date: Fri, 17 Oct 2025 09:53:06 +0100
Message-ID: <20251017085307.4325-12-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251017085307.4325-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251017085307.4325-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: MLGWfmmzrMKPGlZ7lsa8qHXSWCShet6i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAyMiBTYWx0ZWRfX5a3XX7dVqHeh
 dmioL0a4X+M6T9e7at5BG54jXRn6ZEtxqS7D4lH2efXpvxgVKdf7700g6Ad+FGcwFlviJp3f0/o
 emA84yiqjW6N2opa1lLSDOU5Cf8kDAM4uvoZp2NKpx+TLHZ+EjB96IQd5o/BSaPW53LMl4DAPjz
 QwJcKnWIdDDBwf7Nzxp0cdbBMiPvU4HdtHIMZUOLl9mKntYjxJclDlA3ZmAbafwDheVB2Q8Xcym
 wnOIkBofGW03VzaolO3nm+N6vRvoyeO0XY/mAL0nyVKWequBU3N9Z/ybhLqxfhLsziItLL93XXw
 IUtMZP/6CcED2AFMaz/ZdZERSEuCJNc8CD/zDvGtpiAP3MBNUcw8WDXMQoJd2152Z1kf/2HGNG0
 iM1XwEMq03W5Qc/95Fo2X0oB6lxCLQ==
X-Authority-Analysis: v=2.4 cv=SfD6t/Ru c=1 sm=1 tr=0 ts=68f204c5 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=xYGVKCReuHkqpmdgNokA:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: MLGWfmmzrMKPGlZ7lsa8qHXSWCShet6i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130022

Clean up the code using guard() for spin locks.
No functional changes, just cleanup.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 23 +++++------------------
 1 file changed, 5 insertions(+), 18 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index b616ce316d2f..665a5d1ec4cf 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -493,15 +493,15 @@ static void compress_event_handler(uint32_t opcode, uint32_t token,
 {
 	struct q6asm_dai_rtd *prtd = priv;
 	struct snd_compr_stream *substream = prtd->cstream;
-	unsigned long flags;
 	u32 wflags = 0;
 	uint64_t avail;
 	uint32_t bytes_written, bytes_to_write;
 	bool is_last_buffer = false;
 
+	guard(spinlock_irqsave)(&prtd->lock);
+
 	switch (opcode) {
 	case ASM_CLIENT_EVENT_CMD_RUN_DONE:
-		spin_lock_irqsave(&prtd->lock, flags);
 		if (!prtd->bytes_sent) {
 			q6asm_stream_remove_initial_silence(prtd->audio_client,
 						    prtd->stream_id,
@@ -512,11 +512,9 @@ static void compress_event_handler(uint32_t opcode, uint32_t token,
 			prtd->bytes_sent += prtd->pcm_count;
 		}
 
-		spin_unlock_irqrestore(&prtd->lock, flags);
 		break;
 
 	case ASM_CLIENT_EVENT_CMD_EOS_DONE:
-		spin_lock_irqsave(&prtd->lock, flags);
 		if (prtd->notify_on_drain) {
 			if (substream->partial_drain) {
 				/*
@@ -539,20 +537,16 @@ static void compress_event_handler(uint32_t opcode, uint32_t token,
 		} else {
 			prtd->state = Q6ASM_STREAM_STOPPED;
 		}
-		spin_unlock_irqrestore(&prtd->lock, flags);
 		break;
 
 	case ASM_CLIENT_EVENT_DATA_WRITE_DONE:
-		spin_lock_irqsave(&prtd->lock, flags);
 
 		bytes_written = token >> ASM_WRITE_TOKEN_LEN_SHIFT;
 		prtd->copied_total += bytes_written;
 		snd_compr_fragment_elapsed(substream);
 
-		if (prtd->state != Q6ASM_STREAM_RUNNING) {
-			spin_unlock_irqrestore(&prtd->lock, flags);
+		if (prtd->state != Q6ASM_STREAM_RUNNING)
 			break;
-		}
 
 		avail = prtd->bytes_received - prtd->bytes_sent;
 		if (avail > prtd->pcm_count) {
@@ -581,7 +575,6 @@ static void compress_event_handler(uint32_t opcode, uint32_t token,
 			q6asm_cmd_nowait(prtd->audio_client,
 					 prtd->stream_id, CMD_EOS);
 
-		spin_unlock_irqrestore(&prtd->lock, flags);
 		break;
 
 	default:
@@ -1031,17 +1024,14 @@ static int q6asm_dai_compr_pointer(struct snd_soc_component *component,
 {
 	struct snd_compr_runtime *runtime = stream->runtime;
 	struct q6asm_dai_rtd *prtd = runtime->private_data;
-	unsigned long flags;
 	uint64_t temp_copied_total;
 
-	spin_lock_irqsave(&prtd->lock, flags);
+	guard(spinlock_irqsave)(&prtd->lock);
 
 	tstamp->copied_total = prtd->copied_total;
 	temp_copied_total = tstamp->copied_total;
 	tstamp->byte_offset = do_div(temp_copied_total, prtd->pcm_size);
 
-	spin_unlock_irqrestore(&prtd->lock, flags);
-
 	return 0;
 }
 
@@ -1051,7 +1041,6 @@ static int q6asm_compr_copy(struct snd_soc_component *component,
 {
 	struct snd_compr_runtime *runtime = stream->runtime;
 	struct q6asm_dai_rtd *prtd = runtime->private_data;
-	unsigned long flags;
 	u32 wflags = 0;
 	uint64_t avail, bytes_in_flight = 0;
 	void *dstn;
@@ -1087,7 +1076,7 @@ static int q6asm_compr_copy(struct snd_soc_component *component,
 			return -EFAULT;
 	}
 
-	spin_lock_irqsave(&prtd->lock, flags);
+	guard(spinlock_irqsave)(&prtd->lock);
 
 	bytes_in_flight = prtd->bytes_received - prtd->copied_total;
 
@@ -1113,8 +1102,6 @@ static int q6asm_compr_copy(struct snd_soc_component *component,
 		prtd->bytes_sent += bytes_to_write;
 	}
 
-	spin_unlock_irqrestore(&prtd->lock, flags);
-
 	return count;
 }
 
-- 
2.51.0

