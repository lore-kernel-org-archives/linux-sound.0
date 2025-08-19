Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6324274666
	for <linux-sound@vger.kernel.org>; Tue, 19 Aug 2025 09:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755595619; cv=none; b=E2daecUc99bdF0JJwW8GsW44w3qXgxdM+UR1xDToA+DhVX552Np93SPHzOwRGAjfaml6S7VxDDQTymI4Rgs5LyfHTcJd4yF60v9G3tfCa9Z6ohMWDqVUorWUXfUkle1p/uQzi/Y/CGhrX+clSEy15XRKYgo0rlzc2wYmzwAAecc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755595619; c=relaxed/simple;
	bh=6GscCOCmisZTiVBfFfxxVc0dHspdhAW8+DH/P55nLlU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PBlRddoYM1Tm7QYZcalqQTHviAH6LCvqRrXLTz6U0OjKmu3idN/wZ5addQrt4JSx4tXzQqcp7Ivr5E0mGK6d+21YvlYtWyr2JBbEws7zuqoYUX/lTa4C0+OZ31bkgef0xHWGEw9ptyeJvQTkuCPZAKDMiKdYDK0Q3D127C+yoVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g80EQsmB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g80EQsmB"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J90Z2E029794
	for <linux-sound@vger.kernel.org>; Tue, 19 Aug 2025 09:26:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=+YPBn86OFJA4z22/KeAbz4i2F1zro6Zj3rE
	nwMnF2qM=; b=g80EQsmB2URX2cRDs04qdDDphpiAhDj4V+eQLJWvJyGP8NO/T16
	aPSaymDcAvJF/2RjcYu6hCkH5FZ43L3yJAUGUMsB6tkOGOrqOvHpFvBzQ+gC7pGR
	9fe7hj4aB4yZ+LW82WGFB1snxw6NsiNgqJw1mAVIaxwv1xGijjHv+Xh0zpzcl69R
	U7boAIhmIfNy4ETFQ1v0PV6cXCmSIg8QNEY1fVZoWV70IBcPzIbcYFFrFWsX4ZAK
	pv5MqiQRwBUWoVz8MB9mFz8az1ZaQfEFQ9FDgz/qzF4fGTR+CXDF5pahqgZuGgFW
	jAOTTbWy33kjZ7HGQPs3wilIQvihKOh1E4g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jk5mfvrr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 19 Aug 2025 09:26:57 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70a927f4090so116857316d6.1
        for <linux-sound@vger.kernel.org>; Tue, 19 Aug 2025 02:26:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755595616; x=1756200416;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+YPBn86OFJA4z22/KeAbz4i2F1zro6Zj3rEnwMnF2qM=;
        b=gF3/I2WYs2aB+bynK+JMJL+XHNOW2D9eDzC2WU5vQV19JLTjIozLy6dc9mw/RwFvh/
         TupHp7KCgTAwr3kk6FLM/Y59M97lzx4qKqEVEZH3nK6DHcDg7wV0xYnQDmWPe1wQPzJH
         J0orVvG4tUFTfRemY71Xa/u5DTnXIOAeznThacXX2wetmwa+Ua8prCV2U8yAYqWl9UUJ
         oRHaSRyi7SsJ+3TwxSu8bC/hKpC8hAIPXGD7RP3j/mYQPkFweCIJz4a1tvlxOwHuX6pA
         BVsl97REQb+3EFjMovoUyXKa2NCrtZ/dzs2Uw80pjiNpGIb9SIWN6IXtv/2ARts2S3Dj
         P8ZA==
X-Forwarded-Encrypted: i=1; AJvYcCWv5qK2IqhYQumVCa3UYjM8wT4S2iYIOl8MPB/EE5EQfY5AV6IjD3WV+2QN7L+u7lk7SXFWIvvh7pydQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtRe4PYZyDFpSFOWhboDyOohwGoqi294MABhVW3MHsuzvUkAcO
	BHf6zOf4zXNUkzZ/BUfrsyW1E0qLT+m8d+WPOvv1mfjTgxRzsNlwTr9NQYv++iL1cDQYmmvZAur
	kgkhufWZEUFm8tAsu4O/OVL1a4gPdDA9knjCi3l9NYTU07jTz+Wkbmi7N4rVOZA5pbQ==
X-Gm-Gg: ASbGncuv5xz9zGLmD/x1W8bPq4p9Kothzqdu4dNFebQWjjfOeSEgpDBapUPlqgAx41U
	3Cyfv0ep6Liww3NoTHgZxWqtFK8rL0oUbBMWFwMCrsrMt12JKQRtL6EgbR3olUmZSnZsOXWS9VW
	Y/wRoaxxxmKTR4kFRlm/v04rpEqhoUekVc3rOW7Tw/U7Xw67i93zNZDFf8wXXIJ7UV8LTlwnZLC
	sbf2wCVsA/o55kHdyJYFw7vr2Y6S0Lyk/Rujl8Ju20QBREdlAfQbWscql5j8k2mJAkqqp8PkRDR
	LyUtwMVeimXDRiEQXw2B0tu5pIJQIuzomm8HewfN9buNBSZnwXmp5Q==
X-Received: by 2002:a05:6214:cc5:b0:709:22e8:af63 with SMTP id 6a1803df08f44-70c35d3b192mr16724906d6.43.1755595615731;
        Tue, 19 Aug 2025 02:26:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0MfiMsbVwzC+4oeXG9E0aKt6J0XkgKUpLg/D1cp1Zaqk5taa60r7RFcbnnFW1iR4JFSX58g==
X-Received: by 2002:a05:6214:cc5:b0:709:22e8:af63 with SMTP id 6a1803df08f44-70c35d3b192mr16724756d6.43.1755595615291;
        Tue, 19 Aug 2025 02:26:55 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c077788df7sm2942284f8f.48.2025.08.19.02.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 02:26:54 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 0/6] ASoC: qcom: audioreach: cleanup and calibration
Date: Tue, 19 Aug 2025 10:26:46 +0100
Message-ID: <20250819092652.1291164-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Sdn3duRu c=1 sm=1 tr=0 ts=68a44361 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=NU7b6h4jXCN-HWJItUMA:9
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: 6M335pwu0VohnOsM7IwvFwW5CUZ5v5QB
X-Proofpoint-GUID: 6M335pwu0VohnOsM7IwvFwW5CUZ5v5QB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDA0MiBTYWx0ZWRfX/f8R2xtNJnJz
 ecDyAGiipHvZQTe+TPNhtBME581RNfGAObWi87y2s+Ce6VCKcElIeJZbUCfBu1IWYvbaE9iGvfK
 LGNr6v2Pagtcc8YoC2CCcFiFrpq362QQSi9SP/hQAQuKOIdulv5U/7o5xaVApL+WsQ3uofZuiBZ
 cb8X/E+e/Oedn+k0Dc7Jp/RH11WFEPwZPrdtQv2APX1fxwWaLkdZtxQF845plffNZ6iTsQ1uWnz
 6k9dFTM537pElWzY5A1e1yG5XU3bL0Q6s6pZfSQ2FrpH1P3z2u3f1KM2JD1HeIdZX7IsLKr1xrI
 l3Sh4jSGVXOROEeNn40UNkm0PUdtlBu80sr+AQfT7V8hnbjbWwscnjN2FgClyHuQF5BkksgR78u
 BWE7Yjse
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 adultscore=0 malwarescore=0 bulkscore=0 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160042

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

This patchset:
 - cleans up some of the audioreach tokens which are unused
 - adds missing documentation 
 - add support for static calibration support which is required for ECNS
   an speaker protection support.

Tested this with Single Mic ECNS on SM8450 platform.

thanks,
Srini

Changes since v3:
	- added missing linux/types.h in uapi header

Changes since v2:
	- fixed some fixup rebase mess.

Changes since v1:
	- fixed typos in I2S_INTF_TYPE
	- sorted module defines based on ids.

Srinivas Kandagatla (6):
  ASoC: qcom: audioreach: deprecate AR_TKN_U32_MODULE_[IN/OUT]_PORTS
  ASoC: qcom: audioreach: add documentation for i2s interface type
  ASoC: qcom: audioreach: add support for static calibration
  ASoC: qcom: audioreach: fix typos in I2S_INTF_TYPE
  ASoC: qcom: audioreach: sort modules based on hex ids
  ASoC: qcom: audioreach: add support for SMECNS module

 include/uapi/sound/snd_ar_tokens.h | 20 +++++++++++++--
 sound/soc/qcom/qdsp6/audioreach.c  | 27 ++++++++++++++++++++
 sound/soc/qcom/qdsp6/audioreach.h  | 18 ++++++-------
 sound/soc/qcom/qdsp6/topology.c    | 41 +++++++++++++++++++++++-------
 4 files changed, 86 insertions(+), 20 deletions(-)

-- 
2.50.0

