Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97463AEF46
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 18:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782496892; cv=none; b=AzZ5FgZ9v8oUCL9NTfpqC105doomhwb67j18iCyyjDD4xhtT1gyajF7DpE04UCts4yKq3/k/sRiPeJMZjKDOMQzdEa/hSV+1SwKSPLeizGCS1EKpHcMn83g6LRkiupJkP7CCOt9I3KY8RaBwh7yc/BWkn9C2CvBurVyA8HS53pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782496892; c=relaxed/simple;
	bh=wiQ/vcN9yqIC4sO1aCpSqdLoX21DBVtg1q10dXzjuGo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TIuTkaPCHtsEs35D9CmI1fPofH5m/V0idZmNq2pIN+AmoWvH/Z+o0xBa9SmUq8ErI8t048TGruFJm/0qJHy2MnmfCiej+aHk2uyXwitP0v/Wc3POmihvQh8PE9KA5REE80+d7156BB2q/5ToPGIVDcZZExkqD3ID6L27AIBtCH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Z/K/i7nC; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Z/K/i7nC"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49270caa5c0so2278185e9.3
        for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 11:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782496889; x=1783101689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Pu3bwvVTJSBGwVuDVBPY5a/3kPulEt99t/TlX7CirM=;
        b=Z/K/i7nC3Ty0ZiMYwcCX7/crvkKA6qREUneq84i6s7EnZNVTgl7d2aM83nMjcJ2OeI
         2UUZ+/I5NEHsjgdslfI/CvLd31eyv7CwaB19fdWLyBU4LSTNcWCw4UtdfwU+YAGIU/PB
         JkmU92LueimJ6kWKMq5DkJJiZd/0RvEQbVtC4PuexxqPn1SMikuqQ2CLLLkxHawOkTcu
         CVO/Sn6aYOjZR8eJSWCQBMWuHwWDNiDaVz1AXS81IKNpi6f3NvBz8g+wWAFwXARtDtzy
         Kr0aX3zAGqFfn30Cqwr3CuKBMxN+zP/W0blgwJCDmtmHG+xprBlXh/fo38dm/rJvyEXa
         mFlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782496889; x=1783101689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4Pu3bwvVTJSBGwVuDVBPY5a/3kPulEt99t/TlX7CirM=;
        b=q3bKFTHjjvLRnCOjXV1FLpi9A/fb95dLLTtkbrSQoziTqvLWlxm/cOHJHzpxkn/Srf
         lBvAi81joIOBuzi7HAjAFxmH0qN0/Pdh3ZgAKwuDvqpXFOwYQM6+HOVVmuLJFsZ37+gY
         lJmsfZGSgcpbIPfQu57+HgGuWtVCcmL/c3d42NmRGL/RtV3j9m+BtGvxBsDj6MGaYnW2
         jaAaJof6y12MHyqKk7JxNApDYZOmgZcNXYlnjQC3R1FqRRnHylhFCWNqQ1VM/9sCaGQj
         uSQl07pHJil8ypU2mBD8I8IKdexGZcpx/4r327kff5XX3zR8cl7J1ejUouWV0eN9lt2S
         LCXQ==
X-Forwarded-Encrypted: i=1; AFNElJ+KHnp8/1mJuPSkCeV5NKD6maP8/bBI9rgQYVz8vJuDsw3cUdPavPFSR1U1yupvA1wu4G0a1XEJgUZnAg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7txEK+gisIenlIEF2j0V8yueHejyZAk8Nn9heQFByumKM7Eqk
	4wEH1Vei94a41drM+E+mTzKPZ+0litDbvxyqKvtSTej3YdljEsHfNVxLrqABaI1K+5U=
X-Gm-Gg: AfdE7clZ6tIy/uKQ8UsCtHP7X2/zJu1DoUfzCsyAPWBJDEj170ApKx2tGN5gsVuo3Ki
	PaxrjnLOKfEpHtRPHoHJptSx4CU4DrzD6WLTy0QyGFinrXLLEBNuv8xiOpkQioc2N7HKmdyeUzB
	BbmnPjfSwdHlK5QLErP/nwQ2NchFp2wd/ds15WGB4Exef06UQ+QNhtyVFjwsovGIGCpGOs9AvtS
	v2OeaOZ97DbcyC5zYJSqBeQjRRi1bts+QPNAD0Uu+kX24cDsGJPPKRZgy7c5grPgigWFoar4Lxh
	2ZT3sFu4+uqHNIMXNDgE9zSgrTZcj1plvGGnRBqNM9JJji9Qj3H8TDsHWLNQLMlXUmSFrVDA1aq
	xIsRCFgGHjD9nDgV3XY34/845uYK4l0iPo8bKYqYHd6bJ3csHzH79wHpZcL+mbLdBKB4CadIVpN
	AI9052S6FSrMY4Km87zu4SiXfeMdy0ka7YiEQSRwBva0jeDwLyjaMSNykJOAXJxPLcAH3NbIog9
	xcxKnzXmQT0Rnc=
X-Received: by 2002:a05:600c:8b6d:b0:492:367f:8039 with SMTP id 5b1f17b1804b1-4926689a1c4mr129181475e9.33.1782496889019;
        Fri, 26 Jun 2026 11:01:29 -0700 (PDT)
Received: from localhost (p200300f65f47db04b3606a871f5f1c38.dip0.t-ipconnect.de. [2003:f6:5f47:db04:b360:6a87:1f5f:1c38])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4926c2954efsm48167005e9.2.2026.06.26.11.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 11:01:27 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/17] ASoC: rockchip: rockchip_sai: #include <linux/platform_device.h> explicitly
Date: Fri, 26 Jun 2026 20:00:22 +0200
Message-ID:  <d2fe7dc85277b01526f9320ed5baab2acd29660b.1782490566.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782490566.git.u.kleine-koenig@baylibre.com>
References: <cover.1782490566.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=901; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=wiQ/vcN9yqIC4sO1aCpSqdLoX21DBVtg1q10dXzjuGo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqPr49qSP2y8FOQPKksQy9Ga9uLoAQXuQWxfh3p I/V6cThLDaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaj6+PQAKCRCPgPtYfRL+ TguCCAChulsb7LA3PaMi7MyduR+3smp+OnkByHv/0OcMzkhVsmyy3BO/FMSij9hrhx5UzKXtYCF B/cBzfi/EkWVY1cE7ZORNNOmmC1fSRZZ3f+S64TDUcqqD+m+pqITM8OB2Q8X7LY+8RAk4Rwz8ri 58w3TKtqcPhY0l/B65mypKhUe1li2Lg2wbCccROMqFOap8c4wySw7zmzOzidk//5xa2Vq+V0iEk yTntNx+twfeolHSZodcmXx35avQrnNbQJOceqdqYuubZi5V4BnL5dt++wlhYfVIhEdoohbeAvSQ XAsyYm+sRiwegMHWaVt/f5241d6cDts58TWqQJPvMd9k11KZ
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Currently that header is only included via:

	<sound/dmaengine_pcm.h> ->
	<sound/soc.h> ->
	<linux/platform_device.h>

which doesn't look reliable, still more in the presence of the comment:

	/* For the current users of sound/soc.h to avoid build issues */

in <sound/soc.h>.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 sound/soc/rockchip/rockchip_sai.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/rockchip/rockchip_sai.c b/sound/soc/rockchip/rockchip_sai.c
index a195e96fed0a..37e81d56bc16 100644
--- a/sound/soc/rockchip/rockchip_sai.c
+++ b/sound/soc/rockchip/rockchip_sai.c
@@ -11,6 +11,7 @@
 #include <linux/delay.h>
 #include <linux/of_device.h>
 #include <linux/clk.h>
+#include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
-- 
2.47.3

