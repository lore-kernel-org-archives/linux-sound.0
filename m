Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB6924A076
	for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 09:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784192932; cv=none; b=WDqRoD0LkxTkomKQ5XjAX/snjc/lBBtnVURIG7dska/Rlr2km4KgNLFqM6Vr7E67QMM6XaDXcWp6KoNL9bZTispchuCIED+hSYr36dhkUgPLYakC2w+O6fd732XswSTwBgwKdC9D6JIBkaX2dtGvarEFgftMC/MUVev5Qm68MEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784192932; c=relaxed/simple;
	bh=RLI1cm6vDJ/qvHX01qZ5rV7ItrD31X33omgghTgOklQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RgyPnZ6UOfdVtPTGY8VO9bS0iFwcE1BXD7JuXNdk924SJX5GPZwwEUw4kfVWEJ01YgC47pTkLQbLrSsRvtqz4JnKJH4Eohu/7Vn5kZJhVhtqwnsOb3V9i0JnH2YHiB52ZrN8GHHkZQnNUoheS53rPIm4hJM3NAK5sMNCrInKq6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gg3D4hPy; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gg3D4hPy"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-84a4d8fd6ecso3185221b3a.1
        for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 02:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784192930; x=1784797730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W80Qi/i0Jf8/TxgRoeUGM/YWj0mtv1cGhzixKatKYRY=;
        b=Gg3D4hPybJz52Zjf+xdmp4uQwPjkocB0vJLCn7nzf7REkWJQFBoO4v6p0qo0v6HtKD
         8nJfeKJ2Z2UEzfqB3ju2l9IYsMjyuIGSvf8ZlJrqXImUDh5DxEyIndadofe9XVqpZ/L1
         1s1B8qmUH/GCOhuheuFxukYfzU4dC8lQxXNiLdY6mprokTl6A/cS8ZkG02suhU9VFoda
         5/OR2PJgjjm8EwdYuNsDnf8ifpHNUdTVrkt7isauOFjmuGyX0W5H+mm+Wo+K9HRLr8r/
         +PSmTCJtFebYbZTzSasEqZI8SXQEm5sn5RucnTmCypnepurA6n3H5rNdw5VjPGDwypQv
         xgqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784192930; x=1784797730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W80Qi/i0Jf8/TxgRoeUGM/YWj0mtv1cGhzixKatKYRY=;
        b=V7u48o/pkr/66s06Aos7XyZBlqIA34wdIs242hIAF5c/dZ3tgnIvi+GwKEStyyoujF
         oI9sn7q++wknIDQAFFs11hUtZxkajcrY9J5wsd1aSlnJI5hJA+in1tR7lbIpR/10/bX5
         mP/p94sz+CDTPvDbQ6b8FWajkOwnxEpItxDxl+fQXHBTjFwexp0SFXMEAA3TKRZZVWEO
         z8d8cfTz3qS9cnQ68oCKiTtfNR8liNQQHJ5TPIK8g5LSrUO89gGvCD8Rckb0OHea/zcO
         gkXFHLTqjoH6l9RGpvn3N6IwjAN66LgJKacdj0JzeS/dVy9khLFS87yT93c3xk/XARYP
         oXcQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqy6+MqSNudlBEXlYtuYPIVAcGWvds3eqpNCgo/aKGeput8rD+igKFG9qW7YVyWaiXkVlB2Ouz6qTWRXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEhK1/eoUn/hsDvg+PnjmPhHvurwMwbi0OemfaaeHdcdVVdStR
	dstJX6f7ZbzFgbC+KQkGKhcqUKtClI8IqGRTDiqknSb8Th/a6rQQtrQV
X-Gm-Gg: AfdE7ckiGDNmRaPxHoCuOa7wZB6Cu9iuumlPsKAu6yU2fzK2j9uznc3usGjAyg5WhlP
	KoCmMW9tbY4aB06+DaBw0Am1h8H63Uf/Z+qKjXV20JrkhrmDYLI8h0RseWCIS7mJOOr/qM/dgRl
	Fc8DkEu6dEv3GDGHQZ2x/NVQM0UE2bF9CrxaH5HUjzGTRKOA64CB1uTVXrlMFi3iWWE/CXmfo9U
	OH+Pkf3d3wMEjkSKL6f3B9Sa5nZwvdWUeWLgO5HSaxc7WjfdaXWhoGbqqFeWTTgfz5OsLUtYBAs
	3nIrodKtWM8pMV6yJoHFAXvGCNWwBM4loBH71vcQsoGMxKy714ZFiM5JmnrskSJy82sa+EWzCC9
	HF+FaBZndaoW5uhAQc3kg3ipQB+l3EIxC61SQJWL9oPULCDYm6XwZCBlHVm1uc1LmWaSJIsx6Kp
	zF4h+jyxJbAnrVva6Lq2ZysruzMfpZNRqT9+eh/j9ep995OyY=
X-Received: by 2002:a05:6a00:8c2:b0:848:3e74:85eb with SMTP id d2e1a72fcca58-84a6723f511mr6037108b3a.1.1784192929938;
        Thu, 16 Jul 2026 02:08:49 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f6bf5ecsm4511800b3a.29.2026.07.16.02.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 02:08:49 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Sen Wang <sen@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 01/10] ASoC: ti: ams-delta: Use dev_err_probe() for error handling
Date: Thu, 16 Jul 2026 16:08:20 +0700
Message-ID: <20260716090829.72082-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260716090829.72082-1-phucduc.bui@gmail.com>
References: <20260716090829.72082-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Use dev_err_probe() to replace dev_err() followed by returning
the error code. This keeps the error handling concise and
suppresses log messages for deferred probe errors.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Add missing parentheses to `snd_soc_register_card()` (Christophe).

 sound/soc/ti/ams-delta.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/ti/ams-delta.c b/sound/soc/ti/ams-delta.c
index 61252359d5cb..2759b39c4ebe 100644
--- a/sound/soc/ti/ams-delta.c
+++ b/sound/soc/ti/ams-delta.c
@@ -574,9 +574,9 @@ static int ams_delta_probe(struct platform_device *pdev)
 
 	ret = snd_soc_register_card(card);
 	if (ret) {
-		dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n", ret);
 		card->dev = NULL;
-		return ret;
+		return dev_err_probe(&pdev->dev, ret,
+				     "snd_soc_register_card() failed\n");
 	}
 	return 0;
 }
-- 
2.43.0

