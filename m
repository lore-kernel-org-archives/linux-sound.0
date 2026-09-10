Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5012619CD0A
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 23:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789082225; cv=none; b=W44u/TxcL7HsrsOb3a1vTw694KhAHNzSK3wnlI72UjiHN/4KHv0Cg30GhZKW0qh9Kaa0hxLeNJW/nN711n1Xhjw2U5GlWau2xrIPq8ngiMnJVhZ/0m3lR0gZdxKaTyT9XroRNkuq3qt4smR82QAnOyL47G9vsH+cUn7SBEOtDRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789082225; c=relaxed/simple;
	bh=BTk3PCGBAvoAeGTUHw2QCk8i7VYx7TMYwqdzeJxrQ8g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=W0wrjJU4ylbtAv1tzCdjkL8iLX0tyGsFquVCV2bZm954136IGaBH+KUab4TycXNN78fST4W/ovLN70OfwPNOIMJdfK7Hu5hhwmziF1p/3KpRFRnetOghhy8jhdda3CH4/CL4O2YNTO43QyQgwn8330HNcuORZKdBI4OYy7LualQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m5Uzbbyb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FERxaEXD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m5Uzbbyb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FERxaEXD"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ALTT6i2995849
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 23:17:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+MjNgsDhMva
	2Slm4iGEQCcjo4eVlo+darmYTizZsRqo=; b=m5UzbbyblkwHvez0OuYIrL7a6Sc
	AujQ9kgGv3dDD6uGMhZxBp31w0KorBoWUfuUN7Qr7u9g5ZyIjer45r7CHMy9LCXD
	vm2q2hj6WReEPiIWLr18Aws0UgAmh6kIObev/fgK7NZuw3BrUyYBlGEcbmQRmOJh
	Fo2os7puZZZaAPCUrGh+LcWY/Gpmfatsb63IUKPW00zpaoHZ9sv1+PiqPwvbO51t
	1hEjxnkjqf4O95XkcQDb44udgGDDXAUWq74JBkMqls/JIaKRO70N2+AlEVIpAMdU
	Cl50+m53CbIfdF3FsX6VfM9wEvxq1QamOiTOHEbXxVT3Giri4vS+NwEJ59g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkxd8t4cp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 23:17:03 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39512608fb1so618526a91.1
        for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 16:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789082222; x=1789687022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+MjNgsDhMva2Slm4iGEQCcjo4eVlo+darmYTizZsRqo=;
        b=FERxaEXDJmdKNnYXgAdyv0FKPsWd9Ih+Dykn5JIHTRXIaCK+wWN1Q7PdsO69m99q63
         voK7ZyioMYY82JbgawGKXoGLyOZiXpYBqm8XF+TcdS2ZkrYGfzL8RGrCCveDzvXSQqEP
         bebe5yzvB+hPfP3c4r+sbKWXLnktwGbTlq2MUn/9WZ2PJ4bErjOLPy18ohNYxVKrI4ze
         FNSKGt7hkwVqSZRnypbcn0AnMFQNsc4cone6Ok/YwwqGiDzeuJjcQCh4w8X0MxkGJgy0
         6fTaaDbwu/vi+5b7GVxNR1Q8IOOH12JFP0PXmpMagz8BdRvD7wYvpuDjAHFpSdkfj0rr
         LRPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789082222; x=1789687022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+MjNgsDhMva2Slm4iGEQCcjo4eVlo+darmYTizZsRqo=;
        b=mWzQ5T8aKSD2XonQn4mFXL/RjDagIYt5W7qKMxYlEUWGSL7Ug3Tg/E6idfEMj9arj4
         ovDsgDPL5XxQtOGBYT/uqqKuj2wj3oN5uQcaNeFzfY/dgrP+8unxKwi5chhKtVJLYKut
         15rLdhscCvQr3OSiTBoPvzY4bjXLKLG2v5Ha5YrSbmqzDmDcvmX/3uDk+7nt6nT37xQU
         9gxghKSA6rdXB9lYgvHtmHhljR1t4bCsNR5hbO5YxLUq0CEIfM/nM6cCnBGPaBXEx22W
         vPcUVNDvGLJBRJ1VN4QY0vHMRyZObVQYHJ5nco0Yi615C/14nZcU/mZj/Rh9tlmXTFvH
         PWaQ==
X-Gm-Message-State: AFuF++mTnyfUxMD7dtFsKjBiT6/OlKfxXlHT2M26LOncrQ3fmt1mM9oY
	RHYZsQ4tp0g7IMVrQX0zo1ADO9i+Qlw8X6Kr9tviIIuVBjn+vqu9xzQjUJ01pQxyG2gqaCeaZ9n
	+HbgxhrAgv6FvS12bu8+brNCfmFx/ASOoUlpLUq6TREp36BDbemfsUyCBh1XdVXwcRS5QWnyZCQ
	==
X-Gm-Gg: AYBFou3UdDmIl5nmp3ExFSxj6aipOcWOhs+1y4NNcaC72V8IZI72ZLTCU766iPsAcuR
	OOFjLYOqTj7DYsF0ZKmsK7D3BOUYpcVs4tO2zpAczwNo7tLVNnW5owd4bO2ZukOBRuJSxZrthu8
	HJtBvo7X8OfEVFya+aO9dzDkULg1N+gJlBC+c5mCwuuv8TEZ89kntjsvdeoqzVP+bO6hA/9y6+h
	NqXBV/QVht5h7cV2eV6TMIYhQl2L3bZMD3eQPbdP5bPb7FD7L3CsxlvFoTtDuQaQMyULecwFcZP
	9PIjsGZznNdJREd/eSI/y/cFrNue7ao+HzPBXtknlClQzIRU95/NDDmMCqja10w3kUky2HnLziw
	FV51eNo4TGf9yHdgN4PyRSrj6sj5572CxrSoZ
X-Received: by 2002:a17:90b:586f:b0:39b:66ee:a14 with SMTP id 98e67ed59e1d1-39d9c374d49mr1593393a91.25.1789082221732;
        Thu, 10 Sep 2026 16:17:01 -0700 (PDT)
X-Received: by 2002:a17:90b:586f:b0:39b:66ee:a14 with SMTP id 98e67ed59e1d1-39d9c374d49mr1593327a91.25.1789082221250;
        Thu, 10 Sep 2026 16:17:01 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f7390csm1204374eec.26.2026.09.10.16.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 16:17:00 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/9] dt-bindings: sound: qcom,lpass-va-macro: Add clock constraints for shikra
Date: Fri, 11 Sep 2026 04:46:35 +0530
Message-Id: <20260910231642.1794948-3-mohammad.rafi.shaik@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: jOgWucWkZbyiQGqd_AN7UmIrRxR-lt7O
X-Proofpoint-GUID: jOgWucWkZbyiQGqd_AN7UmIrRxR-lt7O
X-Authority-Analysis: v=2.4 cv=PchqFShd c=1 sm=1 tr=0 ts=6aa33a6f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=TQ3ku2UXUW4xEZd4FcAA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDI5MyBTYWx0ZWRfX/XibeWV/38a6
 Y/q/k8j2Cbfd96PBkZ+M2uh2lRaWv3PMa1q4+5m1Htq/DiUr/dtR5pMkh4wHawjWs9Yy/UA1PLp
 LARW0SbDNQ8k9SR2zzjqgQSZxeOiWV91iox7p72u7OcwFkFF7IMbE3yGIhnHBDT2y2ar/dk6bDY
 gi6OebyxwTX4dQaP3ZCrdAI0mUElz8nVx/WBBVh3rSha/AaYeu/8nRyyZrgcY3sGILxUn5D4bYp
 b5w9vn2kILofGhV8DtPLCmcJivCGRqSzqC7B4VkeGDG77brW+VTbRrpk2IeuXmoz2TOBGGPzGJs
 lwp9DfSenuJVOo8nBQJ9fCA3y2ZhOLJ2Fsfr/7k5Nzfk/iOPOYq2hM/T2nf9An62HHJew1usp//
 g4lN5RulrkzqDUb6hP+HBSl5imrIuDUKQcSg/kNVkCqWczA9AfzgjGgQD2rxwN5FqI4gcPcQ2Rh
 3y86wr2vOAWqeZ9YkkQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDI5MyBTYWx0ZWRfX/qBWgYI3C5h4
 aP1JfE3FLmC5WSsYiiVjVjizbqKZsdVao7ovlfxFI5+c3eZjMzqm7jssoX4mcgmBoXM5S5ZYHT6
 060xE7bXv+FNGuS9S11IowPDKe20nQA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_07,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100293

Add an if/then condition for qcom,shikra-lpass-va-macro specifying
exactly 2 clocks (mclk and npl) as required by the Shikra VA macro
hardware.

For the RX macro, add qcom,shikra-lpass-rx-macro to the sc7280 clock
section as Shikra uses the same 3-clock configuration (mclk, npl, fsgen)
in ADSP-bypass mode.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 .../bindings/sound/qcom,lpass-rx-macro.yaml       |  1 +
 .../bindings/sound/qcom,lpass-va-macro.yaml       | 15 +++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index d2f68b02566b..d0227c3114c4 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -69,6 +69,7 @@ allOf:
         compatible:
           enum:
             - qcom,sc7280-lpass-rx-macro
+            - qcom,shikra-lpass-rx-macro
     then:
       properties:
         clock-names:
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index 23f00de82cd3..e47ccc46d3b7 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -169,6 +169,21 @@ allOf:
             - const: macro
             - const: dcodec
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,shikra-lpass-va-macro
+    then:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 2
+        clock-names:
+          items:
+            - const: mclk
+            - const: npl
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1

