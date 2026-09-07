Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A7937B40A
	for <linux-sound@vger.kernel.org>; Mon,  7 Sep 2026 04:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788756826; cv=none; b=kwok3Nwv+tq2/e5Og1sLdwBOurFymXLaw0BSPA9n0UtS2LTg6BFBSpi38hX4oMFa7hpTHetRYi1iug/yOlkzi/WdcxjXpTn2T+jZhfi5ORnESK1QtZ3+f49lYkub09SMznjG21vCpYMJGv2QNRv2nU9kj5wt4xt9a+5aXzPVBWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788756826; c=relaxed/simple;
	bh=3ZDHbcjvXPahuAiUxoNp1koMzr+ZHdLLfaaFqA7LTqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OqL1QjKj8m24d48ctnJ0s5kWHh8BkSvziMyPCIJSG/71eBFEDjMCisxYpOLhnYsKNdLrSfwhE2R1i4zKv4TlKhWhx0nEPpnBdJt4gYT1lSyD/z4O/XbdaFfh0lr+2GQFloommHdQENBKBN3X61j4+Ao65+83ThAEqAX2hTjS36Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bru+WvVJ; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bru+WvVJ"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8541875f596so966315b3a.0
        for <linux-sound@vger.kernel.org>; Sun, 06 Sep 2026 21:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788756823; x=1789361623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nxdTIH+4Wdge5UZJZ86PBV+TjYqDoYHr8IUVyTFJUa0=;
        b=bru+WvVJkWqbBxz9v90+dtQ4IAU3iw+/i5FveGU/WslyfRuFbaEb3GMdpxmeX+SFg+
         JVij0tXTw/U8uqPWAkqpQVnlMTtwEGnnFJkBl0q/uHIzrMdj+fp3IJSL/Cwf6hXdkmZC
         UaUCZjhSGnPXMN0+0q/aIe1rx3ecF1PpfhHUPwbsqSfqP8qTe+MlHkEFIvSQGjNqQmop
         OU4KFcsgsI3tUzvvykXHLwgLZDLgR2JtdWMK67c5RMhaG8mSX453EH+KlIiacvN1f3gV
         XijmmQgUiwAdZ4dcNxas0B7eilpdyaMi9ccUWJ84+bj+sFmdxlgcGbKILNXfadkeW45x
         V2OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788756823; x=1789361623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nxdTIH+4Wdge5UZJZ86PBV+TjYqDoYHr8IUVyTFJUa0=;
        b=MsK6K4v8vSSttt8IvQ2O/RxmcK8RVGGxsJupxLHpuNeB31mNbK/N6J9dB3sHJnPXNL
         KHKaypDH7WRZ+f5GoX/ZbG6Ne7IN4UK06VVju1+pEpXYTaDZXdyv2bZWvJbkHB+oNc6u
         tBwqUuDhc733Cv36NAVMWhsykySRVAPx0Qu9adbrezZrxrI5bCBTs3Fu4Kb5FzxWqRLA
         /LHYDwyS3M+0URY9E2DkJmfPTVLBAZuYmAN5aEtdRL8siBhIpCdIEgoouhbW25T3F5Yt
         YOfYoNq0J2VgE9k92hbhJ1Psy+07J2aBGoFi7yPnjahc26MQ4/+KhGmeYTLfWg1/codN
         gmhA==
X-Forwarded-Encrypted: i=1; AKwUvBxSO9UnrpdmaOncmoF3yqkaFLUBlr+QQJecoKDlZiUWeJHFsa6PfeSZsr4B55rXX+HB/cUKzdrEExsYwQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kxMf0pON0vHjwNtSBvOEw+JpTwrLAkziQRoyBGrIAdiJCj0RpE
	ZO9EKCi03oVmiqtF0+0l39V2qwjxeuBumsUS1pkuSQJQzikeUrC21HAH
X-Gm-Gg: AYBFou21RD07c1mIyyuJHCSjZ9wjasmPlbPehmog1cDTLK8PURAPvkfkj5ZnYBiXtT1
	2g+jT55Ijyc2CuvsyHQMIyyLUYONhHR9K86NmBYuyDfmyNIpPGrhkHGc6UAOGAdpVPrE+JwnjZr
	9x7ep+GZPRkjYrnNu6hRB3FaMGChMULaSJEJ9sUKuJhMWk+FfJLnOsVscTBawXLujOAryCmRpwS
	I6gJoGyKY1JCGdNdCVWJ2+qVHzAC6zDmmnKIzS6o7WobMcsYVbmE7AodYdKA8tf413jAjsR46JC
	tnZctMBa+0REuftEM1rv50GPSPeSIyQB1oR1CMg2+eIxmgrMm7kAnAF1GIm/IBeau+mJiKapWqJ
	gsMGsXOjLV1lBzhRWMR7zcNLz6AoYOIky+RXhh7ECV3Vp8bsirHWkWC1eJIceL7Q4aelxc+NPr3
	xVRNnEm9g89vw2KZmgFPrBavjA8kl4FxLsKX9ZRTrT0wcMJ0t4/kBmgj4hN9m9xZqg1kGmkzP+o
	MoQxWvNJVAKzPMd6UzKI/9u
X-Received: by 2002:a05:6a21:648f:b0:3d1:5c01:e6cc with SMTP id adf61e73a8af0-3da39f7bf83mr30536778637.10.1788756822277;
        Sun, 06 Sep 2026 21:53:42 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm37923958eec.16.2026.09.06.21.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:53:41 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Simon Trimmer <simont@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Lee Jones <lee@kernel.org>
Cc: patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v2 1/3] ASoC: codecs: fix typos in comments
Date: Mon,  7 Sep 2026 10:23:29 +0530
Message-ID: <20260907045331.16932-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907045331.16932-1-hemanth.selam@gmail.com>
References: <20260907045331.16932-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 sound/soc/codecs/wm8962.c  | 4 ++--
 sound/soc/codecs/wm8996.c  | 2 +-
 sound/soc/codecs/wm_hubs.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index 8a9598161b35..af4716051220 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -3430,7 +3430,7 @@ static int wm8962_gpio_request(struct gpio_chip *chip, unsigned offset)
 
 	/* The WM8962 GPIOs aren't linearly numbered.  For simplicity
 	 * we export linear numbers and error out if the unsupported
-	 * ones are requsted.
+	 * ones are requested.
 	 */
 	switch (offset + 1) {
 	case 2:
@@ -3813,7 +3813,7 @@ static int wm8962_i2c_probe(struct i2c_client *i2c)
 	regmap_update_bits(wm8962->regmap, WM8962_EQ1,
 			   WM8962_EQ_SHARED_COEFF, 0);
 
-	/* Don't debouce interrupts so we don't need SYSCLK */
+	/* Don't debounce interrupts so we don't need SYSCLK */
 	regmap_update_bits(wm8962->regmap, WM8962_IRQ_DEBOUNCE,
 			   WM8962_FLL_LOCK_DB | WM8962_PLL3_LOCK_DB |
 			   WM8962_PLL2_LOCK_DB | WM8962_TEMP_SHUT_DB,
diff --git a/sound/soc/codecs/wm8996.c b/sound/soc/codecs/wm8996.c
index dface555f928..e7a20ce39940 100644
--- a/sound/soc/codecs/wm8996.c
+++ b/sound/soc/codecs/wm8996.c
@@ -2106,7 +2106,7 @@ static int wm8996_set_fll(struct snd_soc_component *component, int fll_id, int s
 	if (i2c->irq)
 		timeout *= 10;
 	else
-		/* ensure timeout of atleast 1 jiffies */
+		/* ensure timeout of at least 1 jiffies */
 		timeout = (timeout/2) ? : 1;
 
 	for (retry = 0; retry < 10; retry++) {
diff --git a/sound/soc/codecs/wm_hubs.c b/sound/soc/codecs/wm_hubs.c
index f80dfc488e3c..019940589e51 100644
--- a/sound/soc/codecs/wm_hubs.c
+++ b/sound/soc/codecs/wm_hubs.c
@@ -338,7 +338,7 @@ static int wm8993_put_dc_servo(struct snd_kcontrol *kcontrol,
 	ret = snd_soc_put_volsw(kcontrol, ucontrol);
 
 	/* If we're applying an offset correction then updating the
-	 * callibration would be likely to introduce further offsets. */
+	 * calibration would be likely to introduce further offsets. */
 	if (hubs->dcs_codes_l || hubs->dcs_codes_r || hubs->no_series_update)
 		return ret;
 
