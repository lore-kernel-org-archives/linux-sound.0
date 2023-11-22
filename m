Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0B53D98D;
	Wed, 22 Nov 2023 09:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KWUAAVMs"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CE674C3277A;
	Wed, 22 Nov 2023 09:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700643675;
	bh=2yB/95VY8csRcp3gwbGuay0GMA68pBrggdJGpb1nR7w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=KWUAAVMsRAVD0DA4AHIcmVwW6KCUBDimotQhmkr06mF949OELmFvNivMF10kZMJ/Z
	 okCcV7DRE7pAuAV8NG29ysniXdcMBF+mBEdlYokaSC/W3yvlIK7PRsBSnFvESM+Ls4
	 ygJS3OHbr8fnyax58iILqCGCw8pSbW4sfSFQ2rV2T3L8Hai18IKtJ3uT2/QQ8kDV7w
	 q7zocSmRUFtUhzGgd/TvX2PeoE+UmSUw/hFQeh33ZWro4fvwQbhso1t3bsEL5Y8vEo
	 gdff3KoDbh5kOsWeAfsb5Yj2eki6iiCWbKcHi69fQGoOp+3bVQ1yqTU8NNtdtsMevH
	 fpVdfZfrzaVrA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE284C61DA7;
	Wed, 22 Nov 2023 09:01:15 +0000 (UTC)
From:
 Nikita Shubin via B4 Relay <devnull+nikita.shubin.maquefel.me@kernel.org>
Date: Wed, 22 Nov 2023 12:00:06 +0300
Subject: [PATCH v5 28/39] ASoC: dt-bindings: ep93xx: Document Audio Port
 support
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231122-ep93xx-v5-28-d59a76d5df29@maquefel.me>
References: <20231122-ep93xx-v5-0-d59a76d5df29@maquefel.me>
In-Reply-To: <20231122-ep93xx-v5-0-d59a76d5df29@maquefel.me>
To: Hartley Sweeten <hsweeten@visionengravers.com>, 
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexander Sverdlin <alexander.sverdlin@gmail.com>
X-Mailer: b4 0.13-dev-e3e53
X-Developer-Signature: v=1; a=ed25519-sha256; t=1700643671; l=781;
 i=nikita.shubin@maquefel.me; s=20230718; h=from:subject:message-id;
 bh=fQkTeXGg7TcwMQIX97nCBe2cVG8/7E1wIWiv9MYol48=; =?utf-8?q?b=3DrOtEsf68m2PM?=
 =?utf-8?q?3FoJfLj4Nz3g7e0qBm867FCxZytcFiu2AQlnbYAU03C+R9Md3rRnAkbxgUhUhX3R?=
 NACvJQAFAFJQqVqEOpZoCZDJuBogcODAtEBWfGAYwnZrwWXvyDy8
X-Developer-Key: i=nikita.shubin@maquefel.me; a=ed25519;
 pk=vqf5YIUJ7BJv3EJFaNNxWZgGuMgDH6rwufTLflwU9ac=
X-Endpoint-Received:
 by B4 Relay for nikita.shubin@maquefel.me/20230718 with auth_id=65
X-Original-From: Nikita Shubin <nikita.shubin@maquefel.me>
Reply-To: <nikita.shubin@maquefel.me>

From: Nikita Shubin <nikita.shubin@maquefel.me>

Document Audio Graph Port support in binding document.

Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
---
 Documentation/devicetree/bindings/sound/cirrus,ep9301-i2s.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,ep9301-i2s.yaml b/Documentation/devicetree/bindings/sound/cirrus,ep9301-i2s.yaml
index 36a320ddf534..4693e85aed37 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,ep9301-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,ep9301-i2s.yaml
@@ -50,6 +50,10 @@ properties:
       - const: tx
       - const: rx
 
+  port:
+    $ref: audio-graph-port.yaml#
+    unevaluatedProperties: false
+
 required:
   - compatible
   - '#sound-dai-cells'

-- 
2.41.0

