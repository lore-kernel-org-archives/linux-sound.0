Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F1E2F9C2C
	for <linux-sound@vger.kernel.org>; Thu,  4 Sep 2025 10:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756983410; cv=none; b=A/Z2xEG8HgJh363EELNH2ciyTuaHGUuaBNA5rfU6/DK1QwkXVzuqpSL8KKFGz7+eKi7LRiXHRaEDT7VFzNzuqdXViVQZ+Y1tFBccNw01w6V/6iB0yP58Y7kweEbeP5lhNMMYxRrsmVDfrlRMtJKU1qXckFX/8vAAyV7wOGXPNEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756983410; c=relaxed/simple;
	bh=v5ysVI2U/oh21lZONgkiOffTVAxpv7ka1beglSqt7zs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B1xrkXNzNdHV18oOSmUd/6oE6sq2ja5RniqCy4LuS1UdMkLEKVuhljtFB7WTi9pzLnyX/8x4uuQDwNBGkN6Bh1cxxEHDFlLdgeiIKjb1gcoYdgQlPNoWOSeQGTDhHK93uso8fi2+Ms57KGdRL0AF1GnW/xik/dsUwEbEupN5Sf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JDgdoIht; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JDgdoIht"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849X6tt013961
	for <linux-sound@vger.kernel.org>; Thu, 4 Sep 2025 10:56:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FBClr38gw2V
	NN9TJfggNIGizEzrQ3dx3VKp0vsyukpM=; b=JDgdoIht852f1DRcyC5/eUmn9yU
	UYPvJmlfgn6eQcugiTitE5kIUHqqqeiJ88SJOnIChZTqqnjQ5nE4y90SD6ReGuvO
	Z1ZTha83+L23c9Vb53h+GPgvt3BTINzsjxOaFoSkFrOIQ+WKLwq4QAuMJyzRhSC8
	s0ftWWrH5No/YdaCek7oX4NNd1zW8YqJ9mXIw5+dm5Sxc002tIYS/cWkRW+I+BDb
	v6aqnjbFiMMeCrx+3MzvryduApQVJB5mqMdZR8cOBgBXwpUXFFfl96IoGpvKma8e
	pxqou72B1nGWtWNOF57skT2cFidZCUyR+qS+ShD8ll0xfH5Gx9EuYaF18aQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uscv7bxh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 04 Sep 2025 10:56:47 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b311414656so24648431cf.3
        for <linux-sound@vger.kernel.org>; Thu, 04 Sep 2025 03:56:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756983406; x=1757588206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FBClr38gw2VNN9TJfggNIGizEzrQ3dx3VKp0vsyukpM=;
        b=kSdhuAflXB/hueqIgAD4tRW3GLlA9yzAzv4/wO9MViyWMoi+mBpjJZ+rh6V9QVxDWI
         +nRvtoODCL0r0c7GV6fryqJmP2lHcHHQIhrPCZ2UtBEJV36HpZIL4jUsfHbAd6pP1h8T
         Tjn9nDkn1tyso3cAiimN0P+mB/mQhpOjGiuiWIp9/oVIPfSoZAe60GkhC0eIlljZPBV3
         tGUEKxpLII4v5bli2rE2ALl9AxpfIWhEgl78qvbV6CgA8NWI58sGY6Pqu46KxIO1GzPM
         p+LB0tMdiX7Wr1/nnE4eQLs9lB9LmMxYXcurnD8bUufLkHeEdPujzLZ4YcJTkTSIk5C9
         XdyA==
X-Forwarded-Encrypted: i=1; AJvYcCX0NaMjRauRst3B6GLLvun1BML3HjVsKl9yhn50djSmygbQc+e0LysXUxqP9aUe6KW9fW9Q+fq5fb14aA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwbPonIsOOpVBgNyooOM+AFfSte4z+IVleBEu6dhn2cBY/Bo5p
	glIz201P+lnutAf2TntuD73RN9JY/7YpQXYahieeZceEsFknVnB5rTKLIEcXF9I96XVV6T2lKyP
	abWF8zs4oMsbmhQzdDfIzsoS7v3jA7cTk+Q5ZJjPHhKjCN0Z/WzAGZC1Eof2S8XJGlg==
X-Gm-Gg: ASbGncurc8UWKzQ33OHooJE32BG5scrAyUT+F+ozaks9m1rsas35si3GopHWDi9ec9L
	QI9mNOtRpdmLq7kC0F6SYnClGrvcyE4wlk2lU+MS0BdUUbxuFM5DBb9rxFRUNRapIDvgBoQh3i+
	F4w4+1n7fQV+IVK8VQi+3vrfGyMgXqL2eDejNo3Za3+KRuWP4n/OTlWY/xCSqOIK2ePx9lkvjeW
	LzFC3Ix26fb+L2twv+52CRwWeGuhBmDCzvqbHcirmyT6je9lj+dC0aQAPshkwtHZZRDmDynHP2Q
	B/AIB4w/mJVZDUA+GV3IkmDD688bVLJzdWuKP75KkWi6ZRx4jYf3Ug==
X-Received: by 2002:a05:622a:1a82:b0:4b3:3b2:2b4b with SMTP id d75a77b69052e-4b31d54719bmr224577071cf.0.1756983406016;
        Thu, 04 Sep 2025 03:56:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9Eq+sTL0nIIar6oejvztAYlvZM7LWk+ERntFJ4ZL09Ftyz1SA9hlVs92DGAObdcdb4gdjMw==
X-Received: by 2002:a05:622a:1a82:b0:4b3:3b2:2b4b with SMTP id d75a77b69052e-4b31d54719bmr224576881cf.0.1756983405617;
        Thu, 04 Sep 2025 03:56:45 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d0a1f807f9sm26462334f8f.38.2025.09.04.03.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 03:56:45 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, krzk+dt@kernel.org, vkoul@kernel.org
Cc: conor+dt@kernel.org, srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v3 2/7] soundwire: qcom: remove unused rd_fifo_depth
Date: Thu,  4 Sep 2025 11:56:11 +0100
Message-ID: <20250904105616.39178-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250904105616.39178-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250904105616.39178-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMSBTYWx0ZWRfX8Se2Jfw01uTg
 WqqEa+/uUuttZ8iIAg5qazPjTzt7k1Jv0Awybikpe+9g6xIKX38pQhyLfsd8gp7hhSfN1qN06ni
 sEbWafJ39suEFed0xMVPoYa0TfuKW7Hlxi0yCNnwFtp+Ycmy9T5lY9EJyqnDagZWJ4PHhOIBnSr
 4gZdTSiJRBZ/eamyEdSm4rsYeDEcucKZkN25wMlT27DzY+z+4/eGMUWAZqdhkDpmLxwNfN2yPUN
 gbw1SeOGhjgyVwFX1poxV6+AP1CI1RLoZh/yLJBkfBoxw8NpW7P83DCyuRgpiI1GgtPR3yqPRkx
 lwCAas5QijBPM8Sc/m5zJMTZYGZyg9QUkLpyddCB6Qk/Zz2YgIl8ksObJ0KJxzDdiLKleZ/pE0N
 UbRC6OIL
X-Authority-Analysis: v=2.4 cv=A8xsP7WG c=1 sm=1 tr=0 ts=68b9706f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=15vvQeE90rD5c5FzQNIA:9
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 5lKd3dSYVJ8qdJkHxrARILdFQWnUrH79
X-Proofpoint-GUID: 5lKd3dSYVJ8qdJkHxrARILdFQWnUrH79
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300031

remove read fifo depth field parsing logic, as rd_fifo_depth is never
used in the driver. Cleaning this up would benefit when adding new
variant support which includes adding variant fields for rd_fifo_depth.

ex: Glymur has this rd_fifo_depth register fields changed from v2.x

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/soundwire/qcom.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 5b3078220189..f3ad53ec6e76 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -209,7 +209,6 @@ struct qcom_swrm_ctrl {
 	int (*reg_write)(struct qcom_swrm_ctrl *ctrl, int reg, int val);
 	u32 slave_status;
 	u32 wr_fifo_depth;
-	u32 rd_fifo_depth;
 	bool clock_stop_not_supported;
 };
 
@@ -898,7 +897,6 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 	swrm_wait_for_frame_gen_enabled(ctrl);
 	ctrl->slave_status = 0;
 	ctrl->reg_read(ctrl, SWRM_COMP_PARAMS, &val);
-	ctrl->rd_fifo_depth = FIELD_GET(SWRM_COMP_PARAMS_RD_FIFO_DEPTH, val);
 	ctrl->wr_fifo_depth = FIELD_GET(SWRM_COMP_PARAMS_WR_FIFO_DEPTH, val);
 
 	return 0;
-- 
2.50.0

