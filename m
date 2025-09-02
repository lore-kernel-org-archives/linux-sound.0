Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E46630DD35
	for <linux-sound@vger.kernel.org>; Tue,  2 Sep 2025 16:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756829554; cv=none; b=NarHgFm0il527irRh9YjE2Fremd2w+g6QV18IUUQxMDA232ufzzWu3OwkTfcoRf8wEnveIjRAaGqDiNMzDtIMzaUpvRMIPwdSW7fgjfV59Z/5RD/JIcoDStMZsp90mZDqppLuh+q63XsMkVBoUPnnx1pQbix3u45MAl5LUhrJCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756829554; c=relaxed/simple;
	bh=w0Kq4jOT9R/r/z54ndWpSHo728vt3p4ibQdpqzGd6k4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nBfTr2DuiFn8NpkMZWt61aSTg/CR4SDKaPnN39ucQU5yLKvOX7xT8weuFXlPI916foHCZ7wpGLcR7hxRRnjGyh49g5QfBmTMYh0xjAFNn0DYQSmma4pf29wpCE10WdIBCTRLIqtWA1DbmkbdCiaIG/eCeeMQ+0231UpC7ysLXkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IyGN9vCG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IyGN9vCG"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582EqD1a001541
	for <linux-sound@vger.kernel.org>; Tue, 2 Sep 2025 16:12:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/9Uanp3j0KL9tdEjt1NNukFKdRWHcJUc2LH
	ujZNriNo=; b=IyGN9vCGtN6KjJbJQ0LwGeAHzp3TnKJRxE2Xx3k+uDFdPoayE9f
	LTFzQ92//XUXD1hW/F5Q+LJCfL2Lv6espDRt5uwoO2i9XeRWa1VOmMZbd5cMwVIe
	SiHXIeTJvDHWwkb8vipHsBOoK3i+gFg59frRdU1blUlLStcIrXlU8qs7jGrwouzm
	gLxRscI2tI3OEPx/4SX8Nrk2R7IYbnkbUEyT/Mjo3onuo9L3aLfCeK0u+uE5g+dD
	RIS5H3SnfYn7eGAwzbN2/c3gj6539JnwDuNLjgQvFw8iiKXJzAiHtW4BJT42TxN1
	SJ5mGQ/LnW1kEH0FEifOrfOXykiCi2Brykw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wy4ac9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 02 Sep 2025 16:12:31 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-544953b4aaeso4246133e0c.2
        for <linux-sound@vger.kernel.org>; Tue, 02 Sep 2025 09:12:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756829550; x=1757434350;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/9Uanp3j0KL9tdEjt1NNukFKdRWHcJUc2LHujZNriNo=;
        b=Cn5Rr1JZMp/UKb/xdpnhwORSBAWVstpbJ1kECbQXSZho53+YXvYezk7gm+fbjvF+ph
         AmtkDq/HYGD9CyjFldh1qZcPl7j9+9J8LOFDOkxIxhg/lW3ym36BGip8jYAkjax5/j4G
         hID5ArHH2m+QMK5doBbsGRmyezOeltGKkgHgkDKtwrCLqQNf2Qpmcd1/EwuiDvRpfwPk
         ZkwIrQVSzSpDf52QRwktr9SixOYVxoMmljQRDuAEZ+T3+9tKfHUDHeavBinImgzdeJaj
         TO+ipvlJpV2/xoObPUU2eQ7F5G8wTZEe3UV216UUJczNm9DM0esN1Hcl5WcnL6CaQ3VC
         ug7g==
X-Forwarded-Encrypted: i=1; AJvYcCWpCCnYx0wcEnQJxRlPZ6WAoKcmBxQ0EZKWOUduSQc0EihQ4AnWKsQpTHbjmGBmxVJq0d14YBBpwNbkWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbjlTupLybRy2TpOxPmx1xurJnjpIia96SC++x1jweJy2RJaH+
	6F340CiWD1Z88sQnvr/zLV3CrAuh50wdSC/yyTzLHF5IKcesX4Agfv34+sf9X3zpOTz60lMXv53
	hXSbubt4ohvCgL65j5EMhOnjXKqG+lPvuPE6+3uVZQIi+PWoSqMEA8OsjOSWBDa6NiQ==
X-Gm-Gg: ASbGncuwjQAE3oYPkm8zr/kZzScozQKElXt4+Sb2WPoRegpUrFvw78tbMTx/sfNJLxQ
	M5MLjT7GKOxyZn1PFOwpFVWy4GP0W3XVGbQFiJNBWJEBE24VSuY7lrv6V+ppZVU/pIev2zBkO0q
	t1GemrGTahzaAq+kzOMZkrftL36GeE+LkMUiS2PgJDeUTneDy9GvYlbGtmi6k6jxCzpvv9vVK+0
	T9+DV0WoIqNMcrTEcJQln3pVhlPUhc3SzXV+AxW/Ja12qq3gf6LUevaCUmCArPQYJNRp5HbQwjd
	PgmKU9jLUARldUuKEzvKDIc0889ZIn4FKklAAFO5+BPOAMhgLbjpvg==
X-Received: by 2002:a05:6122:1350:b0:544:6eb7:d7c5 with SMTP id 71dfb90a1353d-544a0187a95mr3685730e0c.6.1756829550435;
        Tue, 02 Sep 2025 09:12:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHM3vRwfPIV8V0hlmG1KA1rjX80E1m1clCk6mQUXwD0mRnXeSdFwzJVJAbKxGaDISecgb5Kbw==
X-Received: by 2002:a05:6122:1350:b0:544:6eb7:d7c5 with SMTP id 71dfb90a1353d-544a0187a95mr3685721e0c.6.1756829549919;
        Tue, 02 Sep 2025 09:12:29 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f0d32a2sm309894655e9.9.2025.09.02.09.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 09:12:29 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, krzk+dt@kernel.org, vkoul@kernel.org
Cc: conor+dt@kernel.org, srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 0/7] soundwire: qcom: add support for v3.1.0 controller
Date: Tue,  2 Sep 2025 17:11:49 +0100
Message-ID: <20250902161156.145521-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68b7176f cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=plMaQY1jPcDNhxvH7e0A:9 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: B-rPE5XGMT8LIp5_A-E0CA6U162sDRtA
X-Proofpoint-ORIG-GUID: B-rPE5XGMT8LIp5_A-E0CA6U162sDRtA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfXyePK9YzHLGd9
 g0g7Gtia6ZKlPqLemdlNgjRxaRWSXgduiYly6Z1tQo3WPVSKBPJcZ/ibLL6kgxJ/mU8A7Ca4m08
 YFI6eLluPo/V+NZ0hCYQj2HTijoj/ZHE0hW/1mW9yOSGLs7yNOq5jxJkHgiwKeJadwzKphtljlr
 1fUAesRJ4qwg6Nw73RepdH8Q8YJozWfXkfZDj7myRxePkLKct4CHbtVp1QeCp0lDkQZ0O4pX5KM
 ryrGer2nIckRo2pDEsdFuuXf3daUcYSpHjn16MgbLnwr4VNz2b9pZh4SECgKB2F14oKH+73hQTM
 /D6vEOhNTuuUs6hY8bQhOwuQvdoHRcevDomun/gL9NztsU6uMteTlUCoAz9s4tA/+J8i/yCpFdL
 SOCI9uRG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_05,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101

This patch series adds support for Qualcomm Soundwire Controller
version v3.1.0.
As part for adding this support, a new macro of_property_read_u8_index()
is added so that we can remove the qcom,din-ports and qcom,dout-ports.
As v3.1.0 supports more than 17 soundwire ports. Also due to change in
the register offsets, new entries are added to the variant data.

Tested this patchset on X14s and Glymur reference platform.

Thanks,
Srini

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

