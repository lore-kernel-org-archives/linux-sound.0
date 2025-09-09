Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26797322C6B
	for <linux-sound@vger.kernel.org>; Tue,  9 Sep 2025 12:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757420420; cv=none; b=U4DcYA3YFIRpR+jAMFUP9b31N+sutI79yPSAK2RepjMIitKRE2EytQ9CPg0DJOjjd4MNEHsWXG5NnWu477XQyY+qYv24rRyyZ8/2mx9SG2NxX0ku71y9Cgmd1gEJ2IfhkqU6medfYy3xSlrX/OBPXqHUgxjuDCF7frQEyK8aiXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757420420; c=relaxed/simple;
	bh=Lm8x1dNhXe/j62yLxi2MMhiKLe5Zsh2B9bmPzZOZ91Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gZoZrdDAXW+t8oL1GMH2ztpOORbPaMDrK7NmIMA9MkU/1Ooqh0+yyNHd8esnrbRJkFxEK/umZEZphl+p94HAXZtx7Kvr+LRFo5H+YNHFOwvcTjJjtraVJp8VSWDeyzTJLADTpfIGYDw7h1PfgMx8HPN4n5JFdgqoYMR4ERNaXuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ETYLHvTa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ETYLHvTa"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LVjv003654
	for <linux-sound@vger.kernel.org>; Tue, 9 Sep 2025 12:20:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=OIiI3l8AXinxO5Zq0psA7JGhqjDb/RlHxkj
	rqIc9A3w=; b=ETYLHvTarrlQIYs3HS3K+q+W61XJcXRmJjegxmU5IcUsZPyU/P8
	QpvUPjMZ4Ckdd9vWMaTGiiZn0GoUUoWjVF6LwfArAOM818WvUBh2RoemjDpA4Hdx
	D13lPwfoesX6nguLErE1+izxfSR+eDfPb9+xfuYRCrHMzeAOSzV4OefVJVCgHIpJ
	+cwQRMsjNUMe+H3mgsOhK4BDkTJkHSk8kWHLnKx9PwZqx/Imox9yY4etC9FKRNSg
	Dr0OZNdXO2Ij2HY2MPed+J5Ro59V/iURgJMcg3sY6YRPiIqJHv4Ckf4ACGK/fBkl
	vY96HHHypXZ0kTfyha/nAktlQdo9vMx8B/Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490aapgf57-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 09 Sep 2025 12:20:17 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b5e9b60ce6so130798891cf.2
        for <linux-sound@vger.kernel.org>; Tue, 09 Sep 2025 05:20:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757420417; x=1758025217;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OIiI3l8AXinxO5Zq0psA7JGhqjDb/RlHxkjrqIc9A3w=;
        b=IRxFjkz9aT3RPe8g9Ov0xHkRHwASDi4N1HG+aTGxu/c3ESuFSGoNbbVbhmOx+67owc
         UxASeHWzspNVj7fEf4p8Rod3TP0jdXCSadhXU25pmMSIZJPpF7y5YoXA6PL1mlQhazPz
         70PTcOREE/wuNKxnLMi1IX7xoYFQLVr0vTGEWPglou0HnMxmAfTWT2mFaV2M0NV8lopc
         DdblO5hwxxWSMcEqcoBM+6Na+vQAx764SOmofzhhsWQQ34FxVZGc2JlA47tQPWGyrmj5
         35H21LSPWib9DbnFXHCN1B3SZAcMY5cIdrUprct1alp9lscTDOelqK+38epjvexjgZ20
         NtHA==
X-Forwarded-Encrypted: i=1; AJvYcCXNQUTCUJVqT9Ik+g3RuokZHDWyaISzVB044mVF9lY2un0NHHDYpgohNGd+G4A28W1ebQ9V88zbEn8YNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRsdaB9sTP+f3SSzrNRYucws9VqXjdm0x071DhA1/zvqY8rgvt
	0v1H/2qcOVl9Le+hngJzNify1EoqV9K2YJUHn3kzM8FZYARgqHyySqQtCg2ebdKAhC3nfsmM3+6
	vRiFAsjxcPccvxFhWLhM57swSLYrbHp8cMtqfPapxNejbIaouvimMGQBjow6zR78I3A==
X-Gm-Gg: ASbGncuFYTWd27K/RzVVV9nzC9lsFIUNPoAwDl0/s05sdx4M21kir7eva/0NZVU5Af+
	kgwAlfVUlKfhb2fGtzVTUmBJS9rhwq7Zu1P/+caCMxzj7r8QFwuNnXq1WQjiaQDnwIHs4D1ksJ1
	xpuGCc5HZUi37ZIK1sMzALXqwS7vG1BtVXuhf212hUDeBuBL+cl4wgYd5mcfZzqy+isgPFyLlhb
	a7TqLZ4IkPXxUPIbcu6EA1V2zRg4XhGnnNdhntJvC4tcU6PcHnqWmnLoCtl+04NMZCNCIXvnE8J
	aqF0wN5BfwU6qC/Wz8WpFHdCXRgFNpw59K/iUOWSv8iSGuOmRAoAuw==
X-Received: by 2002:a05:622a:598b:b0:4b2:8ac5:2588 with SMTP id d75a77b69052e-4b5f85ac9eemr132555911cf.79.1757420416660;
        Tue, 09 Sep 2025 05:20:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEup1sKOipRaxeNyL6Rszfemb0uK/AoYpsNHEFeAvYLJEFn3vxJoPysPVCUbb8G40/wYd7LTw==
X-Received: by 2002:a05:622a:598b:b0:4b2:8ac5:2588 with SMTP id d75a77b69052e-4b5f85ac9eemr132555491cf.79.1757420416058;
        Tue, 09 Sep 2025 05:20:16 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e75224db20sm2414629f8f.60.2025.09.09.05.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 05:20:15 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org, srini@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v5 00/13] ASoC: codecs: wcd93xxx: remove code duplication
Date: Tue,  9 Sep 2025 13:19:41 +0100
Message-ID: <20250909121954.225833-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=eMETjGp1 c=1 sm=1 tr=0 ts=68c01b81 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=OLL_FvSJAAAA:8 a=QyXUC8HyAAAA:8 a=NNk1almXngzNn2I0ufIA:9
 a=sPFwb3Qtu_UA:10 a=kl_IBrakYWIA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=oIrB72frpwYPwTMnlWqB:22
X-Proofpoint-GUID: LsyAtYfs_LoCpu-3H3WEh94jq3C8VrmX
X-Proofpoint-ORIG-GUID: LsyAtYfs_LoCpu-3H3WEh94jq3C8VrmX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfXxUSrlZyF79vq
 vdjsDK/qNnT9rquJroMufyHJLsU4r4URAI016ALZXHkdDlG3ZM0CVjoODLnd7Mlyv2ObADf8TUs
 GI5mJbBU2QFxOtfbBCWubehziIofaKs7HKmXndj5znfpMYwfu+4UswBtUTGwbJPzs9iRx/nLH6g
 JeSk0Nl4s+8xcCgz+YwOFqfQn/p3Vut/gbJWIAhNvlNVsO3w3fISGVFwt+5+RNE5qBr5Uay9pGg
 Ai0sXNuhD+4HAZypwM55cqwaM8FvHBaUGdmYCOZ8D0yjz9MZ2ZAyEtlcqs1L5SIgoXCnNLyVyR+
 5V22r2dvNcElEeX7J/cMx8VQlJELF5rR4NJiWsPIc9YeNrAS84hd9yovqrVMVqMn2KDstqdrPyo
 lN/4DzVS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_01,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060000

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

As am touching the same codec drivers, 2 bug fixes are also added at the
start of the series.

There is still lot of code that is duplicate, but this is just a
starting point for such cleanups.

I have tested this on T14s, any testing is appreciated.

Changes since v4:
	- fixed sparse warning of possible running over the size.

Changes since v3:
	- fixed a typo in wcd-common.h
	- fixed wcd937x build errors reported by Kernel test robot lkp@intel.com
	- added patch to fix stub functions in wcd937x which an result
	  in build errors.
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

Srinivas Kandagatla (13):
  ASoC: codecs: wcd937x: set the comp soundwire port correctly
  ASoC: codecs: wcd937x: make stub functions inline
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
 sound/soc/codecs/Kconfig       |   7 ++
 sound/soc/codecs/Makefile      |   2 +
 sound/soc/codecs/wcd-common.c  | 143 +++++++++++++++++++++++++++++++++
 sound/soc/codecs/wcd-common.h  |  46 +++++++++++
 sound/soc/codecs/wcd934x.c     |  82 ++++++-------------
 sound/soc/codecs/wcd937x-sdw.c |  67 ++-------------
 sound/soc/codecs/wcd937x.c     |  93 ++++++---------------
 sound/soc/codecs/wcd937x.h     |  24 ++----
 sound/soc/codecs/wcd938x-sdw.c |  83 +++----------------
 sound/soc/codecs/wcd938x.c     |  99 +++++------------------
 sound/soc/codecs/wcd938x.h     |  26 +-----
 sound/soc/codecs/wcd939x-sdw.c |  98 +++-------------------
 sound/soc/codecs/wcd939x.c     | 104 ++++++------------------
 sound/soc/codecs/wcd939x.h     |  32 +-------
 17 files changed, 359 insertions(+), 582 deletions(-)
 create mode 100644 sound/soc/codecs/wcd-common.c
 create mode 100644 sound/soc/codecs/wcd-common.h

-- 
2.50.0

