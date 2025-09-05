Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BCD1302141
	for <linux-sound@vger.kernel.org>; Fri,  5 Sep 2025 15:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757087082; cv=none; b=eLBJ9Irvbn4CixLZxgqTW3b0wEZV4rLWdUUBIB0jMn8PWPfr9Bc/QYpj1dz4iPlG+++OjlTAZWcOM/4nPrWg5POn7NukE79TRbeVpiv2onEOKjM32BzlhS9LEhsjn0OXQO8lgsisa4DVJ3Z964qUNo6GCiHgukgJ4EZ0Jar6A+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757087082; c=relaxed/simple;
	bh=ROujn7dp7bppBLnxm3K3XpMOBDn2+OlyLJK69FjVksk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hKKBLPg/eYXkw83ZvUydpQZGjfo1F40QlynZfeiiNlDozlN1O03tCKB/EZVtpjaDcLtbzAOL952dVIuzA7cY32il7qVFFuHNqylqhqmVNNzjXM9WKOR/pT28HZU7oGLpWyEVFNNkV6VwBj/VCDpDxLv83sKfCaUPEvz0v+X7F4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UkIyLf2S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UkIyLf2S"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 585FegWp032203
	for <linux-sound@vger.kernel.org>; Fri, 5 Sep 2025 15:44:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=6cVRx3cmyc19pzQ+jRbWLtqnyxCx5rv9VK6
	F+T36Woo=; b=UkIyLf2SqWOVDk6RRYf48FjlRlPTyQYcuQRN+TO+HgA1XYCR2la
	miKLWd+CPXkmJhoDgVrkT7niK0h+0dUlp4RwxXaL+FXpiRG5UhWxxdIwLsy9Vgab
	CzNdtNWoqcoLPxxuRrQPwkY8B/JLBBkv1ibEEq7oa3r7+ZH0fhBJv6cdMmfTOkrS
	cRGXG45Riom12aJn2hv7L6BEfbpNYw7XxS9r2mgjmUIcwVjqC37YNK1MPcA86V9N
	VcDga3niudp0ULmRr5qlCCxVPhKHZvehREoUwvJ8ksurC9uhgcutlO8KaOO4lBu3
	fiidoSForJqgGAWVr/ZC+aMBEDluyCisJww==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnpkra8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 15:44:38 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b5e5f80723so32245031cf.1
        for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 08:44:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757087077; x=1757691877;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6cVRx3cmyc19pzQ+jRbWLtqnyxCx5rv9VK6F+T36Woo=;
        b=oUeXhAENUDNObprlKS3/cQEMWrRDLyyzmXbmQ2tD5JFwbane5m4XCyeBr9qOZRFkUU
         ovUmM9Mcl64/uYawuFt3UyVjad4QiILcBYpbiRBC3RBkVanW3gzqAJ2wRihNh9fKmUdc
         6e8+IF5sfOG25GOAM90pcksbUJCYRk2wWq33lD3Gt+ZuiVZntf1TzL5+O21+FkUplcTp
         C25VJWCZVvL+Drd482OXIzC5nxqiv+y1uHMEx1foUcPaB6O07AjNcpsewNkaJ9wyIIbh
         +SfFGf8tI6WEAAVVL3URIqhvLHKglopgFWVzLl30Pr+KtuZRjvEOO0qgPpJKv0qT5T9r
         8V7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVyvO3pwGLPZ2bt71CgPi144mZV/tCIRXyzq7t+Gh0z57/Y744sBfGHT26AUTBUgoO3u7Qm4CNwKuk2zg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyixoqF3u5UyCZmgGJRH2u/En01OHci5VGRxT618AwzDL2Y8Ub3
	9f7BM6o+aeq3JbWVK7ROLw7eR0tx8Lh96MmEROuWxf56hJ1oGqHNjvRdCmrfT/yzoIhfs2vZuZp
	ul+Vpax+UBv3SCdfp3TeeVZIkRvxWWQ1ej3RlzNIp4GtuKEPibyajEBJN3mPPus84QA==
X-Gm-Gg: ASbGncslpQRsQYaYKgRlOhdN//3QBrJGUYOwBXybyO3zxaV1HmXhEa2tR3M1OtSEjAm
	XEcqZ4/xVaRAkL9le7yvMqE7YQfj5FQAfWUwUQ/z6koaOYLOkoGXeghgVjxXPXm+XtsjqdU5I7F
	c2rVH4fx3sA3NF2nTPPOKD8/T1TYNV4bkSOdj4B5gmWnYBRCf4vIdpacsgwJ+MPD45Je4e+CU/f
	5ltg1ETDZ3SfoOIGsOOI9iR2GXzCL3T3RKaLYSZlz1zvC3LTY4h4w2PYIiQMlO6nlzoBErt6rc5
	I6Yvm6GMloRI+PDX3+3OT5PG3iCcrHcKxakvzlH2R3qgp2QeW7PFuA==
X-Received: by 2002:a05:622a:1e90:b0:4b5:e925:fc6a with SMTP id d75a77b69052e-4b5e925fe0fmr37081111cf.29.1757087076939;
        Fri, 05 Sep 2025 08:44:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhaW+hRQN4a/2r+1WyMzrpI5xdfa8nBO9Xth74jDeBbJjGeyj1Ucclcx/fmglFqSr7/onWHA==
X-Received: by 2002:a05:622a:1e90:b0:4b5:e925:fc6a with SMTP id d75a77b69052e-4b5e925fe0fmr37080411cf.29.1757087075841;
        Fri, 05 Sep 2025 08:44:35 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b9bcda91dsm165716585e9.6.2025.09.05.08.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 08:44:35 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org, srini@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        neil.armstrong@linaro.org, krzysztof.kozlowski@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 00/12] ASoC: codecs: wcd93xxx: remove code duplication
Date: Fri,  5 Sep 2025 16:44:18 +0100
Message-ID: <20250905154430.12268-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Fu5kQ47BdxgCoH5aDAJXo22_pqqZim2o
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68bb0566 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=OLL_FvSJAAAA:8 a=NNk1almXngzNn2I0ufIA:9 a=sPFwb3Qtu_UA:10
 a=kl_IBrakYWIA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=oIrB72frpwYPwTMnlWqB:22
X-Proofpoint-ORIG-GUID: Fu5kQ47BdxgCoH5aDAJXo22_pqqZim2o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX2THId+xb9qsG
 d44CjvYvZl3tOIfl7n9gna5CK1ILlJmlcyvzh8QkXE1uBOc0l/BBipMelIYZaWtjCwY82FIaIHs
 NEa8vKPpTaes131NLJOOtVqN3207c1NBkgjqVQqU4S1+d7DzZj1g6GaUT04MqE0hCRmCT+ZRycs
 0WMaBEdmEaIEfrU7Tua5jHa+2DhkJ9mas0GHwRuMR0mtYU5uUibArUndWoqMzUjmqtD7hwWtisI
 Z6CKNJUqBwu0c+la68bmx+w7x97/i+4qO0JtzoafiKh8evoOBg7OQs/GUmn0+x6dOf22kVCkyoD
 6+YYqlGkxTYeTe84CkzMmdjAOXFwyEGBEQkAJAD1xa18AL8loOrkOsFBtq5zR4Y1dAeJJfmbLWq
 xHlM0/Ra
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001

All the Qualcomm WCD codecs and WCD based codecs have lots of code in
common, resulting in lot of duplicate code.
This series is an attempt to clean some of this by moving the common
code to wcd-common library or to soundwire helper functions.

Currently I have done cleanups for 4 codecs wcd934x, wcd937x, wcd938x
and wcd939x, however any new Qualcomm codecs can avoid this duplication
by using the wcd-common library.

I have also added two helpers of_sdw_find_device_by_node() and
sdw_slave_get_current_bank() in soundwire layer for the codecs to use them,
this series was already acked by Soundwire maintainer Vinod.

As original cleanup series was depending on the new soundwire interfaces
I have combined both the series as they are cleaning up code
duplications.

As am touching the same codec drivers, a bug fix is also added at the
start of the series.

There is still lot of code that is duplicate, but this is just a
starting point for such cleanups.

I have tested this on T14s, any testing is appreciated.

Changes since v2:
	-combined other cleanup patch series 
	("[PATCH v2 0/4] ASoC: codecs: wcd937x/8x/9x: cleanup")
	https://www.spinics.net/linux/fedora/linux-sound/msg25202.html
	into this series to make it easy to apply.
	- fixed copyright text.
	- fixed few empty spaces and re-arrage header inclusion into
	  source file.

Changes since v1:
	- add new patches to remove usage of dev_get_regmap
	- add fix to wcd937x for comp soundwire ports


Srinivas Kandagatla (12):
  ASoC: codecs: wcd937x: set the comp soundwire port correctly
  soundwire: bus: add of_sdw_find_device_by_node helper
  soundwire: bus: add sdw_slave_get_current_bank helper
  ASoC: codecs: wcdxxxx: use of_sdw_find_device_by_node helper
  ASoC: codecs: wcdxxxx: use sdw_slave_get_current_bank helper
  ASoC: codecs: wcd: add common helper for wcd codecs
  ASoC: codecs: wcd-common: move WCD_SDW_CH to common
  ASoC: codecs: wcd-common: move component ops to common
  ASoC: codecs: wcd939x: get regmap directly
  ASoC: codecs: wcd-common: move status_update callback to common
  ASoC: codecs: wcd938x: get regmap directly
  ASoC: codecs: wcd937x: get regmap directly

 drivers/soundwire/bus.c        |  12 +++
 drivers/soundwire/slave.c      |   6 ++
 include/linux/soundwire/sdw.h  |  17 ++++
 sound/soc/codecs/Kconfig       |   8 ++
 sound/soc/codecs/Makefile      |   2 +
 sound/soc/codecs/wcd-common.c  | 143 +++++++++++++++++++++++++++++++++
 sound/soc/codecs/wcd-common.h  |  44 ++++++++++
 sound/soc/codecs/wcd934x.c     |  82 ++++++-------------
 sound/soc/codecs/wcd937x-sdw.c |  67 ++-------------
 sound/soc/codecs/wcd937x.c     |  85 +++++---------------
 sound/soc/codecs/wcd937x.h     |  24 ++----
 sound/soc/codecs/wcd938x-sdw.c |  83 +++----------------
 sound/soc/codecs/wcd938x.c     |  99 +++++------------------
 sound/soc/codecs/wcd938x.h     |  26 +-----
 sound/soc/codecs/wcd939x-sdw.c |  98 +++-------------------
 sound/soc/codecs/wcd939x.c     | 104 ++++++------------------
 sound/soc/codecs/wcd939x.h     |  32 +-------
 17 files changed, 354 insertions(+), 578 deletions(-)
 create mode 100644 sound/soc/codecs/wcd-common.c
 create mode 100644 sound/soc/codecs/wcd-common.h

-- 
2.50.0

