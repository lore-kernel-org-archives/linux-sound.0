Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7F643CEF8
	for <linux-sound@vger.kernel.org>; Thu,  5 Feb 2026 17:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770311666; cv=none; b=CLYwFTYkOD1xEOhgVCraXCw8nH7yqkIoDWLNgzW/eMciI09GqfTf3t5eoTX0M323Ml/tytaTb4H7Ui7kXasy0Eo12L//d/tGag8bfbgun6fRfewdm0JP2Hp580q9/+cjsIvdV9hQu2YhOVYspWQMBzsPsv0TFSOr/ZKqH51sfJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770311666; c=relaxed/simple;
	bh=OpBfp5jqslbORQSzmdK3zOW77Ndk5UkWCXVD4HYaUd8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JP4NYTOncQMA5vh14xIflPX0xnAefjBo7KU1kmFMG5GyhIJvIXIyBOsD/s2cmfpWUIYYS4eIl+8oB949K1+OX02xSf1WJuSvK88MWUwhw0m13R8zH56bo3n1NJGg7AOOoUArDJiHyNDFtn/Nek+gD3YKYWF4jYgjUFNLyxXoMVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dO7xpI1J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PcRw5R1M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dO7xpI1J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PcRw5R1M"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615B4NhW3077751
	for <linux-sound@vger.kernel.org>; Thu, 5 Feb 2026 17:14:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=I8kPziSHEPC
	7tP4o1IoV56rLMTkjFafRmWxkdzxubVY=; b=dO7xpI1J+lqX593XNrV0Diur7xT
	L7ZUseOm+AOjfsgDQP9Qdz+SYhrFZAm0JTXq/x/nqZxoxWrWOYZ2EE1Ck29mYQzl
	HmJ+GkCzcQSqQH45/SdHgmSXzqfIUr8nHBWB/D7tZa+zq2C3DGxzswBguLO/7rqZ
	K7qR59S7DBTyjTXXaEVa7z+SLH/HvAhKMGKWQHbprvSMEhULF5O4OntTWbDRk3MF
	baJrULQP/epFDFPtfWF+dOJ6WkWgg1Jx7DIFHyMTjWmxWtlk5lbWXI2H3N4gIyRZ
	e9pX/8A8imOqlw8pn4iUmO1MC7a0n+o6CZaS2qHMnM9QXdpbh2S3kbdf58Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4t0t15a9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 05 Feb 2026 17:14:24 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8823f4666abso36976706d6.0
        for <linux-sound@vger.kernel.org>; Thu, 05 Feb 2026 09:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770311664; x=1770916464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I8kPziSHEPC7tP4o1IoV56rLMTkjFafRmWxkdzxubVY=;
        b=PcRw5R1M69RP4MIOJTeYQzOVuOA3H3hhQMPUjotTCu4ZdyCnyU6m5pG/4LSS/QCdVt
         /QvCgDxYlaPsJn6MgJiaOUmvxBW1qQxWFdlyRJQN+WLz70lM26ytp8YR7iyZ1uz3apGE
         K8liwiMREtrtc7Stl5xg3hd74JqsJoSbf4HsYueVRD00fyDsM731b8xKj4v4KpqOiDg+
         rQDxu8GONW4sHqe1uqKPiz6BE+w58DnXDgtQvSqYyaiRSWu2aba2YdqdhfVaVYCvzIAd
         Ukk5t5KPwcBp98AX8UYFNkg2u7BCF43Q7lOTH65HS84iMj5+xqEN9bbsgBpXIaBW32Ia
         QhIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770311664; x=1770916464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I8kPziSHEPC7tP4o1IoV56rLMTkjFafRmWxkdzxubVY=;
        b=Xck3ve4Y/Oq54a7Fk50UMvqAAOIIOrkDI4PpkmSpAwduZ/Z9X5OGzc5MJo/5x3NV9R
         02YHwDAxD7vgDz6+tAcKRUy0jAX9J+ZDQpZh/VhSyoQOb4Cr7yJrucjeM/kyBo9PKJdp
         V1CFJV4fSXuEwBcNZx4DBhGDHgDZF0/OGCulpeHW2nIUFLrvIZmsfOKWLZkBqhV24Gnu
         pGemeLSHKprMHb92YmhMAY8Nf76WtwUY3OBRjmP6HgXNCyWzsapUQUpadUPs+xJXVqhm
         CWqIjsATBx/tw89tBaR9D6GPKmkMY6hmaTGLsVM+IWDTqWQ3vz2sV68+reVZ0yLnKRy+
         yd8A==
X-Forwarded-Encrypted: i=1; AJvYcCVZokHaZcd8jV7fNDgv5PjzeZAYj4Rk1Qq3eXEaY8VnvSiN2clqHqA0ymauOMBNUCdp2Wp3sEjIS/D3Dg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxC7fGOJY4/2osQ4Qhzhqh5LpYbEPJF75fxkMXW+Mi4aXdA5427
	ZUCEjHOZ0lcnfe/udGjGLASMhp1fO/pX0BaHIfwsXxvy7ajZPU8rGhY41zhohOwVsXm53OWuWBY
	MkbtmShYzbSGMSxX3unSC3y06n70bn7/9kxlP2nEE5dgTNmN/iW4UPSg+BNYITVUAuw==
X-Gm-Gg: AZuq6aLX2CPO4FWQFOJSLwV/7UuJzrDiJDx3FvR5ohVsKFTDOB61QbQjHqfGD4b8tfK
	x5LgeOyauqJSOcnuI+p3ApCMZnS/V5XzsKrQ+/kgiBsYJjYHtOY31zgyFjplOwVWtUW883h9ZYK
	GxF2fT9cVa7ist/gZnPggOGltM0UwJx86dWhdeBD9yn94nD+MR1WKJ/Uy3Yd35q0MAasjKv3iVW
	be5OT4+UfJydCXxzr9aKKtx4iV7gdLmsBYY8qbUu3UOGIYqXEtWZye8COvakLFjYobi79Uf1sqz
	7XDQnc9439d2vC/ZQmhnaUZpdw0af7C3n9pmVLD1adXG/sE7cpKOSXa9zDRwC8xHk4HYV1CuSB2
	h6Yx8kOAkOJsQz6jJsO/hT8ohu5He6Jy7kPBBET0hQM0=
X-Received: by 2002:a05:620a:2a15:b0:8c6:253d:5187 with SMTP id af79cd13be357-8ca2f83bc03mr899697885a.11.1770311664146;
        Thu, 05 Feb 2026 09:14:24 -0800 (PST)
X-Received: by 2002:a05:620a:2a15:b0:8c6:253d:5187 with SMTP id af79cd13be357-8ca2f83bc03mr899690885a.11.1770311663650;
        Thu, 05 Feb 2026 09:14:23 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43618057f87sm14802849f8f.21.2026.02.05.09.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 09:14:22 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
        cnor+dt@kernel.org, srini@kernel.org, perex@perex.cz, tiwai@suse.com,
        alexey.klimov@linaro.org, mohammad.rafi.shaik@oss.qualcomm.com,
        quic_wcheng@quicinc.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 06/10] ASoC: dt-bindings: qcom,q6dsp-lpass-ports: Add Senary MI2S port
Date: Thu,  5 Feb 2026 12:14:07 -0500
Message-ID: <20260205171411.34908-7-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260205171411.34908-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260205171411.34908-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=WZMBqkhX c=1 sm=1 tr=0 ts=6984cff1 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=S1r85Wze4wKqmHhc2Z8A:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: PAGzF02U4-XNQuDy59tzJ86dakauKu1D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDEzMCBTYWx0ZWRfX36F9Qv1cYhDF
 Tcdc4oRgEqUmJ0PdCjoDU6Jl97mTB/jJ8hShu+fJKPBrH+d4SLje6ZYHaUwhEkOkwykvPsNfMAx
 S5OAm1LTB8wcITLVOb4l2+xy9kwQI/Bc7tFGRrCBZ2+gyZ9e+ZCaaCOeOmF185uNdqgdvXm2l54
 M1mvrl0hM02lDcLSHX924rqyFEUvLtWAUeppyn/l8kzC6S+LtZu3HtAgNcb/pMLftGminWFGzEM
 VKOLubgRSl5VvWg/eWalriwMQGKo8KOiilY4a4vvk/WRnn80ZaHXxFKhrekD6P8nuAs2beWQVZW
 ZW0VwFH2FPNEcByzfGPjZZpHogetHbHZx6cqD5c7AyYvgwQlRh3iBJw9TQFa1Nd76Ovne05XvR1
 PRAxpIrgEh1CaQcK50rhCtne7vFbg8GSPgWq5OqFZzDlZC8YO/VO3gK+89W4LS4Ugatneo8yni2
 RFpkW0eF5kSYYli28RQ==
X-Proofpoint-ORIG-GUID: PAGzF02U4-XNQuDy59tzJ86dakauKu1D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_04,2026-02-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050130

From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

Qualcomm platforms support the Senary MI2S interface for audio playback
and capture. Add a new definitions for the Senary MI2S RX and TX ports,
which are required for boards that utilize the Senary MI2S interface
for audio routing.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
index 0febc641f351..715bcf1bccdd 100644
--- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
+++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
@@ -150,7 +150,9 @@
 #define	LPI_MI2S_TX_3		144
 #define	LPI_MI2S_RX_4		145
 #define	LPI_MI2S_TX_4		146
-#define	LPASS_MAX_PORT		(LPI_MI2S_TX_4 + 1)
+#define	SENARY_MI2S_RX		147
+#define	SENARY_MI2S_TX		148
+#define	LPASS_MAX_PORT		(SENARY_MI2S_TX + 1)
 
 #define LPASS_CLK_ID_PRI_MI2S_IBIT	1
 #define LPASS_CLK_ID_PRI_MI2S_EBIT	2
-- 
2.47.3

