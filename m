Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C957B3A1D0C
	for <linux-sound@vger.kernel.org>; Sun,  5 Jul 2026 19:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783280443; cv=none; b=HlJLh/tinN3jDScP2auLN9d5wrdh8OQO5uYb0AxEjk0hwdNE/XMPfKIVIt8yZ2cqgf2rgVn7lZTDN0vkZizXxi1GFfoNAETgW6PVAaFKKeg9PGTlmHkP+IIA5r6nYPEfQukTBJSa1yI2vcPSS7x56D7kD9nuxzflNxye6czv7eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783280443; c=relaxed/simple;
	bh=gFgKgEu5qajbHpLEFwwgM/A3QPsBxXRqQi+CF+ZFu9I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ru7X8nwNVg7ATlJPMnY2RUXwyU8VaifJyGw/0VFxu9S3NufS5gKATz1D5UJ+lcPpKKZrCAOF0+ZNOEO2h1ZuNkMKzOkm7rB9sSdZr+UM8tSi+Q8RZnnfDNjxHpYsxQFHH6+uc+W4lJU1gliZmzR5KNCIqxTZlyK1esZT/xaltn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BbBSGLsA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NoxJN4Rt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BbBSGLsA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NoxJN4Rt"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665HhfBt2167948
	for <linux-sound@vger.kernel.org>; Sun, 5 Jul 2026 19:40:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WZiFjnWLtnN
	smK5dA/42zGQp+sVNdR8iWt1Gg293cw0=; b=BbBSGLsAqnWOATGTpRNCO1gHtgn
	+/zw/8wXZTNlV0J3BkwSreM5wcmTjEIf/OTa3q53G3k+GmVKk2WvAcGb1Ew8Q+8E
	QrpYExNDDivaknI9UzYxo3JTDkbOWqzrVRq+0pWix+SzBwl+OC9alMamMCk86nPx
	bmTcN5MVq2c1dhjwDSCMvlPP+5gNlCOpgfXdThV6SMKQM+0ZTQPkQ4Udmvt+mimB
	/CiyDPPnOPppMy7keT4n98UkPZmn2g6GcpUmf3hrAlfVAqeyUVB9oeO42PhzzgZB
	p0LNoVgtCvusL9jOPJlKPYe4pVrl4XUBs3oqCO5q6awivbcuGKDA559+r1g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6tj8k8s4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 05 Jul 2026 19:40:40 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cac01e89e3so27436475ad.0
        for <linux-sound@vger.kernel.org>; Sun, 05 Jul 2026 12:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280440; x=1783885240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WZiFjnWLtnNsmK5dA/42zGQp+sVNdR8iWt1Gg293cw0=;
        b=NoxJN4Rt0aOyL7o/soh8i2SoA/DEONsrberzO0bgtDpIxKm4z/lvYJyyuYPsU7nrvl
         UGaZT3gpclOlEnkSQlnF/Tql6RI/ZplF6ErLqAKiqecsb4EMqlEW9A8X6/iEj/4vT/Sf
         betVQCio6gqp1w6vEu0b4B2RH323fEtyy8FJwu7Kb2H3VXuCW5LETIGhbPMvxokfHt3Z
         kgM2yt/rM9NWPCeeomBV8VYyhChC4xr4DoXl250mpb45G9avOTKitS37y2jXnLJ70lFu
         cnsCHXPS5gMX0trVIV7fFaiyoTMJONNT25UUUY9+VsqI+G4vX+tuVUR+4nL0Kp2Mfp4M
         I2Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280440; x=1783885240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WZiFjnWLtnNsmK5dA/42zGQp+sVNdR8iWt1Gg293cw0=;
        b=pCzdvbfan7zNiUEXQL5iVLKnRoOxy2qF4lWW/0+U2SYLcOYHFfEhfiZPpFC7W8p+/K
         KuJumgFYezSpW2zhDwxsaKpu5m7PjOLLBXTHayvSg5gXKFBv4EKO8wkOOdKyRcrzRCT7
         xBt+R0MA6xM+0IgH1DMqc8FiGa1cB8QETKjBdOLWsPNYEy/r32s6pyZf59JlN0ycOZlt
         UC1mpkKq1Vcxx4sQpcQjzk2yHHEgOX4cDw6Zec+mFj1R6yG3ty5+GMSC69BePDpk5kU9
         aTLk7Jrzhykk6qyfdNYVTXB3GviiBTWJZCt2KODqcT/XXIIT52mQVXQtkCbsfZhq0gFe
         AGdA==
X-Forwarded-Encrypted: i=1; AHgh+RrylJmE7e8H0XszFPml+F+xb/0KhsJ2twyJPMvZLCalwCiiYmH9ucMYGPyNvgockwD/x4ToP9/G74rMPA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0QSNgJiysLeyRgIaRmEEETJKLWMsesobKgX0WRZTYFZKFhZjR
	3vd7zkslhTWNyrJkcLKG1xAA7ClV2tDL49guUGyTEx0qVAHzFSgnbcxnWQ+fsyhAH6fwAMYtzCz
	gF8ckLH14f/YXxPcc3/lx3AnjrgVW0/jpd1tcZBQQiIHL3TzKU9z8wCPxTL/neQN7jA==
X-Gm-Gg: AfdE7cnl3b71nneG+tXwMPmzX7C1gIQP2zUO75PP69eBAxBXcdlb0+qJUefuTD8+d9q
	6Vku28nZOp+fhLDVLpNaYoRqp26+Kc69TfubQ9CzJKnqKFGUEfUDxoyB0JKOU+CW++c+E4JEzm2
	7MTt3cC+PTY/NrORnO1GJPdYFmLbzlqM2nOC7SOcNRI3AswLK/YLRgVfQhb+bYy7E5uu4lvPvnZ
	RrslG841e9xDX9wuU/4hnMH/yRWjBlMSx2Y6OFiLE6VYOddVLbN6yoQ9SE9E0p9TNGbV6plTVUx
	AGbXPuhgSuUYtXcWDAyrktQAzbY/AnvoiEwY+WoRaBcQf17Zp6Pc5FoaDUcasxGyyl4LfKGGzbj
	zlhtq9zpznzqt0YDwscusvbU08l07f3dtT4sSkA==
X-Received: by 2002:a17:902:d591:b0:2bd:5ae4:26d1 with SMTP id d9443c01a7336-2cacb06f287mr116872285ad.17.1783280439590;
        Sun, 05 Jul 2026 12:40:39 -0700 (PDT)
X-Received: by 2002:a17:902:d591:b0:2bd:5ae4:26d1 with SMTP id d9443c01a7336-2cacb06f287mr116871975ad.17.1783280439045;
        Sun, 05 Jul 2026 12:40:39 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:40:38 -0700 (PDT)
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
Subject: [PATCH 34/42] ASoC: mediatek: mt8173: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:10 +0530
Message-ID: <20260705194019.2565498-2-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX5Df47LqjKlI6
 Q71PK+ax1YpY4VW9wYRxFoYjYLbEtYLYA2uuyF6zhIRbOrvXKg6J0q65c7/+HHkWtxgUYvzkCfE
 yBkeS+wR7zr8VhJWm3TMEvVq0SDm+ZXgfetZTyUYsAjpD2lv3jClsnuR4d/2tBzJzI1a/78vJGV
 jlATDzJXqKa38A9nheHeamEQwwmmmbJWALOYdFleITzsT1YhGM6lXw8da182PJH0dPvojP0BWXP
 5Qilg6fZ9jsoMUIhkTomkG+N9fzm/ReUtNgkYXxm4iCAoKfLKOUDuqc6GIGtDxFL0r8H7yEX9rO
 dk4AtEFahw9gzvU+ESHED/sR69xrw1/hGJI3Bsg4ZCk4ShZ1qb+YSZxE+ItE65zJV4ihXVVVVz2
 Qx7rz6uaGm5njdwCbDwVCSHvFA65CNHJ6pBx8YsyrYOyF4e8VA9yp5QqW0RGryGyAy22JSqL/M6
 0GjpjaCH9xnOeaDNHvA==
X-Proofpoint-ORIG-GUID: 1KqdV36WahfjgFARkf75UAG7nd9JRJVW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX9Fc2ngFqwcYV
 7SA4MR/gu/Ll3DfA9oz9mmTW9fzOZd7p3UvmNBmmWBEgp5onZAtTFnOPNypaj/i4wIzLOFFlJk7
 FuIMp9EI/JkCnaCOPFRUnuYmOCIidTo=
X-Proofpoint-GUID: 1KqdV36WahfjgFARkf75UAG7nd9JRJVW
X-Authority-Analysis: v=2.4 cv=H6TrBeYi c=1 sm=1 tr=0 ts=6a4ab338 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=2-kJ_DxirqQsj2pPc2sA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607050212

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
index 69cadc91c97f..0424d79bc9b0 100644
--- a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
+++ b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
@@ -1072,7 +1072,7 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	afe->dev = dev;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret) {
 		dev_info(dev, "no reserved memory found, pre-allocating buffers instead\n");
 		afe->preallocate_buffers = true;
-- 
2.53.0

