Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114483E5561
	for <linux-sound@vger.kernel.org>; Mon, 18 May 2026 09:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779096239; cv=none; b=ZkYeWgsOi7+PopfDQ5XmFX2dw3Tdqu5pQiVfbwwiPbyRVhkVQi+nu9Nad2NGXB8tSP5n14yENH6UPwHTEKELMmVdmHO9CJrXvsneWvHJDKyVkYzvspbM1yKsSTJSvZGyA2lrv3tRQtzHMINcwvBkua7WvBkX0jg8KBDOz92Ungw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779096239; c=relaxed/simple;
	bh=46oO58C6qyz+oSF3AkdKCK/hAYNIkihn1nqY49j8PJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P/EV5+Vth/FYxs7I7eSBluX9V9fM1xfQR1AEhBo3KGJXGFlFRxT++pHKed9NL1B7PqBTSvF2OAh6iLfMEqF4PYTwoT37hVQcjMk+Cq274ZLYZ1oTqQO4SnMU4IjCfYiveaOdiXs3fdRFeuO+bqgicUqSd9T63hx4N0etveaFB3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UbMrueYk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CrKqB8Am; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UbMrueYk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CrKqB8Am"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I7agDg1462932
	for <linux-sound@vger.kernel.org>; Mon, 18 May 2026 09:23:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=eF0aOw/ne8U
	OJ7hbYAxIT1oxXliCf3HbLnmolxKozDc=; b=UbMrueYkgjyXRAPARDJN9oW3Hip
	DoLN6N7sThhrT1fUs1HFTl7ECWgUpmXWdBt6Wx69gAE/TqzwBa10Y89V010+aRfg
	IlsVDdo0qlkBakE9U5Gmkyl0/pf3KtqxD1GISta05W31mxE0fv9/YTrmq9pBR2Mt
	aYBnEKaTFuTMcXK3IL3SB85z1elno2zQiBEQySVSYmFuRMviIgi4V6hZx5AmfIFU
	gTOkqDDd/KCKwqqef+46fuvmEhl9CBA8GjLuTuX/fVJK4YUBjPDeVWM1b/JqFF0B
	Q7/3kXb7Pp1m0m7Uzq11IgGbWDOQSyQFq9utqtTRO9TvHkfD+PlBjZUXADw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h0g5p6e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 18 May 2026 09:23:57 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-514d2b22e7fso41635091cf.0
        for <linux-sound@vger.kernel.org>; Mon, 18 May 2026 02:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779096236; x=1779701036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eF0aOw/ne8UOJ7hbYAxIT1oxXliCf3HbLnmolxKozDc=;
        b=CrKqB8AmBsUmHbC8cMkGb9Y3TWZMutpcz8HNvh/K3B4i+UiOo6SGMWDIPfjnHefWdP
         uxY0MH40cI1mOrN2yvoYhpxwFDDfLV608lRN8TIGllM58a+aFo2cai0e1T9tfpC4SMIy
         KvphCC5OOVrpBkC92N70lEIDFxgIdd+iiNh5aCUa9abTgvYLazXgLaaEaq//43trUaG8
         CCIxLRlnPfDq/5gUFZ9FmBuyUbrCG5y9VHZ/XsAYYI7KlVbm0G+PV9G1KVPd33nAf3Wx
         c1nMxI8ZFgDoxs6axOQo1pHoUOC9lWCyJLc7x8lTyWxbOuqUhXDOQWEbsAZt+hz8Hymb
         rCSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779096236; x=1779701036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eF0aOw/ne8UOJ7hbYAxIT1oxXliCf3HbLnmolxKozDc=;
        b=jUWrDOKU3qQ+CLkG5DUTLze4JMsxweE8XNF2OsRi3zwDSXf1d6yO5GnrpwWYJQPCiT
         ifwXpbWm/9Obl59iiIpQLrs51H3fqWMBDmLig7uNnImAWzN3hyfnrGGdHOnqGBWJ977O
         spQEhpceVrjwl8vksh6uKY+h0yPnTtmfchI+Q6Dc+b3dtYaU+2ibKXKwE9UdGDwLLmmT
         wMO9H9EtJdduBrTcC08xDmoPDGx1mrvWsYlE0Wt5c2n5D1UduetGbsiNm83U7d2Bk+0V
         qd1De3EAqf5jxfhohkyIoIW+9WPGarygR3MxOCm75bRclr0ZUZY/dgZ0hXlfUgPzjQov
         TqCQ==
X-Forwarded-Encrypted: i=1; AFNElJ+3QF5oNva0MjnAXo+0/yyiwH1aTAsojsqObvyE44eX+chF1e2e2cfOpCFeXBSeLH3ZQyCYMRQN/R3ZtA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxA+yACuM+sxLkfw8wDG0qUXYpEj6LqKlLbcHp8DQrlQoE9S4VP
	bn0rUR8HFb7qpI56VDu1m593RRXoHsQoAqJut3tG7CfwM3vslxBF9t4uEk6m37q/bZxJDZDUKKy
	cU3dvs2kR9bQGQulyoZe73PTaWEWaclINEVet8GXDPqpaPphTHSimSZC+zqW+//JkWw==
X-Gm-Gg: Acq92OHLRoTRGiTgpTjs4a3nYL3K/okCZfvNBTYZOYsm/zXi22HkeNH5NdBcfTdijzc
	FVdMsTe7WV3Tl8m1kiEmiY/Y2I8Sm+gkwd8UIfa6pUu+vlgMbxuf7y0tw0cXlc/fUXenHRkWHy2
	zb102tGh69KCaJa+bHXsJaWqT5utvcuoAVswr2KAt9MxleEdGqbU0HsLW0yVPiDFOd7JPbd3yTO
	YRre03K9mtjiQ6BkSO5wpN44EOnplnutrf8/RZy9nKzeo8+SBqElT3vIrSr9+JClZa2bylB0aY+
	lWc/wmf0emXJQGAuYKORYB/sJoSUZ9FCQJL5LRJCfbQ0apwsvhp+kSwWLAYMZrX+4Bdp9AK+0E/
	CpS421eXU8cC3crWI4yi80RXSufB4m1DMCWFvdgNfnQmjXm7Wr/hD/zHsxegWLes5mw==
X-Received: by 2002:a05:622a:430f:b0:50f:ae24:ecdb with SMTP id d75a77b69052e-5165a276492mr152146991cf.37.1779096236359;
        Mon, 18 May 2026 02:23:56 -0700 (PDT)
X-Received: by 2002:a05:622a:430f:b0:50f:ae24:ecdb with SMTP id d75a77b69052e-5165a276492mr152146761cf.37.1779096235788;
        Mon, 18 May 2026 02:23:55 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe0fecsm33265900f8f.26.2026.05.18.02.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 02:23:55 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: jens.glathe@oldschoolsolutions.biz, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        val@packett.cool, mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Stable@vger.kernel.org
Subject: [PATCH 3/5] ASoC: qcom: q6asm-dai: fix error handling in prepare and set_params
Date: Mon, 18 May 2026 09:23:45 +0000
Message-ID: <20260518092347.3446946-4-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA5MCBTYWx0ZWRfX7s9NbQagRxEt
 uzzRjdkDLD19WBz6gccr73Kr/WMdUS52EpKh1iTIxtq2RY9BMCJxRYi8YY1XNW3hkit5k5gMIRF
 2SQ4aocVjwWqHLNTeLA9f5cGvNcA8Pvls0npi9Ia8MO3N/b4l7LKRX+CdeUij4m09BLlsoJxtps
 WQ9+C3/lwnrLXt8RTuCc/7CJHD+iRXJAmpG7Tzsxnb/rAbZklKG7IjOPAeURCRh6kNtyLyXWH7c
 TLt6xihxf3ajP2eNqzH4VeT0xsHstxZHr1/JuqQ0ixiiWdtFsXGPY99CzGfM7DEVZNjJWiyLWw5
 lgrv4lPuYKctPi4z/AmnUEuIfAvyVJSqyPPWmoYuIwLlY/PxOHdL4HDdysa1m9V4UsIfa96Z0YZ
 Q+zQYjui7PprEaL+20ZCxndLc2t/hEZQY2Qjv935xlLATIaLSuH7ayk1n74m722frTR+rdlWABC
 HHM65zy6T5Fc0j90Nvw==
X-Authority-Analysis: v=2.4 cv=W7gIkxWk c=1 sm=1 tr=0 ts=6a0adaad cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=D1n_lw8EissL0yZ26mEA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: xW_C56yecf9ds1C4UuIZL4tBtsjp5d2A
X-Proofpoint-ORIG-GUID: xW_C56yecf9ds1C4UuIZL4tBtsjp5d2A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180090

Fix error handling in q6asm_dai_compr_set_params() and q6asm_dai_prepare()
for both CMD_CLOSE and q6asm_unmap_memory_regions().

In both the functions, we are doing q6asm_audio_client_free in failure
cases, which means if prepare or set_params fail, we can never recover.
Now open and close are done in respective dai_open/close functions.

Fixes: 2a9e92d371db ("ASoC: qdsp6: q6asm: Add q6asm dai driver")
Cc: Stable@vger.kernel.org
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index ef86b5b9a951..fd691004a657 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -226,9 +226,19 @@ static int q6asm_dai_prepare(struct snd_soc_component *component,
 	/* rate and channels are sent to audio driver */
 	if (prtd->state == Q6ASM_STREAM_RUNNING) {
 		/* clear the previous setup if any  */
-		q6asm_cmd(prtd->audio_client, prtd->stream_id, CMD_CLOSE);
-		q6asm_unmap_memory_regions(substream->stream,
-					   prtd->audio_client);
+		ret = q6asm_cmd(prtd->audio_client, prtd->stream_id, CMD_CLOSE);
+		if (ret < 0) {
+			dev_err(dev, "Failed to close q6asm stream %d\n", prtd->stream_id);
+			return ret;
+		}
+
+		ret = q6asm_unmap_memory_regions(substream->stream, prtd->audio_client);
+		if (ret < 0) {
+			dev_err(dev, "Failed to unmap memory regions for q6asm stream %d\n",
+				prtd->stream_id);
+			return ret;
+		}
+
 		q6routing_stream_close(soc_prtd->dai_link->id,
 					 substream->stream);
 		prtd->state = Q6ASM_STREAM_STOPPED;
@@ -296,8 +306,6 @@ static int q6asm_dai_prepare(struct snd_soc_component *component,
 	q6asm_cmd(prtd->audio_client, prtd->stream_id,  CMD_CLOSE);
 open_err:
 	q6asm_unmap_memory_regions(substream->stream, prtd->audio_client);
-	q6asm_audio_client_free(prtd->audio_client);
-	prtd->audio_client = NULL;
 
 	return ret;
 }
@@ -912,7 +920,7 @@ static int q6asm_dai_compr_set_params(struct snd_soc_component *component,
 			      prtd->session_id, dir);
 	if (ret) {
 		dev_err(dev, "Stream reg failed ret:%d\n", ret);
-		goto q6_err;
+		goto routing_err;
 	}
 
 	ret = __q6asm_dai_compr_set_codec_params(component, stream,
@@ -938,11 +946,11 @@ static int q6asm_dai_compr_set_params(struct snd_soc_component *component,
 	return 0;
 
 q6_err:
+	q6routing_stream_close(rtd->dai_link->id, dir);
+routing_err:
 	q6asm_cmd(prtd->audio_client, prtd->stream_id, CMD_CLOSE);
 
 open_err:
-	q6asm_audio_client_free(prtd->audio_client);
-	prtd->audio_client = NULL;
 	return ret;
 }
 
-- 
2.47.3

