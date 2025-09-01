Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1E71F8724
	for <linux-sound@vger.kernel.org>; Mon,  1 Sep 2025 19:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756756245; cv=none; b=WHqcpy6xH/SRUBS4MCAMehKp5JGXMiwzxdcS48m2DfJ9AyY82j/KgcGh+rCLkrzmrWMLeKjZv9/JGcSmbi+0f0Wq2Ny1+2rGVjTWX3dp3ddW3lyiOZI27JXmwr7jDP8dgtETL8AFN+1Y/BTKi0SWZLfF92lohfdvCAmQl1yQBX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756756245; c=relaxed/simple;
	bh=bNozMk+UbMdf0ssHdcWg0zCJ6HDPoJ+No/5V1g/m1to=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FlzDosO/j9yAzPVAC1qVlHON2uB/c6qQJd4Nor8YQqhtgKi7U0oSWIITchBRJ4A6Nj/qrmYCzD5E2iCDs57pQVdIyDNAMEDa8nJYTsxX1yDgP4+jwfsLRLmPMoH6XbCiIVXj/2aTvnD7uC19HkQ11AQMIN8QvLyYegK7ezXBLlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XXAdwQ4O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XXAdwQ4O"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 581B4A9f002497
	for <linux-sound@vger.kernel.org>; Mon, 1 Sep 2025 19:50:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=w3XV8QBS09K8rQoBNwhaUktzkD6jagB21OB
	vcD6sKQc=; b=XXAdwQ4OrL9ZfUxatSNy/05sk+ga3U6j3xkdyq0TtzRxyF7Jdkv
	9hnRricObceT6ZeJSmr6XuFUrbXpcRCBdKap/c5u1Qg7FJ1b36DDEravHiAF9qk+
	ZHxFSqI7c1Lrgawz+4qxGRBi6Z/Te6RM54kz8cov8/i1IWTQ9uTTt4U5deX85roG
	yiO2QlGKxJepoPdLWrPuuLnWDdOnQwgBv78lU58XjKk+5U9u5I5UudC7Pwpso3wb
	0qmqlZio1yABW59MwdWKLjz3wYsX33hASwz7t8tDVVf7oabKeh+TDzsgG9lPNEW8
	vuLHmCOm0VXSLNord+oqykPqrXgFvk+NXlg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ur8rwrhp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 01 Sep 2025 19:50:42 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b2f9e8dca6so103875441cf.3
        for <linux-sound@vger.kernel.org>; Mon, 01 Sep 2025 12:50:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756756241; x=1757361041;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w3XV8QBS09K8rQoBNwhaUktzkD6jagB21OBvcD6sKQc=;
        b=kmNzUoN8NNLkyDcZaFqCwS5KusvF7s8ZY3YxYOpxt1mLbfva3bXpKkjDt/ZS1AJVuT
         tLVPk+ehidf1hHuCm0NFbuXqB1K86cjvd3Nvhi68pz4+YuiCXfNGEkJtWdk3sgqiq8vz
         0F/cY8fmzIT46Ok0/4wMqHdmauxC+BdC48HbC4woLWkSxCZJnM/FR+fkD+h1m6MmfGEe
         VUTkWAaGnl0Vj1H1HkjaFtTebkTu50RHrCgRPR+rDmgORJLlMc9nAFaQnW5/gpnCk2K4
         ofd7W/Jhso6asLsn0RJe3g6vdCYTENeyqh5v1BBJ6krwh09mZW3kxiyWvIiUFOQA9dMr
         nIlg==
X-Forwarded-Encrypted: i=1; AJvYcCU11H2HGj7dHKcVuqArHMotq32XhscFZ3Hea7Y9mMJ+B468IbBMKQMjx1yC/OWlrgQ1p7T+j5uVooBQBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRSAa6mlG+hoQwjBNOHqlLg1W3VqlqjeTjJpKj2xj2mxOFot9V
	fDoa79m46j+iGqEqOeJisYaGChrft3KlNhJ1xT9STAOXnkkMjRNvGqBhaYTk2BF0GBO+rGZcZZ5
	F5pzCywoiNC4E+ULHaeUulC0x4pI9WhN5gMrOlUgLDC63tb36QSBWlApGhjVmfXvLrA==
X-Gm-Gg: ASbGncttgGyQOLEe2nqilOOsZGEA99FE8N7/Oq26ZjHDZDG5IiUtGNJ9gDsTFWw68eM
	xpQW20IL0+nffrPgPhiewYds436t74+VAPXWIkq1/T5o7fdC3fm7+5ZHEUMBHyU5qjKhaOy2J1n
	g4pCVMP6W00tx1f7WN0VwcwcV1PeiWJW4cGjkpuXnukPFQo+Ut6ePVZsRK/wqqXBmqo/cQlq/l5
	dptmZqKTY7pmGtT39QdpZAXcqlUMe5RSTOFlaSWkzSogy5LlBeTsxkI5edF/kAr+bxo/bg09Tpw
	0gyR7wGUyQPyv/X6/CP7BBGfk/1XPDGRrxFwQok/B75EloBIjjxBaQ==
X-Received: by 2002:a05:622a:1441:b0:4b3:755:3c82 with SMTP id d75a77b69052e-4b31db6a646mr96708871cf.49.1756756240808;
        Mon, 01 Sep 2025 12:50:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNqO+011I8C+a+NWKi0w13L3lHbVjjPv/XfgLwhTgpHoDzYVyuOZp/gX7zx+H3LGRPzX7dLQ==
X-Received: by 2002:a05:622a:1441:b0:4b3:755:3c82 with SMTP id d75a77b69052e-4b31db6a646mr96708691cf.49.1756756240281;
        Mon, 01 Sep 2025 12:50:40 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d7330e4bc9sm4653705f8f.10.2025.09.01.12.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 12:50:39 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, krzk+dt@kernel.org, vkoul@kernel.org
Cc: conor+dt@kernel.org, srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 0/7] soundwire: qcom: add support for v3.1.0 controller
Date: Mon,  1 Sep 2025 20:50:30 +0100
Message-ID: <20250901195037.47156-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAxOSBTYWx0ZWRfX+nusErPgqF2K
 yZqvWh8oiM5LTLEWVVv4SslpWESBdhphgk4jKOSHes/SXkLJBPtaKnejDkiXkrdVopF08cOOmHr
 eD6bSNoWknL5DmImvWE0yf83luWbLKI1PWgU/DAV+SKFPlmnjZj6qPlnO8gepV0uV4sHf9f4xXE
 DnCMgwUPkFb5ULx1BbfBmG3towYPnXn16VyISnKc0+y/q8/NfUQETQF5YN+bmUkAiD3svCHFMN+
 JNHu+clgc1q8Cd1Nciifgn5I2SdVwrMBVSbVmXolpAd07wf8hyF+l4MlGJdf/9m9B84e8G8k5er
 a1LVLhhl82wrq0fW3cVGDojqVO3kL8eS3ECpwFW7JGk+M3kTdkXCip1nvSbCKaXYfdIKO2+xg9c
 ngTFW38I
X-Proofpoint-GUID: y1RnODnru9E9Q2kW6yLtS-cLyaqdakRu
X-Proofpoint-ORIG-GUID: y1RnODnru9E9Q2kW6yLtS-cLyaqdakRu
X-Authority-Analysis: v=2.4 cv=PNkP+eqC c=1 sm=1 tr=0 ts=68b5f912 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=plMaQY1jPcDNhxvH7e0A:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300019

This patch series adds support for Qualcomm Soundwire Controller
version v3.1.0.
As part for adding this support, a new macro of_property_read_u8_index()
is added so that we can remove the qcom,din-ports and qcom,dout-ports.
As v3.1.0 supports more than 17 soundwire ports. Also due to change in
the register offsets, new entries are added to the variant data.

Tested this patchset on X14s and Glymur reference platform.

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
 drivers/soundwire/qcom.c                      | 253 +++++++++++-------
 include/linux/of.h                            |   9 +
 4 files changed, 197 insertions(+), 106 deletions(-)

-- 
2.50.0

