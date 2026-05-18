Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484A03E5EE4
	for <linux-sound@vger.kernel.org>; Mon, 18 May 2026 09:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779096241; cv=none; b=scXJMFSznp9fvOseO6ywnIhk7BacUN39vKffoX99VSNovNadHCIDHyXqIStPuu9YSzZ7F8W4zWLRQmmovdi5BxdBYOj0yqUfTNmwqZ1EV9p176q9QX/nXGhbXJm/L13geOWNBIGRnYX/viae5QnPyBXKByHxjN78jDOYr2EqfxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779096241; c=relaxed/simple;
	bh=ZygEn0EETQGqYGeHUWtAH/6JmsqAEExRFa3DDJxxyDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XKBwUOM50jSrWQpuG4XpYTMwiC3DqVzBQadz4mI817X0TJ9K6eGyA849LmxDhFEGTaSVoz3y3Iz8TloCob68ZGUqrwsomjdIGojRxmgdnNbW1bc/aEWDn6HNNsyfhYsnqKR35kWKqNw7pZe7msiar/Ylp2L6yN19oG+seZZaSpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bDV6s7SK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UP2F1COC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bDV6s7SK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UP2F1COC"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I7Nfuv1912590
	for <linux-sound@vger.kernel.org>; Mon, 18 May 2026 09:23:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fcKyMgNIlAn
	wWT1JTHrlq9inj+SGc4L28t2ADtCeMQ4=; b=bDV6s7SKHuIlUgZWt2rrYvB6Ei3
	iREAyzldM+vRMMxNypLteb1tkyKUP1K17m7A1pKp9O0tvaLk2NRp6dt2YmdvSqqV
	PIOjRbiSAvWZthzB4zhSlx8KD1r0cFoILIp+9sD35sPX6vXtLxjamOZkLlB/K1h2
	igblBXQZbDnYSid+2ZsS/2EGdI4kNodvDnOG+uEBauVjXNK4kx0IJTwJFsfcnQtD
	lJ+C/c7vJZtESgo3/Saz/N68KeSOCz3yncm4oe3jTBB7obF2Ah2nN88BfI0XGwu3
	ipDf5JJjTM9oCELTH4r1yXCP2Ejdm/NkYhMGCnJ2QJQLpKCHRLiA21UOWMw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6tvcmj9v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 18 May 2026 09:23:58 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50ff0bef198so64144711cf.2
        for <linux-sound@vger.kernel.org>; Mon, 18 May 2026 02:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779096237; x=1779701037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fcKyMgNIlAnwWT1JTHrlq9inj+SGc4L28t2ADtCeMQ4=;
        b=UP2F1COC3/xuzMqCZNo6IkfBVEALNbwKhwMu8xOc1pVZ0ojF5ebn/EoCsDCBgelMA5
         DnrIAgDfi3jv0DFagQ0E1zmi21D3eI12zy3K05VNmuqdE7jbuOW8p9Am0GCs6f6g8yJc
         RM2l7dd76u8++W2yAAQUcT3ZyeyhYV5/79iO9Fp7r2x2F2q7Kf3JfnbojZqN3uJ9D23L
         R/kVNA9AuPUZdW25MEQUm8ujRBStU6qLQgZSr0WbUnWO4h9mYCCq/3khaFX9FMtzsXYc
         Ma2xsbbtSUYxCUk7cQy2j+M5r5tTacJ4yJnT3s8+vZncnyPPqnFcEvmQH97AAjgZfFwg
         gQPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779096237; x=1779701037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fcKyMgNIlAnwWT1JTHrlq9inj+SGc4L28t2ADtCeMQ4=;
        b=bBZDYA4A5E5wDb4yOrfs2EIn7q4GedKeq5EMtGa+Wg2K9OJsXfFZI/SjKKwganYoUJ
         mALGA5CGqhT4ciWRqlq2nRpW2OG0LMLYYw1jfsZKI5txIC/Tx2HtLlX2URuHKJXuTDWv
         OtDpMqcyjoURQ+BqNzPuYMEEpQyD4ct+SnxfDRa3po34DlYl5IGIu+mcohHY664C7dTp
         IX6CTtq1qo54z3zdgBaTBPrW4MXjb0jMWDS7X4lDkle2Rfx6VU0tbjjrjdmL9z3DZyS3
         bu7fDItdqEEQnAJRKTubtPlSPqfoemQVLAMItl3D7SfeRm02FhDhZvX+JJCjInKDSGpu
         iskA==
X-Forwarded-Encrypted: i=1; AFNElJ9S3wa7Xn16NdHT5RixVg1C8hm4N9qosgArBYEyoCEV0pBikY/wusaY2Kg1gxTZkDcLDIX4RIlptw5vQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOJP1YxHIH8xVCglHXCe14xRalF8I6NkSgNvQ6J1EG3sWZCDHe
	wtA5lUYFMIk5PXvXsvTO5BkcenMgOb7P7j8UCngGVg8cP/qDfY2krLK1GrCmMtB8cw/pH1dHNEA
	KSTBCebW8es59EZ9xd0CeTnVUwvrGh/ianucvVf7Kpn6G5dkT0lRv3erOBfbgecbwVR6Bm9VLsw
	==
X-Gm-Gg: Acq92OGD+A8Yl+atEzEX7QO5nu90iN8WjTZjPn1+MKwNjTyzhsUp0pQJa6vbGESIb3n
	oatj0qVGhzyD8nwJfUK3RePOhvLY7sOlP8Wg2uh6iVdwfDPedEP8aq5N6hXa1jMIhFeJViZwu1s
	efHYeh36/ClwFHE5mLh4dScS5E9u37M9dRbumNdV/kvOM9qEmR7pjrMY7RCnpxVqi+yo33m3Kb1
	HaDTdaNMzeC1mf3BM4heIpBVxdsrn2rgzXHIsqyrXUVlNkmqCiM8jXKG+RhIw3suJJ2Kj1XgL6w
	6Tw4QidlURxBwcJz4ILzAeZ6gTGmuXfmyM6UlK9/tBhb0DqxEdML9+edYAUEz2N4E64dCNKJBCQ
	Wf1Lv19/fIAfkxTCgfkCrDW2SxgmGSzP/N1yyRpEuuBbeKkJGpUPood8=
X-Received: by 2002:a05:622a:1f16:b0:50f:bc57:d69 with SMTP id d75a77b69052e-51659ed0e67mr188582861cf.0.1779096237540;
        Mon, 18 May 2026 02:23:57 -0700 (PDT)
X-Received: by 2002:a05:622a:1f16:b0:50f:bc57:d69 with SMTP id d75a77b69052e-51659ed0e67mr188582571cf.0.1779096237068;
        Mon, 18 May 2026 02:23:57 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe0fecsm33265900f8f.26.2026.05.18.02.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 02:23:56 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: jens.glathe@oldschoolsolutions.biz, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        val@packett.cool, mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 4/5] ASoC: qcom: q6asm-dai: remove unnecessary braces
Date: Mon, 18 May 2026 09:23:46 +0000
Message-ID: <20260518092347.3446946-5-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 1efYFL5ASGGlaObi1_LQojUZSfqrDjdY
X-Authority-Analysis: v=2.4 cv=UIDt2ify c=1 sm=1 tr=0 ts=6a0adaae cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=_k_GUD08GHZRIojl7QgA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 1efYFL5ASGGlaObi1_LQojUZSfqrDjdY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA5MCBTYWx0ZWRfX9LQHwcVnbE4t
 QtuCcUUeEVcvSxXaQI7M7NTafl3ZtyqFDuERGBr+9aWwGkpZildYIVaDe/DPvWcoxAMsH+zZbEl
 yK0Rg3tJPqQzrsq0Mv5I6RTPS0jORKAc5UI0RqaQOIUekVvsEOq6ePbcnaFegCgyiobpP+ZZSp0
 vRmCT9zYtz5Z+yK+uzyj68TkrCCIARrckzt3WA2vzLA3o82RoBc34VfT7tHY1a66wp1fow6tu3l
 m54O7gZ9s+3LkQEAkchehryyfNRdRBrOMH+8l2LYDWfqLSPsQv65ElFQR//x6SX+vrlj12H/8Fs
 EP88gR28QO5PrQkjUARDLFxZYwHKlWCjqA8jv/DCN3sOi97Iflym+s1XAB1nAqNOUBBVgQpIjDo
 sgl1lngYJAT/ica+SUASXUGyihV20gq6ZSwhFbgXdfJjSVNZojMTs/KHMR0JIyBA/N3B57Obanb
 qPl1SJbWdfA4IG+8XCg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180090

The ASM_CLIENT_EVENT_DATA_WRITE_DONE case does not declare any local
variables or require a separate scope, so drop the unnecessary braces.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index fd691004a657..5774c2611197 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -187,10 +187,9 @@ static void event_handler(uint32_t opcode, uint32_t token,
 		break;
 	case ASM_CLIENT_EVENT_CMD_EOS_DONE:
 		break;
-	case ASM_CLIENT_EVENT_DATA_WRITE_DONE: {
+	case ASM_CLIENT_EVENT_DATA_WRITE_DONE:
 		snd_pcm_period_elapsed(substream);
 		break;
-		}
 	case ASM_CLIENT_EVENT_DATA_READ_DONE:
 		snd_pcm_period_elapsed(substream);
 		if (prtd->state == Q6ASM_STREAM_RUNNING)
-- 
2.47.3

