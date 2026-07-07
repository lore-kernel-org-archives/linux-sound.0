Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D466A381AEF
	for <linux-sound@vger.kernel.org>; Tue,  7 Jul 2026 05:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401163; cv=none; b=T9wVkvO31zhjwkOJblCTg3WnoWHTwx9KTok+QLX4yCOmetCHtHCUHKlaFh0jkchlGXUqmpjAlJr+CqRRajYFGc+az6V/V6OAXZG559ACwohvOzbDd7ZmzT/wILmRLE+08ZHZ5eXCDzvDcbOxW3mY6dSmnlLzUC5lboVMUYkbAgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401163; c=relaxed/simple;
	bh=/r6IWp2lq/IqX/xitXazGqvOEQK7A7aRycIG7RzU7kM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h5zhOnZoY5q3u2efRte6B5JkPuBNM9sQ/KsvYtjS6F/cXohHyOozz086R60PHtgAy3YOTavUJ0Nmc/5pIdWZoZ3VOS+h89w0SAdTKMDezboTqAQ28dAJkmQMLemkC0EG7KpO5NN1VBpYnh347iHydWe7KVvu1NkejooqZqC70eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YLHbAW6s; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YLHbAW6s"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-84783bce476so2716015b3a.0
        for <linux-sound@vger.kernel.org>; Mon, 06 Jul 2026 22:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783401161; x=1784005961; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mtl1X3tKc/n7QmmaBl4vTl93wYDxMzIpl5/tn8Gmn8k=;
        b=YLHbAW6s7mmZO4tMk1hUcQaEeuPSFY4Zids9uXXda9j35Y6Wy9PTEH9/kH4Jb4uGDt
         yQ6rfcmtxidOO4lzcgrCEC+lKa8HQLsrHuYpj208xt/Ra4iKp5+1w/oYuhu/+6tAqYul
         hWTRsV95NIxJEG2kK11DhFqpOQVONGVvGWKNIpwN90wsuD93QZW4sh0E5mGFnMfv20CM
         Wrk8y+Y19wleNdnoOm515hVgc69KmjoiHFzXhOrjMb9RVGpjqde3gEtomgMlJ0Q9Knkg
         xvQyHSSTrHK1biFbjp3Kyf+QyW8QBjU2gw1LOGACc62pDrLRYEfiQf2aw6SzaauHZkNv
         gNNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783401161; x=1784005961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mtl1X3tKc/n7QmmaBl4vTl93wYDxMzIpl5/tn8Gmn8k=;
        b=fpuPXNPgyzeum36a80cXm9p/FlGvN0vj4IMm+mQ5Zv/ezYWS+Dbmppwjt9e7YFEnzU
         MhX8oJ8BZVFcs58k34YCYUa8NdUiIroBuPPQLa1JaSSBFvmLWnsTdt0MVPA1ZHc2F1Xi
         OeznLsO4pcLGoBTlcbx6cbSrf3FtgSKnqvR932U8yqWPqutyISEvgzL7xNUH68Wt9qWm
         MjEYYL2G28CiP/9/dCP7RyFAadRoBV47eiTiL82tkYjNaMhDuOsAdBsREvKsv06rJFOv
         A81ci4jxUDOfxT5qitEtLNnCHl+W6s8ZTNIsAWstbIq8wZ0d04w1SEsTuJQkp1TCV7Xj
         srkg==
X-Forwarded-Encrypted: i=1; AHgh+RqxM0FQDYXHcakgvOmFKSLN1Of7EXEJ3t56YG+WJgqsSZaYmQWija1JDBkk2dGI/JffhX1u4fXJjaqToA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsMbD0IY5fpG6gsLcxm0VgCsaxo/o8bOkfPDbTbqoCi5CCxQ1B
	h0kU6bEzm0qhlwUsisjKx8ZO/YpNTysqgicUvfWvGmvgJ1rlBkXmPLLD
X-Gm-Gg: AfdE7ckf81quJ4tlGVdsc6jBberUg7bjaHfvqPYSceok3tEXf+RHHeo619rVcvOQ0rK
	3CuzzmwizQH5cymNFQYjFEVdCwCfG7LTssYxmmAou1FGphCBW6oDU1eFduUpGAbNlDKoC3nv2xw
	SZZDem5FJ2Bgpw2g805S8fPci6s86g2Y4WYN1HlEytTbAhgR8kBnmrD3zFQwuINqwtvDw67P9pJ
	tVUH47FvN8Mr9DVbNFSqynLqjCFutF89CE7T0B9R/i1NeSmnMoLHWe2gQJUEhCzGUbA+dZtqQVZ
	DPVs8pvTiHDs4dStrUC44CNBcWDSNpwD2lLUEzdPSR/Bn0Sagh6fJlaOCupTAvwpyYkalir0Zbb
	dT/Q1OhAJG66gBWGz5XbNQ53BRs/4jMvlWgoJAQnEDYZOkqdnUVBMwDnhacSiKcQxL2g67kh/yW
	eogpw6QQ6RL9vpQhnPBbXO0KiqQzjYjY5zwsGmsdOhXVXrz9I=
X-Received: by 2002:a05:6a00:8d8e:b0:845:c662:2be with SMTP id d2e1a72fcca58-84826ed02f3mr3771280b3a.42.1783401161134;
        Mon, 06 Jul 2026 22:12:41 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4dbdesm4728495b3a.31.2026.07.06.22.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 22:12:40 -0700 (PDT)
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
Subject: [PATCH v3 12/24] ASoC: codecs: cs-amp-lib: Use guard() for mutex locks
Date: Tue,  7 Jul 2026 12:09:54 +0700
Message-ID: <20260707051006.20058-13-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707051006.20058-1-phucduc.bui@gmail.com>
References: <20260707051006.20058-1-phucduc.bui@gmail.com>
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

