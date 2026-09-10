Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C2D49E157;
	Thu, 10 Sep 2026 23:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789081438; cv=none; b=XLZ6ePyuzI4vhX72VY8YCiuewAfyO3My8CgmU922kGtC5v1V8dwkHumTyodiEdX9aIhOHhS9X5ShmNdCbjzHQTdfTcvQq1HfqFA9/MeYwflQfrk3BXIpTXmSCqAV54hepCR2KUDzbO2bED2U2MG7nNCDyB4IP7aPolAi/4B8Zdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789081438; c=relaxed/simple;
	bh=JIYdN64fyCrVNlirnuLP59+SF3SJ83xlz8Un6oQUGOw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pHjnw+y2PkB656Yf+Jbggsjt1cIoumt5JSU+pGzVMvlhMK+0gDNJGGD5y5U9dLsF9/wXgdznMm7JsNaXsEfZqgMj0Od9HzibMdtk9k28Bd5HmkdBxYJ2FcvDKRDje+ybOdOTNusgQp5ov+2k6IqrPxHs44uyx2qm9FFQzZQba7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AUfIX60P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AUfIX60P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 561501F00898;
	Thu, 10 Sep 2026 23:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789081436;
	bh=9rIhpfX5sWzJ0qJe/OlukbR9oz45rSA+7m7dXvLS8KU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=AUfIX60PgZRBIe3DCsDA4hbOJCUpE11wROY/MrGn0z+CBzAfZRXvwV8kyr8rgF3I+
	 TtU3Oe0YM5CW2voZ5RQB/r9OdLcuWVEl3yVtVirASkc2v6Br2qDzkB4RPdbS0gGKz+
	 Sp3yIvfiaYPMYkEaHovO9iezZmpl22mFXl5gGrPPy0yGkN7/PiPYVgXMxC6JTQFFKM
	 /lmaqPFnW+/fFRvLLe9hgzyDR8nsHpUd+3az1rB4MWJJrhPhrFxkse/fXZgJclMYI8
	 tvN0F4UxzgA100tI9PKJk3N/jTV3Smo3c5lVgi/YXU62/rYE4Un2hjXzMXOU9ZYXX0
	 gjEP0hyl/wRUA==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 11 Sep 2026 01:03:45 +0200
Subject: [PATCH 2/9] mfd: dt-bindings: ab8500: Describe codec DAI and
 microphone wiring
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-ux500-simple-sound-v1-2-6771ac714e82@kernel.org>
References: <20260911-ux500-simple-sound-v1-0-6771ac714e82@kernel.org>
In-Reply-To: <20260911-ux500-simple-sound-v1-0-6771ac714e82@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 mfd@lists.linux.dev, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

The AB8500 and AB8505 codec block exposes two digital audio
interfaces. Define the codec as a one-cell sound DAI provider so
generic sound cards can select either interface.

The codec binding conversion also omitted the analog microphone type
and bias-routing properties supported by the driver and documented by
the old text binding. Restore them so boards can describe the codec
wiring without schema warnings.

Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Lee: just merge this separately when reviewed for DT and you think
it looks good.
---
 .../devicetree/bindings/mfd/stericsson,ab8500.yaml | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/stericsson,ab8500.yaml b/Documentation/devicetree/bindings/mfd/stericsson,ab8500.yaml
index 0fdfbfdfe88a..ab2a0a89b878 100644
--- a/Documentation/devicetree/bindings/mfd/stericsson,ab8500.yaml
+++ b/Documentation/devicetree/bindings/mfd/stericsson,ab8500.yaml
@@ -312,6 +312,30 @@ properties:
         items:
           - const: audioclk
 
+      '#sound-dai-cells':
+        description: Selects one of the two digital audio interfaces
+        const: 1
+
+      stericsson,amic1-type-single-ended:
+        description: Configure analog microphone 1 as single-ended
+        type: boolean
+
+      stericsson,amic2-type-single-ended:
+        description: Configure analog microphone 2 as single-ended
+        type: boolean
+
+      stericsson,amic1a-bias-vamic2:
+        description: Supply analog microphone 1A from VAMIC2 instead of VAMIC1
+        type: boolean
+
+      stericsson,amic1b-bias-vamic2:
+        description: Supply analog microphone 1B from VAMIC2 instead of VAMIC1
+        type: boolean
+
+      stericsson,amic2-bias-vamic1:
+        description: Supply analog microphone 2 from VAMIC1 instead of VAMIC2
+        type: boolean
+
       stericsson,earpeice-cmv:
         description: Earpiece voltage
         $ref: /schemas/types.yaml#/definitions/uint32
@@ -319,6 +343,7 @@ properties:
 
     required:
       - compatible
+      - '#sound-dai-cells'
 
     additionalProperties: false
 

-- 
2.55.0

