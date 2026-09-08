Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3B3433E75
	for <linux-sound@vger.kernel.org>; Tue,  8 Sep 2026 08:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788856123; cv=none; b=aA215wOoEf097yfeR2OmhDU/hLQULXXg/B+M7gV+3lu5vBDCIHiGahbFhMXB62Z5ENWtXZP/0boT8AaGTYt9j9R6toPBztSWq4fHn6DVqo+bLUoZbfh3LuPR7iRBKBIeqjFy/hzBvy6lds6m///+Y4SFG2T5jKVWDYsWoWS6ZD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788856123; c=relaxed/simple;
	bh=/c4NFy4mbqgcTubVGDjrm/L6/KR3/OhBlimCDlvlQro=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WTG+VLLncj6LU2JOWwQTNMMyrpbr7ksexnvSqqnf8cnEHtD2E6X5n2TyChEMg4dnw7YR/XQeuNtvCV8UIsBdBanJ2dpYW339/API+4Cl0dtX3bcr3AfAzdMCljbrCaCpdbV17LqGUN06KtsslP63WShlTHUnVZqiTBnnuHcud1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Er8OCECr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BID3uF9Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Er8OCECr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BID3uF9Z"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886M2na2712387
	for <linux-sound@vger.kernel.org>; Tue, 8 Sep 2026 08:28:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UTCiQoU464h
	tRcfb9JVhf0FdQsMAlBERFwecvyCAnaI=; b=Er8OCECrtI7kIrpa0dzH28R5A+y
	MeNFcIbAqY3h/yV8hdCACo/72q+jmpR1MU0snJ1/BcX1vDxUB/rmhHy0hOg9WjRb
	UUpQrhJH3pjL9JBMbhI7JCYxvgTnMFJruiYcep+wYeUlDLJZPM9QhNUyVRGdVXfM
	pgsGIlteR/0I9+23QUnBBgSJIWHTPbBkCARkMn24BjgfROVsJnFR7cGxiJWS+DK+
	C8uTGnsny3+m7YrUkUV54nOFi1snMvJNB5PziODKnaj+3oO/fHMoFy/CjX9GXzCA
	QZq4yw/TAjTQhOV59fBbKJHCsNioPd4Gd0yI33rI4xAZIH/El88LUr0rc8A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtdqm95u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 08 Sep 2026 08:28:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52fb2a46cb5so97795881cf.3
        for <linux-sound@vger.kernel.org>; Tue, 08 Sep 2026 01:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788856113; x=1789460913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UTCiQoU464htRcfb9JVhf0FdQsMAlBERFwecvyCAnaI=;
        b=BID3uF9Z3DgDKmwlB0w3t6I74C5o1uRWR0FRx/QFFjzF4AyIeHRZOx7Hvf9o5ku2r+
         pMU6iiAPGiLxcJ24pZUc1U7lVxI6518os7kFlgYt4dcJca3vjOx6J8NpKh6DMJUPCbXJ
         Kx8CcqNmWq/96rn3eSTFmSxD3SLaR7nJ8WD+eLlHnfQ025JtGoRKZbYT3lW4zllcFUH2
         5+U4XcUM7+lnG/eZJ9oX686apeFADTxvQD7iEju7Lytv1TALAKmhW+3daZnZjLvcisxA
         wJFaHCwnGgd5Pn2co3YfSWn81Q06NcyXbk2T6r0NJx6tXgj2dWrDoNQdRxTQzjJUuxtJ
         yANw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788856113; x=1789460913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UTCiQoU464htRcfb9JVhf0FdQsMAlBERFwecvyCAnaI=;
        b=J4DvBlqpX0g1z0NbVOeQHirlTdAUlCQJMxLbklRjUUmABrbc1q2ec3M6O2IvBkm7GP
         DBc2qvdukcNuvCC47V2lf5AWHPLTjHZdOQT/3FaB6xS605ZH6XkDYVUnPp3s1VdvCx5c
         MwmPj9lm2j2o9dPH+umWw7CNg2sPqqcQgs1HsxENtbjNbrZvplP7KBWK08Ch5fs5jTyy
         MwhMIBarmrd3NcrAixyMYO5xFsf6lmW9KcRLsbyjzAzJiZtRJLUoYCa7ejDa8ldP4vp/
         U3wSiDJDdJN+DEuLaRTPkv74xZcq3Xr0XifH9En6IXIG+SNZ2wca+XJBOZWxW89KbjaV
         tULQ==
X-Forwarded-Encrypted: i=1; AKwUvByOOtWqVomBDr8Xfan1ojHVXzCmpj4+kkz6W/PpWb19w90b2A0cjx+N1I8GLDEJ4ZEVw4LiMjg16gS+jQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mMuNd0GDZ90xUiwE7HYrB6jfgvMZtKyT/FzNAx+tj5lxdRcBlt
	IcrZG3Lv+A++019HQTA58TdCPBgtcBqstriKjPvaA6EabWceebO8L1vRbbsc+vlDuoyyiBzplrz
	hfJFvfn62tsvV+6j10j/zdtwAUdDjcvOaGPfxkfGPloaU1meBuJelQr71U5ul/g0NpQ==
X-Gm-Gg: AYBFou0/Rgf8eo9D9E9tPDNzgUlt+8SPRmxRNYK3EkNBm7pLxSTNvGwnwTfKe3+yeYf
	xJh9QXa+jwRqiExzsd91C41A8Ot9SP8SRJpQp4+/BQ3OsY9wsbVgK0OUr6KLhjhqGWUs6k9QZuf
	rat6N+xuvgnPHAKC2DueHAM1epGFQmJ6uasNoIIOK6J27ldkPiZ6aG48o2vfA3r+MfhLIMLcNbJ
	XyjU9KFgM/WQN50mpceTdN7O6+qQXUr+Id/TYjT/NSWCtPXnm+W+1aom1fWn7Mhk7KzG1nxVeqG
	cLUdIaVYDMPwv4tD9YBRVd0+saKKO3sLLVM3f+BGilFjc3YYn0njiobirEBVRnZirjGoLuHMvF7
	/EuNmAsc2XPikMQ==
X-Received: by 2002:a05:622a:153:b0:527:7813:a439 with SMTP id d75a77b69052e-53054982b53mr329351631cf.27.1788856113602;
        Tue, 08 Sep 2026 01:28:33 -0700 (PDT)
X-Received: by 2002:a05:622a:153:b0:527:7813:a439 with SMTP id d75a77b69052e-53054982b53mr329351381cf.27.1788856113183;
        Tue, 08 Sep 2026 01:28:33 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7736132sm369414605e9.12.2026.09.08.01.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 01:28:32 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: srini@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 2/6] ASoC: codecs: lpass-{rx,wsa}-macro: sort reg_defaults before regmap init
Date: Tue,  8 Sep 2026 09:28:02 +0100
Message-ID: <20260908082806.648797-3-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA4OCBTYWx0ZWRfX0cUpXPhGOf9R
 sNvVJ8fQujH1vx9DhHngcNQe+ct+ilN3E+UFNG1x2rbaXb0GbebWyM/LRwS6VMtNIJ9syfSjw8a
 mJ9MouXisYvXz9GPrgrmQrR+LGK0N4hQVrogJ26kiNXj/fTui0bIMZLYGatNAIMkasFXr58cL69
 hSMnvvGpr98ECtuQR0G0AJxminON+4EFnPsfSntDOKyK9a2iGZDX7YcMvpY6ZN1cB9taCNL5ZdP
 6YQVrRSr9JMGjt07iuLFQ/WYdyikzpiULilId1BIJESJ8URjOfFnM/SwLADuwq5woejZ6O+kdNG
 mYcHkvBQILtpjSoIY65VPLRy1HYyWWrLp02G2MithjVjY7YJTV8BABplf9gGhj9GYo8SRiOynpQ
 s8GZuPuRZ53lcYtodHtvbIthupAI4Ut3J49H6cyQGmRag0DSBm9qJ7P7hENbdpx+MYrbshero5V
 7ypXD9rW9IP6CjAV+Gw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA4OCBTYWx0ZWRfXy0zzxbrSDaTI
 E/NQOrqqCcGvP/C0ugB4EQGh9V662E8ypgEjyL1CFLcOVXiyfbWLxzEfZ4BAEUEMTQtMqwIDU2M
 njE3qDF1GxVGLGhaAR9DsPSROFFe6do=
X-Proofpoint-ORIG-GUID: ixU6gpZi_apLICv8jWJhzHgO6ANriDem
X-Authority-Analysis: v=2.4 cv=U6aiy+ru c=1 sm=1 tr=0 ts=6a9fc737 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=EQvkBjYcCjhqL2gfLRsA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: ixU6gpZi_apLICv8jWJhzHgO6ANriDem
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080088

Both drivers build the reg_defaults array by concatenating a base
table with a codec-version-specific one; the resulting array is not in
register-address order because the version-specific ranges overlap the
base range.  Regmap detects this and prints

  wsa_macro 6c90000.codec: Driver needs fixing: Unsorted reg_defaults,
                           sorting the copy
  rx_macro 6a70000.codec:  Driver needs fixing: Unsorted reg_defaults,
                           sorting the copy

then sorts its own copy at runtime.  Call regcache_sort_defaults() on
the concatenated array before handing it to regmap so the warning goes
away and regmap does not have to sort a second time.  Keeping the
base/version-specific split is deliberate for readability, so a static
reorder is not appropriate here.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-rx-macro.c  | 2 ++
 sound/soc/codecs/lpass-wsa-macro.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index cac0451f8139..4dac376927bb 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -3855,6 +3855,8 @@ static int rx_macro_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	regcache_sort_defaults(reg_defaults, def_count);
+
 	struct regmap_config *reg_config __free(kfree) = kmemdup(&rx_regmap_config,
 								 sizeof(*reg_config),
 								 GFP_KERNEL);
diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 7a2b0cf9398a..4d7e7e30f460 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -2763,6 +2763,8 @@ static int wsa_macro_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	regcache_sort_defaults(reg_defaults, def_count);
+
 	struct regmap_config *reg_config __free(kfree) = kmemdup(&wsa_regmap_config,
 								 sizeof(*reg_config),
 								 GFP_KERNEL);
-- 
2.53.0

