Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71BB42E410
	for <linux-sound@vger.kernel.org>; Wed,  2 Sep 2026 19:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788378465; cv=none; b=ISq3Xi448SOXIl1wNOcPQ5UPxG9+1D/ctQInRRUA9+lkCYiBRp/C0PkH8lXCHA+Nhn2Iy0FRUphgbvd/HTyLids3n0upZ72hcItezRsbY/1trhu7xKy4d0NCBa0fLbLI8GmZMqg6hYZE0X2obaggz/N49e9Ug0TFM2OozTfkE9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788378465; c=relaxed/simple;
	bh=dPPpn9wJlRyU9AKz4bmdQSQBWiSl9zCey5EwqA23oCs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dbqBArzQmUVx0anVwJKkRI/1EqKUlbjiRDq2ZMyN1AowR0xZ660cPol/idBXm6e5cfGyNAuIRgL01gfnLYe1c9OdcqgtrRp8i4VbvMVfk0e5/whAlRV9BvabfrhLaaJhi64rH7CJ5OUdSlhrzPny/kTvRTzZdgj8oRgtkay+P74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZZiYhzPE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Afg+2/Vk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZZiYhzPE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Afg+2/Vk"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HqtRr2975241
	for <linux-sound@vger.kernel.org>; Wed, 2 Sep 2026 19:47:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dJIDfPMkkp3
	4lRckWg9H+Qmx6WAEL2kiaibU5NHXnsM=; b=ZZiYhzPEh3cueO11Uk9yw3pog8z
	H93TvnrCSczc7ynU37V2tLuSwqtKdv60v7y+jdNrsmgPdVltqepXeXEzYjW26oqF
	ZeVDYRxDYszcG/nx1LOJyK5HM19DmBXiOPbx1soFK+9fgqoogiuUru9KTOZ5ySCX
	wHWg5Yj0kSk6Litwz5TnQ3bdApO4XGcPoi9Isj0fAD1RmFZkoTG9yiw+ykAkWOd2
	uhcgX2sBMoQvq6RcbS7LZrCnVgiROKQegrdZnIKQMKWRm5lYFX05raMQhhDh6mUn
	9pslF5pM65s4mqzd3u6M2dR3wI6q+r9VlWPo06XJwQaRPGVa8bQv/rp20xA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gerdn8mx4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 02 Sep 2026 19:47:34 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-399311947f6so2679791a91.0
        for <linux-sound@vger.kernel.org>; Wed, 02 Sep 2026 12:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788378454; x=1788983254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dJIDfPMkkp34lRckWg9H+Qmx6WAEL2kiaibU5NHXnsM=;
        b=Afg+2/VknqbosAqNGCH7j/4YYWOWIvBLoAhWCnEJWgxIAw8P1HNeLdg1whYuTAn/i9
         6hw5O0r97Pyv+Fhs19vLcMr4F4sJGhL410UyXM5gRcAKbXdm9jlEKVO7kNoUhlT7/hwd
         pf3Sx+udG7Pmq2sEVf0vRhxGeqRt6LIOhPSLS0ksnyHnL0TJqTlamKYguKet0ZGLzu/V
         VPQSGpbL23oGS+sQmvGvDkbMVf7gZJngz18lkbwq7A0LTvZYqJdN+H3g1BUvnjl4081F
         3tILZwmkGrPwY5ufrD1yi/45qoGpO53bFitXqPBuhFsx6pdmgPdOzTj1H/JSxGGlr9tn
         fB0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788378454; x=1788983254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dJIDfPMkkp34lRckWg9H+Qmx6WAEL2kiaibU5NHXnsM=;
        b=NSVuF6bDCivx6tlsHjRz+b9IrDObZPseJl5rmiuDkrheKbcebsawCwQo1B2FiUFZcO
         Ez217Zd8fyoS9x/tqVozas9GVPLbtZkkkWQRAo5GjxAWqas121ML5hKiIIQYdcx+2EA7
         SsJJTTz8PUVpgp3tQv2WOyGxsjTIn1IaSb29uNSBB/FyqwAJkEc9alR3YT8P805iVa7N
         Ud1GyUAzI/yOKf2PCaGp9TxVJ6rv1JolSxkpNanwKIrNQj5M3b161I+JYb5Pvs3i+L2a
         A/Jk3ipvAtSOKb+wjc1TsASmahhN5S3szb21Uk8vAQx+WwkwPX7N2YG/X26kMnegZjQ+
         MOSA==
X-Forwarded-Encrypted: i=1; AKwUvBxL+IVUnbzd0BmbW7f4AzAqwNUUBLcCpwbKXgE+HUNZkVLlqk/Uqhdb9rv81ReyjmlKL5xDYNb4CFafjQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mso2tKUA3BJFwquTsPHWrs5qP5mMO8REKsgZ1G5RkWdhuhxhsg
	cZ2qlFulB0NuWus28yNuZpTQe4egXu/QCtptG+c3JW6UNkbrR/d0Ti/2+blfMT8ijrFyr3o0+1m
	Wu4iRcOwB4smY7LFvsvPtW6Zsu9YBLTGncBqYdblnFZQnoeBeK2zdeejde1R/Qwp3wA==
X-Gm-Gg: AYBFou0TA/Ks2bPZSf0cSLvnLm2M1OhIUf7E0RzZdCG894UGvBxt6Vw6rIEUNq+Le64
	b/rERjDXWpglkyshZF8GDsfESo/xtEPlKZkI6b/qh+zoDCXKXXOf+JrjdC06lGmQqvh/CRWtrIt
	UETYxcinVQ2rrSnrn8kT6YsGn2ANuYdQ04YN0yv5yJZExA+o25nzITgSwTMzFDjdkTg16x0AHf3
	uH++wuHAgB1I8+gFKX9+UP436dmO2wN9rXSHIx53Jxm/K/QAsOsrlPu1j8Ec2IVVis0KgetW22y
	fq5AkRtLtth7R1CFCiY5WN0KjAcM+usTSmwvpPwF7Wqi3+YucWuS0ma/Usp+Uts2COJI1MWEw18
	+lhFOS87mnhrrEis9YGvnyyPhlm0=
X-Received: by 2002:a17:90b:5845:b0:398:cb56:e92 with SMTP id 98e67ed59e1d1-39aedf435b8mr11396992a91.11.1788378453517;
        Wed, 02 Sep 2026 12:47:33 -0700 (PDT)
X-Received: by 2002:a17:90b:5845:b0:398:cb56:e92 with SMTP id 98e67ed59e1d1-39aedf435b8mr11396923a91.11.1788378452969;
        Wed, 02 Sep 2026 12:47:32 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3325641b4dcsm307065eec.26.2026.09.02.12.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:47:32 -0700 (PDT)
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
Subject: [PATCH v2 1/12] ASoC: mediatek: mt8192: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:17:01 +0530
Message-ID: <20260902194712.2003414-2-mukesh.ojha@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=YcmNIQRf c=1 sm=1 tr=0 ts=6a987d56 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Cg4emjn-6EWHYnEhqz4A:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfXxJaEbXNHQzfR
 veQkEMwTftvgkjflNcWJ7zGY82oArcW8iaR2VpqDus/6eaNnw//Aa4Kk7uPMYjqC0XMj/YCdtK/
 ATx8+htMu9l6PzNxuqL1RWDUiDShvzA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfX5N6tAV3NiXA9
 h5RpRkscj5HMo5c29J1lIvCOZ+RVVFnrO+aiO+Bm0HrPLdYSXh1kIzrLWOOa5laC+fyoaygtmVg
 VaeQ0uwJvNG4ylm2jmZGosH8oM2r++ih5uPWvDYX9mQ+fXMUVINHHZcitD0e4h14J/7kuQb9szb
 vDTBTYw7jcbFuhj4IutkQH4Y+kcs5s3ny/lvdlmboyLW5ibcUH5saYSRYaZe0nLtCSa4pmeK5yS
 sAY9ZlEi9CipbHKatxApvDOcAkKYeenjb0PYimewBPLjCLKXCesTl5zBOL9i/C2ekiWGkvEwa28
 lxyGAcTEYZgQY06Tm/x/2K+eDNdOEtu7/MizAezqLlvw5vkkoLxNmIZor7Q/TTyZvRX61AkCvhm
 UQ3Jx2BmaIB0XgBNGjBgvX/NjLBrEz0xuucY6xFr8My88X2WQoSfAZ62Ibq9Y7zc5bEUlLBwvwb
 c//+ttBAL9SDm8ZHbtQ==
X-Proofpoint-GUID: GBllHWomiRNbgmomI03kz6sDWmfImmMs
X-Proofpoint-ORIG-GUID: GBllHWomiRNbgmomI03kz6sDWmfImmMs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020175

Replace the hand-rolled devm wrapper (mt8192_afe_release_reserved_mem +
devm_add_action_or_reset) with the standard
devm_of_reserved_mem_device_init(), letting the device resource manager
handle cleanup automatically.

Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
index db0ae44a86af..e4ecd23df180 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
@@ -2155,11 +2155,6 @@ static const dai_register_cb dai_register_cbs[] = {
 	mt8192_dai_memif_register,
 };
 
-static void mt8192_afe_release_reserved_mem(void *data)
-{
-	of_reserved_mem_device_release(data);
-}
-
 static int mt8192_afe_pcm_dev_probe(struct platform_device *pdev)
 {
 	struct mtk_base_afe *afe;
@@ -2185,14 +2180,10 @@ static int mt8192_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	afe->dev = dev;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret) {
 		dev_info(dev, "no reserved memory found, pre-allocating buffers instead\n");
 		afe->preallocate_buffers = true;
-	} else {
-		ret = devm_add_action_or_reset(dev, mt8192_afe_release_reserved_mem, dev);
-		if (ret)
-			return ret;
 	}
 
 	/* init audio related clock */
-- 
2.55.0

