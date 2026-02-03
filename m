Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E693D3305;
	Tue,  3 Feb 2026 16:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770137198; cv=none; b=IgwLqVZoIxaUpH6zelLZBJF6IqSCPuz/36U/a9qT5MLSCJ5xbpvQZc14GZB4pwfrbM8n1/eQhdtMusDrfooJp4H0axNLqT4N9eBLXAm/woz2ffoxKRdNo+Tq8K5CxfRi57uvfM7EFuUNh5BC0+kqz04mnOxJci9cC+7C3oEECAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770137198; c=relaxed/simple;
	bh=ZRxveFjuHAKz0N9JC6lifo8s63buu6Gdv4EOmOK0de8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wh6Z7WoeidYJmFlG0A6htRNqtmYD7dLhMJB0jstdFIbA8aeigp+X0DvaHfN0thFePKTjH9xLt6qXlW2xXrLzPR6JbBfESpdgG5SWe3/osSJY+dAE9BnftAch89hWCnpcnheMD57kjsgIJiy2QooIC1pkwbQAiI51tOPeepTe8IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=e1TsKTxF; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="e1TsKTxF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770137194;
	bh=ZRxveFjuHAKz0N9JC6lifo8s63buu6Gdv4EOmOK0de8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=e1TsKTxFm2d1oUPJtrrrQPlcPL3VSKBI5Q75WYPIgOu+X6PiXI661JyrrASNic2ir
	 4PNhsqMRAOyRqNAofs3BgZCf3EDS+aOYEywykqbhUbebm602ZZIu+tm2dkE6zb5ilJ
	 +nqLUQioCbR+KYA+cajACXKnK4yNzC0V4P4xx9H20DVlLcR7vVH0QxgBfBr6pAsKeg
	 Jm0dzuqeWTFR9Gae+6paKUQKpPM435tgYs10lUNkkYnTo7pizepj6qACo6f1945qFq
	 V8A/gGiWV4RDs7TeE4kmF+Rrxv0XbxjyT5jJvwQsbQstzxjoZN4PpsggjVqYGxVRQx
	 yd0ivz8MVHWmQ==
Received: from jupiter.universe (dyndsl-091-248-189-143.ewe-ip-backbone.de [91.248.189.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7EB4E17E150C;
	Tue,  3 Feb 2026 17:46:34 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 15755480029; Tue, 03 Feb 2026 17:46:34 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 03 Feb 2026 17:46:26 +0100
Subject: [PATCH v2 04/10] ASoC: rockchip: spdif: Use dev_err_probe
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-rockchip-spdif-cleanup-and-bsp-sync-v2-4-4412016cf577@collabora.com>
References: <20260203-rockchip-spdif-cleanup-and-bsp-sync-v2-0-4412016cf577@collabora.com>
In-Reply-To: <20260203-rockchip-spdif-cleanup-and-bsp-sync-v2-0-4412016cf577@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Alexey Charkov <alchark@gmail.com>, 
 Sjoerd Simons <sjoerd.simons@collabora.com>, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1609;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=ZRxveFjuHAKz0N9JC6lifo8s63buu6Gdv4EOmOK0de8=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGmCJmlZLSvZNd4ggqytp70MbIaQgmk7mJCC4
 5Rcm1NEyWbe6YkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpgiZpAAoJENju1/PI
 O/qaS98QAIE/Z2Q7IpgGLLQqvceXzfwIkMGfA9C+vmXmuu73tq5diU1og1jHqNpau3c5mCZ7v5K
 0hGIYiTrWmLKT6OirIUyHfw3iTXKGAUKeay+5szDNymUqmiekVlnhL1t+dFMAHRtVBJf5jskIxC
 6VkCjhuR5ac28EIawNkG5FOMMSrJyd2Q7tuSF/x9G3o+iF17HZ3r3pMezrqbvpMy8H9oOqLyRVs
 6vv+QcsckJe5hzORv/rPAQfCcg5ul5IQYZ5Gg4JHnTZeNhKkSVhfgfF6VwFkdzzRzXSlkomeO1t
 KUDNma+EpPnhFs5a6dqM+mzMWkfSzeM9LNYHLzXthkNl7+5OS/vrCZ6qT3piyIXgihXSODEZTdp
 mYm3jo5tymQMvFYXxQzRnh+uX3DYjS5qGPYtfhUdVBX0JdDj7b2ueSF+3mNzdp+KRqHby1sB+tp
 pHgrJ7USfYH7UvylNxAiruSzk3Bx79GdoGgJSUICN1tZqfg3nUS8DKe+0bXms2Glg7aJ6/alICJ
 RxL0hQRpPemBK4k3lL3BGzv78zfU7b++qFAvlDYSm/8ZUPK2UJRcWzqXiL+YPbG7Y6ActDnV92J
 t/9cMZo9WsrC95vDBseZn7vcTEAC6QGl3nXroXY6YoZkm2481P/IYh6QnUlzFNa9ewTZaROg8xM
 Lwnf8iAqBaAgyVo5bz3AvDA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Cleanup the probe routine a little bit by using dev_err_probe
instead of dev_err.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 sound/soc/rockchip/rockchip_spdif.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_spdif.c b/sound/soc/rockchip/rockchip_spdif.c
index 841ef499ed7f..1c62fcb0d8d4 100644
--- a/sound/soc/rockchip/rockchip_spdif.c
+++ b/sound/soc/rockchip/rockchip_spdif.c
@@ -279,11 +279,9 @@ static int rk_spdif_probe(struct platform_device *pdev)
 		struct regmap *grf;
 
 		grf = syscon_regmap_lookup_by_phandle(np, "rockchip,grf");
-		if (IS_ERR(grf)) {
-			dev_err(&pdev->dev,
+		if (IS_ERR(grf))
+			return dev_err_probe(&pdev->dev, PTR_ERR(grf),
 				"rockchip_spdif missing 'rockchip,grf'\n");
-			return PTR_ERR(grf);
-		}
 
 		/* Select the 8 channel SPDIF solution on RK3288 as
 		 * the 2 channel one does not appear to work
@@ -334,16 +332,12 @@ static int rk_spdif_probe(struct platform_device *pdev)
 	ret = devm_snd_soc_register_component(&pdev->dev,
 					      &rk_spdif_component,
 					      &rk_spdif_dai, 1);
-	if (ret) {
-		dev_err(&pdev->dev, "Could not register DAI\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Could not register DAI\n");
 
 	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
-	if (ret) {
-		dev_err(&pdev->dev, "Could not register PCM\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Could not register PCM\n");
 
 	return 0;
 }

-- 
2.51.0

