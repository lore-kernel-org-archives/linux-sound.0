Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80A23375BC
	for <linux-sound@vger.kernel.org>; Tue,  9 Sep 2025 12:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757420424; cv=none; b=BXtnJzyGTTTieVFBO+Ox+iuZWTDfKj9DD7DdSLgesZ0cCU2yltHrQamfeSDe24/UfEdTDVE9TJJJDUILN+UExMWA7u+joQZtez+Ss89v0znq+1cnb6q3j6kof15IAfPHe+WLjQqB7boiMHnJr+Syf5dP83kVGi2hY4Ltz913NdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757420424; c=relaxed/simple;
	bh=Y67OeXOkwjcW/WgRDCaa4+GVWkV3DnYW2b1CZ9RDeD4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B5zKvmyT3BZ8DyTkLAN8d5QkOm9iGr3LatbZpDgyr/YEf+MIWm5T6Jvh4l6D/VE8swP2re4NWNTytsB+CPqTBITx+lBvDYHwwt9R7t7MY8ZkMEMkoALYCjjpyJ0FbVtMzB3r43kcdgLB7KGp9S8Nid4s2tpUlGbkgCNrBOqCr4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NM/0uNpC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NM/0uNpC"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LSRx011050
	for <linux-sound@vger.kernel.org>; Tue, 9 Sep 2025 12:20:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Jw6p4thKtOG
	Ii/duK9Bwui939to4NPczh9FQMtKLRgs=; b=NM/0uNpC3/AvOA/+o2UUeWz9DE3
	qGNRxtIu5eVS51f7SXII0au7YsKGpQDZ12aHkEzr4JUKQMHUDnFpdp4y2Efu5FGF
	SBGgX7D+sI5NdtbfJ3ZkZCMXfNmnTp4ocjBo29oYZ7YeaOHWj2K+HRhTweakkcO5
	b18o9w1IYhg7o88sp/F5Fw8ZNVQNVoZPumop4RQEMYPU3GDyaR3BfjtUF3u0UVG7
	+yrFiUte/kcX/BZtCP468JO49X14N4IPyK0uYhIg4QyD5hP6Xuj7ll5nWJwep5bk
	/7mR3Q3fTkXv/tz6RY/5KL1eFK94w9JTLqNSTJCqrKkbr0WzMwq3Xdy1TQA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj0r5n4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 09 Sep 2025 12:20:21 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b60d5eca3aso62856841cf.0
        for <linux-sound@vger.kernel.org>; Tue, 09 Sep 2025 05:20:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757420421; x=1758025221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jw6p4thKtOGIi/duK9Bwui939to4NPczh9FQMtKLRgs=;
        b=KwCQ/li/YdJFth89jqFRBrNQ81DLbx3B2xBLSQ1NfjhEgcHEUzw/aRCQ9JZxFPHoGx
         HJYF0T2szZJH68VMFkjCBXdd7zijSKU01o4KplwipoLzJhllpfF83bPIfv6U2IVuRcfv
         zlUXrzFacyJx83DNYWIZKbI2gAuCBjrbTD7FifoaXCwvvl1vsYWYBMXQjsQjJOSXbcvw
         UlNg+FsyMDBZYNQMFIwm0Sm7jvNOZJnD/TU553qUrlm21l5lYsOFHcpSUSFU7V+jUnYc
         fB2+Et51K3/FtXO22al3UcZtggshsqIJdP1AJgxmVLbfhuu8sgXChKjK+2cbW60fvPQh
         2jJA==
X-Forwarded-Encrypted: i=1; AJvYcCUpm+wZCCQUB+eD6K3LUZBEENgFCW9M8vU0ukW9PHR6/WXi0Lh4XUXLuEEXCQU1+R9MUSFHPERN3TPUdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNlScz/g+fUPwm4UMJSTsEybdKFJHnAVV6ilfzevmFmhbK0c6o
	larWY0azXW6COoKv+Z8RsMVJy4eMACv79Lg6tsjqaN/eFM7N26jRmVS/9enfhzBj78DFhUrv+Gc
	HGxdDsxiO19XQuKFdqqPksN4EJz3qwU4FHjpalQRf9bQld6leC1fGYqKh9/2QShYPjA==
X-Gm-Gg: ASbGncvHisWxowlXK9NeiegA1x7A+4+srTDofbYYmk64AT1TDfeLPhi/2DAxHLz8Jcd
	dcym/TNzo6BGuKwO0odF3TB4oTx3hCdiP3F/7znEIu4FYYywv2olNHvIXF6F6Krqqu1lLl3G5p2
	4QMD44MZBOSkk1SgkHQ4EW9XOE+m/nBjhn9iMvCBp14ezoNxCT1NvvrGCdxzV4sPO4n78ic77KC
	HDt7JeWpkYAjEBIqKpHbFB9sJ+lf4Tk5YNk3r1v2CyrSyzyqYco0E9j9tGrkajuZ78hpkiUhuUB
	vlA/5uOuXp2XyrcEYvO99D2Ul3fR+gvjzpRNZfUC2wFrXuLyizFqig==
X-Received: by 2002:a05:622a:18a1:b0:4b2:fb0b:1122 with SMTP id d75a77b69052e-4b5f84bb472mr113320231cf.79.1757420419687;
        Tue, 09 Sep 2025 05:20:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIyTDywxBfjStYv8GV4OQGPpf5h39STdyrIcnbnoLBGmrnUb4Pm8UjcwFoNGfdUV9syMdXzw==
X-Received: by 2002:a05:622a:18a1:b0:4b2:fb0b:1122 with SMTP id d75a77b69052e-4b5f84bb472mr113317241cf.79.1757420419064;
        Tue, 09 Sep 2025 05:20:19 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e75224db20sm2414629f8f.60.2025.09.09.05.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 05:20:18 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org, srini@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Stable@vger.kernel.org
Subject: [PATCH v5 02/13] ASoC: codecs: wcd937x: make stub functions inline
Date: Tue,  9 Sep 2025 13:19:43 +0100
Message-ID: <20250909121954.225833-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250909121954.225833-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250909121954.225833-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 64Sz2LnC9WAlWxWJ0gr9ZxYmucww4MAj
X-Proofpoint-GUID: 64Sz2LnC9WAlWxWJ0gr9ZxYmucww4MAj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfX4tZywAFANS8m
 VMAWiCkZuk0iin5KS59Hieg7wYvnhlvT/qpNoN68BNl+QBBHBRpAZQWT0y11FjHA+d9wPy9Ryvc
 BlkxMFa9Mw1L5TIkZJdZpGEJQMw+aMIf+Yz4z/8ORe1Nt64N9Ccy7cOW3ORCymXQgiJCd3JdKtZ
 gMi6UtsMlpGWaBsKof6zax66lRW44bif+OiGY7fUkF/BJSiiyEqH2cvIJyoa+w4knHDfjK5J5UW
 tWZygqh8kix2MbBpNYhQ4TSUt30RinIWx4LePEcYfqc7WGZgv8kGxal3l2QTr8kqokyE9lIVOcI
 c+sjHXW0Jl2nzSB1PVt//ykRVtcP/k0O3EJF+R1ExmxJ4C3xtix2oDF56kQDKy6VWudoir1wni0
 8X3vb6+l
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68c01b85 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SV47_qJM1wkz75m2VG8A:9
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_01,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024

For some reason we ended up with stub functions that are not inline,
this can result in build error if its included multiple places, as we will
be redefining the same function

Fixes: c99a515ff153 ("ASoC: codecs: wcd937x-sdw: add SoundWire driver")
Cc: <Stable@vger.kernel.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/wcd937x.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/wcd937x.h b/sound/soc/codecs/wcd937x.h
index 3ab21bb5846e..d20886a2803a 100644
--- a/sound/soc/codecs/wcd937x.h
+++ b/sound/soc/codecs/wcd937x.h
@@ -552,21 +552,21 @@ int wcd937x_sdw_hw_params(struct wcd937x_sdw_priv *wcd,
 struct device *wcd937x_sdw_device_get(struct device_node *np);
 
 #else
-int wcd937x_sdw_free(struct wcd937x_sdw_priv *wcd,
+static inline int wcd937x_sdw_free(struct wcd937x_sdw_priv *wcd,
 		     struct snd_pcm_substream *substream,
 		     struct snd_soc_dai *dai)
 {
 	return -EOPNOTSUPP;
 }
 
-int wcd937x_sdw_set_sdw_stream(struct wcd937x_sdw_priv *wcd,
+static inline int wcd937x_sdw_set_sdw_stream(struct wcd937x_sdw_priv *wcd,
 			       struct snd_soc_dai *dai,
 			       void *stream, int direction)
 {
 	return -EOPNOTSUPP;
 }
 
-int wcd937x_sdw_hw_params(struct wcd937x_sdw_priv *wcd,
+static inline int wcd937x_sdw_hw_params(struct wcd937x_sdw_priv *wcd,
 			  struct snd_pcm_substream *substream,
 			  struct snd_pcm_hw_params *params,
 			  struct snd_soc_dai *dai)
-- 
2.50.0

