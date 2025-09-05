Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2542E2EFC
	for <linux-sound@vger.kernel.org>; Fri,  5 Sep 2025 10:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757068855; cv=none; b=VKJCXjjnk5Wda+aFSViYoreZa1DI/heUVjMf4FceDgoWcR6nAWOSUVBfxR3QDqnzclNoIMK5+WDY2j7sekCy1OlTDvMa6X6OMjLEjFnz0mRaztgs9cCLAMLq+Te9k6mdwtsOsMEH1+totbwQ1cgCqSKcnKX8oqrao5c9DPYcytY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757068855; c=relaxed/simple;
	bh=o3+9zWqzop6Qirh/jUD98VgvGr+s/4CoqP1QajjE/Fk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MxViKsrfrr56JxSRJNK+pZLNG/tzsNY73RW4/QOcRV4mNEjsOovYx/uAIy0TeKeSEvNRtv19sEZRItTbPWMB3/dK/F2q0I0Lj2KgJhh9mIG+w+1mG/6Ci3SR2brij6yFcmyiL0GAUPUaslqGMF9yDRJOYh29trxeYGl/d/1Ib/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fu50+kd7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fu50+kd7"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5856s3gI013642
	for <linux-sound@vger.kernel.org>; Fri, 5 Sep 2025 10:40:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LXDDf7M2VYT
	jvwwkHPq5BIaZwMjwTKn+8VWmbHt4iis=; b=fu50+kd72QmHR755kColGCGekPa
	w7tGLcod3efoyTJDXPGoT5lhNYhf1cRXphx0Tai6MWYl+unmYxBRBB1pJNnG5WNl
	vW3pPrsvqHRn4TgdV0rfy8WDSXuZsBsnU6+IDhjf/ix0f2FTyw/KfOI+KIxrIA/P
	pYDBrcLQF8PXPihc9dnT3coKATyYlkBLEYtRAM4l4rpB6qEVG6vUUHJaFwd45xMw
	7/EkHQWwHJVAR+LDzMPwTwYCInRIAVeWcGKNTorYa/NLkB4XosILnLkP08viCUFk
	IObPfP5/olssLVqDBalXlCPI4SkjRx7SOgEGpcRiAxeVMCRcDA4mC/bLr9w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wyersp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 10:40:51 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-77278d3789cso3824237b3a.1
        for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 03:40:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757068850; x=1757673650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LXDDf7M2VYTjvwwkHPq5BIaZwMjwTKn+8VWmbHt4iis=;
        b=aYnNQQKso+BfdiDMFBNZU7k8cqGA/HFlafAfcNKQ5Qb+XoRa3nCKS6OMCpVtLlkLOU
         VIhpvKOYKCvKt04Dip4Fzwq7tAmxFngaQAsHDOAF/K5Dla4ncl1Ee9uA/Cw/MHhbj+W+
         F4AsLzoHjky8y6tsDFkmcMo1/zLvw1NJmM+W3LdPECoTl7qF8UMC5MSMgYLTZ0g9d6wu
         7Y3s0UeTGzhZcZ/6CPN+J/kHccN6dSPqKAZkDBDJdKSeZv1NTk6KsZBuujr6/qbvWYft
         veslYJ0SQ4M0dpz77+4AMtqhBEU5PtuspJxQpMfMl8AjS45RiDFv03Env25dVdOwmL1F
         CKWQ==
X-Gm-Message-State: AOJu0YyOItfKaT0YxpoPzrWGQhzobW3dkVnYIsyjBxOY0Uq+VFQMHKvJ
	0z+9Tq3P+Tn66xUwAhNk675AJEwFbUCjqH5XrwrbModdITgA/sZd9E95uEvmKZ4fQbHvU6ycBFq
	4anuVwS/wdjW+XyugUxiQlMLr8EEHP5UgLwyPI+rADMwYhb8Dt5hAwbress4MHHGQJA==
X-Gm-Gg: ASbGncsl1G+kWJZgsO35DC+d/2Eqjr1QFa9LcCMmyVV9QCO1EGbocXZb3dHGTXDR1sA
	PCnMquhTEOm2+sKAbcyWrLDgq+Jx3pi+VYmIvVuuOpUusYB1stq5nTJjPIinQGPPEoFfMEeOyR8
	76nAWwIQoQx39YvR4hChcqzZT1b0nLqRD/zUfNvU22wxVSZnFOqNs3U+9E3c8vaHXCcwSeUi7t/
	TH2+4ViNMJhmyuv25aWF4rCoimjuecFM9pK950bYtp6bUS9zRvooDy2ep82Pv6l9NMLk0Mva2qu
	cOurF/iqiHhFlBbnheefEOnn4wYV5GH4hWl7mSJJXWR8cJ5UmUhERYyN31m8TkBkKLSzHj5s6WR
	E
X-Received: by 2002:a05:6a00:2d86:b0:771:fdd9:efa0 with SMTP id d2e1a72fcca58-7723e36b457mr27393605b3a.15.1757068849862;
        Fri, 05 Sep 2025 03:40:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnK9/HS3NMRByU9Ib95AJxuy1rcwlfJDqcn6yMRx61rMf0Ranxs9dLAw+zWBYAe4AELefC2w==
X-Received: by 2002:a05:6a00:2d86:b0:771:fdd9:efa0 with SMTP id d2e1a72fcca58-7723e36b457mr27393565b3a.15.1757068849386;
        Fri, 05 Sep 2025 03:40:49 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a269e9csm21993859b3a.17.2025.09.05.03.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 03:40:49 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        prasad.kumpatla@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
Subject: [PATCH v2 2/3] ASoC: qcom: q6apm-lpass-dais: Fix missing set_fmt DAI op for I2S
Date: Fri,  5 Sep 2025 16:10:19 +0530
Message-Id: <20250905104020.2463473-3-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250905104020.2463473-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250905104020.2463473-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68babe33 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=sT7cmTyyBTHRPr1aEM0A:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: Wf8d1ZimvaPAjPiQ81kNCK1oGzPHC0TX
X-Proofpoint-ORIG-GUID: Wf8d1ZimvaPAjPiQ81kNCK1oGzPHC0TX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfX/gh2F5CDJW3/
 g01X7wcqZUOA/RjrshLBTH9ROFNl+cTakE+PTNjPqloerMxGe1bTjqpgfv4qwgqlsE10/BqZvhw
 7kHWF/WWhx0V4WJRUJn4e4/zhwH+g+EpNVkY8uYiia+RNpLw8YexWpf7s7CW10IGYbpVlAhgj/i
 EN34/NUPpvpoATo14vn9SgNgtpHU+j78mF8pmapwLLn8ml41g+GdoHmtAS6QmhglazW5t89xQwj
 N3NDOLjquR9oA0ebTOoXMDuQHnDp+g7P+WoLZYhW9Fwuv8zKQUODFcy264RU8nokpzk7ZE775nd
 6lvkplrH3PxHgjUEoBXU4xqC6tvJ8ofrZQgP37jvy74MrCtHvxkYGSBuRFUbmrs8cbLiFtXlOSj
 f4HaKULg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_03,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101

The q6i2s_set_fmt() function was defined but never linked into the
I2S DAI operations, resulting DAI format settings is being ignored
during stream setup. This change fixes the issue by properly linking
the .set_fmt handler within the DAI ops.

Fixes: 30ad723b93ade ("ASoC: qdsp6: audioreach: add q6apm lpass dai support")
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index 20974f10406b..528756f1332b 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -262,6 +262,7 @@ static const struct snd_soc_dai_ops q6i2s_ops = {
 	.shutdown	= q6apm_lpass_dai_shutdown,
 	.set_channel_map  = q6dma_set_channel_map,
 	.hw_params        = q6dma_hw_params,
+	.set_fmt	= q6i2s_set_fmt,
 };
 
 static const struct snd_soc_dai_ops q6hdmi_ops = {
-- 
2.34.1

