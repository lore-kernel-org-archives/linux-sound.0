Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC34A3E5A33
	for <linux-sound@vger.kernel.org>; Mon, 18 May 2026 09:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779096239; cv=none; b=C5h0L1qJWI/9Ke0eZBlUZ/p+xhXcGjJcUQ+Yspmfp2M5EfDEIFbtgSvtKwKRMTmEnsPIyIAXFWWrpMCyTPQBeUGoLjMkX2N8+AXxlPvm9x64ZBU+NfWd4Spv+4aLPW0d14+luX2J+0zx/Y61YjHByJ96R47NzMmrxslw40wdIqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779096239; c=relaxed/simple;
	bh=RCs85gMYZ1p9MuIk2+VubwPsJIHZd4Qgpqt8dbtEJpo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N3sCai2GBGaJK9yp6WM4l7ZdNbeq+YpHOWFeAMzIg8SvgDHDiQRAtZ769IeQJlfm/BavC+EwiiXk05SaHxuNaCH4FDf1NpAoRzEIlzigWo9MwxUhLo7CQRO4WYssTgyTw0nBPXBauzXQfWbFUyQcuH8ujJ8NLOS12ZXfB+Bxm18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MnyhI2N1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WCwEXlTO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MnyhI2N1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WCwEXlTO"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I868TP2343774
	for <linux-sound@vger.kernel.org>; Mon, 18 May 2026 09:23:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=s/uuIZd9tj7
	QhjDlqlxXE48EZqcvyagv3QTAGMpzuIA=; b=MnyhI2N1cFnaVI0OIWEJRYbrl5D
	vyg/05SnXAb9BXCaEZ/Up0ZBwfOkn/Xyb5ZzMkOmA563fVpJYRhqiyQFi+RM9G7I
	hqpM0GsoV0I4kyE/ZeEhjZRx6caUFUNyezoqRLaGAxrTjQoOAVkc2dhH6aY8Fjzd
	admrMs0awSJRoqrL9AbqPRzq4WiDM54dRr1avmikdvycZh9RZ9GH5muvVBF4q4Uk
	fW3UPcmmGH/DbwNLH6Y4Dn+Jw4fcXtPCfeRsnGp6YXudRkrEB+gb09cxUHmQPiRd
	dZ+nyUntNteX5VFCCNIwRqYZyQPIBnRCJc+M2aQwWD4PPifVqf24C2SWglw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gx6wpdm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 18 May 2026 09:23:56 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5104b861649so96615531cf.1
        for <linux-sound@vger.kernel.org>; Mon, 18 May 2026 02:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779096235; x=1779701035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s/uuIZd9tj7QhjDlqlxXE48EZqcvyagv3QTAGMpzuIA=;
        b=WCwEXlTOb0GMmX22or4eV0qY7WjjxdAARTUPwJXFgQJEXTfAv1UzUKJElfuJpJgyg/
         ZfR2QMKdtdedUrZC8NMPHy5lpCY+l0dcvB79ayop6dIP+v5aZeET+mIDGiDFNrxzhVCV
         /M5/U9vrZrg3v01awoZRXRaklvECOlCzsO+aKwatZmeF4qHbpXcpWiTmV+Vfya3fiQcF
         nxsKKqnVpc03m3A0lwMsx9YhyugrsPKtXuJ9MW3M2iicY5+KESp5msj9PnkCpFfQHROg
         TxN9HMzUoJ5731bdyzVK0R1CQypSJwfNnM7WK546/ofMas9LGCpF0rlg4Kr4QiS87nmr
         U3lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779096235; x=1779701035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s/uuIZd9tj7QhjDlqlxXE48EZqcvyagv3QTAGMpzuIA=;
        b=H3/vpQAU2Gvk/pGBRQ5q6+OenaTe7GmQuV3DCsvFxRTsWNZfaeDpgenKUVdgejNBjr
         2Uhi8ScUVbmFMQFS/6yaIMGA4137oHsw1HElQ3etmWcx8zxuyqyib4MKssftlPDdqIvQ
         Q9hDugbf2hcWkmj4ZN3Xz/YXF6g+xYRsrDa0jnOjWaUyvpwy5u8Pu4lRb736Mz8DLr4N
         /C31rzfyuYkVuEr4Cmoc6k962UTI5jTIVi6qttWu3EtHV92tSRYXlDLk1C3oaELijeO8
         VyDXBaufOGa49G2y5SGIqpjlg/FpWiqKI/fzswG5GS0rLIqRi8hi24ULAD58DwnbqxXH
         gMng==
X-Forwarded-Encrypted: i=1; AFNElJ/kwd4frNrpVZGoj+qfYIJ5FfrVuThTsVx36byKDqLu8LUfGC3HYi7IKL8mvuNtb8tiG0jtU6t2v3ENDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwyM/pcGoC02XBPJmPp6H+rufrXFtxM9Q0uKWHUX0k7WcY/WYYZ
	eQkfs5lHjwb8M/nb/8bW2Dpfkby7azC4rcTmO3tPdJ11m76dMveYnMjX4HkUCLtvwQGpdut6kub
	pTomMoUZR4MJxKYRh+vQbM+MiY0HJdLQX1mfqEYnuTFFrGJvc5umvpxtnvwf9EHc/Bw==
X-Gm-Gg: Acq92OEZs+5IsiVjt8bA5/Lqvl9e3FnljRIUp6yUwy1q0Heu8g7GeQOqUOlhnD7ripM
	rq3r3nRx1nJFZupbDdl+kL8gSnbeGqfZBqDSflvxktbFSBnOKoTnLR829VLzElizQa80ek/f6Vz
	vkkL7T0BC2wDzh7Sh8AB3BaMUHtALbOj2k8l3K2KNXJYqBIcSNtNWnFqn08ALL6XlTT6YOmmw7z
	E+s/w135l7UNPOrxpUueaiZuziGb5AkV3IcMLVwIXcYcgjcHl/+kw4myxaHqRM9G5bFlJ3VGQ7L
	p9vMmTcluyrF5nrUmL7hqLP0ooUHC1wyIgDU7toXj+ls6Db1hxFdvFPHIaiNe8IpdjLTnLoccHH
	k1hTWbun7jHoTbv4QfVJZ/AV5P2DcoH33E2EAezOaPsBR8qpC7uGclz4=
X-Received: by 2002:a05:622a:2514:b0:509:39b5:a97f with SMTP id d75a77b69052e-5165a0a37a6mr197720871cf.29.1779096234941;
        Mon, 18 May 2026 02:23:54 -0700 (PDT)
X-Received: by 2002:a05:622a:2514:b0:509:39b5:a97f with SMTP id d75a77b69052e-5165a0a37a6mr197720721cf.29.1779096234552;
        Mon, 18 May 2026 02:23:54 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe0fecsm33265900f8f.26.2026.05.18.02.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 02:23:53 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: jens.glathe@oldschoolsolutions.biz, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        val@packett.cool, mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Stable@vger.kernel.org
Subject: [PATCH 2/5] ASoC: qcom: q6asm-dai: close stream only when running
Date: Mon, 18 May 2026 09:23:44 +0000
Message-ID: <20260518092347.3446946-3-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: B3R5-AC4xrcUVNOk8PsC_nC6ab-JmsRx
X-Authority-Analysis: v=2.4 cv=f614wuyM c=1 sm=1 tr=0 ts=6a0adaac cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KnWeaZq26ommGgBC8l4A:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: B3R5-AC4xrcUVNOk8PsC_nC6ab-JmsRx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA5MCBTYWx0ZWRfX/FR/kDbsZukx
 p0Zckxt1Rf/pU3KkLz/cbJQp7Wh2yKnCfGQrb9re6kmJgoe3xUMy8aD2NEBwiveze3lf+MsVJrv
 qic95QG56eJeO50Y3kBE9/J+Ikuqfmf+6+8b5f0cWhD8wnmxRaGGYagn4ec6b+q2EgfCX4tBivw
 MBylHXS3ek9M/+0++vBERwg5KeeoqOxOkpWP67pd+2zuM0RBKjAWKYQRzsO8j4nj83R0CYzLtyS
 CjH6bE6CXhqHEvWS55KRJFNvMhXlHmPfAdbEThbrVAbZjWgECy0EMYY5bj7HfH9zGWQiK1bXRp0
 Rbwp5Tikf12DO4qbydcJawbvf/Rz0WjMNdr1mTQodTtSiWkseSU/KFR/duX5WABjNKA+x+qFDcN
 K14A8sKd/Z/dgNawWXJiDNoV4jCKCC9/XquWK6msYMAJ55PhOYu7rd8KL713b4lKV7bQ4mz0RaS
 mEtGyL83eiQiZxUznPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180090

q6asm_dai_close() and q6asm_dai_compr_free() currently issue CMD_CLOSE
whenever prtd->state is non-zero.

After prepare() closes an existing stream, the state is updated to
Q6ASM_STREAM_STOPPED. Since this state is also non-zero, the close and
free paths can send CMD_CLOSE again for a stream that has already been
closed.

Restrict CMD_CLOSE to the Q6ASM_STREAM_RUNNING state so the command is
sent only when the ASM stream is still active.

Fixes: 2a9e92d371db ("ASoC: qdsp6: q6asm: Add q6asm dai driver")
Cc: Stable@vger.kernel.org
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index 56f0d8913904..ef86b5b9a951 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -455,12 +455,12 @@ static int q6asm_dai_close(struct snd_soc_component *component,
 	struct q6asm_dai_rtd *prtd = runtime->private_data;
 
 	if (prtd->audio_client) {
-		if (prtd->state)
+		if (prtd->state == Q6ASM_STREAM_RUNNING) {
 			q6asm_cmd(prtd->audio_client, prtd->stream_id,
 				  CMD_CLOSE);
-
-		q6asm_unmap_memory_regions(substream->stream,
+			q6asm_unmap_memory_regions(substream->stream,
 					   prtd->audio_client);
+		}
 		q6asm_audio_client_free(prtd->audio_client);
 		prtd->audio_client = NULL;
 	}
@@ -670,7 +670,7 @@ static int q6asm_dai_compr_free(struct snd_soc_component *component,
 	struct snd_soc_pcm_runtime *rtd = stream->private_data;
 
 	if (prtd->audio_client) {
-		if (prtd->state) {
+		if (prtd->state == Q6ASM_STREAM_RUNNING) {
 			q6asm_cmd(prtd->audio_client, prtd->stream_id,
 				  CMD_CLOSE);
 			if (prtd->next_track_stream_id) {
@@ -678,11 +678,11 @@ static int q6asm_dai_compr_free(struct snd_soc_component *component,
 					  prtd->next_track_stream_id,
 					  CMD_CLOSE);
 			}
-		}
 
-		snd_dma_free_pages(&prtd->dma_buffer);
-		q6asm_unmap_memory_regions(stream->direction,
+			q6asm_unmap_memory_regions(stream->direction,
 					   prtd->audio_client);
+		}
+		snd_dma_free_pages(&prtd->dma_buffer);
 		q6asm_audio_client_free(prtd->audio_client);
 		prtd->audio_client = NULL;
 	}
-- 
2.47.3

