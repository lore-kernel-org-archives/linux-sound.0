Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD68E31A071
	for <linux-sound@vger.kernel.org>; Wed,  3 Sep 2025 15:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756912442; cv=none; b=Ta/14QYGlujgUyv/60EfArk7pbhh6iSTt8DN0jK9FUKvgd8Ref+QAIHkp0+ZMAuyX9DSw30N49GxvMx6RTxxmUlz52XfyLTxQfymgKAePyYtJxHs/sk4nKNyicld5BMqabfbYf6CK0UZlrryfcMDhUurBTnm3caPQ5INfqjEea0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756912442; c=relaxed/simple;
	bh=XFm/BadHDzadfJbe7CFKN0imNyFqdCDjXz6VuEFz8Vw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Y4aUfRBFhT+mopuSHHvAbns4ULTg1uSkG1M0oKwjtWVe525KO5Liyi4jy90ch7Vszl8tbi26X8JflaCYKQIfF+ggeyhLiq6PRqnV04Vuz2+0C81SXKQAztF6gHQfDlRMdOSd/RB/udkVuw7UIJpMFutprGdMqYnvCc67qSW681A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Km/12yOc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Km/12yOc"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583Dx4LB003933
	for <linux-sound@vger.kernel.org>; Wed, 3 Sep 2025 15:13:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RzL4kYDIxuH
	5s4GrG8w0rRMRXppv6MYJkkpGNs4+K8A=; b=Km/12yOcEbyfKQ8OskOzsEjhsTW
	3ejAHzA25uMh1rrBnurCAaHl3DyaY9eFx2fDEKGkz8CR2OjfK8a+gLHXILetdc0M
	qa2QZN6x2LPo1QMWpEL0gXJmKmvrXYQOVxD9ocEwmpA01YNwVCRyA0pYM+GWG0og
	YcOakpN/gA5y5nrlYrkHb6rimfirybcgaOEpaioqHgFCbGvWSzltNMwA6YpZG2T4
	3QT2lPrQMiAJxWDvkiayP693LaNYw1Hj8Pb1RQ4EAdNIr0/pdvofjqg++pr0lCfW
	QY+0ayf5niylzgD6E9kE8J7ow5UKBwqlv1dH6WgKhblV5Yzs37QGsGvgrqQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ura8v2rw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 03 Sep 2025 15:13:59 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b47174b3427so5517438a12.2
        for <linux-sound@vger.kernel.org>; Wed, 03 Sep 2025 08:13:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756912438; x=1757517238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RzL4kYDIxuH5s4GrG8w0rRMRXppv6MYJkkpGNs4+K8A=;
        b=IZRl5gzemzQtc1YVPwlio2sTaMEihV2Ps4OSnzktkVLplmqu/kUJkMPPw9do3fclrD
         Sm90Dttl9C97TdTBtGN+KTYtPyKuN8tGQx2yHe67g+h0+QIwsOD1dg8giRh2gKZZuh3b
         7QV008nQToxkSHKJ4txeUGNS5IIkH62EYoqS6MwxiKE/xaAKgqeKW0G2yMmv4nOuk0eA
         oPiQFQ5RVLJ45R1afR5R1S1MLWYBK9zu+KT5Kj7leMBLm8G/gNyP2pX3JgQJ7ahUVajE
         TvMg9BVdssCVBNN192nOeoWp1PJ2JZ1wORETuDfociv14GpeA//TkO83917KWciA1umo
         OCNA==
X-Forwarded-Encrypted: i=1; AJvYcCWgpNGqI+XZsSzZPRhUjcdnt18Xzjloi4jsqdjzF06ocj8A76Cpy0spdQOCykfFPyA0prxeyHBs/4oxzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg9Z5b7QEvLK33T/wipeP7AwirIdXLN1RKuHfw8beVaqSjG9zU
	EHWe5FI+8uEjB/fVV6L6NgoNrSyOEQ6Uu+6nP59AbjpQzzLu1zbJemmCcRjotiM/aaiQr61Ezy6
	MM6AfFzhESAXhOt9a65vgQEzhK3IY+UQb4tPcnRu1851pTlwkeTC6o8adLN7CsevBcw==
X-Gm-Gg: ASbGnctm7e2sS7xPZNXnqNUL507jlWjCBM/13DW0X/ZlB2L40E1IFDr8SKwq5RpFL16
	lnAAgu3huG5FjAeoiMYmXRkhvBTvm0qe+7DziWCSKpN17jHYMtDF3hB93fcAagEJyRPHu+BlouO
	56nedbfuWkSOaJnvYYn21SSwq4rgFqbDE6cT5mPxYJX5rxoHxNCZh9+Xk3cOmHp7koMKKV6D9B6
	TZIEFZB64q4WSZzwR1j+0PI2KBWIohNGZZftvTIYYdTh2G0wD0mKV7wZ0Ibk3MgkRkKqyz4m0bh
	hGwZcp74aiSMLQWklOrN8d6ZEec2Rnj25Q2Wuy0Z3ZU66aL/YsIC0Us3zd00SuPCz7ZWdWZeZxZ
	s
X-Received: by 2002:a17:903:350d:b0:24b:299a:a8c8 with SMTP id d9443c01a7336-24b299aab5fmr72552295ad.20.1756912438227;
        Wed, 03 Sep 2025 08:13:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTvTSzNvtnYATXSFnYQsCvI8SPhdcYHjrUO+5N2sNnL4YMyS9bz/HRtJJrkQSDQo1/PcpV5g==
X-Received: by 2002:a17:903:350d:b0:24b:299a:a8c8 with SMTP id d9443c01a7336-24b299aab5fmr72551665ad.20.1756912437706;
        Wed, 03 Sep 2025 08:13:57 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24903758b89sm164818945ad.59.2025.09.03.08.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 08:13:57 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        prasad.kumpatla@oss.qualcomm.com,
        Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v9 1/8] ASoC: dt-bindings: qcom,lpass-va-macro: Update bindings for clocks to support ADSP
Date: Wed,  3 Sep 2025 20:43:30 +0530
Message-Id: <20250903151337.1037246-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250903151337.1037246-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250903151337.1037246-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 7iZtFgsNKMMyZzCWbtlJ5R8XvAYIh_AO
X-Proofpoint-GUID: 7iZtFgsNKMMyZzCWbtlJ5R8XvAYIh_AO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyMCBTYWx0ZWRfX3Tm6cNcQe7FH
 Rek0cY/gzBRomCnXEOeJ2AW9dyL64tBkXmazhr/+tX/rFKtNZiIMIoVitW08XM1r0M9ubZZ8q32
 mnJ+VHZT83SA6WXg43GTalIf1yVEfvvXnSd6QKXDHuRH9hn77geJ+UJ9BP8VzqY8cJJlFs1Jewk
 O59PGLHwME1M6+Nvwlyu2MgSSRv0L4WOFi2pC/KsAa8EG3H3Hm3V1MrIBPAsoxaYsk3bzsR6CXC
 IS+bT7dFI4naFJK6XBjogcVT4L1lIPzfmPR598Ji6U4ONuU7j6StkJpJlVnuw+XWBde6Qb2zAWo
 KzBbc18QVB4PBkoeHFul9V7xeB0wCn67Zx/79msktepagIebivuXIiheT1I3YsQFJ7HXz75xnjT
 FTlVapUZ
X-Authority-Analysis: v=2.4 cv=VNndn8PX c=1 sm=1 tr=0 ts=68b85b37 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=iKSB4sV-3DizVrPEodAA:9 a=_Vgx9l1VpLgwpw_dHYaR:22 a=TjNXssC_j7lpFel5tvFf:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_08,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300020

Manage clock settings for ADSP solution. On Existing ADSP bypass
solutions, the macro and dcodec GDSCs are enabled using power domains
in lpass-va-macro which is not applicable for ADSP based platform.

Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/sound/qcom,lpass-va-macro.yaml   | 23 +++++++++++++++----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index dd549db6c841..3bfb0538dba2 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -79,12 +79,25 @@ allOf:
         compatible:
           contains:
             const: qcom,sc7280-lpass-va-macro
+
     then:
-      properties:
-        clocks:
-          maxItems: 1
-        clock-names:
-          maxItems: 1
+      if:
+        required:
+          - power-domains
+      then:
+        properties:
+          clocks:
+            maxItems: 1
+          clock-names:
+            maxItems: 1
+      else:
+        properties:
+          clocks:
+            minItems: 3
+            maxItems: 3
+          clock-names:
+            minItems: 3
+            maxItems: 3
 
   - if:
       properties:
-- 
2.34.1

