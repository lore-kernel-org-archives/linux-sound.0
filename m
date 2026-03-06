Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B3A389E06
	for <linux-sound@vger.kernel.org>; Fri,  6 Mar 2026 12:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772799727; cv=none; b=ICeJnOEV3r8crwPp2IQlRExm9+Ms22HtOlSja0g4NYx39J/hKTrH6UMOrjxMx5qHOJGJQwX4Y/UfPx0wg135u5JD2mzMmBkQKowpISWwDIZnG6BjX9Hsm+0lYv5cmotujpG9i2y8mEwte8cEzk6nN/VTNvizzatkhXAJ+Av2ukU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772799727; c=relaxed/simple;
	bh=fldykUob5Z2453rW/Bu+WyVup1MSOjtxkIDMh+tQ1tA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YHF9M54busQsTBalChtxx6yZa9k8r5UFFKRphG8ijtdK5S45JQ8IkROZYJQUJ0J6mrMVRfaIcGndsb5i1mTmUzE43OlA/fkQh7E4FqwRHk7sQQzCVrIRu/Ksd1ZrZx3E3EtkG2XvPy+xTjjBLBKENAtNCzrYYjEb88B6ri4j308=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CQ/QcREN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q/4yHYSn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CQ/QcREN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q/4yHYSn"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626BbIkd2022767
	for <linux-sound@vger.kernel.org>; Fri, 6 Mar 2026 12:22:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xEO2oGNAYFh
	ISLn7OT5Tnbx10tCrKXxJuovsEhU565g=; b=CQ/QcRENr2KS6gpMWhsW0hjCLO8
	bQSLFhTz4p8mQLjs/mGDMqd7wVbIZgreE94hxjOHS6vlxEqoMuDWhaUcnSKLFo+Z
	XWicrKgrQXnBGCsAP2kzduEov+jNc/NdDB7ZPDT0WvFsezXtvhcO5qG+ss7Ex4t1
	r0Mi5CTpGe6LP79kjqwlm7X186g/aewvqOJJxNrcoyJatXXX1XglgAVZ/tC5NZX/
	Sivx+lEtXai46Y16FZgHbGBtnkvVaRmCWKo1Y0Di3SewiubP51Xoq/juZ6iw2lF+
	XQNaDIosh9FfRAmKCxYxyuQH4qJfoysQUD1LYVsw66w0Nk5V5SDQNXZIS5g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqfg6b3k9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 06 Mar 2026 12:22:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb3fae6f60so5939800685a.1
        for <linux-sound@vger.kernel.org>; Fri, 06 Mar 2026 04:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772799722; x=1773404522; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xEO2oGNAYFhISLn7OT5Tnbx10tCrKXxJuovsEhU565g=;
        b=Q/4yHYSnkkhFCf+gPNcu2rQoZBeZ1Fa63d7vJixFexw/Wq/LkZTvEshCCab9RQonq8
         YEfOUDVCjOQkALKAef63b/OCBwo3Yib3H3oq7n7plnPr+eFgE5GpgPorJKHnWDrxlm0F
         hKpUEzuxiBElXefB+iRqeeARBvZwGmwWyolhulyQOIXRFD9EOE4gd415Zl7iqMZAQ1RQ
         Y+qyoBvw/0YZ1377foeH46kdtb9qGMjlZeAxliRNKp+Avtefo5W6CdX5MiFGSggg5gZ2
         8Xm8V1H2qQnaL9c89QTTb5EgLi6xKFbItv4Gmc7QJfL0P8+6pufed79EtkSnlecM1uOo
         v4Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772799722; x=1773404522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xEO2oGNAYFhISLn7OT5Tnbx10tCrKXxJuovsEhU565g=;
        b=I2K+RKqvrbprAg2C3EpB8239S18yH3UwztiqDvhrWl+SyyXm63tzjL/Fiwrz4EgP4v
         cwise8a4CkDYCaRU39mAtFUbq0A9FTfNyua/bFeqq2SZ5lQrvkqujrp3z4ruFf+LO1FY
         p99rQi/fHoXrbi5Al9C+CBk1IpfBOOUaPrFp1xQu2YsJ61YfB/eMAvGm4Ym9cunsmxLN
         ydLVybrlXm/VeMld6hFa9mE8WrNqeRpH/EWUvyQuHSNDF0gVRJBevP2xaW/zDoFK+Bwq
         pGRlZUZoJDrBmBu6ZZnQ7VfcIwoAdk1sw3nIdwCZYKmvevOYaebF+e2Vy9ZW71AggX/u
         Xuug==
X-Forwarded-Encrypted: i=1; AJvYcCX/9HLkSQk1+ETD2wwBNuAvXX2dFKgKJLwQ3IoAsIJV+G/auWfVQxF4HTgCxv0Luy5BHRyJC0jVXHD9Zg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzZYEXs1rVkjpVt/mlac5CWCA7PAoOAcTPwO3fS3BmsGMO/f57
	lWWd+qUGw1u9E+X0bnfrtWAaj2SIOhzN8hHGs4K9zANSgj80S191EQxFKmHdqTnZ+3s31ZBhlRf
	x3yABmdqjClD3yQcCoL/K7z9qj5sF6+ODfiMGDMphQ7bDkk1tTvlxT+Vrb5P1rZWYMQ==
X-Gm-Gg: ATEYQzyroL1eV4sWi57SEERwp0hh+rfy8ucH26dVDZ2IMNlXCPm4Hm7RQA2BY/qIUGF
	676naJgeHr0wXCk2dvoIF838p6DG4Nn9pniOTmZYQs3rbJDHGPCTdrfpty5lvpwXRO3zdtu5RHf
	v9ACDp3OEhzVvbGnv/LOYnW99txLaxGzrM+oZLMrjS9LnmozgbElqySp2I4urqhyW5VICXOzkMp
	Go35+V8OoGF9eqEjP5D9gohEUAf+fruzYrP0gasX/QC5uN7fo+jcvVS95tViBDNHG6vOzGN7cPx
	Jsv2s8lkZokgmCt2Y4iI2UaVrcrPDnAuA9UQpuAId+rK7beJ2MsuUG8GENWXD6Vo2pH/yCifqBP
	qmFeRl2pM2WE2/+3KlZlzT60qhM8K7KhNU+zs+fH4EjkJ5n85t+I5bII=
X-Received: by 2002:a05:620a:4108:b0:8c7:1271:f336 with SMTP id af79cd13be357-8cd6340948fmr651648885a.2.1772799722104;
        Fri, 06 Mar 2026 04:22:02 -0800 (PST)
X-Received: by 2002:a05:620a:4108:b0:8c7:1271:f336 with SMTP id af79cd13be357-8cd6340948fmr651644885a.2.1772799721635;
        Fri, 06 Mar 2026 04:22:01 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fa87e56sm111972395e9.0.2026.03.06.04.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 04:22:00 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 02/13] ASoC: qcom: q6apm: remove child devices when apm is removed
Date: Fri,  6 Mar 2026 12:21:04 +0000
Message-ID: <20260306122115.509705-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260306122115.509705-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260306122115.509705-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: vf3immNX31y7wVI2Zi3EEUARkHJIPMXH
X-Proofpoint-ORIG-GUID: vf3immNX31y7wVI2Zi3EEUARkHJIPMXH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDExNyBTYWx0ZWRfXyavUGbdtIWzQ
 jkS2NEI8AHy2c4k6kOwo1jw0SnuZo91V2/4wEX8vk+YS9KbtRKzVKQQLVJRGAAijdYIMQ7pLYQJ
 p5QiwNJorGvujuZz35vKymNngaEFGBj8Kypem1NFYdOdhlaLenTcyycYQBadCx4d8trdsB5BAkv
 w5jmxTVDr8BInniTRAepJMxTmFeTdpr2RMH8Cl/3FsKVxJVeTGPvvw7MpAT/SjJHB+zyrR2Z+Wa
 LMVxdI9j0Z90j7b4eB4uw7l82w7CMEJNfiBMkIVy31oNBQBPglNx1nN2sVSh7Z7jK7Yh2fbi6KM
 QuYpNhNTHn85MYOana5HBRD9LR3SmpJlqOnCXFcsZsXANjJb1/OUGz/I7y3wmu9MCsA2tcw5GrF
 elqk9VdVfIK+5Hxqtd8sckZ4fUd3pvVGn99LVm5SY4yzRQasN27+CA+OzY+KFhRhobrYdmigZct
 3lYNuQYJyAnKKuf4cQA==
X-Authority-Analysis: v=2.4 cv=XKg9iAhE c=1 sm=1 tr=0 ts=69aac6eb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=WbEMVPVtDBSXEMPt_8MA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060117

looks like q6apm driver does not remove the child driver q6apm-dai and
q6apm-bedais when the this driver is removed.

Fix this by using a manage version of of_platfom_populate.

With this change when the dsp is shutdown all the devices associated with
q6apm will now be removed.

Fixes: 5477518b8a0e ("ASoC: qdsp6: audioreach: add q6apm support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index a4c662be52e0..ebd5e3ac0366 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -752,7 +752,7 @@ static int apm_probe(gpr_device_t *gdev)
 		return ret;
 	}
 
-	return of_platform_populate(dev->of_node, NULL, NULL, dev);
+	return devm_of_platform_populate(dev);
 }
 
 static void apm_remove(gpr_device_t *gdev)
-- 
2.47.3

