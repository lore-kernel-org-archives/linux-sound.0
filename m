Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58EBA36BCE8
	for <linux-sound@vger.kernel.org>; Sun,  5 Jul 2026 19:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783280434; cv=none; b=cC/LiyjKk8eYZYuVQg2+GaIdz3pCNo1AenhASCHgYdxm9Ug7OvnKL8X3FVVnQtzcJodfUof2DMZFo8P4HhC7sbyG7j7xKVBPLaDJtsrhQVUNbQ7ejsxtma6VQAFPqmBQkpGrY0j+DYJmfvn8alEnkkTWTJWWMIHmUzp90Q3AbPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783280434; c=relaxed/simple;
	bh=hPzzIh+00z/2sTyljZcHfK6TfnoHNAT4ontX894B59I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XxsKvfKockIv8xiJjwZAIqaLaFnf8VfAHdZDb65DL7m+GuLlgwGzo1BaMno+7INWNiIpmeuDMTr+IBByWcPYq1a1ZeK+u+QHG6j+b6rq42PpXrNKXtjs8/OpdxPCykZ6ndRDVhnjegsWul/qEjVYlWY5Uw+s3bPGVyNu9Dw50u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EDqYFdv4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hTA9Hu8K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EDqYFdv4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hTA9Hu8K"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665Hi2Pe2314812
	for <linux-sound@vger.kernel.org>; Sun, 5 Jul 2026 19:40:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=03p+FFlmwi4
	5suRC+aZpApiuhNt9KA4gObs4WxBM+z8=; b=EDqYFdv4Pmeqy9IR99dcNiLiDAT
	/yuTE7Ljg9Hev+D7GIua619X8FUaXVlexko06UWo2I1UG1HwTHa/3pcOiO1FNKdk
	YiY1UO4+AP6rm2LO5F78feakLwRgePs5DdWtrzsXwhYCgTfecFqPFRL/MQqcfyO9
	pb9r2UQAkfcA5gru+dfTHa2mdfv7340zDAANejxt7cH1lKuJqEenlOMOzxtkjth3
	hBP3jcZzSc9vRDjWjL0r4gMT/svWmjZh1dvVGSJdpYFTDJ+ZtuRTINMxgHG6Wmig
	3zizUVw2wRtMv7D6VUvWZqVy2hRD9jXlwyfLqvXinpJSMddoU1sfRGdzOYQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6t8uk9s6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 05 Jul 2026 19:40:31 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c9fe4c5eb39so1236034a12.1
        for <linux-sound@vger.kernel.org>; Sun, 05 Jul 2026 12:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280430; x=1783885230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=03p+FFlmwi45suRC+aZpApiuhNt9KA4gObs4WxBM+z8=;
        b=hTA9Hu8KPQHszEz65Og1e9gCQW2eZ/sQXpMHuEmDsIJTuSZhlakz0b6YBehrxZTRsf
         mtBtQ1/+gV5LKqBDYlUXERKyjBDSvb4rzy7nmdLvd6sclFPtLuwfp3MRBLc7J2YLY3e9
         pEs5URSCAJMxiExSa0RQY4a8qSd0whJb1J8VH0KjHnQmoHg/vmWgaOYJdS105iy1dPm9
         wJa1dNDQdLzfCWekV4C4TM3A0PCBkn99UKowiL4UbwzPrzHhmGisse2fAJAgNNMYmFDk
         F0hX0peexMwNXI1r8lREqei+PM259Y70EHyCtHvZeCQ7hx+YgDTdg0tq97sN6IaHtrt8
         7v1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280430; x=1783885230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=03p+FFlmwi45suRC+aZpApiuhNt9KA4gObs4WxBM+z8=;
        b=aCj5O3dAAWYHNym4N4buNUKKTPdYMZD4B6UKYVVpsnifrVYil1qiwxhrSO0QrAsJER
         SqDlwHgOhNPzjPYPXhdQdy53j0O0tac9gJGdIhr/5HebEXiCXBO2OdOggdA9bszz02l1
         60pcjLab+WPPHF3M3B/qNO6YycAoVqK0QoQXhroOmmv5CCuxQzvU61U/lwkedl+HkVA4
         TbFOaOoHI3ywgVgTI0i+Co6p1ULAJC4Hm4/pZcwJsiJmye8viLA486acGI6M+BfOyzOD
         LKsrPPM1LYQ5Y7KuR+LgE57IX/wSdiGPcYz+6H6NedVcIHXavf80qDgdw9GivFArmmvp
         sT8Q==
X-Forwarded-Encrypted: i=1; AHgh+RoEb0dzS5SRDiy6RdRWuSSfKWD9fWFLVQUInBYXspR3AL+pAPyBKvEr5YsjgHsbhE6plS/ljJ5MBotQog==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSLHL3HqMHmkTE/Tjgyk2rUZHCDscG5GnDa9KoHcU91sMzOP4s
	xuw2KyRXrKGyEKj6uMftBWxPTrlVCvRWkEcWxUXesYL6tQqltkcCjxwdLfefTyHCKoKz43yoTXj
	QV2MXZVJylYLLKlio/m/uhWwWytiUOM0DDdIOMAxMkbbqAfPGanst0bhv1HAP9mPNtg==
X-Gm-Gg: AfdE7ckIjONFBfdjgb5qdcJOCDHXXuRcnJOPtDfp4dYuIyP5qFk/N8ZZ7VxC8ILJT6k
	rga04rEWaXmwzJz1TUXOmS4K2bE1ofFuNp9agVr32QQZd9QypXV5iwPNInVa2YI2H6pw6Nuc4BC
	5Au8dPD9PDsYjC2XERYbcEIM/1x01c3Vf3VE4RnT8Cwby6M8RKP2Hj0/ESi1uPMAHsZT8ui9xNx
	jVRLPxrE69wBMbDb+9CmDp1TaQrWEqnRsCrg8KaeIiMzjMYKsTbA1MkjAOdgkG0SCpYp6zLFgQ6
	OINL+oT25y6vNp+xzmzkUDwZ+NBnL5+guuAfhByxnhPh71gUowQlQBgAPOE6hjSSATWYezCg4/Z
	bgJfQrIH8W6l8AkCdFuxNZXEfauFogFltnZ3A9w==
X-Received: by 2002:a05:6a20:a122:b0:3bf:9944:a8d8 with SMTP id adf61e73a8af0-3c03e3ed638mr7693674637.34.1783280430280;
        Sun, 05 Jul 2026 12:40:30 -0700 (PDT)
X-Received: by 2002:a05:6a20:a122:b0:3bf:9944:a8d8 with SMTP id adf61e73a8af0-3c03e3ed638mr7693658637.34.1783280429779;
        Sun, 05 Jul 2026 12:40:29 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:40:29 -0700 (PDT)
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
Subject: [PATCH 33/42] drm: arcpgu: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:09 +0530
Message-ID: <20260705194019.2565498-1-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: ArJMGspxixUOV7AD5eb71We67dZKPc9Q
X-Proofpoint-GUID: ArJMGspxixUOV7AD5eb71We67dZKPc9Q
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX6Id6hVMSC6Cx
 hAYEBxxhQG/HGT78OUKAZxyTSBcuJiNn0aIWAYI8Tgx5svEfBhPjO2J4vI1v4AMjxkCL7dbCNPc
 fu/w6s2ePgYRTcwQSsSQ89BBKg/uCPg=
X-Authority-Analysis: v=2.4 cv=MZxcfZ/f c=1 sm=1 tr=0 ts=6a4ab32f cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=lEtn7xO9CsvGDZioIccA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX+2xtgFdJnwEL
 Ny/TXIZs9yIA11liUz1O8/Y+dgwnOkjb4oe0ljSxstFaF+7V0mWEbSLQqymUSBqYJ7rH8aaPD5o
 uw0nUakvop0V+TzeeW/h89JBivOwMjtxCdyRVeFy/Huf+teykRJYESncGyxmbxv2wB31afw5TGu
 r61p09sgsU4nlECyboDrbsNlb4q4OALH3iqbb0QCNkfi+Ge1lgBR+ibjQhjy59KKmDs8GY6Q2ag
 aHAzxalLcboS532l+pKfnfhNC314d6ZWpB0V0HVs5yqP9GMatvtXKkIFCWRr+QGcMafJw87QoPY
 Mqm5b+Z8J0XHTB8mBRpJoAJYBGEyoKCV3iF0cSoq7XcN2L6a66vMbNDDHX4Y/ge7JHKqE22HPLv
 fbtGXYy2uCTzKDLbZj6+CIOFUz9J37UDCcFL9UaMzyMvvT7xDHShxkk13XBplE0xAOuaA7y0dCe
 4AuE0zS5bt/VMSUN8yw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the optional reserved memory region is released on device removal,
fixing a missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/tiny/arcpgu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/arcpgu.c b/drivers/gpu/drm/tiny/arcpgu.c
index c93d61ac0bb7..fa01407570a8 100644
--- a/drivers/gpu/drm/tiny/arcpgu.c
+++ b/drivers/gpu/drm/tiny/arcpgu.c
@@ -278,7 +278,7 @@ static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
 		 arc_pgu_read(arcpgu, ARCPGU_REG_ID));
 
 	/* Get the optional framebuffer memory resource */
-	ret = of_reserved_mem_device_init(drm->dev);
+	ret = devm_of_reserved_mem_device_init(drm->dev);
 	if (ret && ret != -ENODEV)
 		return ret;
 
-- 
2.53.0

