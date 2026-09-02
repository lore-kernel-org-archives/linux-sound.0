Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BFD4AF159
	for <linux-sound@vger.kernel.org>; Wed,  2 Sep 2026 19:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788378490; cv=none; b=inrnvsQzvqp47Ve+GFnOlL1CNzICGbs9LjgvnYA2POZlieFb8fq6pn1WoPtkVzcFLjt/2FQwPnhbq69yb4tReiMyE9R4oUDR84hG3aZKvXldhuAAx+CbmXiXAVxlllh4oDkfuLB1FUgEKgBVCIsx8BKPO6N6pddV0ymPVHfhIRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788378490; c=relaxed/simple;
	bh=iWKIF7+y19GlLp2q+iIL/tUlrDkr3t3S4Xnk27aRzvs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ux/j0yLXSDVK2BM/AXnyWzPT2JL53wAAPmatcFAg/82r/5Rb0JZdlHcLlugsLd2twGpnIRZKS3+2qXGqmWlR4Mah2KZ1NU6VRWxKpAZn3OgLPkG7PPJ+WVClXuQBBDSYZEhcaJardqcATU6vVxn28GVCrIKUXDWXyQ7XyUs8Je8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XZfDsFMQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VDj0Oxe1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XZfDsFMQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VDj0Oxe1"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HqtQc2975244
	for <linux-sound@vger.kernel.org>; Wed, 2 Sep 2026 19:47:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UtK0az9ffiV
	XS6BRi5p/C8bg4TVrBl5o4jttOM3T124=; b=XZfDsFMQqWKPwwNisCMcFzhWbMh
	cMMlLP2SXc6oZeqUlSphC4aNvVn5HxnDY+qnLQzj+c/ciSqd5OwsX/XbBNJy/nce
	1QW9Z8S8S3h8cm4gkfVKfSzmLDw9EyPBq8wYcqSPpTrWraB1fFvCqUzHdKFjVUtB
	6H+ZWesSh8fVV4y3PPpAgvNL1kvs4YrUJAi+oIScv1iA88zyXG2yfkXMycQwIFRt
	4jfMK/TqgzY2edkyBGmyLJddVUVpXpmEdZfmJMyIiSvjeJfSx85zFipdFybgJ7Oa
	BfiGIN5eDO3jkjU254xZSsJ8lADx3uxnlRdKhvFXM1vDZUwYLYvbIIRGblQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gerdn8myb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 02 Sep 2026 19:47:56 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39af92138f9so391656a91.0
        for <linux-sound@vger.kernel.org>; Wed, 02 Sep 2026 12:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788378476; x=1788983276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UtK0az9ffiVXS6BRi5p/C8bg4TVrBl5o4jttOM3T124=;
        b=VDj0Oxe142mkoD6sREKujLtGmaVsAL9llZ7TisJBWiK/npzY5slGK3rv5vw0SuYLd0
         SzOFReGjn/Q6INIZGN+nXBuryLazL4Y2xzqSYpZuvrvl32CKNFct+RbqmuKC3I5yOatS
         FVRdbHvbOJ0cqJ53APquOsaktDnJW19uRjqID/swduVbQhVa0Ip8G9c5YLvs/GXdzm2j
         X+Tr4fw0xiXRfEesFU0MBXoZ48EI+DJnCY8/PzbOMbBr54KFiIr8+Y7LIgdOQjDjEZpG
         NKpV+QD27b9+i0I9GzTAvuE1DYMkfUOdZod/ukyDGzCNFOK0BSPpIjspH7K+NDNl6cXr
         NQ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788378476; x=1788983276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UtK0az9ffiVXS6BRi5p/C8bg4TVrBl5o4jttOM3T124=;
        b=I1xdE1NV7upWsMNKVga7jLSq1A9zZgTz1ZETJfv0rA98biMYndvzzqUmeC6tLpsjM9
         GWldL0Z2qnN1g4s48qxNWiotMtyE0cJ3xzMs7Q3b3GYh9P4HWHo1r93A7bm3CLVGnBvj
         i9L4HfAbioW+77vfoYmVOHo691dprcvvsYlABggjpsZto13aUOGNEWwSG4UA4LeyuZz4
         dlj+tgyxyJWsERTN4dQDQEvwkr66FU64WTZVAtGTa24SK10iJO/VPdtknTRGAdm0JOlF
         I25WzwS41bBQLYoj3981WvkVu1vAU1pCGRPTJvQg/EOv9NViaX8xPj5Ys4jASRsCK0En
         ackw==
X-Forwarded-Encrypted: i=1; AKwUvBy3HPYnDfW0j9WXGE1OUBrSe0rOawXiXvJyWiFu1S86AtvVGiVtuqHZd8fnjd8+fI7dGaMRb5ppGN4XIg==@vger.kernel.org
X-Gm-Message-State: AFuF++nRlrpxOReBgopbMGPY6cacoXtifMHMdd2MEL1Wkafoixiq3BEg
	viGF2XHDgn9Pbtb2VUjeP3g9jCPl8A74igfo9k6EBwFjM2oGgb7AnP6tWoF/2pmV4KZCCveHRFK
	xN2KrnilnSEeJQZUTR1Ztq2ugnoKKHvn2018/oDaYUENYLecEM989Z8wb21EzmX3/FA==
X-Gm-Gg: AYBFou165qS4Bexwc+pxsSaLuCzj2BoxLQxlxMGqt2noZZ5OhBBNvOSakcSevleKhYV
	JmE1ROwilDDfXNdbNoCDWNKtCxf3GVgZfDvjn3oN45St3uG+Gnc/J/nuxRudwOnCMkCsg4PhdmA
	whe2vV3iIlHywMVcgoRpiO8TSFTZLG9HHivJELBhcThXZd8OMOQrWj5qePrWcmugcpIKvzbC/E1
	uop4u4ck9AMmiNHiPWvCf+fnrP2LhQ6JJmG6anBF8B6G2sLFE8hgTuQuND7lzx8oNTPbhVBX8Tj
	luY1jajH0Qu1lPwvDeGm6q0FpzAxXldu0GAk7QZ92WXHjwVuclzLbrOoQUdysWrO0ziP98HFwrm
	kaix2CvczNfL+ytgnVDgxGjsJz5w=
X-Received: by 2002:a17:90a:d446:b0:395:c3f7:2895 with SMTP id 98e67ed59e1d1-39b07f2f50amr1517692a91.7.1788378475658;
        Wed, 02 Sep 2026 12:47:55 -0700 (PDT)
X-Received: by 2002:a17:90a:d446:b0:395:c3f7:2895 with SMTP id 98e67ed59e1d1-39b07f2f50amr1517655a91.7.1788378475146;
        Wed, 02 Sep 2026 12:47:55 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3325641b4dcsm307065eec.26.2026.09.02.12.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:47:54 -0700 (PDT)
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
Subject: [PATCH v2 4/12] ASoC: mediatek: mt8189: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:17:04 +0530
Message-ID: <20260902194712.2003414-5-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902194712.2003414-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902194712.2003414-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YcmNIQRf c=1 sm=1 tr=0 ts=6a987d6c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=vpwXisbvDR7QvT6TCt8A:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfXybcV75mWEB0l
 prNnAC3guIrCvgWsgbQ/KJCXw5kWhSfpdjgKUCheA7M9SrV39MnyxUblS/X4cmtkV3tc+9qdQ4D
 lxGXoYxN4T95DvFbslvdngBnsKDF/R4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfXxHsi149LvfFB
 hyTM8USc8Z9BUNBjDWlI4rbyDc7XLFJVOUq38gLH7ror8OsdNi6dql48H0jHMhCRnJNp4o2Sh6b
 9M5T4fVYQ7RN3Kv2LcFlMANTxYBYKim8cCa+3Zz944LM4iaW9K9lDRUGy9Hq13e/dRyUnWtYpsf
 yZ0XH+itFpSrjhvOVql0sQghnkVxOE93/w1/bD9v3CSvqOXfn8K1JK1JS+rZ0JiA90sCDpedhtq
 EM5LXRvpD20/V3sb3vlFDpcGABXACkrwVl4/YTHEEa+4bBR2vSb5XkGgGKQNFCAh1Z+yuqcoZRQ
 4RnvzCp3fusOju6sWWvcpfEqKrqO+ogDEvKOfHTAyv1QjYmLPsOlyjyldqVjll3XoPnrz8AAeGR
 BnzO0sMXLF2Gj3oEXGN4llx8cjQUvCgnXXphtiJ15kUOnmJtfTr6oBAovdNbffDaDK7Iq+3zvau
 /ZloNR5REsz4WnIWhaQ==
X-Proofpoint-GUID: eEVLpJw4reRGzj6gP-9z2vqYuOWkuJ6A
X-Proofpoint-ORIG-GUID: eEVLpJw4reRGzj6gP-9z2vqYuOWkuJ6A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020175

Replace the hand-rolled devm wrapper (mt8189_afe_release_reserved_mem +
devm_add_action_or_reset) with the standard
devm_of_reserved_mem_device_init(), letting the device resource manager
handle cleanup automatically.

Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
index 77cf2b604f6c..04baf7d9132a 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
@@ -2421,11 +2421,6 @@ static const struct reg_sequence mt8189_cg_patch[] = {
 	{ AUDIO_TOP_CON4, 0x361c },
 };
 
-static void mt8189_afe_release_reserved_mem(void *data)
-{
-	of_reserved_mem_device_release(data);
-}
-
 static int mt8189_afe_pcm_dev_probe(struct platform_device *pdev)
 {
 	int ret, i;
@@ -2439,16 +2434,9 @@ static int mt8189_afe_pcm_dev_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = of_reserved_mem_device_init(dev);
-	if (ret) {
+	ret = devm_of_reserved_mem_device_init(dev);
+	if (ret)
 		dev_warn(dev, "failed to assign memory region: %d\n", ret);
-	} else {
-		ret = devm_add_action_or_reset(dev,
-					       mt8189_afe_release_reserved_mem,
-					       dev);
-		if (ret)
-			return ret;
-	}
 
 	afe = devm_kzalloc(dev, sizeof(*afe), GFP_KERNEL);
 	if (!afe)
-- 
2.55.0

