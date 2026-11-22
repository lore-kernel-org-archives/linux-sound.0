Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795372952;
	b=H1TGUn3ZrRmiJHNa62z/UlIco45BO+WXyGiTr2GbkJ4iuHDzkfn7HSxajKubyy6prDIs
	 CCId9m4HvdFO0RPLF3hDIfKKCXCyRawIGuTMFZjIw3h6uRNze7VngDkGUv309/ZgbiGG5
	 cEseul37afHVZuyTBeQ8KxRMrkrlTw17ASXfi8wpIy94K6OJP+xR+Z8NgcF055bK4Xza2
	 qpX7jJflIpCil42wTZqED4EAuLJfjvHcRoGZaB262MxdgdWHCs5N6PMoH2eeOv3sfGbRS
	 9z7gGMeTmelx99Pbl6D6HDMJfCkrpkKcsM33TYP0J3qdubcDtq+XUohWd5yFKLJW3AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795372952;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ykSVHswchv2omQkjOeouyF/PE+0Z6GBM9cjMFah+F14=;
	b=hcAUJ6rHrwaHO1BYQMvIcmeT4VWB//VS3ZRE08us4uqgHkel2XGTfvvRfy3aU/ZiOcv/
	 cXT1HfEK9aAbepJuxVrkl0Czsd0LaLuJ1MqngPLHmOkri34GGbSsgg+v7htn3EdEvMXOe
	 rHI8b2I8bIPAhsby/xZDke+RWkREeYAQe+onKAuYroD+bAMhcDCTgNRipidAT20aCbwKf
	 y6dO/2wTg4tLjxobbgga4WvuSHCeMciniFNn8vDSxV/E7rcqqfZIbDJqxuUReuUJWY+t7
	 Jke57gw9BK3e/qS1eBS/GBvRDgBk1UrRKK5binW52P2AdLpFN0+X9vpF7iMjEA3iBrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FzFFHRxg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MhVDS0Ep;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9AB606A333
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 18:42:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B9AB606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FzFFHRxg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MhVDS0Ep
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMGVVJ41381654
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 18:42:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ykSVHswchv2omQkjOeouyF/PE+0Z6GBM9cjMFah+F14=; b=FzFFHRxgFXmRaaZx
	Uj20ZBBvGoLXj5+5pI+fQHPGrb7A7Z0GxpFZR/Mmz2GlCBVprkghpBuSuwuyXrIU
	yrDPKzMhNTSFXD2kKfKTRTDRjQAyDTTJP19sZf7++rqRytqmzUMNlfQKxxdI1g4b
	RCb9dW8296CueyG72C9ripVmnPxtcQJ0yipVMhxD2OzFVc5r9WR6u16bUfu//PEv
	fvP2QYlGdZN3IkTrmPxie+r+faiAyfl3MV3uWE9D62GkB31mH4oPG/otVQWZ61xe
	HaGW3OTYfseYbBHU+pkVFTosxQAfo+Ed+fYFJfqPXhaqf4ow7rlAogZnWDDOvrre
	j6tmsg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32w04200-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 18:42:30 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b3ae17c536so2564295c88.0
        for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 10:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795372949; x=1795977749; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ykSVHswchv2omQkjOeouyF/PE+0Z6GBM9cjMFah+F14=;
        b=MhVDS0EpXK0cypwLvjQtS3uoFzGziBebMrp/z1MktlZMqJwYiTDd1lHkI3Wy9SQbiZ
         YA6c4d6JCNOWuEHfd0ucHSh2oBJHHRW5PSsf0To4Mz4WgPVXlmANwTrXia6QMqHylNZw
         55WabS6w4KGHuMCyhc3jfRhVAWkapHLP7M1tDv1qTvOw0BBJikJSzs3KSC7uP4JtX/gW
         pbz+6pMqXtKgZsv4DRY4o3AgYn3V7CkEXgcurwMC4ZXNmz1CnHs2RWZ/U9qXOc+SPPHO
         1GyUKbyuocMe+0ZMqoGyu8h5tcZbbrs58nMyZV8bgS37xEHwcQ2ORYjDJCkueaW1t1Pl
         ruUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795372949; x=1795977749;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ykSVHswchv2omQkjOeouyF/PE+0Z6GBM9cjMFah+F14=;
        b=V/BvHd5MnGwv3G7rYUz+V/csHvM4hR4vHC2lpHwgPXCYO0Ia1nlgiEzoCTdlOYWY0S
         5QBEm09lEXMRK9jYlNYb8KL6qQHf3lYjqHb8IPUAUckULJk7KdYpgAvC7Pd4rQW9czcp
         muYD8lGXmSM9JClwmfTqU7dwta7p+O6XXi0fFrshBygCo6PubKdQPo4VSb9/IfT2SdUP
         vMPnMinuVEyOU3cukFMGrMzLANIpIDvLjoEGWFrGfMQr9MAwWYDse7bKPhDrdZPu6zQ+
         tZBKSs/xP2g2oZnvHbBMJiZceE4O9tpRKGqz8LfjYQPeksWttSZpDFewznAyUdXR0/Ny
         ZRcg==
X-Forwarded-Encrypted: i=1; AL+hErHyOU6rQtkWKX6v+eT1Na0Bb6wCPLXvaKZkD6PZpVzv9WvGTenr10Vr85HHjsn3X7p5DenqEp37HlPILA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+pgnkI60w7W00tqwKTRLpgk5Ug9vVdlp8m0GSHPyn+O9rSijoI
	P+6LKcR3i6KKFhD3WSyxyRStk1q/CbVL1/n3nSabalaMi/VXdryY0gjpBwmox7tyGcGtjhvI6MT
	baLdbDujpR6CcsBSum51YW/IkDD2EBE6MVcQeWtRYjZCDEt86OgADR5rINEGz7iP8OA==
X-Gm-Gg: AZFdTZfO2JIFu2WgRjBv7TLo72eliq5sMvMlldvB3O1hnh7n9ZzOUG3AjPdWv/WstfB
	1P8tRBiFO8uTcOKW3OEMhIyspekY9UZ2ZMJKhUgZKtoHFLFTzHn5IM/vXgovOmOkiAiNPkfTC8/
	SY9XSGVs042ALqeEaFjpPgDRExepZnUPQLk3YvAEw8+qz9pu/uU6BqKujyl2ROYtI05XMXckmq8
	SPzyYF62FETR7rDXfSdE11WZCsQ3Plil3yPkm28wlETz5hW1gcWPFc7KOoIvWZES16ZbHnaRYJj
	nsUr8QHOvFrkd3SnjXKqkrWGmUJ5RwATpLR9Zg6+Gio6CVkEdhekK+0UG1wuCk4EQ+I65mOYIE8
	iiVJmlEA/CW1PvXiRj6qFNQVoW4PrlRL8TXDHsh+uwawBNX57dARZEtLl10GJISc+UKZw8p2U2e
	EVXm+hjE+UHg==
X-Received: by 2002:a05:7300:88:b0:386:959c:11ac with SMTP id 5a478bee46e88-386959c141bmr7900526eec.6.1795372949038;
        Sun, 22 Nov 2026 10:42:29 -0800 (PST)
X-Received: by 2002:a05:7300:88:b0:386:959c:11ac with SMTP id 5a478bee46e88-386959c141bmr7900490eec.6.1795372948546;
        Sun, 22 Nov 2026 10:42:28 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm48497465eec.3.2026.11.22.10.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:42:28 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 00:11:37 +0530
Subject: [PATCH v7 7/9] ASoC: dt-bindings: qcom: Add Maili LPASS macro
 codecs
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-add_shikra_support-v7-7-7bf3aa089fc6@oss.qualcomm.com>
References: <20261123-add_shikra_support-v7-0-7bf3aa089fc6@oss.qualcomm.com>
In-Reply-To: <20261123-add_shikra_support-v7-0-7bf3aa089fc6@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795372903; l=2957;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=J0adzQqe6G17aJtoR6GnWqVkH8sol0hICrj/oe1SqW0=;
 b=DP9UFfoKiEAr09p1fG6InA57e4/XK2otryMFFhvrtvHJHOpmotb07N+x99ZHhvotvM+VaMBu4
 AwLa6YSM3KrBZJrAEA918LnqRPxmKtGqDzEhYL5l7Eksg6XTZRbho+G
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA3NCBTYWx0ZWRfXzHnxDzoQ+5YY
 FDkBV9m9CcHu3NfmE5TDvcXRlSgvoBCFfFuUh/mLgjiPBuyfQNC++UCMoRkmUlYtcHGyEMz4A4J
 nh2L4aqR1kXZbYvxUtUWOvKDUG/EqxldVtkXFDA+kthpo+XkUlIO4fmE7LoRfaLwKhLnNui1FU8
 fh3On1NmuSjHh88WzAZOEBnY5AOJARtR4ETyGmfhiGB3IySLaIGnlLat/0BWxY0PwA6gHr4GyaS
 Ifzelqbsykg31knZ1UbjqdiHLKJ69zPAM26wQlIE2uI9J5a4iH9wVOUgvMuOPlZ82VCV8vrlcfC
 NvQlqISgX77ydd3Eg2PENkcsW3E6NEIdnZ6o6+4GGbWllCqCoKRWb/N3Xyft2RiAWHpV3mg9rPj
 yGX0HLiIPE0HyIzs/HsmI9G9ys/lJsqJHkONiGDF7WuY+c0I5oK9zPf1q3Uho4NZrDPplBi3hwm
 pwqurkx0DTu+1aobZNg==
X-Proofpoint-ORIG-GUID: E9yoEmm2XbQoY426jcI8d9bku3pRQTZ5
X-Proofpoint-GUID: E9yoEmm2XbQoY426jcI8d9bku3pRQTZ5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA3NCBTYWx0ZWRfX7yb7bTRzvgv5
 R+NPylwom2MtOGTAnhui2YSp1C8WDF36L84ssRF/9C5cjydQXA/KH7L2W/1uWpyuHodwdIWNRa0
 Qc6NtiWUlMQfRKzMw9Et8bUfbM6m+fs=
X-Authority-Analysis: v=2.4 cv=S+dMU4sP c=1 sm=1 tr=0 ts=6b033796 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=WGZyT7xzyh4_t1xe9HgA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_04,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220074

From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

Add compatibles for the RX, TX and VA macro codecs found in the Low
Power Audio SubSystem (LPASS) of the Qualcomm Maili SoC.

The Maili RX, TX and VA macros are identical to their Hawi counterparts,
so document them with the corresponding Hawi compatible as fallback.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml | 4 ++++
 Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml | 4 ++++
 Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index 0ceff31a26a1..06dac35ad5a1 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -21,6 +21,10 @@ properties:
           - qcom,sm8450-lpass-rx-macro
           - qcom,sm8550-lpass-rx-macro
           - qcom,sc8280xp-lpass-rx-macro
+      - items:
+          - enum:
+              - qcom,maili-lpass-rx-macro
+          - const: qcom,hawi-lpass-rx-macro
       - items:
           - const: qcom,sm8350-lpass-rx-macro
           - const: qcom,sm8250-lpass-rx-macro
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
index 77cde8a4c9a9..f3dde5d14bf0 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
@@ -20,6 +20,10 @@ properties:
           - qcom,sm8450-lpass-tx-macro
           - qcom,sm8550-lpass-tx-macro
           - qcom,sc8280xp-lpass-tx-macro
+      - items:
+          - enum:
+              - qcom,maili-lpass-tx-macro
+          - const: qcom,hawi-lpass-tx-macro
       - items:
           - const: qcom,sm8350-lpass-tx-macro
           - const: qcom,sm8450-lpass-tx-macro
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index c8392bf7c31f..e77221b5e229 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -21,6 +21,10 @@ properties:
           - qcom,sm8450-lpass-va-macro
           - qcom,sm8550-lpass-va-macro
           - qcom,sc8280xp-lpass-va-macro
+      - items:
+          - enum:
+              - qcom,maili-lpass-va-macro
+          - const: qcom,hawi-lpass-va-macro
       - items:
           - const: qcom,sm8350-lpass-va-macro
           - const: qcom,sc7280-lpass-va-macro

-- 
2.34.1

