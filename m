Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF4D2C0F84
	for <linux-sound@vger.kernel.org>; Mon, 25 Aug 2025 10:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756116780; cv=none; b=i4vE8cBHATB19FeTPHOo1mVqupd73FNK9Uxl6MmT9IXTFcb2buChTXzDMv6Lhv0TfWzpguP0cMpgh7XKuQQIYKmALPk8iht64jYu2RcRDBQHjmQerONP6FlP9I1sCupJlnw/3MbQtFK9EijjBAXRV/mPdfrlkmXPoebpcwjApDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756116780; c=relaxed/simple;
	bh=wv/ZVC0xhYK+uN9b1nZrElPQ9dihsNWNmCovyBsdd1o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nRDMeiYYjhd4m32ywNcqYQsyWXClvAWsqwgtvcS7PsUBGttNfilrUStPRTrnPFJEmNqJxjUIlJnHXD5r3e7mDwGzVQ7ygejQRDU6TRvfZm4rFgsV30NiWi/MZeMSdmDhX1knCDmExBQ2k4njTQxGhMPXt2cgvl9KxLLfAWal1fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lyE9hXPD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lyE9hXPD"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8jWge014572
	for <linux-sound@vger.kernel.org>; Mon, 25 Aug 2025 10:12:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=moxinys5s3N9BtVwh8XnRm+TEdKWfPUaqsg
	2wBZXC6A=; b=lyE9hXPDjc4qHB3aMZwvc4HZ8x7qYKETV2V9MUdWE/Z3U3VfsEr
	MYmc4j0uusTWqNCCGyc8jq/Xr6y1g/13w9tiJ2sIU//fGAdVh90YO6jmfbinmBlG
	tGzWApQo2u4c04Xt8r5wPAwrQzJu7XFpDFabnVQ1yge9wforC7PhCKknzCljUb58
	Qur2bjJUQhZDPp6cpuFFgK5qn4UEcH8SY96Ye/b9DEy7SWpJOzby61Sa5oSrfonO
	f+MVuN/EkSH+wmQmlHuHIp0UKW2W+6cBA6kWOFfOBRGYfWngWUz/kSyv5nnMGUoo
	4ysqlTbxUJleTukdsj+S7RB/q5ajFKwbAWw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5y5cme8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 25 Aug 2025 10:12:58 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70d9f5bdf67so86080576d6.0
        for <linux-sound@vger.kernel.org>; Mon, 25 Aug 2025 03:12:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756116777; x=1756721577;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=moxinys5s3N9BtVwh8XnRm+TEdKWfPUaqsg2wBZXC6A=;
        b=Ehuk/rykyvoBQJdDOLnxEW22pPXVectrNaawPYjKTJE1cVTsFB20YEJpkgAcU/eSb5
         +IYVbJ7LhKpMgbGdehDE7j+8qi+Tnw+bKj93FFLhCGFEmMH8slekVkecIEV42tuwy4i8
         WxXIdnxmomE7MUVwXv8atccoGV1P1+hlqZpk3rvAFtPPWheN8+hoeLPbTu4FK/QcgxwV
         cRnaSXygjqkIw75hw4yUD6W2I+bYM9BiKPuk0t/1gt/gE6/p7gP+nMZj6v2J71kH9cIW
         9SN+pS3dLvlKK8J6DrYXy4SpNPdvHRK9X9q4eSPv2oFkEZjqQCF7Dgfgu6Bu76V0Dudo
         4dKw==
X-Forwarded-Encrypted: i=1; AJvYcCVYofAd+BVXv07XVQw8rZjTvJuOabw+OGhWzdzHmnARs1MnLEuDOcOMIQxv81TVX5GII+H4GN1wuQiR1w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw31mtFA0mqSrjwjCDDiuIG+yasqfdp7NEwS1r5tYlUEskOFWOI
	M6E+T+k4uvoW9E/OOzCpLEplkQBqSDTx774YZXMRBwUKd1AP7KzKTeqgbP6kOhl/B8rrEuCFtQL
	f7y4qR+j0sHwCd9hprCsDssz4/Oa6monIFTYD0NqZYZ+DRhYGPqdJYIQvmhvlwqrVqQ==
X-Gm-Gg: ASbGnctzBOojb9hUYL3oQTA2GTHZyEQ7XjJ8gFuHnqXHUdiARXM2zPXtnDyz6yUJHmt
	TzbOYQwLSQjpyUalDyLvA3Ky6R+Lq5jRvpiEHpQBwVe13c0SRZIycj2PhdTCcROrjEH7Bs1Gl2f
	rWGcGUi8N8v8waJ9UU5PqpJ+/5x3TydWZj5SXdXp2aAZ8bjSPZGeiceEY2d4jK1G2AWiAtGNNE2
	SJqdr6WuIPB3gtWUDx/ktwihcLzpChznOn+pjcGCtRRhrXwonEWiJhHKmReF1hh7RwxbDUd+m9L
	5IdXTE2agvp2lIQ7A+ZnnwCeQxw5yft4j6msDELDgvg6Zjv6tBLbZQ==
X-Received: by 2002:a05:6214:4687:b0:70d:7e5a:2284 with SMTP id 6a1803df08f44-70d99bcbf8fmr120044996d6.5.1756116777331;
        Mon, 25 Aug 2025 03:12:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqBcBMlB2LMK2Ok/clzAec5tF74m7gHksFUm2BryOa8nhn1/DbX2Xv3WeEJ9ZiCW9dNVd7yg==
X-Received: by 2002:a05:6214:4687:b0:70d:7e5a:2284 with SMTP id 6a1803df08f44-70d99bcbf8fmr120044796d6.5.1756116776808;
        Mon, 25 Aug 2025 03:12:56 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6359b8d6sm5798645e9.4.2025.08.25.03.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 03:12:56 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 0/3] ASoC: qcom: audioreach: fix sparse warnings
Date: Mon, 25 Aug 2025 11:12:44 +0100
Message-ID: <20250825101247.152619-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX8+C5DnfV80Fh
 4E7bJTYjbCiHZC/MzTRTl+HsYRzu3KpkNFZJ/Ryo6V4yfDP+tpCcaCoRpOaGJ03nuRJrqacAp1r
 U2iNiJpzrO43rTKh25+oH0ryhqAoq9aWCFY/RIGoyd/qghxg9bdsm+I1Z1qmrZaN9G9ZYZOLMjh
 Ica/qGwFV3xANdug61W2PfyENTvwCxULMQLtcK9WKOteFQHuo/fK6FjbZdx+krBckdH2QdLk4Tz
 UQVEY9DE358JKqrE+oTLOvdXAbSyHoNKEoLID82KnX5l8NJDvMIc3dWxJXDtyE7vIu73rjinab4
 dFGeXz593TbMHSDatcrtU+5GPJ966fqFqx2ftWElm03XvAwprAT2CYu/e4fIUKFCfSh39YfRUsx
 fBohKbkD
X-Authority-Analysis: v=2.4 cv=Lco86ifi c=1 sm=1 tr=0 ts=68ac372a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=bgWwhrO3JQob-SLVGtYA:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: -xg1GQo9cxkEkeWcoWAkrbO-5b_OPAbC
X-Proofpoint-ORIG-GUID: -xg1GQo9cxkEkeWcoWAkrbO-5b_OPAbC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_05,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033

Recent static calibration support patches have excersised new code path
exposing some missing checks and also accessing some variables which are 
of LE type that are accessed directly without converting it to CPU type.

Thanks to Dan Carpenter and kernel test robot for reporting this.

--srini

Srinivas Kandagatla (3):
  ASoC: qcom: audioreach: fix potential null pointer dereference
  ASoC: qcom: topology: convert to cpu endainess type before accessing
  ASoC: qcom: audioreach: convert to cpu endainess type before accessing

 sound/soc/qcom/qdsp6/audioreach.c | 2 +-
 sound/soc/qcom/qdsp6/topology.c   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.50.0

