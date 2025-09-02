Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31C8305078
	for <linux-sound@vger.kernel.org>; Tue,  2 Sep 2025 16:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756829557; cv=none; b=GiO/bIf6TijrjvKft1DwledQIBF8oFARXS0K4bhOGtEJlgn4w4gyLrWOoP8Oe8HMz/vV92KTa/NZF7uGXSLtJSq2Tpqe7RAvmBim649d/7KUQarLQDItgcZiRFMCuOcQ1Ik7Ej7DPI7RT9VVuYnCqfXeMpNSjP3tY7rvXNnN2so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756829557; c=relaxed/simple;
	bh=v5ysVI2U/oh21lZONgkiOffTVAxpv7ka1beglSqt7zs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I4mDByPmjcYslXPWfxYqLexKLbkObNlRuh/hmlPpnpIftc9GjMQnFaemfH9OIo0ypwVjDbMIBKwqKKLjYIfVqvqTTiXC+3/ov0K2nBzyLkpjabn/1ds+OMkPesRHLfZMs3J4e6iBaC2PPjIA6y/iS8utWmp9qmKGpZu0xNJq0vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PRjkfmjZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PRjkfmjZ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582EqbmE026033
	for <linux-sound@vger.kernel.org>; Tue, 2 Sep 2025 16:12:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FBClr38gw2V
	NN9TJfggNIGizEzrQ3dx3VKp0vsyukpM=; b=PRjkfmjZVrhdujxTp/0KN19OSOu
	oD4CSmYY6yT6/bFoTkcGWYboofbrx6CMwyRNdj5c5cd+58h3qGZ9Y8LNmOdbxfsI
	1ACKvIW/zrQr6nW4+rG0kJGKJ5jxWGMPwtFw1EE8lxzzrZ7pDjncYKhQBiCwbDEN
	S6waX3MErnUY6wMxEiDuJmGocANv+IzwbywMX1DyfIm6aI4fYKqkNzZAnwvhwD1G
	7/qfld1X6J5rCP4hyrgnPuUvBOs2R57BOezHwsenOaOe8sxahU+ulRNUArN3V3vF
	QapGSc6rxDs567yQ9LmNHTzlUM0HGQW3cuoDajDwXtsy99t4Q50N5CZ2C1A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uscv0h9t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 02 Sep 2025 16:12:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b35083d560so11344521cf.3
        for <linux-sound@vger.kernel.org>; Tue, 02 Sep 2025 09:12:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756829553; x=1757434353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FBClr38gw2VNN9TJfggNIGizEzrQ3dx3VKp0vsyukpM=;
        b=tm/xG5MfBl43L8w76GYzT0PU9Bebqq+KRnZJjPND37WHSDuqdtrftqk+qpRrlJBsKI
         sq/aNGAW+c+eU8CXwRAwwZ3Bj2d1l5un7eta5i2xsJniBc8ab3nKNxHtO+RI5WGtkxcq
         6g5o2dggwwnmzgTRaFDZGq0WzYcZupEwVwUPdtt4ZzaylCYGOVwhydOY6PMO9W6Lkl71
         wk8xpTEYBR0GvCzi75604O26yhPHAGlLIskzQPijenUJFByDuvLvyXoSdOhPwQE8MD5m
         6fWJsbz2pN5p5zzNGUMNoi6zsSycC9vH9R66S6cqZp3dJSPIxPFhDz07pwToNCLlmd8t
         42rA==
X-Forwarded-Encrypted: i=1; AJvYcCVsDtMKB+75QVhuJnF9AAhTOxYFqOfLriIObBmCTrTzFlgFIbZKNjyMu+Zy7S4hd5ur2e/nBbjGKU8/vw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+A9rCvf53ZdFSYn1yLa013PjkEsSgsrOVcRT7KEz1Tgw98lap
	FlkfmfjnJhsTdyLj9CDvVEsAh2QnVuG//ELPTcDF5fELHlqnFhSsbsZ00TC+OZT9uG/vjU2kIZK
	HKNoFISUHhwOa0vmv4DRkdZKMLHRy53Z/5bEerJyefz0VPnJJJ/ksJxvHQSm6+pBOPA==
X-Gm-Gg: ASbGncuxrL5oz2S79D4EyjNvUvd0tNx8+L0Vo4gvcjpnzxxOKkvcttGcyH8ql+kM0D9
	NeZo5ltZabkhiAaVk5AcxIO4Bxk1YJVCAKNM/v9bTWHocEsGbREncmHxH8R0/e8aRpUjEwIYdK4
	5lRA2i6nmi9UhWnxXmb7uYswAZUSCtp/m4VVIBskGrsG2vfgW7MrICeoNtxpT885YcdEOWIpqPv
	PT/Fp4J+lMV+DeMjTMjWYFAxuAShE3ZL6TEbKnP0RKkfZ0JiN1B1z6ZxSUp/Q0gpLLIintBZUwF
	kMmKlx/eeq1zbz9SNi4uJkvsJl9G0QPzntNV/vqVomuT/GS0I3UgUw==
X-Received: by 2002:a05:622a:14ca:b0:4ab:ab85:e54e with SMTP id d75a77b69052e-4b31d80cc53mr152153221cf.8.1756829553291;
        Tue, 02 Sep 2025 09:12:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsGjZF02rEJD3yKsiyNOa8wPgkDWZPm8ITvjru/Ed2/JjnkJXpA+dt6iKLIxEI17rRPUQYhw==
X-Received: by 2002:a05:622a:14ca:b0:4ab:ab85:e54e with SMTP id d75a77b69052e-4b31d80cc53mr152152601cf.8.1756829552632;
        Tue, 02 Sep 2025 09:12:32 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f0d32a2sm309894655e9.9.2025.09.02.09.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 09:12:32 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, krzk+dt@kernel.org, vkoul@kernel.org
Cc: conor+dt@kernel.org, srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 2/7] soundwire: qcom: remove unused rd_fifo_depth
Date: Tue,  2 Sep 2025 17:11:51 +0100
Message-ID: <20250902161156.145521-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250902161156.145521-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250902161156.145521-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMSBTYWx0ZWRfX+A/z6bLBa+4Q
 UroSe/mZV+mou+wX4V8oYWRHCQnBZh8gxcNwvGZNrhXwQ/dOFAexGSVlwKlplAV1+TjK6od6QpJ
 bwx0CAFBhnc2o9BHb2CHZbglLqYRZDvrHP6eW3AnTPmJzQ0M6Wfzfj4KMXfS+/W2FSpDW+rgxbU
 ziuCUyWBuEh7uET1rJhLFPp0R50gcpCtR6eXu2UPLdFXfB3C2TwLA5xoGNxJG5QWMGaSaFuOS6q
 musgG7WxPoyFL0hgrHNcO3hdfR8CnsScZn3U0yVOcCQid0/oQp1Vs2jhWw+pvpUB+ITiQL/ZM+2
 mSZXYbI+mE7glKYXh6KJsGzxoN3y3UCyliYm2F774y+wQrp6SWdgsFLXKpXrYY2skbFoOcEosCn
 BbSw7UDL
X-Authority-Analysis: v=2.4 cv=A8xsP7WG c=1 sm=1 tr=0 ts=68b71772 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=15vvQeE90rD5c5FzQNIA:9
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: KsYVqaxEqoPjv0TZGlu7myECTHu_n-1c
X-Proofpoint-GUID: KsYVqaxEqoPjv0TZGlu7myECTHu_n-1c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_05,2025-08-28_01,2025-03-28_01
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

