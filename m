Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C5B3F1058
	for <linux-sound@vger.kernel.org>; Sun,  4 Oct 2026 06:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791093895; cv=none; b=rdYQ1VpqsF/MmumxOxNuxQc429SkdviEJk0jBN9rQkUImOkZyWRLO6T0mAQUYv22C4Dcg/VeJXYJ9DPcSPzFWlPiY7U5bqH61NwJQlQop0MYQ3M8hRZ5wJH11D+5PTza6sFukC9zHzSPgSgCY6p2QHeEjEnjY9XiyQYPHLzWyx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791093895; c=relaxed/simple;
	bh=sNwquOknKR60E7qr2ALmDm6xoE+cnxL/XwbQaJrtHA0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dgljwMPhNHRQq8Bek/kDfLmO/MLHLY/c85F1CFiOlmCRN8zcXIjZmggHD4aLZgNKpTPQUKuZb2FulOXbj4juQ/WG6wLmOJj0zgittMVJgQO6bSOfsZ5tTvDSln0oHmW7UfJ3N01IxohtuzSgKaARtgHjWxIMuis6wxYISpg6r1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X8LhnkI0; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X8LhnkI0"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-3a4c8262465so595270a91.2
        for <linux-sound@vger.kernel.org>; Sat, 03 Oct 2026 23:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791093893; x=1791698693; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OAbS6Ry1BsMnnYJR5/R26PS2NZwQTbS36NknU/TPiuk=;
        b=X8LhnkI0UjtdjhIyqC/8PPzLhlLEnGDFzK3H6CEk7NR003Gl3RQ+5w9lUUy6F0c7YE
         ooZ4WeJtZw+W8WljyGLlZ9MHaaTferywfy++zPYfJO89hhvVQzXJ0SITEUqG7wACSbgw
         JClmFRS0Qsj/e97jER6vrFx3FnxIrc7Wg7Z5cAxM+aeGcMPIS9gPiWbNpdnF1HbTY3ui
         1C+ClxIh6d3yAeqnD9t5WjiFPrOnHCEdUnq4vrjIGwYZieDHRgU7SjrYPWpPKUo8YQrV
         UhKNNKm2GGlaU38fWvnnqF5Uq5P5ZUmHrtZ/ezRnkTTVjQLPEN3njEnuCC15aH9POYhQ
         GybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791093893; x=1791698693;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OAbS6Ry1BsMnnYJR5/R26PS2NZwQTbS36NknU/TPiuk=;
        b=UV/LlqD03LEeG5vabZY3Mqu2FU0DGrpXjNrCtDHFMg2i26hk3HGHoPyeNF7bRfPXP/
         54vg/yKfbzGm9nygYC+NRIX5wEd8EsOiSa3au4c/PgvNEX6SXqi/gLAtY+l0kA7rFQL3
         gjP+maZKisGaTau7frLfLeFIe3vAx0q+Sw3TKKvsDH8MoLm3XpMQq6/WfETh1PjNrfDz
         nbrzebA3XSE3kNiG5JKhWzlg9OkiND1M11ZDXNB7mshG7k6TQRhaNkSDai3CUHH0Qi6R
         4AIJdsaEdoRGOyhpK4ZEB68YYG7dCRTkgFL3YI1GlD5L0qgjKyIOv9NN9c7ZynGAPeDa
         DrQw==
X-Forwarded-Encrypted: i=1; AKwUvBzkolBMKZh9Bhwsmz17JI91ilJBS5uHmck9188uoxicJKzIkBvg6r8uWVFEVyQmvPRVBwWm/Ht/wENnFw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIK9qBKg2gfFu5rQ/MFJlwdPEVyTHnPU3p+di2Fl7mHu+W108iQ
	ggrGc1p/N8+GtjGc1wmoia6tW8JRvGl2kRbjFLs/546v0hkAjUStCL/E
X-Gm-Gg: AYBFou2X5Dv6BXzU2go4EfuHlPbl9ydMFsr9P5i6o9fFPxSp6fYWgW0mkP0vT4Y5v0v
	qQe7xsUAXBx93YxLDBLAe3XegJ2QWcwIYDSEPBKD/LhHYYG507meIlxNaApv4GrceRxUjMUOhqm
	833o+NTcUrQlRo0WfgJ0TAsg9o0uXSlDax6TZFv44xZ0Dq7gFFAoX9Uxqpi/BpgbHULtr0igu5y
	5Likc2azpn3MfU9u5Hy0uaw3Ft5u3KtmWCyXKmuWbuw9xOGyeIfBdOxQczMCSVyU0SlG1+Rp0aV
	IJYkqZnUDQp5D6OlWZrkHl1nSalwGbCucSV/uW/Ls4qbZxLm2D+OLoIkrpHz6Clfm5yfVnanTJp
	sDsbx5yFl/mho3nOQeDTm5O/lArq/GNBUREBPlI/YQtjApdgOz9OUw9we7lIAWtvR3nkRVKA3T+
	tj8XI8tPLe6tI9qgvOEzQGkFhq/o3kU4Rk4hYPDWNnDuiie1FfpoXIKXk4Kdj0bqP08uHC6NhTR
	eW4ICJHMgfZv63SFtXWwuZbOAdIBcff2wfhoWkKrtV4SM5/dFAiQnvdSbTMYmSARoJpzW9/l7Zk
	0APxUV5K2qANhas/9UfWqh+CowW7K5RMWrZgQ2lAl2VkSc8=
X-Received: by 2002:a17:90b:1fce:b0:3a7:f45:5cb4 with SMTP id 98e67ed59e1d1-3a70f4567cfmr3377395a91.26.1791093893061;
        Sat, 03 Oct 2026 23:04:53 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:04:52 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:29 +1000
Subject: [PATCH v2 02/21] ASoC: dt-bindings: cs42l42: Do not require chip
 power supplies
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-macaudio-v2-2-7b47ed6335a8@gmail.com>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
In-Reply-To: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=853;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=sNwquOknKR60E7qr2ALmDm6xoE+cnxL/XwbQaJrtHA0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+Qcf6e/dmXwp77y4Lcv86eFfgvnVs47fDFu24L67
 mtu71cu6JjIwiDGxWAppsiyoUnIY7YR281+kcq9MHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEz1XjFGhhmGhdzFc/juOUVIeuyPiu5Z17TyhPiD4v0ezvfWXI1df5rhf815z4L
 A1HMdWqW/dt0u23Wm2JnNsO/ln7tnspkVu3je8wAA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Some integrators do not expose the power rails connected to the codec
in a way that can be expressed in the Devicetree. Do not require them
to be specified on such platforms.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/sound/cirrus,cs42l42.yaml   | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
index ab4c7d22dc0e..6c100cb36699 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
@@ -187,11 +187,6 @@ properties:
 required:
   - compatible
   - reg
-  - VP-supply
-  - VCP-supply
-  - VD_FILT-supply
-  - VL-supply
-  - VA-supply
 
 additionalProperties: false
 

-- 
2.55.0

