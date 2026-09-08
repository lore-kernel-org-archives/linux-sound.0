Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFFFB42A7B0
	for <linux-sound@vger.kernel.org>; Tue,  8 Sep 2026 08:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788856122; cv=none; b=U7iE3/s8wTI6ykzG8WIbbqElBc7U49sOTZz7U6kBa0RSCacy/TA8oWlFwBD9C+SoLXNH7Cn4htNlLSGjXXVL4aUSHCPf1YI+/Myb9ghiMVX+mjZUaxq8lrawyDt25LprjcZb7KgJOtMchSa5vS1gbExzrZwRaTCWtN1k9PHFgsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788856122; c=relaxed/simple;
	bh=UV6jW6PMil7wWOmF4aoKmw9vf001ePaKteC/8MM4q9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RhcL4NtLUrMo/YBbhkG6vvx9+ME3hQkzSwO5AREtMAIfNHImuF1vfmHngU55ZOP0k5+3oK6LFLpyNQTGTA71hCkuGxRrBaU1MpUGW6nrdG/cBUaaUYcX2CvKsCw7i56pWMCo4U1NR7P0GsRTaDGwfzNe6XLT9hNgATBmakT2WoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KYhXzThO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FayrEodo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KYhXzThO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FayrEodo"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886LsBI1646358
	for <linux-sound@vger.kernel.org>; Tue, 8 Sep 2026 08:28:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7hxdjuB2VuJ
	ASIx/RNJeFcGgL7NijdNk1gCzSGxAfo4=; b=KYhXzThOSxck3UYlN9f+e1kCMbQ
	VFMseCENxvIDaByXZfg7lE1h13bkZhQ26t3hK1avdwB4oZLSkjpYDZ3GVU8mcLjY
	+VtXXAltAHICROviLOFGYpODaVSNKcDVSjIz5AlfBi4h8Vo09Bgd6gL+qs6C+Dmi
	Nmm+Meh4XAN0GNnV/OgmFoMuRFuq00oaliyPuAMvZdUrnYTj02wcNOZRK3lCzzf6
	AL/6cKGOTqk29BlX3Ej2AfBZWkjS7XBp8tXUNtNHF6XsroLSPqfPZuxvGvSV/GHV
	s+TOBpWyAKvPNUno/IeNdnkpwa9fXbcU/VYLlzCXffA3iLJsLEm5EVWvhqQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjcvugj82-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 08 Sep 2026 08:28:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e5fc4c7e9so413980485a.3
        for <linux-sound@vger.kernel.org>; Tue, 08 Sep 2026 01:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788856118; x=1789460918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7hxdjuB2VuJASIx/RNJeFcGgL7NijdNk1gCzSGxAfo4=;
        b=FayrEodog4WdHY0S6ykvBRylwYHa5YKf54H2vGyX8P1kue7OyHfwSKQCJWbNa39EGE
         fOK0DjGlpQZeiE3edqANjf6xL4NCw+sWvuiHyxzSAmRpXHMs1DWxJL+ov4VP78/QPJSJ
         R+LbS6hIJbKVMPso0R/rDXwCMmpTpza+YD0oulA6tdUIaHjstzBkO2M7GCpZVWzPorZt
         d/oU1IC0o669SnrPOySmB5YoRjwOfE7QnH1olCjASxybWzgcxgn3PG2tFNnXIWteBkbC
         NRlrZ6Ek3GoUNzZeL+NOJblle3y3CH8xWoW1WycscZQWf/8bJtKQpKExy67Uorto7gmC
         Uc8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788856118; x=1789460918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7hxdjuB2VuJASIx/RNJeFcGgL7NijdNk1gCzSGxAfo4=;
        b=W+eK06BKkLcCy2rMULnCShPW1tnm349SPIR0bpQio8ZK28XhS0NLZc/d5Yj/IhurRe
         jfjWNA6ILlkL/FG+wa096P53clONpK2vAsZOZ7XCQMjtTMZppTEEZDO7A1KEVfeqV2eL
         NPfpIHd3a0AYnS+BEwRD18NTjblol8IUS6JKYH3GDOk1SiXS/c6EciAQDt8JwKM2q33S
         6bVSryqTIqz4A6c0W8ZXOYD/dpt5FyGz+kjfTCQ2K5Lk27iIchvD57jUxO35lJ9t059O
         JjGE78WFwi6gxiVJ193nyuwC4nSyn2AL636pgQIt4u2w74ybENkcUeq6YNn1MfN8LTdr
         W4CA==
X-Forwarded-Encrypted: i=1; AKwUvByZloiadJ9eOT5GuvnbmoKU3lkXJRDOAc+LSjs/45j63VWIO7hL0JMFBPXnza12AG756JZL9CWDH02Jqw==@vger.kernel.org
X-Gm-Message-State: AFuF++ktiVFtxFKR0VmYeRgXvQthjvL+ublsze9Jx/6zGcY8vky2HZpT
	t5F9KiaKSjTY+A6Fp8clua4ubvrr06sgDv4QdrAWKAtAF3sp14EgGDp0xF5fZyGfl6KLmqW7Lhf
	0UPURpAj5oyQhsyUGZZrvlrVfvkr9JafW7lFen20W59GfaLhPQPe46FAl/6FDgE+bLg==
X-Gm-Gg: AYBFou2X+X1m+xaY7kXuFG66rr38XlBhbrQHRGF0Ze61BXnwGluWmFgvpT7qs/kzlmb
	5YeOwck0a1a4qScbf+UYkfIqg4j6giWK/xvRQ9RapCHI7L/bqII2kmVHh/OYmDlZYW5SZdGR9eS
	JO348jzD9OoxQfutHIy3d/MkcLtQQWNC3vJso7msRvGy4b7vrsipqkEhaJvtZtsMQdBCDB4EJlq
	enBd+2kOqUOPqKxi6lrquceztb0Zajh1+SuKdc5xN3/a3WOpwItmUdNrfo1n48kpGQMDoDcc4Jk
	dBy7SiLBXDrkNRhhmVMsjLhk1ocAzCjDNyTM5t38DV6NwgG+4wTGeGUuVNVJK5t25lsX++4a+em
	ynhyzNAWEywIRPQ==
X-Received: by 2002:a05:620a:4887:b0:939:6de9:208c with SMTP id af79cd13be357-93980586029mr2943828785a.49.1788856118449;
        Tue, 08 Sep 2026 01:28:38 -0700 (PDT)
X-Received: by 2002:a05:620a:4887:b0:939:6de9:208c with SMTP id af79cd13be357-93980586029mr2943825285a.49.1788856117945;
        Tue, 08 Sep 2026 01:28:37 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7736132sm369414605e9.12.2026.09.08.01.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 01:28:37 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: srini@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 6/6] ASoC: codecs: lpass-va-macro: switch cache to REGCACHE_MAPLE
Date: Tue,  8 Sep 2026 09:28:06 +0100
Message-ID: <20260908082806.648797-7-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=ePkjSnp1 c=1 sm=1 tr=0 ts=6a9fc737 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=_mTl3-Sb4fPHxIs9D7QA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: WQRlioD6RgSpU0CfY1xWDoD-2IHnw8Pi
X-Proofpoint-ORIG-GUID: WQRlioD6RgSpU0CfY1xWDoD-2IHnw8Pi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA4OCBTYWx0ZWRfXzqXCxsUNJkRy
 gkWQ9QGQqeqWtBl4NFCiRVrYNhoU8ndgUTuPN/zatpx+o34HJiJCMTGGSazqL4jIvnuEekm6eh8
 MFOK71pr59UKPDtgsY2eijTD6vkpw6+1msJSsMTxqS0mNKULlF9W62XiJ0qyNuaPEu0HXqUJGUh
 1gNuFEMyPcsYVyTuj+XV/iv0hphuOCCbZP+MWp9Sj7QoddTOqKl42GY5M4xSO2MsIuSXfj83kL5
 z6NGhPOJXmv8cq4TxmbhXY1YDsTDeHWEQ8Y0oEF50PVGj9O0XvlcUnJ4kAO1E1csG1zIs+Mbdxb
 svk56K4OFkfTFTdRTWI4Q/h9dTARv72xtT9X86I7umuwCj4hzjvvgsEUjnKysKh4EKx59kYKqGr
 YMp1cU9G3FIGQZiG2N0yNcWmlhI7Lav3732TppTy8kT358Cxa6LsbAzFXO5sfqf4oINh+QZ1S+c
 71MIiN8ZZsIteZhkxLg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA4OCBTYWx0ZWRfXxtuK4j4OAbjz
 y0M4Zhch9/y3l8yDrx4VKGHGzPCmVyjCEjWRVqvg3Q7dbjIO/Eebcwn69x4151uL/daF4KXtj1D
 fKecIjrrpjSEoxJrWphaHoY57eqxqH4=
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
 sound/soc/codecs/lpass-va-macro.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index dbc5795b9273..f0797715ab54 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -454,7 +454,7 @@ static const struct regmap_config va_regmap_config = {
 	.reg_bits = 32,
 	.val_bits = 32,
 	.reg_stride = 4,
-	.cache_type = REGCACHE_FLAT,
+	.cache_type = REGCACHE_MAPLE,
 	.reg_defaults = va_defaults,
 	.num_reg_defaults = ARRAY_SIZE(va_defaults),
 	.max_register = VA_MAX_OFFSET,
-- 
2.53.0

