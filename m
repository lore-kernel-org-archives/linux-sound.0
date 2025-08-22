Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1836258EC2
	for <linux-sound@vger.kernel.org>; Fri, 22 Aug 2025 10:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755859774; cv=none; b=DtEgjbbB+fCgX0q26UzMx4wryGauIXr64Ie3v20rGJhLAXbOk+Iqr+JEJ2XjaRFzvcYZG3Etvpnb7UTGNgeT8r+WcimSyXHsxti41XaFUU25uw041HOE/aqsR411mZPr2Zd7zdzjU7cN8vQH1XnKHotOFtInn+Y/Q+x0OIdjjYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755859774; c=relaxed/simple;
	bh=5fIDqUXD7VH3UjC4CJNLxMKxI+lpq+RhyAKwbCwSPLk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RfpE5Z/4PLvC2RUWGFsq0CktNnQlL6J0Vro60blmKVjbCu4Z8IJH9DdpQEzKoKzfeYonB5bX0DgTd0B13YyxljsNOBMoozHl5UI4mxxRT5C845kfIg4WQHJsGOaT3iWRmvLgy5smwvegKHn6mzMW+wr9VZInVohptCfzWecw5z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iD/8nneb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iD/8nneb"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UKad030499
	for <linux-sound@vger.kernel.org>; Fri, 22 Aug 2025 10:49:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=qRbHDqa0iBJlBes/7NLPxU6bvmCGkVDi6QR
	TTiOXynE=; b=iD/8nnebEC5S0WNQySDbG9AZFvsvYK2nGds3/Gs4DFdrOLuWiNb
	eJje1PbS0MePv70TEFRpK9NTHsEgUy6B0dZxaEqkZ2Sf0Y8YP3VFyqMBQ0DDFggu
	9+4DVr24khC7+E7l7tJlENBn8dWZ91ZLDw7FlZqvXOeK42DcJC8FrNQ7lf9ZLcPw
	wsabwiUBv7PCk1R8WLQRU+upl3FI+scpfCq4Uw/+tscY7PrOSs4faXo4cxnz04uS
	5Jn9CW7eBa2qvdQRqg4feIwXStcxvkHRIaj0sL0uIlnrOs0Yq1xM7KTDvWLRqWUS
	iobEc7KS5mVc5dcnPFh1d40Xf55KaKkwOjw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ngtdps88-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 22 Aug 2025 10:49:32 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70d9eb2ec70so2490376d6.0
        for <linux-sound@vger.kernel.org>; Fri, 22 Aug 2025 03:49:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755859770; x=1756464570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qRbHDqa0iBJlBes/7NLPxU6bvmCGkVDi6QRTTiOXynE=;
        b=cpavthF8un7UMpz2iz10WMqMathsTnffnObgsasohx/zNdO01k/qujjIrAeV0Rz2hl
         7e0TUeQtiCAwXxcC70th1lsEPsiFik0MkvgVIgMWH1Y9Tqwq3BeaJiY3vLhgSsVXioxm
         3Jv2MItiwCsWV7BznYdxVipIPewEjFranMIJassdLmE9VBSQ9AseVmOW6SUK0wOFsPwO
         Fe/xSV0saOsIryMCFb2RoqICuqDyQcos21PvJMDyz/+GpYLzmd+qwM5roDp+VTBB4/9C
         BVBGPcsI+KHSYw00nrbx7nr6CZ6G6/vQGaX4KouzBRmaokGkw6dVWGm3GMgZvTKxQWj0
         hODQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7kbkD2sq7dYvS7UMJBG1aDw/091wsY28fT5M+p1L3TvoXsdz4QMIDd4rAF4ZLF7iA0lyew8NFEv2jkw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzS2Gze7zJEKS0NnS8DEyuqg1YpYaCWSs36vTavRkWvmSlGWAFY
	we+UX1Uu1dRmnMo3ygaSsKPwUMAtQazAgHzmxcIaRftZ63+XVVHrxoUpRB968dUTMc8XfUtTknQ
	1XI6q33/k8MsjJyCGI7emVJS7t853+4GtwWv5j8s0t0Dky/bp5bLVmEPrnxakpaHb2B3Mbn2n8w
	==
X-Gm-Gg: ASbGncupfLTLp67WAfqgJS/C4/UXGXrUg6TxoPFN3AO6uiaUF9q00w+pjWnz4/ON9zU
	am0FMWa/X1iCgUD50jTBld6Oo0LHB17OGglC6PtPIdWzirK6ERBOEYotrHC6t8MOXYyXtdVJXk/
	mdaEU/gef0faqmjtL6o4osBLHLXw3YVoKVudYJf8JO2bcHh36sqDVd/To7dnKqUhSeFYUu3cYtx
	QjEtG9rLU2v7hZMEnVyeEOjcE8EEPEQiw56POP3GnkQuJQpdsSr5Tuo7jYqVpCVnbZCDgW4oYuU
	XzaPbkKnlP+nwwTyVe538QJU2TIhOVPC0++qS8Jzux6Fvv1MYSZEkA==
X-Received: by 2002:a05:6214:2a4b:b0:70b:a4d2:3687 with SMTP id 6a1803df08f44-70d972c386amr32858326d6.21.1755859770301;
        Fri, 22 Aug 2025 03:49:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFbCYwBV0hsfVBII7n6usWQ+8TYKIMX2RYMa4Bcpz9aak8ip2JM33O0NwdgVIs7Yh1wuYysw==
X-Received: by 2002:a05:6214:2a4b:b0:70b:a4d2:3687 with SMTP id 6a1803df08f44-70d972c386amr32857996d6.21.1755859769774;
        Fri, 22 Aug 2025 03:49:29 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b50e4249bsm31367155e9.25.2025.08.22.03.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 03:49:29 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        neil.armstrong@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 0/8] ASoC: codecs: wcd93xxx: remove code duplication
Date: Fri, 22 Aug 2025 11:49:19 +0100
Message-ID: <20250822104927.2621866-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LexlKjfi c=1 sm=1 tr=0 ts=68a84b3c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=OLL_FvSJAAAA:8 a=DXjLId-kC2nHtiOjzpQA:9 a=sPFwb3Qtu_UA:10
 a=kl_IBrakYWIA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=oIrB72frpwYPwTMnlWqB:22
X-Proofpoint-GUID: V79aH2xnu9-W0WfMPdHu4SgIrJoMjugm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDEzNSBTYWx0ZWRfX3kGcLYMI8vdO
 oVJSJwcB0uSLh4MH1MkeNsy1CjPpycXbCc2kNVqhiRZHDv+rrP2b6v+UR6i6lHrvxJ0Diq8NRoQ
 kG0F3ApH05K3ey0jDFZzyyRPb3F+poMGXAz0KnmIHR9yQ6adUIfhgt+kxspqnG299lvLMqKdah4
 T6Luf3Jl1nntfAP6IoBncQJ9d71WA9N2UCVnLd9G8ks57rvFmKqjGd1plpRobrJCOZUSBb+su8W
 OhtgbUhVLl7jD2A3cU5Ru/PM2wXAftgbReWZa1SsVpUDWHYS2KT0+bqW0A3QQhKIEo0JnR1YBrw
 sqFMUQ+P6lRs3NssaxPiyrYcePpnVpAY5pXEYfHyF3cgzpqvzI7NuUyqDbWkbGwbjc7kHMk9y1+
 NZuBq13NU5W72wzlwKZxVNtU7kS14A==
X-Proofpoint-ORIG-GUID: V79aH2xnu9-W0WfMPdHu4SgIrJoMjugm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200135

All the Qualcomm WCD codecs and WCD based codecs have lots of code in
common, resulting in lot of duplicate code.
This series is an attempt to clean some of this by moving the common
code to wcd-common library.

Currently I have done cleanups for 4 codecs wcd934x, wcd937x, wcd938x
and wcd939x, however any new Qualcomm codecs can avoid this duplication
by using the wcd-common library.

There is still lot of code that is duplicate, but this is just a
starting point for such cleanups.

This patch depends on the other cleanup patch series 
("[PATCH v2 0/4] ASoC: codecs: wcd937x/8x/9x: cleanup") that was sent few weeks
back: https://www.spinics.net/linux/fedora/linux-sound/msg25202.html

Am happy to merge both of them if it makes it things easy.

I have tested this on T14s, any testing is appreciated.

Changes since v1:
	- add new patches to remove usage of dev_get_regmap
	- add fix to wcd937x for comp soundwire ports

Srinivas Kandagatla (8):
  ASoC: codecs: wcd937x: set the comp soundwire port correctly
  ASoC: codecs: wcd: add common helper for wcd codecs
  ASoC: codecs: wcd-common: move WCD_SDW_CH to common
  ASoC: codecs: wcd-common: move component ops to common
  ASoC: codecs: wcd939x: get regmap directly
  ASoC: codecs: wcd-common: move status_update callback to common
  ASoC: codecs: wcd938x: get regmap directly
  ASoC: codecs: wcd937x: get regmap directly

 sound/soc/codecs/Kconfig       |   8 ++
 sound/soc/codecs/Makefile      |   2 +
 sound/soc/codecs/wcd-common.c  | 139 +++++++++++++++++++++++++++++++++
 sound/soc/codecs/wcd-common.h  |  46 +++++++++++
 sound/soc/codecs/wcd934x.c     |  82 ++++++-------------
 sound/soc/codecs/wcd937x-sdw.c |  61 ++-------------
 sound/soc/codecs/wcd937x.c     |  81 +++++--------------
 sound/soc/codecs/wcd937x.h     |  22 ++----
 sound/soc/codecs/wcd938x-sdw.c |  65 ++-------------
 sound/soc/codecs/wcd938x.c     |  91 +++++----------------
 sound/soc/codecs/wcd938x.h     |  14 +---
 sound/soc/codecs/wcd939x-sdw.c |  84 ++------------------
 sound/soc/codecs/wcd939x.c     |  97 +++++------------------
 sound/soc/codecs/wcd939x.h     |  20 +----
 14 files changed, 307 insertions(+), 505 deletions(-)
 create mode 100644 sound/soc/codecs/wcd-common.c
 create mode 100644 sound/soc/codecs/wcd-common.h

-- 
2.50.0

