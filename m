Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2153D6464
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 19:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772654302; cv=none; b=jNUMOoERM9E4Nr/amwoy1LMNbZCHDa0d+4+v7efiyFhvq1M60toxqACgLAw33mDEuXEkSfr4K4fbIS9BWsJ+vJQhuvQdHVa8jIWfbmkfc9Lvax+THGMNBS3+UEM9ga3TU/y+QZ8S4q1SZYSqnCXGZYPHasb1UvKQhT8Mj8EGBr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772654302; c=relaxed/simple;
	bh=n0R40XRfDjy1V9Ne4xBLWMj+F0n2Xug4NvKwAOU0ctc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jfJ9op+njbd2gIPbqK1fSFapbOFuh6IO4/uwNzmuuaIcKupl+cm2cU/92WatCwxsmVB4vJI75XDxJYdlAQzHhDv2aoGS51lpI/o9HA0qI+BXvboeZOcHjA+N5/Gt16HY2eP/jEYDYL6TW580fghDQ7Z3/SgTK6vtO/L1jyAzHAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KJmso6OH; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KJmso6OH"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8cb4acdacb2so940943885a.3
        for <linux-sound@vger.kernel.org>; Wed, 04 Mar 2026 11:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772654300; x=1773259100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UwqufDdP/7LZrzEeKntvUtFudz4/SZEf85WjJVi8KGM=;
        b=KJmso6OHJbjGM4bGpLWN5KTzHVXj6F1yoeR9f/WAWlE/vwzSYViVNd4QZFTxnkoHDc
         9bQ2IecCDTj2OVSaXuEvr0V2xYPnQ83lnQb5Tbhx5pjXFqE+AgBCEZ1TOKJV5ssFdv2E
         Rwl22/RVPL5TwWpPxw168wvsC0aa31hWlhQKo7WJjuV6feIZtG1r0h0m3yaIKs/DP7ap
         Yyu1BB75uydmDFtGTSwtDs/4egOOkHsXHRhXMsWY+eXmlHC/80aBtiA4Duofzn8gRplw
         PKT01HUQ8sAs+AxbiOKM6B82H29k8eJTo6Y6RK1lkJUdR2K89YwNmryLpM1PUf8ddsVQ
         voYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772654300; x=1773259100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UwqufDdP/7LZrzEeKntvUtFudz4/SZEf85WjJVi8KGM=;
        b=jQLLw0ChVr+6se/mJcs60GAE6SGywwuaxco8ewb5TUPkGuixoNzSx2MqFfNL91Ufnr
         hWhS+PSQwwbFTMd2Sr8H+Emcy4B8PRqTo29QDwCLKVxN/E6LrNsvvlBgYF6WHP0fHpkT
         nZ98zigWdmmwNClbpdjECj4qSanoULq1Jmrvy3FUifUye4bT1np1pd2pS4+6yDjrZDP3
         QiMztJcjsh8JtEjPHVHG2g3j4C6tlp/o4rX9t1YrA6meVWyqxmvnjzxNzuqvmDGP6V7b
         VX65v4O8byZFuFUjUbnkO3G5E5s9dko76WPrJmzl4cnwlJkaAdOzWcIwP1phWA38Lyzo
         c3Dg==
X-Forwarded-Encrypted: i=1; AJvYcCX4kr6fHDD/jpehvhqhfEphzW66BMP2Bri2j3Mg+Q8Yt6ArRMLzPKr54xy6U3E52cZ0oNFfkByMUBVDDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHEaTN/4joP7bX0M0RLKIBqNfH0Qg5UDT/6VGhFQfXsA/qJ/od
	99mbD2dQW9LnkRfbORcuc0kfY1GoysK1KnXIynbM2m9Hp2xcSPHE0kQl
X-Gm-Gg: ATEYQzyUkC2/Td1qJZ+J49xZEyCZtarr9vY79ZKMu7qakS+iDD/QmAmiiA8WYs5Wj1y
	9OMW4NWFexQF7kHiFrg5nWYN6eJaZkONuYXa6q/w1hRl5bbvYyrdthG6tK9EG3MHqXr+4pLrSX4
	0efAOybEMvabCb19/MROAZn14VuGwzQpcztScG+0AZwyenFdj6qL2x/Xmf6CSENsqCYBiTlwpT6
	2gKYZSlysf8b5XoiUplPGb4SrKcPwNtDxqdDmirxCkX3/Iy2GwIQzEvl99dyR/xDh3uqKVB6oOz
	3g3I9RFyCWu8KyJwD4ivMPLGZm3isiO8D1Q9oFOKrlujxyzENAXkrDgkr1wTUPomELD8ggIKOHl
	tKzsdIeQRwzIdJHbL7LU3TOixdkPRfi11AS6jGv1AvsW/cImk+GaAIoJJ8QKi7sm4mBGD27RUl7
	zF5drAlKihZ1oPY9mviXC6PHRYRg==
X-Received: by 2002:a05:620a:1aaa:b0:8cb:50d6:18be with SMTP id af79cd13be357-8cd5aef9863mr364551585a.18.1772654300437;
        Wed, 04 Mar 2026 11:58:20 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf65921bsm1681618985a.1.2026.03.04.11.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 11:58:19 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 03/11] ASoC: dt-bindings: pm8916-analog-codec: Add PM660L compatible
Date: Wed,  4 Mar 2026 14:58:07 -0500
Message-ID: <20260304195815.52347-4-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304195815.52347-1-mailingradian@gmail.com>
References: <20260304195815.52347-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PM8916 analog codec is also found on PM660L, typically connected to
the SDM660 internal sound card via the digital codec. Provide a space
for specific compatibles and add the compatible for PM660L.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/sound/qcom,pm8916-wcd-analog-codec.yaml      | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml b/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
index 94e7a1860977..c7424d755cd8 100644
--- a/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
@@ -14,7 +14,13 @@ description:
 
 properties:
   compatible:
-    const: qcom,pm8916-wcd-analog-codec
+    oneOf:
+      - items:
+          - enum:
+              - qcom,pm660l-wcd-analog-codec
+          - const: qcom,pm8916-wcd-analog-codec
+
+      - const: qcom,pm8916-wcd-analog-codec
 
   reg:
     maxItems: 1
-- 
2.53.0

