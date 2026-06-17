Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C986931E849
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 10:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692701; cv=none; b=bEzV2k05jcbTq5xXfefhxVHlroVDxD3EHoCRlp4qdN2ncr7R2kDQZW2WZ/9ABmPyBaudj/g3LwuILNP2RAFDlJp15NcReHkAXNguEfi+dTAN6+/P3H2ashtUyBD0MWkktokJmTBizROuKt2DPymI/yUCrteH6Et2608Do0nrEAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692701; c=relaxed/simple;
	bh=nSAn+IvomI3poT2XfEpySfMVhSrZidmFTXRdJVEBP6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TE84ngXO2qfCVP0PBdAMLDQakIl1wvLZoux4Vze04YabbbWzgj8Rj8DvPloDIQYy4hx3E3cfsK2AsU7t5GjvwwDaH9X5s9KUUFstVvZRYaqUJu36xzD79obtclXTG2imbo5vjNvXqWV94/a0jr5EaMWyiku2FqYTSnhcQUJJWTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QKEDzbK2; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QKEDzbK2"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-30b6dad2382so6294429eec.0
        for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 03:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692693; x=1782297493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wbx3ojyGvZm0HFvzH2fDjGYEhzXxcDovZmyIxDXeLB0=;
        b=QKEDzbK2m+qSnduJiuc4OO9wPTT3iXovThu7YhE2r7T5ohKbNF5Mt1hiimi2K+9CW4
         bGd8mxyi24dAnFKfxAd4JhTRfpmCgSBcLZ6eTWXg6SgNwSCv75CPTgxiJTzaAxjbr9+Z
         4efORgIZX27YgaIJb43MEJ6o5sN1rjI5yzpokryH+PZEv6QVYTUiYRaHfHJ1bgKhvg7E
         8Z1MRnySkexgps6XLJOZQPXVH4qVeP/NKwND7bqn0fwiICyOKlB8XLwJW2iVFYQ0C6qk
         NvYEf2MezRaZsT5TnXTrK/9QiJqnRC7rhCSsKKy6ePvswy6AqP9C8nvc4QCmiEJxwFXP
         Lnlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692693; x=1782297493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wbx3ojyGvZm0HFvzH2fDjGYEhzXxcDovZmyIxDXeLB0=;
        b=Cy1P3rSvOF0icTI6P2P1431VPMaJ5ifo7MhboEO1D30rwNKtru6Im8m2/u2MCExfJU
         /sYskDx+D/ombID7edqrOSSSQvpmQlWsLCXC2ra+8PSy7DytBc2El3dCO9RMSnQyTBov
         uRbSN7p575uNFPp8AQ+68CEIKhLZUaGzXBFgmNkfAkDvChY4rbWvB+I5sqenMYVSjP5X
         Io64zefbIYDCNg12oqkokziicqXIoNctGXh01+Xxst8O/wOgfyjx6C38cmIAet+psrAQ
         V4Cm9nmh/AN8WnDwKuF8xkzoVBJoqAtwsioJU3t29NAQLP9FSWDCxc6l2Hk9POh7BRrD
         Gtfw==
X-Forwarded-Encrypted: i=1; AFNElJ/7Fp+RU+6qclOoSfnE8tPkuuxtIp32yeAe9tCnFVN9dMwn98VMuc9HnJFp3prIdpqf/vDpL6zUQ7mTXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOkepLk8mbBAVi775JrMxKz7/4t04VJMfm3uEPPdSsOYbXogsq
	x1C2croSTowNrJwE7xRb92QS2WTbqtmzbanU4cvnTZTO39ih2MZ6HL6W
X-Gm-Gg: AfdE7cnKsP4y6ebx3HK01/Z+X5QOwOoQv1XVxnhAW6jVLE4oMSyeFKBpZgZ4w7MqZmc
	UXll+jX3wpDZcJk48imr5nsLAoFTJTAEyrMGIbtwflJkEioqTcZNsJsQ9//fFLBhSvO1Ezq4+F6
	BJT4Zfxd6FoF/KiwQH6jiVdqzz/P7RLeJpfbBAx2uzmcv4FDCaeqz1lv0+5z/bVY743GltcYsew
	95+aim9zgo1lL/2wwPL2t3k1aoZKm+M8Nsv1vI2UTcz6H0io/UBBp+ywX4z7h/QOiB9tWkFaMo+
	I9IqX1sZ3ip2Ej0tl8UYSEq3PSyEGUT7uBK1f/fSC9jwYYyF95+Pzh9EjU1WX+fC2kDBWcAB+hh
	bDkhDUPelS6qpyAu1BXbznFUudJksgWCD+g+iVtqCO2HDk3lmU0epkZDQftgVs7oCFPpWP7daR1
	u4j2bp3D1Cc+B+I49jXKmxEsTvtNDsWBwBogt7v3NCKFjk4GM=
X-Received: by 2002:a05:7301:38a4:b0:304:e7c9:b528 with SMTP id 5a478bee46e88-30bcae4246bmr1408050eec.30.1781692692655;
        Wed, 17 Jun 2026 03:38:12 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:38:12 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 34/78] ASoC: codecs: lpass-macro: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:51 +0700
Message-ID: <20260617103235.449609-35-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/lpass-macro-common.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/lpass-macro-common.c b/sound/soc/codecs/lpass-macro-common.c
index 6e3b8d0897dd..c8c4a98fd765 100644
--- a/sound/soc/codecs/lpass-macro-common.c
+++ b/sound/soc/codecs/lpass-macro-common.c
@@ -71,21 +71,16 @@ EXPORT_SYMBOL_GPL(lpass_macro_pds_exit);
 
 void lpass_macro_set_codec_version(enum lpass_codec_version version)
 {
-	mutex_lock(&lpass_codec_mutex);
+	guard(mutex)(&lpass_codec_mutex);
 	lpass_codec_version = version;
-	mutex_unlock(&lpass_codec_mutex);
 }
 EXPORT_SYMBOL_GPL(lpass_macro_set_codec_version);
 
 enum lpass_codec_version lpass_macro_get_codec_version(void)
 {
-	enum lpass_codec_version ver;
+	guard(mutex)(&lpass_codec_mutex);
 
-	mutex_lock(&lpass_codec_mutex);
-	ver = lpass_codec_version;
-	mutex_unlock(&lpass_codec_mutex);
-
-	return ver;
+	return lpass_codec_version;
 }
 EXPORT_SYMBOL_GPL(lpass_macro_get_codec_version);
 
-- 
2.43.0

