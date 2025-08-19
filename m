Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0179F215798
	for <linux-sound@vger.kernel.org>; Tue, 19 Aug 2025 10:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755597724; cv=none; b=bfnZP+mljYVMN+kSMhRWZqDO9wtLKr9gKBPawBg500aAflEovQqlRJmsmoeHMSiZq89Wzt/KsTBqa86Hyj29ayOXbdj227gx3kJ8KneokJqwd0LIw+QNWSyZH+WRFDpYsJ0uCCukHTnsQd4HXBe22gJHTQmnSZ0di75K12MDEQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755597724; c=relaxed/simple;
	bh=bvbxKw7mRhdM/DVnr+b1jvlsLinzxDw8efh+jPDtC3s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WIAkTKUKR7db3+MshxfaIrtmFVHA7t8+cperdsMJe4lC6csAp5ZPgBb3ZCmIcldnIuFrTF7G72cOsMhJh5miafLT0qWv9A0roGKS1GJenNUkM3aGFGnIeHDLEYtolLc/UJr4jCN/8e+xkkVjIs7JaT0K8vBWH0XIoSyR0QFdN+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZAV5rASm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZAV5rASm"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J90gYU030525
	for <linux-sound@vger.kernel.org>; Tue, 19 Aug 2025 10:02:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=L74y3L3ig80cyaRVCD+72TwKzntZEtkauDB
	W4M/MxtQ=; b=ZAV5rASmnB/LCAB9iG8Bh7GpQ77LmYSnN8YauF2/BkqIHRJvGlB
	MlnTsEmqEIIMTedTGw/EX3681OWKNUekh/WqkIBhsOqPAsh1KcSoLEK1D0jssD3P
	jEGmVoeeu8aO60XJKT+CMmFAe0XdresnqS1zvYg61leyiTiMiAqe41osc66z69CA
	jXzjcGVLDlrLEfnO/nodiW+CWnCbe9R8X4GbqPPlZjInQ6D2dbTrJXjeyPlLV15W
	Y7Bb7hvOJrw8YQEoddhctsDe7euQ6q6M1EXhrAlOLFgEUes6/y+BBoL5D63NJlbn
	X0gk7AQ0LFJq192V1YcI88bJgbcNWc/JdNA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48kyunvauv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 19 Aug 2025 10:02:01 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70a94f3bbdbso106749576d6.2
        for <linux-sound@vger.kernel.org>; Tue, 19 Aug 2025 03:02:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755597721; x=1756202521;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L74y3L3ig80cyaRVCD+72TwKzntZEtkauDBW4M/MxtQ=;
        b=pYZv7HOX/EYQ9VdVmFjeaY+YeO6tKHCp950uT+cD1BgB+Ngtc3nf91JYj9T2mipQzV
         0JF4Gyw9hG6YvDpiG+MyVe5pTYLp0IBziY+IMPpcn/Lq/4oZTqJqwLxfrllnHsnsmpF3
         1Keh60w72niSFDAZQc7Fj6iPShX6zC1l480bjwBG7CLBF6iRQWnBb11/plB7e7r2iK+5
         H21oLWBle7Bg14cliYEZ6h20glrO4uzydH+W/x3Ar/RfnjtJsoGjl/jRzkLKVyqbdQkc
         i9YDh36acQom8nuMbl7OQiwUeTDJEk7GVhxRSWfRK9Q1v8IU5W/yk896JhPHzgjqZvS7
         oIQw==
X-Forwarded-Encrypted: i=1; AJvYcCXBo4bvE0oHrk4s86XD6PmA52/5/8gWpz1LDC5S7pbZMkTQN/R4VGJohlnYibUiWwo2N8sO1nUG0SqGHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYMdntCd+3Q8g4h9zXHLRpK3Kry66RR9FC17fRJyphaVxKsP3d
	+pSKUCZl45LJGcg4ixFQitHB/lKERPtx1o48CN1WiL6u/jCIDdG4SECsgnprbTwP/I6GvCEsRWj
	NSq0WMsKpGjpD//vjuFJsBSps9QSuS705ysRKhMDhQadpYEEkQkVFTHJy9zt7r9TK0g==
X-Gm-Gg: ASbGnctDkw3P7lsfbOA2i47RaF+HuJ1YSp2j0fzi7mCI1//bBmY9fW9abEw3bJcfUgU
	ziAo1Iogrbh53CPkgoZ/XQSwqXUbfhIlAy0rUulSyxQ+jIO/mcpU8bn5vJ2iiPMDZXPOmMG1EX1
	k70hpY3MCBftKmOurZXd530ZdME6pyKwktJGL1IYWUewuossox5Mqqu8iS3td81RkAlHFxuPtFx
	eruSPHA6EA8Iw6WlxciJahPv6B0YSE/stgv4HZy7JR5m8rJNU5hPzKoydN7pxI1EDkN+d/Ee8Q/
	4UNNPJurwzsS3qZYiRfzh+PJPZzRDiQerjsY3Y5zLAMO2m87X22uEg==
X-Received: by 2002:a05:6214:401c:b0:70d:6df4:1aef with SMTP id 6a1803df08f44-70d6df41c0cmr4504646d6.61.1755597721008;
        Tue, 19 Aug 2025 03:02:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0ORyYQYgG/iPv6OpOGp64k1lv0s5xEkKvvBPh/sKk6sxDMwJojqrbJJynW6bjWoANW6j14A==
X-Received: by 2002:a05:6214:401c:b0:70d:6df4:1aef with SMTP id 6a1803df08f44-70d6df41c0cmr4504136d6.61.1755597720477;
        Tue, 19 Aug 2025 03:02:00 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c78b410sm216169635e9.24.2025.08.19.03.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 03:01:59 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [RESEND PATCH v4 0/6] ASoC: qcom: audioreach: cleanup and calibration
Date: Tue, 19 Aug 2025 11:01:45 +0100
Message-ID: <20250819100151.1294047-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: bywX4LK-1RqOZMef70BT7sh0vWaQOwJD
X-Authority-Analysis: v=2.4 cv=N6UpF39B c=1 sm=1 tr=0 ts=68a44b99 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=c34dopEhia2B6330QucA:9
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDA3MSBTYWx0ZWRfX4PqaYWf+AZtB
 LEQ9FRdhkUYZXM+B20sQ1PX6A5Z0PXCup1HOkVDEneiMbNkFXLZ4pYAJVv5rGV1Z/wXKP9OJ+EO
 +0JsY54+Or7lDLzenR/XwOwB7V1r1c3R/vG2QN6u60TUDdsFe/UGgtyhDtHBRqqa3uu59mW1ssT
 tWvO/22w5JX8ECfCePEwSkAU+uq6zk+jgFVuKI8oNG71osilc/IJlnIe4mGdkXzja3ygZQDliSE
 cp7tBJif/gmuNHmvrMj94y/4MtP5fZWpgNaoldbGb30F/EIquwdGSNtnSjPqj00oyPNE3vZyEZs
 MTfP2/aCSuRa3cV4+XwpcPtFFTkKg5krP3JYpQJZQ0+BE8A4FDFxC1twh4UyZ65WTqFZ+B+AZ0K
 4Ee/X4E9
X-Proofpoint-ORIG-GUID: bywX4LK-1RqOZMef70BT7sh0vWaQOwJD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508180071

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Sorry to resend this series once again, as some of the patches seems
to be dropped/rejected by email client from previous send.

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

