Received: from mail-m49236.qiye.163.com (mail-m49236.qiye.163.com [45.254.49.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EAE93B14C0;
	Wed, 15 Jul 2026 16:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784132770; cv=none; b=OZcad861eZYHftCcfBx1sGnHkpxOYeoasZqoFmkEfIQMXoCwluRF1RRWqYXRH/nJqFlde0TXST6uxY7RhNqt+piUpKKzgAf8J0shuERo9sIg665cpfGMu4jm3DU0TiXj+ujsnXkf6vKT9cUZ0J5xyv3F+PzHoSetDRrkE4R57FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784132770; c=relaxed/simple;
	bh=Wdq79F7my2vTkDlJ4tgWR9sajb2tA7FaF8yf0n2mnvo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pVggAVktMGAkxOnWGtC5+UXCoy4ax/ESvP3O41awHrJb6X5U7NzZJoMWVU4FgZuJvQ81bgYEa/jqzveNs9zWcXRF4q7TieeRiP/nGrYHVIa4Lu7FMdndoDzEu90lLeFPwY23lt3X2s0jOkM+VAcyOi7QbSPJDoK3OCN8ABLs3R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=GUO69Ko2; arc=none smtp.client-ip=45.254.49.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="GUO69Ko2"
Received: from [127.0.1.1] (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 464e8f2e8;
	Wed, 15 Jul 2026 22:03:22 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Date: Wed, 15 Jul 2026 22:02:50 +0800
Subject: [PATCH v2 1/6] ASoC: dt-bindings: es8316: Document jack detect
 inversion
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-rubikpi-next-20260605-v2-1-67601d7a8581@thundersoft.com>
References: <20260715-rubikpi-next-20260605-v2-0-67601d7a8581@thundersoft.com>
In-Reply-To: <20260715-rubikpi-next-20260605-v2-0-67601d7a8581@thundersoft.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Daniel Drake <drake@endlessm.com>, 
 Katsuhiro Suzuki <katsuhiro@katsuster.net>, 
 Matteo Martelli <matteomartelli3@gmail.com>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, 
 Srinivas Kandagatla <srini@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Roger Shimizu <rosh@debian.org>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Hongyang Zhao <hongyang.zhao@thundersoft.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784124199; l=1226;
 i=hongyang.zhao@thundersoft.com; s=20260127; h=from:subject:message-id;
 bh=Wdq79F7my2vTkDlJ4tgWR9sajb2tA7FaF8yf0n2mnvo=;
 b=rfxwjNNJL4KJe8aHNGtgqgAflfD5l2lg9YZAWKsnFx4zpXsFN9SKyzqlLq4cnk2Y+27KLuXiW
 EydftMSGKqUDXwKwm4Rsxav/OTFWhmDT17GLPAgtjr0MMxxkmfHBKfq
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=D9yL5W9Zj0lPBDAq9gzY++1849VlXuTWAkROzZ88J/4=
X-HM-Tid: 0a9f6616dc1709d5kunm638899c2110ab
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDH0IaVhgZSE9MHxlPHk5NTVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0
	lPT09IVUpLS1VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=GUO69Ko2/rkShfkqSeo/ekIHmOV40N6iY4T+Tw4xd/ThfXvXJpYDxtWUxKIYSCWo7B6iiUx40v8uxH0ay83j+YS9de22UlBvxL8S6k9eVTRLYaKlR3mIeAhTX6b8XRlWR704UGUfAGsfzkjcNXvXFK/xn0KiH8Ve8WAdaoGBQ0Q=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=PeRqQcFC5p/CR8zMxUYy+dTkQgSnC19TL3scMvmFpVQ=;
	h=date:mime-version:subject:message-id:from;

The ES8316 driver supports the everest,jack-detect-inverted property to
account for boards which invert the codec jack-detect signal. However,
the property is not described by the binding, so a valid user of the
driver fails schema validation because the binding rejects unknown
properties.

Document the flag so boards can describe the jack-detect polarity used
by their wiring.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
---
 Documentation/devicetree/bindings/sound/everest,es8316.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/everest,es8316.yaml b/Documentation/devicetree/bindings/sound/everest,es8316.yaml
index fe5d938ca310..a0a4c1c99cf3 100644
--- a/Documentation/devicetree/bindings/sound/everest,es8316.yaml
+++ b/Documentation/devicetree/bindings/sound/everest,es8316.yaml
@@ -60,6 +60,11 @@ properties:
   "#sound-dai-cells":
     const: 0
 
+  everest,jack-detect-inverted:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Defined to invert the jack detection.
+
 required:
   - compatible
   - reg

-- 
2.43.0

