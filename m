Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496D230F922
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 10:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761215184; cv=none; b=ZoURnp1e6v6s9VOHPQSbfQQl77XuE4xrYjETrcjcsMjZosJq1Bxbne4z51Mt7JM1ja+znanPJ6/WmEcUU5RpI3asHjtys+Uj0cPeDN1SNQXzjkeiG+Cxged6sWIgegynHer0f2f+7yg4veaXBZphi9lOW3jX8T7j8OfFSM/wacI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761215184; c=relaxed/simple;
	bh=KVruKtFGqlNB0x+gho9GBnMGXgQxhRdueAWKRhYaARc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LWBUApSQsfoqS/iK7k6IxuSoqt/W9/zxr9rtfFLM0tdRHr7bMYj7vk0sIqFKDXpCVGAjxIt4nR+kLUT+YmlCwC/JFHmpXDqzpOHB632QJsPI9S73eY5kjKCkalbbphkfVssta+5EbdU+6BuKNfIxcLC0E0pacAIKzJur5Api9uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TMEaPiGL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TMEaPiGL"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N7ep13026316
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 10:26:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=igt0AhPQeVE
	ZDk+mX17La+46irE4J07UVD9f/TtHRVM=; b=TMEaPiGLqoM58qpKZqnF3e3Oufv
	HcKgS0Z7NlHmFuW2qcIiqdi/4MCo1BD9jFyQUrbj0MuYEW7xNf7DDROleSMhEunJ
	seWo+caTntZAtvE0zsg+zhmwrZgEQC3uC87f4INp90/dAROyX3gLBst0kOLGPw0d
	mzd3+cUP31CMrVZBVce4y6eHcR1R2RHU7nOyqdKyPVcHn3vgO9GaUuKNCZSIKScG
	HICdvydpK3PUU2AwjsXzsk98izjv3pcGE8wX2Rj9QOHAkW5A6kgWrLBTesA/2KhX
	PbVLUFxIMeeaTKCXhTs28lXOtOeR0fIBqXqlgwvOyXtfmkzVSxZaZo24WoQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y5x8j44k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 10:26:19 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-87c2c9f3058so20988656d6.3
        for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 03:26:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761215179; x=1761819979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=igt0AhPQeVEZDk+mX17La+46irE4J07UVD9f/TtHRVM=;
        b=uB5oXnw+CD/5yDAP40DNo1c892LdiIhHXWxu916aLilzTktbAwDLZOhIp5GVBhOsys
         LMPLfhxaOJ9Ch7NTxKdHp+epPBoGyC0ZJ7IKlZUeihzmDh1sKvvwfjsbgHDKk0nEyurW
         /sIFlCFLi2Xwsb0/i4nYyy8hhs6zELFIaH+wHfk9uIhR1mbtVk8UCbXJ3UPEyZI7ferB
         DHPE4ejBWFl9ke1o8ajbtarKrIlXGzmX/1I9j6huY9WeT/qJzJNKQeb2LB+H/IdOlY7z
         sowleF2H895Pt0BfRQ1yrNKjG1ctCbevuyGOvqKXEOyKdxSRf/4l//Dog2N/Pm2BIeib
         UrSg==
X-Forwarded-Encrypted: i=1; AJvYcCV13Vshy6sKRkioaBlmZcdSIcbfMDL/mSX/IpiP9kMfTB9Z6FjIvAB5BzWSRIW8Ev30RvCygiIBpgr++A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXTjRfLXnG5Cx+wQTkof4f4Ngbzqm7kBhgmqEu8C37zmb5W6bZ
	75cDG5szSvM7mfZDzoZ3yPhXeH5rpgkS1dKTbmnuWZJC+hEa7/4S1QE1p3ocBmdS//zGoKmuJ+A
	lK2wf5KLL5eYVkDp9VSQrB8OzZ8Vu2WbWt2F3Jf4CS9Rn+Y7qJfUjX5GBRL5Xuv2EUw==
X-Gm-Gg: ASbGnct+2Z3kgljiJ7OepPbdhbWWWfBhcb93fXsU0rPsNvcxbBj0+fzgqxX3T+SAUIL
	lnWDXE+fsgj5S8ISKU9VqNN9iysLGzv54C8Wmr6w8csMkLfUu1jFogLhGbbVNXJ6NQgOG5hJLbD
	ZMkol/QDbFd4GLWuLd/hoisPWT0H6Nbii05VoL5PnVIVxopHUy6X1m0HUQyPTHxga25cQAozIN8
	6qkMXHN/+2To4Tg29LhUDR6+wxXYIJV3/dgC2t6M7tBDiKnDttxDT9LUASB4C855s7/MeiOGP9l
	KYh7XyliTolC8gbVURCDwVRsYFT7J7oWpTS7EizIXGP0q1BiHo3x/thkRZd1Yird3AmCAMGRNpv
	kGB7xopQX8vi5
X-Received: by 2002:a05:622a:1a87:b0:4e7:222e:6725 with SMTP id d75a77b69052e-4e89d1ffbacmr265810011cf.8.1761215178956;
        Thu, 23 Oct 2025 03:26:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+9HWC1ogOsnS1B0060yHcN3sg/K3kOHcnAa5/VLs+/IMUhU9gcRDPG6dpfW3Wo0sxZlXl6Q==
X-Received: by 2002:a05:622a:1a87:b0:4e7:222e:6725 with SMTP id d75a77b69052e-4e89d1ffbacmr265809711cf.8.1761215178479;
        Thu, 23 Oct 2025 03:26:18 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c427f77bsm92220685e9.3.2025.10.23.03.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 03:26:18 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 19/20] ASoC: qcom: q6asm-dai: Use guard() for spin locks
Date: Thu, 23 Oct 2025 11:24:43 +0100
Message-ID: <20251023102444.88158-20-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023102444.88158-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251023102444.88158-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: bUMKsBFcrkcCurTAobfFNRpVB8xcBiw6
X-Proofpoint-GUID: bUMKsBFcrkcCurTAobfFNRpVB8xcBiw6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE2NCBTYWx0ZWRfX5zzC0xC0uyg5
 1ARbGxWPE8rlBaVmAlx+T6YW3gZsE3qxyPAxFGD+cqvimFh61AWoI9hSELUb1WuknHSoOv7zuX9
 VMB9+B/Nrp2qAMp+PKZO6dZMl6TeotO+Z7sGkFFI+yX9nWPvDXuaOzfH5CR+8B/RpJZ3eHqydK4
 AmE5sfY1kJqTVlzCRzcwsNrFkChlKvw1DzvbufL1VEds5oJCiktfO0TEIS/HP9q/EoiyVhDzmbZ
 hSa0uiLNkwrRnS6FSUi7N8QCTAsIUK5sOzO3BdQJ9JiD6i/TZcQD1GtZnf2ARadNLw8RN9ECHJU
 xwE23rjm/qnD393Lw41xuq8TzxAvbD4NvavLw4aVevcxGVSOmgLv+KJdAbWfMpaLvtklivoeBVK
 DqBhtCGMkDeEoDcAqP9YIwH0ft4WNA==
X-Authority-Analysis: v=2.4 cv=UOTQ3Sfy c=1 sm=1 tr=0 ts=68fa02cc cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=jAKm68vC9n-ZoyGP1lgA:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220164

Clean up the code using guard() for spin locks.
No functional changes, just cleanup.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 23 +++++------------------
 1 file changed, 5 insertions(+), 18 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index 97256313c01a..709b4f3318ff 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -514,15 +514,15 @@ static void compress_event_handler(uint32_t opcode, uint32_t token,
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
@@ -533,11 +533,9 @@ static void compress_event_handler(uint32_t opcode, uint32_t token,
 			prtd->bytes_sent += prtd->pcm_count;
 		}
 
-		spin_unlock_irqrestore(&prtd->lock, flags);
 		break;
 
 	case ASM_CLIENT_EVENT_CMD_EOS_DONE:
-		spin_lock_irqsave(&prtd->lock, flags);
 		if (prtd->notify_on_drain) {
 			if (substream->partial_drain) {
 				/*
@@ -560,20 +558,16 @@ static void compress_event_handler(uint32_t opcode, uint32_t token,
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
@@ -602,7 +596,6 @@ static void compress_event_handler(uint32_t opcode, uint32_t token,
 			q6asm_cmd_nowait(prtd->audio_client,
 					 prtd->stream_id, CMD_EOS);
 
-		spin_unlock_irqrestore(&prtd->lock, flags);
 		break;
 
 	default:
@@ -1052,17 +1045,14 @@ static int q6asm_dai_compr_pointer(struct snd_soc_component *component,
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
 
@@ -1072,7 +1062,6 @@ static int q6asm_compr_copy(struct snd_soc_component *component,
 {
 	struct snd_compr_runtime *runtime = stream->runtime;
 	struct q6asm_dai_rtd *prtd = runtime->private_data;
-	unsigned long flags;
 	u32 wflags = 0;
 	uint64_t avail, bytes_in_flight = 0;
 	void *dstn;
@@ -1108,7 +1097,7 @@ static int q6asm_compr_copy(struct snd_soc_component *component,
 			return -EFAULT;
 	}
 
-	spin_lock_irqsave(&prtd->lock, flags);
+	guard(spinlock_irqsave)(&prtd->lock);
 
 	bytes_in_flight = prtd->bytes_received - prtd->copied_total;
 
@@ -1134,8 +1123,6 @@ static int q6asm_compr_copy(struct snd_soc_component *component,
 		prtd->bytes_sent += bytes_to_write;
 	}
 
-	spin_unlock_irqrestore(&prtd->lock, flags);
-
 	return count;
 }
 
-- 
2.51.0

