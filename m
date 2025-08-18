Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D0031B10F
	for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 12:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755519775; cv=none; b=R0QWgZ95rkZwNuo3ejCamgPbN3SkRllavpQPSd/Ayw2GkaFWT7ywSSef1bHzCrfD1f7+5Ix6iMA3lHy1q5GFJk8/umYA4Lmjpy7DUx9w5LW80Opbiml+0TweX6kMkJV1OC15ObzSvqPG/hZmuRTCUn/x7L23W3FlhJ+VihBavio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755519775; c=relaxed/simple;
	bh=lJiXI/C5Fuyf6B55gsngV/ulvqr7iM3XDCbQuIE36GQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a91bOPuQPuOdgjdw7dYR5t4o35frnqYUa4gT4Gq1pvwN/erQwUDvoI4vegzaeii6cBMt8QPk+IDuXXnjoNOdebpZKR0lFpQYfE0ewgcqr5C7F0gjsezZVAozpk7SQy5yCfcoiQ61gH/KCanOk2fvuWLb5/HFNZ18RnbOO9CZCzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kx1txnnE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kx1txnnE"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I7VA8L026395
	for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 12:22:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=18KqI4JQ1JW
	PbQpGA5es5HkuNAUrV8JMaK/zZS5RWVA=; b=kx1txnnE8UVg6qDf10/ScpJgfHm
	Sb6o5KrqK8vMq7JweYSeBujnqCgHTHuiGKOgVAxXqUC7YYm4bbP9bAAC8zV9DXQ1
	SnSXb41M8J2KL+6PjYQ1gbBB5ZkrdgOZejn+lJAWc+pum9CnpL75LWyQGPNUJtaZ
	SLmqfJkAREBkX2njPoJUkMp5C//F2awzvdwCsHmEcHr288ValDNbVXXhWyI//dGg
	oL3pjkVZgfOGjQxD82uerSS+2hb0+ey9xsEK+48PdGIMlNcpxIgiu+Fq9Hl/H7Bp
	5giq0soDgneomKdhz9vuYfyMQDq4Z1BU5K3XOXnWZce5YpC0W6eqJf6WnGA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48kyunrvg4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 12:22:52 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70a9f55836dso100018826d6.3
        for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 05:22:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755519772; x=1756124572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=18KqI4JQ1JWPbQpGA5es5HkuNAUrV8JMaK/zZS5RWVA=;
        b=S2Tb1jazDqRIyOZxoyg3ihUOD1xO5SzlA/q8/4ItSa3Xonu+7TiDuY1s0yBRQqLQFu
         33Hojx/h53ctGwZjDKps1UKIqyBGfwhq9FSKBZX1qnGDnjjQBiDTtFXiVlIdOD8ARlhw
         5CUefmT+X2TWeSUOqlj3MgOJIhSyUN/oSwzNtqNB7vElt45vzhRaaT22p/vsGsX6Dv9Y
         KaHHU+ytV1yH/FfTkywFS9xohVDWGM2Kp6hYOW6mrXb9XpQJJZB3YxP8bBUWMa2pzp4G
         nBZRy+Lln9h6/bJL1xe6ANhLaOh9HMkXKTpb9pYWPsez/2sEktivJ7gFHHu5aBJoeCqc
         Iz9A==
X-Forwarded-Encrypted: i=1; AJvYcCV/l5ImORL8AmlolTrPt1wNJG3ekTRl7t6qh9hYSeKw72I60PF5p0uMtscDtHE2f+Uiq3w8aYYFsQ64Rg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQjoSBNN9+ckgq04hRbQXzsFgy6dLT2suYJF/MNL3Ota5T/IZN
	/ZQpIZbinTqS2i9hosX3m2tUisUZkjfCk3kI7obz+7/l+1aol1DX18lglRjoejnXnPJ9ukr0NP0
	gf926ZeP1OCovsFTV2i9qcadCfROiF1ohdSLX9UfKx1ZSroL7ldlloynRdNfZ5UIEdw==
X-Gm-Gg: ASbGncvmq21Pp89T1VZW/b1IZEoXwIRaELZMEEv421DLKu/3X3NfxgUsAXf9DNcPpol
	hW0MJAAWJVG94e0Jf8dJgiCV9sj7ZspBdB7MU26AJMZyC079CTnst7UD27vD7/Z8EsbKBdYB2o3
	PHA2alvPxn2xT0CIQDWYpeMNAxj9HvXcrN0ZGfN9udz//3owLPb45hrTUeQzztRvIZnE7rEUB21
	+wdMT8f9t0tOnREbquZCXU+ERqqJPQjBxKXX4+JEAVU0i1YVriszyKaHWKkGIUQPUf81UmrN474
	lbEZRpMd2N47YtT8EPuAw3tugIDMLVQp0AWjlf2uyo+rC8nJ+13g2Q==
X-Received: by 2002:a05:6214:c43:b0:709:e51b:2971 with SMTP id 6a1803df08f44-70ba7bfbca1mr127743506d6.26.1755519771588;
        Mon, 18 Aug 2025 05:22:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsRLUYmlEY9isyXBY9OO7FatP/twXOv1kdIQnNy6AnCeJmhofS9wF093UUPE6Fpivow8O03Q==
X-Received: by 2002:a05:6214:c43:b0:709:e51b:2971 with SMTP id 6a1803df08f44-70ba7bfbca1mr127743076d6.26.1755519771142;
        Mon, 18 Aug 2025 05:22:51 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb653f657fsm12601563f8f.29.2025.08.18.05.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 05:22:50 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 2/6] ASoC: qcom: audioreach: add documentation for i2s interface type
Date: Mon, 18 Aug 2025 13:22:36 +0100
Message-ID: <20250818122240.1223535-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250818122240.1223535-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250818122240.1223535-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 230LleWfBug3Mw1rVbnKVMdeo8CHnSYd
X-Authority-Analysis: v=2.4 cv=N6UpF39B c=1 sm=1 tr=0 ts=68a31b1c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=FY2npp4C09wRtmNKfY8A:9
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDA3MSBTYWx0ZWRfX/WUJMtbaavun
 9CzGqCnVA0l9CFRKyHdPU/5teIo5SYVFjss5OcqmDC3Q8Le90wlNNsblmoKs6nFHJ9Me74oweow
 A953ro5uJYBu3slVn6yLg6vfhUUMKHsQvZrjREbWl4R6fxEgbqM5wm+NFvpUkLw2xEwUYMf+Lre
 J3jmFzNGeX5jGorTdsgo2Yxsh1Etpj4gVETNU/WhvEkcLXIp40i5cmJFO7eBqprVbkjX0XTn0bv
 gNjqZmLRfuXhj6Wtb7mIDsmfTLh8Whteu+WI+v4SDrtGtJwhOAfV+FcNXozXI+0oikWT1mFh9t7
 xxt+p9BLMBeif+yXhlUfssIW1C5R9qAFgyQaD4BSTyoaofoHiOPLdjnIcQjnxUNq2V+N95EobQL
 o3t3AfsB
X-Proofpoint-ORIG-GUID: 230LleWfBug3Mw1rVbnKVMdeo8CHnSYd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508180071

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Add documentation of possible values for I2S interface types,
currently this is only documented for DMA module.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 include/uapi/sound/snd_ar_tokens.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/uapi/sound/snd_ar_tokens.h b/include/uapi/sound/snd_ar_tokens.h
index bc0b1bede00c..3aa5f4928a2b 100644
--- a/include/uapi/sound/snd_ar_tokens.h
+++ b/include/uapi/sound/snd_ar_tokens.h
@@ -118,6 +118,12 @@ enum ar_event_types {
  *						LPAIF_WSA = 2,
  *						LPAIF_VA = 3,
  *						LPAIF_AXI = 4
+ * Possible values for MI2S
+ *						I2S_INTF_TYPE_PRIMARY = 0,
+ *						I2S_INTF_TYPE_SECOINDARY = 1,
+ *						I2S_INTF_TYPE_TERTINARY = 2,
+ *						I2S_INTF_TYPE_QUATERNARY = 3,
+ *						I2S_INTF_TYPE_QUINARY = 4,
  *
  * %AR_TKN_U32_MODULE_FMT_INTERLEAVE:		PCM Interleaving
  *						PCM_INTERLEAVED = 1,
-- 
2.50.0

