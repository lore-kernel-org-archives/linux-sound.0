Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6147C3A6B7F
	for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 13:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779283786; cv=none; b=jGZhz3QSzu/vbKkE2lf4IC7Ogr0qgn7cW/XpYQptHA3H5gOAWf8+XQaLtrcWCM6tv2fWmRPShGS+agifFn0Vg6i9gT2S38EYsXJ8tU5vqYFswQ7d/V+hSMW+NTZsN5Ssm+FUDwZFA5V702CRiZTpZRXCMp8DxvOhm2YOWSmpfgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779283786; c=relaxed/simple;
	bh=Uu5uyr3S4DAMsxnmTADNGWT4hBVCfQbf19BrUcKIb60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FVsAf1Opz+VITYa+4OvicIgceO2JFVM7dv15Rwn/u8Xp7+of4QXQV/YRUkSU7x/MY7jBWl+RAuS+MOgGPiqIPMVdI6lC8F/2D+SGn7r4AGHIf9YcnSkJovYbK7Ztwumz1djzObPLtzlqewmMyTKwYdzNhoz2TAAKaCSHvKRmfvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MrXHlECF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bd3fnW5j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MrXHlECF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bd3fnW5j"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K7kqa42065141
	for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 13:29:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7pajX5xu6Zp
	Ncsmp1hBoCRrNWBQ+y3y7lGXM9b2dJyw=; b=MrXHlECFBLjHTZEMNa5iWPodvxL
	24qm6jMwUgBqFdPEmvoDtG4vHPTw42MJty06cVCt7eCTOKSSkpZLhswFgoFJi5ea
	R4zLrvZiVIZ/uodjqvaGle60DBYV1vrky6AfdVQkrOqWjw/AooGZAaKsfAriUeAR
	fRoZkeIZyG+ntgvNURJNRwi/cezmh7HZtY1k0EjTIKcMyOJpN9hoMZW9NRZk1jQg
	fVig27MrI3e86i71oNVJHluQ3qeGLgTROzqx7S7GAh6HUQq20ttmDI3/6/VP1x8G
	tLwXmDXpZ/atclALbTNZz0oVg6j4ZNsF/ZkKKWxTt6GTHgy1L0YnJOgRZyQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3t4ukx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 13:29:44 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6618ab427ccso4985434137.0
        for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 06:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779283784; x=1779888584; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7pajX5xu6ZpNcsmp1hBoCRrNWBQ+y3y7lGXM9b2dJyw=;
        b=bd3fnW5jO7uRGFNE6RIC6hazHGA3zqOI1VooB2EMTNL2gCWmcJqY1pWNiYcpVjOWQj
         U/5nHTu4B+2cUoSvcahGEggza12taGZ12kKJzFLVIApZdtPbbPTXRJJva5Nhp1XHAdY1
         O9kGYltk4UV7SxdfyngWzDfP7UxehKnywPAmtVreX73mA74JyhABz7nYp8G7lTCTw6AB
         RxwqHLqXI2VQ4PVWpcBsF8GGJpxqukMfxeh8ioyBhSWWNMkvgFwwihJeW9Moor2qk2IH
         UrrnkfvhxyCSLtR1GUYJLcvwzbjbefVaQjIrq63IBMChFvKPDI2yisRHMAJArfVL3xtD
         P7dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779283784; x=1779888584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7pajX5xu6ZpNcsmp1hBoCRrNWBQ+y3y7lGXM9b2dJyw=;
        b=rtqnpJlJilqD/Iwx/RR3aky744CKRYCttmbK5mR/gOoc/4nF7+vO2nR1gu5diJ+k4x
         aY8MwBRy49hcQft6v30CG9LEU5CHS/Qq+MQcAkLlRVjViYKyiAfCL0YVqrixnJcThWOr
         D5/h2cZllpvUxXLImQ+tcsOqNlEOisc3Gx3UjchinSx2KEBMj6Oz81mE2/8avdFxn2Ua
         VAq4tSpwM2d3iI9swvbneaG4OOfuWu2XWnBRJrEEUb6Kq9HHcDmYKf8fONAypEcED0MH
         75Rn+ofhBQ7RxW76o+hvlZONbK+KM/XOP9bA5ki3+TFQTtPFgIAAD0H13ri0p+6lW2Pv
         RucA==
X-Forwarded-Encrypted: i=1; AFNElJ/N7PIH3fvgJqJKhu0xr2KBFgnPdulxqYLv0MegugJBzN4C0YLHqGINW48gOdGsUQfn3QeoO/CaZcgefw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEXaXiKWyUrdotSKDiwX5YLaQbUSW4vkizgySn4elC8TDjfK8j
	cK7YZSHlWcIM7j5kuWreW6TX6jPs1FxTABwX5xWeROPUEfvARm6nnfyTdx4u6rGSYoXDzJXPDDD
	5XWXARWIgddmyJVS27MKppNQluyU/6UNNcYAxhZXMbz5zauViTfjTuug1gZPH2Npcrw==
X-Gm-Gg: Acq92OGhJSsYcyF0+EscBvLeeLmTAewWqWGkJZMc1OBIH7b5svWbA3h0XqadP9yHNd1
	sVxKrREfRdfP+uunVJUEUIie5vtS9EegJhVmPLmQFzd2JktQVkIgjbXDlmDnknMBCIuXx4kWJpO
	Vln5zrbqc00BYrf7AMRJ+wPHKyfDSb385y/YNrzGSw9+R8G4N9eNjuGDXxTz5Z9nLYq8wUnDwkQ
	PeqRmXBnracC2bKxGR7Gz6exEc65/PQ+VYlcgTd52yzshTTbm6l0bXLgpJvI5PbFSia+pd1rbUv
	rnpeiSTwAMRi7zll6iEt0VQcWISwAHAmSy+aSIRO00fFzvpvPtRGOhGBai5ULedH8FcGUmncFC2
	uLjrUt7eZNc9AiVgQRCktW/UuA7Vkffd8kEFKkl7U5kd8+V0n4EuLAmc=
X-Received: by 2002:a05:6102:548c:b0:633:9ac8:6bfd with SMTP id ada2fe7eead31-638b4c525bdmr11312676137.4.1779283783510;
        Wed, 20 May 2026 06:29:43 -0700 (PDT)
X-Received: by 2002:a05:6102:548c:b0:633:9ac8:6bfd with SMTP id ada2fe7eead31-638b4c525bdmr11312651137.4.1779283782985;
        Wed, 20 May 2026 06:29:42 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4900c16c62dsm223771535e9.11.2026.05.20.06.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:29:42 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
        sharq0406@gmail.com, kuninori.morimoto.gx@renesas.com,
        ckeepax@opensource.cirrus.com, srinivas.kandagatla@oss.qualcomm.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH 1/2] ASoC: codecs: max98090: use component set_jack callback
Date: Wed, 20 May 2026 13:29:29 +0000
Message-ID: <20260520132930.54333-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260520132930.54333-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260520132930.54333-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: NagE60caG21xA4hcz8LpWWsuwTzRIMfa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEzMCBTYWx0ZWRfX8zW9SBu2b1mK
 7LIqHF2fWEaa3VzumTo85ZBlJqoveOV39q5FEHE+Jg43g4cl5WzZwFs2tPJEzdREFoSUqTpC61G
 9Oi1/Afr6/NyS60URyH4M0yReCsbJcl0n/t2Fab52jF21cX2859EjDuIRLY0IgluOZdGHJOpME1
 STWgLNehbi/QGynKAxja9ThCPc55kUtZzMOsUNbBbPPmX58vNBxL64JlXqxE3/m+R8GQnz/HMTA
 M1aDNGgLgE92DZOu1YtWH1MENAeCufyWsq4z4YaJcagvKnilLbQ1Tnd7uKonhz86pG2PnvimvT6
 IBgATSV81wEfiZqYl7QGQn/D8TI0AMo1e0jL6wLN/DIp44kdkr3L0RcwGrpY1FJH2YyfSgubeOT
 Nu91613Z/9qd09YhWwOSrAmS0LYNM3mXPK9IQqGBMXjkg2dsLSMcDV8/ajjdBoTd7bj3VEbkuG9
 HnGKwh8wiEugHE6v4zA==
X-Proofpoint-ORIG-GUID: NagE60caG21xA4hcz8LpWWsuwTzRIMfa
X-Authority-Analysis: v=2.4 cv=C4LZDwP+ c=1 sm=1 tr=0 ts=6a0db748 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=yuX1osHPGoIBqVCarmwA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501
 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200130

The MAX98090 driver provides a custom max98090_mic_detect() helper for
machine drivers to register a jack.

This can be implemented using the standard component set_jack callback
instead. Doing so allows machine drivers to use
snd_soc_component_set_jack(), which is also the interface used by
machine drivers including Qualcomm ones.

Convert max98090_mic_detect() to a component set_jack callback and remove
the exported helper.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/max98090.c | 10 +++++-----
 sound/soc/codecs/max98090.h |  3 ---
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index 13a15459040f..bd3bfa1d3402 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -2337,7 +2337,7 @@ static irqreturn_t max98090_interrupt(int irq, void *data)
 }
 
 /**
- * max98090_mic_detect - Enable microphone detection via the MAX98090 IRQ
+ * max98090_set_jack - Enable microphone detection via the MAX98090 IRQ
  *
  * @component:  MAX98090 component
  * @jack:   jack to report detection events on
@@ -2349,12 +2349,12 @@ static irqreturn_t max98090_interrupt(int irq, void *data)
  *
  * If no jack is supplied detection will be disabled.
  */
-int max98090_mic_detect(struct snd_soc_component *component,
-	struct snd_soc_jack *jack)
+static int max98090_set_jack(struct snd_soc_component *component,
+			     struct snd_soc_jack *jack, void *data)
 {
 	struct max98090_priv *max98090 = snd_soc_component_get_drvdata(component);
 
-	dev_dbg(component->dev, "max98090_mic_detect\n");
+	dev_dbg(component->dev, "%s\n", __func__);
 
 	max98090->jack = jack;
 	if (jack) {
@@ -2377,7 +2377,6 @@ int max98090_mic_detect(struct snd_soc_component *component,
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(max98090_mic_detect);
 
 #define MAX98090_RATES SNDRV_PCM_RATE_8000_96000
 #define MAX98090_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE)
@@ -2554,6 +2553,7 @@ static const struct snd_soc_component_driver soc_component_dev_max98090 = {
 	.remove			= max98090_remove,
 	.seq_notifier		= max98090_seq_notifier,
 	.set_bias_level		= max98090_set_bias_level,
+	.set_jack		= max98090_set_jack,
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
diff --git a/sound/soc/codecs/max98090.h b/sound/soc/codecs/max98090.h
index 6ce8dd176e48..048af4a1376f 100644
--- a/sound/soc/codecs/max98090.h
+++ b/sound/soc/codecs/max98090.h
@@ -1543,7 +1543,4 @@ struct max98090_priv {
 	bool shdn_pending;
 };
 
-int max98090_mic_detect(struct snd_soc_component *component,
-	struct snd_soc_jack *jack);
-
 #endif
-- 
2.47.3

