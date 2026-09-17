Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D25E43935C;
	Thu, 17 Sep 2026 22:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789685478; cv=none; b=ajR8fjbysWia3jp/hBzUULmAxNMBDTFqxDW9kAV4I7POsffLLUVoGVCmDjsBWeMeyCWzcHcg9p/+w4crqJGoGSQr3Vg0h5cHHB7p7T8rnV2jgxV8064qk68B2SAe0wWxFmnwWSfpnsYlgTXZt2erudIttSNO+1DJTDNzENNiggs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789685478; c=relaxed/simple;
	bh=KNNFFgjTQ3yxRB5r+sJE/lTCTCtPbzn5fFwYWn4mc6Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bDNSXI+Ijbjst/bv2MzoAoFo7v6m3+D8XuRIfvD6lgIdxmwasOTS562GAwRPKR+FUe+dnWBR9wktc450Jy870Ixu5PQcq8/DR7okYT7wDU/hq8hDmXm+FqazmSVZiWHlOk4oUcBhfglFumQPEuCu0QUdHu8RNrpWx12A+/E/x8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UzZqLTAQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UzZqLTAQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8221A1F00893;
	Thu, 17 Sep 2026 22:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789685477;
	bh=RbdgGz7xI2+kD+QzJgJE4heL9NUgwqFAB/SgtZU6n5E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=UzZqLTAQZ9GCQeRJspc+6kiDijXVitdirmeiaqvLP2N+BVhngoZNX/+eVGjOKJbRV
	 7PFOJcd4PG1pmuVG2dlJ/iaJgjVQ3OkgHApMQFAMkb/E+uCcUJNyo4/uGbPc7tuPrV
	 Rhpv/lZkQ0awE6j3NYuVkBwMeiB0tY3r/SbsoHsdAb0cBGEReAzNotMGrqWyD/AWNc
	 yo6OQj+aG6iunN0Qs0jypDpuSB8HdHIoTcPJECRjunindNWJhoktMui3oyyWKAWLtP
	 gNO6TTox0sdbnGT/MC80VBoP082sPxIk2iuAU0jAN2E4aByuW+Ct26jFUjmCX5kO1m
	 +iBuvp1XwxirA==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 18 Sep 2026 00:51:01 +0200
Subject: [PATCH v2 3/9] ASoC: dt-bindings: ux500: Remove MOP500 sound card
 binding
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-ux500-simple-sound-v2-3-88d29416e3c3@kernel.org>
References: <20260918-ux500-simple-sound-v2-0-88d29416e3c3@kernel.org>
In-Reply-To: <20260918-ux500-simple-sound-v2-0-88d29416e3c3@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 mfd@lists.linux.dev, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

The Ux500 device trees now use audio-graph-card2 and no longer contain
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

