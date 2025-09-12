Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79685238142
	for <linux-sound@vger.kernel.org>; Fri, 12 Sep 2025 08:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757665955; cv=none; b=Tzm9jpHySWAAGj3ahhUvf1UWkgCgOIOeqN75JTDC+N3+vGvk/6804k9bJA6euVOlYGzM99uaTg2Px0gSFCCnXPGOVe2QObrczXckm79t6r6nt5Hmb0xtBkuFuH6FpqtF7refgfW+gX1lHDOGRIvuESBiSmLLHYmisGzoZA86tZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757665955; c=relaxed/simple;
	bh=BWh7wHrK8yZtB0eeU6Iysd3kLhRZzpxdN6HZoeCFTmI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hq0naQK/GTWUy7DOEzUicfq3mErCwfRBbRb4AciSoMUa9FvozHOoze1L87CRA6A93vL2ke+WA2WalG4uED4Y6nck0dVC9iGt3l87sn1w8Izm7WwikiAfpVUeTcuT9jTxADSmaKuACbMfvhZCP30YwFbWDTewpCvTw8cBe/fnNtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hwGaiLgk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hwGaiLgk"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C69kE9002423
	for <linux-sound@vger.kernel.org>; Fri, 12 Sep 2025 08:32:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=x+G4Fopcs9BfzCpIG/+vVPae3N/6PqxOMft
	1V4SqZbo=; b=hwGaiLgkPHUx3Pho3y5EX2l96qa8rjA1SAsZ1kqNeJR1G5Ql6lT
	48qq2IgL5Rev6N3gtI/mTz6ZFM2CFU07KCqwxiUWRijfIeSYhD602uAytFnwq7+6
	1MZTNX855NDoMROZ/E0+Qgmtfo9jXuTAD+lxXlb0OTiy95zGiI0+3zWHmDCKTBqD
	kmf/Y+B9/fKt+bFvUHee2RNoDnAIcMitG23Ehet37yrVQZt3e+MCFEy5CZZYo6Dn
	u/ZJ2t6DrHVV8ODPr+GvmItfNbPpZgA33z9RyaqGu+CeTLlHDlt5qwSQxdqGzoxQ
	E9Rxp0OY3fvElI4Cf7Ip2rGk3cjYEf+srHw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8tw9f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 12 Sep 2025 08:32:31 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b345aff439so48209341cf.0
        for <linux-sound@vger.kernel.org>; Fri, 12 Sep 2025 01:32:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757665950; x=1758270750;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x+G4Fopcs9BfzCpIG/+vVPae3N/6PqxOMft1V4SqZbo=;
        b=idURu11n4a/X0fc9fC+ZR7B6wXh6+F5sp6fiLsobpLaQ3G/MOZhcCyQK3kAPccbcv8
         ZVgiVPRanohIVPVV0jznP/mxcFsR6LjZMsAGCNToD9Avq/IUGJtZ0NIhlfd58gXGOuSj
         Hu+VbEXrm4eK/1EGgDjKCX9g4+8Hj/TnpFxsk6jUmqB+o/9rPBAwO4PKu86YuKDP4k4/
         Vo84biTWNqKekoreRJntort261Qy/GpOBM6il3ttyj+ECFg8TzlTUg/zlVh0d/2Ua1+g
         Qg1s6UdvsA4t4Bh78ygXW8ctW7uAM7U+lkmcmroiTSsTBrwm0BbF5zsErEHRBFnMrOKv
         uzpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUevdPcmGMvio1wqw/ToM1ELoVCOzG4DgSC7tOW/1e8F8JUCvev05DmefwPOzdTv5QUD6qrRZlunI+0jw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh3yUroxxTGAJ0ILbVQg4S5Mb/3W8vuo7WPTBnXKBD/6Gg1HDF
	enRlRkG1Rdmh+mpl8/+V6bNYXQWdqa7WOo/mAElE2MXOETj3L9SXDOkCw/gfuNtbgxrNyezu9r7
	ajyAPsMHaONyjP/tN7ZiDeWMXnvq4cmQcuQ/qb1gJltl6dAjr/sDP/+yIqJ/Su4LW6g==
X-Gm-Gg: ASbGncuRaWjRjYZag+bp847/c2+XTg7TdH1I6Z56zi8MNkC9TveKtrDH8nipAluQLPc
	F87iNnxiHOke82Etji1Lv0PP7l6PY7dxyLEjHmeMII8CEdcmor3AGzTPQ2uRoFF5ueqbSPk15oY
	A5qzTMculiBNBFRJxBq54J5eHo5FDH1c33yX4321kFXTG7xYtadwYn8A9eUBlyrLc3k9GnqRAjw
	s1fb5yF3zLFLUThXAHAv0p5zg+h+Xq7YCSVkvUuBXIrPsKtbfGlpzNFHlygYlP4RjB2qnhpZp+X
	JnbzeaPoGw2DhLL3rfoeVm7AH/WXiTxIy0lLudrqKTqJF6wx7U1kMQ==
X-Received: by 2002:a05:622a:60c:b0:4b5:db9f:9904 with SMTP id d75a77b69052e-4b77d096969mr25292101cf.22.1757665950447;
        Fri, 12 Sep 2025 01:32:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmfYwelW8JgprI2UZVxfQqLOHW7kQBbcL91njBTANWpPA6QoJQBKRe6HjQSbxJkGd5DAR5RA==
X-Received: by 2002:a05:622a:60c:b0:4b5:db9f:9904 with SMTP id d75a77b69052e-4b77d096969mr25291771cf.22.1757665949914;
        Fri, 12 Sep 2025 01:32:29 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e017c1dd3sm31247265e9.2.2025.09.12.01.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 01:32:29 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, krzk+dt@kernel.org, vkoul@kernel.org
Cc: conor+dt@kernel.org, srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 0/7] soundwire: qcom: add support for v3.1.0
Date: Fri, 12 Sep 2025 09:32:18 +0100
Message-ID: <20250912083225.228778-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfX/nivN7Cm9VEn
 IEywwbepPO+5Eynp/MR7aSThxmisZdP9QFD8235qAWF7JHlg4Nu2E9keokYUveXLSj2x13S1fqV
 9TpiBrsprGhphkJ+8c9f/S2HUTLQScYsQPNNKuS6Huei0ckgK8KsxLolHyv6tIlNV7IuulSViGs
 iON0hlbUu15k755kc0B/OoCQqCqgiUhIS+Xloj3KMbcvHlYkOEFXJI2lEwLUl9xNwLCbk6DUI83
 SMGnMw8H0LcVT4gYq80d8TMkYYw29q42TYn/KHee95N2+uD5Do8DaGD//fU3YmxmoNzB37z4X7a
 ATAi8OTk26YYTkbiu3ybSvyYtTlJLDTb/q6QQ2Y23WH4NdsZVMYFRw84/r04aEx78zY5T7m1Fjz
 XUIZHKQC
X-Proofpoint-ORIG-GUID: QU-GhXa1mZEjrj_I4BrsnIXKQnG4USqL
X-Proofpoint-GUID: QU-GhXa1mZEjrj_I4BrsnIXKQnG4USqL
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68c3da9f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=plMaQY1jPcDNhxvH7e0A:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_03,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031

This patch series adds support for Qualcomm Soundwire Controller
version v3.1.0.
As part for adding this support, a new macro of_property_read_u8_index()
is added so that we can remove the qcom,din-ports and qcom,dout-ports.
As v3.1.0 supports more than 17 soundwire ports. Also due to change in
the register offsets, new entries are added to the variant data.

Tested this patchset on T14s and Glymur reference platform.
Alexey also tested this on SM8550

Merge strategy:

I think the patches can go via soundwire tree given that Rob has
provided Reviewed-by on the of_property patch.
Vinod are you okay with this?

Changes since v3:
	- added bit more flexiblity to driver with a missmatch message
	to address incorrectly specified dt-entires.

Thanks,
Srini

Srinivas Kandagatla (7):
  of: base: Add of_property_read_u8_index
  soundwire: qcom: remove unused rd_fifo_depth
  dt-bindings: soundwire: qcom: deprecate qcom,din/out-ports
  soundwire: qcom: deprecate qcom,din/out-ports
  soundwire: qcom: prepare for v3.x
  dt-bindings: soundwire: qcom: Document v3.1.0 version of IP block
  soundwire: qcom: adding support for v3.1.0

 .../bindings/soundwire/qcom,soundwire.yaml    |   8 +-
 drivers/of/property.c                         |  33 +++
 drivers/soundwire/qcom.c                      | 257 +++++++++++-------
 include/linux/of.h                            |   9 +
 4 files changed, 199 insertions(+), 108 deletions(-)

-- 
2.50.0

