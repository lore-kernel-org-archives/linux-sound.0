Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8AE730216E
	for <linux-sound@vger.kernel.org>; Fri,  5 Sep 2025 15:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757084741; cv=none; b=fvVXu1x07bVW0jg+8P+XkgdlDpSWLgUeCs/2q3JUtC4NfaQW2xdc3nXtBPq0urxcD8ZRL6/LC0KMaba+80mJtM64+IMNxa7qFebgGv8sxfNphqlMwGIszDgnjHtEoV16Yeteswf7rZOQxvJFDxbltggdQ8AOkjfzVP8ia5vW4Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757084741; c=relaxed/simple;
	bh=MoCMuDXvh+Nu9b2vpvZYjT7oWfQjMy2t9SXDsBDVWPI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZCu33P+1D8+iLf7w7574N0RK95tfcASINCigM4B/3zxCBcnz/QaRuQvhgW1eTESHBO5DizRX8xc20J0J3as6fXnIHFpHKUf5EsFGQHSlQI2OJQLg9N29UfeiUrnpjrXnuWns6U6QUSRRxYtqDc8PpE/LQ1g1Mg1M3fy8hIKxaFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mkhgop2S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mkhgop2S"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58577WDu013673
	for <linux-sound@vger.kernel.org>; Fri, 5 Sep 2025 15:05:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Ja7IG9owaxs
	h1UgdgM/0Skauh8Aewx5qIfunpWQiINo=; b=mkhgop2SOMwXZsAhrA4ValusQS3
	b069AqqecinOTRO/4cniy0P6p0Klumic0LwYbF138VNr/g5OWfpMdz0cWVsXTK8x
	oFm+U7k4DUDbhxjk3Z/hp9uUgeyk4/gwVdDbWhmqTxOV36ngbiav62MOMGPbCp+S
	p3GpfuU06W0CBBmipQukZwvUI6YB1aDeQIcCCyET2J1ze24G8aQx8C3sxV5MesvI
	btc+kx6+VvuI85tgGLtE22oW9Ky4eWk5ozTqSQEnXaEvqGJ6DbImr/6XD9ia+b2U
	y4Xljfh+Mb6BPSeFaDpUZey9tWBcw84yj4p7x+QAvL366SIhislhk5uXFOg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wyff3f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 15:05:38 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b4f738792b0so3194272a12.3
        for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 08:05:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757084737; x=1757689537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ja7IG9owaxsh1UgdgM/0Skauh8Aewx5qIfunpWQiINo=;
        b=Feav6ac0JOcIPJvsW/a8aI3n1DGWWJd+roL4zGrgfjKZx7KJ/5dBqyqNDsDkR7eBwd
         BCeH30nXr70FHoEh+n87OVyJvDO6sBa3x3fNyee4Q2p300Iadbwj7XW/2WBGzez0NeZA
         +nNIqfrzXSOconihj3bzZ6nU+zFxVbDbRSN6KTQ//jvHMCifII7cXnuVDKlDB0txUH3D
         og2ozPNWUZWLQJYLYE05/27Takqso7IJNfInkCIuDMvDbFcBuzPPeTW6GsImnWwTZUNl
         P3VImVmrVxa9s6ZbRYX4/9HFO9IwkL3TaMwRForwX0AwF5Sosi3XppMVlBiNOIb/nswg
         Prog==
X-Gm-Message-State: AOJu0YyCPKFk8U8QULryEDP+8naWphpf8vEbyyZhnu6vcy9Cugq+ddLP
	IjkddZVT0OjDE/PK2M5MQ1IsWSCqUFmcGnVgkqDnLaOhlSeUGaDkYb5XtxgWJW39PqjGtxDA/m2
	XeFuK8lYOz2jjIt227B7pRvkavD8bXk1+OPy1rKwOMoPHCwqesuL1IW2+ldrFtdCBGg==
X-Gm-Gg: ASbGncuddVPrmR1vbG33Xng55nuSF5RX47rYDMWS4mLVwgl5gvwxD7t8O8VOwXcZG24
	Mg0z9o3TTMUvVyAqtHgJ6eTILnHLjRdxG1mQVlGaeXr82WCkjnFp6Ti2CRwkHSYx05V9gRo3umO
	9CbJWtY0TbONwoOKj7xZ3GNVstPFsoDcJXJtRpzR2lik2bRbGHlzu/GNMGFvTwfFPiINk2AsoF2
	hex4AQXBgTKqB7IkM8QItisgbEqj19JrrVuGHNjE349q+Q71kZi/iUFXg0sXFjs3L6HlboeGLYC
	kOgL5evQmdL/F7yXGA9WacgLrIXJ1SQnNVP7/6SRz10l5HHR5chVOmsBIEINU5pL5g1Kyr7HqQl
	+
X-Received: by 2002:a17:90b:4d92:b0:327:e018:204a with SMTP id 98e67ed59e1d1-3281531d3e3mr30603532a91.0.1757084737022;
        Fri, 05 Sep 2025 08:05:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqIiEJYnj8QbW+Wv6u6rEqkieOl2LWNIL2cqibUoeZ/H246F4m2n7ChcRg2w3QOWU4GeqyAA==
X-Received: by 2002:a17:90b:4d92:b0:327:e018:204a with SMTP id 98e67ed59e1d1-3281531d3e3mr30603424a91.0.1757084735781;
        Fri, 05 Sep 2025 08:05:35 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fcf04b8sm28882840a91.26.2025.09.05.08.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 08:05:35 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        kernel@oss.qualcomm.com, prasad.kumpatla@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 2/3] ASoC: qcom: q6apm-lpass-dais: Fix missing set_fmt DAI op for I2S
Date: Fri,  5 Sep 2025 20:34:44 +0530
Message-Id: <20250905150445.2596140-3-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250905150445.2596140-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250905150445.2596140-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68bafc42 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=VUbThP3hI7wIHPtXhhgA:9
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: gXR3yL5Xt1ZdC58lybztHKMGrZySz2Yx
X-Proofpoint-ORIG-GUID: gXR3yL5Xt1ZdC58lybztHKMGrZySz2Yx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfX660HfIcvEL8Q
 Koj7+XXomRJ2viI2Mt4tf57D4KV7kbeHjnHedu92KnNpIR5moz2TElIXkjvYLXM40FKRD6BkMgz
 Fgyp2zzKPWwUSwcD2d/eC5F6RWKJwUdgp5sp2t5/kiSwCdsB4oeQX+cFkRU67s6jtlqQ3aLzY5p
 PKg71VZH/YdAXF8Igo3q1dNA4uqjZ5MwL/Zw8cordHfkkKMPRLqb8GNjCDlvKD0KJJURUeQgv+D
 jn5Q+wbJYE6gHTbL/qRn7os/1cZEoKkSa/I4POIkkg1AJkklyssJIaJcuOaMGsuvW3gBFpUoKmm
 9/v2couN4PY4q0MxUgVk5kKDO/gXk+UY9uzeI9729Oewh7fcPMPd1SyqDhtjXkQoDitw5JmxR4V
 exNrg9zj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_05,2025-09-04_01,2025-03-28_01
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
Cc: <stable@vger.kernel.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
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

