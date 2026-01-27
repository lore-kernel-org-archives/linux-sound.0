Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4515E2F5472;
	Tue, 27 Jan 2026 16:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769530132; cv=none; b=KpnUNwvgxbe4hvN4l6gDI+dcTk8QIsw+bY/CW7SSMCJ/9sQLMamt0V97XmczICmf/vkWy+jX3JQf29ZOMcj6g9R9PR+VMd9RRsCE74WtD3p7eo//vHXJSuLmrDaxhHE26S3fspmlZ4Kn99GSC80v+jtJQMD4WVA3KZT7Qi6zy+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769530132; c=relaxed/simple;
	bh=Iq2VyvqCDRD+eOJzowyqd7ph1sHZmTOb8jsOzunp67A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MwK7iyMvVWUX3e9baBN2gsDtzUnZSfv/oAfzDvH1KlkW1o6KRynFXkSfqQk0f4u4qeyf7g2naZcDN7sZ7bTd6ehnVhjHmPKOTF3bopER1v2YME+ZZVFohWayvVl/t6i8V2cTX7F4F0DOfhUB+HFj3vGq1hrCG2En1hllc2QQcDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=TiDdEB8Q; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="TiDdEB8Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1769530129;
	bh=Iq2VyvqCDRD+eOJzowyqd7ph1sHZmTOb8jsOzunp67A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TiDdEB8QVq/0sI1aLavwo8vsvkM40TSysHbTG1m+kfYqzT8NpBd9d8evg8jaA6BpG
	 kcsxh0pWjeB1FCe6iU3eeKxPIv5XoKXPZfOcCUYiGtTOHBiTMjXmC359I5A85quBfY
	 Rmq0IopNL+ur+Wj2K5UzqD6eM87lMc/t79sokmNfU5y+Pg0/O0N5DAa8jet3rsHdcf
	 eCZ+ZI3CgyCHdrwAdMfv83Sa8RC7FOcHobs1LSb7hpnU2CWz9gll+JY+vswn5ZBX2T
	 bknpjcZ6nm1fFNA8o4kRZACscrcg1+xtJOefIAFJEPx5MD0FOPCQxqsg6WuzLlbHhX
	 Ql1FrFX2UOmBA==
Received: from jupiter.universe (dyndsl-091-248-210-071.ewe-ip-backbone.de [91.248.210.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7B55F17E13A3;
	Tue, 27 Jan 2026 17:08:49 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 34DAD48004C; Tue, 27 Jan 2026 17:08:49 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 27 Jan 2026 17:08:21 +0100
Subject: [PATCH 01/10] ASoC: rockchip: spdif: Use device_get_match_data()
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-rockchip-spdif-cleanup-and-bsp-sync-v1-1-a7c547072bbb@collabora.com>
References: <20260127-rockchip-spdif-cleanup-and-bsp-sync-v1-0-a7c547072bbb@collabora.com>
In-Reply-To: <20260127-rockchip-spdif-cleanup-and-bsp-sync-v1-0-a7c547072bbb@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Alexey Charkov <alchark@gmail.com>, 
 Sjoerd Simons <sjoerd.simons@collabora.com>, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1245;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=Iq2VyvqCDRD+eOJzowyqd7ph1sHZmTOb8jsOzunp67A=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGl44xCf1j2If8tTNlgV8n7uXSuFYC/p3QxUU
 bybJfh832iXw4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpeOMQAAoJENju1/PI
 O/qaQs0P/2Au25vX/YHqS9vK0Zt6ZaacazF4cuccFVreJ7ip83Ww7yCU3FfRktpaWbxqAUBInFk
 pmZVEgaWzSUsYTV7rR8HtCce2fh3lpm+4X8Bgo325liLJb7vKBzLVbxF0VjksbVzNmIbIN2RYo9
 yskS4nam+Oa3NPixdn8TFgnEjy17GhQVz9Ih7ezL46iXqOrfs63zpJ+9gq5QK2ZF9E1ln0X5k5X
 6YGAL4r9PjL4/FF8dgk0lyqUGDjv+r+gvan+2vpt7mrt6mTd4Xy/YT+L2ZctrvvdGyiw4yAEA3N
 GFHLO6/JHVIhqaT8CcvwDLiA63kD4xh9N8u0Xu9C47R84wijn80lyqXefNmx7l1CtY9QKvlsZZc
 x+UUUhljFQTr5hVI3OUbJCm+B4qAAgqebSjayhWmmAfdpFY/EyWcIR8Gox5u/EXPRXwY6cPD6Tu
 0SvvYQSs59bIi3EstXiVJ/IccQENTHnU/eHJMqoxgzvYEaIjrDGLhiMZpeq4fP+eu1SyBdCGfAh
 cD1Gu7Zi1rKCAsccEw8qEkbioIzqq7AFNgRJWNXdEyxY+zNAS5Ef65B2GiIYIr/Rfc0siuCr3tv
 x0N5V5uIbmP1Rp/i1fwE8rzvtsk0TY38fb8nN/o2L/yigMbXxoGHZhgsHf5nLAzIsbE88yVCfLQ
 lQL1iRbVDL7+gSLHv5Zw3/w==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Use device_get_match_data(), so that the probe routine does not
directly reference the of_match_table. This allows moving the
table at the end of the file where most recent drivers have it.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 sound/soc/rockchip/rockchip_spdif.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_spdif.c b/sound/soc/rockchip/rockchip_spdif.c
index d365168934dc..23f14274a6e0 100644
--- a/sound/soc/rockchip/rockchip_spdif.c
+++ b/sound/soc/rockchip/rockchip_spdif.c
@@ -283,14 +283,14 @@ static const struct regmap_config rk_spdif_regmap_config = {
 static int rk_spdif_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
+	enum rk_spdif_type spdif_type;
 	struct rk_spdif_dev *spdif;
-	const struct of_device_id *match;
 	struct resource *res;
 	void __iomem *regs;
 	int ret;
 
-	match = of_match_node(rk_spdif_match, np);
-	if (match->data == (void *)RK_SPDIF_RK3288) {
+	spdif_type = (uintptr_t) device_get_match_data(&pdev->dev);
+	if (spdif_type == RK_SPDIF_RK3288) {
 		struct regmap *grf;
 
 		grf = syscon_regmap_lookup_by_phandle(np, "rockchip,grf");

-- 
2.51.0

