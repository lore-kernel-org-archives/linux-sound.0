Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB702EA46A
	for <linux-sound@vger.kernel.org>; Fri, 27 Jun 2025 16:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751040221; cv=none; b=iloBlUE6OV60BUw41XA3XrEuGxEy/2hXeg3GO+PoHFzeXg8Bb8g3A72FIQi20kLGzD5NbpH4DfDsJzInYpBDazB0cNjjrBcDoHUfGQJXiAaNvMvX2cMmozS/1cQRb6UepBGTc5zAbOVE47wXNq1wCOlU1Km1vu42SSucvTkZS84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751040221; c=relaxed/simple;
	bh=4wEMYSv4N2rZnceVjUCPrSSzWsR/641Cal7MXSo20jU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TYldBFB127khz9059kRvTC5fvMOk9oruENE1Zus2xGdNX5B94xFmyGCjYbqXn1swiaAg9hlSdiYb/3WU5iRomN5W/DwFEwbwiXezlDv4mMnwonEngmQkLcVw1xn0f7Uq6h3CjYsf+vscLA+aQ/A1Nmzzz6nLOpvDXwB7Lj00+Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RNOefOJW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RNOefOJW"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCNvpD017812
	for <linux-sound@vger.kernel.org>; Fri, 27 Jun 2025 16:03:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=JZtSXqN+9X1xMkysZFQM8Di5K9z4Tuo9pQ8
	FYb34fF0=; b=RNOefOJWBzLt9TAmc6uk55qI4zaVGaH+rOe7bWeBI9ph6oiTiol
	w+PI9dFFQuOxD5uKItic2x85+b3Wic7L47ZdR3mlDbQibEWtXwG64JTewhUr3kJk
	OgRgF5piq4lWaK/PwF8HU2vQvzI9JSx5HuR0L82GkTUqRnxQYVuPtZQ5RykuU6N3
	jUIJ39dHGGCaut4xIm3hYkmx+iVW1GWz1KPDrnMmPNpxsgl3TgyY4RoKvXxtmr+m
	AYn0AowArulJljXLctT4oKwJLXglWhZnyB1+cSY680nlrgaa8Oc3gDRY3Ei8QUR/
	Iat10htQy1U81KIiU1cxpaNDHxx6lokcsTQ==
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fdfx5q5a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 27 Jun 2025 16:03:38 +0000 (GMT)
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3ddd5311fd3so342215ab.3
        for <linux-sound@vger.kernel.org>; Fri, 27 Jun 2025 09:03:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751040217; x=1751645017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JZtSXqN+9X1xMkysZFQM8Di5K9z4Tuo9pQ8FYb34fF0=;
        b=jUHw45Ei4I8AKIB8jtlzgzr0KJlfUZ39DBJ4lf27QKPJkBeVAHcERLM4hAMxpzdtwZ
         38NZP/zJxF2xqRsGO98a6pVnY7ezQT6s49KEBo9s1OjKYS2pdWcYIdkcTDZBJJQ+22CB
         YwN6vu8MSe5ho9Yjl4NKqJChLsYKQR6i85aUparNdIQpYsTmlB7DG1hErAWWzxE6R84G
         S9ts17yXCx3Zs/OTMxJERVMTQGdk17ZHY3VJeFCzROJDWLTeRhmUuhyQbyv9nJrUr+N/
         u7j0NqT9Tu16FdJuu4FDJytcap9sxw9sEdHO2ssIdoMKml6NrzoJhLvqHEcKEFth3B2i
         K40Q==
X-Forwarded-Encrypted: i=1; AJvYcCWGuaEh4Gs3HAwQzb2zrdnI/Su/zW78RmWx994fZHuuuv0ZJ4gTv5CINcb7lWRZendNRY08+DFr+5hy5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjLJjbOuP0PeWOweT4kYqQxjheSBh+5zW1FCEjg4z9EH0b+/Ni
	lkI3tqh39nCQt+DTb2yawre+E+fw3d4Rhp9HkdRwKMmeukMEWFJBzJxE5z8zl0OQZ83kxWhhq4O
	7Of0tMxjXncdANOYld27tcxwo2j3p6Wd9P09ul4wsmIlThdBq3ac1r2QaXAVs6GZAo6r0Nv3org
	==
X-Gm-Gg: ASbGncuNRM/qJ2tWqVkg9QQmVcaXXfe4kdtJkMem0OxVh1hGMII5KxmeMlgnjwFkEMv
	mbmnzVkS0YIDvkmMe9K3Su7ydN7ywL1D4ZuJF49T5zZegJmFrIHtrJHIPHvha7RtXwLo23G8D0R
	0Qfkt/kHQTKzBd8kGdJD0acCcqOR2qNcwb3y/DAh+zlyVdZRA2K9AzYQuoZ1taGQjMXfWUZh1NA
	LHfIGwfp0o9T7/sDYMClmNIFY9mVhR4Ed8BPgKJEEdExyh9Dx2SP+uicHjwMZmCjvt1k9TSmdmF
	qUjW1pxsni9zda+duF6vC0VjUK06XTS6XlUw50wyt1+m7Yj/5iz8My0=
X-Received: by 2002:a92:c26a:0:b0:3dd:bb7e:f1af with SMTP id e9e14a558f8ab-3df4acb6db6mr46155445ab.20.1751040215474;
        Fri, 27 Jun 2025 09:03:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvOitA3weiHvrHbYayYKUB7m2CvxSY++FtU/jT95HoUazgWL2L5IU4TEwOtFyreuzvrnPFeg==
X-Received: by 2002:a92:c26a:0:b0:3dd:bb7e:f1af with SMTP id e9e14a558f8ab-3df4acb6db6mr46154975ab.20.1751040214951;
        Fri, 27 Jun 2025 09:03:34 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e52a5asm3088200f8f.54.2025.06.27.09.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 09:03:34 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: broonie@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH] MAINTAINERS: update Qualcomm audio codec drivers list
Date: Fri, 27 Jun 2025 17:03:29 +0100
Message-ID: <20250627160329.442795-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Qw5mZEF31-M40oxZcIMHKb5o3j7LkN2r
X-Proofpoint-ORIG-GUID: Qw5mZEF31-M40oxZcIMHKb5o3j7LkN2r
X-Authority-Analysis: v=2.4 cv=MtZS63ae c=1 sm=1 tr=0 ts=685ec0da cx=c_pps
 a=knIvlqb+BQeIC/0qDTJ88A==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=jMfy5rlRwNJn2DxzEoUA:9
 a=8vIIu0IPYQVSORyX1RVL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEzMCBTYWx0ZWRfXwzoGE69gw319
 NDmj/Ok0qWSF7jqDwceRGVbDKaTaYMB4lXCldtxParIcRxtz/I+irTcf2oB/D8U0rpeIKZ9Dde3
 wO+Pzzwen9siNSGaglnaJB99dlRDEH3/Yhlo8NAc9Kc/MwVVfjcnhGFMQaIqLfluHyNa80gBllG
 wX10HKBbpYNHyyeFWh4c7pAqY+W/0qqW4qYlhRBcRoWKXQUFqoquKFzFUfUj8dhVeR63KX80Soo
 sG1k9/CQs+6Ya641TYhArhe/a6bnnKzWrTLVK+e72HGpWDI8+XwWZu+Nwy5M5Bhomfalw4kxGT8
 1E/zeYbujHOijK0S4bNVl/x/30waNhtiI9F2FRXucJglhaGYAAaUovX7/dBtUtdT+kT6jV7b9MH
 APdoMJynYUGz3dKCiRKG4Its6urufF1WmmxCMQMkaCuhDAhdfbkZDKkII9vf6zC9EBX/fKqn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270130

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Some of the codec drivers like wcd939x are missing in the MAINTAINERS
which is resulting in incorrect list from get_maintainers script.
Fix this by using wildcard matching on both wcd93* and wsa88* codec and
bindings.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 MAINTAINERS | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d635369a4f6c..0e0d7ee47816 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20216,21 +20216,15 @@ S:	Supported
 F:	Documentation/devicetree/bindings/soc/qcom/qcom,apr*
 F:	Documentation/devicetree/bindings/sound/qcom,*
 F:	drivers/soc/qcom/apr.c
-F:	include/dt-bindings/sound/qcom,wcd9335.h
-F:	include/dt-bindings/sound/qcom,wcd934x.h
-F:	sound/soc/codecs/lpass-rx-macro.*
-F:	sound/soc/codecs/lpass-tx-macro.*
-F:	sound/soc/codecs/lpass-va-macro.c
-F:	sound/soc/codecs/lpass-wsa-macro.*
+F:	drivers/soundwire/qcom.c
+F:	include/dt-bindings/sound/qcom,wcd93*
+F:	sound/soc/codecs/lpass-*.*
 F:	sound/soc/codecs/msm8916-wcd-analog.c
 F:	sound/soc/codecs/msm8916-wcd-digital.c
 F:	sound/soc/codecs/wcd-clsh-v2.*
 F:	sound/soc/codecs/wcd-mbhc-v2.*
-F:	sound/soc/codecs/wcd9335.*
-F:	sound/soc/codecs/wcd934x.c
-F:	sound/soc/codecs/wsa881x.c
-F:	sound/soc/codecs/wsa883x.c
-F:	sound/soc/codecs/wsa884x.c
+F:	sound/soc/codecs/wcd93*.*
+F:	sound/soc/codecs/wsa88*.*
 F:	sound/soc/qcom/
 
 QCOM EMBEDDED USB DEBUGGER (EUD)
-- 
2.49.0

