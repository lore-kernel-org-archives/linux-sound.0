Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3137F4AF9D0
	for <linux-sound@vger.kernel.org>; Wed,  2 Sep 2026 19:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788378528; cv=none; b=dwpPQt6BABsL3EhgTXahiMTWVJEWlopArOJ9ERMO3ijJfZqq/6NvfD5g2vqQdmzeZRP9WcZzsZvkaTdkxOS70srOYZHKuWIV1SpPNTwigCR2oRzDK+y3a2vCemqhy58WoTEJv/qzlvWdbmaFcNkDe1oxJU0lPu1FDem8IoaNo34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788378528; c=relaxed/simple;
	bh=1QjMBio5tyeLY8XuQmgxMCoeC6yf5RuHxxyG7CG6bFw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X7Qb7ZUTpAAyQE7VxCx8QWVLer1s169GsXdqNSYb+WhiSw6JHkLcv/KvQM93OCNgZetd3gNnwst+yZPVc/xzrt78O3r9bwVhiIUAQ23RMsXpdGrHdmyUgAjwVGZ001zovOW5hTiaTYm5YPr77fIlHa+qlXb337ZuFdYx25m5GaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ETKoXRVh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LSbSpi+E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ETKoXRVh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LSbSpi+E"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682Hr3sO1714455
	for <linux-sound@vger.kernel.org>; Wed, 2 Sep 2026 19:48:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gCAbiQWo2ly
	p5N5aXBBod99zFdzxpccudIxmZh2QJ6A=; b=ETKoXRVhyGlZ7FSeYvMx5cgXRNB
	WqQbi89Xz6B6oNYmiWvwW6ZuHw9tz+UGxqyAOqtC8N3NHzZ5X48vlr68HYScqyav
	XWBvmFFBIjiifDXHAfhHsKtXe0VqEYwm+cPCWjDwmsgXLIRKWPcmqs5rCrvJ7qSq
	bpnLfc+S8z+HHPQ3Tx68AidbKngkkBHbye76ETr2t9S1Qs0jsncs7rw+4GTcYUol
	phdh+AGV6ks6n/f9jo3HWZ6Q4b5wRhnSCwyt/YB7sktxxcP1rpBk7wSsg5MEJ4a/
	9DYFvXF/pz6anNSb6fLzkkYkvYBaX5zS8a+LMGsAlcawlsY8Q7EpxgI9u+g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemce9tvw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 02 Sep 2026 19:48:33 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d9336581a2so25017805ad.3
        for <linux-sound@vger.kernel.org>; Wed, 02 Sep 2026 12:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788378513; x=1788983313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gCAbiQWo2lyp5N5aXBBod99zFdzxpccudIxmZh2QJ6A=;
        b=LSbSpi+EoccMlSE7IDQOD9+syq0NdZcu+0F9SfVzYs7yE5q6sy6Ly2MX8EC0BMWxZW
         L/dOgohNMGXOCju0G9yulhgLzTtKi1lkqJYOQBoV42Gh5weYWwDV7X3XUcYFUe2SXMGr
         0s83tNkJ21E8NrcrgzbGcH1KT6N9JEBAkqU2gwfXXoYf8vE45IOSZnmwQONEP9vyWUsk
         h2sEKKtgbjLtcgqvSxk2EWRBa/PqVnEQbfc5vfYOqWRvLa2lQwBts6PQXe1kOzumyfHw
         bkK8dpERsvqtnqmcaViWEXm3PkTwHw46CrCxS56DFq7+BNur8QwCIxt19712FCHIV9Hn
         jJ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788378513; x=1788983313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gCAbiQWo2lyp5N5aXBBod99zFdzxpccudIxmZh2QJ6A=;
        b=dqOP2Fn2jwaHv0HNta3gZ3MVY4Y0d9rUSYUzRbGgZhGV0ROtxOx7Ub+SHQmh/z3zEr
         9YEgRtgTM1R46KOfrdRKk4lXqSXWlFtg0Vdt2l1rJdH9ZESsF4RWOcdzaR17UOhqDxge
         cbCcXC+/3MBsAGZWK5k3wwxYlnzQM1VsOQhYheqTL7/No2ucG2BgyYMTOYY3dPH9avYT
         ITKWlIkVNa0r/HvbFgQpCMxWeqF/4zSiNDUI5hivJhV0f9fYgZ6h309BMMh936UyhakL
         Z+ftERfVanspjVCgt6AiLwErMQntxMIwFr8z3vfxLoj2KCqS62BD5b+5NBv+o3wIm35/
         lXxQ==
X-Forwarded-Encrypted: i=1; AKwUvByT5upO3Q+vCvIx2ZfMaNx7YqbsBzhV22bWEZiz6likD8dsX6DO5zjOFdamXp8BB+fASq1x901dK1nV7A==@vger.kernel.org
X-Gm-Message-State: AFuF++mOPFgpyQO6Yq/MGFJyyQIyrd6YPkkAWRw1HifQLN5RLHVqyG7b
	D+EPvIqgoyKcIDzfNb3dK21XzioVWnfcIqZH86w8lRj0qJC3FDu8cpo2wqOka9F0PCI73u8gJb8
	FQFxxrpsBb1jeXM0lpdHMqTXAb+CwP3lD/jXGIXqE0Lk3oV9jNJpAJiWAFyFFDwIn1A==
X-Gm-Gg: AYBFou0RbVAawCXix9YVI8BIQUZAG7CBEKNxk965LSopjnY6nN8+XaGAzC/tn1OQlix
	6RvwBmDSdTSDiVkgMReDN2RHHVL7wpvdPwa+VyTLFqWRFIzArbmG3Q2bM9KZeyiveFPODtw//1W
	RRTNJxFFsz4aqq9yXIiqoZVn96O/gTn61nMoB/EqFkgtQ1rSJBmDnVTPzwd/UCrlxK7iOfuXu1i
	2YH57qAHBsHuN4c7FXPQvDnaQGLHBIWfWonerXxOlqEa5MUU7Sj4xcYgsSgoc3BZA3UUnjxVVcH
	FptXuApdjiqhYWUD5i9xZU2ApmXF0mX5cC+vIXyTgUO/eEVuIYK2CpRQcOPczwuk8bLNt5cESnR
	6WqORwRP67sWfuS54KBq0Y2S8U2c=
X-Received: by 2002:a17:903:11cf:b0:2d6:fed1:7127 with SMTP id d9443c01a7336-2daec42ea99mr84258225ad.0.1788378512837;
        Wed, 02 Sep 2026 12:48:32 -0700 (PDT)
X-Received: by 2002:a17:903:11cf:b0:2d6:fed1:7127 with SMTP id d9443c01a7336-2daec42ea99mr84257705ad.0.1788378512363;
        Wed, 02 Sep 2026 12:48:32 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3325641b4dcsm307065eec.26.2026.09.02.12.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:48:32 -0700 (PDT)
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
Subject: [PATCH v2 9/12] ASoC: mediatek: mt8195: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:17:09 +0530
Message-ID: <20260902194712.2003414-10-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfXxFN+YQ3a7SDw
 +hcxBCxIIODW/GTKGqJoTkmt3s+q0s3kYtAZp/FnTTdwQYu4d2wsa+cYipyqAdljR8aXBxCfMK4
 k50NYC7S7NXP8HQ2CeeDPZJwj1fwIrnSRr8RYffm0hoZ/+X/Urdmwo1nKg0dxg1e80QCD0ARvvM
 xd2jyQ1UqaogAGUem6FlQmlgIMICIcbx4zrBD7lYNPOwwEf0Cet5pBAz5hQNn7VYOZp7A2379mL
 bujQyGkFwDr4eZWom1A61SEsO9w3cuF2BgPol4kNRpQH183oiW5MVezQMx2l1RZeEV+nxAtN6Wr
 84DenHANoTasuilxsk53kwcwdeuuXvZ4m0i9/+sqcSsW9tK7cCS8Q5Qg3of5EXLRQ3CgXl8wbn4
 Q+IOkHHfpzBsQbQfGTF09o3cxsq+LO/Wq1MvUHbDwlatJfVZ79mu1gxrzCnbU8ZUkGtW2j3M5mV
 TPbXmVZhebnlg6Km+Sw==
X-Proofpoint-ORIG-GUID: _L1Z8mZ1hY-37gHnz2msMMVhd_E872fL
X-Authority-Analysis: v=2.4 cv=QfpWeMbv c=1 sm=1 tr=0 ts=6a987d91 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=FVZLpNCcgjzkSGVc8gUA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: _L1Z8mZ1hY-37gHnz2msMMVhd_E872fL
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfX7cj07VR2yp73
 E6W1wSvJLfp46FD+QNH+KbXo4tOE7oCGFZ1nrNw0qQPkYGp5E/anACQfL4Ki8S5e+nmLf+cO26W
 Pxqf4juvSbB2ILUl+wFglaquZil+xyo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020175

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index bc0a63457cd7..52c3381e6766 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -3013,7 +3013,7 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 	struct reset_control *rstc;
 	int i, irq_id, ret;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to assign memory region\n");
 
-- 
2.55.0

