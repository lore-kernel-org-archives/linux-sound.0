Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1002A3D3CFD
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 06:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782454530; cv=none; b=Bm4QUsXWMsQuMT4aGXLF+7y9wZEbv0jJ9NUvIgDeDuCNu8wyc3lEgZL1A8yf8Uxv+FUoSFjLhZHeJ3yl24h5bn7XeQaDPeNDp3afqfMIHCnDx/KqPNKqVR2SH94h4GTBYvL4uA1buinuM7nxAC8oTC2szOTFZanQ5lbQF22rJ4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782454530; c=relaxed/simple;
	bh=hFFYBp0rH2f/68QxLOjHm14ykzjK1pnK1FIOxrkKo3g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fF53py3W+9Itx+UlKeJy70UZxpC6foGbMCq67+cpy8gdXe346jdpTZ6dQCFQb3zFIb6M5Sl7bdzT3cEhFNovseHzUE+nRvJ+28rze5X8vBFJGoBnb9qJoXBVie6yT/o2vCYRWlxUs8ROZHP4XWE/mKoNl2dhlt+iYc8LVGXUKrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l7ytoqz6; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l7ytoqz6"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-37ce68a54f8so401525a91.0
        for <linux-sound@vger.kernel.org>; Thu, 25 Jun 2026 23:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782454528; x=1783059328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PG6vKQGWAHofKUNrPpKKi9BQXDIPvZJy9kMaVHXivck=;
        b=l7ytoqz6EhyLINzPm31N/CAELHZIqXOkQHIsTUc+cc+obBID/B02O/s0hYMOmG1mEt
         /tu/sgqXA4asZUVaY42BBjgKDwHC3YmroYfN7x8d28f4rgPNU2RLQdWlUULw9MkdWBCS
         BJco8xKsk2Maq3LnWpzN4HN1hmiKDYtnYTwfkCteokOe8Q10qO2pp8zRgq4L1u35K2I6
         sbD1F+RYkXotm1FDEPK99WohW5fiRvoDxukKx9s2DG9qY43EjZQGRhKdtZVzmVRt49ml
         mfY/nVkkwaNUymzUaKTBSqZDhJQgIJi7ryU5QM28RqzlcWQcspGExh5cWOOi1p7YThut
         isEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782454528; x=1783059328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PG6vKQGWAHofKUNrPpKKi9BQXDIPvZJy9kMaVHXivck=;
        b=IDjBdSee/YlkKIeccPfqTNGV9J4qKASyzDnylMjIENgZ6oi43Wvhc5jECUFjUybPlC
         wbFxp3Phzy2A6ZcpybpnbTCtoSZOgxFrT0SncQcW2tve2NqFMqN6HZ+VU4B0qEVTrcDM
         zM8TNafyr15YcvG3Aj2hUpTXQncCZDQx6GCjvzUz+2pfa1dmb0w5B0LQknu4x/BDNZEG
         xBuZsgu8i4rKAIm3WqxuMwvVU3zNIzBjVuDaWS9Zv0x+tQ23Jghw3aE/Q6gmxIflQjym
         SIPrkSnRHrUAOCl50KHntiulcRsiVz9se4Dh10F1blVgafcIQAviP6uifYEcdsm9obMY
         +IyA==
X-Forwarded-Encrypted: i=1; AHgh+Rqhuc9+XveI6ji3T4IyIlim0XNjCOUFo8yxbJizgjupNIfZZu74rWLTEHHtkPjb8HQ5tf35cOi7ZdnB0A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1e5Gf3UpkDNBHILUAx9aE5NtP8B0wjrufyxaXPxLf30oPIIrG
	PGFVNsFLc4fLk7zpdHNX2TmJXxbDHtLg/tMbwhUQXp9gx7BgXGZv37zj
X-Gm-Gg: AfdE7cn5osOJS9IaDEoI5CLh/6d/UWgG4t7oVBAF0RhBOLBLCakIM7Y/1ttOu1ikCEA
	IrUDrpOrAjDDnEq5qw11/HzOMTKmaelZhhUort5JxTtu7jhrIHSZRNxQ9GtzsO86BXy+NyTkYoQ
	WoLNxxubYbxhaXHL2YMrY6cNWO2KM7oZZ3cA4TqxT8MqPiJwcj7NiNAUwlSwQggVU8EF3af20KQ
	QolpenuL+zbhAsils99GvJ+zH9RFY/xJpDqioXBYBIWyO2BPnSYcHfcLTF1LUy2W0Lei/oK8+eN
	fUtfN+nZdPYefj9eFbaV8rS5XeKr1cpAauI8xYfG1KTfOKjFU1a7Ne40GTNtyWBfwjyZmxiBlZc
	X1AKiCSEvQmR/ZvBN1WAZPtR7YOR1nJQAkA3uQ6E+cZZ/Eclpy3bVZCsjxdFZZVdmbNwRWXuLSU
	VRdKGStRwLsMlXCYesQ7YhYhSKS+xqNLGsMjkMiTRSy5IwpNo=
X-Received: by 2002:a17:90b:518d:b0:37e:1c8f:3dff with SMTP id 98e67ed59e1d1-37e1c8f3ea2mr302131a91.11.1782454528393;
        Thu, 25 Jun 2026 23:15:28 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37e12da6ec4sm302051a91.2.2026.06.25.23.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:15:28 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 12/24] ASoC: codecs: cs-amp-lib: Use guard() for mutex locks
Date: Fri, 26 Jun 2026 13:13:17 +0700
Message-ID: <20260626061329.23264-13-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260626061329.23264-1-phucduc.bui@gmail.com>
References: <20260626061329.23264-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/cs-amp-lib.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/cs-amp-lib.c b/sound/soc/codecs/cs-amp-lib.c
index 371e99205b58..41a9a5b005c6 100644
--- a/sound/soc/codecs/cs-amp-lib.c
+++ b/sound/soc/codecs/cs-amp-lib.c
@@ -7,6 +7,7 @@
 
 #include <asm/byteorder.h>
 #include <kunit/static_stub.h>
+#include <linux/cleanup.h>
 #include <linux/debugfs.h>
 #include <linux/dev_printk.h>
 #include <linux/efi.h>
@@ -83,10 +84,12 @@ static int cs_amp_write_cal_coeff(struct cs_dsp *dsp,
 	KUNIT_STATIC_STUB_REDIRECT(cs_amp_write_cal_coeff, dsp, controls, ctl_name, val);
 
 	if (IS_REACHABLE(CONFIG_FW_CS_DSP)) {
-		mutex_lock(&dsp->pwr_lock);
-		cs_ctl = cs_dsp_get_ctl(dsp, ctl_name, controls->mem_region, controls->alg_id);
-		ret = cs_dsp_coeff_write_ctrl(cs_ctl, 0, &beval, sizeof(beval));
-		mutex_unlock(&dsp->pwr_lock);
+		scoped_guard(mutex, &dsp->pwr_lock) {
+			cs_ctl = cs_dsp_get_ctl(dsp, ctl_name,
+						controls->mem_region,
+						controls->alg_id);
+			ret = cs_dsp_coeff_write_ctrl(cs_ctl, 0, &beval, sizeof(beval));
+		}
 
 		if (ret < 0) {
 			dev_err(dsp->dev, "Failed to write to '%s': %d\n", ctl_name, ret);
-- 
2.43.0

