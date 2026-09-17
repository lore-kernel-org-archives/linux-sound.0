Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E674A7C88;
	Thu, 17 Sep 2026 22:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789685476; cv=none; b=KKrFo7qeKacYjihybeCdo3wPUpJc1FE5lC5WrQ4kA+rZ1Kvo60+IXy0OwRfT0BsmAjLGBPbD40CSGKXrQZM9pl4sXAUvzgNEOKw3uBtvCxzJPdQmrMRbGKr3FQnUXdwdzkY3Puf7Cin3t5cdusunCxKH6kqsrtpBDMKM7SWz54k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789685476; c=relaxed/simple;
	bh=MXoEq8YeBTGm+4lJOKOadSCocL9PMf2+q0loTFPdIQU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tDWaOHFTYg66id8izR9VQ4+Z/sxe9wB1M+mAY9CnuFfa0PJrInjSFk4o3AR4NsYhwcpLhuzPhZBu0DayWY8C6YQkiOzzmo998PKiZZh1XenJTwKiXe9YEq6/Ut437n53J1mcXOYWA+vNbZkCIqKep2izHd43Wn3AuSkWRDsP+LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lUp9YcLo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lUp9YcLo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72CF41F000FF;
	Thu, 17 Sep 2026 22:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789685474;
	bh=CEgLEzxHTZiNMhLgaQoenIWjoTx1JjMWfpq1XdJAtEg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=lUp9YcLoX9sqnBUZOBIy2bC9XtwAqdnGq8hWeuVyG2e9V+QL1tCrHyFEPLEIlSJFp
	 PM1uoSjc9wk+7tYY0IgMFnlqPsxgZ1ov6bft4X3BHS28B1wiycnaW4cU7gOjY3nyXG
	 3igLTLOHjq4HQHC1iNdTnqbLjFX4GqkZYSrcuVd3ErhAzJLzz9vdcUWXzwHP6wHTN6
	 +j+Q18FU5iUbk4M0r0mqgehxcjStFVjgFIIhBw9H4Lbrm7/DILZEGgAfinMAnUrJNx
	 n/EBGEp8EVfVS42AOEhUJmwMSjJuRYWqXSIIcNdjkW3QuysxMa2vetowA+NoCoZ7K5
	 Ie1mYvwr/KSHQ==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 18 Sep 2026 00:51:00 +0200
Subject: [PATCH v2 2/9] mfd: dt-bindings: ab8500: Describe codec graph and
 microphone wiring
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-ux500-simple-sound-v2-2-88d29416e3c3@kernel.org>
References: <20260918-ux500-simple-sound-v2-0-88d29416e3c3@kernel.org>
In-Reply-To: <20260918-ux500-simple-sound-v2-0-88d29416e3c3@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 mfd@lists.linux.dev, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

The AB8500 and AB8505 codec block exposes two digital audio
interfaces. Define the codec as a one-cell sound DAI provider and allow
it to expose both interfaces as audio graph ports.

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
 .../devicetree/bindings/mfd/stericsson,ab8500.yaml | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/stericsson,ab8500.yaml b/Documentation/devicetree/bindings/mfd/stericsson,ab8500.yaml
index 0fdfbfdfe88a..873e08266a2b 100644
--- a/Documentation/devicetree/bindings/mfd/stericsson,ab8500.yaml
+++ b/Documentation/devicetree/bindings/mfd/stericsson,ab8500.yaml
@@ -312,6 +312,33 @@ properties:
         items:
           - const: audioclk
 
+      '#sound-dai-cells':
+        description: Selects one of the two digital audio interfaces
+        const: 1
+
+      ports:
+        $ref: /schemas/sound/audio-graph-port.yaml#/definitions/ports
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
@@ -319,6 +346,7 @@ properties:
 
     required:
       - compatible
+      - '#sound-dai-cells'
 
     additionalProperties: false
 

-- 
2.55.0

