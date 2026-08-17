Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472F730EF68
	for <linux-sound@vger.kernel.org>; Mon, 17 Aug 2026 11:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786966392; cv=none; b=M62EzEKvkW6fBIUM4Thh85hq6STJ/BkFjBIWw9D1UUcY83jpt1Cx/7GPGnqXqOg7GJeywl5kNHHTozTB3FY4UfoETbw3jGyjQk7OsQVq3segTx5OgM2UQlCFRt0Di/3XDrJd/AzEtgTR7qVumZSorY9X2/MCeDJwji5nCFTp2KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786966392; c=relaxed/simple;
	bh=Ct1RUPqtEVRR8ESfFzPtk/YWbyQvlIbreWYYAe/pGHc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mSvw6uDrZhSk86mNS1izJD6sY0Lj08SNF3M5I//lh1QRBgAnFwBtw88rGoGyI8d70wJKn5h5AZrLAPShuaHfbzI2d3yEdr9H3sNgbVo8jtOKDRwOR87oto46peJXqy43GjbsW7sx+fDKxlAS15jtP2JjOVG/rNem0lkD5LbcQfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=smap96ms; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="smap96ms"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3811f512167so4604832a91.3
        for <linux-sound@vger.kernel.org>; Mon, 17 Aug 2026 04:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786966391; x=1787571191; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wSS0SfwEXWK8UDGH0T0SV6yCqHjHKlU1qZXbtoO+aOs=;
        b=smap96ms0HAfLMGkBLKDN7q24rUpa/St3sA649W8ACpkAUa27gNOUjB0nRzQbhAxOn
         4sUGfqZfQBkFUw8YbIsMBl3HBM79AdQEyf/d6MVGJr/bczo9zVQOmlM6/vt37CEJTlfw
         n/pnbqxKPvJSGtkqEhqxIjkDukPGi0zj2yAz1ZJ+Tqd2eZzegosRX6J5Bz9agrKkL+gR
         VMRqR3Qf5D56cWVVLodg8HrkTowlrjS+BkR5WrH8H0TxApiujywwbu38ObGkgbWYjd/j
         9dpU7bVLNYvUOudOpwNPNN8AzjBRJsnlWisnBhV5QZzPQcxrkvsxkXdVoC5CbHh7PJ7U
         HZ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786966391; x=1787571191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wSS0SfwEXWK8UDGH0T0SV6yCqHjHKlU1qZXbtoO+aOs=;
        b=oj1H6mjxEL6f3Ojl9Zvw0WlX/Lm0UcoKfFbQQrPXTydPHzzfP9EFO20qTKiYWY3joQ
         CRttSalZoJvmNxTO4xltM+4YS6l9pH0q/pQHNKeCfcapWo97yQ9100QfHwqTEe4fL6/o
         vtrWBGL/ip9EjcqPFs1wabNOU9rt97DuUTrkIKt2YdpLhVGpnGD45SeesdOc9iERNC7B
         BopKK9ngBmOOeBmteKonvN3Y3jcHr/zkAWzioPkYCRXZn8yC/sYxPScTjnjydDx/hQPd
         hwtiMW+Cw6IvZJxA5iJNI9qM3w0hb+TyPH4MyUpYLqnnIRBlum+JNvE/gTRJOU4misd2
         lQ7g==
X-Forwarded-Encrypted: i=1; AHgh+RoZ0bly3wNRB5881vv7xtYokml2TeA7vJ+LWbbuR6Y0c7//Z9ge4PNSDwc0OLlyyIXbX6X49/8MvrzEAA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiFKjWvfEvcDz6HaypcgnzpfbFXtUg1cnP84UyJql8Q4TuP69S
	mR8WrZZ9cAisJCzwbxE3sCBhROHSmibCQhD6iMhuaQ7M431CtHL18Y5w
X-Gm-Gg: AR+sD12GUm/cEAaTeCGG7xN5AX08A7yVQvI+8aBfSX2qZCpP0m+WONp4C8F8wfwwjeq
	tFiBs/bcZ2HKHcGrZBrt4pe1617epbCPWF7q+7iFvkqCmZEHhQ6uSAy/512fXdMegYuOf0/6Tgb
	Gr7zXXu0X79pn6OHC9rAw3WKkXp7s/fPZK6no0JjwDY+DsKGvgm5ytcTz1rcIKeW9sADFBpERR6
	h7ugwyH0ROpAl31zoulvR/O2O5xYij9kSIPBDBFUnARRhTb0glyR3HU5z3/Mxg1VHVXcSJV028Z
	DUMq0b7Oyzj0C8ShgZBAecw130gpgwed33PlQPMvikP8TZ7jN4O/+pX1AqJjiR82VOASLHMK9np
	kHOKNZIsIYaz9qWb7lPGcVxVQWgNFumKtIp3C4/7kivfCxVCLapzPFR7Ko4L9fElRZ2l+ljh2FY
	gzNP84OpFTAHco8HvRE4i7rMCnEuQSl5ejyf27VHCeOgX82CA9LjgoAQ+QcGqFIX+xZuqxJk6va
	U6Rbqm0F+bTYApfGpYqJvu2MO5+YND0KTVCDZ2aiMu4x1OdstlsPPsZWBu8U3T4lR5Ao0btl/lG
	55KbktwzRA==
X-Received: by 2002:a17:90b:2891:b0:381:152b:d596 with SMTP id 98e67ed59e1d1-3933b8e1ec2mr25650063a91.11.1786966390655;
        Mon, 17 Aug 2026 04:33:10 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3954d3b3b91sm2071705a91.13.2026.08.17.04.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 04:33:10 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/3] ASoC: mt6797: Use dev_err_probe() for error handling
Date: Mon, 17 Aug 2026 18:32:48 +0700
Message-ID: <20260817113249.69252-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260817113249.69252-1-phucduc.bui@gmail.com>
References: <20260817113249.69252-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Replace dev_err() with dev_err_probe() to prevent log spam when probe
returns -EPROBE_DEFER.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt6797/mt6797-afe-clk.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt6797/mt6797-afe-clk.c b/sound/soc/mediatek/mt6797/mt6797-afe-clk.c
index 0ac04d73b777..2326496f8b27 100644
--- a/sound/soc/mediatek/mt6797/mt6797-afe-clk.c
+++ b/sound/soc/mediatek/mt6797/mt6797-afe-clk.c
@@ -43,12 +43,9 @@ int mt6797_init_clock(struct mtk_base_afe *afe)
 
 	for (i = 0; i < CLK_NUM; i++) {
 		afe_priv->clk[i] = devm_clk_get(afe->dev, aud_clks[i]);
-		if (IS_ERR(afe_priv->clk[i])) {
-			dev_err(afe->dev, "%s(), devm_clk_get %s fail, ret %ld\n",
-				__func__, aud_clks[i],
-				PTR_ERR(afe_priv->clk[i]));
-			return PTR_ERR(afe_priv->clk[i]);
-		}
+		if (IS_ERR(afe_priv->clk[i]))
+			return dev_err_probe(afe->dev, PTR_ERR(afe_priv->clk[i]),
+					     "failed to get clock %s\n", aud_clks[i]);
 	}
 
 	return 0;
-- 
2.43.0

