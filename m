Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5016E2E7184
	for <linux-sound@vger.kernel.org>; Fri,  5 Sep 2025 10:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757068857; cv=none; b=gFHmeyIvgVkPqkFcvSFMfNgABDlybf8Hvx+rChxi7cvjV0lzvdqcuEZF0Fp8bleWpmV3CVvD3vG+YBJFj6lTUaMmYFWWDJqkPZmobkcEHn0hingu6UM+nxAcybJFb73l1Q9aHF24q0fqrbQQF/6fDaO3hHKfbXDsh5/2mzn0h8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757068857; c=relaxed/simple;
	bh=R+8y6aC4oGsKszWLbVLiFImQ2iZ4uIW6PWC9HmhFcvE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ka7TwIncnHjl+0gFC3PZe8xHxl4A4J7/uxfXdCOyhKu3whHXtYCTNcejcPOzvwl6YEbCULtK+4z7M+hEh2fajwSWMG+UwaJLYKnHCc71jthbvGsypRhzOpCGs0Wcu/ZxIDsEdc3ZduygZ6UG9cc0ZhVIeSy7EpdjR8QB25BOxeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WBD4+zFj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WBD4+zFj"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58574Evb008089
	for <linux-sound@vger.kernel.org>; Fri, 5 Sep 2025 10:40:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hcLibYhLr1f
	30XIuUz6qkoSEgZUIT3PqmW87KBYUtvU=; b=WBD4+zFjfJZyHVOASHd11Gg5d4H
	+RBRb2bXcHhFtbNrmE4GcrYXIKFH71ZuEg/4m8YEjjTwewHWhJPuhfc/shNh7FNx
	kgXJwOPQnFDfDTLoEv5ZI+Fj3P1nwky7PFeyXhRXy5iirFD+Ccyuwd/7DN9RE6/2
	uBj9rUZpA88P76LNYi8aDSIwh3aTnjb5mUj8JwV8IPBGyOvdR7piDLbdhSVeyucf
	+4P/2hfIEI9itEy3zdkIqgI5j5vJWoqPxjySriPcb0Z0fjPzUS6T5hu4GN3p9ytP
	BlpSshxi3ICV7BUdcdKr6yMulKBJAdEIvfaQ0rCrHg09OTPtSnRLfefrWDA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjtrx8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 10:40:55 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-329745d6960so1991772a91.0
        for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 03:40:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757068853; x=1757673653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hcLibYhLr1f30XIuUz6qkoSEgZUIT3PqmW87KBYUtvU=;
        b=UKzUd/lCQzBS6/n7MUlVf3GJOR5Dx9nUoDWGuSARmp1q8bkPXeWeXg0ee+UO2OogY2
         IUWeFwgWRyBdqJDUXvYfmPmTXSHmt/qqXTBh7JUuXF5sYoeDJvLPdG37JECYpz4MXlhm
         NmYqFHXC3wbs8pTog3JQD47jUJSkd1M/EgKr5BQ2aOfFsz2LW2BD23gkx9+1NQr6T7fO
         gLepmKzZEigphpUgwXMGy9TmfWVzO8d1qKvzR4Su1taoBztMuYJpdJREfml94ot0tQy0
         7UkDPzrTSGE6mwv84hp3sjclBGnw+cP+xvmisOJI6KFzxDnIOhty5yq3+E5gg/qbWrkm
         Toig==
X-Gm-Message-State: AOJu0Yz0tee7hqDcaW6VdWxSXTdrFQUtFtbx1F2//kJsR9wybIJ43Ipt
	7Cb7Sp25jW0YVmsOg2WITRdQZleqQigpmAV0h5Ygj4r3lqhjDVj/4TLCdE9wufi6bZdLUrTxiau
	IDa7AHfdyMjT2rdpW67g9EUo6iHbCdG8gf6ifhK/fiOosOL6T500S62Ml3YXtG3wmXmnyMvQcfg
	==
X-Gm-Gg: ASbGncs4pjimqJPwi4VDyLHI6OMbNqmC82W9l4f4AI+PucxX5bgEb1b/Bs8CXBf4p4Z
	rXTDgkDgr++aAyQjDeWj9jSxz4aAJWjCAFI3Zvokv1B+P3lJ3Az09+ZCaGu6HWLL45b9gVYQ8rB
	j2+iJlCIzAktHkL/ST7iunQLwHWCxRs83mv9eRnbFm6BpccN7imyvl/KrQE9QOlGXK865nL5pfP
	xOTJyCeYnDSLfrYrl4Nu2mZImtCNY9aSUe1QIU00gU9XkeiV4Fgv4m7kPIUcDeeOZVbH9+imSlu
	z6XrVj1Cg0TXR/+Le8sYCyz7KIbuMuylLacGXYpGpaBEl+G8ystqnUFFk6324VCmu7ic4q2sjoi
	E
X-Received: by 2002:a17:90a:d408:b0:329:ca48:70b0 with SMTP id 98e67ed59e1d1-329ca487480mr17260542a91.34.1757068853333;
        Fri, 05 Sep 2025 03:40:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2/aaqRA4AnQ98LMQ6v6f+QE3oCWn+P3lpjqD932yoYZSGs4FktX5k8hwdC3ShO4MNgEgsvQ==
X-Received: by 2002:a17:90a:d408:b0:329:ca48:70b0 with SMTP id 98e67ed59e1d1-329ca487480mr17260517a91.34.1757068852886;
        Fri, 05 Sep 2025 03:40:52 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a269e9csm21993859b3a.17.2025.09.05.03.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 03:40:52 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        prasad.kumpatla@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
Subject: [PATCH v2 3/3] ASoC: qcom: sc8280xp: Fix DAI format setting for MI2S interfaces
Date: Fri,  5 Sep 2025 16:10:20 +0530
Message-Id: <20250905104020.2463473-4-mohammad.rafi.shaik@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68babe37 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=tfJ7er6LdcoPz7dJv_wA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 7XU6qdX7DqZBrasm9EzSRx6qaIScFMdq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfXyTNhHcHNAjpp
 Dl2SOIelq3p4UYQBAvEGzV1eaQKuR8XfFNK6rY0DdO7KG9r0mTkwbLb4o7eXUUzImS4En3mJbvo
 f43HSIguuO+DKANrKHHmCumy9/Yt/QnyvRncgrA6ec7dXDXsbxwSyprkbLlHAYRSyC+5J5ZaK+V
 AmtBKvj+/3cwcJdhy+tapn1BsvJG/iHJLpt/NVairntCyuO5mOTS1dJhAg6etuIhnM54W18Pfoq
 TQyc8xGHI6atFFrpnqmpJS33bfjgnyLwm8RqZIYsd8mqoiluyfUCgvU2s4QgAPTJYlb3k0RJL++
 HQlDKw9VU2ZgMBzjxPkJxuJ2oWXol13RVyPGxgAm6ziNsw7am5HDHzf5rj9QsJz4+D1vkbTQDZU
 dH8aZL1k
X-Proofpoint-ORIG-GUID: 7XU6qdX7DqZBrasm9EzSRx6qaIScFMdq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_03,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024

The current implementation does not configure the CPU DAI format for
MI2S interfaces, resulting in -EIO errors during audio playback and
capture. This prevents the correct clock from being enabled for the
MI2S interface. Configure the required DAI format to enable proper
clock settings. Tested on Lemans evk platform.

Fixes: 295aeea6646ad ("ASoC: qcom: add machine driver for sc8280xp")
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 73f9f82c4e25..2fd06354923a 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -32,6 +32,9 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
 	int dp_pcm_id = 0;
 
 	switch (cpu_dai->id) {
+	case PRIMARY_MI2S_RX...QUATERNARY_MI2S_TX:
+		snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
+		break;
 	case WSA_CODEC_DMA_RX_0:
 	case WSA_CODEC_DMA_RX_1:
 		/*
-- 
2.34.1

