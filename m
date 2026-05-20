Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584DC330D28
	for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 15:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779292209; cv=none; b=GqXJGS6ninAaQ04bazKVBm3JaATwhUYIwJx7CWLmurzEY0bOpfWY4RCDY1ROqg3WEELKFdS08XIJ4QXZcD1HShrK9vlJc54EuDXBE1IAjaK2uNbH2+8e3xNbbUTo54Stn6QO1xHEwW2ao4BfRrAe7PUm0tY/NIJRbiGw+2cYApI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779292209; c=relaxed/simple;
	bh=HkU/7lXMz5wfYek/EI2tdTIHBH9Dr4vHBbktDpM05Gg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KCxUm0pAFOGR8rYF59BhlO6XOFBu9hP67gZaMW+1m72VoX6aL/tx6MMhUP7SjhjFjV57Fb2edbsPBzlt6E/3Vhz0AScn5agKnk2c/rLBz9kKKvoCJU9l5X3dqErCVoD5SmUgkMwwZ8pdtGwDeScrN+r4OLP40zBbRHEDvqImuiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IQ+bcpSS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VUVfbBIt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IQ+bcpSS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VUVfbBIt"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KFOe7T4115900
	for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 15:50:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GBFFGkFdfck
	ErYoEXWb+kPuoHFw2RVA+L0aYz+HJKO4=; b=IQ+bcpSSVcDoooGZBqHLlt7+nag
	jP49nyhb2InE2RI0qGdIAYPM70jBlKJwgGwlKBkKDpWUH4iwfiXxGpO2QEphGgD2
	3qPQcnEONPha/gcfJdn8/W5Tn9tK9p8frttVV8xNGLMgwDEqoXGGAziAlsC2jhyn
	vQcKp9qYnNXnti4FBsAqhm19YElYvcCvaF7RW+SUGNV7732n7QOZh9NEWvWuCK8U
	iHmAh5+j9Bp9PwqEfElBu29TcVipQ630zEEz+h1Oqpd6boYaERJo2fNUVvOf2VGM
	S9X/Nn50t0OBk02lz0l6wzCwSinROsMWVtkcqvxGKH/KG+L75Kn/xt1MNwA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e99w0hjq1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 15:50:07 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-95d5e1bcb8eso3200395241.0
        for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 08:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779292207; x=1779897007; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GBFFGkFdfckErYoEXWb+kPuoHFw2RVA+L0aYz+HJKO4=;
        b=VUVfbBItCX9A4D4yyDb298+nIP+qBvrqWV3Rk/5fzU0HlFbP0kNhGc5fW6xDhjeduk
         Q4kxXPPl6VrHtw3UxMo8A2cqSJ0gOyYha7B11bMDR7yGUxjM9jqxoinBRbzjwc8hkWS5
         9OGHivg4KE+9CBcobDB7ep/Ti8Uko8vmHiNYbpGUlEK9M4FqbaFbOKeoyeeYXsurn963
         JF2ZSrtvZqzhhRmEqA16f1rsxFM5eZuQ2eVAp7T8ki5x6jEZkoAzVUdwxIizzGDORjo8
         Z4tHRxmrk0JquiajbgsYK2cXyOjF3h22atba+WCbuj4Xuv0KURfzq5WqcLbVhhciEY/A
         7sqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779292207; x=1779897007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GBFFGkFdfckErYoEXWb+kPuoHFw2RVA+L0aYz+HJKO4=;
        b=k0SCEOeAUAP+uvtUTuhAtuepYVJqjF4ou+9Z5Ol4324qGDokBO0EFO47ZTD7dEuXbn
         zHHjsI/NuYBjaTY2QwyvpNh+oXBI5UsZKJX6UUDNGc19dHD9+4tFxq/nkWflUhGJDJzj
         0ccxdxYHzXApdbCB104KOCHwJqO8a38hBcUtEeaqZe9TOoLrWi0nC1O8kdauG4iwbbTc
         JnVWwoDhoHDtLzOUcnZIOxNGGP9Z4RbfZQ78rWqXdzFiV4+parS0JfMWuyxCHK7LnqvG
         nWgqrl//0fgJE/44QGTM6FkrsK3PlieailTupIssMUh6+Uz4vdjx6tPmQbqAzkDLb76D
         Kuzg==
X-Forwarded-Encrypted: i=1; AFNElJ8tsI2ZK9BlZDr8oOl6J9P13pI8ZEzEhB+rQMmvEBssgNxUWqSV4U8HfiSOE8UsrnJZA7TvT/EU1LJchg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8CD3HFGres8FgEkJJMAfWTRmrLbIm405CEVT8lRXiHAW1edIk
	X+LXPxNOdgwn17V1CLE5B0IgKgirOauYUu8sbsOJknkH1+hJOZHTOhpHikTaDE6AGYCr/Agv8j1
	/VmKmZUZIScDDen80J2MpevOqy94PHqlK86bTI1LrGuSHrSXSY6ctu14QYC+X3UBksA==
X-Gm-Gg: Acq92OHfWOa1Or2hn9hJJYz1fBBnkWQVsWT7ZVg5ZQ5gec3uysQEOKqnGp2Q528Mc6p
	q0JRLFHBZjLeEMg0xlk7+L+mPR4VCUtNCKIQEM2UY5i5ravWIjoGepVFHe1oZyg9c7JblTrc1o7
	KbTy3RQGL7TfsiCZNvuy32ZiVfTjrQsldyWGRA2zzYx9LvjQeI/O2izhet0gmu4SbkMvKqxKgsJ
	9xQUI6frfc3sb6hONzyO6pxS2bd2C+MSvucSEy7zAL5Z138tkZqeFikB+ZjKgnIjuSvIdjnWUk9
	aoH9w+ViT+DUeT45UqvR4keoq1+s554Lk/rRPI/Y6PKyhBhWM/95tnx/Ogv2OWzxojvW+R2Ilac
	M2v2o4b1OyEHxhWPIhQpp69RqCY/FXp3XEhELqKN7cStamq//APfEkUE=
X-Received: by 2002:a05:6102:6051:b0:639:6533:65a0 with SMTP id ada2fe7eead31-63a3ee7eb93mr11334744137.18.1779292206987;
        Wed, 20 May 2026 08:50:06 -0700 (PDT)
X-Received: by 2002:a05:6102:6051:b0:639:6533:65a0 with SMTP id ada2fe7eead31-63a3ee7eb93mr11334723137.18.1779292206579;
        Wed, 20 May 2026 08:50:06 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe585absm136746445e9.19.2026.05.20.08.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 08:50:05 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
        sharq0406@gmail.com, kuninori.morimoto.gx@renesas.com,
        ckeepax@opensource.cirrus.com, srinivas.kandagatla@oss.qualcomm.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH v2 1/2] ASoC: mt8173-max98090: use standard callback to set jack
Date: Wed, 20 May 2026 15:50:01 +0000
Message-ID: <20260520155002.145306-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260520155002.145306-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260520155002.145306-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: fNedW0gaPtHDsO-46vboZKEdPOgjarHo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE1MyBTYWx0ZWRfXy3X89bqXD8qs
 j7Gfek6ZUc2vRsBTYfDDsWDt5Ak9vuBtIbeoY/kniu8YDe7NP+DpPRv5Bzwv+oHnG68dpfa1Nte
 YDYZIzzh+D9eAEL+dZgyA8UF84nFwwP2YWvZzTIE8fs+I+Dh5OvX4Fisyvb8cFI4+kOh+ZhohyS
 nheuFzrDuG15IOwM0sVrDo4gIb4q6I5IiqJ9AbkXPYWgCbqZzeWVrEvfnM6zmilta5erLmYrzFu
 wDFUmbjW98rskJTTQvMq9ZyJrO9vJ8+dp34R3GpZuTpwukK7392YiujlKEAKS3bTBfyESzV0Xsr
 YDw02MyS+Zn7zRbuIWrpgzvvS+9wRl1WoY6IO2FsAPuou4BM+xQ+bdgvDIG696wcL+mTEmGqxvN
 vJBelWmxfKmxZdQdnpmXCM2KI+cpzH0WUbC4WxvZvntrFUpMAyx1V6uyuqqq360xD56srTr71h7
 3qsyE5gGh722IVZ8E5w==
X-Authority-Analysis: v=2.4 cv=RZigzVtv c=1 sm=1 tr=0 ts=6a0dd82f cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=eZ2NLjhSbWgmPKGfaEYA:9 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: fNedW0gaPtHDsO-46vboZKEdPOgjarHo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200153

use snd_soc_component_set_jack() instead of custom callback to
max98090 codec.

This will help other drivers using the standard callback to exercise
the standard path instead of custom callback.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/mediatek/mt8173/mt8173-max98090.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-max98090.c b/sound/soc/mediatek/mt8173/mt8173-max98090.c
index 49ebb67c818a..7533c6e4955b 100644
--- a/sound/soc/mediatek/mt8173/mt8173-max98090.c
+++ b/sound/soc/mediatek/mt8173/mt8173-max98090.c
@@ -1,3 +1,4 @@
+
 // SPDX-License-Identifier: GPL-2.0
 /*
  * mt8173-max98090.c  --  MT8173 MAX98090 ALSA SoC machine driver
@@ -9,7 +10,6 @@
 #include <linux/module.h>
 #include <sound/soc.h>
 #include <sound/jack.h>
-#include "../../codecs/max98090.h"
 
 static struct snd_soc_jack mt8173_max98090_jack;
 
@@ -78,7 +78,7 @@ static int mt8173_max98090_init(struct snd_soc_pcm_runtime *runtime)
 		return ret;
 	}
 
-	return max98090_mic_detect(component, &mt8173_max98090_jack);
+	return snd_soc_component_set_jack(component, &mt8173_max98090_jack, NULL);
 }
 
 SND_SOC_DAILINK_DEFS(playback,
-- 
2.47.3

