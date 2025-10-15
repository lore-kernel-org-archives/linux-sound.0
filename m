Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6909123BD06
	for <linux-sound@vger.kernel.org>; Wed, 15 Oct 2025 13:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760534300; cv=none; b=CaCTxqxdiHe6mVlERbD7R+ea944W5QzIPOkUq9F5kN705c4eVRyV28qA5PhhVQGONYApwmcgwyhVbkd4jDMCJxlQB9+G87j6/7bMyVwhtaon5KyCOu3RoanpnpLrixePJkfOp3S9KudZuqtPPObtU3f0uEjOAa3dvr2tJhRAQsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760534300; c=relaxed/simple;
	bh=mHHpksYNvrqCcT9vbu6eHsvNp/9SL9pX3pbcMgnpkWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LrSqlN1F4K/oF8dhNQz4eOBawLEv94rTO2TTM+DXh1TDB808ea6rScpPpU7ZzqbKHs0vjLF91vtx1ZkSPb8RmyZpbDkv7DbvsatMNAQEvzd/llOPZcfqoZH+MyeJbgyilvZ9CUGIJM3AY4POXidfuT3DXS3Wiv1jXmBCPILV7Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YzZAZ7p9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YzZAZ7p9"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FBIwhX004306
	for <linux-sound@vger.kernel.org>; Wed, 15 Oct 2025 13:18:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZT+0rRtvs50
	XRBp1BW4ZCSU4gfhMJjkd8JcHG8nO/pw=; b=YzZAZ7p9QgHqm37k8KIqAqn99ws
	ySimm3XR00UldujnpgUieFIeadi8MbVcERYqYbiERmT1EXkjUn+deWrNFLyQKHND
	nG6ilvXE2r7v0JN/vtPunzzS30Cp1PI8QsbI5D66n0REfwR9RF31gQIArYbVlLl8
	+1oUiPPMZYv7AbJ/jNC8JZRHMuUhn1jS983oE6ImW7zIqFeUU0tBauD+NC4Mpj2p
	1HJrHuQICf94amjB3/7Mie/8m1YfQfJOTMO5euyNEjQ6dtNaA1c5x8+8jShSk1tf
	pSOAcgH6Vwm0CIx5+WEp8FxW/eiilXWWMz78oBV2lzLtwcA0xSag01yCwKA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfa8cj7p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 15 Oct 2025 13:18:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-883feb13e83so3590856385a.1
        for <linux-sound@vger.kernel.org>; Wed, 15 Oct 2025 06:18:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760534296; x=1761139096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZT+0rRtvs50XRBp1BW4ZCSU4gfhMJjkd8JcHG8nO/pw=;
        b=MereP85lapPaKySH8CKehqoqbHKd80H4w6kthOy1pSM5e1xr3dglDF7dv8W0YtRYKs
         UpY0+AM5x6ANoQEkmq9KVUJZ19bpk2yMNjM5ZBuznRswz4Kw8aBQlhpKEB6Sl09WdvHe
         xaDTivo18vCPyzq/wU85zj8IOFiWySF7KUtgudGK3zwgSLB+Sh32xedqs9nATFxU+heP
         GAG5CV9QYyxkas51v4KIJ3kIT/V4VQOgFwoSG/+tnVOhX2S0E/6D84ccdUxQ+h9kwmIz
         S/pZyPngK0pXMFd8J7fsCu12WK8XrWSzyt+kzzeASTZoz+z5RwdgZFeL5BljofrhDX9K
         3caA==
X-Forwarded-Encrypted: i=1; AJvYcCWmE/3eJNDAeTrE9+ri9jEs0xq8USr9b3dO4n0nL2aYV8yZpGFYty3iOqVwiU6faozHtTEm/IRtBd9PeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxveHkkeCJLXECte2wmmeiKMpmCks3w3cXLY9G9vmHYOIZ3ZuuI
	D+z7rj1OUfcT05Thb2l0pgEe8j8O5r5qvL1bnlWfxWlweSvdwRePlpqrZFoReIWmLVAfho9xk9z
	91ZVpXfoOPMGo6U6gP/qDChZEpTGNDdbgz54q3zOypggECKpEB88NRsfT7VsGtZUb/w==
X-Gm-Gg: ASbGnctydowxBb4BMWXysLXM+SgaDGmw/Zai9cDIa8aV/Dib0H6rJ6teG07EznVvIDy
	RsAoVX7Jx+1RHiNRvLT2rdl4/RgjgJjugxK6ZyE4jv10tJU36TY1oN7gHVkaCNquePXvhq15/iN
	9XiZ3KSh/CjU9Yw22YX3WS7tMQEm9KCp1bvmGPgnSluBX2mdQ8/1eewBVGYh/cfuoJiduqpCbSW
	MoFYFbLEjr0bPIk26gLKIwR+vygy0XugeCZcW8Jpoxtf50Q8CeVKHEw+Gr5+HZdCRwVRrxaknYL
	wjxtaGZnNJU+g6rY/asvD1+PEYgMMiMFsIp0cEq/J8QonzErdX9z9w==
X-Received: by 2002:a05:622a:1a9e:b0:4e7:1f73:b40a with SMTP id d75a77b69052e-4e71f73b42emr156480141cf.1.1760534296157;
        Wed, 15 Oct 2025 06:18:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtim+HkRY58yGLvCgiO1qtGySVPyoWgNetwZg54hH/ZzI/xMzFzmKFFqAAZCU5tJGw/TQxUA==
X-Received: by 2002:a05:622a:1a9e:b0:4e7:1f73:b40a with SMTP id d75a77b69052e-4e71f73b42emr156479521cf.1.1760534295614;
        Wed, 15 Oct 2025 06:18:15 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fc155143fsm262081245e9.11.2025.10.15.06.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 06:18:15 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org, m.facchin@arduino.cc,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 9/9] ASoC: qcom: q6asm: set runtime correctly for each stream
Date: Wed, 15 Oct 2025 14:17:39 +0100
Message-ID: <20251015131740.340258-10-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: _vUz43-m-D6wYey_hPRwAJanLCHOdFyR
X-Proofpoint-ORIG-GUID: _vUz43-m-D6wYey_hPRwAJanLCHOdFyR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNyBTYWx0ZWRfX7Zh7CMqTaN1Y
 RcpVF+imhsCmDosep3iainUxnLQw70jZ7T+izXJoHp8KYrSJ4LB6VU1PTUyXtdel7gf3LNWRrHC
 oV21cQ73zMnBMKBTMn0ZV64KRebl2rLzkrosjsOuIbNSP5hvHhlDaitrD8Hj9q2yaQwUozOZdVs
 YbH5qObW+Mx6caR2Kv8jOeOnXs23hkBmj5ctdF13AvHva64qma8TFAov9jcL3q0inr2KLMd13+L
 jm4FRgmHvX+Cs0n6NoOR33GWUiEALob4zhxSQXCeBcOttefKe+G3Jf6/lEQ1Ok9iFatXkKnK5qi
 zfObnajRKe+I7FEO63ml8O48ziOjjm1J+0AgvmWHyc+RXB9rFi1uDAr5dULw1W2pplctMC/cdrO
 AYq6ZmVL0fyPlfKqPOD1NZy0sJwrBw==
X-Authority-Analysis: v=2.4 cv=JLw2csKb c=1 sm=1 tr=0 ts=68ef9f19 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=KIUBPGGZ3vVIRF5Z0fMA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110017

Both capture and playback can have different runtimes, so set them
accordingly.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index c2a33d6a0827..97256313c01a 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -433,10 +433,13 @@ static int q6asm_dai_open(struct snd_soc_component *component,
 
 	runtime->private_data = prtd;
 
-	snd_soc_set_runtime_hwparams(substream, &q6asm_dai_hardware_playback);
-
-	runtime->dma_bytes = q6asm_dai_hardware_playback.buffer_bytes_max;
-
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		snd_soc_set_runtime_hwparams(substream, &q6asm_dai_hardware_playback);
+		runtime->dma_bytes = q6asm_dai_hardware_playback.buffer_bytes_max;
+	} else {
+		snd_soc_set_runtime_hwparams(substream, &q6asm_dai_hardware_capture);
+		runtime->dma_bytes = q6asm_dai_hardware_capture.buffer_bytes_max;
+	}
 
 	if (pdata->sid < 0)
 		prtd->phys = substream->dma_buffer.addr;
-- 
2.51.0

