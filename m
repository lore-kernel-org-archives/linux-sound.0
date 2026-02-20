Received: from polaris.svanheule.net (polaris.svanheule.net [84.16.241.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E4D345757
	for <linux-sound@vger.kernel.org>; Fri, 20 Feb 2026 15:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.241.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771601791; cv=none; b=GMSC/uVZui88eQPmg+3Jod3+2KojBzaLqWb/MxdlmQGUmf4kk2d8tB5fCJZm+kuN6xJcd2Xp0TVjttJQLzDCPkngDUxMcvx0ir6ApoJJCudZLlImMwT1IiEhkE+dQ3rYSt0OT81BNBSZ7UmWaM8R6HoGa6hhXivwpyRGCKvOZ88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771601791; c=relaxed/simple;
	bh=Xem+9+NYuPqFcysC1ghb2B7deW3QOQr+l7gKtSKQt3M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c22hLgTAfh21D4SmNvjHvUBLXk4gws/Waonw+KWrfU4A7AvO3gyejRecA77g8XjCdk97ZGayHzfwlPOnUCfi5dnk7yOJ+ro+DALLcuyBfRuOKsLmYlL8ff3OpqpW9IljSa/+J+LdSBCok0m8VlhHuzAZchMtPFdxmyyJ16v0HmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net; spf=pass smtp.mailfrom=svanheule.net; dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b=U4EXLbgh; arc=none smtp.client-ip=84.16.241.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svanheule.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b="U4EXLbgh"
Received: from terra.vega.svanheule.net (2a02-1812-162c-8f00-1e2d-b404-3319-eba8.ip6.access.telenet.be [IPv6:2a02:1812:162c:8f00:1e2d:b404:3319:eba8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id 80EF26E864F;
	Fri, 20 Feb 2026 16:26:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1771601204;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c2RuCT8Qm+s9GPN54drWO1to0j5bHvqrgebgVAWgN/M=;
	b=U4EXLbgheo4CARe6zP0SMZ+UU9VKDE0Jj5n16RYmr+cxZor3ACcCy+FORjCFgLStFCUoED
	fLsEy8urMiZ80c0jPx6Wg8lvYBaZApS9SJO9mfaYxwZ78fldPTzC+7KPIJhka49s2U1Zw+
	t6VvPwbVGGM/nxM/zHtv2EeukwrHzBX4cpWR9oUW/fbCRIUdr/u+cGv+QVhTH9knTPPaxx
	0QcpLiXldKzKVjtk/KwcKDf3Ise+xY2WhY9f02aEySZBYd7VFgdwbdWEHaGS3xz6hE07W2
	/Z1PnT6Z8zhXZ32WBFEeN0RKzrNrwPK9JwxX8kYyW2DJN5o/5K8vDYkxG/wK5w==
From: Sander Vanheule <sander@svanheule.net>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sander Vanheule <sander@svanheule.net>
Subject: [PATCH 1/2] ASoC: sti: Return errors from regmap_field_alloc()
Date: Fri, 20 Feb 2026 16:26:33 +0100
Message-ID: <20260220152634.480766-2-sander@svanheule.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260220152634.480766-1-sander@svanheule.net>
References: <20260220152634.480766-1-sander@svanheule.net>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When regmap_field_alloc() fails, it can return an error. Specifically,
it will return PTR_ERR(-ENOMEM) when the allocation returns a NULL
pointer. The code then uses these allocations with a simple NULL check:

    if (player->clk_sel) {
        // May dereference invalid pointer (-ENOMEM)
        err = regmap_field_write(player->clk_sel, ...);
    }

Ensure initialization fails by forwarding the errors from
regmap_field_alloc(), thus avoiding the use of the invalid pointers.

Fixes: 76c2145ded6b ("ASoC: sti: Add CPU DAI driver for playback")
Signed-off-by: Sander Vanheule <sander@svanheule.net>
---
 sound/soc/sti/uniperif_player.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/sti/uniperif_player.c b/sound/soc/sti/uniperif_player.c
index 6d1ce030963c..f1b7e76f97b5 100644
--- a/sound/soc/sti/uniperif_player.c
+++ b/sound/soc/sti/uniperif_player.c
@@ -1029,7 +1029,12 @@ static int uni_player_parse_dt_audio_glue(struct platform_device *pdev,
 	}
 
 	player->clk_sel = regmap_field_alloc(regmap, regfield[0]);
+	if (IS_ERR(player->clk_sel))
+		return PTR_ERR(player->clk_sel);
+
 	player->valid_sel = regmap_field_alloc(regmap, regfield[1]);
+	if (IS_ERR(player->valid_sel))
+		return PTR_ERR(player->valid_sel);
 
 	return 0;
 }
-- 
2.53.0

