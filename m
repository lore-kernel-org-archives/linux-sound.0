Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E6433A00E
	for <linux-sound@vger.kernel.org>; Tue,  9 Sep 2025 12:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757420435; cv=none; b=fAAD6OfGf1ZEyP1ELAqVYpvn6TNPY9TofeTDr1jC0PnasAAZcauNrmQ96R52x5KLCcjYVqvpLzTbZpIr3cAlbexH8ottZt3Q/Wjcp19Z1lS+Hk1VpeOjqWBuU1pw06vToTCmahVNDNkuE4XPhwzn1Ech2J+AGMoPEeVWwIPXbcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757420435; c=relaxed/simple;
	bh=SVUoWsmSq4cUO/z4U/2qlZs54P0s1u7ZOQr9dToLxZM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EYRlFgCElTZj5QCvoxSJhPWM0woOpscfubPTBUCLq9zSwl/c0pdZHL4WH5DSlrrApElDvlCHWnlhbgwUxoQEFQG05InycmCMn2IqP9NL8cJPBGvQq5tZqxre0s+OlpzwuYFkXr+yF1xZnEN2wmRWEagRSCvWeCAZmD3DZCX78mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KHrWVNew; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KHrWVNew"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LeSA030636
	for <linux-sound@vger.kernel.org>; Tue, 9 Sep 2025 12:20:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/aX4MrtepdT
	dnJU9juLKPIRgCfBEk58eXLQDBNRQG8Q=; b=KHrWVNewg7+jycfasOPcvIYs7ZL
	SVSzNIkUD+vyP4qVuLHjN/Mgcl2lvvxv9jv9ZzqfgojXlkPr+n8P1RHRl9b6cjFt
	LOVfZSTzqhl9jnFX42lww7ztGKzFWSWGqxhS3iotnjWavmHgfCQC0q9KO54MsRva
	dQFvCP6vbV+9PBnMtL1jx/6vdVHNmFW9aeW39cNC//UPSXPyu0ktT+knncHb5VZp
	xFVyC3Bo0+phjzuuQWVmL1NeAwzeWCmQo902hd8M8NLl4r6tBA/FQEcaoJEbRfZ+
	PHczTnDKR2pTN9Dk3I7i8qd0dQUA6UDW/pWfY9M+yyoVwxoLLnYrQFYWjrA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490c9j88u0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 09 Sep 2025 12:20:33 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b5ecf597acso111131621cf.1
        for <linux-sound@vger.kernel.org>; Tue, 09 Sep 2025 05:20:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757420432; x=1758025232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/aX4MrtepdTdnJU9juLKPIRgCfBEk58eXLQDBNRQG8Q=;
        b=URRIt8xj3am0Rklg2kBRuG9FBMK7vOnSydgJnUfeN0eBWMslktBqmrvfXlA4FqpFjj
         yoI4rDaQfDH4vEHqo2zCceVksYANkm6DYuVcYw5HX3EQpWB0fy2RE1cAwNtubmkGo4U2
         aUDVj9gBR071eabHGAHXhCE5FStgpd4NtoThII0Wiz6tJVZ5jyqfSmMmrZtDd8T8xijt
         jAxy+3l5swiSx48kE6JuSEBicRMY/qOcx7nsqbyoRhJZF5tC7VXEEW8typrktyQL6Hrx
         4ovxnSJy1LCOcGk9uDFucwgfYnGfSb2vJd/SBCdoV1dS6t2ykwS6cecMUKYBGA8Yo2CC
         2Kxw==
X-Forwarded-Encrypted: i=1; AJvYcCVNYbcIV1O9HyCNGIb0WjYa3b2wLGBtfuQsjV+ujqLtTNqX7rGsaOjEg5/EuHjBuQkwwI+lgtsx8ZXG3A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyntv0gBT5OwoPfTMpCgTYYo5g13s8v50TUQs+G/113sq+a5VYc
	TKQGUP2TFRIBu6kzMsmT0kW5NmpZnDzjW6YnLooTiycjVAeZfTRozS+M+YMlwaR4HjAapF4bRA9
	f7l+Zwlzgo4IyhUNTmhK6w3rfCMES7TfP00ApRMBb/AxTrEpUddb0LyX4q41vqFMe6Q==
X-Gm-Gg: ASbGncsjDaE0o5/yw5MCBtPVikJaoMGoLWVL+6B1d7m1qFueyL9CaJSk2gHVYZA+10p
	okKBjbeC84m7NbXql2q7mZnCvEVFtqjYAP8n6E7coDYahHxE6RAqSNtLKgd+xSlfmxk5uA6Jzvi
	skOC1//oWeASKnayRvM9+esEz23AuI93rabuLoQXX7+iBQWcYlqjpHSg7SwMyrf3a5yT7f3XPzt
	QtspEZufcQPFNXeqvE2Gn67BwyK/QGV0Uxvl6Pw8K+SCNEhCNPJO1AS9/pNlFoR8ZDbTHvlwoZg
	z8Pfmokr3yfEUinqxC8clkxUq/LF/Dk6qsJWVWMNYB0Xdn3zOVNRKA==
X-Received: by 2002:a05:622a:1b92:b0:4b5:d639:e111 with SMTP id d75a77b69052e-4b5f849014emr114086501cf.72.1757420432259;
        Tue, 09 Sep 2025 05:20:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGD1H4F2A9zCRDLPBwKwDxTxZrMciTCyU2vqs0hTpRNN1jnEO8an9hAxmLMO14UhV4DIucfwg==
X-Received: by 2002:a05:622a:1b92:b0:4b5:d639:e111 with SMTP id d75a77b69052e-4b5f849014emr114086231cf.72.1757420431636;
        Tue, 09 Sep 2025 05:20:31 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e75224db20sm2414629f8f.60.2025.09.09.05.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 05:20:31 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org, srini@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v5 12/13] ASoC: codecs: wcd938x: get regmap directly
Date: Tue,  9 Sep 2025 13:19:53 +0100
Message-ID: <20250909121954.225833-13-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250909121954.225833-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250909121954.225833-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyMiBTYWx0ZWRfXyOg0QAMngELh
 nN/gDlh3wCeEK/ggcIWsUWmznnoy4EYIqjWb0I2KTRdk3FVXtB0ScSGvpPQbKhIbbBAETUJKp0B
 dym86tLJsBzCgRx4D7n5cgfQOmeB+OBnCFWJ9HkmGdKNXv21GUOZ4sOTHNBjxBfZYR356wSUoPE
 XFQnmBroU8O3T6SOM9ljtm0NO5zEFEMdUxcnp5XU2ceRRzRH1u4IRF5WGgXUNw5jiKsIql2k+uU
 irYFbtw1EcpF7hvc7TL2fy0uiFO3UkM1Hj3P0nBw3db0QC9se7eWy+M/LY015TS8zX1KVaSO5pF
 xlx8dEowDnFkCLwEtBqswxW5YA5gcnqu1a+nBomvyK2xnNbqgXV6pJHgfL0iqrcBdlJ5f/C7kY5
 lwRJLb5x
X-Proofpoint-ORIG-GUID: UQRDAnBxmTpWM3Im20aJZFcfdjFul3zr
X-Authority-Analysis: v=2.4 cv=PpOTbxM3 c=1 sm=1 tr=0 ts=68c01b91 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=AeW90Tct3s7Q8B8mPpwA:9
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: UQRDAnBxmTpWM3Im20aJZFcfdjFul3zr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_01,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060022

Remove usage of dev_get_regmap, as this its more efficient to directly
reference the pointer.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 sound/soc/codecs/wcd938x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index e495f98972f1..e1a4783b984c 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -3389,7 +3389,7 @@ static int wcd938x_bind(struct device *dev)
 		goto err_remove_tx_link;
 	}
 
-	wcd938x->regmap = dev_get_regmap(&wcd938x->tx_sdw_dev->dev, NULL);
+	wcd938x->regmap = wcd938x->sdw_priv[AIF1_CAP]->regmap;
 	if (!wcd938x->regmap) {
 		dev_err(dev, "could not get TX device regmap\n");
 		ret = -EINVAL;
-- 
2.50.0

