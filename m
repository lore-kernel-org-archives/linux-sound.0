Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793012344;
	b=L6QYc2t3oiuSm2CNnuJsv+QJNlAlgVdb17aSmxQV1ZzCOLlwH+hDPph9PyLwrUm/xaG6
	 uyevw99n/GXl3uL7AE8ba2Bntmvk4iFoNIaZ+CjSZd71TkcoJtAIz1CpQOVb2nsuA+Kw9
	 Qbegv9QzDCY3n/ooaLQIb7Z2FDvBAhMt2YkKMLWb8i5Rrm/2/b/P6PVXFs2SADipTMx5v
	 Gy/nWDr9KTTIIftO+MCvfxa3NyRlfMAW6sk5I50y1ZXBya16gRArSZ2TU8WYiZfSNcThZ
	 hrI3NRM617niaHu+6HAQax+EvA2aoCXD0Mw6uOrRc2McP1+vUPq+Q4krAUIsiJRu9cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793012344;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Xl+Yg/UNKEqVV/uF8sRZx4ShFAFRNq2WVWeIxaupX3g=;
	b=fDSkLRKjdxNMg37OUm4JgersWGuh9NOQz/iG2KYxqZs1jCP12oc42TT1JKN/IymnWHKB
	 MrGtTi9wzFM/L8B6xsSpqmRvhxZw3W5RhHtZWX0NxmhWVkFlRhjT9oF5rvuO3fv4It+wy
	 yZFSaQ3k8hwUufLxUiD8hWaBGm7M1BkphVyOfU3QiGBe0DIRB7UAzX/2RbXWeDl+WxBEx
	 yxsfJ/WBZOPXprU5ls2r+8n8VKm1xY4YIQMyX0QBE1IsVip68kwqb18Wq2p93xgXKZ/4p
	 ojHxB/A+KfbW/CH6NK0+zhiSqiScKX+W1uAtAozeZ2vz3r7y+ZfMyzBWwBgiGACVcnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iv8UIpwU;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353FB606A32C
	for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 10:59:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 353FB606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iv8UIpwU
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ab60ff4273so2293789a91.0
        for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 03:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793012343; x=1793617143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xl+Yg/UNKEqVV/uF8sRZx4ShFAFRNq2WVWeIxaupX3g=;
        b=iv8UIpwUi9eXzRMigy0++OyradCQuvf2ODH3+WNz/MkR/z8PrJVR6C876X3GLcM4GG
         CuKWi5FaS2ckUWNyDdNM1gKbw7tdzqnuupsQSULIAwMcdn5ukzFtGgO37qrGNfUBiXS1
         zo8IovRU8eM7NJQK0ie+OE9fqGf5hwwGeSuK2VvneDSgRVBfwIrzPWFMm5QUlmljd+rY
         shGTEimeMltqLNK7qa6VdheRSXo+io9cCd01QTI3iq9q4bLLK5NLzZtfJzHUcz2YsJSk
         iyO0BNRq/F2h/wOfTRrkaWguohn4T4vNhO5eYDY6T1IkC/rCmzAVFRNsbJlXBIhqLjsY
         Kx1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793012343; x=1793617143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xl+Yg/UNKEqVV/uF8sRZx4ShFAFRNq2WVWeIxaupX3g=;
        b=sv4aEcOH0ZMYWAU6PRcqPeKKVW8xxryfe09jjyvLkAe4zjUCUXZC9g0/SoeEqF7a83
         aPomA4JYVvsP06begXBqOat3YR6B8yddct2xy2P7X89eGKfvJgyeAKVrnn8XYpZhf3BN
         UHmgYQUlsdPntZJIHo0GDHVzebLiVwWigB+X0GnYbqMafD11oW8dBZZgIti0/lFALukz
         3KNs0czLxNv/8JLaeFoQPDqEON+pEJhOjlHUeqaC5hMe6ylEPYWr8K/CzsT131A7W4M5
         hoSmH4VojUcWBGIzM/v+itgWFLfZX/GvjCbVkjMsMMrtFkEqCbbRaAVXLsOvFBz+b3IM
         4lgQ==
X-Forwarded-Encrypted: i=1; AKwUvBwOQkc1upnmWX91gn+jZlO/nhGW5KPTkWRYIckgZHWvXbs8851wrPDmFCru+oHZWuWN3xZDD+IA54kRVA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLMihXRX7lMPuValatE2TnmsyFCxmAJjVKqIUYke6ZqstvypzQ9
	xuBGlgK0AHrqx5HIaviadkfVz6LichLKMvUdoOWWJea+/oIpa+dtoSbm
X-Gm-Gg: AYBFou39xjM1dNg2Rion84elUXu0XBMztenf+Fufim2vF8hImRp7gEnGgnXh6X+DhN4
	tex65fSjVVmSOfPsgnJp9EVrKdMAKemmNg1cKAGv8nAn1xnLNrFt4911kt1uhyapruKYoelugeL
	6rRkTfA7IzNoPnadOm1RkgU73OcEpg8yyqFVHqE4skjOYuI1zy4USVCK0OL3cI3OisROCJXNOcX
	4n2uZyrDhA59Em2R+2xW8HkL5wTbwSQ2hg6jvJdHiA9+jDbFXgz1eFUTI+LzAwrD+XmXFfXsrCb
	uH7QsdA6g900ToX4tsy8yXcjxFkVVL7WGwwXYw5ZVF3Dhgrx2+PgV/xWq4Xbx38EBHWck31r8Ur
	C8mVSyBZPC3gGRmSHFnToN1r2PktRwRqb5AwK1ZXODIx/ED0XLf38f6D9qHhRoW20XxqBy9SdwK
	QPenBqkf9RPd0xp2QmKPs4pkVG+8pnvmXhuwkHbQUhWdIzVFxbqcOaUNq77i8J7IWfD3B7WiuDY
	wQid/FahE6waN+lS10gDhYIyDexOupy+EP0O8bZQ1WG2dSzIxGNifDVEg0mx5UYsRk7poQy/C3r
	n2ZVDye9iX/8pnsfC4VeOlQQ8Zwx0KgQ5uG2x514/HkqoiYF4McNBspJ88y73+PV+gbTl4U=
X-Received: by 2002:a17:90b:3842:b0:3ac:8527:3fcd with SMTP id 98e67ed59e1d1-3adeae8b8f4mr5611507a91.39.1793012343483;
        Mon, 26 Oct 2026 03:59:03 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebadfa82sm7980768a91.8.2026.10.26.03.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:59:03 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	Russell King <rmk+kernel@armlinux.org.uk>,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 3/5] ASoC: kirkwood: kirkwood-i2s: Check return value of clk_prepare_enable()
Date: Mon, 26 Oct 2026 17:58:33 +0700
Message-ID: <20261026105835.19052-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026105835.19052-1-phucduc.bui@gmail.com>
References: <20261026105835.19052-1-phucduc.bui@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

kirkwood_i2s_dev_probe() ignores the return value of
clk_prepare_enable() when enabling the external clock.

If enabling the clock fails, the driver still selects the external
clock DAI configuration and may later call clk_disable_unprepare()
on a clock that was never successfully enabled, triggering an
unbalanced disable warning.

Check the return value and fail probe if enabling the clock fails.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/kirkwood/kirkwood-i2s.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/kirkwood/kirkwood-i2s.c b/sound/soc/kirkwood/kirkwood-i2s.c
index 29641bd4cc60..395790682355 100644
--- a/sound/soc/kirkwood/kirkwood-i2s.c
+++ b/sound/soc/kirkwood/kirkwood-i2s.c
@@ -701,7 +701,9 @@ static int kirkwood_i2s_dev_probe(struct platform_device *pdev)
 			priv->extclk = ERR_PTR(-EINVAL);
 		} else {
 			dev_info(&pdev->dev, "found external clock\n");
-			clk_prepare_enable(priv->extclk);
+			err = clk_prepare_enable(priv->extclk);
+			if (err < 0)
+				return err;
 			soc_dai = kirkwood_i2s_dai_extclk;
 		}
 	}
-- 
2.43.0

