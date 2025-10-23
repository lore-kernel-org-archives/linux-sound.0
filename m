Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED4030CD9A
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 10:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761215171; cv=none; b=ThGM/7Osp6qigDy+qFJWFi8rMvyhhBRuzrKpKV7eD+GX9WzqcbJKf+o5bBEiRZMmmpD82sXPtril4u9XL8FKr2o7yOLibQAvT44qkxjX4N7mEEouDWeBYhl3cgVG9TheMlkoD1inUfOZiAVq2KAvXeluNRRm6pimCQgSdFZBKEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761215171; c=relaxed/simple;
	bh=Ho+pHLNPuBGTxEcdOpWIcJ1rAWSMMJmSaq1j+jlK1u0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b88mtR4MA29m/cqfriJ2CUaZPA/NiqxZr1aAVCI1DE9riv33ESQXvR+OIzgSChFr6Oae29kIz+KXI6uNYvMocOfz//4zXRzN5JWmZClZvyaPywb4od6APJnw6QE8h8HE7X/OZCGSYGa2Nm5Fn/QE9r6vOPsnypsJy0hW8Urf5H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Iomc0Os7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Iomc0Os7"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N8GQk6018500
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 10:26:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yorz58q4zez
	HFzpZuHNhxtsCwlML/Ho348mBn54m9pA=; b=Iomc0Os75q3z84ngyHy02jYDMWY
	J+etAGqAlzSByhiyUGtskPKC7LSpUAgf8jUppx1xARPj9QzjP9Y64XgF4rqpZMc0
	8Ha8OyePQrTX9xKK2Ynq3tHXP3UiRgz1LuTEa2tEV89XpehX1Ap3TZsLcmoH+fbG
	KWOWQihmH8moMr811ecq3R8bPOaitCjTZvF1pUFSwxc88SpOAKNk+9CpYU5AFIpr
	JdrGrGukEv8IiYEmBTF2LMcqDMkS2lStcT2zP33AeumjSHzlAJl5MRsXws3zGXuK
	6biDobV3xlaxcdskvV01qpk6YnRAg/TnL6cR1q0cJxJNB+Nfyk3V+Mxj7RA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y67qhyx5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 10:26:08 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e89ed6e110so17803091cf.1
        for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 03:26:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761215167; x=1761819967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yorz58q4zezHFzpZuHNhxtsCwlML/Ho348mBn54m9pA=;
        b=Oght2q1tHtmyPae5Exd30KGgX/KcbW2wY+teFjz5vSAsoEQZwcgzmeQ2gouYW25eLH
         wMe0/nGpsceWWKUhC9Te72ClMFfHbWcGI2Lbw1rYYrZ8FP39VQ8QX+72pS+gjNg4wcvp
         wo/1pVFCeIDWhyhLBf4xZ4JKiUrjv/hrifIYTH19K+W7+x+3q1zUaCsG7WkNOCvc1cKV
         CS7DbxmZVEe29FO2ujB2XgDVGJ21F9MMMGva//brKVHAZZLz+Z+//eN8heEdFr4rDZHu
         f/dAM7lQyZMQkFqAvTGQC8TE4mvVVnteD7lUSe4+1QcZPt4RhILvb2+97b/gXY1v8im8
         oMTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgsyDEuGMdwrXn+546kFkx7YwNQESsyisG9k+OLPmJZqWpGwoWeE09O1OuY2X2AjBlsAqV+J+2udP9dQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw71nUOEuXXexPdRxQrOyhLvR1XdTTSB35BjPC7s4cKsUV6m8Mw
	qkT+O90WHr0pLyUQM/Oof0fkw0vFHMm0k/YiGm1FK+KK407oxH/1bBWY4WKjUNU4A4EKpVKY6OU
	WLP5YEiDt1fv9Rmpt3UjeMyiz5HbcgaGSGZ8A8FSrr8ePGnWkfpCntcV2ErQr2HVaTA==
X-Gm-Gg: ASbGncuN7mJro5CA5iV5i30FliSPse1Hxtj+Y0T+fC34AUm458/fDeZ4jEJjc6ZmgCf
	+Mn/Kon4YV6cyaQ2UawpEUOpwgjN2kttPGblPILlLggDdBVsTH+PrYJfs+i4VP6OXu53YCJDUiy
	TXaHaqabHrlriAej9c4Uc64jNJi9itsZOs5MMZ+tf8eZ6tiLiViz7yJbjyZRD1pCRB6AJPdLLwg
	yQCL8ywpzigpEsc2BRm9C94whusEY84ptkJGA8ok7Nd1G4wDoI+LIgiZblLBkVZ/Gns3QrCrNvI
	FYWJiuF0etYKwi3gPQ/Ut5YA3oP/FAM3dK3AZ/I6keCOlCqc5ZGctYPB53RIYbl/gXAGClQejWr
	di8nmLZTmGPHu
X-Received: by 2002:ac8:7f0b:0:b0:4e8:9126:31d0 with SMTP id d75a77b69052e-4e89d29843emr321791881cf.20.1761215167421;
        Thu, 23 Oct 2025 03:26:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEv+JYE9Zd15gWAcYaYZ3ohREdQKKaD4jHY5oAkXcks5K8suMhMO92c4U7oNzROY7XUhKFiBw==
X-Received: by 2002:ac8:7f0b:0:b0:4e8:9126:31d0 with SMTP id d75a77b69052e-4e89d29843emr321791521cf.20.1761215166796;
        Thu, 23 Oct 2025 03:26:06 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c427f77bsm92220685e9.3.2025.10.23.03.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 03:26:06 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH v2 09/20] ASoC: qcom: q6asm: set runtime correctly for each stream
Date: Thu, 23 Oct 2025 11:24:33 +0100
Message-ID: <20251023102444.88158-10-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE2OCBTYWx0ZWRfX/wUpcXe0wFnw
 YrVTP6AE5X70677fScqx6zrO7hj0YJ1Cybo+mcoyb5MBYucLAv1+YnvOPwetr5Zx3BOdiY8YKml
 EPB4pej2r4NwrGot51Pub3MrbkUgp96jpg//wHs4o+GO2KF15YIWV+5VwXiN3DjPYIuT9KHVjdm
 +Z6Nqr2b2sSJQ1maN3LJaWdvQsyLS5skKvaX7i01+FcJPjlFQ6Zb6N5hZlTTjNo2+FzDMoe74yf
 xbf8PAUKKF9eJVQTEdSXRGQZ2+rkG5MOneieSKH0GLenOyrErk+ou3xEI3r8iMGFNNDsdEX1asp
 HMsZbtq4q3r/rAcxE3licmkRHZn3P2Gh2PkSfqd91wi5onesqr1BDg01Jl1ZK/WBybwtQXgHMgf
 2uzmULLnIyXMLKwh6gHmgNG+Utpx8Q==
X-Authority-Analysis: v=2.4 cv=LMRrgZW9 c=1 sm=1 tr=0 ts=68fa02c0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=KIUBPGGZ3vVIRF5Z0fMA:9 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: d7Z-lGPF0gYO7uR4ICx2wYo_tJC1i3bK
X-Proofpoint-ORIG-GUID: d7Z-lGPF0gYO7uR4ICx2wYo_tJC1i3bK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220168

Both capture and playback can have different runtimes, so set them
accordingly.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Tested-by: Alexey Klimov <alexey.klimov@linaro.org> # RB5, RB3
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

