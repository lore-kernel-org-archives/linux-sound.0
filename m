Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765FC331A7B
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 04:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785905186; cv=none; b=l68QB+4pcG8Jpghm0K8xwZbUX4fg+6zQ1O409lT8mPE2vu25dJGN8pQl+FodqFMucdNeL8bSgjExKOriiUSlVDJfN7qbDgFvmtxtZ+bsO+lsbxD7jatu1O4/PT9u3IPlnUJOmz7n9kR2OTdBL9Q0623SX6I9cGBma7KN3gpq0h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785905186; c=relaxed/simple;
	bh=qCdOOz664G2wrMq4qg8yXIPqaSSxslpwDWsC/l8CCE4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nNdCGnDsWkdNo3rrUAec3I+kY5Yut1+KejV8IiXf8bsYGH4YTCfCMQC+Z0QFBHYVIM1rB/oNNObNSeIpwSoiVyK6F5wAAjUmu/AOcAUNBsoZ4Ldrlz/KUbOrB0AYeCQ5RvaTwsjiXwUWdGL/kzGYU+rjq/C+XECKSwUd4yZHELw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qQl+C2xu; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qQl+C2xu"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso649135a91.1
        for <linux-sound@vger.kernel.org>; Tue, 04 Aug 2026 21:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785905185; x=1786509985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bE5UiVHPiiftCS1Al49sgBYUPZJgNfnsBnv57EVE2E4=;
        b=qQl+C2xurkIKXyA1SOTZaafFlbUMdV6ZZH8zLbYdST2h4uF5ftgZKGKtcrnevNuVdo
         8VSw5Mz86ik9AmFLE094SUKQpp+s7p/xTx2WNYK9T9dOlqHPcYbQwkvQ4kGpFHcVnqpF
         NAMLKZ9fdoNfRQSP6oE57yQQD7kT/KFz2rl7grcC1gZlybn1PpNYUbmdCa+uhPp0iMUd
         ukmWmwkjcV6lJXVMyJgDGWRQRlRVA5fMOTBvlNLZxc9UGgj+RYSIDH2J26YhKL1oKPKO
         JRmm+64rAkFi7bt4VPeIMWclKxymlyVVRSjwY/4U4EzHPTHTdBPkg5hUuE5Jf0vVXJ01
         u4OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785905185; x=1786509985;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bE5UiVHPiiftCS1Al49sgBYUPZJgNfnsBnv57EVE2E4=;
        b=UJcwQxusg0sgWowvcKVWHiKenzCtdJ5/fFw9nPQcS+sqyaXio6WDDYf4YAmAioMSaT
         SbZ28sO7WTQ15ndDB5uPiVm1RkBFV9I+ZbD967WbU9p6ROvVcaZ5sipdblCr4K4Ovmm2
         ECbPnu/r7Ay2j+kKbRj2L+naLszZwYqKLfwhDXok+dL2QpO1BBB+ccIc6UtkvBmcpnqz
         nXBceZxmjC8+Itz9VcC2CXVegFXsfKcksuVJwSKuSO21sKNR8c34/IG/soz9xSgkf49e
         JGYuNGe8240q7x+omjau8p9G8V3570JKoXc8ksOEriCT+iRUnDHBNpQn2KIypfXdFFbb
         MC/Q==
X-Forwarded-Encrypted: i=1; AHgh+RrrlHL8POp8ZSYK4EKB0sEUvNwQbvJ+reDnDG3yJNk+2fA1ZJbirXDtwu4NaqcgK/GLbKihZvYh8K0Bsg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2IusMZHxyTDyU6HvMF2bKQhN2Mvwxx9aRnpd7KKp6biXyS3UB
	FzDFbyfOUEKZteGr1JHgKngRJmY4ChyvMdS90zefNiqY9V0Jas/M7ytI
X-Gm-Gg: AR+sD1275FjGEyQ2A5Ru/QVyYgGkBBQ1JfcWDNn0Pk5NwEGunfMd5t60fznga46sFzd
	hIyPCho7EQHIQYYe65L94XlfPP7lUQcR/42th8EEWEuYLVjYgJk5uCAWe10IAASwe8yTTdJkCAt
	EEIz5QQBn4ayr2MSuP2BpzwgVwxtf8fdz2GL48nwd81L7rX996T1mfy0Y1oDqh8uaK5dQ4sFJcC
	QksVu0iEBWsYgYg1KydmOnpU5++6Z0lgMTIazrVMBRRq3yTMViI55rmBnAaOAFu7UxVr/+c0a31
	zGcVF2oNOsHQVfPEma/k/600icn+fANqNvDYKe6b0i80wCDFjHbqz3fwLSolMeOpq3KbNi31jWB
	M/nO8pUMs6PAIlcZu5/bTDSrW0QxxvPL1YlOkFvMOKBirSIQyokvpQVXMYAgN5vRc8P+s+/yxZ7
	g5K25jVoVOW/pb56oxns3TJJtaHv/1SmMHMK5Cuqg2c58kaS0LASy6KqhiSDF6VAtbYPDJ6779Y
	GRY5N6Ec3P1FHzOnh836bCjqfhybfia+dIVsXZx/xsAfqIwCm/c17kHAniC1Pw2TAUUaWP4Uqv/
	4QLS
X-Received: by 2002:a17:90b:4d91:b0:36d:b424:4f17 with SMTP id 98e67ed59e1d1-3903c53799cmr3711654a91.1.1785905184818;
        Tue, 04 Aug 2026 21:46:24 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3903d2f97fbsm915871a91.1.2026.08.04.21.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 21:46:23 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Sen Wang <sen@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] ASoC: ti: omap-twl4030: Check for missing card name after parsing
Date: Wed,  5 Aug 2026 11:45:56 +0700
Message-ID: <20260805044556.38183-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Return any error from snd_soc_of_parse_card_name() directly. If the
helper returns successfully but card->name remains unset, report the
missing card name explicitly before returning -ENODEV.

Suggested-by: Andreas Kemnade <andreas@kemnade.info>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/ti/omap-twl4030.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/ti/omap-twl4030.c b/sound/soc/ti/omap-twl4030.c
index 8a3a792a21c6..a3ab52b2b64e 100644
--- a/sound/soc/ti/omap-twl4030.c
+++ b/sound/soc/ti/omap-twl4030.c
@@ -216,7 +216,11 @@ static int omap_twl4030_probe(struct platform_device *pdev)
 	if (priv == NULL)
 		return -ENOMEM;
 
-	if (snd_soc_of_parse_card_name(card, "ti,model")) {
+	ret = snd_soc_of_parse_card_name(card, "ti,model");
+	if (ret)
+		return ret;
+
+	if (!card->name) {
 		dev_err(&pdev->dev, "Card name is not provided\n");
 		return -ENODEV;
 	}
-- 
2.43.0

