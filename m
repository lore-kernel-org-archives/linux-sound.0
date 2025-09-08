Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819B0230BF8
	for <linux-sound@vger.kernel.org>; Mon,  8 Sep 2025 05:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757309843; cv=none; b=Xr0kXP/ibcTsMChJl5AbN1BWpQl5GYP77o/0yJt37BFDIK05SiLQBukQTqAs78GfSHkaP6zPBdENLGi6XTleRlJdMAZLDr3X6F9nOzTd/1UyLtUDOKttsLdXq+jrUM/pZxBhX2mxYdCVPJtd4CKT33OEZHR3J6Z2KiZvfNFDfMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757309843; c=relaxed/simple;
	bh=3CtwootO+el+RrOJXyCia5V9rqAmA+AuWVwZzlzSH4Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fmXDwq2btE+zIXHNBDXoxBnrC03LzS0P0+msMpBpYKUz7W4oZewoGmdAjOIrJzrnTXsqhRYy837aqCFlfQ24X+U5ZTdKvlPJIgkniNW5EdPdMD8Hml6LORtsazWoMZN/eLlL444pSUdu/bD0K6I68DHnnY9oHQNkw5pLbH9/S/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cUG2nH/C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cUG2nH/C"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587MvCJc011099
	for <linux-sound@vger.kernel.org>; Mon, 8 Sep 2025 05:37:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LDwAG0QNYm3
	TJZCTHSe3Hq/KAWIgtpSzOrrjr5E3qM4=; b=cUG2nH/CXmCrTEOy2M53lSEGEyJ
	6s6rH9V9rLnvZPXzaX2u/aI/pBXwiCE70E0lb4x81vnwMGqxsmMW1x7e8Nkc2qWR
	ZQAxgyeiA2YxOQKK4gTG1fNAEmt6z8m89LYgyBhsRSXARozIq1Xeqc8r3WfLLqqK
	kGugwoiocLi/g5jPuTuwLsgCsaUiMEisldMAr4zll32wE0MOXjF3tftHpZtHPCXt
	I+5ETvHX4rlqOwjPIq62M3W5HIpvWTDrYIMF3aM3xT2ti1obnOXZbJgs1j6t8cQF
	9hBITDIPMt7lR+xIwK85ALi7eFu+1mbWG5z2gSLnRKlyfc/JcW7crNDG/dA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490bws3dsf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 08 Sep 2025 05:37:21 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-77264a9408cso8519084b3a.3
        for <linux-sound@vger.kernel.org>; Sun, 07 Sep 2025 22:37:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757309841; x=1757914641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LDwAG0QNYm3TJZCTHSe3Hq/KAWIgtpSzOrrjr5E3qM4=;
        b=PYvEML3iqGvhdEAPOSitb0vGa+tRk5r9Xt2mcmLxHXfEvc9AYi5cxpjq34mQs7vUvh
         EUvx4TROXex/iNfBUQ2uxemVHXny9VI3YQTu8PkYe9AtG/GES5BcnR492XwrUNzTAx5P
         iFqgASVQIEwfi46wbuoyPCqwaQFoRehhOwHn+eQ7lT+5mHXtBFJ3PVUsuW07sU4EOfqR
         omCLYfcR8U4mnN1KEW11DQ6lqLtMqrReZKCfxG0uyrQnchz5tN+BUAItPvnU4GAI/K5m
         ItpqX6xg+gCNdEYEfdLUoYFQ4i9iLDsVSCQV17qFPBis+DV75sXRU/+6w5usD+LUVJVe
         eiJw==
X-Gm-Message-State: AOJu0Yw9ktFd2mo+A8c6dm5Eg84Vam+q1nSmyWTI0guI0BhXNCqU5SDG
	hERNWLGyRwyGpukVQTv/dztNRdTvagAw2G9W6LmXhTGcWoIhtz5hUybFFQ8vZXtSWrQx0X4idvh
	VPkuSBsQYWf3aR84aJ6/c3CBEoPorjlCypvjEJtDoauUR+RQGwEkwr8crlVRPiLF5IA==
X-Gm-Gg: ASbGnctOJumZwbMGQjo+B/lqJQ3cG4oLLe+FtUFU3FcZ1/Uk7QCSovGswRn+WL9UlQG
	1F4SEoIMBPDrULEEUQhbO4MYbHbx262gBu1a7ORJ5oRuhoP7whIpKhLOHmKzDycRswyzUbZ3W04
	+H/S+XjG++c0nXekF2bZq4ydgj93QT1P11svdIfXx/IuLfzStlEmFUOQFiDDfOTtFW7Z5T4OrQJ
	FE4Kgr1VLTfI0yzzZ0hHPMXSOFIB2o6jvLxZaDhAkgLw3tJDawFSbao+Bo6MUaifqCrTzCN9gSo
	0mJFxYgBRT3ZAMQeHHB4oSXp8KZp3d4kq4wqITYlxog+t6nzzQt/wtIHJ5wwJHDbgrohCPbbH2e
	o
X-Received: by 2002:aa7:8882:0:b0:771:e179:343a with SMTP id d2e1a72fcca58-7742dea0275mr10773502b3a.17.1757309840824;
        Sun, 07 Sep 2025 22:37:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtn70IgXvQ4aGWZkJAzdfomHZs4vLGdZ2n6w4YrYjD5Z31iweF4zdq2ah09rQn9ZRQmSTSlA==
X-Received: by 2002:aa7:8882:0:b0:771:e179:343a with SMTP id d2e1a72fcca58-7742dea0275mr10773474b3a.17.1757309840408;
        Sun, 07 Sep 2025 22:37:20 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a4e1d4fsm28013488b3a.73.2025.09.07.22.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 22:37:20 -0700 (PDT)
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
Subject: [PATCH v4 1/3] ASoC: qcom: audioreach: Fix lpaif_type configuration for the I2S interface
Date: Mon,  8 Sep 2025 11:06:29 +0530
Message-Id: <20250908053631.70978-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250908053631.70978-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250908053631.70978-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: VKlON5gTy7VNmadfi_YaSwkwcaSdZFXS
X-Proofpoint-GUID: VKlON5gTy7VNmadfi_YaSwkwcaSdZFXS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX8lU1hYPA9WeQ
 hd1H0cCGqMQDgPjB5lZfrjhQ+og4xyKJAKfcy1ynGRUZ6gXGvoW7aBQS5DzuReRpzxZpzaPJeRk
 M5xEDmQCet87n/sXFHY6WnLDb9U5EW2sTvlGUrBYH7hhVJrSuL9+V/TQhM3V3jZ8uDarbnMdgH5
 FFIpyXiQXwFu5VbluxDlcizsmJ0XWVYrljw9+Zcv+gaidD1fBZ3TLNi+jdltv1kppuWC2HY6T7G
 CvDpeJ4ulw6VYj8d0lWVhQBNC5HtXimbV6D5DUfVP82n6mpKBVV0fBeBQ3StE+uAGIMpP3NUWXB
 QS/+CV3gNvbjFW3OGT0gpzBl8iyXTgBJipy0Qugi2fkTe1nN0ZYxvbJl1MMPaIZtnRBZyJDQCB7
 pjmLZEh5
X-Authority-Analysis: v=2.4 cv=G4kcE8k5 c=1 sm=1 tr=0 ts=68be6b91 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5HF5tzHaENt2U_M8s7UA:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_01,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018

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

