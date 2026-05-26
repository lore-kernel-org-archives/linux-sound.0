Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E5E313520
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 15:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779809411; cv=none; b=m3Tmtd/zhDYZ+0Y7jWFUr+QzQ6wb5B6IRzk5Bm5R3x2hHtUIC1si2Ndcs1f8gIIlcB50oiC4TLUl4Meoegr7c1rmFJrFy8urS5TRo6Tct4CoC7YqUUpJQ5TO2XpkxMBBh39zg5JInFVUK+LM4nk/PFas+knJcgv5tkLz6J/pPTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779809411; c=relaxed/simple;
	bh=iGTwHgBHeLX3ILgd04nNErc/W++Eogoek/IlmiG7e0g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N1JvXTw5ghynNRbn7znP+H4sPwqmHjV36jRJFeaQ4GKhFh8Wz/doGQO27m2vR6kluurN40Qj3NBjf5gmS3RiGdjCdPeP4b5afxy+e9YJUFYBzbyqnVba+99Aw/VJhIqOeb6TeCGrxzSyGs6jWzoT0YIupSoMJ+M2W4JS8rbom0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=hBPwvYY2; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="hBPwvYY2"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43d734223e4so6804441f8f.0
        for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 08:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1779809405; x=1780414205; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vhkmSXGNrf6eecWgP6NaxELfI3WHj96xq4ue7rXgP0U=;
        b=hBPwvYY21w+3Kqj6/ns1M1Bz8PM2RUgx7L7AYPv27bqP5n1nxUYeYDr/GMP0QRLbAf
         /oB1excYIvSTwEFzycoE7gZ+uLZGSXkkxOhGEWlr1sj4evau5S/eoRUD15kXeLsmIAVQ
         /zThqbCBEgDtQOOFf+0AgUdzbNQ32pqguAi9De/6KVbLz/smPVETiEc7DbZznDd00EJX
         VPxfgWpQcrYI5ge9K5t+GMt/vKxS9x1UcJk4kvJYgQ9PanShUFU5df5yH6XHRRj6/U/g
         qjYJstEgM/HgP8W2BsiQrssQM7ptx9sdbLoeNbr8gFV5tMLf35TlMgkSwFl0ZwmFqjeE
         JbIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779809405; x=1780414205;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vhkmSXGNrf6eecWgP6NaxELfI3WHj96xq4ue7rXgP0U=;
        b=ot4i8Qsv83x6BAcBJfh9ce0r5LVwxrblU6hdw/Sw03w6e4duDqtShjKb+KprsrM4qG
         QEiNQRqtEWtkzo1L7Jb/a1I9Adk5WjqMTCP9yMwo30lo6QuBppcFkSsz5/mljkzVstYp
         9Mryp05kRxOgB+2isZd7LVsbgKcZGtLxIbKAoDFEs6GgmgWaCj3t4bhUMG9bHGtEa6Rf
         61bO8JMKKIp225F4hP16XuRbSWoE+AJqBfQPx+ZlqNm0cuP9kTzQeTitlduKeZgJEGDp
         FyR5CP7TbN618yVTRxP7P0dsaSGxrjdV4/zvFhlj6ldTJ7VlAEk150uPw/wUr3E+Jwic
         Wjcw==
X-Forwarded-Encrypted: i=1; AFNElJ/eTQQ3oCNHc0BVQivfkhbdkL3xLRjqQ65wXQTM7SPun8n7+CpGxVAAyAJxfx1fcGWoXQFgRapevroiXw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+Brc+uH28Xd3U7acj7pJ4UwwcNGHlcz3ZSHHa27W020+bR6wY
	T8R5YJvsXIEzfrpV2NepgnKy5AHtjbv5MYquqKdR7iDT3EW4twKrW/jsen1XsFPAOYw=
X-Gm-Gg: Acq92OFxLVV0YGPaLtlBErGH/2013h6/faKffG5wRcxamux9+VfewapNGXLwyOVwq92
	uLQjsyUQ0JdFCMLlpNf1fvB2uxhClI6tfD42nf0VdJdDcpi4l6NfZ5s9Gi/paEkn0+TxO2GQKyB
	fXTELFbh1C1myoFGUASBXx7Fpa2JoCooIBb/Yghdeep5GfO89jYoj3SH6M7aEqQs14km85efT8n
	tG++SWHEtw7dYVt6pFuQcM7lNKlG2fCYMMpvtGzgbGG7lngyIs7BgtVR8Sm7UQRUOFt4DyGq/Mf
	NWGP96sSvoQzYXXiEaRutnZSRD51UaFZhyOqqVj6eLHqS/cglzIYS59SPjK3yyQmFZ/jLAcF2T8
	RH5m1FMzFOKHz8QMGZPaX1A4Hqzogmf1unikyYa+/TqHEFxA9EI4XCiiO4HuEropQ9NbKp8gZYr
	GFfoCSqMBiLlo6R9uX6NBVQI+Z2CcryH6m
X-Received: by 2002:a05:6000:25c8:b0:45e:b9b4:c68d with SMTP id ffacd0b85a97d-45eb9b4c854mr27242005f8f.4.1779809404418;
        Tue, 26 May 2026 08:30:04 -0700 (PDT)
Received: from [10.107.1.102] ([212.133.41.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d5caeesm37691140f8f.29.2026.05.26.08.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 08:30:04 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 26 May 2026 17:29:55 +0200
Subject: [PATCH RFC 2/2] arm64: dts: qcom: kodiak: Fix up LPASS TX macro
 v9.4 control names
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-sc7280-tx-macro-v1-2-1aad6900fec0@fairphone.com>
References: <20260526-sc7280-tx-macro-v1-0-1aad6900fec0@fairphone.com>
In-Reply-To: <20260526-sc7280-tx-macro-v1-0-1aad6900fec0@fairphone.com>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779809398; l=6900;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=iGTwHgBHeLX3ILgd04nNErc/W++Eogoek/IlmiG7e0g=;
 b=opyYbtZw6SUYmPrNcW3j6K1y7j4lAENYIJUfh4vzihODYxclG05oeO/6oBQLoTDqVlE9HaKJ9
 IcoBrff4BUpBMVnr8RGjImnxyVwIin1ve76FvwVv21237CSdGbl8J7L
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

After fixing to the lpass-tx-macro driver to use the correct v9.4
configuration, some control names have changed and therefore need to be
updated.

* "TX SWR_ADC" 0-3 becomes "TX SWR_INPUT" 0-3
* "TX SWR_DMIC" 0-7 becomes "TX SWR_INPUT" 4-11

Update all usages in dts.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts           |  2 +-
 .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     |  2 +-
 arch/arm64/boot/dts/qcom/sc7280-crd-r3.dts         | 22 +++++++++++-----------
 .../dts/qcom/sc7280-herobrine-audio-wcd9385.dtsi   | 22 +++++++++++-----------
 .../dts/qcom/sc7280-herobrine-villager-r1.dtsi     | 22 +++++++++++-----------
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi           | 22 +++++++++++-----------
 6 files changed, 46 insertions(+), 46 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index bdc02260f902..565f7db91e77 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -860,7 +860,7 @@ &sound {
 			"TX DMIC0", "MIC BIAS1",
 			"TX DMIC1", "MIC BIAS2",
 			"TX DMIC2", "MIC BIAS3",
-			"TX SWR_ADC1", "ADC2_OUTPUT",
+			"TX SWR_INPUT1", "ADC2_OUTPUT",
 			"VA DMIC0", "VA MIC BIAS3",
 			"VA DMIC1", "VA MIC BIAS3",
 			"VA DMIC2", "VA MIC BIAS1",
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
index bb5a42b038f1..a36bd6120ea2 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
@@ -736,7 +736,7 @@ &sound {
 	audio-routing = "IN1_HPHL", "HPHL_OUT",
 			"IN2_HPHR", "HPHR_OUT",
 			"AMIC2", "MIC BIAS2",
-			"TX SWR_ADC1", "ADC2_OUTPUT";
+			"TX SWR_INPUT1", "ADC2_OUTPUT";
 
 	wcd-playback-dai-link {
 		link-name = "WCD Playback";
diff --git a/arch/arm64/boot/dts/qcom/sc7280-crd-r3.dts b/arch/arm64/boot/dts/qcom/sc7280-crd-r3.dts
index c2cba9d7179b..ffe028bd0c72 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-crd-r3.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-crd-r3.dts
@@ -101,17 +101,17 @@ &sound {
 		"VA DMIC1", "MIC BIAS1",
 		"VA DMIC2", "MIC BIAS3",
 		"VA DMIC3", "MIC BIAS3",
-		"TX SWR_ADC0", "ADC1_OUTPUT",
-		"TX SWR_ADC1", "ADC2_OUTPUT",
-		"TX SWR_ADC2", "ADC3_OUTPUT",
-		"TX SWR_DMIC0", "DMIC1_OUTPUT",
-		"TX SWR_DMIC1", "DMIC2_OUTPUT",
-		"TX SWR_DMIC2", "DMIC3_OUTPUT",
-		"TX SWR_DMIC3", "DMIC4_OUTPUT",
-		"TX SWR_DMIC4", "DMIC5_OUTPUT",
-		"TX SWR_DMIC5", "DMIC6_OUTPUT",
-		"TX SWR_DMIC6", "DMIC7_OUTPUT",
-		"TX SWR_DMIC7", "DMIC8_OUTPUT";
+		"TX SWR_INPUT0", "ADC1_OUTPUT",
+		"TX SWR_INPUT1", "ADC2_OUTPUT",
+		"TX SWR_INPUT2", "ADC3_OUTPUT",
+		"TX SWR_INPUT4", "DMIC1_OUTPUT",
+		"TX SWR_INPUT5", "DMIC2_OUTPUT",
+		"TX SWR_INPUT6", "DMIC3_OUTPUT",
+		"TX SWR_INPUT7", "DMIC4_OUTPUT",
+		"TX SWR_INPUT8", "DMIC5_OUTPUT",
+		"TX SWR_INPUT9", "DMIC6_OUTPUT",
+		"TX SWR_INPUT10", "DMIC7_OUTPUT",
+		"TX SWR_INPUT11", "DMIC8_OUTPUT";
 };
 
 &wcd9385 {
diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-wcd9385.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-wcd9385.dtsi
index ce48e4cda170..bc492346f7dc 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-wcd9385.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-wcd9385.dtsi
@@ -20,17 +20,17 @@ sound: sound {
 			"VA DMIC1", "MIC BIAS1",
 			"VA DMIC2", "MIC BIAS3",
 			"VA DMIC3", "MIC BIAS3",
-			"TX SWR_ADC0", "ADC1_OUTPUT",
-			"TX SWR_ADC1", "ADC2_OUTPUT",
-			"TX SWR_ADC2", "ADC3_OUTPUT",
-			"TX SWR_DMIC0", "DMIC1_OUTPUT",
-			"TX SWR_DMIC1", "DMIC2_OUTPUT",
-			"TX SWR_DMIC2", "DMIC3_OUTPUT",
-			"TX SWR_DMIC3", "DMIC4_OUTPUT",
-			"TX SWR_DMIC4", "DMIC5_OUTPUT",
-			"TX SWR_DMIC5", "DMIC6_OUTPUT",
-			"TX SWR_DMIC6", "DMIC7_OUTPUT",
-			"TX SWR_DMIC7", "DMIC8_OUTPUT";
+			"TX SWR_INPUT0", "ADC1_OUTPUT",
+			"TX SWR_INPUT1", "ADC2_OUTPUT",
+			"TX SWR_INPUT2", "ADC3_OUTPUT",
+			"TX SWR_INPUT4", "DMIC1_OUTPUT",
+			"TX SWR_INPUT5", "DMIC2_OUTPUT",
+			"TX SWR_INPUT6", "DMIC3_OUTPUT",
+			"TX SWR_INPUT7", "DMIC4_OUTPUT",
+			"TX SWR_INPUT8", "DMIC5_OUTPUT",
+			"TX SWR_INPUT9", "DMIC6_OUTPUT",
+			"TX SWR_INPUT10", "DMIC7_OUTPUT",
+			"TX SWR_INPUT11", "DMIC8_OUTPUT";
 
 		#address-cells = <1>;
 		#size-cells = <0>;
diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtsi
index b25df5a99161..c6606b1eb71c 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtsi
@@ -23,15 +23,15 @@ &sound {
 			"VA DMIC1", "vdd-micb",
 			"VA DMIC2", "vdd-micb",
 			"VA DMIC3", "vdd-micb",
-			"TX SWR_ADC0", "ADC1_OUTPUT",
-			"TX SWR_ADC1", "ADC2_OUTPUT",
-			"TX SWR_ADC2", "ADC3_OUTPUT",
-			"TX SWR_DMIC0", "DMIC1_OUTPUT",
-			"TX SWR_DMIC1", "DMIC2_OUTPUT",
-			"TX SWR_DMIC2", "DMIC3_OUTPUT",
-			"TX SWR_DMIC3", "DMIC4_OUTPUT",
-			"TX SWR_DMIC4", "DMIC5_OUTPUT",
-			"TX SWR_DMIC5", "DMIC6_OUTPUT",
-			"TX SWR_DMIC6", "DMIC7_OUTPUT",
-			"TX SWR_DMIC7", "DMIC8_OUTPUT";
+			"TX SWR_INPUT0", "ADC1_OUTPUT",
+			"TX SWR_INPUT1", "ADC2_OUTPUT",
+			"TX SWR_INPUT2", "ADC3_OUTPUT",
+			"TX SWR_INPUT4", "DMIC1_OUTPUT",
+			"TX SWR_INPUT5", "DMIC2_OUTPUT",
+			"TX SWR_INPUT6", "DMIC3_OUTPUT",
+			"TX SWR_INPUT7", "DMIC4_OUTPUT",
+			"TX SWR_INPUT8", "DMIC5_OUTPUT",
+			"TX SWR_INPUT9", "DMIC6_OUTPUT",
+			"TX SWR_INPUT10", "DMIC7_OUTPUT",
+			"TX SWR_INPUT11", "DMIC8_OUTPUT";
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
index 8cac4ce9c851..e54379147d2b 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
@@ -101,17 +101,17 @@ sound: sound {
 			"VA DMIC1", "MIC BIAS3",
 			"VA DMIC2", "MIC BIAS1",
 			"VA DMIC3", "MIC BIAS1",
-			"TX SWR_ADC0", "ADC1_OUTPUT",
-			"TX SWR_ADC1", "ADC2_OUTPUT",
-			"TX SWR_ADC2", "ADC3_OUTPUT",
-			"TX SWR_DMIC0", "DMIC1_OUTPUT",
-			"TX SWR_DMIC1", "DMIC2_OUTPUT",
-			"TX SWR_DMIC2", "DMIC3_OUTPUT",
-			"TX SWR_DMIC3", "DMIC4_OUTPUT",
-			"TX SWR_DMIC4", "DMIC5_OUTPUT",
-			"TX SWR_DMIC5", "DMIC6_OUTPUT",
-			"TX SWR_DMIC6", "DMIC7_OUTPUT",
-			"TX SWR_DMIC7", "DMIC8_OUTPUT";
+			"TX SWR_INPUT0", "ADC1_OUTPUT",
+			"TX SWR_INPUT1", "ADC2_OUTPUT",
+			"TX SWR_INPUT2", "ADC3_OUTPUT",
+			"TX SWR_INPUT4", "DMIC1_OUTPUT",
+			"TX SWR_INPUT5", "DMIC2_OUTPUT",
+			"TX SWR_INPUT6", "DMIC3_OUTPUT",
+			"TX SWR_INPUT7", "DMIC4_OUTPUT",
+			"TX SWR_INPUT8", "DMIC5_OUTPUT",
+			"TX SWR_INPUT9", "DMIC6_OUTPUT",
+			"TX SWR_INPUT10", "DMIC7_OUTPUT",
+			"TX SWR_INPUT11", "DMIC8_OUTPUT";
 
 		#address-cells = <1>;
 		#size-cells = <0>;

-- 
2.54.0

