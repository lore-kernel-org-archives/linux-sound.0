Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99F534D38D
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 13:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772629651; cv=none; b=d5Lcg3x0OnaJJF9Yoj2wl4vzopgJvrD9nOZt8ot7gURiJdHj3kBY+8dzr4r/B3dS6dTmEa2yZocuPN8BNyJIWdinDYuEYLpsF7eWxiT0+01MUFvN06H/32jCu0s939mqZEz+b+8er+V4uKaT1zFmnnkWtXcZTE/2zqlPe7vQhpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772629651; c=relaxed/simple;
	bh=m1EN4YpUgSj9UMxMClhVmL8iu5GkBIX3+L8UCDt7O0M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KZaYC3nDERHT/cKPUSOownDWUtlMLLWMvzDMuVYtbBjPe7tpBA3jevFGd+r0c9Xe4zAwN5ynBgReHXwIrPH889kaU2Wma1/OzcmvmBRLcRi8JliSul10sQMzclnAzYVkWCb7aEsKvEDSN6lCWhezpD1jcIuzyKvJ40f9EUiQ19c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SRS2d3QH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ThArjhzf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SRS2d3QH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ThArjhzf"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6249sxTi1213895
	for <linux-sound@vger.kernel.org>; Wed, 4 Mar 2026 13:07:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pD/LO1GMq2Q
	S6g4Vc43eIA8IGXtM080UQe3gAPGBgKI=; b=SRS2d3QHWKCYpI/DSKEgEL29y/v
	UI7glZ5dUH4m5k8Q2PI7+3Byb27B1ORkOEOn/zOwe2S/qzaa4jy/6KcGkhGnN+Qy
	MEJUxvkv8FqpL71HyGeuaXAsXGFPLoWhGXGtzYbUNO1JeNWWhar++qb2jvJpukbK
	D49dl9L1l4bv9Xv+1XUY09InttwqEsY1vq91dQW8VapqaxxDLAKIcf+n1PMi0R/X
	VPJff03CUP1T8Y0QTp7wtytxNShcbVTkNMHjFYclnS/CMu1cIDN5VIgy46SqJ2BJ
	JaAyWXlVb4BApfjwz7WKgOsuhpEl2Ia5QxRh6XT8XrMa2DbSe8QTnheOEag==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpjh5rhp2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 04 Mar 2026 13:07:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb403842b6so4927310485a.1
        for <linux-sound@vger.kernel.org>; Wed, 04 Mar 2026 05:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772629647; x=1773234447; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pD/LO1GMq2QS6g4Vc43eIA8IGXtM080UQe3gAPGBgKI=;
        b=ThArjhzfd4CrmUnkByQaz3cUtd+SfYBNVtpF0kKtBz4p8x7a+bKjvTPFJfVqXFyDkV
         5ZJ60iVgh7w3uQlvTT0t1hqgiqHIy1I5CGtEocLIEv3SCNyXp3LQx+6NVs0fgFaBe9SR
         Cw7974X1T5B09dG+RrZXuujvjKdmdioxskRCZmniMn0uXdMy+zA+z4tNeahPrMWVzepC
         sBSw+wmcSgX0SDyo/E3zJhXF1UJ4U2mh6OgSrkmQAUb9csjQQDSizjYPLv8rEvsCFeZ1
         BjlbziOlFwe7wwj2ta13xs82NT9+c6c6mUGBdW9s+EGdHDNDmp5QPyJatJeu8M4bZ1UI
         Iv2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772629647; x=1773234447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pD/LO1GMq2QS6g4Vc43eIA8IGXtM080UQe3gAPGBgKI=;
        b=ru+8zu/a6HANpKPmYTB2aM5wSin/r8xNHoxjgJrmjmutK9gkipc101exr5bLfOREdu
         l870lq/PH8juVR0wUHn5saC6GU6m2GBNYDChThw8fVIvCYTdXhw5egssletCDV6M0V12
         P1TnFiw6SWxrPJL9VFRwItc1htw2EcPb5osSo5VXHve45o1zumdpl6FJ35eKw6jIZFRf
         Mes/YXzsNpqd/k0//2Le76nJCOvEoeKIW0a7n9aCwvuoVuQZO5yxVsSVbbNVxq6pCLbv
         spoJqJ/ungsy24H9wqNzApU2y3gdZvEYmUxhmAL+J59fAGIdzNFzrcrwbrcnOJRXSi57
         EaEw==
X-Forwarded-Encrypted: i=1; AJvYcCUgD2GWEan4ZG6cauO4BGJR8BxCDH0vx6KW09GAq+bpjYXWIhLCd7Vz4uyoUOM1tN9PBtnBBhPaPBEe7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzetikQsOQdp7wUs7H65SbWRRCBBcqDfzMvbEzL950Qcup29j6k
	lntIIs+6PjEexfLTgsWuGN/B5WyGLx4+b1hMJHAQ63ZzEwiuh03mR/ccQgJ0YJg1FtbP+FPNghR
	aNblOF0OXUSAjobG9y18yGU5DcuNyfvp5rN1NCrE4TBX4nyzYODgvQlziVTCETCbl6Q==
X-Gm-Gg: ATEYQzzid9TPCUYRx2SpE8JvhO00uAXYpCT/AIZOSFNNktLfPEuqNsR6zfq7yBq1S9P
	RCo1ivmP2nbVFHJRGE8cvG02VngB3knImtiQu64qbRwDjyiGFwCEJJvVlvflL3zq1HsykueJfe+
	LMBLHg0FiOz131XXoEV8uNeUvYGypO+3QQOSXW0by/DVzY6FF4oUH7LtRDfOCHthdaTuwEoM1WH
	Si911mIqaTo3QZ17A5hFMUW5//gVLTQbssOmVicsWes8wec/iOHHMewxRWsnsacZIF2twCXPEFt
	72jy2LP0vRiRDQiWW1pKwN85y6rXUqrqOaPiwgswxyTmpTbYRc9G+c8e6C92Ow4SxYcOgv03smG
	LVuLwIgCsw//GPdCH0Dpk2lxx3FHRgbZ/updXPaOq5zFREU8U4IbfbA4=
X-Received: by 2002:a05:620a:28cd:b0:8c7:1b3f:7d0c with SMTP id af79cd13be357-8cd5aecb2c0mr225098385a.16.1772629646994;
        Wed, 04 Mar 2026 05:07:26 -0800 (PST)
X-Received: by 2002:a05:620a:28cd:b0:8c7:1b3f:7d0c with SMTP id af79cd13be357-8cd5aecb2c0mr225094485a.16.1772629646542;
        Wed, 04 Mar 2026 05:07:26 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485188122a6sm49969745e9.12.2026.03.04.05.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 05:07:26 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 08/14] ASoC: dt-bindings: qcom,q6dsp-lpass-ports: Add Senary MI2S port
Date: Wed,  4 Mar 2026 13:07:06 +0000
Message-ID: <20260304130712.222246-9-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260304130712.222246-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260304130712.222246-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: nObmCzy-Z0wZHB_VigsVvAecVcm8HiMb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDEwNSBTYWx0ZWRfXyI/cSZuKl0SW
 PKq+RMVc7eovJps8uW8eQzEq7PKmxNiwaDaAAQe3VtWrGSHlKNSAZLfZtzJhxIS2cb0vk7B51A9
 iKhZ0rZc+TKlvx8JvaJfCGT6vRoHMyHq8/zMQEL2Lw7gYWV+EGQZ8iy6Qbr/AVzrFULAOYRC6vT
 289Hr0YV8Go0OQrpPcsWM+XtVF/nvbenkbtPx6fCrV/rcAQzzfsllaOlh7CNYGDBEu/06k/jZ5q
 feA2iNy+nLF0jLov5p0TmUggrx4F5ZxEMNKkuIeprZJ+Tl1ylqIJHhCaiiHAhx+16UOfJFF7Fv8
 N3pxoiE12C6f27Mw/XA1xVlRK+JMqDFmR5CgykMm/rk1OIGuM39AMfuB+EQG9XEm3uG410ZaKmg
 f7Asb9ehtLQ4M0C6tuyb8bDykTYZg1g0a7OoDSnnQsGC4JyUdlC50UvyXsuUmvyLu/WlHxl3tLl
 pXUXGQjpREF7l10nvAQ==
X-Authority-Analysis: v=2.4 cv=JK82csKb c=1 sm=1 tr=0 ts=69a82e8f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=S1r85Wze4wKqmHhc2Z8A:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: nObmCzy-Z0wZHB_VigsVvAecVcm8HiMb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040105

From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

Qualcomm platforms support the Senary MI2S interface for audio playback
and capture. Add a new definitions for the Senary MI2S RX and TX ports,
which are required for boards that utilize the Senary MI2S interface
for audio routing.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
index e27a31ece1f2..45850f2d4342 100644
--- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
+++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
@@ -150,6 +150,8 @@
 #define LPI_MI2S_TX_3		144
 #define LPI_MI2S_RX_4		145
 #define LPI_MI2S_TX_4		146
+#define SENARY_MI2S_RX		147
+#define SENARY_MI2S_TX		148
 
 #define LPASS_CLK_ID_PRI_MI2S_IBIT	1
 #define LPASS_CLK_ID_PRI_MI2S_EBIT	2
-- 
2.47.3

