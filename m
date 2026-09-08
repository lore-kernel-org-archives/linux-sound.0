Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02592428470
	for <linux-sound@vger.kernel.org>; Tue,  8 Sep 2026 08:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788856120; cv=none; b=Gu7kbdd3AKrBXIPuDvtBdYTE4AhlH3qIiNPWvbkD9ChFTfiR2fdD51ArRClIAoKflpS27zOb6W+SFcntvzVzDUV/750KIWEdcnP4jEPYSahSb/4ftSyZQoij6OzhJ6UAu/Jc+hZUZOxMYQGYqURmGs9TXrop32scvzzNeUQFkWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788856120; c=relaxed/simple;
	bh=5yK5VjioLO4s2+u2Ao+PUYV1VoXMngX3XYw8sOkTCrY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iNxC+s2ucCF0vjhjph6ihQe1UukazFX3Op3u1mTbL4NC8XmvhvCXD16OU5jJ5cwq/Eln7g6yJxudhNaddaLb5RnI2dky3dz5Z2p7ADWCJAJy/SS2KB1aT2lUpTxmt13KMTXo5q/wESzigwidw52gYEzzO4oiUCVoBbMPhFL5Wzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i2POOVhh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G39Xp6X1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i2POOVhh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G39Xp6X1"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886Lrm32154206
	for <linux-sound@vger.kernel.org>; Tue, 8 Sep 2026 08:28:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sXjpkE7BmFu
	zBqyfX3D2KUtSjVLl7POjhlaiCf0eRHc=; b=i2POOVhh8JifsAe5NPp6xZkg4Al
	VQY/oYKGSyKOfGw/u8RdVvGbOYDMfg/ECodVTvhUQWkwNTfYxaTvHfFVP/d9WjdS
	TU4lyQcOo3F9+GotqtkLhg+4rf7OeTrVJsNNHQnZ8oXj7rQ3VF3gMtT2So0XOF0Y
	kVM8qQbRo4SbMVe2do0sQCnzNs2BvUrPdfsdCPEkZSQLgtrGW/s+42LiDIzVNdp7
	eFmRlr9tkiV+40GYYxej7ueEiirWMGUYLnfzCfPimphtah93WFNwCHD79s/5qh2R
	A4qYFjZvGg7Vgi6ENYL7w5cTyfd7y2b67zvK12UX59Xes8N19OCK1cgzEeg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gj1rwjfr1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 08 Sep 2026 08:28:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93903622880so866833585a.0
        for <linux-sound@vger.kernel.org>; Tue, 08 Sep 2026 01:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788856115; x=1789460915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sXjpkE7BmFuzBqyfX3D2KUtSjVLl7POjhlaiCf0eRHc=;
        b=G39Xp6X12uRpMG9uavIh0izM1mmQMjDRbQP5jvuoVHkR4XddS7iB0d+o7pQqE9OjOU
         uyp0IpiSCKBZFvbWvVPPqP4FchCR9OlW43sz20JdPq+StO/tUyTTAM+dYkC8XvqPBHqo
         KIrgMKilLUTfj+DhBWomvwjn9ioBmp75HtsvIWuLHe7bzfxp/FPagByEMHdzVuEf4DR7
         k+hAc6pXgAhWZqeco6fcbqHLdOp5nkyj7GnxN3f1tC3zPn8Fn6zmRuSnwG+XOjn83mnz
         nh/9bFtA0lzE4z7XXq+cxltYkumyCf0jQzAb+mmSMyexv1rluXgLJFbR4PrSQzzLwn+y
         8u1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788856115; x=1789460915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sXjpkE7BmFuzBqyfX3D2KUtSjVLl7POjhlaiCf0eRHc=;
        b=V5khPQ16Zf7Ualkl870MVeC8qBNlEArMyql1g98nN863y/huat0lYnG9vUP/guQmvb
         eSVt7xGRJLzwfwJfLN0r+/YXuH8oPrz+igI1g8zCLxd1Id3O6CCeA0IIibVKfDgPhcZv
         jlYY+CjUHWE2ByrEh8z3/AF5N+pO/mU4wDh4z+A1hMI2+igeTvbZqS1qMSK0cA4O+dky
         VEadJ579n+R15AjyKvAAFhESJj2pxtnmmC81mC+wr9QYt1UncsXpaADS1TfhGneZGQ0T
         cc4lrlCAaCINbBhcC7Irsjx2u4Xll+HqPymh8PqtsRuhaXyQUjOq1WFIZgVRBzR09bAw
         rjXg==
X-Forwarded-Encrypted: i=1; AKwUvBxYSmXDSZBewrZuIARyFFnCjuFiBzI7W5Z0l7Qf9g4UkTgB2faqgsqDCK5KxKs82A0kWptTkzQjLrqI9Q==@vger.kernel.org
X-Gm-Message-State: AFuF++lCbJHhfYHj5/m6J9raDbOw5FQDz8xtrEMOaSOi+WxIFVj8jEMu
	Tmz+y+mZiQWGs8MTJtMnf1KleMwPijTSmsQbrkCW18WsY4LZgGECNKtHZ6TQEJMUufi3O1bc52i
	H964Ews0lWNIPVZlp1gx4PbDKrfGvBBD9EqH7r92vuqK9hXQOwjYcCU+idqjWYSNfOQ==
X-Gm-Gg: AYBFou2EdQH/mrQNSXouiz/K7Hrj9pHuO8O2LNLSrG2KWNl7vtF9By8Bgl7faf9ucWb
	rYKfcg/Qw+9qtvXI1WHbIsXy+CcSpIMlR0F1XDZ9n1QMImOW3EX57tm5x/zc9eAX4INPdOHPVSA
	E4mBeTwse4qyD9NFU6QLmhvRWA4leorwErD7CazLdqWhwA/KBfE7Q1mhwojRjwbQYUbemDvvp2c
	vdtbe4QTjmLj92bDQV+2tTcB+suEpy9U+KlMU8EFRFJyVwrjtVMwWLoPXyOJRO+/zkKnaMQR3Vh
	svB7vpro8NnDLeyS7mvBc9V5zf9wg/sl3NMnMtSWAV30DU336RKWxVgB5gSc3kwAzcG7dWs9eL6
	/Gfy1U6I4exOGsQ==
X-Received: by 2002:a05:620a:4857:b0:939:5d22:d1f0 with SMTP id af79cd13be357-9396dead4a3mr2191185785a.2.1788856115160;
        Tue, 08 Sep 2026 01:28:35 -0700 (PDT)
X-Received: by 2002:a05:620a:4857:b0:939:5d22:d1f0 with SMTP id af79cd13be357-9396dead4a3mr2191182185a.2.1788856114348;
        Tue, 08 Sep 2026 01:28:34 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7736132sm369414605e9.12.2026.09.08.01.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 01:28:33 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: srini@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 3/6] ASoC: codecs: lpass-wsa-macro: switch cache to REGCACHE_MAPLE
Date: Tue,  8 Sep 2026 09:28:03 +0100
Message-ID: <20260908082806.648797-4-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Ga8nWwXL c=1 sm=1 tr=0 ts=6a9fc733 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=_mTl3-Sb4fPHxIs9D7QA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA4OCBTYWx0ZWRfX+aJoMYK+657s
 r0Bgo/0v2FOvWudaFx1MED43/ZT2BGdjURI+oRdnppRDe612t0H4GApKdcovHibTvxvu74IvXqn
 76C8VR74ZV739IGeL5xmE5lKCTyJC55t5wNLehAB9xGVdr1AT5H7skVyMQs+fSATzcmI7f6fCP0
 vdhL91Zgbi2hHj4bxg+btNRoP/+lYPDN8JC2dFjjVDyi9wqM5xOMs2+6ruztKm1YLuBjrQdfsRo
 UQUbxJmoIwqsN8IuGuULUKN5iwGQUPg1Adn6JDzFJoESe4saijfj+JZIP5gLz41ePk0C6Eehrbs
 R2N2Ylsq9K1X9i31efmDDrag4DNiQP/O8Q05Jog0R7H68XSVARXXzi9PxIP5gihyp0u8QjuKa9C
 D9mmqrt+owDyvTLFyaFj4yiMnQbMNk06qztos1n0KrB+vUdCtRLRliKb2+goDnQJpaSJhLg/Vrh
 aoZvv6YE/6CfbBUYDtQ==
X-Proofpoint-ORIG-GUID: m4DG9TqrbRsRppNzzsjd0SB6e8cUFETy
X-Proofpoint-GUID: m4DG9TqrbRsRppNzzsjd0SB6e8cUFETy
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA4OCBTYWx0ZWRfX4sOBJHW2cQeK
 ztul0jtyja+SVwMitJ2uilBca74vSJYkc4y4BG2/kuc0KS+hk5KXZezRiYYOW+HuvZ6IHI6wG0O
 ddr/IPKThBMGEjwJmZFgSrsSxUfN+1w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
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
 sound/soc/codecs/lpass-wsa-macro.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 4d7e7e30f460..d254518634cf 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -1109,7 +1109,7 @@ static const struct regmap_config wsa_regmap_config = {
 	.reg_bits = 16,
 	.val_bits = 32, /* 8 but with 32 bit read/write */
 	.reg_stride = 4,
-	.cache_type = REGCACHE_FLAT,
+	.cache_type = REGCACHE_MAPLE,
 	/* .reg_defaults and .num_reg_defaults set in probe() */
 	.max_register = WSA_MAX_OFFSET,
 	.writeable_reg = wsa_is_writeable_register,
-- 
2.53.0

