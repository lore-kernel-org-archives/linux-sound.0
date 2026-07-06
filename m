Received: from MTA-07-3.privateemail.com (mta-07-3.privateemail.com [198.54.118.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8953D7D8D;
	Mon,  6 Jul 2026 19:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.54.118.214
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783365789; cv=none; b=WMM9UOznQWpaLCpvk0tkSleM2va1NEUUw1Dhw2FvAbUVofSYhjdttZ6G4EYXnb0EoetV0cPbpNuqDRActRR9Pcd3CNDc/TRydrDLepgprKoZtk3adnmeF/uGvhwE8p0Wbcl7Br8GaanDM/H6+P6sojxTtU0y27JJ6578zuDC1xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783365789; c=relaxed/simple;
	bh=9Rvy9UNyov1mucllfgzUuZcbDduE2WQ9Owjuaf/IQIM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iSBehkr9G4Y5wqW47AsERjPfoBNCVjPIfPTTfV6v9Avl9Yilj95iIxO7EFsNpNd1aZE9PSbMfqMc1bfkeDTRNlmuCcBwERIWiozdH5A1mTPya3TpHQsJ39WjiGD/G6/OdtB3lD2+DjVO2wnTJtFYrySjMAtO5Zq6FO76SrwbEGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=catcrafts.net; spf=pass smtp.mailfrom=catcrafts.net; arc=none smtp.client-ip=198.54.118.214
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=catcrafts.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=catcrafts.net
Received: from mail.privateemail.com (unknown [87.215.145.39])
	by mta-07.privateemail.com (Postfix) with ESMTPA id 4gvDlZ3HZGz3hhTG;
	Mon,  6 Jul 2026 15:22:49 -0400 (EDT)
From: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
To: Mark Brown <broonie@kernel.org>
Cc: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] ASoC: dt-bindings: qcom,wcd93xx-common: don't require micbias4
Date: Mon,  6 Jul 2026 21:22:27 +0200
Message-ID: <20260706192229.144137-2-jorijnvdgraaf@catcrafts.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260706192229.144137-1-jorijnvdgraaf@catcrafts.net>
References: <20260706192229.144137-1-jorijnvdgraaf@catcrafts.net>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The WCD9370/9375, WCD9380/9385 and WCD9390/9395 codecs all have four
mic bias supplies, but the upcoming WCD9378 only has three, so it
cannot reference the common schema while qcom,micbias4-microvolt is
required there. Move that requirement out of the common schema into
each of the current users; no binding is relaxed by this.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
---
 Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml        | 1 +
 Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml        | 1 +
 Documentation/devicetree/bindings/sound/qcom,wcd939x.yaml        | 1 +
 Documentation/devicetree/bindings/sound/qcom,wcd93xx-common.yaml | 1 -
 4 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml
index f94203798f24..c6dbfe341370 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml
@@ -31,6 +31,7 @@ properties:
 required:
   - compatible
   - vdd-px-supply
+  - qcom,micbias4-microvolt
 
 unevaluatedProperties: false
 
diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
index ab1c6285dbf8..f74beb4169a5 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
@@ -35,6 +35,7 @@ properties:
 
 required:
   - compatible
+  - qcom,micbias4-microvolt
 
 unevaluatedProperties: false
 
diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd939x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd939x.yaml
index 85283f94465d..a70d70a05355 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wcd939x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd939x.yaml
@@ -50,6 +50,7 @@ properties:
 
 required:
   - compatible
+  - qcom,micbias4-microvolt
 
 unevaluatedProperties: false
 
diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd93xx-common.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd93xx-common.yaml
index f78ba148ad25..61e437378cfe 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wcd93xx-common.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd93xx-common.yaml
@@ -89,7 +89,6 @@ required:
   - qcom,micbias1-microvolt
   - qcom,micbias2-microvolt
   - qcom,micbias3-microvolt
-  - qcom,micbias4-microvolt
   - "#sound-dai-cells"
 
 additionalProperties: true
-- 
2.55.0

