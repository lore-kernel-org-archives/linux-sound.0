Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BDF13D891;
	Thu, 10 Sep 2026 23:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789081440; cv=none; b=G8++1HYrHcyum8fm7jvBf+fXKffiaAG6eUii36A641uYl+OKkAWnm9bDzb/3JQ3KF5BQo3enSW33bcT8ffN47VmAPJBXRiuPI870VsJwJfCsZ/EgT8fbtA0SgRgwBTzq9F4+SKo+HG/SMWUg+TN6F8kDixknx4YYf8Qbaf3zYrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789081440; c=relaxed/simple;
	bh=hR4QlaTUqiC0btbp5mWUyD4i02upkWkIeWP4bs218jw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NDG9cBSzlVJJ3IxGwJhzInzn10F/V+9E25XFbUFfAmdn4eY7pDU2TAVpMupuwXhw60a5fZgJejPPWRP06t6r9nzC1OfJ7UbCvk4RVlh2W9IV/sK9XJR2/dJ7Iqv0wuq4tFGYEMSfyK/fmdBGulza09L0+fIzcYu+HdUzXTFrHfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ki54S+8L; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ki54S+8L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DD9C1F000FF;
	Thu, 10 Sep 2026 23:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789081439;
	bh=RKYA+j/hr98Ru7zPyTLsGw4UbV1jWVx4j5AE9VpMatg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ki54S+8LfxqD/+nhA3w3/yC4BAGEmOTiLGeOqaQL2kiTRodzURj9roVEvBzYqk+68
	 Uo0fYVxW3msrqqLqyKapxb73dQF6qMg5uwKJxUkj0fwo1kMtj3wPlo45fmHZ97JYgf
	 0kEbXgdrkZIvVxFTGJM9sGWlqYsbZxEnqd+78dOeTIOUJMEc6nP5g6GGmHIrA/7sq7
	 YPjoPhvZQHdVc1X1VhRtNTNd0gQ9u227ouv1zYH8Cm62bOCAZs9xvs0eQ8XXkC4pSC
	 0cH5gziBWRYxnc+Oiq7M5wyPDrUDF7JgknjIGnbMyLmO4XuvIoLDKYvKKRir4321A3
	 8NiAgbIhvIDQA==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 11 Sep 2026 01:03:46 +0200
Subject: [PATCH 3/9] ASoC: dt-bindings: ux500: Remove MOP500 sound card
 binding
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-ux500-simple-sound-v1-3-6771ac714e82@kernel.org>
References: <20260911-ux500-simple-sound-v1-0-6771ac714e82@kernel.org>
In-Reply-To: <20260911-ux500-simple-sound-v1-0-6771ac714e82@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 mfd@lists.linux.dev, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

The Ux500 device trees now use simple-audio-card and no longer contain
the MOP500-specific compatible or properties. Remove the obsolete text
binding rather than retaining an unused legacy ABI.

Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 .../devicetree/bindings/sound/ux500-mop500.txt     | 39 ----------------------
 1 file changed, 39 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/ux500-mop500.txt b/Documentation/devicetree/bindings/sound/ux500-mop500.txt
deleted file mode 100644
index 48e071c96b46..000000000000
--- a/Documentation/devicetree/bindings/sound/ux500-mop500.txt
+++ /dev/null
@@ -1,39 +0,0 @@
-* MOP500 Audio Machine Driver
-
-This node is responsible for linking together all ux500 Audio Driver components.
-
-Required properties:
- - compatible              : "stericsson,snd-soc-mop500"
-
-Non-standard properties:
- - stericsson,cpu-dai      : Phandle to the CPU-side DAI
- - stericsson,audio-codec  : Phandle to the Audio CODEC
- - stericsson,card-name    : Over-ride default card name
-
-Example:
-
-	sound {
-		compatible = "stericsson,snd-soc-mop500";
-
-		stericsson,cpu-dai = <&msp1 &msp3>;
-		stericsson,audio-codec = <&codec>;
-	};
-
-	msp1: msp@80124000 {
-		compatible = "stericsson,ux500-msp-i2s";
-		reg = <0x80124000 0x1000>;
-		interrupts = <0 62 0x4>;
-		v-ape-supply = <&db8500_vape_reg>;
-	};
-
-	msp3: msp@80125000 {
-		compatible = "stericsson,ux500-msp-i2s";
-		reg = <0x80125000 0x1000>;
-		interrupts = <0 62 0x4>;
-		v-ape-supply = <&db8500_vape_reg>;
-	};
-
-	codec: ab8500-codec {
-		compatible = "stericsson,ab8500-codec";
-		stericsson,earpeice-cmv = <950>; /* Units in mV. */
-	};

-- 
2.55.0

