Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9334D30F93B
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 10:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761215184; cv=none; b=lJOPhWyQm105KbTSGR4r8mL+tHWdIw1Vey5UeyXwFZFWbr5FXli9xIKpx+zGjQYGG0JSblX1aik4Dwvp1Vf0HCLKf7w46oOU4Q8KAAYmSWsU4ud/mo3xgjBHPKII23gbDiA/QdlUf+MqSgl3pXZehkqeX3CV0QVS2G1x2TDSLQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761215184; c=relaxed/simple;
	bh=GHK0Bqp+aTp5qa54qoIO0zDF/pnvyDKyrzUXWBxCkX8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y6XoOY2shVXKhi1eRysvd/QgMcEl/8zKdSZSUTDXzO/REo1mQf4EMDI4Vh84+zgH04JBkw67G/yXw9lVT8EcSgig8sxB9vSThDJ8uoe5SNXoDJgCD+Sf5E4QGNjzBCEEjpg/IobqpxIgGvT00piRALLEhevtKToCzcWW0yQikSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BpDD0I/c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BpDD0I/c"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N7n97c019079
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 10:26:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=p73jpS1MlOw
	p0RMwgOu6rekzfzyJhQno1fUo+yocZrI=; b=BpDD0I/crsGM338CVtCzuLSppkw
	zHBj7MZmLlOhDwm5xuk29i0aw61khuSDX347KL2i7tgMv2Aq/lZjN4ZGuKnWfVMO
	ndnNoVjhu4MgojrsoahLFhBC/siPqL+q5QDGl+aTht+UtdQUfrmhJ9gIYyyHVSUa
	7AHXMFsC/Sul5J+hGNuG9He6RI6iLXxtn3dLlGn3uk15Ml0fzx/ApzPRbL1D/j0f
	/xWFq7Mv6ZNhxPhlK9q0hrbM+FRur3N7bi1PFnfwzyLlmCBePn7sQw4kMuIEfp0u
	6Q0syuQ02jF05/fm41VoQ2oMGl0ldPN62D6PJ6EuG65X93F4kOvQPRkOHkg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y67qhyxy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 10:26:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-890f1090e44so149907385a.3
        for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 03:26:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761215180; x=1761819980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p73jpS1MlOwp0RMwgOu6rekzfzyJhQno1fUo+yocZrI=;
        b=r+E2UWricpOhulZUUKt+NrwCctrgUEteArVc4A16hAQiqPGgPUIz1WCudl2EPkaZdH
         2dn7HUFoqxF3hcO7INxc2fDi0nT6ylVkuHvMeN29+lEEF7eAmtz8f0s+yeucPBSTo0WL
         DdYC+JLRZ3mqX3AWnrqxAjNXAoyFMDHBtkdDv3UB2UchaAK0eC9bM2li7RnY/ICuCcca
         Tqnuj/0stc2E5VT/Rw20bkXk7Np4y7MUSODbxJ4YdqXszwEW8fMavqll/8O+1g2hkZUM
         lL3SzYKNCTaQ58DML9/WZ9kcMm9opV1z8CJ4sFs2mnc0dXIpzlpICBmQ9HJe4E02J+WD
         QCEg==
X-Forwarded-Encrypted: i=1; AJvYcCXVoP46cK29M5cEBieEt+BvmxGfx9wI/WGqJGYD7/6PJOWYe1CpLKRcnHSVFpqvojAICukBv0hvtSY2Ww==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJU5sdA9O2t5DhPmy2eoxY0refikX1HdTuYmNglZ/JWJ33Px0M
	1s2UXrFz6qPiDbiO5/kDsTtUxMi6Pr+jHq4NOnhVoPDwmMe2I4T0hsWFUs7Nie7ESlkl2j/bnnL
	tayqNAp3cBN9zxl0Hn3x4HusF5CCRhkgcNI5l+6zOIHSH+6b/tibQziJ9cTol0wkRsw==
X-Gm-Gg: ASbGncu1EroCaKk831pcPqBYTCICbkdUAUW7fppdbxcwGUQ/BmkZVTA1A9WKzK059gM
	WBRnOOx58NZdxVgzwj0UeCelOUkU1TqNPeuwnFq+6F19tBEysmtEmkThz6EuIYiL8lLIqc1syNv
	YWOFvhnjzACQS2HYV3ZvAf2+jX65TdgXNgimJmxEO6qyjyldA5DTWw43R0X4FCr2TtDylAipMo5
	e5ErOCVvqzcAieTmb40ekepUR4bIgIORy2fqJxFXSZku3tlYXRchvqg9nStINSbNI0vzhrZJdGG
	UBP0xn8Bc6qhenT9g9ddiJXid+XSMGLsBXRc68hJFYQ0pY1MOPiZ1RHTfzd5zLWz4l/Hb3HgN5O
	BGpb9LxjpwlLA
X-Received: by 2002:ac8:5e12:0:b0:4e8:a8dd:9f1d with SMTP id d75a77b69052e-4e8a8dda67dmr231425211cf.59.1761215180545;
        Thu, 23 Oct 2025 03:26:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFla5PtPNq5rn1k275rdtDmgbOjAIyKKrz4PKBO1yGkb8lsA6j+rK15MhKTPeqe4vSpMLSntw==
X-Received: by 2002:ac8:5e12:0:b0:4e8:a8dd:9f1d with SMTP id d75a77b69052e-4e8a8dda67dmr231425031cf.59.1761215179964;
        Thu, 23 Oct 2025 03:26:19 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c427f77bsm92220685e9.3.2025.10.23.03.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 03:26:19 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 20/20] ASoC: qcom: q6asm: Use guard() for spin locks
Date: Thu, 23 Oct 2025 11:24:44 +0100
Message-ID: <20251023102444.88158-21-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE2OCBTYWx0ZWRfX/6FMpO/lnoJY
 O+KslVZf/3fC5ci5n4LKHA94jxpOQKG6JVinPCbC0Eg2XYSu7Ay4QgyL7U0/Sotfh/T4N6qm8yB
 4785fdJc0BtMAO7XVVZwmEY28V2Jw922/0BEhtlVXLsA6wMJl/QyMUDMHFymYZ2vppn7Re/2eXy
 dZK5w8TZK5nhczmYyyU+IQrAesQxNZadOrmmo+1WLOpoosJ8QHnvpn2rk9gVfR3WUEHXKP3+vX4
 urU7VSY69DCuRJMs3PZMOKG4xD9nvnEYHWxN2QaChg1aIWLIze7MgDk43JEM/e3FrCmNbFPhqKE
 lQRvC0a2EEWymQOXnZ6ZLfRld5YH4PecHzPPrAfm6Jvg+u0OX6BnXwpo9J4CB5IF/9esMtbGQ4V
 B6DpfQbzISGsj6L+iUDu2Juk22wq/A==
X-Authority-Analysis: v=2.4 cv=LMRrgZW9 c=1 sm=1 tr=0 ts=68fa02cd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=C-aEvXguSqPNF6A64mIA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: UDQsqEvRVZoPN6PzBdV0Z93FpYl4anKN
X-Proofpoint-ORIG-GUID: UDQsqEvRVZoPN6PzBdV0Z93FpYl4anKN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220168

Clean up the code using guard() for spin locks.

No functional changes, just cleanup.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6asm.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm.c b/sound/soc/qcom/qdsp6/q6asm.c
index 431a99776dcc..e7295b7b2461 100644
--- a/sound/soc/qcom/qdsp6/q6asm.c
+++ b/sound/soc/qcom/qdsp6/q6asm.c
@@ -571,9 +571,8 @@ static struct audio_client *q6asm_get_audio_client(struct q6asm *a,
 						   int session_id)
 {
 	struct audio_client *ac = NULL;
-	unsigned long flags;
 
-	spin_lock_irqsave(&a->slock, flags);
+	guard(spinlock_irqsave)(&a->slock);
 	if ((session_id <= 0) || (session_id > MAX_SESSIONS)) {
 		dev_err(a->dev, "invalid session: %d\n", session_id);
 		goto err;
@@ -588,7 +587,6 @@ static struct audio_client *q6asm_get_audio_client(struct q6asm *a,
 	ac = a->session[session_id];
 	kref_get(&ac->refcount);
 err:
-	spin_unlock_irqrestore(&a->slock, flags);
 	return ac;
 }
 
@@ -681,15 +679,13 @@ static int32_t q6asm_stream_callback(struct apr_device *adev,
 		client_event = ASM_CLIENT_EVENT_DATA_WRITE_DONE;
 		if (ac->io_mode & ASM_SYNC_IO_MODE) {
 			phys_addr_t phys;
-			unsigned long flags;
 			int token = hdr->token & ASM_WRITE_TOKEN_MASK;
 
-			spin_lock_irqsave(&ac->lock, flags);
+			guard(spinlock_irqsave)(&ac->lock);
 
 			port =  &ac->port[SNDRV_PCM_STREAM_PLAYBACK];
 
 			if (!port->buf) {
-				spin_unlock_irqrestore(&ac->lock, flags);
 				ret = 0;
 				goto done;
 			}
@@ -700,11 +696,9 @@ static int32_t q6asm_stream_callback(struct apr_device *adev,
 			    upper_32_bits(phys) != result->status) {
 				dev_err(ac->dev, "Expected addr %pa\n",
 					&port->buf[token].phys);
-				spin_unlock_irqrestore(&ac->lock, flags);
 				ret = -EINVAL;
 				goto done;
 			}
-			spin_unlock_irqrestore(&ac->lock, flags);
 			atomic_set(&port->hw_ptr, token + 1);
 		}
 		break;
@@ -712,13 +706,11 @@ static int32_t q6asm_stream_callback(struct apr_device *adev,
 		client_event = ASM_CLIENT_EVENT_DATA_READ_DONE;
 		if (ac->io_mode & ASM_SYNC_IO_MODE) {
 			struct asm_data_cmd_read_v2_done *done = data->payload;
-			unsigned long flags;
 			phys_addr_t phys;
 
-			spin_lock_irqsave(&ac->lock, flags);
+			guard(spinlock_irqsave)(&ac->lock);
 			port =  &ac->port[SNDRV_PCM_STREAM_CAPTURE];
 			if (!port->buf) {
-				spin_unlock_irqrestore(&ac->lock, flags);
 				ret = 0;
 				goto done;
 			}
@@ -732,11 +724,9 @@ static int32_t q6asm_stream_callback(struct apr_device *adev,
 					&port->buf[hdr->token].phys,
 					done->buf_addr_lsw,
 					done->buf_addr_msw);
-				spin_unlock_irqrestore(&ac->lock, flags);
 				ret = -EINVAL;
 				goto done;
 			}
-			spin_unlock_irqrestore(&ac->lock, flags);
 		}
 
 		break;
@@ -1561,14 +1551,12 @@ EXPORT_SYMBOL_GPL(q6asm_write_async);
 static void q6asm_reset_buf_state(struct audio_client *ac)
 {
 	struct audio_port_data *port;
-	unsigned long flags;
 
-	spin_lock_irqsave(&ac->lock, flags);
+	guard(spinlock_irqsave)(&ac->lock);
 	port = &ac->port[SNDRV_PCM_STREAM_PLAYBACK];
 	port->dsp_buf = 0;
 	port = &ac->port[SNDRV_PCM_STREAM_CAPTURE];
 	port->dsp_buf = 0;
-	spin_unlock_irqrestore(&ac->lock, flags);
 }
 
 static int __q6asm_cmd(struct audio_client *ac, uint32_t stream_id, int cmd,
-- 
2.51.0

