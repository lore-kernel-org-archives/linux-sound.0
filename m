Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4599449E143
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 23:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789082220; cv=none; b=W7EzS563/45qn+epaZCHNRthwG4A9SZlSqZNrwF+AAdEnLMblZuxPOx4gDmbLaTxSgZF5zk71C7Ha1h2EuoDBZ69/vms3xnMe7FYJ5T46UULJ4WcXbG4/HrJN03v6L1RI1W+CU21RRLN+1kc38tzN3ehncAqfWCW1ZpPOnxXcpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789082220; c=relaxed/simple;
	bh=WDKdODQnX8YmpWUSjZe8tftJ86Tlnw6HDxRaNSyktGI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fcwNqEB6hcIdeWqkWbF1pKun7Vy/tLjD9ekgRucBEzJS0WtRO6bMK55GytZoEPLKfbUDcAe2CbMxTCihVYNzIuwf/tvvreDJapwWL4kWKlDQaK8c9O9dBU01by6nmu/qW8i0HFMcQxLO+lgHLsEJHHvZ6cZ878nIY6hvCcl+cmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hXZFHoo5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ENedKHju; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hXZFHoo5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ENedKHju"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ALUMX02127849
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 23:16:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=67czAuqUh1r
	qng3/RCVOZLghTGIHqPCTo8SlnOqGdYE=; b=hXZFHoo5zS0Vdk/V4TUtRX0Flvb
	JTVEiwYs6ohD4OJ13VhvjIGMj1jBqmASKoVCLJRMzHk+fUm9h/V1+8roYn8buE5j
	4hMW9J3ZciABkgkEMbu1xDdlmS4nYLfgBK9nOXhfNp4Js9vqJOn2PiTq3lur08sH
	iAa9EwSS1IciznqvBqMTouKakCQc/0z73iGN0XBA8bS8IZxKScQ5Cg+K3TgjxuzC
	36iJ9M3d1mNObf226ZhUVK55vSt43PLX0/uutBXB8vAoE5cwdq1q1HGs0S6h8jO+
	KUbuK9Lj/VCuoThTvGf31TOK5p/f3FHTl6eVoesompxuACgcS/F34h/XizQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkwkwafbb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 23:16:58 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2db22383e8fso4433835ad.1
        for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 16:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789082217; x=1789687017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=67czAuqUh1rqng3/RCVOZLghTGIHqPCTo8SlnOqGdYE=;
        b=ENedKHjuMmccacD8qLbY57Png8pyLiu6aBWsLsAFIQeaY6Uk6peJLUGshGRjnzh1Xi
         3ReYPDvfOS4bASPtM6QdgzrsrV53A8PqeS0Uap6CXbpqSIQcpndTN8fUlXJOkamAGEEV
         FYt35Gj9ONf0NkJJEL/r0yGoVa59t5+f8KmNZU20Gkb1FOvegt1bGSxOBNxOLcIr7uPi
         QXo56uOWm71D/BuagJNi8ZjwiX0bxFslbTEGU9E4yb7jRuqtob6NVJhepU+wT5HEenj/
         d0BPBQ6FTiA26v8MD2eOKw7SQl1o3hjJYzJD+DOvg+tLpw4hB+cYkHURqtCDrob0YQVo
         +Ulg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789082217; x=1789687017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=67czAuqUh1rqng3/RCVOZLghTGIHqPCTo8SlnOqGdYE=;
        b=VxQeZfsUoXetBGuXBTABRhKSKon7tTRaJCNiQaszavFFdaEHG+hiKP2y3PCEN1RxZj
         3UkISWDjO3RuC6sNgMPWJwhlUGc7/AVw//nF5rqRomgdLWM8pxG3FLd3lJlyikPaRkbz
         H/faBOcqikT+GomysZMX9Xtt4xeGowrgm+EAcR4NnkiQK1JR2EJqL+pLQAqRZMdYQjsV
         gIDTECjBoSI7JBm62sm+h1hL9GmR/+XYZUmBVyTGaALp6CTKIxyqbig73/SL2yg957Ym
         b64BJwb/15vOB2q04YB1aeKWuccBRxsuSGvZG2soOCNBpdsVw5HOHVmP0Z+rTYCvMVwl
         d8mg==
X-Gm-Message-State: AFuF++kIghBlytvcs7nwwEk5yWu1ueKBJ2dQcbzd1WYI9/N2p0tYufVe
	8MbzDNR+eCzINrUCW/W8iafv/DG6jkQwCFRmIVwxQR75qusegv+kW/w/gOhDdCk/LdaffToUH4q
	AdqAsnAYDKYMy5/Fg6jjNt4OfvzJwPKGzRJ3/8btDknPfSNqvWawZs1TNtaWt6bWFtw==
X-Gm-Gg: AYBFou2jrekNuo/CZIUKVPGbOnCM+76+9iQgIdf3+R1WD+oHZoVEUMYugXGCVzWT8BA
	LLau3Kql69PCMUAnArWSN2A/x3KJDEf05ddZPlEnCnf+DvxHcez30OzECWb1xZuS8loAfQ6rs/2
	rTWvOcEQ/0mNu5XiGVbkdSnpJelT3eigtnQ1rZjonyMqfcOViljGJTwxQKCNljisrmVPntOKjOs
	wrx0JM1E6D3bQtEZDLXnc5HLVGYFukrHBDIjhFl65mEms74iSlqrrNSvY1mUD2BleNEB6xV+HWs
	TomZ4+pCK0GhM4PCF4mxyTl3eGcF02VYayPhr+YUuoJd6fkj2u2WCSEWJAQD+WYVhV511RRQ76B
	sbtZShhJPcyErYWgS82+w5+44ClraEV6ic0qU
X-Received: by 2002:a17:902:d4c6:b0:2d8:d4d2:d138 with SMTP id d9443c01a7336-2dd0eeb8a59mr82662145ad.20.1789082217171;
        Thu, 10 Sep 2026 16:16:57 -0700 (PDT)
X-Received: by 2002:a17:902:d4c6:b0:2d8:d4d2:d138 with SMTP id d9443c01a7336-2dd0eeb8a59mr82661875ad.20.1789082216766;
        Thu, 10 Sep 2026 16:16:56 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f7390csm1204374eec.26.2026.09.10.16.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 16:16:56 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 1/9] ASoC: dt-bindings: qcom,apr: Add modem_apps GLINK channel for shikra
Date: Fri, 11 Sep 2026 04:46:34 +0530
Message-Id: <20260910231642.1794948-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260910231642.1794948-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260910231642.1794948-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EZNd0/mC c=1 sm=1 tr=0 ts=6aa33a6a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=HnBwLnbP2RCvDO8bWWEA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDI5MyBTYWx0ZWRfX6zSGqXMGcuG/
 gxjQPWyAiE1q6N/FioCshZlVD9opvAiXDKB3q8r7tyq569k0VQ/P9F2ZX7ELSDGuw3SoCRvxGx1
 VYJwkrs1Miz95qtuD+uhHbxM0P46LH4=
X-Proofpoint-ORIG-GUID: L045-EMIk3URYgqaJtchj1-JWzeA8MAK
X-Proofpoint-GUID: L045-EMIk3URYgqaJtchj1-JWzeA8MAK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDI5MyBTYWx0ZWRfXxVQPG7vMz2BP
 HhKpfNaQ3n5TE2KC6jxVpAzxlQUrRYExe0ksRGo2s4ZKvuICUAn008PSwSELgxNkE71Zisj3qLw
 DBhIxTYRkWGDYsBmHli3xxf9Lpiddn05/Ox+GQ8d2Vtaw6lGWSQrL0ZHrnAhrL00HqXpqZC/dqT
 1xcRxvt/UWoBjxMXtCsIC9STfmVgdNo8+670gKd6aU7pS5PLxRMIDAUsod837ZXy+E+EFcgQFjY
 xeC36YpqUq5+VoqNP/Tz0XDLWGEztuyFSDeTHAgC0HeqM+8wW15cbtnEHXaPObbYgsU/QqeVGgF
 IDoNYAEXuUyRGyHwZoiJzd7e/PZGHBbsh1HkKInO9bvb26cyboY5c/pXbe5Yn1qI8t1r+evy9Vv
 oAH8TIye8eoQCWVQbXUYW9NerifF2o+CI5kocMukDFjIxpo9rIopvjUC/QTqx85jJwZA+oyaElp
 w/E7a4ad2rZx1p2VugA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_07,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100293

Add support for the modem_apps GLINK channel on Shikra, as audio
processing is handled through the modem DSP.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

