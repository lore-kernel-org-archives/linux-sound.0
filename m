Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5213267B01
	for <linux-sound@vger.kernel.org>; Mon,  1 Sep 2025 19:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756756246; cv=none; b=XiOBBwuuqqjmDfPkY1mU7alICOuIGmmTDK6i51p8nY8xRL77z2MyE+ofC6iz52/5b1w8OFJH0fIiAIaNcPgSSC/CSpqkHeHqxbNfd9+OyWNowHU82BJwqOx9GtOq4TsJA11VtlvhR6wkKXGr+ahwJR4MKEAoCMIMKwA8WmeEBSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756756246; c=relaxed/simple;
	bh=AHDigbA4loghQH50YBF+v6gAajTjrpbOVptFQwr8VLs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Iz2pI/SlJqupzOPrOVBEP9gNY9FkJcybyD6DCJzw9svNyquGbnH1Akrxh4gqjdYcGCyAR6bTY4YCWPMkd7iDiR9uQmJ7eVgL5ItiVhFJGmf9CAu0MPa7BBfizvAdRlQo2dyq5/c+/nq9ltKPUPGYlMREZC5A0O4Obal9D3afrvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=imyTR3qp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="imyTR3qp"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 581B43D7015228
	for <linux-sound@vger.kernel.org>; Mon, 1 Sep 2025 19:50:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KP9gxy/yT7A
	kFjO18af3WMChPo0w9IcOx7eEoNmhqBs=; b=imyTR3qpJ/C5LAr8nmjal70PFbV
	AfryiOjG0FwpPcJTjYS82crnhrZjBauAOsF24kmQDDQDEMkpAl7gHPDQlemwslIT
	mUy964iP+WGjOZUj0MAY/ZpNPyddn/rxzz/11demA5d1iCW+OP2NXFgpK5JxSxIM
	/pYXYkLDefz6zQSt709zhXMRgF8MsL/FYPNnHZiki+27rCX5BNNzRqEN0hxymVf8
	JoUbPqgPJMgDZ/smXQlHZDi5lLSK7ePF4Tzo4gBRNLjCOIk4Wyj84zh+CgT5UOHy
	6TtLGPZdUX//gkus3z4SCunkE0AFsKaZdtw7GO98Qy0AUGaHoQwAV2GoNYg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48utfkdjbs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 01 Sep 2025 19:50:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b31ba1392fso62116281cf.2
        for <linux-sound@vger.kernel.org>; Mon, 01 Sep 2025 12:50:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756756243; x=1757361043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KP9gxy/yT7AkFjO18af3WMChPo0w9IcOx7eEoNmhqBs=;
        b=JZvzompUHL0t1IUeKspyUDgqplQ5VnIcCsvBMBSZoCru1Dkqwaq+1p+23SWa0j1Vmc
         uMzKYBOHxLAbQP5vLvAQM6/rO/7HGBJd1pAWvKdt0RqSzcIHgNHD6UtLYwZp0aOZkbzS
         aZIOXaBUfWT3LSxzY28M+pcCxhJa3BXMZ3rZayj6tQcH+kXglvq6ImNbz6CjcLIbr6HN
         MZdxFbrs9BhpkR58wTIfPMmSgC5krSbCUmEKseQzaLIyfQGjGLN7MvNhrbWwGi3TU2Tw
         bjvjcmCPUQ/N9bMxITwuFT6X57TSNmXhoIY4R0Z/LAPEs8dW8vv+FusilnSyAIplI0fe
         Po3g==
X-Forwarded-Encrypted: i=1; AJvYcCV0RdvwthazohGLRyC+lbUqU2c1Sbj3jebt1KtVgyP1DLHAE5s4ngbswWprxKPsqjsW0THTJ1ac5GUbZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0KfM6RJmibwLaTUx8SqzO3CKi4fFj+yaujXu5YdqHdlKiJQOn
	mARw6dHhsd7kodwMhZ0NhRwET06LeFDEc7PZmNoEjdPWlYARW4TfGWN43wDufFD0NTrzKGG08YE
	NQmfEHLN6bRFYEevfOoJG55n47SLgYwUsICBOx/2Gkj+L+CIyXUfd5Ub5/s5mcfLovA==
X-Gm-Gg: ASbGnct8byfSnqf20eWig/Kb7WBGzhlEQUiA24FFi9zMfX+3stZwdg3wLrJmRTNCmV1
	I5iQUvBIKiTPBaUKVnyBKMaKGHkKM6yM1MtMUkmRNiPjnReRQqmHdrk/PMiVWh92sCPE2EKJxyV
	OASuyCrhowawtPPCPJH4ZiTaO4H5iw1ORj+Er5KPz8C/c0Qqm7TOgtLN5gS9UBrGDGn7P9NfmC+
	r6t18LKRb++6LoCHPqzT76ypssLYTcj5LILAbLY+Nh5CqaVXtv44XhArTOBUZ0Zi68ahN2cHmHv
	b3prO2OwDH+IAJGvNH0P17Q2oK1Ia7mSrFtaJ4GF3pEMbRFzGvJ1Mg==
X-Received: by 2002:a05:622a:4c0e:b0:4b3:19b1:99d4 with SMTP id d75a77b69052e-4b31dd773bdmr129174911cf.80.1756756242750;
        Mon, 01 Sep 2025 12:50:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHan+WHaBp9LzvOWoHXnc20EoeTJqcyjwxwQPX+w8HoCdoNYZlsGeTqQbkfBLWcrpSldlgPsQ==
X-Received: by 2002:a05:622a:4c0e:b0:4b3:19b1:99d4 with SMTP id d75a77b69052e-4b31dd773bdmr129174671cf.80.1756756242367;
        Mon, 01 Sep 2025 12:50:42 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d7330e4bc9sm4653705f8f.10.2025.09.01.12.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 12:50:41 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, krzk+dt@kernel.org, vkoul@kernel.org
Cc: conor+dt@kernel.org, srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 2/7] soundwire: qcom: remove unused rd_fifo_depth
Date: Mon,  1 Sep 2025 20:50:32 +0100
Message-ID: <20250901195037.47156-3-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=eaQ9f6EH c=1 sm=1 tr=0 ts=68b5f914 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=gsLITZHy2-c2cRxuoYYA:9
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: BI_p2Odm6zJztzRWmWQtmDSj7EUXYH_R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDA0MCBTYWx0ZWRfXyT9WBdE0AF+m
 5qZBtwATW14YAUpv0izpjFutqDksoo6i4g4d2DVsU0TaObzDPO4TxOdSl1LD52PTDdcKAOXumUj
 zsswtSl7wjd5Dfyd1Iwp2vvhBaaSLPIBKVF2vsIKg1oC0x0HBKy83/CwC3ae8YWVo+dsTP7r2bJ
 F9DNDI8Y1YNRmVai5AaK295BarpETP8rKAB8LC3dBQ5f+AFcZYksl8FYRrdxnSeLkqMQKFELqo5
 /i/RT7eLTT6MFvu8ktrWMeSKM/zJA14cEEcA0ndDH1Eg8FbI6NQZrLfmB8mDCPy+dPlelXL3UQ5
 ETLWDlIAVySF33/hTHCm+eybpnbyan2to95ED58E/sAo7ABvROlDpuiBGbZPtDFcFRfxgxsGTul
 R4AEG6Rk
X-Proofpoint-GUID: BI_p2Odm6zJztzRWmWQtmDSj7EUXYH_R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0
 adultscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300040

remove read fifo depth field parsing logic, as rd_fifo_depth is never
used in the driver, cleaning this up would benefit when adding new
version support.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/soundwire/qcom.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index bd2b293b44f2..7f19ebba6137 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -209,7 +209,6 @@ struct qcom_swrm_ctrl {
 	int (*reg_write)(struct qcom_swrm_ctrl *ctrl, int reg, int val);
 	u32 slave_status;
 	u32 wr_fifo_depth;
-	u32 rd_fifo_depth;
 	bool clock_stop_not_supported;
 };
 
@@ -898,7 +897,7 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 	swrm_wait_for_frame_gen_enabled(ctrl);
 	ctrl->slave_status = 0;
 	ctrl->reg_read(ctrl, SWRM_COMP_PARAMS, &val);
-	ctrl->rd_fifo_depth = FIELD_GET(SWRM_COMP_PARAMS_RD_FIFO_DEPTH, val);
+
 	ctrl->wr_fifo_depth = FIELD_GET(SWRM_COMP_PARAMS_WR_FIFO_DEPTH, val);
 
 	return 0;
-- 
2.50.0

