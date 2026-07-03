Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C9B368264
	for <linux-sound@vger.kernel.org>; Fri,  3 Jul 2026 07:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783064095; cv=none; b=bLrglXiHDeI5pd3xRm6Xbx7qWCuz9nRX1mOqezutKUexPls1XizZq1BrmwCGfQzWVTtGqfuD1PKp0tW0LKPlnzY5OAVuHlUDC5fQIJYv3o3tOi8KCxal8RdpKLeV5GUlptBjPY1xh9MeQYd5DsleRbDGwIyiLfuT5CRoI8GSOWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783064095; c=relaxed/simple;
	bh=99u5Gx55RAHeBQae4JhGigWI76pAnkMT525MBFVpwUk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HE51PJGMW1yOlZLAAg7soWP2dUqkZv4YcHdjwg/cvwg81zmOOIHRbcIBx/cB0B5mrU38iACt/m+u/lfLEoGiMvfEm/00Q/Y+t+McsjQHIM3SXvCe4OSZCSRH5YqYw6K7QzaZZX1aokSQGvLzJlhoQXQb3dWdYcPe3FH1CIT/cqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RB02tYsJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eVyE3Keg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RB02tYsJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eVyE3Keg"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6637IRmW3194821
	for <linux-sound@vger.kernel.org>; Fri, 3 Jul 2026 07:34:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WLvbWjfvxJB
	eH1l3LGJwlfv6v3165+AmquAxv/c+yWI=; b=RB02tYsJl/ZkWaTrT6fp9a152h+
	54A3bRkewFgQNXTCD71OP1t8TBGYK029kS+Wv9eO4KgxDLJICJz//2tu7Zx9Ajbw
	hBVsPegKjAKZ3vbxNOEMBG5eZmnC/Z2jLjMhKOQiChSvZ68whU40o2aDC8A638Dd
	lwzcCzjfHE9VOeg0KJedFyvzvTjDU7yfUVG6qQxD/ruorG/fjhtkOOEL8RfyyXil
	9yAMoKEl3QXVJKpFnHgvODtx7fMdLflz+NO1aOF2Fayl8emgQoAQqsZVVgVJBrYq
	/qdn/AKqb2i89BHC5oEnLjTZwQd90ScMtA/1qyc+KPrxhKULiSIJ2/VH1qA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68jyr24y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 03 Jul 2026 07:34:53 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c7f385887bso5271505ad.0
        for <linux-sound@vger.kernel.org>; Fri, 03 Jul 2026 00:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783064093; x=1783668893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WLvbWjfvxJBeH1l3LGJwlfv6v3165+AmquAxv/c+yWI=;
        b=eVyE3KegiiH97gYjPODb/C7Hi3j+4OzwDFS6OB5gu3OphLwvoEApDpB3AQUH3Yd+dH
         2lsunpOFi2q19wWp2AN00G5R1MJeGZXWVo7FkKDDzsQ72LsP7b6RezBgQXJocIZDp2e7
         DiHpz3AwNn3bUxj/AdhpSxibOXMcC0DeKloogG1/eNhunmi8MZb4aQATdIcEayRMQL7r
         eE3kLk8cTDE48uSLYmKh3cI97ft0bzGjcJp9CiUXVvgjLu7hKsyxlUFPfVZYFB5nZKpP
         5BTzFFgw5YekoIp7dbOaSHTMCRi5rlc15sBn/zT2/DEv3/udxXH13t2ySmlzPt8Y065m
         qF3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783064093; x=1783668893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WLvbWjfvxJBeH1l3LGJwlfv6v3165+AmquAxv/c+yWI=;
        b=PhX6KVa2iWcejWA61Jj+KEgiEw5kv8zsaq42/OZs6SHumNktNprSkqgX8uonoLnL3F
         Y2OpUDNugPX+aMFF/juLm5vs/Zsm1C9Ve2ZbzUs92+UZEmof4zKcSYyyR8faurNm/FUx
         u9ITQ+kf8Bn4iSs7PgXpV3S6umHKA8N1qoMXFEiYnSrZis15pd1jYQoyU9T39JYjYsbh
         CVdDc3Ip9ffOm3OqpmvTGVCStqYJlu6cB/1vuN+tc/U316I6ZJcwyDEEcns/tadijZxU
         ioTP9xrIEDa2m55A9ea9xQIGEQ7GkAuTGnmzFmUZg9sDKW++pTKolymab6s/pmdaNs0j
         BmdA==
X-Forwarded-Encrypted: i=1; AHgh+RoXM7dVle4ri0AItsMNGb2ZLvFlXpDfbij6AHUPiIhKHpqBnTq3PY/fivhiLXAwBE2Nk5G1ecNYXW0wcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFuHXSkGwfi6q9f1PqeNAIrQ7izNygvZT8Dr07wTX8WflfPmi3
	ceO1+HxZrBYXddCy4NnXEm7SBvoMCZQD1GGxzCN6XFjEgAWuoT98MKt/uMz+/gjRayRcgO9UsKk
	shxg6gAAZbZGsDMKF/kGC7BH5hHsBqjF2TZhzF2v3YxoDzxa9H+RPs2ttxLK+lifNww==
X-Gm-Gg: AfdE7cmbNh0vU7DcyhzCJ0QMgRECP9JipR41RQqkCrez54HGnV8dc9rKur64kaRZWfe
	/MXEOrHy72aaQHUbfVRp9UAWC6RjZhov6pfavhchzOzaDT1muGRx3bb4jz9PCtltIGsAzgMlvo9
	3Mhq+WMTMRCIrIahhWr8Kwzf6fT+E1a8FWWqsrSFdOU0zAELQ6O+YrzABkG1K2qZFqQ5j5QsIJH
	br8xmLcJ9LU0uugDhiKI/k59/TZ0OX5YuF/YIUKTwsgSscuw4PMxn6YEhgbjtZ7Y4HVI74bzbrh
	9ugEmPcOapISc6Z1b8CwM0BgZzl2mhjwTEAI2hr3e3BG4ufo5h3zqkeJ+hxWjlu0AM+NBArBTjv
	3LjdPJKVe1TMB9RbC+oeb+hAT/LdqUhjBOGby0hqF
X-Received: by 2002:a17:903:1245:b0:2ca:f4d:eff0 with SMTP id d9443c01a7336-2ca7e675bbbmr95990935ad.7.1783064092989;
        Fri, 03 Jul 2026 00:34:52 -0700 (PDT)
X-Received: by 2002:a17:903:1245:b0:2ca:f4d:eff0 with SMTP id d9443c01a7336-2ca7e675bbbmr95990675ad.7.1783064092535;
        Fri, 03 Jul 2026 00:34:52 -0700 (PDT)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f25e15sm5225465ad.13.2026.07.03.00.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 00:34:52 -0700 (PDT)
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
Subject: [PATCH v1 1/3] ASoC: dt-bindings: qcom: Add Eliza LPASS macro codecs
Date: Fri,  3 Jul 2026 13:04:32 +0530
Message-Id: <20260703073434.2589657-2-ravi.hothi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260703073434.2589657-1-ravi.hothi@oss.qualcomm.com>
References: <20260703073434.2589657-1-ravi.hothi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA3MCBTYWx0ZWRfX05mKWUJ7t0AS
 SZfGw0AjzxkibDzsDZ30jXKyWF0oT+i5l9KTiPwTvgEwHSZ67C0PqBKsbCq6rb8eCguDwEokwYP
 +yGpmYdsJX9MVfAAmPkd/g/nac1ORYCr7NfaQY0doMo9ikDRovI3Nd5611UstRK9w+6vtqLbdLI
 THllBlIjuvquVzI+JhmKPU1OPW7uswu4jo3U4eJN2xtBC+GfuLlLp0sFWQXbEcoaO5ZH1urOLMI
 E0u7L/GPfdETuaqW1hGVimAXF6HoKnqrCxKl49+2PB97yTSMdsWgE5wrjJnSuBCpVgDl9XJQzno
 AvABkF0lUyydi56pdAqjgg0KuR91z27TIS1l+jISJE/J1r6Cx+BR4YZU7sq+/s1OBJMlPXva/1B
 qPOhn+wkCddZPrqPqjhmqeKNPVz67257aQBklhjSaBGTUBSRdRwVN+E8J7gSM1544X3aKGHXAIf
 yI9NKA/B4IAOijwkM6A==
X-Proofpoint-GUID: d5NbTHN6wibS360eMHU4G8RlekK8m1Ev
X-Authority-Analysis: v=2.4 cv=QbFWeMbv c=1 sm=1 tr=0 ts=6a47661d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=l1jcosV-81OWBb0gcykA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: d5NbTHN6wibS360eMHU4G8RlekK8m1Ev
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA3MCBTYWx0ZWRfXzoaKv6qhKMyn
 tQPXLY4VhFRWA1OMmoqfSLIDYR61Cn2Ct0EZXoIynIKnz5bGn4dqiYD4I3brh+3GyOXhIqDcpPI
 mnrPHAxgNDyHT5VtSw5gS2VMCqwCb2U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030070

Add bindings for Qualcomm Eliza LPASS RX, TX, VA and WSA macro codecs,
which are compatible with the existing SM8550 generation.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml | 1 +
 Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml | 1 +
 Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml | 1 +
 .../devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml          | 1 +
 4 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index 2eed2277511f..4988e7ed6e34 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -21,6 +21,7 @@ properties:
           - qcom,sc8280xp-lpass-rx-macro
       - items:
           - enum:
+              - qcom,eliza-lpass-rx-macro
               - qcom,kaanapali-lpass-rx-macro
               - qcom,sm8650-lpass-rx-macro
               - qcom,sm8750-lpass-rx-macro
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
index e5e65e226a02..d8682ff2e82c 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
@@ -21,6 +21,7 @@ properties:
           - qcom,sc8280xp-lpass-tx-macro
       - items:
           - enum:
+              - qcom,eliza-lpass-tx-macro
               - qcom,kaanapali-lpass-tx-macro
               - qcom,sm8650-lpass-tx-macro
               - qcom,sm8750-lpass-tx-macro
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index 5c42b2b323ee..aea31fbdad37 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -21,6 +21,7 @@ properties:
           - qcom,sc8280xp-lpass-va-macro
       - items:
           - enum:
+              - qcom,eliza-lpass-va-macro
               - qcom,glymur-lpass-va-macro
               - qcom,kaanapali-lpass-va-macro
               - qcom,sm8650-lpass-va-macro
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
index d5f22b5cf021..9fedd80532e2 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
@@ -20,6 +20,7 @@ properties:
           - qcom,sc8280xp-lpass-wsa-macro
       - items:
           - enum:
+              - qcom,eliza-lpass-wsa-macro
               - qcom,glymur-lpass-wsa-macro
               - qcom,kaanapali-lpass-wsa-macro
               - qcom,sm8650-lpass-wsa-macro
-- 
2.34.1

