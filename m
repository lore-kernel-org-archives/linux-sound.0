Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347152EC08B
	for <linux-sound@vger.kernel.org>; Thu,  4 Sep 2025 10:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756983407; cv=none; b=LFh+urtWSMzGxQCfdbAbrydLWCXi5NRkY/+H5ppLLm8BKwGk9NpvZjmzjiU6nvDPMO3rZzNhYGbfQUg5V9gh4AXjWS86dKP4swcMiPaL0MYMmD42SBBriboHjiZlYQacPRYPiRJOf//kzl1VsraUkqP0gJqaVaAMtp9wgkq0jKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756983407; c=relaxed/simple;
	bh=ZJI+yu3kb9pKBhFXII4xHvYnh1LrQ0VBRlmlVCuUT2s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=souGpOZtmsJE4jzqq9hM6deDjWd1oYaqIE9xKOfujVCslMxHj3T9QFmkxBebUSYpIgiOfSvtZx1ivlRxD6IcrDPp9m2b4CjzywkKTtBZfIu+T6N6Bhabem/9h5dRNgSoC3HWcLvx/aOXrnw6m8BgrCV2FHAUjhTvvpDV9pp++vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cHxejNhQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cHxejNhQ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849X8wj032207
	for <linux-sound@vger.kernel.org>; Thu, 4 Sep 2025 10:56:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=JrOHsVLgG7Xc8r3NOkyT0zafNDJIi5as62e
	4i26U5Ok=; b=cHxejNhQD786Sn2xrL0HtH+k1/yWMLzFZqVWafuUHPWLe5P1dG0
	IzqGnJEteqyT9fzzHFYrKG68E5v7QSH4/aGV0nKj9mQXHpioOMYtE2VAW4okJQht
	7kN7RqSHex9RAwKe8SH4CHjnJRvkkJFDg9zqbfRxN5elX4Ndz+EK9C+LVqpjMlYz
	iyUhw5F9q/u8oNBpp37CWB7KAmoIQMWqVNSSpS2zp1sgb5QYarCUI4DZmcTdbnqz
	bdZoISna4ssldB+0DSi72FtUjlB876gPjL4PvUi5S3DREchPZmpXFe8I4Uxzlcl1
	Jjn6mIbpQPcpnNzUSisCuaAGHs3lgDBUTYA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnpfbrx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 04 Sep 2025 10:56:45 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-726aec6cf9fso19730406d6.1
        for <linux-sound@vger.kernel.org>; Thu, 04 Sep 2025 03:56:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756983404; x=1757588204;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JrOHsVLgG7Xc8r3NOkyT0zafNDJIi5as62e4i26U5Ok=;
        b=UErxdG7n8Pu1fqKQLcsUdKlC8J5dbQ6IwFgTW4yfnCWN5KA7pQNSipOwPwWKSrmGdw
         mBFrHoG26u8U45AE0ryq4UW1e3TUJmDEJ7buBDj1kfamle3LEGlE+//yukMqvHsVgTC6
         hji4MOBwUVJSiqBpzYVlRfvy3TJVoulxPB6d/Ye/x2/TYqTS3uu2A7l+BtQ+a52sU3+1
         lBzEfxCNVi7Pp5TyWLimHGbmSzg2UqX1iXQRGWj+NI8M+Tl37xWCwyWAqsyBvpfI7dpg
         OTP61qpm2+by/faqVmIGRJVJaAhMnCzSraui86YJ2wrOq1B5D1PfUtkbVH2fUaQWHdch
         KWqA==
X-Forwarded-Encrypted: i=1; AJvYcCU06i3/n3zYIzWUDhV1c4BgxA4P5JYmcQWKrmSMssQ+Wc3K2BK932iWkU5m4RBcf8XPNCMTy6iAPFSXAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxK0yice7oDcDe+/F2nRS7rMGXB6U3tfZnkOxVrNHv/mcRKCPHd
	X2Lrb7X7bKhsPlZsw1cH3aTb8WCKyp6/A+xg/aCCvOTytWBxRB4/OqTEI0w/meItkSTttdcycx4
	eWjS3Lp22tNUxt2pYVTTmmIcdpETIDMsnQbe1vZCTxSWOO63Ah9Pv9P/rEQFb8hGnoQ==
X-Gm-Gg: ASbGncu1IAMsBjDpdLsqcRjHQiw0oTJYjgqq51JAJAwgmAW5IFTd4oDzcclVrVK2siG
	ryC9zM2q5vZMlI1NMksFvvttTGYKNW8ncRwYQai8j5O80Rve5vAVBMhR9Z6KX0ilZ/UMTSjrVNx
	fdJNL/Ftd6581Q9Dnz/jgejUJmLi4CEK+Htw3QnrWKlt+MCFlTvoL30YKR61nn4qiDQACj5jgfI
	5WIMX4LKQZ+6xN3KnUEiTIFBR1QhcZKWDcC7af9oj+V07QcaUkZESK/h2ZMjqnuNiPHT2Sppm+t
	iiOlEHQhR7kexgsnrWa/FRo/L+RS38L6TAGBX9E2kwu21+ZJ6bsxKA==
X-Received: by 2002:ad4:5c63:0:b0:716:856c:4a5 with SMTP id 6a1803df08f44-716856c0613mr178623926d6.43.1756983404181;
        Thu, 04 Sep 2025 03:56:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEETHs6hBI1fqkOKuJVgfies5p/ujrhSYMuRzN1b+j0JOrWTlVQdXIxWN3WRoiEoZZ1+Lc2hQ==
X-Received: by 2002:ad4:5c63:0:b0:716:856c:4a5 with SMTP id 6a1803df08f44-716856c0613mr178618556d6.43.1756983392680;
        Thu, 04 Sep 2025 03:56:32 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d0a1f807f9sm26462334f8f.38.2025.09.04.03.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 03:56:32 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, krzk+dt@kernel.org, vkoul@kernel.org
Cc: conor+dt@kernel.org, srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 0/7] soundwire: qcom: add support for v3.1.0
Date: Thu,  4 Sep 2025 11:56:09 +0100
Message-ID: <20250904105616.39178-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: cNTHzST7aPZT8BaPI19ldHd09Dokbjt3
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b9706d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=plMaQY1jPcDNhxvH7e0A:9 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: cNTHzST7aPZT8BaPI19ldHd09Dokbjt3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX8zunUfCTVowE
 XkSncgrPyxWXPQAOoBFv59bXqGo1WphlZAy9epL6NPbaPedeDUcQyfh7555XbayDmVMl79rbVij
 1g52Wy7S4drZLuU5PXmbIaNuAniG5oFb+I3AqVfpHMmfVGszbBr/2n2q7HuCFoFs6aVIJJEBrWY
 em5Ry8jtqlRnvwqSpCQs3lmcD/i/DRs6VGWD53xh98KwXlkk4q+lw8CxuxHOQEHvr39jx8u8VAk
 xdvKxJPrnHgEmfE1OYaatlaS7G/Dgc4Qe0RkNc0S913s+38kLzSqk8ppPhcJLjWqvbVAnnt4DiF
 hndHk8MTum7tpbjgDmLP23W8Tji9Rb4YSR+zFyyhhDyRccNyfY0BJQkDvZnueI0sfeTYAySDy9l
 sRen53IH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001

This patch series adds support for Qualcomm Soundwire Controller
version v3.1.0.
As part for adding this support, a new macro of_property_read_u8_index()
is added so that we can remove the qcom,din-ports and qcom,dout-ports.
As v3.1.0 supports more than 17 soundwire ports. Also due to change in
the register offsets, new entries are added to the variant data.

Tested this patchset on X14s and Glymur reference platform.

Merge strategy:

I think the patches can go via soundwire tree given that Rob has
provided Reviewed-by on the of_property patch.
Vinod are you okay with this?


Thanks,
Srini

Changes since v2:
	- updated of_property_read_u8_index to use index of u8 array
	  instead of pointer as suggested by Rob H.
Changes since v1:
	- fixed typo in non OF config of of_property_read_u8_index
	- adjusted scoped-based cleanup initalization.
	- remove unused macros.

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
 drivers/soundwire/qcom.c                      | 249 ++++++++++--------
 include/linux/of.h                            |   9 +
 4 files changed, 185 insertions(+), 114 deletions(-)

-- 
2.50.0

