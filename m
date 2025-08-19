Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5643231CA78
	for <linux-sound@vger.kernel.org>; Tue, 19 Aug 2025 10:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755597726; cv=none; b=ZQNz54m3KHvs2GQWU9P9nZSwgMsGRAlPkpD6IOYTcjRE+xz9x6Z1vfG8ZK5ct7CrCKLgm7xhpHFBS7aN2+ZA4/Ytm26Jo3b756RvX3Ktu+aTMRf7SIq6YYb+vMyrrdrYidqX6BkwrRGUpLAVT0gTz/7kYKXGQOIJkcMMczUESfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755597726; c=relaxed/simple;
	bh=qwuYqZpPtHuX/2WTSLKobMX+4muge/nS9jt2JifQjdc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I9O84aKv6eSSCfBNTB+t7FqnvcvzeGpfsXVCdR/1zb3qWSc7+7dEPKMMLQXcco4lQyQfbFg6TWjEM+m2qRuEDMWjCAOUY2eMRQn+EaqEZKsVmDB1rNSAobcNyC03c7IjuAApZevrcZVWD+j3NDZWNwPhHabh09HPMWAFMgGM8pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fCySFX0l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fCySFX0l"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J90YRF017993
	for <linux-sound@vger.kernel.org>; Tue, 19 Aug 2025 10:02:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JQBp3mqbspP
	8PIJt9/SllqFn7BROE0fyDwOwOB0VX5s=; b=fCySFX0lBg0IF8kYEhPZSBx1NXy
	UtuWMpj/JL1ANNPTGLiSk9ATBo1G4+2bmbER22ZIJKm2KaGlRo2EWMJzF0Phvcck
	bygvV8eRWqc+Wc96WGyG6f9SQngJ6IaQSnuTJ68oFmyJWMslGe/BMxZ75KMo6+e5
	AEoLzYZJrZ436itcTEzqeSOY4zpYbttZ9kymm2cISb/O2eF6IjdaHvs6oCuPSw6J
	ChPT41MJmp/xjU3jIMxTiekkfoLOF7JRJU0sML4WZE8UqllyNDkULgZFhnnazW7L
	IWtgHXLYSv0qMoYvYsy2lchjt8s4iC2U/4vvL/t8tP3xpewbWcxZ7DgOpKQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jhah01fm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 19 Aug 2025 10:02:04 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70ba7aa13dbso93416816d6.1
        for <linux-sound@vger.kernel.org>; Tue, 19 Aug 2025 03:02:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755597723; x=1756202523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JQBp3mqbspP8PIJt9/SllqFn7BROE0fyDwOwOB0VX5s=;
        b=EvUwEFHyeo0+Qt9sUX/NDRaqUfBrxpQNsw8BrD8K4VsyF65Rt66DfLU6JYxrhohYuZ
         RcaNSkN8FMiTsekD0MYFR2hqmsJuek8Kv7qfzX03+A9KB9a7uHcXXLQFu2yN7SxrcTxl
         O96Ld4WmhTrr9j36iCeDEQATv/INn2DW1sdmWmdUgx1bnkCwH4QqU9u7PzbhHytN3qEd
         3gLYIDRccokDUxwUA15mF7tylTy1+RTet4q1B1osAx4BzMpmQpajp9ixY+/aq2g/2tDP
         X68KrN9LwrfSfc6orCZ+6bJ6zPyGw6wfKaCluIGVGp9TxXp0JZxEwRFC9sOAoHBrTbb7
         uXsw==
X-Forwarded-Encrypted: i=1; AJvYcCVheJN52lPUXYNTPQ7NI5Di/U5nrpipeQozwg9zSZkQV4Xp/hY6MYBlGllzd+ZyhoD+cEdxV19sqGbMcg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDOnwwqT624VfrNZjqHciPKIsXNfeeBikNqMgJp+X/WCziOh2T
	QHW9e+5r2fM7c5bMVnU4z9t1+eHlcP+g5JpC5jBjyIslbVtaNdlZERhgyig6ecipTX3Urn99eke
	NQC4TDLL/txDgcxLy6sAHwjPi4yWI7xuYupzM+iEuQjm4uy/hGeNU13anmIffDwyX6g==
X-Gm-Gg: ASbGnct3RyayqVzAlXn4IomYBktWTxoeU/MfeaXd8vinU9v8wCMiDifhEeiPOw5ReCY
	PIWIMg1iEagriEB9ZVoFIwezPSPxCjxTtVLzzuco78wogSYr3VT96yQLKCndXW9Guzo6prPzw53
	vFAbhpnWMlnUJIhnsZtE8mr4voQZLZLqvBuIACFFtgz2lufPpuoqDxLH5Q2bCMX3sNmbuta0TN0
	AzLeEM0d6Wv9a+UC8fZKl4BYMof2I2L2pCnkdpvzpYGAER/I46ZeAt93C6hUnKF6hogTkbfTC2K
	kk86OHZmYcRg2iBtC0GDwfcqw5lbrfG46wq7JFlaZBmi0xj5KA6dOg==
X-Received: by 2002:a05:6214:4111:b0:707:6306:28bf with SMTP id 6a1803df08f44-70c35bec101mr20643556d6.36.1755597723209;
        Tue, 19 Aug 2025 03:02:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDnsU777ceQUX7Q+wc1HqFoZgcHCLcDM2iUFymWXoFmtr9FsHvy0tyalhDLoICjH/DbldWzA==
X-Received: by 2002:a05:6214:4111:b0:707:6306:28bf with SMTP id 6a1803df08f44-70c35bec101mr20642666d6.36.1755597722416;
        Tue, 19 Aug 2025 03:02:02 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c78b410sm216169635e9.24.2025.08.19.03.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 03:02:01 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [RESEND PATCH v4 2/6] ASoC: qcom: audioreach: add documentation for i2s interface type
Date: Tue, 19 Aug 2025 11:01:47 +0100
Message-ID: <20250819100151.1294047-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250819100151.1294047-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250819100151.1294047-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=D9xHKuRj c=1 sm=1 tr=0 ts=68a44b9c cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=FY2npp4C09wRtmNKfY8A:9
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 1T-a0dS0PqknkGjXaRbI5pC4grSX_0Eg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyNCBTYWx0ZWRfX5FfM9mBomGFQ
 jDKf2POGyuTKhdxN1+MO+fuggqHnyS2Pp+oAvzyFIIvORMSTz5u+jb+jytU1/gE/qBBr7E64+jY
 pnUSG24VyYGS6Rhxo+U6ziTenzTVgx0AfvbQzU3BU8l4G1XmIcYfzDKPn0KsNCCcOERomnPk8Kg
 vPVb7hc7FUs+TxMXiqFnbhed1iYTYzbIMmByrmZiZF0hYc7lVSO1Y2V5Pu2I/MSEZ+AsrNlpbmJ
 WY9nf2yCbLSTTkjKF4yOQDpA8sOiRXOc2aws5OzWZwv2x1J/hTx3/fGapOzzYbGMWcxdFxQNfzR
 Imv82S7QlThoTo7D6HSSnBS0+Ga9kutdR45rffr0DjC2Lk4JR/LAzzIe21210NnBkwIVbgUHj6i
 sj9nn0a+
X-Proofpoint-GUID: 1T-a0dS0PqknkGjXaRbI5pC4grSX_0Eg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
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

