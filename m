Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD403A6417
	for <linux-sound@vger.kernel.org>; Sun,  5 Jul 2026 19:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783280488; cv=none; b=Ia8C6dm9f8m3b9ueNUt1xiQLYyuuZ+4XuNDLXgKaHbMliRVDabOCNnhGQi1/xFzlCGJ1kNhaVJr63d4swF1Um/wM1M9GJ6KofhdZkaHT5teY6sdjRo+6bZs40DsFzfQetaoftCfrVPU248XgkHxgOyLVAQZFtIQ0PtmwB6n1FsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783280488; c=relaxed/simple;
	bh=GVKkJosfWbaAfOvliUHFeY44e0c1PSKKGH2GQjW/JNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QzoexCSu5gezKOtkTjO6Fm7PvZ0vtCkKRjW2yUBBrI8mApGhtLs1PxNYSvFCQJYMBrdta/WPIJVpPexMjk2jz/n74K5nTM6WMB8AYzR2lcBPCV3uBn5S07m6jrHXQs7VufQJWlFKR9xLyIOs55vd65ULdGyPI1kKO33HNBkQHME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TLn6zhut; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IZG58Ff4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TLn6zhut";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IZG58Ff4"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665Hhk0q2324651
	for <linux-sound@vger.kernel.org>; Sun, 5 Jul 2026 19:41:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NGgGvwnqAVQQEeBPG1kTtk7oaNyoX+6Tcm1yJclm2Pw=; b=TLn6zhutzCtePBXP
	eApN5L/sdm3XfMAHOZhP82YsbqE0e2xRcEAFk/+OzouZNGNfc26qhw5knDcbPcel
	BP5iZZDUvJOH4Kdt2QhgKPJOeoScqNJcXRyWCHIYBBbsIEBD0ZiVVQvHgMHBpB06
	KDdBLLvkRr12JNjMqEtNLmZCzmB3HEASAP+zwk9LWIkse6JF6XJ5aE2oTFOlREXB
	HWsjh1ZGAPgsRx3a1N+Une0Zk6nBS+M8q7Nzxb/+beCfZqlUhL0J/8be0mCDgioR
	WDJzt0GGrulk/kLFg2I0CGVxAo6WNnObMHMMKTDfE+fIZHUMdON7dtl7vgqPIl6I
	fMEfTw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6qvgum7v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 05 Jul 2026 19:41:25 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c88cfe287e1so1421996a12.1
        for <linux-sound@vger.kernel.org>; Sun, 05 Jul 2026 12:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280485; x=1783885285; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NGgGvwnqAVQQEeBPG1kTtk7oaNyoX+6Tcm1yJclm2Pw=;
        b=IZG58Ff4FSz0xPAqXt1O0zOxFaAtOJZN9IWe92nAwZiPZFjlqg1nbrFbHttEcUNU9h
         6jNoGhV+J/yNfrzUEPILSBDguBszwwFjfNnFc9A2XxM81pxpNopJp3YJAf1MD5JDgCEA
         qc9jZ3IetpNBJ5FteRGNGtBCi7ieYp/p7vcP9Djop8UiiDtew+Pqv+RLVKdAcanrSLVR
         ax8sD6c2p2BPl/cpPFDBJPPaEdKa1ueytlXTK7L3e0Rs0hjwC/qmQzpwmotWY1vX3x27
         L3Y9n969UKSZ9fVEaC9VZjmXEyIueej8S7mRzFuGwKDKJW5BD0apojcOkpFjRLvynm0X
         Hudw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280485; x=1783885285;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NGgGvwnqAVQQEeBPG1kTtk7oaNyoX+6Tcm1yJclm2Pw=;
        b=LhPAGaDY9lZGVTuTQEyZ7xQuDN3zGU9LPDXZaHuFMZjr8pbJ6od4jjvMuD0uYjKg4L
         fa6WJKxi99gh7VnJNZy8mis2eci6AgQcRm+SDpc6Y9uOQEFzDlcQCI815wW7yDtztar5
         HikYo0+G2+rIMT03/VvKtqK1JXsUmhVk0ANGG/zfQl3lUlsWrsdn+bqnO+pOoyxcet3L
         UseD3MU8je2OakT1N0wb8R6bMbAKKNWys7loDT252p/283GEOI8GwBkKqGGmm1pbipTT
         DZuUGdXIkcU+R11EZR/P68nr1ZRNFol53zSMBU7NqJzYS2pReZZUgPL/kb3yt8YGq3ig
         03/Q==
X-Forwarded-Encrypted: i=1; AHgh+RrtLf6H7SXBynSymImK+0qUCFmGrBolFAIgywzFbg5KhZgY4VzrJX2MSgxGamhFQ0CbI7XiR3mLeLs5eA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwX7OeCWso37az8MzLiaXQcRknFPpBg9mfa9Jy23gZBmLQudpLq
	VwhzIpgGIFC1Eb7K4stHGMWqJUp1K3ydhfhM36a5HFqddX2P6hQswMM924Jcn/QeOeefm6pMJod
	RyoW5HKB7Q9/m5VkUhr5M1W//sS2+l/HrW2fbm3El8brdufQb/AYZL+efWBdNPttccg==
X-Gm-Gg: AfdE7ckpveg+NHDDR8mkCS4R3JhgG/BzOdFVgBcPj3jBzjSFizw7fGwB0YpDDwwk8WD
	1VrcWYSm7vw6nujpd+uwkBEkUPbs63UygTt//GYDOHxOcC9xds2uBBiQCjrp/hbI+VA2xvcl+vc
	tNGNq5ef9Hx6F6EOMHIls5YPwANlUkrPIHgKaCPPu2tkZNYfgyhf65WZ51/YsVWQuR0R0/6wt4+
	6q/JlA1RFz8p6Gwiik7U/jE9XDTXn7KwkCk5RN+YFuiK1jjBp6xnOBvJrBuwLFbeX/rtD4F6v2A
	EaNaEeAL6D2Yvc9DoYaVxUvQo5VqYudT8wIMDBFN1J1KHzl4pS28cdpQ7y+oMSl00BVz/7mTimM
	uDaiTnqrEtFFKdpWhBIdDm605R/IyF3h77mUd2A==
X-Received: by 2002:a05:6a20:43a9:b0:3bf:9e25:1a13 with SMTP id adf61e73a8af0-3c03e26ff8cmr8745239637.15.1783280484469;
        Sun, 05 Jul 2026 12:41:24 -0700 (PDT)
X-Received: by 2002:a05:6a20:43a9:b0:3bf:9e25:1a13 with SMTP id adf61e73a8af0-3c03e26ff8cmr8745209637.15.1783280483924;
        Sun, 05 Jul 2026 12:41:23 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:41:23 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, sound-open-firmware@alsa-project.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 41/42] ASoC: fsl: imx-rpmsg: Use devm_of_reserved_mem_device_init_by_idx()
Date: Mon,  6 Jul 2026 01:10:17 +0530
Message-ID: <20260705194019.2565498-9-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VvoTxe2n c=1 sm=1 tr=0 ts=6a4ab365 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=dtkDxOtodmQ1SLiiO2kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: dGv8HrDX9xWzrsjc4HhXToPspyfwN6oU
X-Proofpoint-GUID: dGv8HrDX9xWzrsjc4HhXToPspyfwN6oU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX/L7UwNV7hqzl
 Q9+HdqOFWgDOyKHGBcuChfKf7dDGzeDBvHkbw/mHQVadTGcfwXlwzMNklTkl54LWmPjOKOJB1dJ
 36LIACYr8nTmZM/GPngh2QxhJfOutBw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX3qewB0EY47SG
 6cXoRArvLF5gYUPA+I+rbQgthzQMy67uyBpWjrOIGqyD2CsdXN9yhe+k19X5/kodVO5av1mt5Ff
 AqhtgJj+punwj7mtMiRB6vaAN5VoGD0+UdNvK4OHWQYWow7iSngNFq2ZH1T/g9bQlamJOrh1W45
 9Vr3HHAai8AReHfD+wfTDt5hzFdBE/mlRnUq+qut9K2y8JsOxUBdrh7pmHUlHvBgdMrFZz3tGWF
 +mmCSnMhhoT7XdAU5sV7dMQXxl7WQqW+Q1Behkg9/fuB8PIXUhFK18hrrMox2SUZ67yytzdF5MI
 AXD9eLWb4/R7SoudrFmf5+sHCEpM4Yp0WNPD4Wiu8T7jEnbuIupaWUt2oECNsMAGCVyT+XVuujl
 T5eyg7ZYMs+R+PC71n8fv8Y7PmOQ9qVW5axfFZn9KSksbQGOff3cHLYBMaRBFq1zu5ThrJ491cL
 ic9q+/cnfpRigFpokoQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212

Use the devres-managed devm_of_reserved_mem_device_init_by_idx() to
ensure the reserved memory region is released on device removal, fixing
a missing cleanup — the driver has no remove function.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/fsl/imx-rpmsg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/imx-rpmsg.c b/sound/soc/fsl/imx-rpmsg.c
index 5f1af258caf2..f504d94c4f68 100644
--- a/sound/soc/fsl/imx-rpmsg.c
+++ b/sound/soc/fsl/imx-rpmsg.c
@@ -199,7 +199,7 @@ static int imx_rpmsg_probe(struct platform_device *pdev)
 		goto fail;
 	}
 
-	ret = of_reserved_mem_device_init_by_idx(&pdev->dev, np, 0);
+	ret = devm_of_reserved_mem_device_init_by_idx(&pdev->dev, np, 0);
 	if (ret)
 		dev_warn(&pdev->dev, "no reserved DMA memory\n");
 
-- 
2.53.0

