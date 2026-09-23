Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69D53793C3;
	Wed, 23 Sep 2026 17:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790185640; cv=none; b=kh9bWN/wD3X7wGEyyfQ3X2N2vZA5eRIAgI0faiNyiH4mcHcWlgMQ9nayX92kb1Awet2MgL5JMSjQo7QQM+NbseZaoYOBKrp7KG59E7RAds1PU/5UueQEVhpXn3xuM26SgwQRvuXLQQSw1hDot/ZK79cQup23OPUXiV4J5tEP4sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790185640; c=relaxed/simple;
	bh=HSg9fz3ChYnTuBZGtRM3JFZJhjj2NzjCEu0jHZu9nlA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=W5t0EHXQhVWzVkM4FKakrlZVTqoTxRyw6Pk6rPcb8qr9iM6xgIsJ22ghIKnMCl9DexLVsgNcSxz1KInWjR8qRdNcv29LAsmfNo8cXWn+BmhKyLmRB4jJBGP8AzxcqznV9KPUEbn0d+YhAeGdCOCHCZTLN2w1yson/SgQp8/qTDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IuesDAvo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IuesDAvo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D93B01F000FF;
	Wed, 23 Sep 2026 17:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790185639;
	bh=4OgXmOT1eR6dLDYiBYN6lgOZgsKUlnftPl3A6srdwPw=;
	h=From:Date:Subject:To:Cc;
	b=IuesDAvoP4zHkBxXnphX3H8TqZLCFEsd5P6KDU6D3ipYRw8W+bdGrJIsju7BQ7SvU
	 EFsDpPeiFF4dLlb523L6DcL9wp4CWPUl1Ggv1QbPaHu8SxnTXIDbbhUuU1+/h5M/vi
	 yjU9t/JUJWEISK4KPmJVBu+kyXBsD/yvlEH3vRgsv1ku/nfWqraD/N7xfohZEYOcYL
	 GI295Y4fkx69YfHOukwVw/L/qKxz33UV7PK7tVQhfSb3iSkLarjHmon+gwUxhVWxiw
	 u/qoYimmm/+DRwz9PTyThxsEwtnSAcdgJ2p6n8NpD7cEPgWH5R/4w+bsin2tkK63Mj
	 l0qLuj8YvzrZw==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 23 Sep 2026 19:46:55 +0200
Subject: [PATCH v3] mfd: dt-bindings: ab8500: Describe codec graph and
 microphone wiring
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-ux500-simple-sound-v3-1-56a771c3ea28@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23NTQ6CMBCG4auQrh3TH2iLK+9hXBA6QiO2pJUGQ
 7i7hbjQxOX7JfPMQiIGi5GcioUETDZa73KIQ0HavnEdgjW5Cadc0poKmOaKUoj2MQ4I0U/OgKF
 KmarUslGc5MMx4M3OO3q55u5tfPrw2n8ktq0fjrF/XGJAQSrFmlaxEjU/3zE4HI4+dGTzEv829
 F+DZ0Nrw+uSSRSt+DHWdX0DYrOb2vkAAAA=
X-Change-ID: 20260903-ux500-simple-sound-d077d5486a72
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
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
The Ux500 HREF500 and HREF520 audio support still relies on a
MOP500-specific machine driver and ad-hoc text bindings.

Convert the MSP binding to DT schema and make the MSP and AB8500 codec
nodes proper sound DAI providers with audio graph ports. Document the
sparse TDM slot masks already parsed from audio graph endpoints.

Describe the fixed DSP_A or DSP_B format, codec clock-provider role,
TDM frame and active slots through endpoint graphs. Add two-link
audio-graph-card2 cards for HREF500, HREF520 and the seven supported
Samsung U8500 phones.

Keep the codec-provided bit and frame clocks running continuously on the
HREF and Samsung links. This matches the legacy machine driver for HREF
and the product kernels for Samsung, and was verified on Skomer.

Remove the MOP500 machine driver after moving its fixed clock and link
policy into the device trees.

This intentionally breaks the device tree ABI with older Ux500 HREF
device trees. The old binding and driver have been broken for years and
need a clean restart.

The series has been tested on HREF500, HREF520 and Samsung phones.

MERGING STRATEGY:

- Get DT bindings ACKed
- Lee merges the MFD binding patch
- Mark merges the ASoC bits including the MOP500 binding removal
- I merge the top commits with DTS changes and defconfig
---
Changes in v3:
- Drop applied patches
- Only one patch remains, for Lee.
- Link to v2: https://lore.kernel.org/r/20260918-ux500-simple-sound-v2-0-88d29416e3c3@kernel.org

Changes in v2:
- Keep the HREF and Samsung codec clocks running continuously.
- Rework the HREF and Samsung cards around audio-graph-card2.
- Describe the DAI links through provider endpoint graphs.
- Document sparse TDM slot masks on audio graph endpoints.
- Link to v1: https://lore.kernel.org/r/20260911-ux500-simple-sound-v1-0-6771ac714e82@kernel.org
---
Lee: just merge this separately when reviewed for DT and you think
it looks good.

NB: Rob's ACK lifted from the earlier titled version:
https://lore.kernel.org/linux-devicetree/178976107058.1655739.6392532217175224491.robh@kernel.org/
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
 

---
base-commit: 3d57e8f5073d85b08e9fd3044211c3645e552734
change-id: 20260903-ux500-simple-sound-d077d5486a72

Best regards,
-- 
Linus Walleij <linusw@kernel.org>

