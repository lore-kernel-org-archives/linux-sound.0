Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90643218C5
	for <linux-sound@vger.kernel.org>; Fri, 22 Aug 2025 17:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755882922; cv=none; b=Ui35xGQFfLy7OK6T4NOnRSc8KsRw1jgcSKIxeZRYuq1CEDRVgGmrA8ZgAi7vJ+CjaKhVdkN8JrgCjLKMjrkECMq2xril0WvII0Hb7QziMCROKlMJYso23Y3Cl/KidoGw6juJgltQFhYFY43L3nV3sGYqtP4tKHvLQC0eo43HuCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755882922; c=relaxed/simple;
	bh=xbJwyrD2C3iNWF1DUx952NDNhE0jLbF+XEtCs5+R0zo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=u1S6Yku59yrmIN/KZMJ2lgOqCWe2O62uDWf66uutgRMm14Q3PuzS3kFOcUsGoUlLGFCcUa1PDZRUK2uGShtfGOOVEIITtioyPPSxjo/qL855+GINrbmOSz4XqU+esAh6a4dgm7HOgSH+wKIskKketu/G3zN2GgNPjXby6tZeuZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X0gbA+Sz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X0gbA+Sz"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57MGFbUD012002
	for <linux-sound@vger.kernel.org>; Fri, 22 Aug 2025 17:15:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+8pC070wu4J
	VmBSidlDuszZJEm3cZ5GlOhv5w5ch2vU=; b=X0gbA+Sze2lvQmaQRA1hSjvwDWX
	N0OkRJCkUdBRQS1ekOdununXI6BpbsnPmW9hlHEG3GuPMY6MD7QB5wtBagB83P2h
	oQebaZ50/vtR59DiW3/SFim3Irp7J0QORRVuGSt7pmeAh7h4Dh71RJIZK13AcFao
	+4EMnwYk1pPxkcEYZW+T3u/uCLGrEsOWcrqrYRilTqzhffYqDE9wK7RjVjMqS3M2
	F9L9bQZ/Mr7E8a0g6yEOKx71KrYBTboOdnsNWczgYs2lycrlRL1AInWKy+KcsLwl
	UA1dcAOniDYpz377zn23bOZlQ4OB7XJoOyUFtnlpftlXjcj8Qnm4Ztc7S/w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ngt8ftmb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 22 Aug 2025 17:15:19 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b4716f9dad2so3796917a12.0
        for <linux-sound@vger.kernel.org>; Fri, 22 Aug 2025 10:15:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755882909; x=1756487709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+8pC070wu4JVmBSidlDuszZJEm3cZ5GlOhv5w5ch2vU=;
        b=YH2rl6YQ5iJ0OsCWof0B9GT4lcav0yVXUHJtjUvHy1K8nfjJZoJLvwKY+zXf8BlrD3
         9wynGQZkjiVss98mupaYlE0zuxKZpU0aDf25e1b8gXke8c2R3W4iuie7iAcqS+Ug8UrS
         wQYHd3KaCsdRhz0JXaR/0NeCkDpeSx4W65D9cdau4jrk6mv7tCt7gzz61dhQ9XrpJtBU
         o2+Jg67J1L8NqfK2dGzfI3A94Q4Wx1vF61vdREe04L+2w6h/XmxQ/Sx4IgpghwY4e0Gz
         3v8jS0Dvpc83pKKYZFlvgzyHGSo7Jjs3PDyutLutEeztnPEr7RdrwvpHuIbC35pyhz0u
         qowg==
X-Gm-Message-State: AOJu0YytiZKgi1E/TZplw0IiabT7JQqn8T7a5RhcP+21UjPVlZz8cfH2
	j4KXu7K2/fjIutCceFpYzP3OU60NpIvZ5+at6IiORJNy1R5X1mpWT9GYuDP8g0UFaFdn/CM3I1M
	RZlOfRzGdzeUxztoz63G4kqMfi5/0a95UU/tpbmAYr2bKffQUgFQQ9evSJoDGSgaHdQ==
X-Gm-Gg: ASbGncswIMZlyXIz+/hu300mmziriaaZscnpagHlmSFs0G4zaS5+3n8jKIwcJhSvIhJ
	P1O5cLoz3KKWSTMUbYOD/wejcpxCVJx7VLkAYlYIJOs1Dx4p+sH7dkvsLEuDABMauhrS6bZZtKV
	uDtioHediOGq/+xzytKuizTI34tSqATqn4bfU6xWkPJBHK/6BD4ImK+SzIGWNfunW85QiGRTsse
	0hpw3erjSbswFcsPAKMWK+syX1s8UrQVpWV+JF5o3g9WUrMJPovCNFHhAq1lQKUZ8HpZ8nDPweo
	uMmJ95ZKORPC4IJY4zuOZNm10uKj8KhJozN+53yGcGz+WHt0GEW8/sBdhNFjFv0duNKx8Ubk1v2
	8
X-Received: by 2002:a05:6a20:3d85:b0:23d:4777:49bd with SMTP id adf61e73a8af0-24340ca7a9fmr5646988637.21.1755882908720;
        Fri, 22 Aug 2025 10:15:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6GuwX31R8qwOZw90/Fag7/snvKPwFqs6UB/eEJ4CBW4sM1BBnXp3rmNLCDtVvZV0OpWE4nQ==
X-Received: by 2002:a05:6a20:3d85:b0:23d:4777:49bd with SMTP id adf61e73a8af0-24340ca7a9fmr5646938637.21.1755882908264;
        Fri, 22 Aug 2025 10:15:08 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b49cb8afc56sm309995a12.15.2025.08.22.10.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 10:15:08 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com
Subject: [PATCH v1 2/2] ASoC: qcom: audioreach: Fix default WS source assignment for I2S interface
Date: Fri, 22 Aug 2025 22:44:40 +0530
Message-Id: <20250822171440.2040324-3-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250822171440.2040324-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250822171440.2040324-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDEzNCBTYWx0ZWRfX3GCXpbdVtD6C
 oZ0UKd62yx87x4qOq0kf09ERKrkvcWKMLFFY6cMCn9sU/s9zYKZzRbp0tJs1PUnyrCqgil+Tmkg
 xj87Bhyl2ksx0hoARH9CnJR1Z3R49Z6tZkGkMFZR5IUcLMRyO90MPDYYlplYN2ecLWbqspIQVS8
 apDMt8LuwLcewS+Ulj4xhtbc/EjRwtqmyOsCs3hrzNwqa1LTyWG/rSt9bNN7bWiKIC0fZWmgnu9
 ATrrcduqOmBgy/AjdU4yvHAM5brF+mwyYU/2HSE8JvwFwSZfxkUsEv0qfuKXMwL94WXtYtc7Uo6
 sAlX1m5dTn4K2BMQ2czF23HOkLsqHP7DTSIxNuXe/rjWatD3dWxAZuNTYX7VPq3AvjNDxLfRGom
 LQf0uv2Ve2ryzbTtFuhgQax5fGzDew==
X-Authority-Analysis: v=2.4 cv=c/fygR9l c=1 sm=1 tr=0 ts=68a8a5a7 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=hSYZM-FDCW3FgKnTnV4A:9
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: S3BREP10R2JVM4uF5OvJ0096Om5YPCn5
X-Proofpoint-ORIG-GUID: S3BREP10R2JVM4uF5OvJ0096Om5YPCn5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200134

Resolve an issue where the I2S Word Select (WS) source could remain unset,
leading to misconfiguration of the I2S interface. A default WS source is
assigned when not explicitly configured by the AudioReach module.

For HS MI2S interface, the DSP need proper WS settings to set
appropriate endpoint configuration.

Fixes: 25ab80db6b133 ("ASoC: qdsp6: audioreach: add module configuration command helpers")
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 6d7b1a4b0b2a..d4397f75e310 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -999,6 +999,12 @@ static int audioreach_i2s_set_media_format(struct q6apm_graph *graph,
 	intf_cfg->cfg.intf_idx = module->hw_interface_idx;
 	intf_cfg->cfg.sd_line_idx = module->sd_line_idx;
 
+	/* Set default WS source if not already configured */
+	if (!module->ws_src)
+		intf_cfg->cfg.ws_src = CONFIG_I2S_WS_SRC_INTERNAL;
+	else
+		intf_cfg->cfg.ws_src = module->ws_src;
+
 	switch (cfg->fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
 	case SND_SOC_DAIFMT_BP_FP:
 		intf_cfg->cfg.ws_src = CONFIG_I2S_WS_SRC_INTERNAL;
-- 
2.34.1

