Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F50E36404D
	for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 13:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779283787; cv=none; b=NqbybpE0KtikWZ1NSBF5h1ndOS38UUDhjPZO3LDh5uUJ2qrllYD7TbUcOatcKpBBPvoEPLIHDth1QRMdGl55Wkhx2uyK3LnJdOs00HV7c568tcaoC03kTjHEHlUShT9jyugWCnMNUvdFU/5q20NXxgMx1dtk/j8zjicP8GXSELg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779283787; c=relaxed/simple;
	bh=9pvxYS6LC0SeKIGO30jOEOJA/E49eqY5hfTPX8CwMmc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NbN8FBwoDIdKCA2Srriiydnu4vkQ4390pd8/VlmDaLksPX9uf7BYJkgzuCbWOJuTWCyAgAD9XaeEu7YDmu7tl7rJbsWSZSqEnjLo+hEd0i4r4eUPbf7YS5PRTyIy8nL+hJdN9IHsxBrKHFryn0pTTbcGo8hUaMC7SL4Ofty/89Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UasdD9js; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NJpoKIZY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UasdD9js";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NJpoKIZY"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KDT2571954028
	for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 13:29:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Y1KKsus/zgk
	orq+PL6OFhSz32nA6WrJEe8Mcnt6/OJ0=; b=UasdD9jsC5hDSsDAaPUSWISsp3m
	XcW/HwEvrYyVnOqyuYY/aUoOuMOlHs3BIqVEleyu01HAE35RHapZREAhR6vsKxkT
	uzATjOJl6gXQ9/xDJE6Hz7aLhtTruTd3Jf4bJ5NbzPk44GqplCQhfrziwM9Y+JGS
	pftAyqzBe4g7sWURCXQmlS90N2TtDiUJJ9mT3MPqJ5HjUSA6TLRlhM5YU4Yy1W9f
	u/7mHRWXGEcU2/2nMt4rPwMcbzh5Iwkg6PPaRNTCtY484E4xM4XJydIZn9C5ZLW2
	f89it/eQI0+G40CLKwVIEB68G5z66zvHNIXJV3lB2eiVTeioGhW0/dd0jaw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3xvxk6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 13:29:45 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6329c1a6710so2709412137.2
        for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 06:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779283785; x=1779888585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y1KKsus/zgkorq+PL6OFhSz32nA6WrJEe8Mcnt6/OJ0=;
        b=NJpoKIZYDStrRxLHdHDktMoviinMHErjSJGHp5dONLJeWYEwwSVULpiIzOj9MRgNRZ
         zNOXXODbwBG0pX3SHQheVndk0T6/WzK/YsjUn5UMTVzWBTmutWf80vhl7/yBSMcWTnjU
         Y8UOl0G2lkc+5ehWBEhpYQgJFQ6SKLj/moX6hKlzu1iYv+qofZpgAtmZCaXx5H2RJ3FR
         H2JpBpGzfvFgZtIKtKD/NRAW38zirJLkHblw1WCYiH6BFZYjtWaKvBVrEXeAqYmAjtBm
         Kg8TQj2VSPUzUO4GOwN+1Y6r0Jmn/8u2MU2nyTsYPFsSNjZvgeT8JK++4J3+mIUtWy9F
         csIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779283785; x=1779888585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y1KKsus/zgkorq+PL6OFhSz32nA6WrJEe8Mcnt6/OJ0=;
        b=lJ9UlepGhEZ4omp5fZTzmbEZ9FVT5KumD5KxcFBZeLcpTlTr2GdQjqQ38fyf/uZ9g7
         gnktub8+7X8P7TZ/HXvs2JXUbg7ndpKWDM8di6OUoMAcgFOyNM/Yz/6vR/oIAGg6bu06
         UywStOcncoqSJJzMrw+tYikXCIElCfAiJe8TUThJzydC+nY7P305gdi9qzCmDyIWW3lx
         vP/tLk97e3GNEE8U6O1DbASDPNJ7S3HM2wV8/fzEbjFMjcQuq6xd3pA57cG4mWuzmXEO
         XXT870wUjAMEowwfROVxCk2FMsCJzz5Gg1SIEUXtQVvPc8D01vHb3bJIPvYRRUbdqLfK
         Ugcw==
X-Forwarded-Encrypted: i=1; AFNElJ9pQFDBbAtoT9308jzOtvMyXuiIsLMLDyWvxF/eUfLI9rkXsJYbpMgzJ4fRK6A+JT30e7H9/PxRmpsevA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaPqHPaMYn/BCZ8xb/Sm2wFBhrP4xz0JUPPmHvEGObv0e0Fb9s
	iKO6Fl+ZrlzlHzdnKFiINCvMsck61irbdjKaQeyLOTUNYRrLi6Oby0WlmiobRCQPt7TkdtiR7sj
	PoL+QnY1MoKoxUSZPoX3ii0tdbmKzStTRannZn3xVoP7lgP0zejdaWz/eF63wOI8T+Q==
X-Gm-Gg: Acq92OHRfbInaovj8llcaY17SX+67s7fY1LlcV8QqqUZGbgmcysqHdvVMXyuTF5+kpD
	g2H78Xmk0v3l50/5V2UMC6z+8VEPkuTayTTkCeHvwHNRhDPUH6OraJseHiLURNtZlUSQKinF7c5
	mjOruZ03Dd6Nv8RCjcQsRKhB2oqYPvPa/8EegQZdZhaFZLfVF3DjRPIlp40i7gkzOwM6O659n5e
	OFUEAU56Bgldt5QO0znJhy24TaTVoSk1E26e9GaR8osyf75/il9KuPOOxPJBdp7NuNRo5IQLM0v
	Q6ks9XkAkAceMNPcbW6hfDR3sFGQU6w+h1Uolz7rReP1kmnTlaBgyI73LQXuwiLrLxN2tCXKdEH
	QO86LUO/QkHwS5daaiQZZiHFyVQKjOBt/ZRH+2B3a2naj2l2KzwC9PCAUMuNPfVK3Pw==
X-Received: by 2002:a05:6102:568d:b0:631:26f6:701a with SMTP id ada2fe7eead31-63a4019bf69mr12684019137.29.1779283784752;
        Wed, 20 May 2026 06:29:44 -0700 (PDT)
X-Received: by 2002:a05:6102:568d:b0:631:26f6:701a with SMTP id ada2fe7eead31-63a4019bf69mr12683970137.29.1779283784356;
        Wed, 20 May 2026 06:29:44 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4900c16c62dsm223771535e9.11.2026.05.20.06.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:29:43 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
        sharq0406@gmail.com, kuninori.morimoto.gx@renesas.com,
        ckeepax@opensource.cirrus.com, srinivas.kandagatla@oss.qualcomm.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH 2/2] ASoC: mt8173-max98090: use standard callback to set jack
Date: Wed, 20 May 2026 13:29:30 +0000
Message-ID: <20260520132930.54333-3-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=WaY8rUhX c=1 sm=1 tr=0 ts=6a0db749 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=xW-QnMYR1X0ORSU9WD8A:9 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: OY1K5QuYkVSbYPJCYlgvfjwj-HLElMNl
X-Proofpoint-ORIG-GUID: OY1K5QuYkVSbYPJCYlgvfjwj-HLElMNl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEzMCBTYWx0ZWRfX8/atVaISd4O5
 aMg+7azlFpO2zLd7Ud1/Dv1NHC0y6YYNtjkQ0zcH0HwKQvJg5bNvbGmtvXeCIpyuOCnE8DGhaYB
 0acTb0+Mv2Y/ZgSeqPATMHqmyrbHsQp4HJ3il1hQuya+UZasfDpL7C4VMm3JOiBh95rl7ANlKa5
 MaQ/aKZLpcDXOfN7CxpajX5owG449D40piwRivGgLk/JpkUQo/xCYsrtYQzch+B69u5adY7/EXX
 bhpXeMAZt7l3P+eec2LVS2+KXFg13W6KTM82Kae1FQesnwEw91JUlBtXRtL1MCjKXR/wEXeZOZf
 P/iFeAN1PHZSU7mUZPCHjeHyhZ7leySaoopV8V1000Hhn4KHkQ9pLmvUc13VdJ5CQCQjbxKq3ZN
 2e088+7UGyI97+s559YubkCpUJpL+BTwr0VYhC1gn+y/EySvfJrpaB3pFuvwGej0qBAbejkDzHC
 PMFrcL4KhPFDUt855GA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200130

use snd_soc_component_set_jack() instead of custom callback to
max98090 codec.

This will help other drivers using the standard callback to exercise
the standard path instead of custom callback.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/mediatek/mt8173/mt8173-max98090.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-max98090.c b/sound/soc/mediatek/mt8173/mt8173-max98090.c
index 49ebb67c818a..236e1f8df45a 100644
--- a/sound/soc/mediatek/mt8173/mt8173-max98090.c
+++ b/sound/soc/mediatek/mt8173/mt8173-max98090.c
@@ -9,7 +9,6 @@
 #include <linux/module.h>
 #include <sound/soc.h>
 #include <sound/jack.h>
-#include "../../codecs/max98090.h"
 
 static struct snd_soc_jack mt8173_max98090_jack;
 
@@ -78,7 +77,7 @@ static int mt8173_max98090_init(struct snd_soc_pcm_runtime *runtime)
 		return ret;
 	}
 
-	return max98090_mic_detect(component, &mt8173_max98090_jack);
+	return snd_soc_component_set_jack(component, &mt8173_max98090_jack);
 }
 
 SND_SOC_DAILINK_DEFS(playback,
-- 
2.47.3

