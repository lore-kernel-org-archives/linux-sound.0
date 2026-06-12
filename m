Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59B81E515;
	Fri, 12 Jun 2026 21:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781300956; cv=none; b=AlzcOKPMlIFEgs73//6zMOqewhIbAQre+rsDP1qsScX5HQ58N2zxXWywIeha9G61/1UVuXBxD7m1woetCciOpeYt8TC/INuA1B7/KtK4rDm6Olb3QmJ9yeV0XamSzoC0HV+3JszkwtUGDfzqImRWE+dQi3U9lm6AwQI858fGmJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781300956; c=relaxed/simple;
	bh=nT7MZKVb6flS48THPY9L+sS1eL87G3YjEI7sZlmjvbM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V7hODuJ9a2qVxObfyLpRB4zcecdMRzG9W7+PNUI7KhCySGWJFTE4WcC6QHe6wmjnB4w+BOdEYgdTMPwwyya0LWe6E6ScDXTdS89QpHwu9wYscbiISSVhUGlarUq4a8tH5Kiaw1WC5hdSRfLlkYpZA2nYN5ATWM/3WSg1a+RpMP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mtt8Bcgv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mtt8Bcgv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D93E1F000E9;
	Fri, 12 Jun 2026 21:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781300955;
	bh=fqKorzRLcfjvj6jlMCda0kbsnz+fwNILnxS1kauD/9s=;
	h=From:To:Cc:Subject:Date;
	b=Mtt8BcgvFjPc0F4uzboVLPfCrwR+KtZQ1O5nW5KWz5giktjpy47GoEBMhpxEhIyCS
	 wOPiuoGxJjtX6fLBTADIXefOb+yzDvrILfBH+vfFTg3hie1yeC0y5EI+X5y1hCBhaf
	 pAyEVgkDi8wpZyvE+F1Xwq2KdFVIn+JCsKy0+z1BFfme6QOlwngX4NBjGWeuXw/mQB
	 TjBSr+ZlwxYnBB68BhiXfnLToYi/BACwEJHNvgM2SsT+EU5RRWCwlfqjYA6fMr2kc9
	 P+4+NrByPxkdyfW3SgVCqQK1ftDURsQbxhrFbgr+kq81hRMUmiTqUOyeE/msg98tbu
	 5O6xfmoAWFUow==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Animesh Agarwal <animeshagarwal28@gmail.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: dt-bindings: Fix RT5677 "realtek,gpio-config" type
Date: Fri, 12 Jun 2026 16:49:11 -0500
Message-ID: <20260612214911.1883234-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"realtek,gpio-config" is described as six 8-bit GPIO configuration
values, and the RT5677 driver stores and reads those values as bytes.
The binding incorrectly documented the property as a uint32 array.

Document "realtek,gpio-config" as a uint8-array so the generated
schema matches the hardware definition and the existing driver helper.

Assisted-by: Codex:gpt-5-5
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/sound/realtek,rt5677.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/realtek,rt5677.yaml b/Documentation/devicetree/bindings/sound/realtek,rt5677.yaml
index 9ce23e58e5ea..ae27ae78b1b2 100644
--- a/Documentation/devicetree/bindings/sound/realtek,rt5677.yaml
+++ b/Documentation/devicetree/bindings/sound/realtek,rt5677.yaml
@@ -58,7 +58,7 @@ properties:
       0 - floating (reset value)
       1 - pull down
       2 - pull up
-    $ref: /schemas/types.yaml#/definitions/uint32-array
+    $ref: /schemas/types.yaml#/definitions/uint8-array
     minItems: 6
     maxItems: 6
     items:
@@ -130,6 +130,6 @@ examples:
             realtek,pow-ldo2-gpio = <&gpio 3 GPIO_ACTIVE_HIGH>;
             realtek,reset-gpio = <&gpio 3 GPIO_ACTIVE_LOW>;
             realtek,in1-differential;
-            realtek,gpio-config = <0 0 0 0 0 2>;
+            realtek,gpio-config = /bits/ 8 <0 0 0 0 0 2>;
         };
     };
-- 
2.53.0

