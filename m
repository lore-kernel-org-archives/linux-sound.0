Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D743FD139
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 10:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782727580; cv=none; b=ikoE0Qy2qaY3BqoA8bnajWmJq5n0dBJfZDorFrrC8n6cWDZ9k42IBLlpnI2/IGQtY9wzmNi1JiBi7xX8Z6iKtECBU5hOUC17M3pC3OTUb4kBn14wfGoHU/zS59M8pc+o2c+2cYTwxYjBqxQa9f9EAQZPwBc6fiKeTiHOhFXhcFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782727580; c=relaxed/simple;
	bh=azyjWX9qq1aZN+xF8XDJCutJ/ZDvQfovLJoN85Gn2Co=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ESqfHPL3gfDHB546M5MeSqNF2/EMYMs4/KroIYMjK6lkpf2jCA6t9jElVbstJNWgWdYnwYO/C3xVIKT0WIC8y1IiBjRdxVilh6Tgefv5vd1U6InhU79mc4SVjBR9N6PE+RrsX8Ehw1zXIfB2XDW0QVNVJkIzyjjOvd4VhO1fBg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZCSU8u+/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hB4gStCv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZCSU8u+/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hB4gStCv"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T91N9w2400847
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 10:06:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jF89tTyvPBRXppdcG2lsdi3s8UuXsncLSytB3XNQiLU=; b=ZCSU8u+/jMMoqK/7
	TuayLylSk7BBL8sA7DHm2sGGHRQACoA2vxr/IcUz6aI1xQdRIkTq2p9joQvM6lhs
	v/VsKI0Z/afRmpmUuYEiQbWbXEOxfMDYlRC3bUyZIxMb1i6QvpMwo31mOz9HAHhi
	9fnuukAENN+hnM7Z2+ih2TjN/jFaT3WZFetKXELdg8CU6HOGT3rZCOoD46BGk4WB
	kchqNtCg7rEUePKmZzHw9RYt5J+Y3yZRqR0knjJ5YdinjJVgLo19iG9UCF2ErjCz
	fD6tXTrTZyjrHfqKag6WN1EqTwL1OVnV8c1SgxZPTfmX+ilc2nBgk4cKzBsurMVd
	pzgMuw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nq888yd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 10:06:16 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c7cfa17fe6so48436555ad.3
        for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 03:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782727576; x=1783332376; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jF89tTyvPBRXppdcG2lsdi3s8UuXsncLSytB3XNQiLU=;
        b=hB4gStCvp7oZ+MRBqzqxTj4N4yCgPQNjrbDQ12bWk395GnL9P/1eq1BLp9UF5+L4lQ
         qVNSerX4vEEYQrMlQSdKmUDn6K7qXspmHQaYwgejVrIerhw6fwEYPTyghriXxj1ZlGCN
         h09bTQSAYfeAWXxQ114WfT8f+csnFgdez4ceJRAfPkgUBuRXNjqjjp3kbtL+cfJCsFPF
         WeTHgnRrgigXc+lsXsg4v1T16/P7tNA6AWeXn1QBLqilGQH4UB9dOLlnH2hqDYmb7vU5
         soeZvVFz292whPi4RkfKPMClb6Y5h2AjYhVzWbUwo83J1QATO+86mPRbDYnOfDWwZ/rr
         yscw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782727576; x=1783332376;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jF89tTyvPBRXppdcG2lsdi3s8UuXsncLSytB3XNQiLU=;
        b=XVvlRGCgecZCCrd7YGhbSZke16f5K7A5Rp3q0ecZ9NxnRTYcBdH39w9mXHgJwG0Nc9
         1OxSiJIfLpnXXyFCoao92zxuG3kPHWaFxWSPJVE6D6Ql0q6+StavPg+TzR/EpHRUqAL7
         ITfDeOlS1LqP3M5/+Lm+dR+giGucOf/OLxskx59li7FF/+Rt4lBE3JulIOeQoHw7nPaP
         f3ddNbw9gAeTB+RW8TI/fDI5B44dRhinGapq9qx05yPWJurFCD5hfH7ThQwyr+4c8hHd
         Zdp3QIHR06vzwhAbrqoDhxncUAxJLiGOYRf3ZRLoPnJ3yhD324RDLcZBFokWcJikSdZb
         PjYw==
X-Gm-Message-State: AOJu0YzWOzUEtr0zTsHLVeLpJzLOCTTKsAcVebhjBxS9hfQ3WonZQhZy
	EpyUuLBLvZe+OLZZ9OQ4HgQW/MN8TqSG8eb7FU0Kg/jhduPBpJdscRHWlcY/kdhoTJaEsUpT2TO
	xzonFyxi/Q+p2rry+z5VrDHRKwpdVJeqs0TB7rkUPM18wWGJqyBd7gUwRmKmIftELSQ==
X-Gm-Gg: AfdE7cmcXKOjbsuperyI9hiNALskuoV/LwWVE7FoUK2G7HThhFsmJutojaEdKipdHFY
	45DtPCXdMiO7WPgDNjJqFxoW+45P/+SpG2s18PqYv+K10kje+outM3FRXQC8e6C8C5538M/8oHr
	YpGpSM6ElH9XbJh4jzkEGkU2qszS/i0ObI15a8i3xdrG3mj0n/LyuNPMq1RBagTxF/1j7klZFcJ
	tDebz2M8usmyqFHYMJL5YqiF+kg03uNwrhb0RJYo1FTNlYT0gK5NE4aK0iiQlnvyjO7efpEqi8Q
	PXE8foK1LMTupBQINlSjTTm0sEOytiUgErvKbALpj/lURwEcCG6znjXsg9r/BhnJVel5uSq1x9U
	8S7pxNOby6BEdsx+nDxak1c0Z9wEw/FpET9x/kP4=
X-Received: by 2002:a17:902:ce02:b0:2c9:c575:7e22 with SMTP id d9443c01a7336-2c9c57580abmr51451335ad.9.1782727576107;
        Mon, 29 Jun 2026 03:06:16 -0700 (PDT)
X-Received: by 2002:a17:902:ce02:b0:2c9:c575:7e22 with SMTP id d9443c01a7336-2c9c57580abmr51451075ad.9.1782727575697;
        Mon, 29 Jun 2026 03:06:15 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f63cfe81sm88924305ad.55.2026.06.29.03.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:06:15 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 15:35:40 +0530
Subject: [PATCH v7 3/3] ASoC: codecs: lpass-wsa-macro: Use
 devm_clk_hw_register() for MCLK output
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-xo-sd-codec-v7-b4-v7-3-fb37ce457c42@oss.qualcomm.com>
References: <20260629-xo-sd-codec-v7-b4-v7-0-fb37ce457c42@oss.qualcomm.com>
In-Reply-To: <20260629-xo-sd-codec-v7-b4-v7-0-fb37ce457c42@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-GUID: nxgs6GlYdxwLD3m8WqlnvZ0KKBr-V7h4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4MSBTYWx0ZWRfXzEZ+gzmDPxsu
 9rjYfLFMbIOQNUsxeCIhNFbgvGxIAn12AlEK333bE5lvRgMWT7R8mGr4ga0hUCcjwtazqP43yOD
 CqU+cjGcqvfrnzXEMhfBoBQeVW/T0zc=
X-Proofpoint-ORIG-GUID: nxgs6GlYdxwLD3m8WqlnvZ0KKBr-V7h4
X-Authority-Analysis: v=2.4 cv=PqSjqQM3 c=1 sm=1 tr=0 ts=6a424398 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=3zrE_5izju647JJH3MQA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4MSBTYWx0ZWRfXxrgKtXAI6lmh
 3YVZ/K4K1n6uRcUCYvulLxdWaGTazRrlR8N4sLrjry8rvyvpgypLQRH3Z47/zI+0G28SPfZybXd
 5De0+Y6YPyIgboR56QbhnnAQ7SmGyzI0SVjcPnV04ggxFme94H4mX7/TwRhAglQxQ1kJts05BK+
 qz4y3Jajp7Z1o08aM4lR7MkSoycWLplcFt4VUfmhXxkg0Ohy/tTrSe5a3DUjkdcA4gAHmbksbyB
 /PuTrmRNv3Akq9Dhv3esHQcFOz/UfnR7AKMyb93egVxuLSvWqHIPVZiXgWsaJobIN2fCWkLta+j
 ykmmJNnJgpo9ZGFUqqeftEY7CQOlKhD9a78pUWYCrLHhkh5BF6wCSYZj015tI/FBoVlNnGGzmBb
 a/UfKlRIrNCds5ePI8y0HNEnm0ipsU+vFKxujPcnAQBFwMdql/LUrkwmBHXlFa9Tlsq9cjbOIrw
 ArPwWhG1Xga240+ax+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290081

Switch WSA MCLK output registration to devm_clk_hw_register() so the clk
hw is automatically unregistered on probe failure and remove.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-wsa-macro.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 718564ee381e..f511816aa4a0 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -2658,7 +2658,7 @@ static int wsa_macro_register_mclk_output(struct wsa_macro *wsa)
 	init.num_parents = 1;
 	wsa->hw.init = &init;
 	hw = &wsa->hw;
-	ret = clk_hw_register(wsa->dev, hw);
+	ret = devm_clk_hw_register(wsa->dev, hw);
 	if (ret)
 		return ret;
 

-- 
2.34.1

