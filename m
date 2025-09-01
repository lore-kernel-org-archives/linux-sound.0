Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B878E32ED36
	for <linux-sound@vger.kernel.org>; Mon,  1 Sep 2025 19:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756756253; cv=none; b=U4RMZw0xr+twtUBPu8iMtIkVCbSgrEyl3hEvuB3vXucio+RqHDnJ9iDOpdzZQ5uk99E9ChcFNbmOoPOvj9vbw1feNHqSOPb0q8WmXk8kMRGFEffGXxQxxpBT3wm56yyTn+SNEQZ836WLwBpo5Sdq/K58sesLkFXRscjCg0Brm2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756756253; c=relaxed/simple;
	bh=bx7xXt09INExowWig9UQmTy/cQC45Wj+RdPxQaj6eJs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hn+glilJ8NEI3OBhNACUxT0eheKe41z/cODF5GflMTmH0d8YZ+qZ+Em6YY273UCfcJ+dBQA1CcdKt+5uMs3N/S3P/vZAtW8Y1Z49WJUc/bCJOZw4mqm1URTdedJsr1bBOanccz+kpn5SwCFQf9CV5jLHBc/jDCyY0E6nLzayHPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ym9JeLuI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ym9JeLuI"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 581B44DW025475
	for <linux-sound@vger.kernel.org>; Mon, 1 Sep 2025 19:50:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4OX51qzRIUx
	I3TxBnN+NqmhONIP6oKsziNERitS5R/o=; b=Ym9JeLuIHDyw7dbUu2zNae3C5IR
	bwq29MgUmO9XZsYSVoXpdMqK+6W0mxGNTLVTehnV7styf9YUN9+cm/BiaVx7WEYW
	nxFJLH/BtIjCTLhX84ekkiHBNsA9ZWm3Pm/bpvntxUqKLpNiljA2RWG1hYKWbgV4
	xWrkwRN9uwL/mCJFGf72mAeISP/ZVEGmYAP6SdRgs0g3gtoHtuJZwMvtsniJCuKr
	2B02GDjyhz+d7bx3MxLimYDaLOsOnExAF6ubgdmC096zhLwqZDW0kZtKkgKfarwj
	5wvOMMdlksfIAIocB9DNwT/fFPBO1FAhZh1vMSyttRMtb1GuxROEw8tgKeA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urvywq08-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 01 Sep 2025 19:50:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b32a58c3f9so37987251cf.0
        for <linux-sound@vger.kernel.org>; Mon, 01 Sep 2025 12:50:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756756244; x=1757361044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4OX51qzRIUxI3TxBnN+NqmhONIP6oKsziNERitS5R/o=;
        b=VbXvtmtbvEvR//+b93+eATrDH14pFSQMdCPpsSguvqqROJMwNLi4nm4AbNMSEuazuO
         WsU00f8mLQGvg6ag8+QZwr2mby7Gbzo8y8N+e39CWfuX5+oFMxvx0n53nG57oMuO994e
         v+klVKDXdldap08rjXbLRGedimjGIsKcvdfwHBPecaYZWWjHnNouOGLw1SBvkjQZi5B1
         qMGo1kUBMFXzcl+1pHDAZ9KEXIXyE4HOcLsJ9AISJu5wMQ8ui4vlQ/7L0eQ/smTsWT1G
         1ocuplVOMsu7Y+ejM/+tHM6phahZ5+La3QAKpKMC6MNiJCNWM3IqhL3DxxA+5IZZFVLY
         vtGg==
X-Forwarded-Encrypted: i=1; AJvYcCWNvxpjwa4yJ614SM77QVeSNXqhfRORiKqeZ9ZfXsTWCMuaaBbhiKGVvVmBX05XCjf3D08v0qRkfxF2uA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzE29kR91LSFu1hM7UNjbL71wLIp4cof6aUNEWWvDiExw/vNo/D
	cXILhFYHGlZRwymx7nunU4rTfCQBLZUD9no4fGALAMVZolXdr/pQot2q81/6J7xERxcz6EYNzWk
	nfzSGGAn18K1fm6rKOJUrUvtIEV5iV/q+3Y9DHk0ubV67GygZNeABWE6q7//5RqVVFA==
X-Gm-Gg: ASbGnctmoFn0rHI2JfemAEPpQt0+ktyEy7ZbSWyux9ji2rPYCht5urU6O8Ia4YFKUx+
	hexY2uYdDhAeUTKweJL/AZYIe8aEm548UW/OS239gC/VGbp6fm2kH3L9vA66trDUROSRiDuLzFA
	E6CtqCnsjqa73KgK2iCPXjVgLaYLRHBhmZ96O3SF6VZy/Q18kgbXEFmdPFHIwkM7DOom7uIKPom
	+4sdaq/7JQW5xOORQSqwSgejy3SEjchpkjVLaXcZgElD3DmkDbNExAuvOoQeJdcUb+SyoM6+/vD
	RwJYZs+Vo9q9qitStZ2vwJmeE0dRrOXS6xH26v9eMBClILxf8qW9wg==
X-Received: by 2002:a05:622a:88:b0:4b2:9b6b:3e with SMTP id d75a77b69052e-4b31d87474amr103595191cf.36.1756756243914;
        Mon, 01 Sep 2025 12:50:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdtsZTQ5yA+DGAmAaQ3RY6b0TRKAlyx8wrOJKs00QBYl04GCg0fn/K9iiKQh4huHt62cr3QQ==
X-Received: by 2002:a05:622a:88:b0:4b2:9b6b:3e with SMTP id d75a77b69052e-4b31d87474amr103594891cf.36.1756756243388;
        Mon, 01 Sep 2025 12:50:43 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d7330e4bc9sm4653705f8f.10.2025.09.01.12.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 12:50:42 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, krzk+dt@kernel.org, vkoul@kernel.org
Cc: conor+dt@kernel.org, srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 3/7] dt-bindings: soundwire: qcom: deprecate qcom,din/out-ports
Date: Mon,  1 Sep 2025 20:50:33 +0100
Message-ID: <20250901195037.47156-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250901195037.47156-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250901195037.47156-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 1JduhwOfxmDb_CQ-hQym7gQmGr6LKava
X-Proofpoint-ORIG-GUID: 1JduhwOfxmDb_CQ-hQym7gQmGr6LKava
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX69WYUSAmdBKF
 ysAPWralAfbin53vxXzlTDoQ1RQ0sJOm5lDDwsFAhGEqf/o9nYq1WJduiarhxYVsiFJVZsGRkDf
 3XzyhcWBjpsybUSEuttPdgFMrmpoOzpjJLbXnREa7IQJH8Bwt48PTE1MqhSqRTUfmjeTp7L1q7Z
 P4Y6Zas0SgGl+2Ukh3Iw7zH0Cego8tIBEnRP7+KduEkeuxNfw93B6i+u5SqLeUc7Xsac+4LuitM
 14r+CkzPYUEh7eGTGrRGjTd4PMdu0jg+shZkCMQ0iMdasQYbgn31F1CPZBa/r4bqgc+jJVXiMET
 ufs7dkdd2Axz2kOV8QyiUNxtHweOX+H9budLNJk+W2fvH5Cpkxs0Ei49lyFm95t7Cg5BJc+OCSA
 9dD5Vo+4
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b5f914 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=9b2JUy4lzbIbXjLhPvkA:9
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027

Number of input and output ports can be dynamically read from the
controller registers, getting this value from Device Tree is redundant
and potentially lead to bugs.

Mark these two properties as deprecated in device tree bindings.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../devicetree/bindings/soundwire/qcom,soundwire.yaml      | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
index 95d947fda6a7..7ea491f7e828 100644
--- a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
+++ b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
@@ -73,10 +73,12 @@ properties:
   qcom,din-ports:
     $ref: /schemas/types.yaml#/definitions/uint32
     description: count of data in ports
+    deprecated: true
 
   qcom,dout-ports:
     $ref: /schemas/types.yaml#/definitions/uint32
     description: count of data out ports
+    deprecated: true
 
   qcom,ports-word-length:
     $ref: /schemas/types.yaml#/definitions/uint8-array
@@ -223,8 +225,6 @@ required:
   - '#sound-dai-cells'
   - '#address-cells'
   - '#size-cells'
-  - qcom,dout-ports
-  - qcom,din-ports
   - qcom,ports-offset1
   - qcom,ports-offset2
 
@@ -257,9 +257,6 @@ examples:
         clocks = <&lpass_rx_macro>;
         clock-names = "iface";
 
-        qcom,din-ports = <0>;
-        qcom,dout-ports = <5>;
-
         resets = <&lpass_audiocc LPASS_AUDIO_SWR_RX_CGCR>;
         reset-names = "swr_audio_cgcr";
 
-- 
2.50.0

