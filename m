Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450E182866
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 01:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779414335; cv=none; b=pegxpGfXztYGOWcssy1b7nnAs8sqbBe7TfaLQNCf8ewJER17tyOswMMalaa/T9ZGFgFyK6pLSC/gfWMVd/GPqAXntIz2x7/CYHr9CY2GMU+KPUNcDzWhKVRkwbdKJthsaHBhG6SoihPOpRwGELULs+VbgXwAYei1yuP1rvR2fZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779414335; c=relaxed/simple;
	bh=J9zKFLX7JsxCVLzP0Ri1PMP/WsAOCMjQIGT6IOGOnhY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G63KcxZWKP8u8comGI22yTmBlitKz05+KABq4H6mYUpgqy7RhGMEKwlR0RRy0MPioHMqI6Z41PBJf6jVVlplD+cPiC9BlFTrMur8nge+8AzX/VT9cG4OHEkFvuXkrJf73eKkbmodwccgmLJVN+baigv1NheijOAbzooObAC3fUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EbcVqn3E; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EbcVqn3E"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-82f8b60e485so2868894b3a.0
        for <linux-sound@vger.kernel.org>; Thu, 21 May 2026 18:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779414333; x=1780019133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FeX+2CJlDfJirxfhOoE2pWXNKtVRb5R3kxizay3i3Mo=;
        b=EbcVqn3EOgHtn6bNGFnzMyr5aW5PTH3Ak51wIMJFwkqconLFPLiWBOEv9ac03XoOqa
         AyXIPb9lWvJlMU4biy5DtoxQreTXDKd/pppCTFbv6wsn2PAhDTrsMOSIO83NWj47il6Z
         NL887Tjzvm+OMQGLyU1GOv4bFqrxPYY43PULf6DCBgEeW7pG2TEzuMVkaFe8T+63Uryn
         K62QRBLLKKaHqFWt7wF+dgISyB0nvey/+VDDOMh4vfzERUUpVn2ooy42X9ByX7IpZC4u
         L/w3edKvUafOi5cqQOyoVNGYkX0zq8rapd6EmEQ5rrV9Qjy5/AakVRM85hg24EB2axJw
         lotw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779414333; x=1780019133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FeX+2CJlDfJirxfhOoE2pWXNKtVRb5R3kxizay3i3Mo=;
        b=hE6Yisrh5Jcvl2tiUpHNu3bXWW37VdYIdLIjnN/BpbBYyjdxMid+wHBNHnxZUHgWXC
         uxf6DzRbP6JI8+5mexeyRPd9VAb3dZxSQJ+RG+h6y3YgzWt3BbyST6r57Yr58yN+0XVe
         nyB48Hd8Vx3t1kWZaH0HTmiPGEgtHH4GwuDID70Y/ZyhvqmrxcOvtWHGjAcQsWtP6nq7
         URa0QbT+5qCBVpYqzRrNnTzUWwZ7MDxIYIXBV0y8zugDlsLmwTysUsLTDTfofg4Trze5
         OdrXS/vCueZpQt9gfcoyrRnOsTmHwIHep5YSr8rZSkhJxge92BpMYHsdrnUdTfD4piAm
         MvdA==
X-Gm-Message-State: AOJu0Yy37i+ZS0OhuBcXektYboIP9UhvVa2vyq5aFJvSFFdK5cZwrpda
	T/WaSPYUSOcG9b5ZWq1PhnRoCWKVb5JeST7gp1Gnk06nihaV5XVOi/pgynC1cQnO
X-Gm-Gg: Acq92OFR5U0ENpHC5mYNf9pyAe0nosEKZON/6Iz9+zuDXwN2WM9oFR0DEul5LiGVNKW
	Q5rkrEUY16wV77xJAYen4joxoz/DVDmNr3JPtKQXRlxlIasshcrOesEjLYYrNvoOigaClGvPBxv
	LiV4vpa+BWhMMHyQaeAHCcJdyo2kRScphDrXwqSd+sUvUnQunmbL1gCHkKpkIkmtXiSWYDpZA69
	AifEvFBGlQpP3MD33s8axt0cu0mXTeLUJWIg0yylpeno6eaMds2YEbUUzPnd4rrTsG2J0I9bOj7
	IaKJfuaiNaBqpnJEXdQNJovRu6Rb9FhXYmLQwfvvsaEHRqQr9cg5jCJwL6T52q5dtS1qzaduPb4
	gYWy92gUWgv0BCzS+2x1qOz9dephsYdOqdnh8DgyftTiv3AS35V60w5NfqQDBVccHSM+rgHMLJq
	OB/5DT6pnwCczev8cRAmGg63EGiZHS92rhex4IhsI9Ql0fL3gH9dYNe36FmYKyU8ps4/9XlUIqd
	G2M9yF3l+hCqw2Z3d8EH+NqBxT5+AfIJT+SdkeUb708IQ==
X-Received: by 2002:a05:6a00:18a7:b0:83f:2568:d466 with SMTP id d2e1a72fcca58-8415f30a0demr1558559b3a.31.1779414333473;
        Thu, 21 May 2026 18:45:33 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164aee7f5sm167382b3a.14.2026.05.21.18.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 18:45:32 -0700 (PDT)
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
Subject: [PATCHv2] ASoC: mediatek: mt2701: fix snprintf bounds
Date: Thu, 21 May 2026 18:45:15 -0700
Message-ID: <20260522014515.719973-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For whatever reason, GCC is unable to figure out that i2s_num is a
single digit number, with MT2701_BASE_CLK_NUM being the maximum value it
represents. Add a min() call to help it out and fix W=1 errors regarding
snprintf bounds.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: swap min arguments
 sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c b/sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c
index 5a2bcf027b4f..d217f9320ad2 100644
--- a/sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c
+++ b/sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c
@@ -25,6 +25,7 @@ static const char *const base_clks[] = {
 int mt2701_init_clock(struct mtk_base_afe *afe)
 {
 	struct mt2701_afe_private *afe_priv = afe->platform_priv;
+	int i2s_num;
 	int i;
 
 	for (i = 0; i < MT2701_BASE_CLK_NUM; i++) {
@@ -35,8 +36,9 @@ int mt2701_init_clock(struct mtk_base_afe *afe)
 		}
 	}
 
+	i2s_num = min(afe_priv->soc->i2s_num, MT2701_BASE_CLK_NUM);
 	/* Get I2S related clocks */
-	for (i = 0; i < afe_priv->soc->i2s_num; i++) {
+	for (i = 0; i < i2s_num; i++) {
 		struct mt2701_i2s_path *i2s_path = &afe_priv->i2s_path[i];
 		struct clk *i2s_ck;
 		char name[13];
-- 
2.54.0

