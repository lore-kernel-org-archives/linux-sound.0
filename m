Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B113AB260
	for <linux-sound@vger.kernel.org>; Wed,  2 Sep 2026 19:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788378512; cv=none; b=bWK2QFNpFpkSigE+atzy39hKKHycFMMDlP2VZ1YoSSbUwjKQp43tNcs0ctdpnkBx4ahOwscEKFgwZrnBmO57bO63bXXngzfX6KfIs0hvm1PdIcmyM/dKqs2Dh9x7oEytv49yvKiLyOVBH71XmwoTJgMUs3x+y8bd0pMZ7seXfNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788378512; c=relaxed/simple;
	bh=UCipgd/TO/vY2C7qqQPP6j1/jZMLJQlQaBZ9luI8+JI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FCMB5H6iJOK6R9Z1rsZuCaRjRZ8m+J5UfELZYtHRrkajB8qPsdY0l3O9QfIbhiEeZtMYemTOhLMqJt6n+cJwg1e0z0b9rUUFduevUf6QG0t/Nm0KOgK7s9JlGWHFgNP2/aVnUMrvus0ODr20h/MbDuabENLV9RhZp/+iXylp3rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B7olY2gJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XN0Jo7OJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B7olY2gJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XN0Jo7OJ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HqtMO2209575
	for <linux-sound@vger.kernel.org>; Wed, 2 Sep 2026 19:48:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kbPay+R8Ceq
	eWwn1FICo6sBaCOUhXLnhdoFXPQxblH0=; b=B7olY2gJGSIpj2fDG7L2gIFqQ6e
	JT6tYIqewvY8P9NfqErInwKfDOxU65KUH9vNSJx5G2VaxyA9ypw3cZle1gWc6ULB
	gwBBO249bNezUJRRvS73dLg3cwzIdBznUDugkYJIFuI9xUmaMJEysCaimOoCaOek
	i0ifSlEgcSv1cZwp+veeS1PeFh1z86k+PgQArqsL5ZkhfBKZNd1cKiHW1OVacwWK
	dH8540V7hmM/Oy3PIQGTDkGKCxqZ8vjwXZDkMDzoANPs6Z4nlOmSjRO+TN1dmr99
	hdB2oGdoSz38s6Nbqu7u/0FJ9lrvOI9wXJ6XQQv1j8dh0B7Pp5mIduLIbrA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gepv5s1ns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 02 Sep 2026 19:48:18 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d6f75c1219so29462925ad.3
        for <linux-sound@vger.kernel.org>; Wed, 02 Sep 2026 12:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788378498; x=1788983298; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kbPay+R8CeqeWwn1FICo6sBaCOUhXLnhdoFXPQxblH0=;
        b=XN0Jo7OJ/EIzRm64N45MYVQIs/2LfCWmWE+2q1LnX+87Z350HMWMLZ1ndtDq+eiO9T
         WUGTDKPyEHV7Q543eqnfad76iLaZ5xwh0F1yCwMbrnedaSW26uURNrL+a+/EfnaOPPMZ
         n/TNKHaZsCnA0dQJO4VtLaM+l/L/lYbW+4g48/02yr0Pecjg80YyhPEgCZDbZotP9KQa
         smAxrdqqTLkHhavwP8ArehXa0pY6VHmIwf5voGGAjHDoQAiNoye9KXTsnAEGm2Xd4heC
         XJjSx2cSXOXLKkGkK2Gx0utd7VIbdHoek3JLCgLMyOMbGOkLMHtMHn9dKv+2OYUdgd/L
         ehsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788378498; x=1788983298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kbPay+R8CeqeWwn1FICo6sBaCOUhXLnhdoFXPQxblH0=;
        b=JHMQsbKsI2gRWS01Ib0Gt1cLIaiv/Nxzl+MwwfSeM980zB9erB0uzOFByy6ae2737f
         RHJrlGtCrM5Zor8ArrrD5m+WktbBatvU96Msol5n65V1xCtJGPRximMLGQa+Vh5Qy//S
         JFHKt/+XqMa14sgLYiPw1KZFIRryTrW+IbTjJTkuy65PgRuWjcqrzHNVTDj50zZu9ywf
         Gi8k5QXxaboExdFd65eBcV/cWxI4Ov94mAy5ytlTlDPwrV2AMSQf8ALkae/1U7IJmv1+
         bURn7FfMyHS8ZUA/ck1t+Lc+niK1r9yJ+fRItFRkHFuBxNAhsJQ52XtkA151iIU4yzf0
         RsFQ==
X-Forwarded-Encrypted: i=1; AKwUvBxzaKcPxz3QeEWOtkDDb/4svOKr2xA23FkGU0UVNxQQvpKGVr47gjBt/8JLMHJT+KuBXrQBeHqbO5W3Yg==@vger.kernel.org
X-Gm-Message-State: AFuF++mpQTq4TXPORIcol2QZhJy6tmlh9Nift6u6O2vGfHafWUPDmqMl
	Rb2YUBOHBA1EibsDwbEIOXkvcj0365F4p2bveQHrv0c6vVq14gTJOoiOK6YfLO2C9oRhjsv7MKn
	qBR7wq+jGvngLAzjIN7n/Z+G7lMRMxJ/R/qrJETO6wAA8bcFMoR7PLAELwtqt0xh88w==
X-Gm-Gg: AYBFou26EqpUzSrCyyMOd7JmltnVTYhQ/RGwbQpm9T1kCEax0q6FaMfJxX0FMOjaidX
	9/68asujHZ9F91HsJTeDlL1gqq4ndGXGgVcgnZ668tar7S5+qdUlZ5zpcteQHhlVJEmwjJAwjmC
	hYo4XHX8mUENyfXELk+mTNWFlGu1OHgG3Xxnz7Ncvi+bWaL2M/Zz7kNwMR9wy5OsbiJ6N2vGVWY
	qOjfm8ehqauCQtydY+CsrvmDsRBYtJbyDW1jYg+t3s3HmlpFPxBq01Vau8EtJmuoVIpRs/mwVuI
	SSE80tW2gTCHzATTC5Wtfc5Vcbdv1qmb7sLrJMseR2l5CxqExFVo3kiwQ5NhwWpqp8Bi7fEzIXR
	TUoOmDxI7PN8oVJfALxhP/hXf9h8=
X-Received: by 2002:a17:902:cf41:b0:2d8:d4d2:dc9a with SMTP id d9443c01a7336-2daec78a390mr108998495ad.22.1788378497914;
        Wed, 02 Sep 2026 12:48:17 -0700 (PDT)
X-Received: by 2002:a17:902:cf41:b0:2d8:d4d2:dc9a with SMTP id d9443c01a7336-2daec78a390mr108997865ad.22.1788378497411;
        Wed, 02 Sep 2026 12:48:17 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3325641b4dcsm307065eec.26.2026.09.02.12.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:48:17 -0700 (PDT)
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
Subject: [PATCH v2 7/12] ASoC: mediatek: mt8186: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:17:07 +0530
Message-ID: <20260902194712.2003414-8-mukesh.ojha@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=T8y8ifKQ c=1 sm=1 tr=0 ts=6a987d82 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=YxFYfaw6DuWYmsw8bRUA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: fIs8M-kvqtYsRkj8MhGIbFJTNECDM-ft
X-Proofpoint-ORIG-GUID: fIs8M-kvqtYsRkj8MhGIbFJTNECDM-ft
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfX3qwBT6ocFSKJ
 Ak/gfLKmn5T6aIEtQTiVt2ZvipqiVqHkg2QfNVB/U3Rz9Wq2Q/kF+NJBjdx8ax8MwJAMu+VKbMe
 UGaRmyM36U8H/RRenWsOJrUa6t4piGruTZkUVWbFPbhE1jyUqRG1+nVenQcg9gi8RrAFtOqr7XR
 xAKkBnOv+HGaIIaGnLfhgmCfL1KUtpxqDqowupL7/cuTk1Irpero/PyKcNBOvo/VHSBrr12RrI2
 8RAuoc37DxthRxRZ8Ha0XNd7HxWT+/wifKbltZW5Bc49lgBRAIJGlpTr4iOBqIpZBkumj7+kFFh
 ztmYR7xS3NFVZgcOSit42j0Vbd+9++f6YgELtoozwbnF0gclzDbIQz74sxUSWJd95CpNJLNXsFj
 uxsoSY+L1ogDXRQGDQmHwQGk6L8qzNPmr9Le/VdM5VeVsEaXMtYQOLMZxP28oTj5KQ8Qr0Ztr5t
 cRKAX1pnKhMOnWfqF3w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfX0C8hdiqICDTD
 4Xbabw4be0WVdwrl6FuN6pufW1reIxyD4WRY2WYRU1JwagoDWfWWIbmaqVKaXgXw6+sT5qsFI5f
 UpI75U32L5BTnZRagGauVi02lRzFct4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 spamscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020175

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
index 44a521c3a610..60576f885acd 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
@@ -2836,7 +2836,7 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
 	afe_priv = afe->platform_priv;
 	afe->dev = &pdev->dev;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret) {
 		dev_info(dev, "no reserved memory found, pre-allocating buffers instead\n");
 		afe->preallocate_buffers = true;
-- 
2.55.0

