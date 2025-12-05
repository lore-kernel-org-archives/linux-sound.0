Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F1229BDAB
	for <linux-sound@vger.kernel.org>; Fri,  5 Dec 2025 09:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764925553; cv=none; b=VB55M8oMhtwyHU5mpHCyfWplJcW1MKGTR3XVKZzI47VBq3vu8qylRDsZsIPuzAN6SrhmJGfSj2ZBnYkedT1QIpgjpeTiRylXzLcOT5KmoDLEJJr9ZLUxsZnX/niASkq1yYyERHFAA7q1AG3thEplflt8ykfztjsTGJJVoYis53U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764925553; c=relaxed/simple;
	bh=D5eDr4xzGowjvOmWkzHqeIWKjxaYdZ9qZZpX6+cLp4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dwc8naCVBkQyi0YjLB2ZfOBQEZQqtW6bXcgOjNTIGQz967DUdYNktTITPfmgOkBRVJFm7zd0QoeedclGa8F3rI5KcRsgekB8LrRGPzFcm18bapiyvu6SoFBS9G6rTPsbIboGUiJsWGnrdwxgtQvkZhPKCN7AD6tl+JaOGo2L6t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pof1aBal; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NX2EheHT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pof1aBal";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NX2EheHT"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B58C7IH2297671
	for <linux-sound@vger.kernel.org>; Fri, 5 Dec 2025 09:05:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=llk1eGC16ywtsWcF7veOWW5ATLXtQxyibv3
	cBXyEzMo=; b=Pof1aBalDAOa6Rg6mk0ea77Bit/Vm6VXTsdTx8X2QCZJVH0yzn9
	YXASe0on1zdIsU6v6aky8yGEUHgVcgJtOF5TzsjnGt4yYRaxQT42J8iUqTyeGGzv
	6fKdctaUu9TBdf12fNamnWqC4yn7CIsbJfTlaXKMbu8wL/NWkWxulgPTZu0mJ5hU
	5ZgIaoVxgPSorK+xVN6rmzFR0Yp+XHneDuuXrzE9JowSQeu+SQIA27Yg2yrDb2mQ
	Rz80PV9iJSrb/IrVgKmkfgJTfYuy8LQ8+5z1MX/mHpgL+UbjDEmqYCpxJYiOmK7H
	cGNvKydM/J2A68KkzYeU6jAMMwKolN2hILg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4auknf9cs1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 05 Dec 2025 09:05:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b26bc4984bso681011885a.1
        for <linux-sound@vger.kernel.org>; Fri, 05 Dec 2025 01:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764925542; x=1765530342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=llk1eGC16ywtsWcF7veOWW5ATLXtQxyibv3cBXyEzMo=;
        b=NX2EheHTRm1LduHUTTo9rhxk3ofUcOceixK0dwHTyD+fOKM6mFvUM0bGQlCIu/eGlV
         89xspamisTZ1SDsYxLrSTYNWJo8rAVdqs6SFxSFtDaylFhk1r6MouQMd2Pk7z/5BYUDN
         V76pnygQzEsT5+BptzngPbDfzGAKj7vBskdu1EVM/vIb8lG1agh8zt1+n/NgsUmXzbGY
         ia+PYsM7nVyo2Mbady6m8gbjfuO9wJ7ZcsQAy5w+zXt68iad4T/NBAjQ2TcxZG7uyDY4
         nEkCgtzSU+0c0OfhQp2r9S/6NbZOqhZe8StQuXKqZgsfMVKDgRu+ZUERrh5haLCvjH8d
         c7LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764925542; x=1765530342;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=llk1eGC16ywtsWcF7veOWW5ATLXtQxyibv3cBXyEzMo=;
        b=sDf7388PpHpP1eWU9c1cBweM3qwZciJ1yIGVzlEs2cKQ/6IixrBcAK3PhKtC0cFy18
         2S25K3UJecz1nGNxflmqcbcstMelzbNw+q7fp7H75H5b53l8UihabWpso5w9ILyds2u2
         07tRO5CgEpRg1pfN90BFdu3SIlF7Hn4XBWLYuSKxoWYT0zwX+M/ZUk+4bBnRP910XcU3
         tL9tqOeR2BA+KNonyq3Qi8IqBF7cfdVFBr6KMQc6vHKi8ThVjHuWlT9hsT0ZkjY2xaON
         6l9U8Sg1ZtgslhM4RVmncUsyXgk/hkoTcb/2AoOV0IBga2D8Oq015TgmuERqSZBinysz
         kqkQ==
X-Gm-Message-State: AOJu0Yy6wjhw9YMc8hAb0Fcm8BkruCurj1hBYuF4FzgaUDZJ43QLkauJ
	W9DdS8upf+O7U0dd21YKTlHnzRVKhusGnZP4GAWbo7wCx08u/HieH+rZ1zczEjg3o4d3B9armYx
	CvkfHTIqmcvKM25i3p8Kn+Qm8+gcYxeu01IQSBBIAGyHm9eOI09fRhU8NlaUm8qCj+Q==
X-Gm-Gg: ASbGncv2aR+u89LdDWqSpjP5rDNFEvzKMkIe0+6ILy4B7Ihb8NkYeKMDyw6lk/ZeHYd
	O5EPadZSYinzy/9+eLT8/Wem/AWsFek2fGFHSuCYJVl7L0d58wC4Rq/bD9uWam8mOCf9AcU0j2r
	iW6Z47MjMO6i3xPYVQGI0I5rZY3KsjFnPzFLsXHxenMz+fjebb6gKHCAKyo/bW0Cno3NmYj2Mo7
	YF5TxCxMOQXYt/3stTvjvf75U3JN76eEXrtDXgMMWN8kUc4dwT2csA4vBVilQig69dMOafXS/Tk
	k3zVAxhVXjX94tRZ8B2Pz5EkDw+DwTihH78TtEmuEISmdWHPYXr1huPeDetB/dGcKJZMa4br3On
	eIzT+iHLjNrVu+c6EE4kjOPAfdwCsdI9YYA==
X-Received: by 2002:a05:620a:29d4:b0:8b2:767c:31ab with SMTP id af79cd13be357-8b5e6f79975mr1233134785a.60.1764925541920;
        Fri, 05 Dec 2025 01:05:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHA7qw+pt/k4ChyYdWfyeN2/q6Id3vwftwW+RjIOPL2Goy0igC6t8QyyTPFzdftvVUAu7Ekpg==
X-Received: by 2002:a05:620a:29d4:b0:8b2:767c:31ab with SMTP id af79cd13be357-8b5e6f79975mr1233131885a.60.1764925541489;
        Fri, 05 Dec 2025 01:05:41 -0800 (PST)
Received: from brgl-uxlite ([2a01:cb1d:dc:7e00:53a3:2e30:5d7:1bde])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d222484sm7838258f8f.24.2025.12.05.01.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 01:05:40 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH] ASoC: davinci-mcasp: remove unneeded #ifdef
Date: Fri,  5 Dec 2025 10:05:34 +0100
Message-ID: <20251205090534.27845-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA2NSBTYWx0ZWRfX0ovlqEDLwIsM
 vCLUnguqLYTPsGowALw3/YSjw184sNC33xwIOSWFtaatbpthrCWzGpwzOU5By346NkSwpuLQgEx
 jJ5yMDgkh7gJLBJUm+NlopPVqLlEafAq2Kd3GhbRBk2ZvCmtDYSi48zIuu3lQ7UlFsrMnpq8f8M
 L7mP4WAPp89//CMtHX/t15LK02ao7iOI+4FxNuWHrX9lVu3cotAN4upgpAKQfHojJ+MRHzoSy6c
 hX1FTDVh+mMh/oA/Ebi88Cq9b1ytCMomEhf85pIOG8cXXr+0duG7IzEAT3OtMGMItV3cDb3aj6l
 dNl6MrjL2hzKJFG8Q6OIjjBOqX1kzBAdLXta5QYFFh99soBUgvIA3C07MaHUWDPv2cJBcZH8s7T
 hXD2oB1zNzaPwd/edmdQkxxWRhPluA==
X-Authority-Analysis: v=2.4 cv=P/Y3RyAu c=1 sm=1 tr=0 ts=6932a066 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=dAgCQX_CjGVSRqlmduMA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: vv8wUCUnXH0IHlqsznwouZDUcIpdgiVb
X-Proofpoint-ORIG-GUID: vv8wUCUnXH0IHlqsznwouZDUcIpdgiVb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_03,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 clxscore=1011 lowpriorityscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050065

The enablement of the CONFIG_OF_GPIO switch has nothing to do with the
"gpio-controller" property which may as well come from software nodes
and GPIOLIB can still be enabled separately.

This driver does not call any symbols from gpiolib-of.h so has no need
to check this option at all. Just use the generic device property
accessor.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 sound/soc/ti/davinci-mcasp.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
index 621a9d5f9377..db6913c05378 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -25,6 +25,7 @@
 #include <linux/math64.h>
 #include <linux/bitmap.h>
 #include <linux/gpio/driver.h>
+#include <linux/property.h>
 
 #include <sound/asoundef.h>
 #include <sound/core.h>
@@ -1875,11 +1876,7 @@ static int mcasp_reparent_fck(struct platform_device *pdev)
 
 static bool davinci_mcasp_have_gpiochip(struct davinci_mcasp *mcasp)
 {
-#ifdef CONFIG_OF_GPIO
-	return of_property_read_bool(mcasp->dev->of_node, "gpio-controller");
-#else
-	return false;
-#endif
+	return device_property_present(mcasp->dev, "gpio-controller");
 }
 
 static int davinci_mcasp_get_config(struct davinci_mcasp *mcasp,
-- 
2.51.0

