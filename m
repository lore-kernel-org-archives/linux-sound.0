Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110FE261B77
	for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 08:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760691386; cv=none; b=bBZ477k2K7mys4KxeJ3VvhTEpGdnoGyIs9MwWzuo1JWa1o3KLRSFmNhZ3AHgsm2lhl30UVMQs8crXTNX5yEh39YLKd0SqvDh1cfEpU3V0b8sZtjh0A3XJKw+/aLsw0bc6OUcbqIiJckL7zKPj51Dpp5y+xLIddvHo4JrB55Nbrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760691386; c=relaxed/simple;
	bh=ENO3YSOfTnciWFB7PA21ZeJ+n8gziqAO4GtBW3dwPPk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b6SFE5ShN2eEA7xUwpo/PPtwcVTMQk/e/1rgrQJ3xthFP9Mlljn3Fp4hnwvEQQdn6pSEHl+c1CYDvHV30ktC48eM/s9gzgyxBQwDAI+DnhyrKQdRUCwHYfE5ZRpW40rShMC6v5N1Omy8Y4nCIi6KHloYhlNvACzGHf0UMEnFNxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SDgeaNcx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SDgeaNcx"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59H88kkj006738
	for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 08:56:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2qk5/cDXnMl
	tBmhvmLVh3pUHcYmEfXQKc8nHF57WqJ4=; b=SDgeaNcxQnseZaDUnIlewILulX1
	e3ImkJv5NOHHSQxWYsdl4vaZtvuXLh0CHik8QqjWWgDWTlWiqJvKjmMFqyQTj8uL
	hj6A7dWvEm1JPhuI9YIy9czvFKSHi4jwePTo5Qy1XywqaVD02RFAkMffN3VHz+W/
	fDlOEtq9TTlRFz3hMk5dvbhK3c24Mgkfoes2eG3bTZ4kw+MbfEuWZRCpwJ2r+eSf
	v4qjg32mGj7QyXrB4mANy0VCqt9MDOyeXjknhjwRPbG1VHYUYl4CfBBErUK+LXig
	nbcYb/qBA0vLEA75gz6OoWSWDYosJJ8S0tMsD2ZIUvBBkvPvQctauw4s2ZA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qff13h33-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 08:56:23 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-87c0f8cbe6fso62995796d6.0
        for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 01:56:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760691382; x=1761296182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2qk5/cDXnMltBmhvmLVh3pUHcYmEfXQKc8nHF57WqJ4=;
        b=mNK9IlrThI6kcS2KhwqvgsrFoE5h1yC8HG5bKANM3KBaTg3FMIcsylT7s1TTb08l8/
         ZxMGAhDaBZNvsX6OO9Ej36JVOStmZKSCzjfxABFtJsYwI9Ln3Dyz3aRZPbRBwoXg0LaO
         3UwtTyJfi2u5cXWLRcveg5hkDWmL0vswVaJxqy4rXfP97hPts0lB8vyEIr+hnYZsQ73T
         pilyStbHPRHyl3Y7xjfKcTP/+kpCPUfIMaHZpgqlgIbgebtXCwPIe2zGvrUVBzIEO8ip
         Ube6UVC7YUQmzcmZqbOSRo/jSGuoAiXsd66cHoDFFwvJ1/HJxMsEXbhmWMCtkj5S+VyV
         J7uw==
X-Forwarded-Encrypted: i=1; AJvYcCUV8AmgUvtP9bUa9McwBNht3Szhh61xcrixrsL1Vj3zkQGCawB0rxdc+6Nh+QK908U1+fMlk5Vy0vxkTA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPg0cHTzcdCmx4vzdMTgvt0+Kf4IeSNTuk2nOpWR0gs3BJaVSB
	dEyOCQBNQ13jAVc+prj1Knz+z3edhVxg5OQAZusook+gFzruiWucAUku1MHugtGZ3G6P1BxDJmY
	u7FpLuc/gzl7F9WwGo+CYg2AfOlcU3DCkyrqKXd0sCyASok1/LWiD2ZlfPJZXjY3PIg==
X-Gm-Gg: ASbGnctC4C287E6f8L1pxDGPNtWOmtZVkbUTVfeqO76LAx+wr8IIxuvzCaLRYX3C35y
	gIsZfc0PbrJJhxOOClNncvn+MgcEy0NcQFHz/9K0dZXxW30veF/I1Gf05VNAKffa5mLrZAJPAIP
	MkJpu63Ynaq+E5lkgkQK6gI/8Z3xe8HX1uquXIEVqXXAxh98Wz6HYheROOkyDGFmPNQa/aqUjuj
	YXn42YO1RkBwmUNWtmnffFB67NqlxTOXtByIJ8EZ2okqLHAWgX8D8Mv5DvsIYdm6t8MIL5jgivc
	8U/A29NKX2y/ax509XpLql8b0osRRRRHPNekZHJhYmd2rI3FNkMDeIQ4ok+EvfrEu7a8fGMxkrG
	YHnP4fa8IoMMK
X-Received: by 2002:a05:622a:310:b0:4e8:9c58:3282 with SMTP id d75a77b69052e-4e89d28b3cfmr45995041cf.29.1760691382171;
        Fri, 17 Oct 2025 01:56:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXmaWELNHeA4YfO9bK7KKaN2PbiUIZEHrtDSzzKi76qlVj6r6Tyv+8YGZWV56bOI27CdHbfA==
X-Received: by 2002:a05:622a:310:b0:4e8:9c58:3282 with SMTP id d75a77b69052e-4e89d28b3cfmr45994871cf.29.1760691381758;
        Fri, 17 Oct 2025 01:56:21 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4711444d919sm70764985e9.14.2025.10.17.01.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 01:56:21 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Stable@vger.kernel.org
Subject: [PATCH 01/12] ASoC: qdsp6: q6asm: do not sleep while atomic
Date: Fri, 17 Oct 2025 09:52:56 +0100
Message-ID: <20251017085307.4325-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251017085307.4325-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251017085307.4325-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX29Qs2lZyaZpn
 Kbo4mcmzi2RI5w/ozMArRX8n+atVwFBxUYFjYC5wKLlqM1pRcVXk1EZEUckRh8ckn/PtqzioPzQ
 lOToNQT5TzCqlF7C3jFtTGNUv4sL/C4Z2syw5/94nPr+aoqbyg8Hl20WHlA9wX/MT43dULp/Jis
 TuelGQsyZJsEhH/6y2OLvHG2NGNgbMPAVH1DNugYDeYRRmpx6Sf2SNiQ+/Ucxm81vsINYBmbQMJ
 ZhbbE8MGBn8Glm96U91EqepFY9v3J9JtKjhRHbXHm3z0sTlsQNXAEU3kjvosDCSSI5zadrBVmAC
 mdXxe6eE+ES/VWTeAM3TtHrlocGwBje/EdINRb/nA==
X-Proofpoint-GUID: Z1AVsdYF3bjCGGhzv2hd0syUtxILSVqD
X-Authority-Analysis: v=2.4 cv=PriergM3 c=1 sm=1 tr=0 ts=68f204b7 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=cAUPnWn_dBUFebge008A:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: Z1AVsdYF3bjCGGhzv2hd0syUtxILSVqD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

For some reason we ended up kfree between spinlock lock and unlock,
which can sleep.

move the kfree out of spinlock section.

Fixes: a2a5d30218fd ("ASoC: qdsp6: q6asm: Add support to memory map and unmap")
Cc: Stable@vger.kernel.org
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6asm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm.c b/sound/soc/qcom/qdsp6/q6asm.c
index 06a802f9dba5..67e9ca18883c 100644
--- a/sound/soc/qcom/qdsp6/q6asm.c
+++ b/sound/soc/qcom/qdsp6/q6asm.c
@@ -377,9 +377,9 @@ static void q6asm_audio_client_free_buf(struct audio_client *ac,
 
 	spin_lock_irqsave(&ac->lock, flags);
 	port->num_periods = 0;
+	spin_unlock_irqrestore(&ac->lock, flags);
 	kfree(port->buf);
 	port->buf = NULL;
-	spin_unlock_irqrestore(&ac->lock, flags);
 }
 
 /**
-- 
2.51.0

