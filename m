Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A50023E325
	for <linux-sound@vger.kernel.org>; Mon, 25 May 2026 09:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779700880; cv=none; b=fBDL0X2E/mhYeMNEdgcErUVOmttNF9lr4pYEVN68ZwX+4nu3RuGttzsB1gLIRBHmqrOrBDMUI0nciuQ8pji6cK1JyAIPtl2sf/KCxYFq0DperwVhkb9fv3IekVN1UcfJvJCiNrunf472xp7KWUtDiedq1MrEoNMfNRpF2JbM+IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779700880; c=relaxed/simple;
	bh=7lRQrxj44SXO53Ulg89F7Nql5dQ+71l+f6jdW6KyPxE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gsiAguO9s34xjyApcDAX3EEjCb9TCfsSiVgmQse73XeUZXtWyzAU4GkQm38/KQSjbJp48XjLipPCcwR+vXAy/7BIAMhzq4frR7pcnXoZpIztxbQX3gdqaPsCuQxULC2iRGc74xVYhuqELT1Uzdf1HVJnsuP1klUYq7v3F+toKk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=KEXY9Pha; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="KEXY9Pha"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4906869f0cbso4234495e9.1
        for <linux-sound@vger.kernel.org>; Mon, 25 May 2026 02:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1779700877; x=1780305677; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sSFS8XsJ49zr+uswumEqD50SMXkceam4xnolYqy0+HM=;
        b=KEXY9PhaUmSqPVRQvG/Bl9zh/YQj2onLWrmF3htjanA1WecfvlOzL/B24uCi1wECwS
         uEhCGjt5d9OYq9me9lIz3JBQjqs1KZpbrE/kO1mxSD6IdbLvRnqQKbUqEhIudRevTbS9
         2dIy6Fv7DvJGRRCQIK8nL9wb6stfpL9qtGoY0IU1VE8RS+WiCVJcHm6I0pl/TVgOqhih
         VZpdaEUgYNeUbN8waF0DhbeAxvSz1YyGfvOH/IALpkWryEoqRHOIoJf1OR6yqSWktvWt
         5Nr6fq/u9InyEmlBtYySBDY9NEcH1+GYpD0VzwxITx7906dbV2zJpQk5AqfUE+I+N3n7
         Rc3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779700877; x=1780305677;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sSFS8XsJ49zr+uswumEqD50SMXkceam4xnolYqy0+HM=;
        b=YuGsCqiOy4NcCXuOsCMOrzTI06uo265g4tfmzpwp4orh6WPJ0Nir6MBEC6pnkK8Whi
         ZqGDBhnSZB0UeZJmhYqkothDJjn6PoMmIaSKTmrvxk7xqtydwMXOt/N3cvYNYQNKEyLd
         REG1XyH7bpxXAxSj0B6+QcrpUQHzNGBYlgFhpAMhqdv0PyGg42cmPWhwkGG9pY8x9/2O
         aNw50/dErqEU15tC3ZlRiO0ioH+YcZN7kFlK8UwLjHgH6+EOzsltxBoPi15er7pGqOf0
         lsG/oemY9CTiCDVmRhl9rTMSDbZb5AjoqUpkjY9CWNrAyrwCIYPjWwyAIJLnj8eYN8rb
         o2og==
X-Gm-Message-State: AOJu0YxTjiGila9RZuFmw+sSYwAml5kOlcn4aGZV4g7/IQ+40pTCbhkw
	fr9g6/7srOThHE3WVTZVBB0yMTpJOr9HziR2sgWpInXFgzhCckVa8f6bcgzmWve+Jd+/ILzs75T
	LheliYQY=
X-Gm-Gg: Acq92OGdvLgDPTWDHF3KkG11FBxIXKU/nm7h900BJD/XBR6In6/gE9SReKtK9ewK4ZJ
	2+fnp4IkWxofeHXhDT3n22Bfei4aIOjfkP1d/EVzhnD1DEHigPueMjF7gATDYgo0EWKXY4wVjB/
	hDuKk8G6z7Dn+IYJ3hK4+iqliif7Vxfipu6iWWdkIOZ5XWAtooSw2D74iYTQdNQ4pDF5Oadw2Ng
	0NO+y9H3h+FH2Kph08nLI/JUKYm/i+sCmCdsrOTPLXtrtyj/30wfyy2W/NA3vCId9vSiBK7bx47
	+eV3cUI4N5yi6boCFyb0IUOLFGfPBL2aIkuL8yEM1eq0LYkJrdfQv1LBzUe/JgeONe7UKcsBuIu
	rVuYh6FSk+G88dZ5oF8aVTAJ+Ya22CZ3QiwsL5RvT02awJjHrmaTzTZDlI4xBeDDh9bTD/DbrJA
	2HhzaZAfy/9PRWhLRqGaz1a9esJWj4RE7JxFisFsQ5wJWdfqtJ2ok=
X-Received: by 2002:a05:600c:3e16:b0:490:688b:f10d with SMTP id 5b1f17b1804b1-490688bf142mr27232215e9.7.1779700877371;
        Mon, 25 May 2026 02:21:17 -0700 (PDT)
Received: from alchark-surface.localdomain ([5.194.92.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d4ca0dsm25399989f8f.18.2026.05.25.02.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 02:21:17 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 25 May 2026 13:20:45 +0400
Subject: [PATCH v2 1/2] ASoC: dt-bindings: nau8822: Add supply regulators
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-nau8822-reg-v2-1-7d37ae393e46@flipper.net>
References: <20260525-nau8822-reg-v2-0-7d37ae393e46@flipper.net>
In-Reply-To: <20260525-nau8822-reg-v2-0-7d37ae393e46@flipper.net>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Lin <CTLIN0@nuvoton.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1609; i=alchark@flipper.net;
 h=from:subject:message-id; bh=7lRQrxj44SXO53Ulg89F7Nql5dQ+71l+f6jdW6KyPxE=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWSJiNSJbRefdb+5r9hu90m+E2tOqj90/NYj+HPh21suq
 9edmnfqfcdEFgYxLgZLMUWWud+W2E414pu1y8PjK8wcViaQIdIiDQxAwMLAl5uYV2qkY6Rnqm2o
 Z2ikY6xjxMDFKQBTHZfC8E+L/53MU6t+mX8/96peaGX5zbEk1tip7nfjLafbAWJOvQwM/wwPv73
 DyHVHtP/Ll/nZ07efOl5a+PJFmn6K8CXBqtcZJ5gB
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

NAU8822 has 4 power supply pins: VDDA, VDDB, VDDC and VDDSPK, which need
to be online and stable before communication with the device is attempted.

List them (as optional) so that device tree users can ensure correct power
sequencing.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 .../devicetree/bindings/sound/nuvoton,nau8822.yaml     | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/nuvoton,nau8822.yaml b/Documentation/devicetree/bindings/sound/nuvoton,nau8822.yaml
index cb8182bbc491..cf4c13038241 100644
--- a/Documentation/devicetree/bindings/sound/nuvoton,nau8822.yaml
+++ b/Documentation/devicetree/bindings/sound/nuvoton,nau8822.yaml
@@ -30,6 +30,20 @@ properties:
   clock-names:
     const: mclk
 
+  vdda-supply:
+    description: Analog power supply
+
+  vddb-supply:
+    description: Digital buffer (input/output) supply
+
+  vddc-supply:
+    description: Digital core supply
+
+  vddspk-supply:
+    description:
+      Speaker supply (power supply pin for RSPKOUT, LSPKOUT, AUXOUT2 and
+      AUXTOUT1 output drivers)
+
   nuvoton,spk-btl:
     description:
       If set, configure the two loudspeaker outputs as a Bridge Tied Load output
@@ -54,5 +68,9 @@ examples:
         codec@1a {
             compatible = "nuvoton,nau8822";
             reg = <0x1a>;
+            vdda-supply = <&vcca_3v3_s0>;
+            vddb-supply = <&vcca_3v3_s0>;
+            vddc-supply = <&vcca_3v3_s0>;
+            vddspk-supply = <&vcca_3v3_s0>;
         };
     };

-- 
2.52.0

