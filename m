Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF7C4657D8
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 12:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515127; cv=none; b=HYiwi4ZZ6Jj3L0AKNoh9LPM63rLmU1u1sYulU2w/J/52ccc68nAOTQv43wgc8T5wFkqNAQyCefcjU0O4sxwbVt4bQ56q1IkLk0bqJfglzOV0crMOuUOeRFUO945pr3urmXgUj2qdEP2CKTcWiDOpz7Mjh8o+MMyBISA0z6vJTu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515127; c=relaxed/simple;
	bh=/r6IWp2lq/IqX/xitXazGqvOEQK7A7aRycIG7RzU7kM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y0yjNX7JscWw4PXQGhat9xCd3zAUOotTfCr56YJm6nnzeg5uyi1sSj7VinO/cSMCBj8MBAgn+mkTSRjdFFy0fhmuvaUYJ428AP+m1aEKRY1cxC3e7psa07ca7Ik3EmieOTzlvtIetKQP+AuSl1XATZDHOIEzUUqtJiedx7ZBzZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tA6Dd+Sc; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tA6Dd+Sc"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3810c5d691bso508142a91.1
        for <linux-sound@vger.kernel.org>; Wed, 08 Jul 2026 05:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783515124; x=1784119924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mtl1X3tKc/n7QmmaBl4vTl93wYDxMzIpl5/tn8Gmn8k=;
        b=tA6Dd+Sc3hngs73ytvM0Z/a2tp/FY5KjH8DH/BSqSl8gqCeYhEm0cD7rFOH9GYVt9P
         4ZFhbdQnvFWK9s9FaESEsi+WaznpEUtrajmWbyLOESO6LkV5FiAVynZ5mKtmoFTkfVX3
         LTc2p7NgUz5A8Rh4ZFYDkbpZZc092Vw6CoX2gSK9Na4WB7FRCLvRev19sPUE1lYNRRhq
         Mwri8uNzG9Mb+Jj0npFBidHNdM3MleMoxjyab1jq0mkdxNRvmkLVI0TA1TxDd6JuKZ/g
         iokajRw5Zg/nlpy7sQnqWvWd29ianWnJy7j5Y1k1XOXbuGzIN82ZJf1SHGj30qfvIw2y
         Ty1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515124; x=1784119924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mtl1X3tKc/n7QmmaBl4vTl93wYDxMzIpl5/tn8Gmn8k=;
        b=mKwvaaysMhZpZ07i1hOlRCMxKQF5eZzJWZt3KeDAZxezkUUpgDo7V9DHJ7yqYT6ylx
         tOm3wlA82/yU18jy1qxdWcLNxR2ooAIAhXwuDH6rHQNiJn8p2u6471DOOzofUB1d0fLe
         OmJGAQEFSQf7e9fe2iLeKNHcTc5mX4mmqHKtmdGYWLQhGZIO9h5P1RZOCvqOM3GrOim3
         pOX8GFr6yM0G8v7GqVGeZUcJRJvyZYKflaAMF8uRQ1IcQ2oP2gDXf4sI0CrdUFaLmWxd
         4ozAhmZVnNZN3przAydm+Zs7DMbn5cub4lSeWP+/esSDQdFzspMnzP2NdLSMmdR9iQkf
         4MlQ==
X-Forwarded-Encrypted: i=1; AHgh+RrItLXgs7zbeifjsRT3Q3Rn49PB+4s2rfO376KbKFHHmeSaMB3x6xzQAjtQOLjP93+Cu3q3c/wO1r+yBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyH/QPxCsywLKkNNvDbyU1O/HW7VqX5QNITuJTuhwj39fEk2+5E
	aJI3HvOF7isNnOUPGFlY22guQyGQ8v2MjtPk4h36zcph/O97LT4cw+OX
X-Gm-Gg: AfdE7cmMFKhjztFjMkv8M8rE9WE3Aj92lqDuSb3Y0evuiTrSlAtEEVsJsn74j/jVhbM
	H0EOFJyb5DmUoZMyZiH/n7n6BV7c2f8ix0scWcqtwDHcZBQYfNb9EfXGqBjmwKwVBLtTTnlRfhZ
	lxv+R7TMu4Eamcvt1GsIZx1q247DjEF7cUiVUWU8CGRE5RsosrZHN4PVI8H00DL/Jvdz8/wIB8u
	Qko98Y7M4rc1y4FAfIqxOhq+jwGN0/s3DG1xTSu/kq4vmO9RYGYcVMkIpB321TBWYyzDP08PN26
	jkGxJSg2Yxc6hdupA2oqdvt3Sp1crRlgxafkxDt/RHOYJItB49ws0Ou7mjeHxAFtBTs7AfK0iSc
	FMZ6O46Wi/G8NAaxEBU3d6pxnj2Yr6Qdawk9EB9r8DWQ/lngC+qN6WUJdDKeOpoZWssafWEeB1k
	izCVoH5sEJG4EUR1L1OJxcFFmrtjAXpM8SVDnF/oNPc79qEjb3b4TLUjO46A==
X-Received: by 2002:a17:90b:2705:b0:387:872:7b87 with SMTP id 98e67ed59e1d1-3893fc69416mr2611311a91.13.1783515124243;
        Wed, 08 Jul 2026 05:52:04 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a2f2fsm2784349a91.13.2026.07.08.05.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:52:04 -0700 (PDT)
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
	u.kleine-koenig@baylibre.com,
	kuninori.morimoto.gx@renesas.com,
	christian.ehrhardt@codasip.com,
	Linus Walleij <linusw@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Chris Morgan <macromorgan@hotmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Rosen Penev <rosenp@gmail.com>,
	Weidong Wang <wangweidong.a@awinic.com>,
	Teguh Sobirin <teguh@sobir.in>,
	Val Packett <val@packett.cool>,
	Luca Weiss <luca.weiss@fairphone.com>,
	wangdicheng <wangdicheng@kylinos.cn>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 12/24] ASoC: codecs: cs-amp-lib: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 19:49:49 +0700
Message-ID: <20260708125002.202515-13-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708125002.202515-1-phucduc.bui@gmail.com>
References: <20260708125002.202515-1-phucduc.bui@gmail.com>
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

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
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

