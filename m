Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64301446C08
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 17:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785433464; cv=none; b=LKd7/58qRFctJoHiyeyTVTME+ahS2Xrq8lUYVQ11oQ6pRMUjSHQqjXlpccfDGxx9lhXbyAc+9cmit0On1FwV3PwwP+al1k1fLbXUF5pH6cWPnpMIzVTiuD/Km4CRUPVVgP9Um5dvRfAzn1a5W9mlTi+r+ynW5e+on1EGYA2QKZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785433464; c=relaxed/simple;
	bh=7kIt3VDOmhqDwU+Vb6EyEntTuqJB8bsltDHuVoseCHU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NvzlKahNeaJZV2I7vZ89EBynnwbQSWSDtteuL4Qmum5pODPVeFbpOOgiFH7vaMMvGb4D27YEqtEMFj1qnZPIeam6U05/772VBNM6ws/2hgF3tx0JHv+uWqOhMydy546l23AJRLCFr+ncJC6HrzOlg8fLMX7+Q1pvdLRfiBhz790=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b7lRthR3; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b7lRthR3"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-92e6c4a867cso10825885a.0
        for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 10:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785433457; x=1786038257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a6pr9y+eV6Wrb9MmFfo+z0pmIGyd9l991e5f78BS73g=;
        b=b7lRthR3Fa8uiXh3uKwNdWGnR47yN8/K9YJyzM2IpSYIqHAHcchyERCWAmr0sC8Q2z
         qt6IsW6I48jVUCKIozmx4YXVUcncDPUpIMnv07kougsXYJZyXb5p316dlLHXhW2wDLgf
         TgWLZA2BIraw9EWeGOuWd8e2VWrvCVulkv5JNOlBc/UBkO+sDXHNPS2wK9U20Yj4SW9E
         vI0fmu8NRVXyoA8IkfJTrGAKW81GVGKp5Z8GQt/lbcFXzapS9WZtQXbjPb2Lvmhrr9Dq
         57Ss8u/DH6TL7ftpjV/9l3jlnWpLtgQVjx1LH5RIK2/s1MatiUITlN2XiBdPfW2yYZjC
         TUVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785433457; x=1786038257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a6pr9y+eV6Wrb9MmFfo+z0pmIGyd9l991e5f78BS73g=;
        b=rCsg7Ocfy1f//j8b/a3Gb4SiAV8MMVKMfXSJQui8xujcyHwr2+BICjHCMVGmuwVdYr
         7d7XQ9vOETk1fw6+F3hi2w74evQB6gcKbH593GSkAGeJhfEgI5Zl/aFP9pj7a1H/XOWX
         ePsz7O0SlNi2Ej+7Lzai8rsySeZo6m9BFg/FcyD/nT20iwCk3xZPC+ekNtrGFWqOf4FF
         +5LIUZZgP2277dQe5CciosDQ1Wdj3Mn2l5w3vZEdrvJw+PrrKPVENHbgogYDdKKzwDg2
         pUykTM/BbEdriVX16SMimtvA3lAsS53qKG578aKYJh1/Po9koo7p1rgGw8NEKq1+bm0i
         UzLA==
X-Forwarded-Encrypted: i=1; AHgh+Rq/PcVFQcUhO9i4dhlGhxO3JMLTPzBbs7o/T/um4ljmZwuO+zrmMNiX+9yeD5FjPXINwKwKj+UIxNEogA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/dQLMmJg92ZVO25X+fIAJBP7HG5iSJ+INj3d+pcIv3NKbAwT+
	KyQxoNTLKYv0KmPA/k1+TbHyCAU/A6bs/h8fHu5ondPHoJBbYB0m9D7m
X-Gm-Gg: AR+sD11OKurJIrs98fyUkqbaEeWq7NPLDVV7q9OH9hheRYbkHBds+YjV3xYINmaSJxS
	JzE5tyzEuq2EcjgUF/hWrmMVRcxWN0/ZEs3qIDyBrGbZXjL4bdx5lsh3RnZraBH6ZbfOGuwNsoL
	zfHUs/fwXwwTJ5cZ2QuXb5NBk9BaBqTXFApRTHMETpx5MIIYnZfhsdkwHPdkoEWrRnbpnTft1zg
	tPWGfAiP17GF6x+YfmiSBDwQNKFPYb0eeUSB2D/Bf5sB+qYvryqYujghcDI9JhI46/wxzKC2zhP
	966PflScLizYvW5SXMOR0vO10UN6ZT9E1p/jT74jjhazyBSXS+yQJOktRtgw+cQrYmqutC/7VYX
	QtLD6nsp+ztpJakqZajxpYzLtTdetw5vJksll0ZU2GfeGl2Lgjpf9GkCNtjH5R8JPrdzS9oXRsv
	BFvaY5YzaPtIsYseAsbgc61LwB6xBOz7Wjt58XhbvOroinTDyXdg2MvAdC3AA=
X-Received: by 2002:a05:620a:a2d5:10b0:92f:bed:e252 with SMTP id af79cd13be357-93486af7b4bmr303925785a.48.1785433457373;
        Thu, 30 Jul 2026 10:44:17 -0700 (PDT)
Received: from localhost ([70.54.57.80])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-933d325a17fsm460156685a.13.2026.07.30.10.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 10:44:16 -0700 (PDT)
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
Subject: [PATCH v6 05/15] ASoC: dt-bindings: msm8916-digital-codec: Add SDM660 compatible
Date: Thu, 30 Jul 2026 13:43:43 -0400
Message-ID: <20260730174353.108023-6-mailingradian@gmail.com>
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

The MSM8916 digital codec is also found on SDM660, typically connected to
the SDM660 internal sound card. Provide a space
for specific compatibles and add the compatible for SDM660.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/sound/qcom,msm8916-wcd-digital-codec.yaml    | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml b/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml
index a899c4e7c1c9..33bc23b6176a 100644
--- a/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml
@@ -14,7 +14,13 @@ description:
 
 properties:
   compatible:
-    const: qcom,msm8916-wcd-digital-codec
+    oneOf:
+      - items:
+          - enum:
+              - qcom,sdm660-wcd-digital-codec
+          - const: qcom,msm8916-wcd-digital-codec
+
+      - const: qcom,msm8916-wcd-digital-codec
 
   reg:
     maxItems: 1
-- 
2.55.0

