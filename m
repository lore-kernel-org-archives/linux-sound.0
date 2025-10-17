Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0CB2C21E8
	for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 08:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760691402; cv=none; b=D4IktntKsW7G730l4vuCgelO6/uR5HYSn4ofpF0hzzuHiNVGljAJ7ytdd7w3hDdbX1uDQAy4AVO4fBbtiDUzUJeYB+HiaLbUhvBT5kTHPIKwXzAoxHw4kPy2Afqc/nPJEfuonrylgolu6sO4YFjp1icGsuPFyfzk7FPL7yVGe0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760691402; c=relaxed/simple;
	bh=P19330s2rEI12H+hFUT0x7xmbf//n4xsYyxteQ0dyh0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UFpG8dBS0JFDVTGi5g698E0XFS7Ik9T6u0y4XicnTOs9gLQHzxrzijBlUc2b70kDZU/8cHBs+1BUQ+8h2Yg7aCmPP9SaBI5rrdtOuIklln6+TOGmL63xEBV1NxUlT3jOfSmibFrm7NyfKVe6k1JQjB28e3HrWXGy63M9JO6IzEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=abupiNi+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="abupiNi+"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59H7sYmD006080
	for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 08:56:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Vp8Tre/TUw7
	lskgMkX0Rr2AnYlSGvl2YlZcKg+3d5Ok=; b=abupiNi+KfcKfFL9GAyfvYz7rfd
	uaS2UxF9ngg9P/2nIS/qYCvoG5pFP9quKmtM37Xk4E4FLdcbOwJJ5cSs5bWTY/An
	MuX02IcpO/NHQ4LIpw19KGbwIh6PN+YFZ4JzYSpOVrNRk+GSKXHfU+mw7goD6fjR
	2lVVeBu4Rs6tKMAc6JgWsYNEoPalaqzp4y58NMHk8wlbjxm8Dg9gmIcpCpqJZnCA
	LobEtxDeW5rloLsO0p9FSfkCYxmHUnTQoxNqBeB0RfrxyxIJvCxsLipS1RkoUuC2
	RSwYaEI7kqk4WKzTm/GNSxjiSHG0bTail0Kdn/w2yD+FoPHgCQL54z22viQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49s6mwwvp3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 08:56:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-84a3a7ac082so552311885a.2
        for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 01:56:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760691398; x=1761296198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vp8Tre/TUw7lskgMkX0Rr2AnYlSGvl2YlZcKg+3d5Ok=;
        b=DZe7MN5WBxJBKBTjBeOHtUy7yHLBFdUrN06LTjRqkAtSf8ZQCNFETxMt0srPsudXyA
         Pu2Uvx1dzz4q/Q3+hlDw2068cN3ue/LNeYxHLkuZjLpQPbBFESdB28Jdv8b85r+V1Gvk
         GuCn+iHuB51c5vbnWDRGzNYQ60uC4CJ61Sl1JCSrXDXPWyia6WWvTktUsBkpzKScpmik
         VBvyyzuMiBmH72xbA/MwxxTCw7SIwdwXw01J08WBLSwTrcy5WMDqs2lzj/WxFCmv0QPx
         pW8Sdyali/pdxWsl1SawBeCEiMyJlosyYWtXeUhjrVooQIiKUSA9aums/GWXFwDspPdk
         1ftA==
X-Forwarded-Encrypted: i=1; AJvYcCUkw70YqVpIYzXAXa4P11OGlDs0riPxV/F8yKaZun7hcXfH+tFhs3sLT2WVOrql+eArI87aH2Hkob1Ttg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSbqZIYucI3uhFutSo129IPNEq6jJ+FrSTLsa1HengsePOwfrJ
	KOyO7u6kEhCjF8wcIATJBHwguG7Zwoathc83dmZk4rPisyj8DAKo5H7rG/oENXWgmrg92jOypHS
	Xr6jocc2T5qiorVDlexXDjKar1MDcwF6ue2d5g5FVBUWiHwSlIOXma41sV0h3MMuARQ==
X-Gm-Gg: ASbGncvB/KaJDHFdkhuvmTgUrOLBmOctHNU5MMej1y0m2aTxmBa86CiaJBEkUcNtPOi
	+WQ5JAlVeo+sEagJA3bpJR3llgtRcZ5B9NlaXnt2T55RsN+zkbS9mGnVRZdvdD3pyWvfg+mtLLT
	gWQigc0nnKawsMkiWQyG8k6Tpf7kXmjtbcc+WNBAQGR+dqeaGgTagPUTdNfmRn7XOMA3F4ZEFJD
	7ueDRPaNEzQZl+wtXU/wWXeIwZh1YBogstQf7wBXB6GaKtH8E1UX1Yoz/dEgdK2H3epIwM6SBPI
	1gj625iAHEkCv4RdFJt4o8QvpGqC4nH25+jaQP7Cw8Uh7gA170UxE+eNtT0VTZH7kQdDUjbrKvQ
	onyqm7J9uAFwx
X-Received: by 2002:a05:622a:14f:b0:4e8:91df:63bd with SMTP id d75a77b69052e-4e89d076cddmr41100541cf.0.1760691398293;
        Fri, 17 Oct 2025 01:56:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6gPcL0Z+5GM2WlrbbQ7u4fSCPPFGZINJjyo6aTt08/qvGlm1JGSXEJpXOHTxKsT9HVs4i3g==
X-Received: by 2002:a05:622a:14f:b0:4e8:91df:63bd with SMTP id d75a77b69052e-4e89d076cddmr41100391cf.0.1760691397817;
        Fri, 17 Oct 2025 01:56:37 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4711444d919sm70764985e9.14.2025.10.17.01.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 01:56:37 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 12/12] ASoC: qcom: q6asm: Use guard() for spin locks
Date: Fri, 17 Oct 2025 09:53:07 +0100
Message-ID: <20251017085307.4325-13-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDA4MyBTYWx0ZWRfX3l4Pv7XGW1oX
 g00tcHhW2XklFtqBZorfsIPvSgiZmE+a0yba81+/ufE8nJKcMX4tHzXU7ig6L/tjmAzb4OmGahm
 Egsz/7n2688an1sTTfKQVwNmVW6e2ETky2t0G5CQdgeo7F3gEHqq67PnL5Y/SSA6CazTx1FyFYI
 TrguiqR9u3Ybm/IqUkXv4zH/JFfDCd8i6XDUEryiN02O/NAhhw1G0hNY7rSB203nq2/EM+bEOTW
 C3yDCfywcfJYIF2vqhcWNVCgytaCSIwXzNaylX7jNNZ3fGwZIN3YA6TO7ZEcJNFwqWoEzjkfEF4
 75UjQvOIfoOPBHKEwG5cQRMo+6LtwK1FBYTZRTC61VDnVyw0UCsliMEYnvaLaOQF9HINPT+3Z/L
 RO9g45XGhjLkgZYkWWNSvAJj68nFwg==
X-Authority-Analysis: v=2.4 cv=Fr4IPmrq c=1 sm=1 tr=0 ts=68f204c7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=C-aEvXguSqPNF6A64mIA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: Dktxm-dqTFdJTJ9GjV2qtYZNs7_M3eCf
X-Proofpoint-ORIG-GUID: Dktxm-dqTFdJTJ9GjV2qtYZNs7_M3eCf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130083

Clean up the code using guard() for spin locks.

No functional changes, just cleanup.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6asm.c | 21 +++++----------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm.c b/sound/soc/qcom/qdsp6/q6asm.c
index 366fe8a8387f..7c9d1494e8b9 100644
--- a/sound/soc/qcom/qdsp6/q6asm.c
+++ b/sound/soc/qcom/qdsp6/q6asm.c
@@ -569,9 +569,8 @@ static struct audio_client *q6asm_get_audio_client(struct q6asm *a,
 						   int session_id)
 {
 	struct audio_client *ac = NULL;
-	unsigned long flags;
 
-	spin_lock_irqsave(&a->slock, flags);
+	guard(spinlock_irqsave)(&a->slock);
 	if ((session_id <= 0) || (session_id > MAX_SESSIONS)) {
 		dev_err(a->dev, "invalid session: %d\n", session_id);
 		goto err;
@@ -586,7 +585,6 @@ static struct audio_client *q6asm_get_audio_client(struct q6asm *a,
 	ac = a->session[session_id];
 	kref_get(&ac->refcount);
 err:
-	spin_unlock_irqrestore(&a->slock, flags);
 	return ac;
 }
 
@@ -666,15 +664,13 @@ static int32_t q6asm_stream_callback(struct apr_device *adev,
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
@@ -685,24 +681,21 @@ static int32_t q6asm_stream_callback(struct apr_device *adev,
 			    upper_32_bits(phys) != result->status) {
 				dev_err(ac->dev, "Expected addr %pa\n",
 					&port->buf[token].phys);
-				spin_unlock_irqrestore(&ac->lock, flags);
 				ret = -EINVAL;
 				goto done;
 			}
-			spin_unlock_irqrestore(&ac->lock, flags);
+			atomic_set(&port->hw_ptr, token + 1);
 		}
 		break;
 	case ASM_DATA_EVENT_READ_DONE_V2:
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
@@ -715,11 +708,9 @@ static int32_t q6asm_stream_callback(struct apr_device *adev,
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
@@ -1544,14 +1535,12 @@ EXPORT_SYMBOL_GPL(q6asm_write_async);
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

