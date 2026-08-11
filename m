Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115DC279DAF
	for <linux-sound@vger.kernel.org>; Tue, 11 Aug 2026 04:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786422270; cv=none; b=dtiuub06ZZPrhviDknaHKfwVNNVP5Vt/lj3I3c1q7MidhNQ8D12BWN9Xi4XAptLk8G+Grqz/son6tob9czoh1aVqgV/bNPRYvrj+vjQp3gJh++jkaykdsJ+0Anhh2zHqx0oE0WweeU4luJ8xlLt6LCz3H7KYNQTfn4hwMa92CEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786422270; c=relaxed/simple;
	bh=UM9C9uCPSobtK2M6ODdEXvfMaEpdXk+sbLK6N/D9v6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VSU9B3PpLkGI+qDz/IRnMMeKeh2/0+BPP5PWY4GZLx5Eye7lE7HQ28r1FT7Hlb6rMdwoPuGxiekIg4NX2Rmd8HKfJ3ve8uXNqpiEn06YSvxdQE1IOiCZZGzzPQ0s9Yi+nUqKH3n+WMUBH21nYk4x6pkNBWoaraaaVLwodDRKF9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n/iVnFWp; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n/iVnFWp"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7f0167e59a3so1351362a34.0
        for <linux-sound@vger.kernel.org>; Mon, 10 Aug 2026 21:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786422268; x=1787027068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DjeSCh8LZRB+SCMaYU6AxHwq7ze7+snnwffs3yjAKx0=;
        b=n/iVnFWp4215Nl33MwPwHyF17HxQoraQuJ6OsQpM+xXQpD9Gy06ng4jBSZ6mcY8reC
         TlbpDcLnVie+oZZOS/M+n+tFM6eMgfvkXB2pzmr/9W/PiWSgYl3dCNp561EEZRFnCPQ4
         tYIBWHoTE8A58ikhXLAHJiYB8Dh0h/cR1OQBmCyVCVz3InrPnRDlapgxYcx5C3v6r3QV
         v78PTwBYr4Zf1pwTSz/baH5OurpxlEwhEupVM5IDn857D1/PwQQfk32sKcZdI+l30I2R
         uXHvMyV9s1wN2Xi5Gz2qwnssAUTJ1BCBvwE9GI2OWOZ6tPpmTebXnRzOkhfPk7nbI+DD
         qogg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786422268; x=1787027068;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DjeSCh8LZRB+SCMaYU6AxHwq7ze7+snnwffs3yjAKx0=;
        b=hr8D8BO0uTXdCe3D28bO8ftH5zN+l5+L6Tsrt+u15AmUgoOC1ZaNQvUJtERvucnKos
         cGhGpVBeFXhbJubmXSXJ2ePKBNbgNfwD8dyLXCek/8FO3VK41lXsnY40V/pTgDEsmprq
         TCA8LMEjSuC9GAruIluTt3Dbm9g+nlInO11zMq0RYeHrt28mcJpzT7B1FC8Kq9JcNxJz
         pPzo/BbcI2a3cIA5pl3uQ4Lw3Y6V4B3Nn32FZxhRIQTVdmkzDKlVkA9Umrvzp99dR59w
         t4zFzXWFgPgqDLwGbONPlwFCvaCY49Y+kFrjZU2QcfhHe5BGe4siPfZkHL5L9Z/54grT
         berw==
X-Gm-Message-State: AOJu0YwkIOlxazRhSvCH+hDLReznQ2D/L/dmB8f0AiQsK6ZUZi+TcY2C
	8eQK3Re02VV3V5q28Pqcbazz0jxXFp9Bcftaur5RaxZsmUhp6VDe0E9WlUOsjA==
X-Gm-Gg: AR+sD1285zCX/d5t0q+3HpwQ6FtiNwhJA0djAS0bvih3Twyvdm6wOKIaa94U1YUjkrw
	vNAfJ49yRg3TK4AsJYmT9qf4ADXJUYeEwL3HUiPeU9rWoJB0r6SL0srwvUA5Z0q3Egn11Nl4h2p
	rk4SHqXBKZASZQdmTViXj56iTXOJ7F7/38GIHihRqhS6Z3fDbloXp03fSvrdt/kx+BWBpXZoMp7
	2LiMSH57+QGPl0ETYc89AHP+xOEoQfkDIu8iv+H95KredM39+UnYx4GKqyBpgBDwDubuqhs2uOM
	zqE6okGyppj33v+dcMTU0c5s7f4v6isSh8mfJyQtknj1uWWVsYJ+uk0AypNQ0G9MY3zfZky9xPC
	dPgsm8DIJUt/+bclOnwmGVfsXrhGw022QvbGazfZaEHS7i9C516SG7em8BlVB0pnhxdLqC6eiDY
	kLwYWpl/KJBBbGT3KqEXwCSj+qDKVVwz39mHxUQwn1/ixHov6gOcVfCaVIbJT/wcHRueyagG+7r
	x4XM6hd1+KddqVBnHW1BW5cyuBTx7cCSw2QU62OFJ8XVvosEQC2g9UCoqQPXJCe7WV7txW2jYn+
	sQz8A4SU/jKsWe5uJJTzo+edsbmUqt/y5esScw==
X-Received: by 2002:a05:6820:618:b0:6ae:55f6:2cdb with SMTP id 006d021491bc7-6b0a2ff0e72mr140724eaf.1.1786422267869;
        Mon, 10 Aug 2026 21:24:27 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-45e1d99a4efsm371286fac.13.2026.08.10.21.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 21:24:27 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH] ASoC: mediatek: mt8365: use devm_platform_ioremap_resource helpers
Date: Mon, 10 Aug 2026 21:24:24 -0700
Message-ID: <20260811042424.66882-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify the probe function by using devm_platform_ioremap_resource()
for the base address and devm_platform_get_and_ioremap_resource() for
the SRAM, dropping the manual platform_get_resource() calls.

Assisted-by: opencode:deepseek-v4-flash-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 sound/soc/mediatek/mt8365/mt8365-afe-pcm.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
index dcbc5a345382..fc3a457683b8 100644
--- a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
+++ b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
@@ -2121,19 +2121,15 @@ static int mt8365_afe_pcm_dev_probe(struct platform_device *pdev)
 	spin_lock_init(&afe_priv->afe_ctrl_lock);
 	mutex_init(&afe_priv->afe_clk_mutex);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	afe->base_addr = devm_ioremap_resource(&pdev->dev, res);
+	afe->base_addr = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(afe->base_addr))
 		return PTR_ERR(afe->base_addr);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	if (res) {
-		afe_priv->afe_sram_vir_addr =
-			devm_ioremap_resource(&pdev->dev, res);
-		if (!IS_ERR(afe_priv->afe_sram_vir_addr)) {
-			afe_priv->afe_sram_phy_addr = res->start;
-			afe_priv->afe_sram_size = resource_size(res);
-		}
+	afe_priv->afe_sram_vir_addr =
+		devm_platform_get_and_ioremap_resource(pdev, 1, &res);
+	if (!IS_ERR(afe_priv->afe_sram_vir_addr)) {
+		afe_priv->afe_sram_phy_addr = res->start;
+		afe_priv->afe_sram_size = resource_size(res);
 	}
 
 	/* initial audio related clock */
-- 
2.55.0

