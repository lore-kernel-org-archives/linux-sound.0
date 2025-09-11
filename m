Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EBE4270541
	for <linux-sound@vger.kernel.org>; Thu, 11 Sep 2025 06:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757572601; cv=none; b=GmAPDjXdAIN8PCiucqd3epchwnnT2vo2lzmxwlW8L9/UEs5TvQaQbdudIPYBqQmW9UPKNlHlcHeh/af8VMJw8JNru4LFYnvP7GhFGOGg8R1fqWALdKFYttZ4ve9+IoGwYOfsdxECJiBpkHPvwODtqX/DiezdUYFDZubA5CzQ7SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757572601; c=relaxed/simple;
	bh=3CtwootO+el+RrOJXyCia5V9rqAmA+AuWVwZzlzSH4Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LXNKwvcEVBhrTxVn5y4c//9DEPwlf+AM6HprUbobTjbgMcaCcYT1mDIpq/TR7KnDJZssih+qzl0bCTTAtkiqsX6SHr7kI0aJDyB5aKjxvuYYY4xfk3TxxII4TQHCLdWl7fpqlWq73U0jtKftoLrvPk+BFcFiypwaxovNh7S/1G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ntDBUzej; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ntDBUzej"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B2IUwc002273
	for <linux-sound@vger.kernel.org>; Thu, 11 Sep 2025 06:36:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LDwAG0QNYm3
	TJZCTHSe3Hq/KAWIgtpSzOrrjr5E3qM4=; b=ntDBUzejHlJ2XmULBN49Yg0/iAV
	tDqw8/f+eFEHDpEjp8OX033z1fsrIOeyduQS6CGswkWkuBJNQ1dqXcx4alhEHSOX
	85TMDmy9BnH0pe5y5f5kB8z5pSzgvKynSOtotsz/+NDKi3v+uYal05NSPwn6ORUx
	vpdnjsbVses99qJXb/ww9K4TKSWroF0+1exBHRMGuLw2RvRKUi/aom8xHBcPdNSQ
	l6/ntFgg7snVpVxwnl3x/gGFr39Jn+Lj9iNrp6adlUTLnXUYNennQn7P+d+dzHWd
	yXYYwbUsG35YLQSGgT5cruhcNdUCJ5pG5q4HJEhDTJbwoe7uUwzbQOvHwdA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8pjgd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 11 Sep 2025 06:36:37 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2445805d386so5455165ad.1
        for <linux-sound@vger.kernel.org>; Wed, 10 Sep 2025 23:36:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757572596; x=1758177396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LDwAG0QNYm3TJZCTHSe3Hq/KAWIgtpSzOrrjr5E3qM4=;
        b=jbN25sDcE9PMaGN4WX17G628Nz8GX7inpVF/k6Ry7a08Q5b45qoE8/HWdctBaxw8LI
         oivZ1euzNNQRwff5tUCdDuVFDfkQqNhKRVeabyTI5h5adcRAj7LsLVQ68UDk8GkqEOGP
         mqd8NQXNRWBfc9Q+ZeniPpDnFfQGY8+pK1EIqNQurUpZ7TbHmmwjzmp8LTFRxbZkv2dI
         ctQKYx70DtG4QRBBBiUIj0LlkAgWaLzIRVpJwmRK6PKH3CoruL8TSavwaFUsJzQtX7fP
         gGjsGBfQtukQZ+LnZa341NF/6QedMW4kodBnJYongeZn68iZumGwyfOoAIsPt0pSQQY/
         q+Mw==
X-Gm-Message-State: AOJu0YzazQxNMNNG9ot1EJlfWim/r+vlZHtWmicjnOoBlb89QmYPB22H
	m6itg+dq/+mKC3j+HjQMc3/6sDervp93RLbT2RbcLPNl/2/NLbN/5k9YK/QxORi8Bgou8tbbotF
	+8TL5S0UkSTT6A9GlkyRl28mTFetnq0Ktw8tcgJIifIsjFWtthdNnocCqE4BzMT2FDA==
X-Gm-Gg: ASbGncsejHoJBsqXpdykzRVIL849btxO1fUaY+Vn2g2EIjpL8nTjb80qMypGFUAXP1T
	DB1WytduA2nAh3cII6NJ0/vrK3QcuQZIBvMNcWYiKmWm3zBS5oGpa5RZX4ELE99hypCblFXaKut
	y61GHIDsww9Sl8pq0I3gpSIJd8RSUkK7gi36JnYb7iwen7vFq1S0iWi4kGEI8OTPbj5KwNh3Uim
	f4wTKEvqv65FGLU4QKNQQBJLpGFsn4UxkLxVdB2G9VBsRCBzbRZc2PUSqOlLLj1cQAak7kNTXKm
	j4kok6I2B/otjUXOz2K13zm5fhHi8ysN2QwXEpoeZ24hsvpq3seLu5yc3c670k4sZr5gOd5GeTI
	a
X-Received: by 2002:a17:902:ea0a:b0:246:80ef:87fc with SMTP id d9443c01a7336-25174c1a958mr256279925ad.45.1757572596447;
        Wed, 10 Sep 2025 23:36:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcacMkV67nbieIIaWIuOTTD3vj8ct2khst5MgT+t512ruIpzEk5hxAb/P/xJMf3FaHrDwZdg==
X-Received: by 2002:a17:902:ea0a:b0:246:80ef:87fc with SMTP id d9443c01a7336-25174c1a958mr256279695ad.45.1757572595996;
        Wed, 10 Sep 2025 23:36:35 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c3a84f72fsm7739125ad.72.2025.09.10.23.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 23:36:35 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        prasad.kumpatla@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com,
        stable@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [RESEND PATCH v4 1/3] ASoC: qcom: audioreach: Fix lpaif_type configuration for the I2S interface
Date: Thu, 11 Sep 2025 12:06:10 +0530
Message-Id: <20250911063612.2242184-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250911063612.2242184-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250911063612.2242184-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfXyatdezGncuqm
 WWs3tzbJ+1mjSkO4edXL3b142hRs+loKEShCNke/gFe5EhKZ/2bVAacpcH/fICZ0HDgTIRJknvP
 4PBnN7Ui8VjFGxXkqgznAe8fu7IgDvpaFSZqx4UrfEAdxvxi+xWxZ3iOUVUWTg7Ana1oJdhfrF5
 FyNfvVTLcH7Z7dFrCHwJaeV86RXCfZfzgOS9x7agSne8RTjneqoh58nUSqkumtgyJGJnlSDx8po
 xAk3BC/PMpifmNbXne2XHkTIt5Hi18WmGN80Yscnovsmg0OR5u7jLLmPj0eRFatXEYUVwEWzXpp
 CzkzrfE+l7gliY7hjGx85ivOWoTFMm+K7hvr5V9tTe9FsoMG5EdRSuC1gbTl8m6MFX4pR0aaMED
 QO7FssQE
X-Proofpoint-ORIG-GUID: gsKu6hDuLmAKx4gt9cMQln79V68otgRp
X-Proofpoint-GUID: gsKu6hDuLmAKx4gt9cMQln79V68otgRp
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68c26df5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5HF5tzHaENt2U_M8s7UA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031

Fix missing lpaif_type configuration for the I2S interface.
The proper lpaif interface type required to allow DSP to vote
appropriate clock setting for I2S interface.

Fixes: 25ab80db6b133 ("ASoC: qdsp6: audioreach: add module configuration command helpers")
Cc: stable@vger.kernel.org
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index bbfd51db8797..be21d5f6af8a 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -995,6 +995,7 @@ static int audioreach_i2s_set_media_format(struct q6apm_graph *graph,
 	param_data->param_id = PARAM_ID_I2S_INTF_CFG;
 	param_data->param_size = ic_sz - APM_MODULE_PARAM_DATA_SIZE;
 
+	intf_cfg->cfg.lpaif_type = module->hw_interface_type;
 	intf_cfg->cfg.intf_idx = module->hw_interface_idx;
 	intf_cfg->cfg.sd_line_idx = module->sd_line_idx;
 
-- 
2.34.1

