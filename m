Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5560B4BF92B
	for <linux-sound@vger.kernel.org>; Tue, 22 Sep 2026 09:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790070207; cv=none; b=mbxTSGgswNhwZ9g+n2RahZVnXwyVQnJeEKMkw6MX6nGB2vP98TI8eRB6rilc8qR8uQXxdOOdsD35MqLM67Brfp72F69OS4kHw3vsYov4kd63oLns+y9pun9g37f/gCbFCqPnEMhYkr8B+qsckF4CxYYdF1B+OwmONOAOMm2xVvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790070207; c=relaxed/simple;
	bh=8FpQYJUuPKkYwoHx3NJMkG5u8wrpVgNGMsqjtggKG1g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GYiG4ww6UzMP0zDqQ99ipQDsOlVg7SDCZfsDY8LKlY5d2pv1Bvr7E0NM+XzxytL6PjAX3pnF+n6fSVtqWs0RgxU+oucL/Cd3Ag/g5JJn3l7Pfeff+l8LPNzkavEetftEIsAvuDeW/+0Lqt6U537Wp4kZXN+6quecmFWjfhS1nEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=chuXp4zE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G5e6neC5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="chuXp4zE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G5e6neC5"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M7kEWJ3713018
	for <linux-sound@vger.kernel.org>; Tue, 22 Sep 2026 09:43:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P7rVarFPM3evUL4tHisXHPpNjobLXC3gpNoUHylt+Sg=; b=chuXp4zEBIINxdle
	eHPOF/tYrxZAq8dH3QmqxEE0tE3CeIvpF5hoIPvdIUBH21MvbCdB+ulUuXmTeEFg
	XGmmCX4/LoaaXRNbiZAKuH1B3c3s7ffk8BYQe0Oth9i7z7FECkSgJVx5sc3fPPht
	lkli51Ms/SLF3RiZO48hzRhNjNr6LAicMu4IAmjBpvZOULEvb47e5oRloY2Vkp+W
	R8Sp6H59zHARie8kTJbGfFZZlO5XEMJ4q5Yg4uPJjBmoHK2qcM2bj/rkF8rPS0qp
	tzbQL3AHHnbEouXd7LeKj3CDnYPblZ+vdIsXtuCMrWNCqC/EfB46YNvqwnsOdspS
	K+ijLQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gunjyrhbg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 22 Sep 2026 09:43:24 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbb92868263so3305341a12.2
        for <linux-sound@vger.kernel.org>; Tue, 22 Sep 2026 02:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790070203; x=1790675003; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P7rVarFPM3evUL4tHisXHPpNjobLXC3gpNoUHylt+Sg=;
        b=G5e6neC5nEXqhoHYP2O4mL3TfKsSr+7ZiXZ7S7l/EAM8hiXMYsr28sj3NifTdbWyet
         xhNzHd0ds11yEqP4kBu/AwzV8mcbby4e7Kd2oJRXbZDqfFc4hlOhFdJchmFhd8yQRrmy
         VePbNvhTVhfxNcAmpNaWkViATCSffd+i83ds3WfPk27aB5gDe+spqgdQvYCmt9S3My1G
         hAXtxxixslrpkOsFMpgUqgAYBAwzw5L6MaTUn+RlfjU0SiTh7vxTz5nUDMWqglYqWEmx
         seCKB5Yd5HjIK0cpbkK+PEnukMA6hSwsg809uAPzDdOy7zJdOmaF3VRbCw20EissIlgf
         OSng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790070203; x=1790675003;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P7rVarFPM3evUL4tHisXHPpNjobLXC3gpNoUHylt+Sg=;
        b=EM40cnCNZu04Q2wtX+CPMHymGLythqNRX4M7QhBNjTRBxD8iHFJvM6Q0xqXFWr9PeL
         ku6yYwfo3mtWoqmAvacPdsfzXSSoeRxG3CIsVFXzS6Ab9pC74A1pkMWKW000L8KxHiWM
         AcKG78aHmHUeniKm5YHgb1HksYGS/JRs3PlcD47oyQD6poqEBjj7ZBq/xWVqgCGf1BpE
         vWFffqzPMY4+1clnssRWZY6Wzde38D5BVXeJcC9tMcLoDOIvHW4HVMJMhSJ5RIGxUbzP
         JJh11fDmHYizPcFK0SFcc3KU6hQsEFo2dCOCmfhNjgu17smZQNBedgEM7hArD4wVyI7V
         bIlw==
X-Forwarded-Encrypted: i=1; AKwUvByI0TU/PJk2xLh70WeleZTewsa1CDgpMxp6Yg9gqTCadLVsccEgDAhNXIYdZ7f+pL+h+AZs97OuAYXdZQ==@vger.kernel.org
X-Gm-Message-State: AFuF++meyTxi/l2fkWpo1AhIoxSLANbLV12qt+DfsKCiwZ4M+O30ZKIJ
	oqT9U7HxtAzz1enMDEsdOXVyGWDJHudqFiMTa0Y+yPnKXOcjzhEls20A0ToWP5WOvdhM5zs9nJO
	dbgz9qMqqjMs5ExKdAOx6pDXeKPaJyl9QwmMHX8kgtSuOKYKvXHlBmGrr2KqbIeaZfQ==
X-Gm-Gg: AYBFou2Huybv5fr3quOrwtPKYmQxLb1wuCiqaZ6/Tc4PcEfZN12aaNcqSjsDytM8Z79
	PUC220zBA7DZ82kL9EuP+1/4+FuMdgBrzmS5bI1+ZW0YlzTZoi+IeoB8BoBCNn8ltKHFbK4eYoW
	RXhcP1Frj+pihYETlJfer+Kd+CNpO5Tcfug14B3JUq+kohzFqo91LEhD+g8VhMD/lvZo77BKrJ7
	wV4CTlhk5jdxoWnKXM/NbQNebdMQoBTlJgNsiWKmlvAwZ1KbVD8BX+Pse3aHfeRoU9bFHdt2RHH
	9Pa6EjuwBpnPwcKhChqMHkrpI478kwvOfOi+aNDMcC7wJnwuXGjk+Mz/6DUSXbz3Zl0ZIZyHrAm
	Y9MFX1JsjIlbZZjqEMWLpp+3TeXkLj5GA8Q0=
X-Received: by 2002:a05:6a20:e390:b0:3dd:a196:3099 with SMTP id adf61e73a8af0-3ddec80dd98mr638756637.73.1790070203100;
        Tue, 22 Sep 2026 02:43:23 -0700 (PDT)
X-Received: by 2002:a05:6a20:e390:b0:3dd:a196:3099 with SMTP id adf61e73a8af0-3ddec80dd98mr638729637.73.1790070202659;
        Tue, 22 Sep 2026 02:43:22 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f2a44cc8sm3776183c88.13.2026.09.22.02.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 02:43:22 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 15:12:30 +0530
Subject: [PATCH v4 1/8] ASoC: dt-bindings: qcom: Add Shikra RX and VA macro
 codecs
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-add_shikra_support-v1-1-6c6cb6444caf@oss.qualcomm.com>
References: <20260922-add_shikra_support-v1-0-6c6cb6444caf@oss.qualcomm.com>
In-Reply-To: <20260922-add_shikra_support-v1-0-6c6cb6444caf@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790070192; l=2711;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=8FpQYJUuPKkYwoHx3NJMkG5u8wrpVgNGMsqjtggKG1g=;
 b=7FIfV0k+Iv9Jo9FJMNSSqjVi8WXqPVOh8yxleuccMIIcWMiR1pJZy3H9YtWMwHPo7n/FFgucb
 GT9yd/pEVjwByYC3zd1V63cvW3xe72y4rMoIefZaSx1hmpVFf9xO1nd
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-GUID: QxDwlpWZ4sSlafgHkQhvf8V_dMCXBdhc
X-Authority-Analysis: v=2.4 cv=KqHYSmWN c=1 sm=1 tr=0 ts=6ab24dbc cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=cvJDH5HnDjnG4tsKpogA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDEzOSBTYWx0ZWRfXwwsH+uilsBfN
 420/6CCcZvO1deF1m2kMo2suI1y7Zoo07LshxGDKrwm3ltLrIsDsfK5J+Z/2epFlwihg8UOpC51
 qZ24KM09mj+iJDEBp5hUK92f8xy0Qja1fwI5vvj0NyTlMyOVbgH5CyvwxXm87Bz5Qrx76X/7uf1
 xIiWgFdWR8/oyIuYfpMUxyV8EIoiFES6ReBFP5dN3HrbOyK3M7hkg+P7AAZZ8HhiYsSQJ1mldMk
 XAcCPxz4hFESstkOE3nTX/merwIGb2MMWFtN5wFa/ouSliXEkvTwNYiYVsgy67Uoh7keFVmjmn1
 4sPWHR9tAndAC7bj4QG6DCA3O3t+HsGWgN8gCFs6m/e2c8A4Azp4ebR/gKi68XwR8xdUfPs9i/x
 bX8S8KzUW0ENcywZSH+gFAGnTT/j5CEZGc7jrt+T4yYh8eeKuoDSnsQQti8J/qFs/22/7k/YfA+
 DMT0AjAfJQIY5oZwBkQ==
X-Proofpoint-ORIG-GUID: QxDwlpWZ4sSlafgHkQhvf8V_dMCXBdhc
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDEzOSBTYWx0ZWRfXzIZfKFX1llGP
 kSf4Nwbal3nFyJfv//vj2KcrFARtnSwYC30JAR3250exmjlbV3ztZxZMt0zDZXvhs5GxTqFi7eF
 epOdmkzd+pGDM/iljDoow7yKGR5d2M4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220139

Document compatibles for Qualcomm shikra rx and va macro codecs.
This SoC does not provide macro and dcodec clock so reflect that in
the bindings.

Shikra integrates LPASS codec version 4.1, which is not backwards
compatible with the already described compatibles.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 .../devicetree/bindings/sound/qcom,lpass-rx-macro.yaml  | 17 +++++++++++++++++
 .../devicetree/bindings/sound/qcom,lpass-va-macro.yaml  | 17 +++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index 4988e7ed6e34..69d7b7332d36 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -14,6 +14,7 @@ properties:
     oneOf:
       - enum:
           - qcom,sc7280-lpass-rx-macro
+          - qcom,shikra-lpass-rx-macro
           - qcom,sm6115-lpass-rx-macro
           - qcom,sm8250-lpass-rx-macro
           - qcom,sm8450-lpass-rx-macro
@@ -138,6 +139,22 @@ allOf:
             - const: dcodec
             - const: fsgen
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,shikra-lpass-rx-macro
+    then:
+      properties:
+        clocks:
+          minItems: 3
+          maxItems: 3
+        clock-names:
+          items:
+            - const: mclk
+            - const: npl
+            - const: fsgen
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index aea31fbdad37..683ebf702ba8 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -14,6 +14,7 @@ properties:
     oneOf:
       - enum:
           - qcom,sc7280-lpass-va-macro
+          - qcom,shikra-lpass-va-macro
           - qcom,sm6115-lpass-va-macro
           - qcom,sm8250-lpass-va-macro
           - qcom,sm8450-lpass-va-macro
@@ -168,6 +169,22 @@ allOf:
             - const: macro
             - const: dcodec
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,shikra-lpass-va-macro
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

