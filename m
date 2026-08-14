Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A532942C4EF
	for <linux-sound@vger.kernel.org>; Fri, 14 Aug 2026 09:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786700558; cv=none; b=GsDCStXtuXGEP1h2H6Iq1jQAbLEg/NFjgR7G3sIGWihiEPgU+tCObtzcKvQ2JzjRbi3OFV1wRuT9OwAPBt97KLEmWWwBC1hjBzjFDQTiqITj+dBvRhQcDKSmX8Ge5ORQLpJD7WGnDLlb4LgafWAUEOgocHNt7ylwUJCjOrPqEXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786700558; c=relaxed/simple;
	bh=hKnsHgBKDISlxrVWw5eBxL32q54rkShCZ31p46hd7Oc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ekokk3cui2Lf8HSQYi1PK6k1PzcbWoUE2dJLB0hKWsJVQLB1j5dOQrPm3M3Ot6ZOXnLFPQsUtCDZEpF1avdAJkCwu71GraUWjpP4Tkr2lgC/mfu7N4LsoGinwZlvvsBc9FKMHome7uFZmesMBQnM2rV6jTpKmAP8XNYsMiO2wl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I7Zi80qg; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I7Zi80qg"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ce7d2adef4so14293175ad.3
        for <linux-sound@vger.kernel.org>; Fri, 14 Aug 2026 02:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786700556; x=1787305356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ETFfzivBomCCDCyrbe6+6aUhyVBv4jXv02doewEomfk=;
        b=I7Zi80qgX6VH7GP64fV0oqdRysGAgfdZ0AvkkTMuaP2JIs/fnXgHStGPOXn9v1QXDf
         mzoViq0i/S2zkd5/I0w3HWfKMw1nVj0uo3g39OYFPu3Fu0W8FXzzdBpEeVqfEXWU/Yh6
         f3mW3K0BPKkURGaraPBgs+dxTo3RhclgqbuFYWiuFu1f0vGmX+Bo6OG/UTF1XR0Hqq/p
         rDbmSstbCGTJJZP7csZEu2w5Rn6h0krBuLBsWg+D2CYm/fqRRY32mpvNmGEMo0nraDIZ
         eF+LGjG7Kwa8kcTQNNO0UBtVP6igwY0E7H9cskv76beRwS/PRa+P3tNS/jTknWwr7U3p
         j01g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786700556; x=1787305356;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ETFfzivBomCCDCyrbe6+6aUhyVBv4jXv02doewEomfk=;
        b=i8Ly86xJoW+jcIyflM7J4pWlah9QWYCeb56LTgFwB2IttTs4aM/PTxpdcJO9GVXo0O
         AnmA/l7avtso6Ntr8GsCJDXyApqBxwpX7U8VkVc9DFUENxRdnMrpkXrP5yFi73FUj1g0
         9KBVg998OwTHElhgNwzOXwppTUgCMIm51ODPk4XTOX1ZfiyaOfOMURUncoMlKeVOwsnT
         VsFrQy3s0yvXb3sS/oBRWaLylAwIsmjq6KFs+MUBMHFGShulVzdZZ49MRqn0CoW/T07y
         8UZaqY+6JdEOxnfpXLKWCCiFKEH2Az1NQKzzPJP0h5Xj9jLo9imSo+eCnQEYempi32MG
         FWCg==
X-Forwarded-Encrypted: i=1; AHgh+Rp0W0VK06w8hAt1wU9hlzz69BLB0ko2SHOW7yf6AmShrmF+feFy3/eV70pepGMjr8t+QKit+Qg4cVTIDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyeXS0TZX62BD+dbakTi7W4f3PSfNWq7WC74mKquPQimN/qj2+X
	/2X64JgAs7gBze5sDugJpvnoNXVp5JZWO+vDQ6RuWMl35pFfiEp30udm
X-Gm-Gg: AR+sD13xbx8cSVqnyfUXrP0KWD/qQsNDyYGvvPrzMNQ6pg91CW050xFcf7hV4xCjhZt
	hdPyNmVmzAOCd4RQZ2B/pE4zWLBzVxzc0Diq7io58p7zf1ua7JLAlODtMhk3ug63nr2ex1oOXZP
	BWcUNJjgXD+Fe7WHxVztPPbFw5uC7p4AkkcNFDoznn9hWDCKZ++8ATPmne2UDEruofxookG9I7p
	NxK7cjge8Z6/yeOv5WHe37W5Y/4f1pWxbvSw3d2PJUtkTCUvpThCngrkco15ovtjkZzD/sMp8cl
	2pMvX9MObguGgIG9YHrauUQXUwDOIyeIQJ+GPjp3CJZAxR9O0w1TT6k6DZA0b47iKo8iKO+SjRT
	T80lyosQKDuYcU1Bslh5ZLJA+cSybSq7oGWGTLjZjEnNS8Y4CqOeuDxTTVie1J2dVOzHy3TdQIO
	2pTpXc4hwrQlMSmEGDIZTFmlQRiWsXk6wkdKZnTsU7Z7g5ba5DoEATJLCjgP6fFLKzfu2T3D+p+
	5zmnEhnzO5k+jk7VAu8JMyAxe516/NCO8Tg19aNpkDOcPVGHm4q8Vw8drrwR3lmmjigOwaar/iW
	BFre
X-Received: by 2002:a17:903:1a08:b0:2d3:7887:7e7f with SMTP id d9443c01a7336-2d3b0c5de30mr56550695ad.11.1786700556062;
        Fri, 14 Aug 2026 02:42:36 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3ae7c067asm7446345ad.28.2026.08.14.02.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 02:42:35 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/2] ASoC: meson: aiu: Drop redundant probe error messages
Date: Fri, 14 Aug 2026 16:42:10 +0700
Message-ID: <20260814094211.25151-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The functions called here don't log the error themselves, but the
error is already reported deeper in the call chain, so the dev_err()
calls are redundant and can be removed.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/meson/aiu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
index 2668646e3597..2ba61e2f703a 100644
--- a/sound/soc/meson/aiu.c
+++ b/sound/soc/meson/aiu.c
@@ -242,12 +242,12 @@ static int aiu_clk_get(struct device *dev)
 	ret = aiu_clk_bulk_get(dev, aiu_i2s_ids, ARRAY_SIZE(aiu_i2s_ids),
 			       &aiu->i2s);
 	if (ret)
-		return dev_err_probe(dev, ret, "Can't get the i2s clocks\n");
+		return ret;
 
 	ret = aiu_clk_bulk_get(dev, aiu_spdif_ids, ARRAY_SIZE(aiu_spdif_ids),
 			       &aiu->spdif);
 	if (ret)
-		return dev_err_probe(dev, ret, "Can't get the spdif clocks\n");
+		return ret;
 
 	return ret;
 }
-- 
2.43.0

