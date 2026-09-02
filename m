Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EB34AE12C
	for <linux-sound@vger.kernel.org>; Wed,  2 Sep 2026 19:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788378541; cv=none; b=fff69iaPZVm9g2OVXVrpDbYJm6rWX96Nhvwob7fSDBKywjG4exvGg2mAFEKEHEPaMj0oVKU6DOgMrFVQtV72L5DPJlYrJLv38fVm9udtlag3beErXqjQiGjuTVEROPPDSONqwdmWWAvGRw4drif2bxZs8vqR3jk9muTdn5pFS9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788378541; c=relaxed/simple;
	bh=hmEwY0m53nnwEkX4V3TwqPketDxcr8ME82w4ZWL8g6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q6PsKrWu81R0e6rljAzFT/ctaqEODXTkikn/cvXSOXB8c9z33UTuN/kBCeDaxKcLIXfIOGvVLo8lvcnDY2Xk2UIcXAgk6inlHURW8GrX/9CG8dyP0S09uVmjvlJJyA8SePj/WzJgNftfMWPqJTW+5rYI8kGXqUnTjrGwu3DhvP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SrARi4tM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gsLAd16w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SrARi4tM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gsLAd16w"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HqmjT2270341
	for <linux-sound@vger.kernel.org>; Wed, 2 Sep 2026 19:48:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mSQ2wHhx839
	udlZk7WcsVOCsrQscw+jiuWWpRziMZZ4=; b=SrARi4tMGYt78Vw9iIalKH5PhfQ
	d47PzXnzCU/UuRGqYazjgueka+kdIHjj5YiZY16yem0fyH8wDOW4zgf+qATvlGlF
	RGdR4INSXrg+wZfUZZ9rO+Jloh5nDrYKke0VDt0LJxvCJc3OMvblSMJTlBH8qydz
	YVK+BAgvV3H68+2grhR8nGavPAg0q9RP231KFd4f6VovWkiVozDPLzSrJU1oa6xo
	vs+nx4v/Q0ckJgy469rSdDt6apzzy82ruQIx494vaolH3MBN0fxpjpEN5c/1d0k8
	pQAS+ofoSxareDrvTrXljVbHlUwkiVUSZ0b38y64aW6ZRRAnpZ0B9r7sZIQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gej2cae1g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 02 Sep 2026 19:48:50 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d001671a54so25215225ad.2
        for <linux-sound@vger.kernel.org>; Wed, 02 Sep 2026 12:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788378528; x=1788983328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mSQ2wHhx839udlZk7WcsVOCsrQscw+jiuWWpRziMZZ4=;
        b=gsLAd16wW7JodS9RoUUEeJSGyRPkvPtOUnBuPsimoI6rk5G1WNBM9pJ1QKWlSw+1B/
         hnYNRwiXA9jGI6wfRktBncCZFIeRHfleNnE03CNemUWeybUDo6iqAhy+CTcoOSgshHWS
         Z84joyvR5oyCUQgYA0GunVeI+t5Ecd66TqxIWM41tqgBQJc3eljJ5nyzU6xzMoAXij00
         Y8f36AJfwtWnMX10+qs7nNiBPfoxtPQgkcKpvNtaqaPwDy6+sNT5bedL92UCTzC2R0KN
         H4Fh/ZKMsjCVkMRHdjIWdMNtQkW8U0bwWQ61lS562AuAqkzZTHu/QR3R1W9ZovcZpYsi
         eu6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788378528; x=1788983328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mSQ2wHhx839udlZk7WcsVOCsrQscw+jiuWWpRziMZZ4=;
        b=hicCkHYiicE1JLet5EcZJmkEY+GrP0yZE30urNoy/OPvpZmjAs8ZO8vdQgWMvSjnUV
         D/aVMPe0z7+k3kCskZus8QF3YD2a5n9zyJKrRsax83TNpYi6gdZa2IElPMTraqbXXZN+
         4/mYzrzNG188T+UzKfeN4dIdhHPYoouNo3xYYt1X5EhLn1fKAAV88PI7xjGatgc1RYIP
         e3umP4Jo03sa9T/NWOfpD5cC38Avr0FRTv5tIZQYujTBSROxK4ee+dU5NBFG4if8rdDo
         u4uBRriQ84z66ndE0VIf30IlyrhUSUJClnT/SQOn2mv9cBBuEhEL9VOIQNc/zpUES/pO
         8tzw==
X-Forwarded-Encrypted: i=1; AKwUvBxuBR1Uc/2D/RD8me6+aDenxvlZMB346oB4YOLZwclzvhVHwVbvcfXBucPmhfFvghoW6IZC/G1Ka1jhzA==@vger.kernel.org
X-Gm-Message-State: AFuF++mx1JSgfb83YSXMwxUGih1oJyqB7PZhTDHpPyEJ40bKkeaG0TnG
	/eXhSAn/mZC/NaVc5SBaI+oKFJe3NLtRhWl14omiRtulVM6C2C6KkcTeA/vY32SA2u5IJGwAUQx
	8NYnfyIAnjPmn/ik8W85p59KtrX9B3unngq5SSos70K3ZZOsxch0PtPXROJriZM9jYQ==
X-Gm-Gg: AYBFou17KmW3d/Fs4sHQGSvpPl4MIzmrBTBPhwh6RC5LNgn9otNNVzF3GIf1nPMOQiz
	mQE82Yucvbp352WRmPvW97gm9QrNN3iZviNAaIksvQcKrQDthNr/s/dy1Rt1pF8pi/YgrPq8PZs
	NYT9n+asRvB4FByFd8bMHAU8yHRQp8Tsu4XDkGkUYh2f/tgwgW6SYMkeicPj05VR2ufrs42bnKR
	FOkqQMj3o3wi44sfKYjyD0iADv+W9ro+Adh2QNO6lcrhWTjZioA6nxcn/iD6uCJpwZRjvDLmGrc
	SifIakMHVhuzdW8XURlPJPh+/MEn2xJLalU+Eh8o75u79E5hCHb+6cIx9+sR/+qgQipB4pmwA9b
	66cXHI6M+LhIngZ5qgrc7MewA/ec=
X-Received: by 2002:a17:903:3884:b0:2da:fa6a:b04f with SMTP id d9443c01a7336-2dafa6ab21cmr26712115ad.2.1788378527662;
        Wed, 02 Sep 2026 12:48:47 -0700 (PDT)
X-Received: by 2002:a17:903:3884:b0:2da:fa6a:b04f with SMTP id d9443c01a7336-2dafa6ab21cmr26711685ad.2.1788378527226;
        Wed, 02 Sep 2026 12:48:47 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3325641b4dcsm307065eec.26.2026.09.02.12.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:48:46 -0700 (PDT)
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
Subject: [PATCH v2 11/12] ASoC: SOF: mediatek: mt8195: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:17:11 +0530
Message-ID: <20260902194712.2003414-12-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfXyeMaX+GCSzSw
 ZOtjCV3BUCs/XVzWdU5b33RsozUpQnyiSbn31MJapdpwFzN+lVAgQFZ1UEI8ZH4GGtjbBIxeiFu
 Z9CvlFlqxTwPM0PdIXdMRFqgHDbomKo=
X-Authority-Analysis: v=2.4 cv=G+ss1dk5 c=1 sm=1 tr=0 ts=6a987da2 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=YxFYfaw6DuWYmsw8bRUA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: QZWlsIPV2lY3vWWfM8pfBmaZkyObYVgr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfX2X3LPhuZuQmZ
 F5UM2pslBVqmuM4uhZJcMm+vROXZ3ITa7gxwn/HTngBJnLXMMmsqU2ddvY8/HYI5hupMmQU+Wn2
 G/vOx9a2YhXvKhkNZrMnYk7LMMcS3G0NeCZvG5FHuj8UBuLGQy9LIVj3JWrsKTIUU1/HjAu1zwU
 edN8Cv4uxWs5DdVIQ4TLwa/zbcPgOsM6AIfsUq4oBvUnYpaNl38ESm93D9WKQhGmwSCk1VhTYqh
 G+T1DUje8roS67I7xDpfp1ep5os8xUhbm3L+KAjymS145WeHmCuS4t3akEs7X/zGt+mqtW+cuSd
 5pP+kpZFVjHcGQFJvnPA/6z2xUZWNZpfU2QLznlqeYk9vdBEgNBzdJa4DZd631eEkX8CnfiQj/y
 9g2yeBOsmk+WyhDzaiHp7MYnMe6Eq34k73robtzwoy6RRCuWW5Rupx8JRIlEkX5e34yEaOLVRYX
 cIY9G0jeq8SKLYdIPpw==
X-Proofpoint-ORIG-GUID: QZWlsIPV2lY3vWWfM8pfBmaZkyObYVgr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020175

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/sof/mediatek/mt8195/mt8195.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediatek/mt8195/mt8195.c
index 4d6e9300a9c0..e4b6b6c18e02 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -49,7 +49,7 @@ static int platform_parse_resource(struct platform_device *pdev, void *data)
 	struct mtk_adsp_chip_info *adsp = data;
 	int ret;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret) {
 		dev_err(dev, "of_reserved_mem_device_init failed\n");
 		return ret;
-- 
2.55.0

