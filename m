Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A6042252E
	for <linux-sound@vger.kernel.org>; Tue,  8 Sep 2026 08:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788856121; cv=none; b=dtcE1m7FvR8eRl45ZRntkYwNekkJDMBeaVvycyIp53tBWCeU7hl2xmDrZ+Xx/h33Jxdsz4TL1Quwyuaxqsmigc5C6W2KswkZzc0ZAvzArA3P9DKMCFlqD1iz9uF0gqmc6imhsy71Knq+DWXiXWzjW2JRWW/4cVc4CQCW3lJfNQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788856121; c=relaxed/simple;
	bh=z9P+ywUBSNkvNLZ0UrmxpKOG870Ab70CHNlvp5eJxSg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WwcKFJHOJQTJ1Fl80jseQT/B63VGbNTIr5HFi20z0LcLMEZRhfTKOU9019uG9UPNmp/Be+/pdp7Lho79YQp+kPNTKWAVgpnZ7QV+5FZV0ER13VbEBVuxkSVooOjReM1SFYVcpzCRckEMEhfB24004gXuCJx/bJ042WlOXAqmHwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PUyu1woa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Da5b91dz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PUyu1woa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Da5b91dz"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886LoL61646044
	for <linux-sound@vger.kernel.org>; Tue, 8 Sep 2026 08:28:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sO8eEMJF16c
	3bC85Z00Il17KWtgP48sEVSRstL21fnM=; b=PUyu1woaiCQvYq9ktdRE28uIXgJ
	uYCqmccQVV7jCFZbSOimX84cXYBuyYm58R19XNjBxewLnc3bq3BMzARoQ7cjP2PN
	9roacdsHFbrIB8Veln0lILQTT1p7BGbUAqWLHK8sukAqV2evS/mE4aPeeP2JV7N3
	2h9ejHBJC9xFe7huJnd7298e+IyCssKU+7iR65PmjcN0rnIrN47mH3/0QN1JAq+Q
	L8jQxJp/O+aqi1QvogOMQre6KVZMUVd9+UCwPtp0EKP3+ZHQmqaUOsVpP4q4sDzV
	0MeVCFSs/PEotlyKvCQ5U13godf9wtRye4+nqHeMfr2XfbIn+zL9IHOPTYg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjcvugj7v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 08 Sep 2026 08:28:38 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91064f6e75bso13961476d6.3
        for <linux-sound@vger.kernel.org>; Tue, 08 Sep 2026 01:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788856117; x=1789460917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sO8eEMJF16c3bC85Z00Il17KWtgP48sEVSRstL21fnM=;
        b=Da5b91dzUs7lzn7xvORPBcAKohR7qzipE4VZSkabCZH18aaZbFaDTJVjav47FlWHaL
         7YZkaSS+g/ezSX7d5L1OlUQYwu/lFTMJc+ueIshSU7IWBoSWD1M4erIhJytQQ0xBCgQ7
         72E3gRQGrNwVzn9C2kZqUbqq1sWQBW5wJbp1jBU84eaOL2VH0cIRVH+CvD7i8uOHSWD8
         jYQXwcvXRMj3oUrG8IP2Ozok9OE7la0HEkPBZWyAaNdksS8pji261qrAXROE4hgeA+Tn
         voBaUwVFu5jnnUvqEKNmKFRJ4tosQJcU+WtSdkxaJpnyqF0DzOn0erxVGkT6NIM/8YQD
         w97g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788856117; x=1789460917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sO8eEMJF16c3bC85Z00Il17KWtgP48sEVSRstL21fnM=;
        b=ifyJS7qTEpJvf0Q3Ku1SBMduvsnIa/YNiycoAwTFLHmNhW1m3n1yPpQbvR1ZvhnYhK
         g3g3tEHCBv+PFGS24aiKyTEREwuLZf5khY6jkRxx3lQ9liShnhPIDbhCOqRfRE8SjAZt
         pTrHDL7rlheeBGpSVROuHzYLy6x/cCoq/q+icU0gvFg5jF2AaFTFL+dkBjYM0j8xq/ye
         AG7bvRfFPBZBJmQNpD1QbfzDmitVoYSoGGHTm1tCOf+FDigU+xbi0bhscyIRVmPXgRQw
         6dY5o2VWF9TSjJC3cLuBmjoxpJMIT0ihG7yhcEBR47b/lIuonFAxtaJzTuoeBm+itC3O
         I6/g==
X-Forwarded-Encrypted: i=1; AKwUvByu1N/u4KJnJQ/QoYGpemBpuHV0e4uDFfPNdAli0CnsmxT4XVR88nAlTL/eiuuN/OAUXKQpqthVPXV9wQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nxnN9HXxboDTXeRq7Qzg9Fo+PRuveY5Tec0ZCuxbSNsDQA8hNe
	NZZEzK1qjWfn8bes2fW5KEnJSXkOlBucdNF+oGYZU9kyxonsW/7kMc7bmv2T5VCZ1vfINLdhurP
	XqCNqJ/WPMEC7+xnA6njrFiQyIblxKau/PVjDnNSZq8gCWY1+RUoVN2hWNutYMf7JrQ==
X-Gm-Gg: AYBFou3bIAmoGuw7xvIjRAUg4X3nQ9MRVNhhx1puSTWEXNdD77daSmk7kPd2yTqTiMX
	r+yG9lHr9t9t7VwAQLMvV4rTXHOy7COpYSSYGXv2PzJq7OtIs1WepqkZONK9MMqqrXus7oE18lv
	djomxXlepsvzuNLlv9uWq07ONKGA/DJiuVhkGIeB7wP/S9HZ0dKnHU6TgMflAEDuXnuLOdWQq5H
	CqH0Edw0Wl62KcF0pyDwh3AbXXDNRattYSyQmDgcklmFcytT7gCQN+Mfckc5VWIcryiI8SNek2l
	OWL8k3xOjxopu+rwhg4840NPVvvAUT3bEWKE+ilu87nOLPLXVg32jb8fbF5ex2BBy6ZtkdE68c3
	rbsy30Rw/yAxwyQ==
X-Received: by 2002:a05:620a:a38d:b0:939:6132:62cc with SMTP id af79cd13be357-93980426af4mr2295509485a.27.1788856117180;
        Tue, 08 Sep 2026 01:28:37 -0700 (PDT)
X-Received: by 2002:a05:620a:a38d:b0:939:6132:62cc with SMTP id af79cd13be357-93980426af4mr2295507385a.27.1788856116729;
        Tue, 08 Sep 2026 01:28:36 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7736132sm369414605e9.12.2026.09.08.01.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 01:28:36 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: srini@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 5/6] ASoC: codecs: lpass-tx-macro: switch cache to REGCACHE_MAPLE
Date: Tue,  8 Sep 2026 09:28:05 +0100
Message-ID: <20260908082806.648797-6-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908082806.648797-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260908082806.648797-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ePkjSnp1 c=1 sm=1 tr=0 ts=6a9fc736 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=JkBDmzDGGkIbPcWOdIMA:9 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: QPAC3wps_Cb_3yXUP2bw56YpueRPEk0q
X-Proofpoint-ORIG-GUID: QPAC3wps_Cb_3yXUP2bw56YpueRPEk0q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA4OCBTYWx0ZWRfX9je11gh2wK33
 5DReSnQYFzmJtrmg01ptRkNuU9kpjoV9IaZ+D8jOyQYNKpfmIDK0Di9OwkX2vx6WXwCvVngLFkX
 vT4EzLq7x3L2sdhGievJ/un8cyxagRti3abl2yBsROShg9i8aNUx/X1s5Htmvreg9UMtU7xdqX7
 2KCHdtWKFfWIkicW27TbO3w1E6qoT6SYYCfmJvibg6+ighBIv+DukcAg1uePZzEmWaTf8x4CN+G
 lxgyjCgoiRYYrvPESUWAngHG82MtXNO+B7xHnzZ2GWxMKclkCzsNZcT8Ty+E6LNj1cKap0DFZjU
 UIhAHCPgtkZctr8bjJfWRdzRtw/cO9E26tjX68xDsx3KizbMM6rm37Qk20t72CqKzW05o2vyifL
 pF8Jl/fegOBBHqlE0DUj4VwbJA9+XIQLHJ0pN5xRaZ5fRNA1q6djhitI9Y/3g3s7BhZkZr+wynq
 ZfRcIlSJ4C9EEAm1BVQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA4OCBTYWx0ZWRfX81mwQAVk11tR
 P7td0CfOqADUsu9OkX0aXPGbqdmyfJ8WlTPvvBo3ozVR0IcDEgwY1XR6uvzqdIreM24Gcgi/Qwt
 ZgHc93/zfWexfJ8lRZCvEF3WVsha6bI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080088

REGCACHE_FLAT hides missing-default reads by returning the zero-
initialised cache slot instead of doing a bus read.  The caller
can't tell that value apart from a real hardware value, so any
un-defaulted, readable, non-volatile register that gets read
silently returns wrong data.  Since commit e062bdfdd6ad ("regmap:
warn users about uninitialized flat cache") regmap dev_warn_once()s
the first such miss, but any subsequent miss stays silent.

Switch to REGCACHE_MAPLE.  A cache miss returns -ENOENT and the
regmap core falls back to a real bus read, so the caller always
gets the true hardware value.  Write-cache behaviour is unchanged.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-tx-macro.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index b73a19eb9981..b1cd5e34624a 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -602,7 +602,7 @@ static const struct regmap_config tx_regmap_config = {
 	.reg_bits = 16,
 	.val_bits = 32,
 	.reg_stride = 4,
-	.cache_type = REGCACHE_FLAT,
+	.cache_type = REGCACHE_MAPLE,
 	.max_register = TX_MAX_OFFSET,
 	.reg_defaults = tx_defaults,
 	.num_reg_defaults = ARRAY_SIZE(tx_defaults),
-- 
2.53.0

