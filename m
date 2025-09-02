Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D0630BF69
	for <linux-sound@vger.kernel.org>; Tue,  2 Sep 2025 14:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756821677; cv=none; b=C76Cgk160Y5yjnLm3XH0n3xGTgPXoxwdDR8Ac+cjBBGp35IPE7+RP+iK1VWC5kY9qNKAfqUCiZC5OHQpKbbsklIwL67g7tY5BcW19wAsAwy8ZViDXZ6/PzpDMxtW3x07K/JFarlnr08hb3kNGBiZZzawmWyFJJnacxH6/SjmSi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756821677; c=relaxed/simple;
	bh=ZCmYtXeOLiKF/8J7Ii2M8E18kXf+ruqiaITuaaqiq3k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jwA9dJKA7xfGZCscM7Uy+Q8LgfwzBfZm1BgHCK9PbrRMSQX3lLb6co10SGAxdyyXmjdt7po4a36Nif0vmtd5j72B6WWn+BQoLlCBYbOPTf7HmlBqSuuvrGiAjEEtQK5iX2jh+jW3KkYqbUF8/S76SAIasx9IQhfOB38LAA8yWN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BynYITuI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BynYITuI"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582BZLS0016374
	for <linux-sound@vger.kernel.org>; Tue, 2 Sep 2025 14:01:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nmnJ45KeZoK
	mJHcfZsLs3+FV2VWNH0u9h4uDyk73m/k=; b=BynYITuIn6Os+8yQvZhtg4mBQ/a
	A4omgyulKqSCPbtJe2nWNr1z3Mm6yq/gpH38zH3qdxRFp8zY8aNOeQ3Uzinb+pZR
	ggccV3RLlJqmqC3YGhyAOo8Z0VLjE3CslNzCxWMOxHhPDtZfKrHZen6qZjj2bqjn
	ditn50QZJ+HdYsIbUprUIaTqvWwq8lKDz73iCKWXnsUIYFY5vDsV79hg8Iw4/87Z
	xHPMmTcvXV1SC8QkBnOaXAAjN/FT3x2JntCM+8nDt4x6FvH9H5k3hX0qHnlqqadD
	btS2kQgOtTIyooiia4GeE290vr81maV9ZgqoeaXKRd2Wuh49uhykaZabkwA==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48utk8yum1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 02 Sep 2025 14:01:14 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7454aed7eb9so1946818a34.0
        for <linux-sound@vger.kernel.org>; Tue, 02 Sep 2025 07:01:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756821672; x=1757426472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nmnJ45KeZoKmJHcfZsLs3+FV2VWNH0u9h4uDyk73m/k=;
        b=UtGfuFOTqWh0mq4LFHRAOWUPwddNjaf6TnoH3Fk9aho95ktK6LXUBm9Zg8GsPr5dlQ
         kWzheWlM4wpLJupiJa9i23BfT35QGoTDGJGpihY/cC+v362QgeW/GWQpcSdwFBiTILbH
         3twiUx9nSf/qC0GrNS09q71vsf3eYQzUrrEWGcTkqxgvriWWEqyTQOIcIL7gsmKKM3ir
         kcldav47C37xWEwERIxTWk0ER89G23flU6S0YmEBSVNR8IU7cUHhCU6LIYPvNlmAhWUg
         AEkswwBny4sAkS2AG+uwqO1+2aI6SSU47mvcATxPrUY1lYogaGcj54XfliXLhAgIoe0J
         s7uA==
X-Forwarded-Encrypted: i=1; AJvYcCUBrvbOJXx/GljOKc7AQo+tedE2JBubaIXHxSZmZnxa0DrPfPVSEwq3nY15AAUpPSQupCWLU4A+++l1jQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YznCh/WahSg5Cp9YoKepDejttQ5wuZhtKxU9gZBJcYPoAE2kSiT
	UX9o1dtq+uxVDf19d77FZEKU/U5+YPLRqW9tJ1YVWiuiRXR4XTdyqXcIu072ZPi/VgTd+0D9u06
	Ia7XuzD8XMA5XE9g6cCyueyJbvFG3xcX9wOshbyXyAf44OxuuKV2QWu0BOcRnXKb4gA==
X-Gm-Gg: ASbGncugqCAsyocee3RY+WqpumtetQsllGnJTEyrR/l02Tnlg2nODR2nRK+JJ8N01Xu
	RCM/lU9hvL6cLyrBUrc/HXNT0OiD1ZOr9FlcvvRH/zuazg14VDfBUo9DKVlJ4U7doskqaDbN4Lb
	gQGp2uQ83aXKJVySyjNwy+m/b+KfEnnx36HLYMPlhz9hP05rY9mUIH+qjH7N5UV2hO1FXOxSdUn
	ABE2vrGzVHf269mpqMN+dCMsbIQCqTlII2diWoPjE4K7hkDd7eAx6c4p9MOzFwfPnWY+zRvSxZq
	jQsY3zC1rf1WelB4jxdFQFC+Qx8/P0Q/RAK14X6RFyMXm3S08HuVnw==
X-Received: by 2002:a05:6830:630e:b0:744:f08d:15fc with SMTP id 46e09a7af769-74569ecf0fcmr6903313a34.34.1756821670728;
        Tue, 02 Sep 2025 07:01:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMw9YT5rkoNZ22kEloWpSq9TQIAdQv5X+Iy54NEzqWo60ZTF+TAlJf3AXt2PwZZsGYu12l/g==
X-Received: by 2002:a05:6830:630e:b0:744:f08d:15fc with SMTP id 46e09a7af769-74569ecf0fcmr6902363a34.34.1756821662010;
        Tue, 02 Sep 2025 07:01:02 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d2250115fdsm14381196f8f.40.2025.09.02.07.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 07:01:00 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: srini@kernel.org, broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org
Cc: conor+dt@kernel.org, perex@perex.cz, tiwai@suse.com,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 5/6] ASoC: codecs: lpass-macro: add Codec version 2.9
Date: Tue,  2 Sep 2025 15:00:43 +0100
Message-ID: <20250902140044.54508-6-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250902140044.54508-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250902140044.54508-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: mQ1VukZklO3BmaSTUJ5sqnslDTevEdkG
X-Proofpoint-ORIG-GUID: mQ1VukZklO3BmaSTUJ5sqnslDTevEdkG
X-Authority-Analysis: v=2.4 cv=ccnSrmDM c=1 sm=1 tr=0 ts=68b6f8aa cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=5KERvJ6N5coBvBd-fXAA:9
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDA0MiBTYWx0ZWRfX5XGHbvAJIEbo
 94FcYpa/9kyvHpk/7RNDjecaCZR+yNDtiPXkIFIS8xICtnR3wpqYsb8e/p7npL5X9q1pfETMwdh
 kS0w3qReVrLlKMOnHLaBVscfzCzsy9con7uylyfUbGNZYcO8DbqwyW17f5x+oVY4lwr9rS80odt
 qp0LaO974LSmscAgwuucQjs5zaHrBvaFx2QCSxcwm7tVnaR4asJtsHInONDc8Lm8wKl4WRWeUVg
 FPl23ft1zGOy5jSKMdRb8QKTc27igPs/zUQ7zqHxZvusk/EOpFl6ddSUQM0Goyj6rxNpLb7ImtE
 4ttkMkkKnwWXEUYYo/wOupx0ShOC0/e9Uuogmt93T1/DJnZe+gpEde07wOKN7RvOV0cSbEMw1wo
 ETvvIkS0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300042

Add support for lpass codec macro version 2.9, which is available in
Qualcomm Glymur SoCs.

Its compatible with 2.8 w.r.t register layouts.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-macro-common.h | 1 +
 sound/soc/codecs/lpass-va-macro.c     | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/sound/soc/codecs/lpass-macro-common.h b/sound/soc/codecs/lpass-macro-common.h
index fb4b96cb2b23..10ad682019fa 100644
--- a/sound/soc/codecs/lpass-macro-common.h
+++ b/sound/soc/codecs/lpass-macro-common.h
@@ -29,6 +29,7 @@ enum lpass_codec_version {
 	LPASS_CODEC_VERSION_2_6,
 	LPASS_CODEC_VERSION_2_7,
 	LPASS_CODEC_VERSION_2_8,
+	LPASS_CODEC_VERSION_2_9,
 };
 
 struct lpass_macro {
diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index a49551f3fb29..2e1b77973a3e 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -1485,6 +1485,8 @@ static void va_macro_set_lpass_codec_version(struct va_macro *va)
 		version = LPASS_CODEC_VERSION_2_7;
 	if ((core_id_0 == 0x02) && (core_id_1 == 0x0F) && (core_id_2 == 0x80 || core_id_2 == 0x81))
 		version = LPASS_CODEC_VERSION_2_8;
+	if ((core_id_0 == 0x02) && (core_id_1 == 0x0F) && (core_id_2 == 0x90 || core_id_2 == 0x91))
+		version = LPASS_CODEC_VERSION_2_9;
 
 	if (version == LPASS_CODEC_VERSION_UNKNOWN)
 		dev_warn(va->dev, "Unknown Codec version, ID: %02x / %02x / %02x\n",
-- 
2.50.0

