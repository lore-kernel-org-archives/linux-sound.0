Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCF031AABC;
	Fri, 16 Jan 2026 07:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768549382; cv=none; b=kuGgfEcnmcAIwysACTYb+g2qLyl6rJlmh5ZGi3Iy5jy+ilTW9qi3qqdqAmXR43NeEtYPOUc02Aiw2gpujaD0wL5PlKGNABrj9G9px+FizpsKPQAWe+Mh07xDiqcX0bO56nDsrXwfwaEguaHTVOTVBt9xEtBCGegYT+05OPtRLe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768549382; c=relaxed/simple;
	bh=pOCcgQ6fdvw/LOi7KpxYMwopKefugDTwpWLtyJGHqzA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a6/xGxoxdSHMHWfwJYEHj+zlK4mkHYGB+A1guqHK6ZcpB1nyxaDZk1arGFW43cwJR1W/R7GURSAZNZM7yl0+wmHwdkkMWJF1OcR5UC6Da2Ek0QUtw+SFhoirGGPCJFTtxP8AfDkSThpNyxFQz3mikSNcrj3m6Ickg+Ux3h4GzlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=PFctT9wO; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="PFctT9wO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1768549345;
	bh=clnzf/H1JmwR0ak8FPrl0YMZL+WsDsmHb/QJM015m/E=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=PFctT9wOZw4ZqOmCZpucEUVPTlLPHNN3T/Br7kVwi9bKI0dmVpRfsQoypkKMQG/XT
	 bwNxAuiV78K/ufTzcud11fBQpjqhXRrAKMHj+YygGhewTkNQWeLhLP4oq8EOqxtied
	 rpU1IkMVFRtRtsNENvuWl48Idyu5IScDmI2VtnNw=
X-QQ-mid: zesmtpip4t1768549333t9f98ac5c
X-QQ-Originating-IP: DU9ZYwVUrtfQbkh8Im5uPNO9uZxdnn03eHkqvpXs+GI=
Received: from PECI2107 ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 16 Jan 2026 15:42:05 +0800 (CST)
X-QQ-SSF: 0002000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 11121185886742935995
EX-QQ-RecipientCnt: 21
From: Runrun Liu <liurunrun@uniontech.com>
To: Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhanjun@uniontech.com,
	niecheng1@uniontech.com,
	kernel@uniontech.com,
	Runrun Liu <liurunrun@uniontech.com>,
	Cryolitia PukNgae <cryolitia@uniontech.com>
Subject: [PATCH] treewide: fix misspelling of "minimum" in comments
Date: Fri, 16 Jan 2026 15:42:01 +0800
Message-ID: <8FCE6718C7BBE127+20260116074202.56135-1-liurunrun@uniontech.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NrnJSkE52p6cOYffWNs6Nb5hF6bl90D1/ZvYa8Ega4O+qh/PaGP6P9Qe
	fFzsutiHC/zEAfIKhTOvWuHv100nX5ewV7eJFtt8yfMD0t+1WR/Tc7Arl55+gAm13U+tm0f
	0h3anR/kKjASpsh8gHeeOweVRiX5mlaSJNdM/RQbSZP6/OJ0Ioj7aGGN7L8/0vMRbpKcO6t
	fAoQMEoaaYIbStdm3+ibGXWo0tDh8gu1yEEL6q2q6MAA9HM0Giwa5O9n/yI+JejTjlv1+G2
	/H0vOKYuvUOP8FxHsnquWRoxf0pXONsLiePPv5fc9yDMaXhTHlTdDGvLB6VbqaUQ0YvhdXc
	MXrVeR9x2Qr06e/SWWQZMzoCmOvGyQdmdmutq7kRQfhk2lxeOPXlCp3Q6D0OVhxII1f9Q5a
	jGt/Mcf2XGksw1DSJd1t4BYrCslfTDDYoQgNRsHjZausI/ufnj7qC3yFaWffC9RQYr66G1H
	9V53RHsYEkl8YjP9XyGIX4mZ0x57YfwmFYrEenZV/hsJG7NRYHKxW6sdkBxingfV9lYN953
	DS3JYBeY8xZbPfE6oTZHgSBiGHlOhjdsA/EUEVmBEms3W5PQupbbpfi89srZbw/rCnjE1/c
	Lee+qnG6u/oLGXAQoeCdUA5bBRUnNTq8DsRn5omStQvNVWmE1EYUgucUSIPqotwtt4JHH4+
	GyFTsiYTjL1Tw5Ht4z1yV/IzMmwdPvDXh0WmMvlv/+qWDhBhBdU+NfAEDX4WOf5Mqsk+JPz
	slUXD7CKXaNu6Ggbc/0TWwQLexBLy9cMr1ee5Y4b+69iKdFiyLq1CQT16Xd/4YnwjYZ+NaJ
	h5V7VF8Ltto9xzn98xkuCMQ77yOXu4wNozNkUdasaTHmgxOHoDVzGlWti7RC4ffd6+kQegT
	71LKxVfU0Eq+mrmSedPMQHr6ZpQjTzX/pobu0pB/sT+2sqvukEw7ZZVizkzg4BSS1l0NlU/
	fHkd66SvEECaa4uifPmnWOxjrf+UuqMFO3/wM83OeqzgPpWQs6CBb0JAxLO8NpnwR6kYBF4
	Ge6u3x7M3eIYVZjqPm7C/e2ziIP0x6M4pay5SjRiXP8wSytI69KV56ZwhyVvlDbD7Qs7ZPh
	/boGaxaezMr0wrJ8H685Wb7i+ldj71xDg==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

Fix misspelling of "minimum" in comments across AMD display and Realtek
codec drivers.

This typo is already listed in scripts/spelling.txt by commit
8c3200265787 ("scripts/spelling.txt: add several more common
spelling mistakes").

Suggested-by: Cryolitia PukNgae <cryolitia@uniontech.com>
Signed-off-by: Runrun Liu <liurunrun@uniontech.com>
---
 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c | 2 +-
 sound/soc/codecs/rt5659.c                   | 2 +-
 sound/soc/codecs/rt5665.c                   | 2 +-
 sound/soc/codecs/rt5668.c                   | 2 +-
 sound/soc/codecs/rt5682-i2c.c               | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c b/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
index e4144b244332..5b3584ad5b6b 100644
--- a/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
+++ b/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
@@ -1157,7 +1157,7 @@ static bool setup_dsc_config(
 	if (!is_dsc_possible)
 		goto done;
 
-	/* increase miniumum slice count to meet sink slice width limitations */
+	/* increase minimum slice count to meet sink slice width limitations */
 	min_slices_h = dc_fixpt_ceil(dc_fixpt_max(
 			dc_fixpt_div_int(dc_fixpt_from_int(pic_width), dsc_common_caps.max_slice_width), // sink min
 			dc_fixpt_from_int(min_slices_h))); // source min
diff --git a/sound/soc/codecs/rt5659.c b/sound/soc/codecs/rt5659.c
index f5957470652c..3590ebd41c27 100644
--- a/sound/soc/codecs/rt5659.c
+++ b/sound/soc/codecs/rt5659.c
@@ -4118,7 +4118,7 @@ static int rt5659_i2c_probe(struct i2c_client *i2c)
 	rt5659->gpiod_reset = devm_gpiod_get_optional(&i2c->dev, "reset",
 							GPIOD_OUT_HIGH);
 
-	/* Sleep for 300 ms miniumum */
+	/* Sleep for 300 ms minimum */
 	msleep(300);
 
 	rt5659->regmap = devm_regmap_init_i2c(i2c, &rt5659_regmap);
diff --git a/sound/soc/codecs/rt5665.c b/sound/soc/codecs/rt5665.c
index c7beccd54b16..38fb3a277e26 100644
--- a/sound/soc/codecs/rt5665.c
+++ b/sound/soc/codecs/rt5665.c
@@ -4688,7 +4688,7 @@ static int rt5665_i2c_probe(struct i2c_client *i2c)
 		return PTR_ERR(rt5665->gpiod_ldo1_en);
 	}
 
-	/* Sleep for 300 ms miniumum */
+	/* Sleep for 300 ms minimum */
 	usleep_range(300000, 350000);
 
 	rt5665->regmap = devm_regmap_init_i2c(i2c, &rt5665_regmap);
diff --git a/sound/soc/codecs/rt5668.c b/sound/soc/codecs/rt5668.c
index 5fcdb50d5184..c551696ae11a 100644
--- a/sound/soc/codecs/rt5668.c
+++ b/sound/soc/codecs/rt5668.c
@@ -2458,7 +2458,7 @@ static int rt5668_i2c_probe(struct i2c_client *i2c)
 		return PTR_ERR(rt5668->ldo1_en);
 	}
 
-	/* Sleep for 300 ms miniumum */
+	/* Sleep for 300 ms minimum */
 	usleep_range(300000, 350000);
 
 	regmap_write(rt5668->regmap, RT5668_I2C_MODE, 0x1);
diff --git a/sound/soc/codecs/rt5682-i2c.c b/sound/soc/codecs/rt5682-i2c.c
index bba987308e15..e556a365adc8 100644
--- a/sound/soc/codecs/rt5682-i2c.c
+++ b/sound/soc/codecs/rt5682-i2c.c
@@ -173,7 +173,7 @@ static int rt5682_i2c_probe(struct i2c_client *i2c)
 	if (ret)
 		return ret;
 
-	/* Sleep for 300 ms miniumum */
+	/* Sleep for 300 ms minimum */
 	usleep_range(300000, 350000);
 
 	regmap_write(rt5682->regmap, RT5682_I2C_MODE, 0x1);
-- 
2.51.0

