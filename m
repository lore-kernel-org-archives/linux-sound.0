Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C43C30214E
	for <linux-sound@vger.kernel.org>; Fri,  5 Sep 2025 15:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757084738; cv=none; b=oTeVK1D3lLW2tYHOBlaHboDV6WKU5dESfBLdJ/i5bidMkjmypHjitIynw+KBXLPdyrme1QRCmkGRZf8pHZwkVGM8LSC5r0wG2UnzRR6bKlUVG0dfrlIAiv75T6Y93U8YhwmCD8Xw8YpylYcpm1Pwysbnam/9Yy8HOaGWJOWG0lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757084738; c=relaxed/simple;
	bh=u65y2jSDRLaSgr2s4XMiseR1rskbbKzZS6Ts4b/elFM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PsUDGc2nWo20FSrewOpPwUSAS9FkbIpTErKBRabnX36uZ8vtKvzme8bCq0665SCbSFNIdE98NUIk6bUFNs7A7WnXkydcKoU9tSVLfy1h6N3yzki9WfDrAL1WJ+dwoGvK/8dhBCNhCG6kpJ3Rspd7Ax86/UePeQW3QG7vwh1sgrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f7TAX/B8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f7TAX/B8"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58578713013584
	for <linux-sound@vger.kernel.org>; Fri, 5 Sep 2025 15:05:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Ln4QrHvRmvl
	Sj7VRoWV0fWCKQ+IjhQYN87ftM4Mr5ZQ=; b=f7TAX/B8rTXwsoc1S9Z/ygzk6Bs
	+XUSbGPFp6Ni3ax/u21rOusfDLgn66DM4elHq9EZj39wNzHzsudKmy/qLIFvfB8U
	5GpBbJuh/paJS9E2wE+G88FvdIY85UjwOIZFfx82oY1L8mmanN0f2Ok0BKvpnsPw
	eU8KtKKdIorvHZTc3m2ZkREnHcWJsQcbMOQTmY2HhJVGIY68Aw6FWdHbzg2GXRYZ
	WAk94UNBIlneT4dYQq8nNJJS3mZt3H1tsy1qSXhOCXw3xtoHl5bu/LtJAroBhaYD
	9SyW7h00x3vXtiUrF02ORanA2AycAEArrcMl3e7U/FeaY1M5xeFztDZNdOw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wyff3a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 15:05:35 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-329e375d372so2907205a91.3
        for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 08:05:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757084734; x=1757689534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ln4QrHvRmvlSj7VRoWV0fWCKQ+IjhQYN87ftM4Mr5ZQ=;
        b=Z0qp8IRyNJY5L9gtw0vQBYEq8h144zsQ/+EMyrAJe4WM/0nx9mL3iPN//jG8SIXft3
         RqSaMZND/MoLyPqjUcCouxNSjna4kZlNuBqXtYCdCfRsZfl3MHE77sIbjhUDvMWKCHsQ
         shdkzTSHmq94rwEHM0QAzvWCLwJBszu6y4p2Z7esUObGk0s7Vsnnq/8GuDmI1/IzIugg
         lx3SJil3uiCC9E0qEwqyTzBfolPmlpdWt56JWCE/YVYULFq1f+NhG8SFzxn2/zm11fWf
         2Y2jE5i87IjQj0JYPUOniQQUIwZbWCTaGhnzPkKqQVVh+xpry8JXhOnXG9jGyq+TIHI+
         YZMQ==
X-Gm-Message-State: AOJu0YzXUQIQ6ZQYEr/06i99fJUjDVZKAJnPYqKPJVhl2juM/+QqOrpx
	/yu/XAxxt6m7jTj5d7qos8MNeo91D2FW3B9pNfw+j7uUKjJYrti3XDkpo8xNSZ3SRmi9vUR/mZw
	iqDhg0O7AA4G7dxz4uqNS8j/wDANrFIHyJwlGayQQ9xML9wqavsXdjtQxsVlzxfLjVQ==
X-Gm-Gg: ASbGncu+/9Ne8ZeW4mHFo5l9w6ZDAdSKpIyrrV8FIgE9P1Qpj0xbf3zWjdzHJNIoBtH
	/eO8i5eaLnmdmbg8xue073MDHL+CCNkponicTGK1td27iALrFhxSQrxSdcyX79JMuEky8lTpgQ6
	i9tq15LOirOs0KqOvq8eGYuijo3YuhcuyaHxKP8igBnTlF21JPvBA7i3F7iSTHdBWTYptGDTySo
	xIgdwPD/jfstENU75dbJSJXegvb9JBSk0TUBe7mxTuK7bs7FKdxXFNRnPvDEkncexF95+KsdmYv
	iyNhScKOKi1HlH9WBZgQ30rjIH6er2SUtQJXrHcaT4rOMOAq24yjzqtt2W1otAiiwuahq9lfKit
	z
X-Received: by 2002:a17:90a:d40c:b0:32b:e42d:649f with SMTP id 98e67ed59e1d1-32be42d656emr1455904a91.4.1757084732309;
        Fri, 05 Sep 2025 08:05:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDmM3rGXxEcUOcvGJH9jngE6DgxXhxZQFlWg53KST+M+4unP4or4/YJLIttQc0R5ta/Pf+0Q==
X-Received: by 2002:a17:90a:d40c:b0:32b:e42d:649f with SMTP id 98e67ed59e1d1-32be42d656emr1455857a91.4.1757084731777;
        Fri, 05 Sep 2025 08:05:31 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fcf04b8sm28882840a91.26.2025.09.05.08.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 08:05:31 -0700 (PDT)
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
Subject: [PATCH v3 1/3] ASoC: qcom: audioreach: Fix lpaif_type configuration for the I2S interface
Date: Fri,  5 Sep 2025 20:34:43 +0530
Message-Id: <20250905150445.2596140-2-mohammad.rafi.shaik@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68bafc3f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5HF5tzHaENt2U_M8s7UA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 1EP8yh-pRQJWTrVIWbq3lVpiEiIpIycu
X-Proofpoint-ORIG-GUID: 1EP8yh-pRQJWTrVIWbq3lVpiEiIpIycu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfXzo1lLUwUmrmS
 47f4YjJCjJvN2cdTkq++AOkuKTLfumAN2MPbljiNo9myZhKirtTSrkysjjEuW5TYfW+QYkpj+P5
 uNCM3pAEr7ky6vsHp4AkQmWyu6+jEnQKczquRmTDNCXdccBoQNE/UdE1RD5ldg+ag/ygR8oU2Xl
 TCPgnia/UR7Rw8QgapO4u5PkWwDG+nU4E05Q4KVUCll1Kaydnprz4RGvulBirLOBIyw1wtbAV36
 invGK/FjQXBEl43PygnOciyTUsmTuNKuYdTgf1j3FHNltOmi4c9EiJreTuuqrTAv7BPDSUEBprd
 QTpz1KFciEWycPAmVbXJ7xIs7fy5x6xDPYJ4hB8zXcQyTe0UNWcRzlglL/jzv1v3FXEjE5a5o/T
 9owqDH1i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101

Fix missing lpaif_type configuration for the I2S interface.
The proper lpaif interface type required to allow DSP to vote
appropriate clock setting for I2S interface.

Fixes: 25ab80db6b133 ("ASoC: qdsp6: audioreach: add module configuration command helpers")
Cc: <stable@vger.kernel.org>
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

