Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1E42D3733
	for <linux-sound@vger.kernel.org>; Sun,  5 Jul 2026 19:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783280461; cv=none; b=jPzuUGXlAcmBksTtRPf2zc3pGjmib2aW7dHmlJxc6ZaAQrosYPjvjpbmPngTpv5po1z7OvH7cg/DsWZX+xrDXCF3tBc6BFCLCGFnwP04W7SMRV3H9Smk9a2GHOnDaykQGSfpIWFtCpWG+VXg02Zx42CGHd6JFGjfJ7AR/8Oc7+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783280461; c=relaxed/simple;
	bh=v3ifKCsrwDtuvCvlwDYadGM1Uonf2WH1mckdOsVySyc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PQL8hWzwWbg7pFlAomH2NZNFpqntv7u965je3bImx8jyVMcGDWDs6MaGaptM+IlqIOJ/wDKX5NgKLWFAIyFLd3mJkCorBtZklG6Ic3BkllpOVH41gIXJ2JM9uIUGldrBQwaFzaSg1RDDnS0qxQ+m6qsY3k8ewTW01v/LG9W+e60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hPcw2XE0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ki4huXFc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hPcw2XE0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ki4huXFc"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665Hj8vx2317385
	for <linux-sound@vger.kernel.org>; Sun, 5 Jul 2026 19:40:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3J7+oNMk7WM
	Q4KOiVM1+PpfhqlleI9nCGCg735LegyU=; b=hPcw2XE00hJiXGUlPJdzgAHVQzT
	3IKBxTpsdM3YltXY0Gb00tp8cyyqr2jLji+CKNDBWau5JTu+BreuyR01af4GFyfv
	ngpGWe//C62ZWMgkGJk4zSl0S0wOJ9lpQw3JAKnLg2fIs5pZCB7N4aamjssEjqJr
	56eMgt2RR1Wu9uGyx458onBujfZX4GqD+UxQKYZvfMFk6K6CooiLxTXLejKO9W0R
	0jkXD7cR55aEXj06BsfreVAtJNhMuxZgvDsgw5Rbn8a2yz3zzklaCOw3S6PIDyNi
	LSZAc2ZKjYucaa8JgIZQNxudHkYVpBDXyT4e5CmqkA1zH01od7f0TWn9fNw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6t8uk9tj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 05 Jul 2026 19:40:59 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c804e38c65so45319175ad.2
        for <linux-sound@vger.kernel.org>; Sun, 05 Jul 2026 12:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280459; x=1783885259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3J7+oNMk7WMQ4KOiVM1+PpfhqlleI9nCGCg735LegyU=;
        b=Ki4huXFcopiUnCi55PmHll9dN0enRKHhl3SR+texrrDbfxFUA7YcAbqswPPFZUR5Hu
         trTCi/r+LieHmgndCX+yybgp2kntxcI/sTt9zQ0ci3nSkdKplKgU8nMY9wZZH+RQmkkM
         6pQz1v/onmqnWmZ4W/bUhgIHDYJkAXQIDT/f9/fFD9fFly0DZVgxPG/UmzOjzRmybFIl
         6uk0k/wuONSStO8paHob0mxdQ2hOXYbS2j+Wm7AJArNYgZEV3n6JEZ260E4SB54cpCRV
         H6T1VsK/F9uPAAeOpQVxJTA8I3T0zjEUsZsjjr6xqBs/3Ljk03DYGzkvU0NwQxWZz/dh
         7itw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280459; x=1783885259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3J7+oNMk7WMQ4KOiVM1+PpfhqlleI9nCGCg735LegyU=;
        b=o3Sc8komH3fbWTPEhgtntV5SZ0x6rI6tMPgT+2tVj60/ijZOV/u9eshtn+yeJ+Ikh3
         PqY9QqiLpAF5l55v0Y4WCzE8NJ1dqyiVXwXK3inbDhUcGoWX99bIeUMHdjAclu7CBcRc
         3Cgy6JvQz8YVEfRgB/ARMZoxlh0VswIY9a6ND6RU76kTfg7Up8Kp27cj+DRFJdQ3XNsf
         uvrNEhqGPFEYZcaS4R1yMq4wnBqF95sVurYruvgVWNMUB2jiITWUX9aACe+4Bq8jN2FX
         WMkBGV4kD4Hm2wV1pIitjPHq/ZVvCEwbWz+y5c/d+Ioh8MBL2D+5Uby9wb8aPyVDAldV
         U8FQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqdgbd4KX7HvCS6SNXJDiPn1ni2LDROQvRb7TBPiBIjN3I+iSfgf1tZI/A/dhCT6Szr7BgceQNlyEJOnw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpjnlwKbs6u7O2AqTatkQiUojmjYRJKJaru3ggOZiGLG/+0BSx
	PC5HpsGpqN7AYv6z7q1EpsQEf1pRddrRgf6S244pmWD1SVYlnqBsr2Fv4GZMzQalh3guQLiStDn
	cRq/n4RDhfge0jTZC+vMRD3QWiC2iVIHjlkgNRZj3HuV8nkDE6ipKgV7vzw4Rdh57Pw==
X-Gm-Gg: AfdE7ckFyPJcNYXcYFt8QPt6fhw3IOvnVHEnrRTCNPlwTW9dICTg4hE/B7kIwB4kVpS
	WJOCpRdrmngI0nywDXYXkKqUMcU+LJryHY4BbzIhN/hLX4RcSl1biHsmAw7ZeiDqzpdzfM5ICOG
	LMMNCS7+QWY5EV5YFJV3FnV4jCIomYjMvU1q3TRL+agwpSqKLdqQs0ERpsVt+QOhPz2LfhjaL7E
	8h7R4H+f86WK2li3/nxH0/aZAtDEhPyUrelOLeOPQ+zqYQUuNUovM3AN2xKlyugR3g0C5dvG2Ls
	tWSKIirTMliTXokK1N28FOtz9egNty9BewZejKey1OpEnBtYsWsaskuyuO25PG2MzJolIcslqa0
	oRxf5sX/LbgT/4V+C7o3mTow2rjz2JqvM5EEtRg==
X-Received: by 2002:a17:902:db05:b0:2c8:1f1e:6922 with SMTP id d9443c01a7336-2cbb9ee11admr72369395ad.37.1783280458794;
        Sun, 05 Jul 2026 12:40:58 -0700 (PDT)
X-Received: by 2002:a17:902:db05:b0:2c8:1f1e:6922 with SMTP id d9443c01a7336-2cbb9ee11admr72369145ad.37.1783280458256;
        Sun, 05 Jul 2026 12:40:58 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:40:58 -0700 (PDT)
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
Subject: [PATCH 37/42] ASoC: mediatek: mt8195: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:13 +0530
Message-ID: <20260705194019.2565498-5-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 30FGrZ8ysV3djYJAq-UFS_9Idubgr-DM
X-Proofpoint-GUID: 30FGrZ8ysV3djYJAq-UFS_9Idubgr-DM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX6v8fJ2ggaZVw
 2jX32r2zq38YqemcOG3OMMCVR9UjAadPC/U1JSTd6+0tavW82FvQKhD1qbCyDNo3l2IOyWAFWmm
 IgbbUjkaVyt23eV/d/56f+a379W2KgI=
X-Authority-Analysis: v=2.4 cv=MZxcfZ/f c=1 sm=1 tr=0 ts=6a4ab34b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=FVZLpNCcgjzkSGVc8gUA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX7kMr/dERNUwJ
 iFiaZ39ThB7ukKWG1Ukftn5rVB0xJpf+hZUgPbdfToh5MYCVnZW8NjJOSpgBfIi2fSEBP2W9/kp
 v3uYbzPGsQLSNT+kWO+AGvgbSrJlaxaxw5LRevLErBVZe7zDnmAdVOdd3kCUYw7IEn7+yxFfQcC
 KQL0wfKUxUkqSweR5lTzskixqWP0ywck8MJCiVFXK4L5vHg9wQ6TRb2F44uP/cQn/AqRvQ6vyrm
 zBe4obHSh0oEnFnQ/cS9VUDu91ulzFgJIRRtTSFhMr9z6xx3bl9UzK1143TmDUF94/5z5Rgc0/D
 NFR2liul7mcpTemOH4YaZu5ovYo5M5qKLaLH1brgcUWwJw8f4MVBu0ZrPcu8GK3S3brJh8Z8EFG
 mc2OIOkzQ85RANsKeo9DUNgnvFqwWXRankcepnX5GXKWYOvP1u70f+vJ0Li33j1cZbxrRNDOvS+
 WOiQb/OWy5KjPHnziDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212

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
2.53.0

