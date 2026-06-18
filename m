Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0DBC3B4EAD
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 11:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781782533; cv=none; b=j+IyDyRqYbgiCXaAUjY5yFAerGCrXXMK2y2I68gtn6qoqJUqiGZ3fBn8HWWlSJIbnbg7S+KFhL7blyqJxic4z+OvdTzcRWSV6Y8sMDaqZdW8jXMzq4ByHIzd4/2y8SXwlSuPtX3WZblz018J9b8PRg1y5pLhney5ZM+zqTNOXkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781782533; c=relaxed/simple;
	bh=iRtdvRTDQSfdyEQ1b2qU5Q6iD9i2989RKufwXpCNRqg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Eji+ymgYG6Pdjd6wIvB7BhErRCw3LKGNrNavLf8l13YhAnT8EXOLZC6qkSGlQCv+6ErfZ+KvoCReSRDrlpmug9DGcJ7YrppQZLpSxN5tmGOxTct5p5OzLRdtMovi1/hbXhLk22i8WVQgdsk1+GBQfR6Hx8zNr14i2hZM0Iok34w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q077ZOca; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=frz1cNpH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q077ZOca";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="frz1cNpH"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65IBVtSl1685111
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 11:35:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LiOrWOZcYYg
	JyOgM9hIn/xfWjfsbdg8NMESze/VVPSA=; b=Q077ZOcav2PPM0hXuwhBfXYt8nQ
	z7eEWw/LAFmplWbLmjnWVrlr1ylG2/8e0GyIpOsSMOVakpJTxkx/IqRIIjBxHqlT
	RyviRx7KXJN7Z9VLK+NJZJWl/IBzCmJi78LjI+2mEDCJy3yJhzTa4MzGptMsmJdj
	hIMV3Oy3WcevZaw55vr3DLy+yfd9IW7yHFGDP6UhBr/AX9XA4R0pFyB69qOXeUxB
	jrYPZc1kh/5FJhXiyGaFnstKzmY385C3BKfjUVE33Jh9YVuwBxGHiBQk0Jw1vVSi
	VmwoL1pI7sw0USmKhitgDo5W/DcMrXDSk/IuYzkGjCTzHoBQcA90foOIQOw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eux2jvamj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 11:35:30 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-37c6cc4e179so1049833a91.1
        for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 04:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781782529; x=1782387329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LiOrWOZcYYgJyOgM9hIn/xfWjfsbdg8NMESze/VVPSA=;
        b=frz1cNpHjjhDbFEtzB1EADcPOxVNQ6Oymg5VOS8VFD7fXi4kKNeC8/2bzQk2X8DPce
         zqPFjUVuerlCoRi+ZuCQOFTOee0ZxJwboEH3wcDk7Fykyf3ZRop7JmAe9grSIlgZeNsk
         3iXkoFB7HIJF9aHQFPUPbY3m4N9wnx07tMa5JjohX77iOyPWuPMtB30sksCmsnVYYc5L
         q4KCEsbwlOR/e75L2lck7JBJCBII46W+NBG1vGdIcYm8TjG00FS+ZDM1X4HZBBFeAm6n
         R/wN+ekwdiAN6597ePnjMZipNn2gFNkAat9jbg3U6iT2O3/26220v3hnWi4xH1WHACIC
         TFtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781782529; x=1782387329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LiOrWOZcYYgJyOgM9hIn/xfWjfsbdg8NMESze/VVPSA=;
        b=oGuDLD0uKzUIxwNahcMS+6mg2d6rELXm31aIFvBxNsVSkHtXO7Gf9YE7HNkihDrzSC
         JlVucVKj1THd9icrEKScJwhXNuDblN162PnSPmMpbpwBCRNKn9YRtIZ6mmL+AWS0tI7/
         48pTqdS81XDLsapArK48SdngtWQgCiZtfelnR+bEooPPRWCX/KJtxbpYNVP8iKiXuXca
         ToXXg7PIzytC5lAZ9l9wy15sdLpPN5tbKtkEGaj9qnKsvlf7yyOW25SPTaHHWTkArs+J
         A51DNZBu3kwPXcCDVNtJTUn3hsQuunwSY21slNlfQa/nVu4BBd9t8LwcIh1Wqwyo46rN
         sErw==
X-Forwarded-Encrypted: i=1; AFNElJ814r8csLEHFw+L7VROncu37VBe73O3xDHxq+QubkoiRAK6eVjrMajK7pk0bYJq1KUt9tMclrkuI6Mt+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzSiKoJInvS8YdKsJz0UOX8kR5ZhzMX4EoUf5lIOAnikIlZB7Y
	eMA9NVM1GY3CJuR6GwXVcke06LjzPNxUTtg1CsQetqaDtqniqyZ1zMlPJcMoCHrM2EiIGIvq6V8
	N9jUXkFbGkpHuwKfhx03ZOD7bViP6vjB1Wr595mzfTfunaaixUwY1XGntyqK8rdddow==
X-Gm-Gg: AfdE7cmoYYYGRXzEHhQtmJETQo1Fo3RckMQnLCFiG5bZEJ/2urYzVa8TQGb5TNwnU1O
	ruKM6FJyjRxf9GPI6Mt2OmqJDZf003rpfYGNRvk9J2xNvQ4bKmxhklGqBfj+uGYA1e95v898IQe
	fLGrkjCJRYHwNHL8UGaB0LczjKDLLeRD7mGGFr+XmW6mX3UQA0QXptPR9WDKukK4SMe2M5c8EZg
	0K78E/31R4IeOJD3nkkmovIGNGwt+sMNYpbiEn+8cihj8tbji+nuFZLgnUs1jpn2+g/PE8zCByd
	h8HwS4LCDKGuA3lL7DzZi3mtZm7JCH6tlppgqwuJ+hIkKwXnecPbQBOpYtX9B1fkIG38KDl8WMx
	hj2d+rxZM1DLRMgEvjb+FbO5vbJpacXYloeEEswg=
X-Received: by 2002:a17:90b:390f:b0:36d:635b:85a0 with SMTP id 98e67ed59e1d1-37c936a1d28mr8713784a91.3.1781782529346;
        Thu, 18 Jun 2026 04:35:29 -0700 (PDT)
X-Received: by 2002:a17:90b:390f:b0:36d:635b:85a0 with SMTP id 98e67ed59e1d1-37c936a1d28mr8713756a91.3.1781782528920;
        Thu, 18 Jun 2026 04:35:28 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c521ca7a7sm9067856a91.7.2026.06.18.04.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:35:28 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH 1/2] dt-bindings: sound: qcom,q6apm-dai: add memory-region property
Date: Thu, 18 Jun 2026 17:05:08 +0530
Message-Id: <20260618113509.2025881-2-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260618113509.2025881-1-ajay.nandam@oss.qualcomm.com>
References: <20260618113509.2025881-1-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDEwNyBTYWx0ZWRfX152qY7i4oirK
 K+/Ko8CNxcITHfBX83LR/LBCnib6XXwZGCC0rFOMnBN5/YlUTQdpNO6MSA8zau6uO6IpD5koQ+6
 Nm5c3uSFjiRsNC3aw2UBA3OtB02r1oXksbkGTLn+/65SopEaWy57lxXI2x0h5pJhkhJ/6ZAQ5W+
 DMX3JMbOr2ekHS4MR2lurCOJPZ3jZtxkRCk7Sen6A2i8HXgYmCt03ZDvRIZdci5xClOvPe2JjMf
 QYlh09WfIZKo6MY9gjFdMx0hQW+wxCyi5kePe70v7+P9WfUp24f20YT/3i5hZLgfYoylKHPwwOm
 RYIMDKIcjnmnLf8Lz6zp1nnfu9aG4vJEUOsowUXLKfvjCE8WhbYcaEh8FLKvrb1w2ouA41aCBVV
 izikV0+sM4znYdxiqvR1PSbI0grl/VDm9WHnHhgw/ekKcUqTo6sN2fTHU7hYGufg9lnuvORhTJU
 RL2Z9g1OheL71tMCpGg==
X-Authority-Analysis: v=2.4 cv=Fsg1OWrq c=1 sm=1 tr=0 ts=6a33d802 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=PVp8ma6cCIai9-343ekA:9 a=iS9zxrgQBfv6-_F4QbHw:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: zTcvu1qq4BZks3cACuHn7IHMI_q4U2LF
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDEwNyBTYWx0ZWRfXxMSjiQGfRFSb
 vcBJngPI0txyUHrAu5yDeWdM2+T4zmT4Ydk+9ueSYBeZ9iQccO08z3qWwEb1/65D8n3idohUSEq
 ccZKtCZ7iBMRjvjCde5Qw/eTFmU4KVM=
X-Proofpoint-GUID: zTcvu1qq4BZks3cACuHn7IHMI_q4U2LF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606180107

Document the new memory-region property that allows one or more
reserved-memory carveout regions to be SCM-assigned to the VMIDs
listed in qcom,vmid.

- Add memory-region as an optional phandle-array (1-8 entries).
  Each entry must point to a shared-dma-pool, no-map reserved-memory
  node. Index 0 is the control-path buffer; subsequent entries are
  data-path buffers.
- Enforce via dependentRequired that memory-region is only valid
  when qcom,vmid is also present.
- Expand qcom,vmid description to mention carveout regions and the
  qcom_scm_is_available() probe-defer requirement.
- Add a second example showing both properties in use with two
  carveout regions and two destination VMIDs.

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 .../bindings/sound/qcom,q6apm-dai.yaml        | 38 +++++++++++++++++--
 1 file changed, 35 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
index b767625985a7..601055182da6 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
@@ -10,7 +10,11 @@ maintainers:
   - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
 
 description: |
-  This binding describes the Qualcomm APM DAIs in DSP
+  This binding describes the Qualcomm APM DAIs in DSP.
+  When qcom,vmid is present, the driver performs SCM memory
+  assignment for PCM DMA buffers and any reserved-memory regions
+  listed in memory-region, granting the specified VMIDs RW access
+  while retaining HLOS as a co-owner.
 
 properties:
   compatible:
@@ -20,9 +24,24 @@ properties:
     minItems: 1
     maxItems: 2
 
+  memory-region:
+    description:
+      List of phandles to reserved-memory regions (shared-dma-pool,
+      no-map) that must be SCM-assigned to the VMIDs in qcom,vmid.
+      The first entry is the control-path buffer; subsequent entries
+      are data-path buffers. Only meaningful when qcom,vmid is present.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      maxItems: 1
+    minItems: 1
+    maxItems: 8
+
   qcom,vmid:
-    description: Optional list of destination VMIDs to share PCM DMA buffers with.
-      HLOS retains RW access as source owner and must not be listed.
+    description:
+      Optional list of destination VMIDs to grant RW access to PCM DMA
+      buffers and any memory-region carveouts. HLOS retains RW access
+      as source owner and must not be listed. When present,
+      qcom_scm_is_available() must return true at probe time.
     $ref: /schemas/types.yaml#/definitions/uint32-array
     items:
       minimum: 1
@@ -34,6 +53,10 @@ required:
   - compatible
   - iommus
 
+dependentRequired:
+  memory-region:
+    - qcom,vmid
+
 additionalProperties: false
 
 examples:
@@ -42,3 +65,12 @@ examples:
         compatible = "qcom,q6apm-dais";
         iommus = <&apps_smmu 0x1801 0x0>;
     };
+  - |
+    #include <dt-bindings/firmware/qcom,scm.h>
+    dais {
+        compatible = "qcom,q6apm-dais";
+        iommus = <&apps_smmu 0x0c01 0x0>;
+        /* index 0: control path, index 1: data path */
+        memory-region = <&audio_heap_mem &audio_mdsp_carveout_mem>;
+        qcom,vmid = <QCOM_SCM_VMID_MSS_MSA QCOM_SCM_VMID_LPASS>;
+    };
-- 
2.34.1

