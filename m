Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA772445AE5
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 17:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785433456; cv=none; b=t4Yb+YYqx7tJCOY/WueCdnexSx+MNoBUlZosyLMUHkAXLqFjmjo9dsDz4ahUuaRS9+OCqd/FAipg/67iqhb/7GMm0rz8eousa+o5KRafCouegaQfuq4ZohDkCIperFavBXEifoiZKchfN0DK+KDgibDW1AStYf02grI9FQXMMMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785433456; c=relaxed/simple;
	bh=0SNVcD2ismw260/fCs9UP7KNTkcK5iz1vXhTrUZeJXY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DhRr/geqmYB0brGXht5nbbrvpbGQ8ZCwQepHFb/Jcy6yATE6eKQhgQn0pi/Hw/rbCeg6qDZlGXnMS+dSPYvj/i9jlY76C1EOlzcvy0MmWMPetVKG+fSu9vDBmdKYpMt+YCF5GvO7xQY2gX2q7QX+ZDsMrpf9gx9P//FEg2f6MSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mN5sCL/m; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mN5sCL/m"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-92e85499ffbso11223885a.0
        for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 10:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785433453; x=1786038253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mke9aMgFoX8mi0/LEKnGWho0tCyc+eXDPVUKaIIH15E=;
        b=mN5sCL/mhztkXQ9/LIDMH1Bi2dWxYeExnkMxgsojYwnSxzHQgoSefCH6/1wQ1LFlsG
         Rc+Z/s4DGWVKeiBMawvxM7l/KXRmlbakNDsExxKHGWGR5wO5az4QLtRnmoNPh32OIju1
         gRiR2nLoFX7GzcgTVTB+nckxCM4wT/y15hL9PHAywyArIdiMY65tStoUFJz9RR5Y8LcK
         Ft0+6+kyHaA4fGDZ1WEhrxXcxyvQUfl7JDPN5/BXi2JdY450EQH93fq+9899esXhFcvZ
         T3pVgI2UrPjU3WleoAtOqQK5XcrkscAvCBjgZxCFJ9hod9KWBbtCTrbcmnf59l5TEAcd
         vw8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785433453; x=1786038253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mke9aMgFoX8mi0/LEKnGWho0tCyc+eXDPVUKaIIH15E=;
        b=bDyty2coMeTKrGy3GCBzRdhFc6ZLZQlbP9qF6zHYa+6ByYl2eIP3A/3vg2/u7GG9OR
         HVCigCcArZrlwYg6lyMoSXOdj+JECnMwOXog+VvR6ou/xQTKfB74LxQu3Px/Vlah6h0r
         Mko0fglTh/KfMzQF5wxgaLpHFzt2CLeIW/6/YUMTkjcK2AxKlNNNXCj7nj/rZL9uI8YH
         N+jzm9X6lUIJ3WwEEZLCtS1mkp/jZfeLzHWrIG8mb1xdYDVgFjtx0xLjekml+HPrbcEn
         tPCCVSaTJPVACwTyqKemNEMcDGBzYx7SRz6VNRjUYcy1uHGBHSeBFKY1IBur8w0dF21K
         +4hA==
X-Forwarded-Encrypted: i=1; AHgh+Rpmpbaqbw2ASv6LR4GGZMSqJh0RHw0kCRgbgyVgggQsDWFv8I45t3I4WsRJl3dauwRSRV9WnX+XP443Aw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyduhfiTw9ISVAD8HPWT+zWkZqhW7QikeP32OCwd5yqqXua3t5V
	fEotWadixRTM62nNoi8dS/3/NQJ+jMXpJnjZEkb41bv19wubrLwSF8WU
X-Gm-Gg: AR+sD103+Tk2AsKJ8SPCqQkaKqj7JJwAxbykuAEO2BalFj5KIlLDXsndqAOWTDVrwt8
	SGOltTsgc1AOIfnle7+jDdwknBHhwMKd2fBZbI3X+fn4HzvDzUoRyGIqjnjQpHYMIpzJksjtbij
	k4OsgB57X1UT+nPMgW4yEBMgqa5g25jOkukIQGMON/MakLGTEmDbc2FyDnjIcL9+kYxUXMgH+Mq
	cS7uCwI6uZAmu37ucB4Q1aEWIlvnISguaH3RGu5IRILqyS+aTqiPTDP6pmhNJqLyvUv+Gup/f7x
	tiH5VI949QAhC79ci81yJhshNbwraCvL9GE0svci12vqTLqOExM7QyVAeFNSloyMLLUns/oUU/E
	LjOzrPt9QV1RJMq3P/SM4N75w9xL4Gbdk2RHr7XI+g/lSeV/dbOk4G2wog1nzJ9UPT4u331+hdE
	lu5z8nTDyywy5chIO/ZSkeMYoNs76yPn56wx3MHcuKNIPymQ+EYerZoarNWSZ8eZB0O7qAlA==
X-Received: by 2002:a05:620a:b8f:b0:932:f1d8:b0da with SMTP id af79cd13be357-93486157c96mr295847585a.57.1785433453529;
        Thu, 30 Jul 2026 10:44:13 -0700 (PDT)
Received: from localhost ([70.54.57.80])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-933e733d933sm473505785a.35.2026.07.30.10.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 10:44:12 -0700 (PDT)
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
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v6 04/15] ASoC: dt-bindings: pm8916-analog-codec: Add PM660L compatible
Date: Thu, 30 Jul 2026 13:43:42 -0400
Message-ID: <20260730174353.108023-5-mailingradian@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260730174353.108023-1-mailingradian@gmail.com>
References: <20260730174353.108023-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PM8953 (cajon 2.0) revision of the PM8916 analog codec is also found
on PM660L, typically connected to the SDM660 internal sound card via the
digital codec. Provide a space for specific compatibles and add the
compatible for PM660L.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../sound/qcom,pm8916-wcd-analog-codec.yaml        | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml b/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
index 15389645a3e8..be47dbdb2e92 100644
--- a/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
@@ -14,10 +14,16 @@ description:
 
 properties:
   compatible:
-    enum:
-      - qcom,pm8916-wcd-analog-codec
-      - qcom,pm8950-wcd-analog-codec
-      - qcom,pm8953-wcd-analog-codec
+    oneOf:
+      - items:
+          - enum:
+              - qcom,pm660l-wcd-analog-codec
+          - const: qcom,pm8953-wcd-analog-codec
+
+      - enum:
+          - qcom,pm8916-wcd-analog-codec
+          - qcom,pm8950-wcd-analog-codec
+          - qcom,pm8953-wcd-analog-codec
 
   reg:
     maxItems: 1
-- 
2.55.0

