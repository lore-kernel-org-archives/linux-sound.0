Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3BA41F4169
	for <linux-sound@vger.kernel.org>; Wed, 15 Oct 2025 13:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760534296; cv=none; b=MF/9tmOYnXE4kp2R+A74Uw4T8gtAFX13ACAVmOVsExQtMGlJohI5hZbsYM4EHjep2FoHLFf//2hBfcAMo9jiAebS/RNye7TVdz4TWo/VpfhnbhZWf/1VYARHAKUwDKSEkgB1YshjfF4PZWrS/yACgrqsDfaGmXQHcyElm4RZCTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760534296; c=relaxed/simple;
	bh=FciMJV9TB+OlUWS0wBBXljHH3OORGyEACeJ2UfDr5yA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=db//EZvrULSdQHdoh1uZp0ctBRhkhixMuZeSwR+7BFQWi35FqhCHNnh9EbTfSCPBxpf4O1W2P/O1YhHHarMfZLwYJO1tdXRT3qiEN6Kt3RUOGrFeFeV9gvhmsKnVPUmUSKvpJXP7y8Q5TZio9no61F+3XeZHnLKOBXk/m1lCIdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TfVNaGvx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TfVNaGvx"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FAbxVr015160
	for <linux-sound@vger.kernel.org>; Wed, 15 Oct 2025 13:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qHkE+bKT/J8
	nbQ5S5gGHutvtvukdRZt0lHpKcZkg+54=; b=TfVNaGvxxRSKVcbpPC/Wp1JJJec
	YlsdhhhsEh5aeuH/7/kzZN0kVr9ULIK3W0b3ZuqtLUY+wazTc3YN6YtUTFITAP55
	c5Bl9XBUJ3Mb2xX+E0tj2YKVMAypXQ6+6J6Gaj0Hnzy3I2sFRDJns1D+nWa/h7XQ
	qRUKvF8YMkI3j/eKwidoNIc2ZkhCDdBvuCREBIzUxR3wLafIMmCyuOEOGQEhP/bt
	F+4uxX/hpKRld93fh4EfiNd8coNXHUZci/HtUzLhrGKip02u16sJqrkP5o/yOAxT
	1AN2wy1nfOCFLR6avE8THRn23OvklOjPMwq4T77rzG0Xr1DqTNirboY/2MQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfbj4hbp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 15 Oct 2025 13:18:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-887c8b564ffso298108585a.0
        for <linux-sound@vger.kernel.org>; Wed, 15 Oct 2025 06:18:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760534291; x=1761139091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qHkE+bKT/J8nbQ5S5gGHutvtvukdRZt0lHpKcZkg+54=;
        b=A1rY9zMIKtzUzAKzCzqG/LUGXA95rNWz6NW9KHZ+EOvaxZkzJfKhhWjlyHWfNTrXNy
         XgOA7cWWeKz/8fnUyZ2jiFjhFolvaleBj8onYL5iXKV3wPIUR8awxicTSYtJWZ7j76NN
         8Dhl0rDmmqWqqO7mT6YsRzk35jX08Q+a6G9EGtcyBEAt+BhSBltlHyc5vBLuhvmwvQ67
         g75BESi5+yBfhfNxxV0bVsSdNJrU6x/qdVEbxSHN/GRB+BrcXwjwgWg6OQgP1B7P+kwT
         IMnxq98v4/5BgkP5Zu6RMz2SrWVsqwJx0ZMJ45Wxn6yjtPh0aT0qWhveprWb/DfFmhCj
         rvZA==
X-Forwarded-Encrypted: i=1; AJvYcCXBTFdBdS3Ru0+TouilpKP74Z6OhLD6lCf2DIvUgpJD36u2UYl3qpMQYp/XqqZvS4ii7eJAc5XO3AoMYw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzT+9EcGEUUBD/EAbOE2g5HVENiN77DffCAp1qy6yyfV15b8Ezz
	WjrdzLo1v5aO5U7iv+tCVx419XT4BWpxPvr4uYEBivRwhistsW+wqqWINkIdO9cWryB26Hwwl+Q
	N+T4RcRf/8T+KmfY8t5xE5leXrPRlXMZbEvvrOL39ygWzyWeqaC4lXeTk/LFXXB5Qeg==
X-Gm-Gg: ASbGnctOl6kVV3M/N2NKNDOKv1+TkDnXvLkawyULeOQ2665rDIauvSpUuw3Z5Gb7GfJ
	7sjlYHsz3UGc+C8tEGaecEicmr+qDPJ8Pcwd55pbBriYAF1kqoX2WN3K537Mb4ErdVAUa6/yp7U
	6ezCocCSdoyEft+4Wz/O5VfYLywBKVCo6GUjr4lwAQG1wjNmLvkVDfB4DJJNiFVREPnH4wwOvRW
	7GtwD1O5RSnp/LJYXUvlSSpptUI7jWfJwjdERtpZr7Ezqof5Bx85UiWedm3szYygvQxZCuqvK/A
	YdpHb3hnV40BcXtQd2wd45LqPbIMyzkYTlgYo7p1eNNhSLCcW56kGw==
X-Received: by 2002:ac8:5a45:0:b0:4e6:eaa9:8a2a with SMTP id d75a77b69052e-4e890defe64mr794881cf.15.1760534291276;
        Wed, 15 Oct 2025 06:18:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYMWisWH0+ZGB14jA4jsreCXonf5bTEm2tvxmjYdPJwPg9hoSqnxhGbMTLY6h3qG2Avbm8MQ==
X-Received: by 2002:ac8:5a45:0:b0:4e6:eaa9:8a2a with SMTP id d75a77b69052e-4e890defe64mr794491cf.15.1760534290799;
        Wed, 15 Oct 2025 06:18:10 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fc155143fsm262081245e9.11.2025.10.15.06.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 06:18:10 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org, m.facchin@arduino.cc,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Stable@vger.kernel.org
Subject: [PATCH 4/9] ASoC: qcom: q6asm-dai: perform correct state check before closing
Date: Wed, 15 Oct 2025 14:17:34 +0100
Message-ID: <20251015131740.340258-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015131740.340258-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251015131740.340258-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX2ERoNcXH0DwP
 Jc4s4ZxlTGLOhljBjrqTv0kWxsXwxIHnirVgR+K+vC76pYBEKuyEFYbhSAH79jxHuaDnVv2Kh7z
 RbIv6LyC8hzjSNkYWse59fX4oGamk7Sx3+cqI4yfdSQIwGRZ3MFBD4ZXaUQ+1Fel+4UMgJXIC9V
 8+TAMd7adrDMLbj8ZnV7dY/DV4Jw4fkUIrlBuDHGEVZ2cXxyxRyEB75XBcoTkFcgVxJCv7F40a4
 AUgGpN5x8FFXybvUXQlaS3Qk5xGCV1OcoMXUbLaxksiMZfAFXt8x32Ew8loeQj/uq2K/wirnu5F
 gOyh+oe+zmQMSpQlHc/YotwMTaf+3qDJ/EPzexPH0V8GU5TTvxpZ7ffNS0N0EzGBtKquw0hk1JY
 3HDpP0xNeOPp6rCdATYvIBDXOTYNsw==
X-Proofpoint-ORIG-GUID: SPvMUAEigeGVMZ-ldo0_nu-9MQXt1rFq
X-Authority-Analysis: v=2.4 cv=bodBxUai c=1 sm=1 tr=0 ts=68ef9f14 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=MOmvoJmQv4oe-d1MVI8A:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: SPvMUAEigeGVMZ-ldo0_nu-9MQXt1rFq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110018

Do not stop a q6asm stream if its not started, this can result in
unnecessary dsp command which will timeout anyway something like below:

q6asm-dai ab00000.remoteproc:glink-edge:apr:service@7:dais: CMD 10bcd timeout

Fix this by correctly checking the state.

Fixes: 2a9e92d371db ("ASoC: qdsp6: q6asm: Add q6asm dai driver")
Cc: <Stable@vger.kernel.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index e8129510a734..0eae8c6e42b8 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -233,13 +233,14 @@ static int q6asm_dai_prepare(struct snd_soc_component *component,
 	prtd->pcm_count = snd_pcm_lib_period_bytes(substream);
 	prtd->pcm_irq_pos = 0;
 	/* rate and channels are sent to audio driver */
-	if (prtd->state) {
+	if (prtd->state == Q6ASM_STREAM_RUNNING) {
 		/* clear the previous setup if any  */
 		q6asm_cmd(prtd->audio_client, prtd->stream_id, CMD_CLOSE);
 		q6asm_unmap_memory_regions(substream->stream,
 					   prtd->audio_client);
 		q6routing_stream_close(soc_prtd->dai_link->id,
 					 substream->stream);
+		prtd->state = Q6ASM_STREAM_STOPPED;
 	}
 
 	ret = q6asm_map_memory_regions(substream->stream, prtd->audio_client,
-- 
2.51.0

