Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D1B34C134
	for <linux-sound@vger.kernel.org>; Wed, 25 Mar 2026 11:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774436942; cv=none; b=CyuGYw02/WrFrd3NDOrinMo5zd3EaRL5KmX6ZRWHb+SqWObZb9igK3Uy1snxpReqFqK2GZtDF/pGj1mMADFIJx5qOPyw6q03kZM+L7oi6PIXZp6A1FXVnSODg0SPVOcjWTm/SFUC8EQfdcclc5bCwcGEGG9/cTborlDKdN0ug7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774436942; c=relaxed/simple;
	bh=6I738bAfoEkJyQYtNHVpNFa/JjM+KqXguKAykG4mGRw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EKLinFZUoEv+pDNcwVJf81NwILaTveJ+mfwbsk+vqa1b9gb5V9nplRvEj+t+62AmI4p95cDajs5lYAEhZ30SE0I4CIsOPdarKOlW9zgwCbBgu3r0QNQ+kC8cs6vXo4u7Gk6QHAc5Fjr0I9Urshm8zXeRgqNjp2urjsDk7kwMdYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YmR/Y8Tk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ArYIeglx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YmR/Y8Tk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ArYIeglx"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P9LtZN3057430
	for <linux-sound@vger.kernel.org>; Wed, 25 Mar 2026 11:09:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=+0ZvU4Ti5KVo1beB7Xy3xRxa+1BP6/1Y+zf
	cnsGdirM=; b=YmR/Y8TkiZcYaOPvcfbsHe4ewF0w/giKKRCjNBozfZK1eGnRYFQ
	02Ir3VGKl6MFQoQeSZ3A+1b/FaX+4ZVm0qcE9NE1orOCf3D1towXGHKaB0Wa4VcO
	2ssT9yggzVzO1BeIVEN5ENzkgkHb0b0KfxQ9H2Q+3rFEVNJUZgPOfZ5bcavpyDkr
	60mHM5xsZGCiKxC9LZfOE5ErnB6vVDntcFFe1XtBM3bbvwgt8DQTvdePcMpGcbxD
	cIm7EoRlkXPdDRn5fszmiObct55eYv/4qU4paRTkdbcsLkNP0KnDG4fuFo7q4e9A
	Dbz2Lvl/sscZexf9y73AKcWOygzWxUiTcBA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d46tp1rjt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 25 Mar 2026 11:09:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5093a985e21so441836171cf.3
        for <linux-sound@vger.kernel.org>; Wed, 25 Mar 2026 04:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774436939; x=1775041739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+0ZvU4Ti5KVo1beB7Xy3xRxa+1BP6/1Y+zfcnsGdirM=;
        b=ArYIeglx1SBjgdKflOhqAYtVKcQqe8pSvs23Z0JUiRafC8DY/jWc74rZiN+Y3X4jYw
         dGZ086hy8A7ggkIBWCwVZAzsVI6KSOTlLublmV9DwDmDhAW0rMtBkgBjRFJIqGH+eZjE
         5mauawyW2upO5pL22RKD6pXfVBMywlYBNXZDox/3vCHEzelUhUWlxtWVqmFkCYjJtNS3
         8xMNYpHzF7dRHeGGeVfO2hAhIG2UIPpsThYGVyYQqIoh/ulgQTBkfPUyrTMRjaNGdTLk
         gGCyJINYiWJ3k7OJsUSonKTKFVmTTtmUxGCRubUcSVT7/eFRUUlZvg7WBeLGzslBT24P
         vIcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774436939; x=1775041739;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+0ZvU4Ti5KVo1beB7Xy3xRxa+1BP6/1Y+zfcnsGdirM=;
        b=rlJlG3ttjDpoO7GOVtMScSJJC+94zIzXyYI+j0l4SY91I1HJPzGa4TyrNizE4W16o7
         8bDsjnttd4jRiyYrod9L5mkOy89xOo/yG8Qpsw7Po4e16Atjd4EgR1837GJDh2wQwuT7
         GWrJymvdpHBOlinCdF0BYf5pgCg/wLRgKN4AeAXQG6tCdJeztKb6cQNOBlArtW2fBM34
         r92a9BP4f375ute5EmejCYclW3GnpxKCFavicLt6SzDLxiy4THK3PueiL6tH80miIgau
         XWnWSeEabMz87bvkHXWU+GlvGxeHycoFjy2bfY+FyMr6lXN4PK1GrN+4I8gW+00dq5fS
         JFlw==
X-Forwarded-Encrypted: i=1; AJvYcCXw+XVoXBNqY9UHr+QmHYm/rruqVPqzc5qVl4CrJkEYTp91L9XDMteHWuDqJoZEQxgmyLICnY3VeBwzGA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrwfXeoQ2JfC2o25ctgytTjFegNeVQNEVFezg0NVrDXk+k85/e
	hUzuAQXTsuzzjmQZu4ykt3WMWY0AEST5C4oV8ykrz4TiSHY/oMrBcbqe/IOradZQNh4ZRX2Zwa6
	INm97UGlqWdsXN854GrYWIYVpq5iHkbLl6kK2q5Ud9QG9G9IPIBNULKa3DcAQnpzvuA==
X-Gm-Gg: ATEYQzw/wc/HxfJQAssKJZlZUsfAFGt+e2uQa2Q2d586H8D0muiJFL6EOnKmFFXhHyz
	F4+c2YVx9axNRPACcfHNF4xReb99i3z2g3FiBPNHM85mMFpJKWSmHwSgaSIXyodniL/dx6Z9B5a
	I8i4TMTg6vBdhOxf7Tdv5bS484gz+1dng5xRH7c92oeGQeRLvtCT9/CDYx5Z7niBjkuEnT73NoQ
	6kDm/EHdVA0nwYtlcrodWDC9cXOvhd3hcNc9R7dOkXljzmMZFxzyKpmAFl7MhViAYMC4ZUAl6ze
	/0+BPhyGCxpPClKhrQcwODW9MtWGKk1cRlr+k6JXoDhcohGEws0yt9ktsv9wI5Ra2XpUOTFKutU
	ivmkEYpj7J9T3Gv36WHEkHYhDMby943PYADMQ
X-Received: by 2002:a05:622a:a38b:b0:50b:4e65:95d9 with SMTP id d75a77b69052e-50b80ea976dmr34740861cf.64.1774436939074;
        Wed, 25 Mar 2026 04:08:59 -0700 (PDT)
X-Received: by 2002:a05:622a:a38b:b0:50b:4e65:95d9 with SMTP id d75a77b69052e-50b80ea976dmr34740491cf.64.1774436938614;
        Wed, 25 Mar 2026 04:08:58 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644addfbsm47619447f8f.3.2026.03.25.04.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 04:08:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Kartik Agarwala <agarwala.kartik@gmail.com>,
        Maso Huang <maso.huang@mediatek.com>,
        Trevor Wu <trevor.wu@mediatek.com>, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] ASoC: dt-bindings: mediatek,mt2701-wm8960: Correctly use additionalProperties
Date: Wed, 25 Mar 2026 12:08:50 +0100
Message-ID: <20260325110849.127051-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1180; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=6I738bAfoEkJyQYtNHVpNFa/JjM+KqXguKAykG4mGRw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpw8JBEfYqWLxD1bkFtAZmxhdwN6qxybaM6CQPH
 lpEpMapYKOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCacPCQQAKCRDBN2bmhouD
 15ujD/4g4dIYQv1qyZH2s9d5Rz1mh4nLeavnR8ImqzD/n+UWBA0g/jr0P423lyGLuoiyy5427Fj
 1NP++m9jyStQ80KoFTKmOAikHTRKgxLuZgPyIJ64vDZ53NWjD3hbsMzYQi1/IpKLElwUFygaeAG
 HGnXyE9XhE2eQdndSJ+rxmXEy3H6dPVThmCz0WHY+gD5qe+NC/u+ptMxJHVMtz9RYi4AsJfM7sF
 OqOB6i6bsBHUV5rT5rXclF/M9me6z1NVYQ31/CsYJvUozAwyPdS21SAuV2k8N1tt7onpjIeHnCm
 3EwC7hg0XOSiHQFQSShz2OTrH+xaUZq0GvJrhla0EakyM490VgfV7i3DQ9xnkdUFKEciCmUQMGh
 cCasowHJv8ubQLLad9s6BIo2fkc2+BhkDO7edOraIdyTAGB8K3eMWUaOfscyRCb+YaYJ3tDTIit
 puHqH34Ix1poix4PD+Un5D8PftlWJYQSp1nKH5ZxiyTY9etbGkml7HCdTWjscwhRwWR5MRw3u74
 Zxi59ornC0yop5XsB08C70mgad0IGrS4jNmH360ZOskfpBg7rbMNF7OHoQn/GtotAQDPF7CIIaT
 onzto6/+lZYMFEaeRtSUSeTCE6Nh0tbrkJRCHYcpwfh6XbY71DOMAGPO2yxTG8jy7xMefIiEIs9 oEroLwHkTqCwwqQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: bb3Bm-AbwYZtnK5-gvTx584QGN-7XznP
X-Authority-Analysis: v=2.4 cv=F4lat6hN c=1 sm=1 tr=0 ts=69c3c24c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=LxDdgrJzr8anm5p6-lUA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: bb3Bm-AbwYZtnK5-gvTx584QGN-7XznP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA3OSBTYWx0ZWRfX75dvU+hXddjH
 bwh8ClHJ7ozN21yr1ovSHMm+6ZCLBx8zbUM/GFBeEbRWt7IZ5PJsRavcD52joZ08yHs2Irhtc9B
 leDsHXXPMSsA4AtpzmO6CoDSj+GgFbcqidv41pB6dG1FVZFE6gIcbgp0ARrc8ehamPJs7pd/YTE
 F+8UB1HCcEXXfjRnS8fVgdLmfvEs3gqapJD+BdoyKP9wdwr8Ra+NtVAzGjikeTZhoTidloE4Jl7
 u80McOmtQikY2KST24VVF+iHZjSSE7FAPbJdTkHQvg9KoKmaBoXKmVXy8fl1SJ/Ci520a3dk5c+
 83GNzZJD0oded016prhazpeqRtDUb5usgCbk2ql843liojvmtue1DMRn5rtombxWJoxb42okBUX
 Sv8tqM0iLGcQOPo5R9aSjpm29aF2cHAt4SeINj4u4j0nqTZldt5FBatmkbpIBPa9t6imWjVyAtT
 V0Rvp9qHR4HlWH9NLXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250079

The binding does not reference any other schema, thus should use
"additionalProperties: false" to disallow any undocumented properties.
Correct the code and place this after "required:" block to match
convention expressed in example-schema.yaml.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/sound/mediatek,mt2701-wm8960.yaml     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt2701-wm8960.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt2701-wm8960.yaml
index cf985461a995..bb6a405b263e 100644
--- a/Documentation/devicetree/bindings/sound/mediatek,mt2701-wm8960.yaml
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt2701-wm8960.yaml
@@ -28,8 +28,6 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: The phandle of the WM8960 audio codec.
 
-unevaluatedProperties: false
-
 required:
   - compatible
   - mediatek,platform
@@ -38,6 +36,8 @@ required:
   - pinctrl-names
   - pinctrl-0
 
+additionalProperties: false
+
 examples:
   - |
     sound {
-- 
2.51.0

