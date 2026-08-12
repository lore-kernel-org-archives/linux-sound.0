Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85403A6B73
	for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 20:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786567842; cv=none; b=t/y1vp6AUS1yBvFklWt9SvCoyeRN7zFVPnXLjsjKnUkTrPUnLAKP1ESm28XrIG0T2I7ODbzv0qD7py8bnMkQhRlmfLv8gGc5FDDAUxgfbi3a5zLs7q0vkXpINWhv72J/vCjTOAWmwQY5TOpaC5+91pFcfon0Z4pnOt2U+eutRY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786567842; c=relaxed/simple;
	bh=ZwCKvBVeKCOwHFezxhEHs3g/mJs9UKkhhIxC1BaFhkU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rOUQT3hmIcb6FtBG0Xc6Raop1JB2Rl+UUdycFVlkgf/IEu2L9adZul8xNqFWs2OSk1aIUEjuvPNp5HF85daFjvkuuMTYo1Ln7vAEp7Xn/o2G2JgZG+YtbtfuXis29kEyZ4j7zYYPqdjejyS7hhcG2fJ2H3zPJtOJwzHj/Cf75uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ZUYMYck9; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ZUYMYck9"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-480001972b8so556976f8f.2
        for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 13:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786567839; x=1787172639; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YtUGituyk2Ddp0UGCePWRfQ0rhz3dgx1B50fS+vGVpw=;
        b=ZUYMYck9Qh4YDFkEJT33+X28NFRV4ioLue7RXfdQdCbVhztSEhiKmV+mY6/99hfEyX
         uIfmK0sgAR4UB2gi0A6gSErj/cC+hZMkLTrCs+J774T8AAbNfvybXpt+QIQNfhvfFqUC
         sFUQUK2opelKhvUO9beGaWbegFwNVKJFsDwkW+CF4IGQ+nDAeuKRIx3+PJafgEe1AAu1
         O+Ms0IQXAQ7A+zg7CzgrL35VZaTe7cP/uammA19fehoPFrYnX+lejCgvakOoD6KH75AW
         VK+EQfkH7T2iE64i7rb5sJusbQbpHVsw2t4pNtV8d08dq74GALLnUz/Axk5J/T0C0z3n
         k0KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786567839; x=1787172639;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YtUGituyk2Ddp0UGCePWRfQ0rhz3dgx1B50fS+vGVpw=;
        b=hhTcarKvXxBxoQHbLe8j7qm6cex0bVHrliB84Q97N/tDiddRWgesMF95eh8UInZWhm
         bt8sSv2IYMNfXwrhVGk4noZsf/7OqUws7Qbc1PiOfuzWY/z3SozAmLjVTgZ7j7R2BAZ6
         jKlK3Q7Bq4XHHR08iCFtKwkE5kAdAfHgTu6pSjD0lT6Ngwg0j+gw5f/1Isjq5BoMTSve
         ADqo3ki7ISP8V+1TPuEEob9SsT61gs12CrI1pyuEa5uwXw4LwMnUE+cp9gZYKGmf/n7t
         DJn8e4i55t+y7Ow+MLsSDsl/OWfH5zNSB0Be1W2jupEQuj8UfVoscawSwuuy202hS3jt
         cYsA==
X-Gm-Message-State: AOJu0Yw7eVBjw/PY69/L4X4QBGTOiQZMF1gFZl9HrFZnvg/ga+DxQ+jE
	seSe/iD4XzEr1p9f8FCPO7f3gSwLC6LvbZxbFLBVohi/y8/0iK105AYoQ2d9wqPCl6s=
X-Gm-Gg: AR+sD13FKe/tYp0EEA6UzTU4eaEy5Mt/HGsWDHNjhyqgZzpqxPo7NxTV3NKv/Ocic9W
	/k/WbLiLZZ9URT72PtZwt5hOSzwX6bSmX+uDGRQ0NhimHoQ9e5mFcJNQP85SbYaU27aRzjrEKa1
	74KOZYmFu9yZVCWbv6bHf6oVazXEFo6jxWsm+5qc23Ijd/tKEUUxWqxpAp3f1tjdElhqMg63RSf
	BI8JrCLfnWdmediOdT9cvHhSCsizIedXTm2coXyCix43z3ivIGA+XFHJU/TLxQgSx74mSYjfdT3
	UJVXes7Sxfn15Zx1DVjK+MMtfNIwPtNRHfByX/qeoSl9+WCkjHb60Kyvfuw0wAEe3LRoOav72cF
	TOCgYYYJWOvIxyzRsydcFhGM1LJn1z9SB3bhiZhQq2Fe7nB9trGryC3Kb65it4Nh6l61n6j6JnJ
	P2XxfZhOBUWY6SBEhr0tyYfjDGNuxaYlHcvekW2sviEgPera6U5pcsYeD6BbE=
X-Received: by 2002:a5d:45c8:0:b0:481:4dcd:aefa with SMTP id ffacd0b85a97d-48159ca6290mr823395f8f.6.1786567838585;
        Wed, 12 Aug 2026 13:50:38 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:282d:879b:d1fe:f977])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4815a5af45fsm376508f8f.18.2026.08.12.13.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 13:50:37 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 12 Aug 2026 22:50:34 +0200
Subject: [PATCH] ASoC: meson: aiu: make aiu_formatter_i2s_drv static
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-aiu-formatter-static-v1-1-67936d57ba05@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAJncfGoC/yXMQQqDQAxA0atI1gZ0LKX0KsVFZoxtClVJMiKId
 +/ULt/i/x2MVdjgXu2gvIrJPBW0dQXpRdOTUYZiCE24Nrc2IEnGcdYPubOiObkkDB0RXVIXhxi
 hpIvyKNu5ffR/W45vTv57wXF8ATuSZ+R4AAAA
X-Change-ID: 20260812-aiu-formatter-static-23aaa4c3bdbb
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Valerio Setti <vsetti@baylibre.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1135; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=ZwCKvBVeKCOwHFezxhEHs3g/mJs9UKkhhIxC1BaFhkU=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqfNybkgNRRQANZqrgMfq5ox95yeE5stSqqgOYM
 tnyCOUWsYuJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCanzcmwAKCRDm/A8cN/La
 hXfiD/9wjY1KHufHKO8MBicjjnToaV+KSrITmuuCi2jyWAI5BqRoa6xPOgAb3b6yv2IiHQigpXu
 RiC6MGC8V7cdLH9Q+HP0lrrxysgBEidXkIPdFOGdDfgt8jI9j4fZOQnHBTJg4OQgF5814giLD/Y
 GIYE4uykk9jwjNXtW1UJiZ6DVzN1WCrjFoVcr5TwC5UvqMn4tGrW2YlgSLcZCCFJcDSNyCdr6of
 WkQWAwDDo0rv9BDHDWmcmtaFk5kkyCmLfu5tJLEtfbh89pDOGwPXESrZP2/CP+eMGizHLiUpydp
 N0WnBN/xsFKn3pSOFADKxnH6qoQMqoCi+nTMtJIkxmTmW8Stsaae+sqva2ivT72hl5Tpt3oiRS1
 Fnq8GVoO125m2M/T1GJ3GBCJmOb+L6HDJVdCtqy6Dx3HKT7aFHh4Bqu5+ZnXNdzu4YD84ORq/tR
 RllY6zDRUHGDx+gH/+9vQPI51dYtWhilSQ2VyuZXRC+qGtU+/URFhVVhqdDsiFRTZZejx7kro3w
 AK+hkfu4Bg9Mm0JIL9cycjTC16dc3b1wtFJYNWMiBKRzFPXjMvzol2JcODG2K+nRccYJ8XMdWyS
 JBoZjnom6I4KEs3tde+B/Z1rymBRL8o25gd8YRGgwfgqTdwtLL5rvpbpaTugYAobONYTbDEQYPr
 WTI9o3lib8LpqDQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

aiu_formatter_i2s_drv is indeed used only in the aiu and it is not meant
to be exported. It should be static.

Cc: Valerio Setti <vsetti@baylibre.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202608080634.hf6aJGPB-lkp@intel.com/
Fixes: 83b83024cdbf ("ASoC: meson: aiu: use aiu-formatter-i2s to format I2S output data")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/aiu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
index 2668646e3597..535fbf7c1639 100644
--- a/sound/soc/meson/aiu.c
+++ b/sound/soc/meson/aiu.c
@@ -182,7 +182,7 @@ static const struct regmap_config aiu_regmap_cfg = {
 	.max_register	= 0x2ac,
 };
 
-const struct gx_formatter_driver aiu_formatter_i2s_drv = {
+static const struct gx_formatter_driver aiu_formatter_i2s_drv = {
 	.regmap_cfg	= &aiu_regmap_cfg,
 	.ops		= &aiu_formatter_i2s_ops,
 };

---
base-commit: 83bf17424a97ab277ead2d98e3500bc632df0c40
change-id: 20260812-aiu-formatter-static-23aaa4c3bdbb

Best regards,
--  
Jerome

