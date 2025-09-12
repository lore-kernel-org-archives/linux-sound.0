Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EA02AD13
	for <linux-sound@vger.kernel.org>; Fri, 12 Sep 2025 08:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757665957; cv=none; b=RkDQY6S36UDwALU5XulBfvlJYZvRcSyZ5a1pQhJgaUhLawhj+rdZwoYkrAJ+85Bg0XlGm2mpDGTh3MpwdZnwoiXImknQK0m6bV6MFol9YF+hBg/AUGAzgULXS7WPFZalirdy5ovhicaB68RzzwFWEPDl2zHIV6X/i2bX+fNZyDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757665957; c=relaxed/simple;
	bh=v5ysVI2U/oh21lZONgkiOffTVAxpv7ka1beglSqt7zs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AzLucp0bj9dg92dXvmqRbYGiTuy7uhvQb9+TMvXogbVm0DH5YncKKGwGVNXkry6w2gCNsOtkhdz3yRmjQhIVe5HbFHZHngg2V53Z27qYb9yLLYTAouhRJcJ0oa6xKxEXiL5TCYnj8I6dmv1RoAzd4X8Z5r/fwmZZ23xXFUbCI6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hUpWz1uI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hUpWz1uI"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C7Ql1t006616
	for <linux-sound@vger.kernel.org>; Fri, 12 Sep 2025 08:32:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FBClr38gw2V
	NN9TJfggNIGizEzrQ3dx3VKp0vsyukpM=; b=hUpWz1uIQMMYCIfQP9QHV2F4b5y
	ov6AqsaaYhvO1F8j1qXJYDxD7u1EAupnpzGy2HaLvobLodE+6y5XKgOjn3Ng8pbg
	xGfo6KDbnPADRsj4wV5wbrisXbq6ehvuDT51qSR6hQq6ETiNhD3Ty0ACGiAvCqya
	9dyH4pkm8thDVaFUFP0yXHQc26jxUh/WTh2eIcgRrpLtXi79rHun05t4KTJlmp8i
	CwQun12qTFlWC1PcJxMnK6UdmB+azzhmEHB4EY9/aEm68vDOFYgTiQDMFT8acHZL
	07VTAMPNVRx3YOX0WMyeGwKcrliUt/541esuDW8jsK+H5ACsvIAIMrs8rJA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491vc2ewgk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 12 Sep 2025 08:32:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b345aff439so48210721cf.0
        for <linux-sound@vger.kernel.org>; Fri, 12 Sep 2025 01:32:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757665954; x=1758270754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FBClr38gw2VNN9TJfggNIGizEzrQ3dx3VKp0vsyukpM=;
        b=EArHDQYCqHbI5wsVscS7p+LtN6HpXfUwOPETT4wMR8sXdgf5ptvgdSULuVkr7AEjVe
         C6VrtHUYWilP6YiwVdoQjAkGCoOwhWGeLRug7fQHIukdGduzuRJAQew2fTvTJiimW+PG
         EtADHkSVBo4EHQmpSAJlgrg8x0fLmOnnwgiD45fSf5fin+K7p7yxIy+ZtDyEJlXmZJwz
         5cgX8+2UZfvfCN98pId37fvC/3j2S9Gg59xKb2a9wu5RQTgptm7Cx3YCohz6IsIhJ5o/
         CtbblXUVVZRAaUMctXW9HbE6C+qNmctpFf0nF3Bfn67o4yDeS0vGMdegFXaNxy5gGRhB
         z/Cw==
X-Forwarded-Encrypted: i=1; AJvYcCVYrZhaOjdQFGRfLqPGL4jwc6n8cnhnm+74gll/OdEb3Z9Ct6zDfAaowAzXe2/t2I5zKn/nr73xES0sag==@vger.kernel.org
X-Gm-Message-State: AOJu0YysHmOt1dXApROI7aLOBHbyYeH6brwBwloYe0XTAPTAS+5In4wj
	rkO0WOGW6ma9tGdkR4EEq2JWYCuu0rO0+7vcwCjqkQJPomAKkrhR1YkEcbFCzRSgvovMv1MktgQ
	e0vx3G1s+7MIA+EA8gYrzN1v2jIA+m3oirUlkJES1F2n0Ttppg/MLMzHMRUOD6LianA==
X-Gm-Gg: ASbGncsuxUGRSryV3ueWkE0GrRLrG3jnIE98NUgvJcMoDTYxVRFpP0xwW7R+iUg25MP
	lWCXk7SESOqKqQFDWdgMbbaMAnxMXtGppPP4eDcA6tk2/SVnFuJjWw0DQ5xRx9KCV4l5/JqGaqq
	839Pm+N9q9HwUo6FYMkNnUqZXeQF1a1HoXN5B87/e/8yzp8HYSnaV0IwLHv5S0L63jrvxPWSqnF
	Lvt93kiH1tmkM41dLLwFqh86H2RF82gaGOG0Sm0v3IbPZp0dJrvI/P7xiqCOtChawa/86dXBN7e
	4UdJ2GjNRjL3y7yem5DzqVuRhkAwMJiswJoO5frMg2/UjI2LrW6nxA==
X-Received: by 2002:a05:622a:59c7:b0:4b5:6f4e:e37 with SMTP id d75a77b69052e-4b77d0a6081mr29069871cf.25.1757665953784;
        Fri, 12 Sep 2025 01:32:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFopUZDavpVxdanmw7MtaP01Mue9WsZ3a5xgclqjjwJJdUVbfjz2c6I747Plj1V/W5+wG0V7w==
X-Received: by 2002:a05:622a:59c7:b0:4b5:6f4e:e37 with SMTP id d75a77b69052e-4b77d0a6081mr29069521cf.25.1757665953185;
        Fri, 12 Sep 2025 01:32:33 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e017c1dd3sm31247265e9.2.2025.09.12.01.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 01:32:31 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, krzk+dt@kernel.org, vkoul@kernel.org
Cc: conor+dt@kernel.org, srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4 2/7] soundwire: qcom: remove unused rd_fifo_depth
Date: Fri, 12 Sep 2025 09:32:20 +0100
Message-ID: <20250912083225.228778-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250912083225.228778-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250912083225.228778-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FN4bx/os c=1 sm=1 tr=0 ts=68c3daa3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=15vvQeE90rD5c5FzQNIA:9
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: ep2okGUlFSNbiUDPqeSwWIR9j1RXkuH1
X-Proofpoint-GUID: ep2okGUlFSNbiUDPqeSwWIR9j1RXkuH1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA5NCBTYWx0ZWRfX+ewoo3siQRQq
 gJydoE1XJUPXQAVjAF8RdbhoE+W9tWhLbUQYfN0GLJv6SNYBtIgCwpFe6lJYBboBnNsuanVeR09
 Nh3PCO7IrgI8Pmof7tqL1qotzhGD7PyBsH/IZct4bGEeHLOzuYhd4/Ag+BRAGari1LAdnIo8ku3
 smcmSrRSzr8S4sWc3ajc/HKb9dKhK3nQ6vBY8O7qU+DhHXdDh1iZh8mQLsjqZL2oZDmOnpGSfn+
 JHph/MRS2aFGdJFWsOaF7mM25SB6ldkMMfLzvv54ZW3hLd0hAHxSWSVYmxkN1HL7DSKj+mx+rPb
 ftNwnhcdGNePWXIUGiWKK2Aa8Vqg3h01RhC1xl/NZpM2YMDaIIFZaqUQI8BzUKvqiI03+ps2vJM
 OHOFO3OQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_03,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080094

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

