Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422FC37F307
	for <linux-sound@vger.kernel.org>; Wed,  2 Sep 2026 19:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788378547; cv=none; b=aCFrBd4sO+uTM9GD0nmg3MnzGbWpRj0Fj93uvlIqP2XObt1PCjUjsyKwsXsOACP/pb0pODPiPH3Dv4tJbWDqjIIc/3jjQHITNQnsZ7YJL3/QnhIMDQYJg2ZeBjUiHUqGi0WEhZgeCOyMAumXhxgL92ZG3BikPnNnaIyNQ1PkhPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788378547; c=relaxed/simple;
	bh=QfgD5dr4Sgz3AcIlqMCaBb6PWPYYeamXrxUGbqzwgVE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FUuD/qGRRqDzi8toPHNlLQVsESM9SNDI43+v8mC0ib7qkYDj/KDb+zT5w9uqmUzOFoG8AUlze9Vl3GwB/YVAuq8rdYYVQVak2Wb4vRfLFcnEVUrdENPnmLOzU0fbTuO3nbI+bom5thtmyvuNZ7FE+mGnYKpMDyX8pzM6kK+Zv54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iibPWs1o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f/NjKUK2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iibPWs1o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f/NjKUK2"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682Hr8Lw2105094
	for <linux-sound@vger.kernel.org>; Wed, 2 Sep 2026 19:48:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B5crfQ1fkgmtA3YNNUWd6gdEOR5AI7ZJhz/ELPkdJtU=; b=iibPWs1oYO8ySV2H
	BvqcsytuLzFuPGHZrCg7Lng8YPrn/x2N89uT5G62qWM7kDo/zwgOFA4nHwbZnxLU
	v+PKwZLJFyV1KFt2eqYlSe187NXUulXrvC3okDckIc1BLyojN1eebK8oltyBWmR+
	Pw6VP9xmDjAMcp4yKnwXNvScT/ZOUHbAhnKzFFbJ74ebZ0+LO0bYgP284LA4VEGn
	Wr7962Scslr+O5Xe4X06r2jVjqJ+k/VzakffHMehG54l3VOLHTe+TIskcyXkeoXz
	YAFzGVOx0+6Rd/oPJRfT1iajV69lqNM9x6qTvGyf0ISlaqmaz83QIB5tvjkerm8x
	dZpwaA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrdsbpt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 02 Sep 2026 19:48:56 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cee1ec30f2so18785965ad.3
        for <linux-sound@vger.kernel.org>; Wed, 02 Sep 2026 12:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788378535; x=1788983335; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B5crfQ1fkgmtA3YNNUWd6gdEOR5AI7ZJhz/ELPkdJtU=;
        b=f/NjKUK2RybrQmlQJt1AgppLfwGNJiyMZqmAlu0SBkBSFPGByJCexERAvaT7tMGtRd
         r9SY2XxcjQK+lKFh/CAdCxqtiXXPqx9g1wou1oloGB4qn7r5JB4wXMyTcA3iV1RHIcOp
         Q2YGxf3CeoJGis+a9enxEavWWGroKE5HOFKicBrwipvidk7umTDCP9QqIWGCRwhiBSOM
         pG2ZZdEkE04MWKgCxoq3O2WZ/ZkoQp2iyV/J5NIxSfzJnQp+cZLjVAiVVyAVvUMySYyn
         wm/+1aETRg+bDGWbykosLuu0/BNWlxxAkiL5klsoSqeI/P4wEzQ4uHHmDBFGPoDN7VoS
         klLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788378535; x=1788983335;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B5crfQ1fkgmtA3YNNUWd6gdEOR5AI7ZJhz/ELPkdJtU=;
        b=D9OuaeLiceUuhLlrBBgyUGVeSs1fnPpQoTEx0+5A7yVmoLMKkxQ2mte1iTEK6X1udn
         ZYyN/mgvDGF3e3TE2I8IA/r/bf8wpZit/5fy3MPlp95sYsT3tb4ZX0Bhql+a5LmbmsVl
         /MtkX5Xgmq4o4VxV+eu7PHzjWHAg2aFkHKv+x+z9P/cTAdcwrd6qWo93fnIaB17a1Nl7
         jDpIbf9663pXr17ksDHtQ0EqyOEaVF7twvbVUt34Y3Da1xTujwGobK7O9X/E+mFwp5mQ
         uPxuShn64ewLRzlqD73zPsh9MtV7oqzAlR4Q8mOEaeh1OaXI1/OTXVvNdJXmexlMbaAo
         vYUg==
X-Forwarded-Encrypted: i=1; AKwUvBxT2byz6ECF5RjqKd135B/wbDGNDC66YPpJyHQIUoaVHqQPIBEgIKUdqBeQl8A33kZRPDAXehjOZD/IVg==@vger.kernel.org
X-Gm-Message-State: AFuF++kQl7xahW/f6bIWm2z4sInanqqdW16l1qvSQJtc/6JlEfbai3u/
	72vPMg2qUg7U+rf2YxPanX2OUt57hRmD8LZHlMOZOL0Ro72eej8yxAWhQhnvBCe1/qhDgH86P6b
	/B6MW/anmAaR4ffpUWcXeXKHIPCwoe0wqQi3a41WoXTAuv/MsIFPIOhgvP10D4vZVKQ==
X-Gm-Gg: AYBFou0FPZA0dyycElGh/TVhWdEQlQz2xUAJY+QvC3HCfuh2SM3krN/i77GD/Vi5LOg
	kOWRGqcxnDrkPrkcCvXqfBjrqgOvbK3+laJXWAQNP8KJkOqve6zhrg2YhxSD9PGy2evJyvjH9ns
	d6RUtW9urtGeym9aXuCJphvn/YONFS99UAot6T2Rb4P9imE9N2rY1fQ+WIXbcVGYjY+KP0OrjTz
	oGP4ULszroIPycGZWhxffWqR1Whs0S4PIqJpjZrNbSFjeapwdYF8idHNQnriyvVsIM31xquCZph
	DrS4QlBXMHv7AsKDz+iuIZpOyvfATrZvsHnV8WOZIHwr+cU86bwlrlqh+w1M+qGI723xlJ1e60m
	aX+0hsS6Q375/pTk0fwXXDLNKuPs=
X-Received: by 2002:a17:902:e78f:b0:2d9:56dd:f804 with SMTP id d9443c01a7336-2daec71e483mr105040725ad.13.1788378535157;
        Wed, 02 Sep 2026 12:48:55 -0700 (PDT)
X-Received: by 2002:a17:902:e78f:b0:2d9:56dd:f804 with SMTP id d9443c01a7336-2daec71e483mr105040185ad.13.1788378534670;
        Wed, 02 Sep 2026 12:48:54 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3325641b4dcsm307065eec.26.2026.09.02.12.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:48:54 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Gary Yang <gary.yang@cixtech.com>,
        Fugang Duan <fugang.duan@cixtech.com>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        sound-open-firmware@alsa-project.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 12/12] ASoC: sprd: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:17:12 +0530
Message-ID: <20260902194712.2003414-13-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902194712.2003414-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902194712.2003414-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H4/rBeYi c=1 sm=1 tr=0 ts=6a987da8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=99hAX-h0IAisWkWT3OgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: PCC3RcuQS0LL7wT-pTJs8ojxEv6gIzJm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfX6ca/rgOwO4lS
 GQYqGsRPQGE0Pr1QanFQTfjzvCGJOeyQpDoIVV9hL1Z18tL9dmv7CWFWnCs5b/CCKvar+x8F7Vo
 jbNTlx3wtAOGTyh+6avWaiyvRcWJlvTZ8CcWWpku5jFImmyy9r2Pa05QHr0TfX3+nzIv3qI/AgM
 kydujCpQ2v24NXNUmaQsnVaRfIo9qmKIBEpqLjdKqn1CvitBQmRJtH8GO4TDAlP9x7GTOBQUP1B
 CO3ikLUnxrjYQRSQVt84/9J65sVkMQp0hIelcpEUBvr7CfdQA/aYBbZ8vpDrZKrhi5GoJGCpizj
 JNL6eLof//Jon93JOnTINlpcg9Tst3rPKc3GLDfrQ5vmmaX3cwC5HC+JnzNhbyBQl5bkCSCff37
 VMAToICdQWFw3JqO5AL+Hf/ZF/WGUE9yz1xxSPi/RMWX24wciNpLUyUDQ4vuCGIS23t9qNxhom1
 VpaOvbTjov5VZORR+xA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfXy/1lc6CdU89a
 ep9UgLYYB2HBu7We6mbcGd4IVzcfedZeznjsVCSKqX1VmJ8SVItoUO7H7Ik0KtjZz2lxu7gThmh
 mSImdrb3CW01Cirrq0jdlU9p9w9HOTs=
X-Proofpoint-ORIG-GUID: PCC3RcuQS0LL7wT-pTJs8ojxEv6gIzJm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020175

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing cleanup — the driver has no remove function. Also drop the
now-unused local variable np.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/sprd/sprd-pcm-dma.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/sprd/sprd-pcm-dma.c b/sound/soc/sprd/sprd-pcm-dma.c
index f509a4601de2..2d5ffbe17e81 100644
--- a/sound/soc/sprd/sprd-pcm-dma.c
+++ b/sound/soc/sprd/sprd-pcm-dma.c
@@ -459,10 +459,9 @@ static const struct snd_soc_component_driver sprd_soc_component = {
 
 static int sprd_soc_platform_probe(struct platform_device *pdev)
 {
-	struct device_node *np = pdev->dev.of_node;
 	int ret;
 
-	ret = of_reserved_mem_device_init_by_idx(&pdev->dev, np, 0);
+	ret = devm_of_reserved_mem_device_init(&pdev->dev);
 	if (ret)
 		dev_warn(&pdev->dev,
 			 "no reserved DMA memory for audio platform device\n");
-- 
2.55.0

