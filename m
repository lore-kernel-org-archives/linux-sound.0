Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381893E2758
	for <linux-sound@vger.kernel.org>; Mon, 18 May 2026 08:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779092289; cv=none; b=rCQxyiICXrOh6Bp1BJ0EGDjOhKokNdps9KGVyr9BcZ45NKT+XgDUpcIzLehcqz3u4TzV2WSdaRvn/d27YwwmCu8ZaJfjYLbMEowD2CwiKzcE0UJkeztdKyq2EjfS2Vj838N0Qd3RjTvyGTgi1GNoiwq2xakl5PjOsZBj4ZRBdDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779092289; c=relaxed/simple;
	bh=TZ5Gbdy8MpD0BkDYauXmi2P3QUkOwpzPVQi/b1SuMMU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QIWXSs59B4CcKgflXp1lZjbqROik81uZTyy4ZBBVwCcm5Kt9wdsbjf5bQ9ukRxvQgG4LRggk2YybyvkljltH0SDstYcvYg9RAU8DePeSPZQfzJKvXCBrQv67igMXW7k0Cx8wcL4ScsNiKjxDh1f/GwNsAL69xXcy8/FzO97LTEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OWtZY5vP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MxEAUTux; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OWtZY5vP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MxEAUTux"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I7KQYd919547
	for <linux-sound@vger.kernel.org>; Mon, 18 May 2026 08:18:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LU+3o0EUymr
	NGBvYnnfmtFWJLYjR5wRDEMuCtrEycf4=; b=OWtZY5vP8CWtrDxnQeurdLvohLu
	GHEuqAVqgXDEoKB+Mj5PCpXx9oA8zsZZGuCOelrKBfc5Lua6Ue8e7RYYy7Pf05Kk
	cCZuSUStCSUKMgcR71VkELH+vL2CeUgUte/qSlbKKstZ+VPYDss4h+weBe7G5ikS
	uYqPlpJr/LJ5zytzskGt/A+dnYeAlcusR1lJkdZCOT4xH+NOCzPNlvWjhPCU3ALG
	9J4/N1PvSb5r1iy72oX4dAtRfV2Nk4BQfZZzegi/+nkvoIFGZfBjEwW8nha5QyIz
	KgXp7Z5xWJuJyevPhemKlFhpOrmc3u+5Cpg/DJt9IEOS9i9x+BrzgmmNaKg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6hv7wbar-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 18 May 2026 08:18:06 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ba054e0304so23812065ad.0
        for <linux-sound@vger.kernel.org>; Mon, 18 May 2026 01:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779092286; x=1779697086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LU+3o0EUymrNGBvYnnfmtFWJLYjR5wRDEMuCtrEycf4=;
        b=MxEAUTuxlp5byTbE8lEGuD8jkN3bzFZglh3KGeDC65VuzKwRjmGtTknmC2FsKaRDae
         Bbov9cA9Ftng4VZ3AJ9YDKCp42Vt1NEOi1Z6nXd/dnrfBX67xgKm7DBB7k1LQ8BAXdrM
         ol1pt+Rxc9UBdNZs/GX1X4P4eyoDM2BLVXm5MDqRsPdyjh10xusewxEzGb++/Tie4bfy
         IvnQklcArlo7zJ+Kj9OpA/MzrOjWv4pK/eYJwCqZu3QhkZDamGRIc/zKL3AbzIvf440y
         5p7RnQIPBpPdD35fwP2hEqDssLNoD7u6Ifr1z1XS200S0DHYDRMt4vZIfAOMML8Yfp3H
         BZJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779092286; x=1779697086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LU+3o0EUymrNGBvYnnfmtFWJLYjR5wRDEMuCtrEycf4=;
        b=E9olCKpwvUOKe8MPG+uhLBX7NetTYuvdIZi4K3AX89z1Qh9lfQrImv2dvh/ZzRbI6w
         ngYzLXlocxY/He9Dj35QzjgnuK8z365q++8pElrZ005Nqd43pC0iC3b8r+WArZpi+9ew
         pi8QfrYs/lnBLjdtg67LuJFq1bt+ynGH8tSzcY37cVhNwAN1BsaAIhXXNxvCuiAKaYat
         yEptdMbdMFl6CAfEUkDgyyuu3DYfWa5esodSiuLCe5G4Acw9ONaRMsMRy+aFzFqjq/aW
         0tU82g9MMR942MMbv6niU+jg7ubLHB7mvs+y0MV8/9v9NOVvOebysEtS0yZ0VajP8GEZ
         uPng==
X-Gm-Message-State: AOJu0YxrlIIYknmVHaGewiY8JsR+zsuNF6Ar8RwZDt+0opVLRFYUyblq
	JBA17bbckaWZ0MR5dKiPQ7yt6DJEWR6qyxmkp8EZ534ofkR9mbU0ETLBDy5Fd8sLVu3UF/UZpds
	OQX3n4aKrLXotryteleCpmfOEBj1YpTV3QPykigzGM4Hzg3Ci6VSu4BG3i4KiveVPBw==
X-Gm-Gg: Acq92OFNIiUVpST8fw7lcsHsoRgaSQbYWiHUWHgiv38W5mC0vX9zFSxcb3flfaB81FB
	O08Ml5u1/sbqk6mxnp7O3vmNuaRTaQaXwIwa5ENzM5uyoPIwSf3l/eoWxYFtP0bfPTh900P5/4P
	mk7/YTjQg/Isyi+GvXOe7fxKpAwhF8w7jaY1vGolufFrwu1xH7MJADgcAeLrKNH8/VNpI9ZG4SF
	lv0Ow0AMuTa8o1WjNeFvY+FUQGsvBZHfyKNKZUUh+oOvc8b/PPLEkYKO1TlFt6O2aJ7+Qx2AZzC
	KOXsFQtg2GfDZSABUwedxWQt4IA5nu+w0gZN6rBNV1LvZ9GXCQuxkeW6u1lyq7HfHnq2q6EAbgd
	57SeeNpaai2yKaY7S5P2l9Ky0EilRT+lcelKCDkeptFtUsXlKMg==
X-Received: by 2002:a17:903:4501:b0:2b0:ac1e:9730 with SMTP id d9443c01a7336-2bd5277cb20mr112546745ad.14.1779092285712;
        Mon, 18 May 2026 01:18:05 -0700 (PDT)
X-Received: by 2002:a17:903:4501:b0:2b0:ac1e:9730 with SMTP id d9443c01a7336-2bd5277cb20mr112546505ad.14.1779092285243;
        Mon, 18 May 2026 01:18:05 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c2631basm136620755ad.34.2026.05.18.01.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 01:18:05 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4 3/3] ASoC: codecs: lpass-wsa-macro: Use devm_clk_hw_register() for MCLK output
Date: Mon, 18 May 2026 13:47:38 +0530
Message-Id: <20260518081738.2453957-4-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260518081738.2453957-1-ajay.nandam@oss.qualcomm.com>
References: <20260518081738.2453957-1-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA3OSBTYWx0ZWRfXwcBhb1iG1vCA
 YSlkFYy5zDidIPgvryBOHCahQHDzKYeIfLkFNkDWcaOrDaGZkiuZOPFgsVdhU2qqqSqvAeUfsgH
 t/f96F+00/XT/FjrI/5boc5nt4wwyEvwznmgGv9aJpn903VdctXmZmDblrF+ZuJNdk+N3c1h9oY
 WIfHFGw4YDyRF/j9z6060UeqYlKcmsc3GD/lnt/kGpdYMOOCQSHoiTl68DDxpqUZzJmJ39VUvLq
 HfeJWMoYkpbk0bOCgA8jq8sH3CRu5LSlZSznFhVFf9YXEKNuOONLpoOxF9Zh5Gqs61yGHUKX4UU
 EL86aMH+inFkheRFTyfPdEVWfcV/H4lSQmmeUstp9MNyInxTlLXfq5HgOudlfNET2jyumAGXfMu
 Yi300zeFfUPVwLqmqQQzQ5FnEJjoZoKNIv1Qr+qU6073gwZCOGid18in/G3e8aFl2cTe0SnXusq
 +52oqGM8NU5bzXezfXw==
X-Authority-Analysis: v=2.4 cv=a8oAM0SF c=1 sm=1 tr=0 ts=6a0acb3e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=E7064k5JgmqFsk_8azIA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: eORB53bbWEOkXanQ5Pxoz7zdVF61o3ew
X-Proofpoint-GUID: eORB53bbWEOkXanQ5Pxoz7zdVF61o3ew
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180079

The WSA macro driver registers the MCLK output clock using
clk_hw_register(), but does not explicitly unregister it in the remove
path or on probe failure.

Switch to devm_clk_hw_register() to make the registration resource-managed
so the clk_hw is automatically unregistered when the device is unbound or
probe fails. This fixes the missing unregister cleanup in remove/probe-fail
paths and simplifies error handling.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-wsa-macro.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 598292fe3219..3081c115d584 100644
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

