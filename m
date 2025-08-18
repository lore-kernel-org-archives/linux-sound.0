Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8433331B11E
	for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 12:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755521464; cv=none; b=L+6nr5pS4PDjffLc4tmTiWvJ+rrtdjjA0YeMgoZfXYKvzrAjU21uUQ1tHGf4Hhe2G5XNMAldPGwePpAD7MBOoj/GdAeftKydkfPeIYG6ukFVAS/SVaxSXurpLCaSXQPmWMV/DiQVYFxvWO/gBO1lgasBzQt3EJFkM6Hi/9sHPgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755521464; c=relaxed/simple;
	bh=qwuYqZpPtHuX/2WTSLKobMX+4muge/nS9jt2JifQjdc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dH9gRgYUVVnfqS9TDwl3xUPfAOg1Uzsjo56hf8zvutOnVA//6i28CTXWfMHHyoEvOqpNfEEHtRF1sGoxL2rOj8rZ/Gh6Y0a6IyyPMeZVbMsllbM+LMAMCgwv+fXLiMKzi/J543EbOHBkOqw/WXyY3H3dfBkl3jKkJ48yR+tOxbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R4T0PKC9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R4T0PKC9"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I8Posp015694
	for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 12:51:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JQBp3mqbspP
	8PIJt9/SllqFn7BROE0fyDwOwOB0VX5s=; b=R4T0PKC97PH4iOPI0xf+XVLddqa
	zLoniuKFqhpwXRh6KGGbcqnoJ2U0GwlJa6A2353sNALQlUho8GF3nwtPqCNuN1TF
	8lZg2Fblzjj73177wGECTsX/sgFmUFmS8hapTtaTD9UCUPrGxscD9MNit3jb9xUT
	SzXjCZKRBgC3v8+Yzi5BmU/aQZdgq7333PiI6F9+jsMDEkfeTDWhX1ZffitjR1Fa
	h3crg5JsiKTCx8rKLbdvFBkfkVZSKHtD6LPp8PEisXimYUk2PRbEyzrZq3gCbBI2
	qtBtA7L34gIyWvwhjiffuMhGrHvAZRmQLk5ilBt/Xu5XTxlcWtaM/EqcpiA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jhagvqf6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 12:51:01 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70a928dc378so102517126d6.2
        for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 05:51:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755521460; x=1756126260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JQBp3mqbspP8PIJt9/SllqFn7BROE0fyDwOwOB0VX5s=;
        b=MB184hffyOPUsDlF8MMyD1fq7v/LHHhhydOLF35vIE3oHl9N4HQkpvaK23HEYaP3Em
         /cZgBrLzIcmSUBPUgQHpQd/WIxQHySPgFlTlEjFXUeUQzJ6qzGnOqzlfJzoNNqNo0pWr
         hR53Jvs8xiP007ic66xxv7/A6eK8K4muxXSInobq6gR2m2ewE0EgSfpqXzPPgURZVhvL
         zYUQb/S5TlhTp2TSvsY8nlvn7XkPdFJ8SaQ9LcPTOMRs3Lk6m8AAJYsSKLmcl0jdTDWN
         B5W/QXVAOVYz0rJfoDTFvIBbTUyySabZNLpH2SFeSajIOxY4jqWU/VqsxaUxX+LkgXSW
         kc0A==
X-Forwarded-Encrypted: i=1; AJvYcCXpr+JoUcmOrlvNTLUzFwZe1jrNX4m/l6PmW6Az6ss4DRQAgssVVqErLFsC/uynhIemnUBmXnolnCRU2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4S2OLKHWGkh7kZnwX5mJQAqCq+hr/4NiINoTUv/XHfyG2aP+P
	98DCmZqih6OUK3bAMOCEWWnVJd7OGD07rxmkRa5PghPbum7KJ2TVSxeQRRAmcwlk81r3hApN2Hg
	qNJminEM3k8wn31RQ4yWvwNC5FgKpVaOiAskFRALScDbBfQom1ZKKy/ugiXU0iHVtZg==
X-Gm-Gg: ASbGncuvPsyJp1TCBRd5/aMgA2G6JxHbq4JJH0IMh/MKTCDJPbdk+qcACqVtMQq/pMV
	50p5UvPnQWLwXcUH6PzKUSkoPQnqNKyMoXSIAhz1Cd9AkaT4+m6z39UdSNM0nVaYBu1Dbu24Cp9
	Ci8X1R4P8cmjYTXguBiQA8l3rRGX0FScZ22SBTiQ79/gi9VJSmOXxBSDKsOGWe+0EEUivD4iK89
	5jdU26/+bOgomqcruDyNCDHpVq1jRIXiH3/NgwKp3GW7whFymrljA+s9xaEeDoayDTY437g2/hj
	tV5eRnOnCbTMU4HCnKKR9/V3now1a27+YttG/XjHeXSnuCnQnXhGTg==
X-Received: by 2002:a05:6214:21e2:b0:707:5f39:7808 with SMTP id 6a1803df08f44-70ba7c72965mr160275856d6.36.1755521460501;
        Mon, 18 Aug 2025 05:51:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmINqOZa9cT2dkO8FkYzE5SIW/vFiqJlspoaNnd9of4SYsEEeDeM5pV9K6+JyP6AydBc8euA==
X-Received: by 2002:a05:6214:21e2:b0:707:5f39:7808 with SMTP id 6a1803df08f44-70ba7c72965mr160274886d6.36.1755521459128;
        Mon, 18 Aug 2025 05:50:59 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb676c9b27sm12537347f8f.44.2025.08.18.05.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 05:50:58 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 2/6] ASoC: qcom: audioreach: add documentation for i2s interface type
Date: Mon, 18 Aug 2025 13:50:51 +0100
Message-ID: <20250818125055.1226708-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250818125055.1226708-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250818125055.1226708-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=D9xHKuRj c=1 sm=1 tr=0 ts=68a321b5 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=FY2npp4C09wRtmNKfY8A:9
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 4ye0wSdUqw_8RzSfYTIFrkG93192Iqbm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyNCBTYWx0ZWRfX95ItXmaa4uka
 yYxns/jXiW8Xtqv/iMCDIIXCbQIxwcDslzgQesanDQ0NKB8IMDbQqk+hGcSclKJrWRMAKCUVdEs
 ALxtMsGnGo0WGZZKISSSNF31IV/rmtqaVEegFdX2DzduH1sE4yf3fmNdgcFQlnIp7lydoOKDetK
 hnpu7T5hzBgaJBr6s1c5nzO8YqWDGIbpl0KAuV2yTrhVl68A1vpkwVlHwnQSPbbkhCjhBjiUO6d
 cX3Jb1SXBghaYuiosLzkiPEreKezFdh0VC2nQx6tCegxI6hPk/KNHGXl2HxMGdDgR0BtHm6hJXs
 zKRdK2e3kXim1m9SqLiY7IzuibPgc4c2yWq4YFKbIKGVxt/YQ9e6oT3valVB1Vhg2hQn/0cvCvo
 P5vhBP5o
X-Proofpoint-GUID: 4ye0wSdUqw_8RzSfYTIFrkG93192Iqbm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160024

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Add documentation of possible values for I2S interface types,
currently this is only documented for DMA module.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 include/uapi/sound/snd_ar_tokens.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/uapi/sound/snd_ar_tokens.h b/include/uapi/sound/snd_ar_tokens.h
index bc0b1bede00c..92cf72a6fdd4 100644
--- a/include/uapi/sound/snd_ar_tokens.h
+++ b/include/uapi/sound/snd_ar_tokens.h
@@ -118,6 +118,12 @@ enum ar_event_types {
  *						LPAIF_WSA = 2,
  *						LPAIF_VA = 3,
  *						LPAIF_AXI = 4
+ * Possible values for MI2S
+ *						I2S_INTF_TYPE_PRIMARY = 0,
+ *						I2S_INTF_TYPE_SECONDARY = 1,
+ *						I2S_INTF_TYPE_TERTIARY = 2,
+ *						I2S_INTF_TYPE_QUATERNARY = 3,
+ *						I2S_INTF_TYPE_QUINARY = 4,
  *
  * %AR_TKN_U32_MODULE_FMT_INTERLEAVE:		PCM Interleaving
  *						PCM_INTERLEAVED = 1,
-- 
2.50.0

