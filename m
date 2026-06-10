Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C983B95FA
	for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 10:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781086844; cv=none; b=q772uSDDzmY8iRUd6icEKhiE5PceAOIhpZBCLmNnrhlvM+UzcRs4IRMGjoBku7sfy2FhcfTrTvMi6/9ich8TCmYXrf2Er+oux/Zo9VCbtSYq+GEQXX9rdjLIZ4vGcM1aO7WRqtpcDct9PINAkvJioo8Zzy2jJJwaUuHWvMr9kms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781086844; c=relaxed/simple;
	bh=k6r2KGx9VPLGPcD+NY3o4A7mZFjO7jK4Y+7LRvu/zoU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RU47HCsVMI7jEPMP+3rZbp0xP+Wqjbk7l/F9DNw963yLBidmM6vVVlOBEn9snUrBufE6Tjif5O+hQxUSN+apKutEDRsh6C4OgaBkUPhJjs9VVcYOZVtJVa+udLgDOk6l4iGrHwx7lbPAsbBJvbJmqpRCYrv/u4104DND6M6akA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BvJtK8uD; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BvJtK8uD"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-36baec934b6so4282852a91.0
        for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 03:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781086843; x=1781691643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qDRxQkDh59yrFta7WYo63tMmQrTE8dc3M19ZI2IlDYU=;
        b=BvJtK8uDorMhhwNj+p2taFv+em2FAaVu/h5NFccQuc+fdTJ1wktYOYxqPYb/94vnQQ
         2wKwRYAyLh7HyuvP4abXZzGd6/B1rNVUR4vKgQEvLpqJeSK1RdZkt/5HypAPxDFeNhae
         J2J7GIhT8vKzpzSiBjCRJVYe19Ufxq+ZDuNbeDxhOLzlnhB+RA6H6Oi68pq0CRowGC2D
         lvxsGye6ArRKuURnG5C0xYAsTqjmuAmG2A0cf/Z0aQSHtILk1bjDwy4Xd9oFiDZSXqlN
         vDWBjMu7Q0FEj5B+UC0xY5mn/2NfInqOisfeeJpzmYZ5D/ZQO4RqbxdlJ+vEnqk7BU5G
         Im+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781086843; x=1781691643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qDRxQkDh59yrFta7WYo63tMmQrTE8dc3M19ZI2IlDYU=;
        b=AEYbMMhFIATbyQm85/aqrYbNTVXuojNhjI5EwJeawWtfGmWM/M5Bs6uD1SvaxZAMjl
         eoX3huHCAPr8oj/zFFrCuGxpR0n2yLsXS8hJa0xyfd9dvNZISxh/7DTTaM77b5AWGz0H
         Ji32x48Ou+gXg9yzPz/MVOf6fPAsy9/jPTYsZaSvc5brTpoaoS5hc61M7tLFQbpiNQ7p
         k+0cdkHCLfiB/YSOGSzWChknIFx1awY8s9KC+eUiMcRVUDIx2fFMhPVNLnCZD7HQ02Wr
         xixedjvw9+SQ1rvOxJjIJCzJU1Y+2ZKpzBzhUDtTTKXJ2Lw5vFNl7xEXtZTX0kGJLCYv
         UPFA==
X-Forwarded-Encrypted: i=1; AFNElJ8ikT/SZTL+hQU07R75N/aa/jig7UyAYCmHAXrIkWQAunrKUqmivpfsWKgj9SDd5TrFBJ/kMNBX+Ya2DA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNJZny1n7mF9YjIBQZaCuIyOmbpyw4g8OuLRi7Tztyxr0rnRut
	N+9eXzI5yWQ5O9w5Sp3pWYxfu5e0myc8sxKX62muaPNM2gj21f9lsAMZ
X-Gm-Gg: Acq92OGLSyTrehcoPRokt/EwSCfGkLhD+D7UzChCYKtR46Yb4CsdeoUuRrm/MjhjaMt
	8zLrHJpNI6t2SH/g9MuzbDQpBO5U0XqeiInL9fJ+wIg95C0lmUu+f7YG6eAdjZYAp5/o3vv9A5Z
	TD2nFteJmYOqHrywvtkZt9PRVkPaic0denuwmQ4ulQ84zsZMlJLgBtLw9FX8JfBB8bc84TZJbS2
	yP1FjpqRr3DaEZEtXQWtu8xciHy7r/DSgacZzwSo1CE5wearAl2JnUsOW+G5pmbUSsSq418Xrra
	xC5T7hYVoH3AUdTdB4Z95zCCztLVP0PDNIifFZNo/HZWStVULpfeVoti0nsUswA+d7qAj1wnkIG
	hm7vNZTmopvpAo37JrSpPxbgoE5fPEX0gT3HNeYq5zdE2Y7jDA+sxismL1w5Hoq62IUvakIaz7T
	FKdlDMCfupvouPcnpd/H+lQ2UHIrDa/harOQ9VdWGkexk+huFpS6d9F9NGIojacvX2m66X
X-Received: by 2002:a17:903:94d:b0:2c0:d94f:50c7 with SMTP id d9443c01a7336-2c1ec508177mr220303605ad.7.1781086842787;
        Wed, 10 Jun 2026 03:20:42 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f96b3fsm250133875ad.29.2026.06.10.03.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 03:20:42 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 01/10] ASoC: mediatek: common: mtk-afe-fe-dai: Use guard() for mutex locks
Date: Wed, 10 Jun 2026 17:20:12 +0700
Message-ID: <20260610102021.83273-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610102021.83273-1-phucduc.bui@gmail.com>
References: <20260610102021.83273-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/common/mtk-afe-fe-dai.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-afe-fe-dai.c b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
index 3809068f5620..2a20fa5dba49 100644
--- a/sound/soc/mediatek/common/mtk-afe-fe-dai.c
+++ b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
@@ -292,28 +292,24 @@ int mtk_dynamic_irq_acquire(struct mtk_base_afe *afe)
 {
 	int i;
 
-	mutex_lock(&afe->irq_alloc_lock);
+	guard(mutex)(&afe->irq_alloc_lock);
 	for (i = 0; i < afe->irqs_size; ++i) {
 		if (afe->irqs[i].irq_occupyed == 0) {
 			afe->irqs[i].irq_occupyed = 1;
-			mutex_unlock(&afe->irq_alloc_lock);
 			return i;
 		}
 	}
-	mutex_unlock(&afe->irq_alloc_lock);
 	return afe->irqs_size;
 }
 EXPORT_SYMBOL_GPL(mtk_dynamic_irq_acquire);
 
 int mtk_dynamic_irq_release(struct mtk_base_afe *afe, int irq_id)
 {
-	mutex_lock(&afe->irq_alloc_lock);
+	guard(mutex)(&afe->irq_alloc_lock);
 	if (irq_id >= 0 && irq_id < afe->irqs_size) {
 		afe->irqs[irq_id].irq_occupyed = 0;
-		mutex_unlock(&afe->irq_alloc_lock);
 		return 0;
 	}
-	mutex_unlock(&afe->irq_alloc_lock);
 	return -EINVAL;
 }
 EXPORT_SYMBOL_GPL(mtk_dynamic_irq_release);
-- 
2.43.0

