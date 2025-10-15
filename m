Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409F9202963
	for <linux-sound@vger.kernel.org>; Wed, 15 Oct 2025 13:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760534295; cv=none; b=i2iT5N5g0IqWDQGDu0r9Dx3sT6zB5ihPwtSk1BYzg0/RmKSWVZD2TeXodjdr8Ft3ojWVueWTc0z+aHnBVrE9VMiLMVnwr7QVRAT7yb6/KgEfR7R7K+pzGRdimH2KO+VAPotORu7JqSEaItY4gtqXbIK/ZzP4ggNTRt5NqAapLXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760534295; c=relaxed/simple;
	bh=L098FDafS8pm9ObOLw9+1ZKs3tCLohX1/Ibu253xq/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ErP9sXg1uBddB09hOIb5UIvPmS7J+Ab6sIRQ7Ij6dpfpGICyCX589gLov2Gm7XQ3XSzfxzEUi7PLScGnXMPIcI1acO6+zzrLf67B66ryT4vi8KDhhcwo1tIa3tHy6IB2etGQD2YLcZxPbsj+Pz0QtCxGiudPr2HFqNB+Z2Ua1ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lVA/PdEc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lVA/PdEc"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FB0rZb014785
	for <linux-sound@vger.kernel.org>; Wed, 15 Oct 2025 13:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nnMgSGQvZWa
	892OSdBf3qcySVN9QLFS9/sViBiMJgyA=; b=lVA/PdEcyNkWadMnx9OhqO4b34k
	jBIKkQ0EmtxqrF02yhgh0lchJncIrev97kamcBArfQlzTTSTa7DyglY4McI+hL9r
	AHRBKdOTnIrGEdMB9q3vznQtJsH/NJmlx3bBfvyrsFu8RV3Wv/6dGZBnN2QbI6ql
	Fsmd6ZNaA3Rt2IRrJn3eqam5CZ/vaad/vQDlurKHBU7KzgYwl+M36qaq04Ek9ZQM
	742QX6cBjfAdtAmAYCDC2dTAr4zwH/Tl7bAk2/Q9ibmlBnTFNWO3GoRHIoIkdkmJ
	JUyCIt0VLDmvHkAkZzZmLogQyrJFt951G0r2KyvmmPtc+lYOvMcZt4vbMqA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfbj4hbn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 15 Oct 2025 13:18:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-85dd8633b1bso359614785a.1
        for <linux-sound@vger.kernel.org>; Wed, 15 Oct 2025 06:18:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760534291; x=1761139091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nnMgSGQvZWa892OSdBf3qcySVN9QLFS9/sViBiMJgyA=;
        b=RXk9xaT1Yhvwx2268b5texdeXUrKngLKm60TluEn+J6RTZav/RPOCf8VFijXB6SeAs
         4DtCPtybYRqFhEk6hee3tM3nmAPbWlvpTtxpBEcbk8vBxSTrj7xlz8vqEu69vSbbhkbq
         rH1/mU68SuCEyPDjW8lM39DgQTjE4ltaK7+LtlsEg92ljRkSR73dEoZlYUaKhdFVIFV0
         uoMOFj5yL9o+GrxqTdiUs74hzUbgvfld98n68hg9ajRgxm5Cz5bmMSSzHnd0UPXz8s1U
         XMaHg89Wj+SaYobJLFZLx6Vz19ITJIS3ErMmNf/hccPj9a8W0W28kBYIhy7NaXWrbAwi
         3lsw==
X-Forwarded-Encrypted: i=1; AJvYcCUXSlVRx957JMfSf5xZBmZ64nz1wWnphpdpRC1g7e0ogEQ8vVv4X+u/7wQgNuj1D3gbsqReUzB1Hl+OMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb0m4UrUCRCCy5DSB3USF1oOsMuwDYcikOM4YW/YBpb2izIQ4w
	rWIOtitMZlg35/BmHGJjCJovtEO/8BAgDGK0w3QLwT2S5N4I8xeOinApzEnorqTBFLhdz02B3gY
	dvdcxJhQ0t/k9owEHs28v8j8xGhhAtlyGVPHqirq0hQT0llNQmTN2jbxWRAHWsbonSQ==
X-Gm-Gg: ASbGncs/XEKYP1aiJj6sfaUYI32ygiUgoSuK5kXTFRZFsv/dV2nhvPeTY06Qg6LrnmU
	IGCowm7fXLKiQ8ic4ACir9LfArlQ9uAZCfMY6cox+VMpty3AQj8ALfnE6oNFlpxikj072blkMZK
	WMTOO4PPKtNUJvkHL4gD2UzERQFBofxIEh4+8CnzcnkxA7xw3WHfr8o/Q0cojvIOk6pocc4bqmy
	FjUEhI8gPf5sZLqRpx0CcyqldEbmh/7TgzfKFt7Xi5w6W83EbyqD/6w7gkzkXXLwQAEFA/Dc5CQ
	SgvEVw5cnuo2ESDOp143+YhwDAmT/C7XDE+D9+CCD3tbUI8KqZ4xfg==
X-Received: by 2002:ac8:7e89:0:b0:4d0:fbd5:4cd7 with SMTP id d75a77b69052e-4e890df9b42mr974771cf.16.1760534290535;
        Wed, 15 Oct 2025 06:18:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQPK/8F9/L9WtmiMGFpf77cZuz+9kWatOyQjFPz0hd1jWTnhTVvG4UfIIpB1jflL+E3HXJNw==
X-Received: by 2002:ac8:7e89:0:b0:4d0:fbd5:4cd7 with SMTP id d75a77b69052e-4e890df9b42mr974021cf.16.1760534289820;
        Wed, 15 Oct 2025 06:18:09 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fc155143fsm262081245e9.11.2025.10.15.06.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 06:18:09 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org, m.facchin@arduino.cc,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Stable@vger.kernel.org
Subject: [PATCH 3/9] ASoC: qcom: qdsp6: q6asm-dai: set 10 ms period and buffer alignment.
Date: Wed, 15 Oct 2025 14:17:33 +0100
Message-ID: <20251015131740.340258-4-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfXwN27qvpV8fzo
 7e0IBcZBWVTy+0/OiO71WJNLOyGC8KaR0gN7W4L+goT5h85+jTNBDmU/PQc4yKRMzd0ZyvKFzEF
 r4zZKg/Xs2T4iM4YgEsG0aJh6BVP1QoUwIHkIDDUmQPbF9waMRKLGZ1NGiiX+KjFu0NAG7xrpz/
 t5hWU8FRKnGwQVKoIiKPPJvfMR7G9hrzGLGjYnUZOPF9OaWynPT2bXdB+U4nLVadOLnZTm3akvb
 4tHXJN7NOGYXeDbJvoUX0iF6sReLnE9Tl6Gak3PEVaPgg2Oq1LnPEB6HTnBPDZcc/8TTPuQ2FVx
 8M8/ZoSsBx3Pq4w+NFd8eTf9lV+aLzpvqFfP5I4uJ2uQDw60xX+rfzEiLcKsMb2gyv7HYFiRHEW
 BVPtoMBhJpruCQg8bjv26bKdVoBFDQ==
X-Proofpoint-ORIG-GUID: 2wJguXpTl4K7VWakaBuAtRwYA1ozVJl-
X-Authority-Analysis: v=2.4 cv=bodBxUai c=1 sm=1 tr=0 ts=68ef9f14 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Ubk33e6zxpvlPXQfVdEA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 2wJguXpTl4K7VWakaBuAtRwYA1ozVJl-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110018

DSP expects the periods to be aligned to fragment sizes, currently
setting up to hw constriants on periods bytes is not going to work
correctly as we can endup with periods sizes aligned to 32 bytes however
not aligned to fragment size.

Update the constriants to use fragment size, and also set at step of
10ms for period size to accommodate DSP requirements of 10ms latency.

Fixes: 2a9e92d371db ("ASoC: qdsp6: q6asm: Add q6asm dai driver")
Cc: <Stable@vger.kernel.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index b616ce316d2f..e8129510a734 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -403,13 +403,13 @@ static int q6asm_dai_open(struct snd_soc_component *component,
 	}
 
 	ret = snd_pcm_hw_constraint_step(runtime, 0,
-		SNDRV_PCM_HW_PARAM_PERIOD_BYTES, 32);
+		SNDRV_PCM_HW_PARAM_PERIOD_SIZE, 480);
 	if (ret < 0) {
 		dev_err(dev, "constraint for period bytes step ret = %d\n",
 								ret);
 	}
 	ret = snd_pcm_hw_constraint_step(runtime, 0,
-		SNDRV_PCM_HW_PARAM_BUFFER_BYTES, 32);
+		SNDRV_PCM_HW_PARAM_BUFFER_SIZE, 480);
 	if (ret < 0) {
 		dev_err(dev, "constraint for buffer bytes step ret = %d\n",
 								ret);
-- 
2.51.0

