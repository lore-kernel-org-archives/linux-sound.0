Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7169B2D8DA3
	for <linux-sound@vger.kernel.org>; Thu, 24 Jul 2025 13:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753364563; cv=none; b=UCQPSgXe/UYWjIAr9cmV6vEVmsT0KuRnaozgE84vpXP52zz4VuXHOd6dG8R8/8n4QcTbXYPHqb7DAqROPI1oVi4Uf9S73tFp1vpBpoP8D5MGvU9T7TA/cpIRXoKzWlqigdVciBnY8MJWe/CUQx+rq+aA3S/I/UYYRdgu1Uuoytg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753364563; c=relaxed/simple;
	bh=vGRgVTOfDssnsSqYnvBFvPNY1C/z3DVIT6+xrGICpvg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g3495ldxWtYFMCEilfnoSDp6m7wXJHxdl25lXb2KhG0WP9EI17Q2kMT2tBLJZB/AmE22FeDT3vKwxr0/vFfO8ojTtfPab6036bI/7ggis9mWQKHsT4OaaVCFTLVQhEMjZTzqljU1ZRpB1enrn5tyJBf1344Dn2n5kArmxEzEYYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MSVN/Ph5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MSVN/Ph5"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9J1Hn022078
	for <linux-sound@vger.kernel.org>; Thu, 24 Jul 2025 13:42:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sZth73oB8B1
	222ELpFTANlY4LXWFy5IwxIszsgN5J0g=; b=MSVN/Ph5IOY2qxNn8k+r7kq5wVv
	XnVMNrIaGps/EdquNHpYCT/T48JSXcTAi9Z0gRik8oZ0orKowceMlaIWRUPIygfT
	5nvNrfIatRI+e2cdqnVX6kaHydHb17YqJ20e/0xjzzlwGsp7WGPCNWIypu+jaHJ1
	3As3wNLrH2C/IOzBQYSIcmTSroSuR15ELA53A3ZAvcWWhspx87ccvfKP8gM1VEin
	ja1lwe4J8iyKti+aYzdBWLiqqYRm62/Lxxw2zKCY4GA3Vga2P42fXiU2THfUI1Wy
	1T+ssj1gRPVbU2f/sX9PB49/TShLyXReWuMz9eA9CIYCOMOGbVQu23vL6mw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48313kkj9w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 24 Jul 2025 13:42:41 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fac216872cso22900966d6.2
        for <linux-sound@vger.kernel.org>; Thu, 24 Jul 2025 06:42:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753364554; x=1753969354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sZth73oB8B1222ELpFTANlY4LXWFy5IwxIszsgN5J0g=;
        b=W8sJ/UXhXMv4B8NeNplMLiZm3lxJj3lrWETashM53awRq0V72n7LxYRJalZDmimsd7
         2sMHag7cb0HQs31yHRxrYbgLyrrMQnN4EcOcjpMxiA4aE0b856IHtZRQ0e7MkU8n8mmB
         gqUd+bxFSMLlozrRbKZCm53HkT8aWxg6QgR0LKCRTo5luE619NIjoBuYTqXV/VIrEkjx
         vu5901AGW5b00B2uMgHJ9t+BUErDZyF5CTJbbNN8vFJZ70bIXk/+4rF1vSQCFSJ+CU1/
         Tu55lN33vgiNPVxtVmBTS0E3N0PGcWnQloGmzoV4rmRReESVbWql7ERGiOZiFFKwmTSU
         /mPg==
X-Forwarded-Encrypted: i=1; AJvYcCXL0chOCU0ZhK7YuD/xiMRiUBnoWpU0RVvyqPCl+qQGioqg7LLuf4n1MLU7W6eIc5yr9Rk7H1ux1EuMUA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsMCKuFeBxDDVwnYNv1S4dCGBZSdzJ3wGWkbPI2XHki9wwEu+d
	sI45B5ozptLfQ/R6qbNy3znY0SNvz41lTLguFY3/DlnnQqhkKYDElNRcyyAQ8uvecHhj66UdFnk
	W41P+vv3Bm18fDDualscHAGjRU1xBtOkWZ4TQ9DAAvNkGEjs2J1m2UCGwOZqRfLuI2g==
X-Gm-Gg: ASbGnct2FiQEcZOTGQoO3Fpq0Y8GVAYr6b1wrvelnEakajNuxDhFb5RFeLA0podkDi7
	KdvVcA72TAZQZctBrhhYCpIDmhHexf9+0qKerZfeqMuPWrSdjb37O+yZG0JQlau1rg0tLgORJj6
	sD8FXT04zBYliMxp1GPOAXRCFJ+ymP4SLmFJ9PHUBfYmldw5uxQTRtDxf8An48rrofQIi7zNurb
	Q6IrA2ZRs3fDXjXVP3eoWlbhfMJ3W8y+C3Ku/Am6lksD1no5Q1dbqyC7PW9qoNohaGQnwcQJzFV
	nAk/EIYmyo5Nz/Wcb5X+e46gwPwXb3UAGHpKWiwESXxTMgrAoPCtYA==
X-Received: by 2002:ad4:5ae5:0:b0:704:f7d8:703a with SMTP id 6a1803df08f44-707006e3bebmr113655156d6.46.1753364553693;
        Thu, 24 Jul 2025 06:42:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGwZCs1ZXKsn8nvGRMR6iJSS+ZcmyQZ1l84AjZ3RmhPlugzRsIO+22IOdFC4rpCj3UyNAasA==
X-Received: by 2002:ad4:5ae5:0:b0:704:f7d8:703a with SMTP id 6a1803df08f44-707006e3bebmr113654516d6.46.1753364553099;
        Thu, 24 Jul 2025 06:42:33 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fc7885esm2228471f8f.35.2025.07.24.06.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 06:42:32 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: andersson@kernel.org, sboyd@kernel.org, broonie@kernel.org
Cc: mturquette@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, srini@kernel.org, lgirdwood@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 1/2] ASoC: dt-bindings: lpass-wsa: remove un-used include
Date: Thu, 24 Jul 2025 14:42:28 +0100
Message-ID: <20250724134229.103001-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250724134229.103001-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250724134229.103001-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDEwNCBTYWx0ZWRfX6NMPAbJ1HAWB
 XQ//spdCH87IORKtLq2VkyEyS6Ul7EJm4MadigoOkvcLBy96h0DXu1kdWedOF5votN3cYLS7nEr
 BSJBblIducvlXoIWtoQsGUTKSPl8Pz8PYxGlQfVtGm5KPQU8uVnmAUjGoS8TKDs49+UiAeiwKNV
 Tni/DL8a16gTsuhUKOSP55D+jrHgotbPwQSXIdRYIpj9Rgk8BnBaabDNJ0AxPpm99Cr5U2bCO0x
 lKmeCelorcZEzFFCOzFeFPb3UIFVZkkJX1NKGDuk3NCsUBHvSbRnFpFdXJF4hTKA1IU+ZQzQvTj
 Ex6O1pmuS/d1qVTVJp5zVp1YkRIKwQ8lC5zxdBy1T7P1oELLWwDq4S2x5vOzjCOpHX570X3pEBI
 sfc2o98TVPAzMoJ1PvfyyYaimqkk/VENZlYl557Fqz36YMYvdC+/qeVFFUWgISQvXg4wVxNq
X-Proofpoint-ORIG-GUID: i9dfpoOX7aqWzgsq_Yg9EKjl6VD_eaTx
X-Proofpoint-GUID: i9dfpoOX7aqWzgsq_Yg9EKjl6VD_eaTx
X-Authority-Analysis: v=2.4 cv=C/TpyRP+ c=1 sm=1 tr=0 ts=68823851 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=ZRooaDHkeuqK4k2OZnkA:9
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 mlxscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=966 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507240104

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

qcom,sm8250-lpass-aoncc.h is really not used in the bindings, this patch
removes it, this also enables us to cleanup some of the dead code in
kernel.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml          | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
index 9082e363c709..00d9813d72bf 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
@@ -103,7 +103,6 @@ unevaluatedProperties: false
 
 examples:
   - |
-    #include <dt-bindings/clock/qcom,sm8250-lpass-aoncc.h>
     #include <dt-bindings/sound/qcom,q6afe.h>
     codec@3240000 {
       compatible = "qcom,sm8250-lpass-wsa-macro";
-- 
2.50.0

