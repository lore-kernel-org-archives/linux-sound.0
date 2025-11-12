Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAB633AD8E
	for <linux-sound@vger.kernel.org>; Wed, 12 Nov 2025 15:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762962091; cv=none; b=SA+DJYlGHeyD90TR0AHnUpX7n+obhA0HD9HP+XcsZMG7PxL43jNbdaTIWVJMHUo4x9b8cuBPddCzSChz82FlGo+20Bs3xOLKvHSPQhJ72VxjnXD9r5VnSWvpbs1HtR/d8OSiorV/hXPb8V/68CKNLFPCTGDMHg7H8gtbYJAn1x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762962091; c=relaxed/simple;
	bh=2VDdKEp8F1Kmk4EzLuKTTS/byzcL3Fzd3mUIgAOO9xQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UicsQOjrDB3/clTsxDRsR7K7+tKcu/+iu6xN0dmq9K5HB2SxB2YjdxjVkLozSE5o4CFeyMjuaiXWKVxsMPZlJVXeZ9u09njGQL1o5F9JgcB+3aXPUHxpP0SajM/9skMPFlSeH+zApgPHLP/TzESCKKEe1rRdFw5VxgP9oYpUsjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Omf+Fb1U; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Omf+Fb1U"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b6d402422c2so175427166b.2
        for <linux-sound@vger.kernel.org>; Wed, 12 Nov 2025 07:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762962088; x=1763566888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P2aZ3q8iXsguvzv8869dZeM/b50D/XalAVFAVL82xgI=;
        b=Omf+Fb1UYpnkNc1YTDoNIOjKKnvGTc2JAbiRumwX+l97e8rHW41VdZbmJd25uPggGt
         QFRDV6OMDe8nuKLjB7jnFkuwPU9bmna8fcE6g7mn7hLagRmbRxvq82D0WCtAEUBPWjrV
         ajBw/L2z43lq/hQRWjXwQPgTgLtBjnRuAHVDXJAlSUoLlIOlywe/s1uiAfKpGzDZso2H
         0ykr4KJ2OQobsQFMJZrqHzhj6q26A40SR1dWZS1NtrWC/0HlPBuxc6rK604T/Ws7Nf+8
         457ycK7XsNNK9Ki31LwvuRDcnoezheNcerEjXQ51F3KV963mjivby+0C6/sD8EpyuckT
         Ns9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762962088; x=1763566888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P2aZ3q8iXsguvzv8869dZeM/b50D/XalAVFAVL82xgI=;
        b=VX0DAUXb1BMG4fzFQPj0APK5hAVLmICnd5fDa5cdxoZwijywTF/OLLX3RI1xqhPS1y
         u/u4rzsqXAM2J54Wlb0LDdhG2p2N9TKvyuFrtGfXKQkcoxe06NScDcMm8S6jzjR7YgV5
         y328q8Uw0CXkyR5joMJJLTz7HxHWmKisdxCW8maE2qDz0jqqibYY868vmobueWg+ehhK
         +BY4aXuhxAKqy1U15hg48dqVBT/s1+LcHGsfWLA/HiOSdD54U69+xfL/D990UoNUghhs
         eWVZ4aNgg7aEY8CNZRSbZPkc1efUC/9LXV8nnITdLPXQug8DhFImo/1XJ8GUp4GdYQ0G
         IA7A==
X-Gm-Message-State: AOJu0YyjltDBdsCgamp7rY1p+SS3M4FpfI8bI049GqpmwaOr8hcC87/A
	kFAGOkl9DxCTqse+oP3aJkLLG1vpyL14k5Ixekw5uGXCRq5GxdDRyWQEfp/diw==
X-Gm-Gg: ASbGnctA51qrq/0m2IgCMjuOLWFbtCNIEvezAcTifgu8bSDksGyPfI0BxlxlwLF7UzN
	W1d0i+Mkgo08ApemIv13IfdztqDd29lklwdHsPesIxun7yv6mf0OOxRvtNJEfWLvfpty44cqecY
	2qh5FxEoOdm+Ijcxfj3uvIv82N128jWIQLos/oeCKHqgTmkZnpqHkNnKQYqt4KwGGoPV2dPGVhP
	AvhWNkWLwuOukxVPZsaKi2qFDIM3eVeEjoK8KjC1ZM9gbeRaxr6Kh/OtJfsVHTPwoii2p9ZUAUI
	Yq5X+ugKsi5ZecorjQqGs1lYHumgliM92mZNNhoE3QIVtC/jjm4ifvLQFmWL9BrmmpapKrBBXcx
	P0mYZSUO+SyQooWpkyJSshUwEmY3r6y5R5TKZ8lG4K7OmD+AzaSLgsqD5KkMCR4R99JWsbmKXwR
	ONuYfKISIblKfcjhac4A2mdrkx4RJzvntEC2rrd1CBNwjxTz5pTi2qCDojJBjDVH1vze4RRi/nC
	x+uqQ==
X-Google-Smtp-Source: AGHT+IFugR4FUZvpldRleNYZZnPoxk2FrSRsDVPT6ppUn3fq+PC6KyK9eoozx/2VMx4e/g2GMOwGOQ==
X-Received: by 2002:a17:907:2d0d:b0:b73:21db:5fa4 with SMTP id a640c23a62f3a-b7331aec4a3mr387296866b.62.1762962087982;
        Wed, 12 Nov 2025 07:41:27 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf97d456sm1670023566b.39.2025.11.12.07.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 07:41:27 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 4/7] ASoC: renesas: rz-ssi: Remove trailing comma in the terminator entry
Date: Wed, 12 Nov 2025 15:41:05 +0000
Message-ID: <20251112154115.1048298-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251112154115.1048298-1-biju.das.jz@bp.renesas.com>
References: <20251112154115.1048298-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Remove trailing comma in the terminator entry for OF table. While at it,
add a space between the braces and comment block.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 sound/soc/renesas/rz-ssi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index c7d5576c8283..5dc510cf66e1 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -1248,7 +1248,7 @@ static void rz_ssi_remove(struct platform_device *pdev)
 
 static const struct of_device_id rz_ssi_of_match[] = {
 	{ .compatible = "renesas,rz-ssi", },
-	{/* Sentinel */},
+	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, rz_ssi_of_match);
 
-- 
2.43.0

