Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B19386554
	for <linux-sound@vger.kernel.org>; Tue, 16 Jun 2026 20:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781640895; cv=none; b=PjCpXj+sgeKS/HvAhZEJpnKV4qE5Gu6lPl8GgDRSEYvply/04ORFaDmu8zqQNCAYMSluZ4K2udTkCZF7NXH74lg5dpRoVzX9AbacaD7/V5W7zsyT1Ez/gocKD0eNYwXHQYfGhdMF9qcd54ujsZmoZgHy3p7nZsCMIZLExSFaR2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781640895; c=relaxed/simple;
	bh=AB0A7wWMtyFMDgrbKuPIcQTTW9qV8HUFhEw5Y4NCP1k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qKlzwBlW6DKHkhW0o7ozn0xNK2kco2rNldQ/8l1I4QMZU7uyeMUJHaQmHfzUWgaZH6I6EIt18SaKkpWm5lQ9emNy7mz/Hu/bt9GIMrG40sO4M/KEV9XgW2FLCshi/u0zzjakPiWT26qHWRP0WuD+1A9t6IdbJ56QoU1jOpX2YrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PHz/vI3A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XUz6zj4y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PHz/vI3A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XUz6zj4y"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GIOdqT4037832
	for <linux-sound@vger.kernel.org>; Tue, 16 Jun 2026 20:14:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yOEstz8lb3k
	BSWr0k6Ei7wUb8Svlbcj7uj884ATXKog=; b=PHz/vI3AE8TtfhRA9sErjzfEwZC
	JUuShrJkvHaCEBb3dl4PXBv47d5X9AFBRWf22TgRSlKu2VjwmHCzjaE79Z3bfhPi
	sf4G1I0FGckurdUdK6Y5jvtST6zOw0GW89EKuI68dX8AB0vQ0FPeXYULIs45Je/K
	XKoKojvmu9Y9beNGFf31ii6BEF8SDFOln/XM4CgjWusqIw3XImujXN2bvjbSOUUs
	4JEimuKgqWRZqZDlPGYpvxpQwzkIuhr2vjIJYQc8UBj0W59pQwdecslVUdnHa6HA
	PQmbcjSrVYosRF8k52HvrkqA4+cOpTkdHOETXu8InREskT6ntjI7rLjpejA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu1763r2h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 16 Jun 2026 20:14:53 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c354050c34so45763465ad.3
        for <linux-sound@vger.kernel.org>; Tue, 16 Jun 2026 13:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781640893; x=1782245693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yOEstz8lb3kBSWr0k6Ei7wUb8Svlbcj7uj884ATXKog=;
        b=XUz6zj4ympZ8ONszWmgMkUvTGf8/aHguzZ5RkvQv6V+QvS4/vm6vIamXIJf1cZIWxy
         e9RakavTGaKy/yoSksNQkBMT3ssw9LR73ffz7+Xljiuo+xH+AqTMNDcgSwYY+98tSeyr
         8LQO2qYFTqxwDbgKFQ7PABpuyrsv0v5v45AF99YLkcbojBqAagi61lr2iiD7L2K79UTP
         3Sou6bWYoC8BVZUYBMqwVOBRmXp/Ag1Ya0pmiKyLasIPxia8l9fazdNS5nzPDhu/HIV2
         tI5sca1nkftObTnokTNv23IDKVaZdR/Y3J5a9/bxjqWqUwUskr6nbJaGizzLo91IFBZH
         At5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781640893; x=1782245693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yOEstz8lb3kBSWr0k6Ei7wUb8Svlbcj7uj884ATXKog=;
        b=J3kCzPcZV74obULGP7OsKQq9NRJisw+UjnlL/WwTmPo1iyj1C5gZTq3uxQtIgMb6aZ
         KfSvslMKOsYizfPVr2ujF5z+UHbIFZuyNytaTLSbiZlot5RWSAwvT8lVmRPl9w9PnRpI
         IjmdDTTH1GtSNhzcDHhQ9VWfuQO0KApyoaMUdhpKqWVxY2/ERsTFaZY93iYSMS/e602l
         VI2jCQBr4LTk2gKqVH8x9uvmO5a8pDV+a1mz+Y6zeyjlqt08h4Z0ws7qvqxy4xyHDMuH
         oGvoaflKOs42z64aQE65Vkc1eI2efKMsnVvNmTzV7GYaO5ert78bFIhklAwIahB9YAqL
         G7rA==
X-Gm-Message-State: AOJu0YyQC3ltlox/FsxppUgTDWsA1QTewHOCgJitmdpqk8cxt1Qmvk11
	hTVmCt49bNAWNMGoBtcSXME9Ho0UBp9OLwSDsYoH4Mz/Izgw8YwJQ69LxGtHuzBKjNVykAN5mAj
	L2J/K6EsEzCMT6ztJZxRxJjFy9eo8fpHMveM+i42FvWr8igqqvZN/vxTD99g92s3Vqw==
X-Gm-Gg: Acq92OFquRrt1XcfXFjAieKWkfY+epOVMHj1357NV3UyPRdJCf0Xo08aFfyupz4g4tC
	O+XHJYHmAkqIkdaeZ+MBNEtLIsiFPgJRti6iGa4yfBChpoF+69agmNNf9v+Igqo+X5gqgg7OGHK
	FQHHEWPvodwXjcGKD+56H+6yfC8H+7ndjcduXgOeOH2fUpdlcu4w33lTw3IEdJLPDEdUzkNl3jm
	xNbutVhJmu99+WPNiAO2bT2K+pUCMUOywozgr1vr7z0TFRgjm8KxFJyTdkv44KbLf3j+3OU65r+
	qrJU8iOKXRqmbH+nhYSsdkwXiaZ3e1g0U8ijF9/yjPRmzt68z0WBAw/0Z2WA5qFxcWeDqjqADAW
	UJ286zfC/Kmx+DqAFcy3h4ZzxzVfXnGqzv0QN6UIwClI3bDktLXAP36y/PQ==
X-Received: by 2002:a17:902:fc8d:b0:2c1:150d:6db5 with SMTP id d9443c01a7336-2c6bbf6ef6dmr5691485ad.6.1781640893145;
        Tue, 16 Jun 2026 13:14:53 -0700 (PDT)
X-Received: by 2002:a17:902:fc8d:b0:2c1:150d:6db5 with SMTP id d9443c01a7336-2c6bbf6ef6dmr5691285ad.6.1781640892717;
        Tue, 16 Jun 2026 13:14:52 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4328abe7bsm136385985ad.49.2026.06.16.13.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 13:14:52 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/8] ASoC: dt-bindings: qcom,apr: Add modem_apps GLINK channel for shikra
Date: Wed, 17 Jun 2026 01:43:08 +0530
Message-Id: <20260616201315.2565115-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260616201315.2565115-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260616201315.2565115-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 7L4EgyVjfZuGLsH0zoo4pCnCBTDRaG_g
X-Proofpoint-ORIG-GUID: 7L4EgyVjfZuGLsH0zoo4pCnCBTDRaG_g
X-Authority-Analysis: v=2.4 cv=I4RVgtgg c=1 sm=1 tr=0 ts=6a31aebd cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=HnBwLnbP2RCvDO8bWWEA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDIwNSBTYWx0ZWRfXw9FswS84fUPI
 dsjw5pKQz+UvxzL+Cp6LAcTcMnFLJMltxSSrD5LYn6MxzBD0kE3l0cwH6st0GCjJGnxchEsQJ4+
 XL/Aolj++FYOe0Jhxzo0eoOTcBv3wjI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDIwNSBTYWx0ZWRfX0nYMlZrPfHe6
 HVTj9skJnx4IrwRFjqxPUMlhz153fUkk8G+2Q4XGrmqxtM6A7tfVHtTPHdKFn9C1ScdxKtttoLM
 zsM2VYipkrklKMCDGemTsILvEAEM3GgegplYPeO46+BkDDn2OnJ0U2LnGLUIFYZNOIwBXTDHRIa
 i3E/8xOqHUwvvQ1/pPASx9dHf+GLjVejDRhA+Wr/ZrF3zcXs0eImXO0cq1zUQlZRJUJUbHENSmb
 4/WVuOAunP3wWrv+XYzo2lR8ZDEWwnAZkzHkOJTTI5xrDo4SYLOZw4ixDKmTLADezyo6k46Czg8
 AiSRWL0jHHmeSbOqGEnRqbvPBIsftu4vDKwAJ9/r34VvNEUWiCM1FwpA37isjPt6eZOwoQpOhKe
 sXZ5HEryLlYE9GzWMva1GPS9xWlPRA0WX9k73cG55ZbvR+p+FC428aSnzeIEaZMYAHEySo20J+X
 OrgvZmTCWEwP5xiR1Cg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160205

Add support for the modem_apps GLINK channel on Shikra, as audio
processing is handled through the modem DSP.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
index e51acdcaafaf..01250b556985 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
@@ -120,7 +120,9 @@ allOf:
       properties:
         qcom,glink-channels:
           items:
-            - const: adsp_apps
+            - enum:
+                - adsp_apps
+                - modem_apps
         power-domains: false
     else:
       properties:
-- 
2.34.1

