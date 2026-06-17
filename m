Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C5742B738
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 10:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692497; cv=none; b=RsW9YQa6BJPcmr/xxay0flXOyIX2tUbLQkyprz7DU83ZUgmL6fBwQXMvR4woXhLOO5nUHy1I0PKtOh1xCqTSEhKIE8dU2VhKlmWhanMHLIOi3iY9fXJNb5jOa0cIlwsHrqbACQHH+kKnesyyjGQ48DZgk0AuJTXnAtAT2a7t7d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692497; c=relaxed/simple;
	bh=qLQobdW5gIrudjNz6FSShpfXoey+5PZTUBEUnyJC5w0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fkCv0cYpBI455jpcjayHHrGG8w3SohU0ZwUjBtOgesXc6XMDEA3hV+9iny1mTfxZqD5k6r0j/oXa/MCnaUEhg2jlH+XEM2vA2Fu1dsWEKvDubG/AiwZ/QtW8hlLimXQYINzAm67DTE86tQ+o8WfmZOlrQDJO0+6a4ji0nGr62y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AWILweAa; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AWILweAa"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-30b9e755555so4892810eec.1
        for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 03:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692491; x=1782297291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XVnNXvHB/XG4bW8ZUQAyPa266uqezYexJnyTVAcxD/4=;
        b=AWILweAad9iLygKpMy0fsa/ifYN4sTmDpnYlJEPOxU+hTKTSO5/N7wlcbLEyACSu1w
         pkwiZLYRcLKYf7MDe5tA0RweC+g+D18hDwSr8IM7kMEFokz57YUpZkepB5WMhjWwZYn0
         7cT4RjokuQoLAHgYw/kXvicTMhZL3161zbL1s1LJhxix97Ub1b3nDX4fOloDbTkIZuRw
         dTCxJct5VLZgDfbMkdJm1ebXVqE1xXY89pLvdqwXoM5Pfi2eOYKifsZMwbTS9As+1WcQ
         VWpeQgM0Jlbt0pm6aBARutuAdEvAC/ScMaY83j8492oA1a3HGpK3uGCxhraGBqFG9Vss
         N0Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692491; x=1782297291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XVnNXvHB/XG4bW8ZUQAyPa266uqezYexJnyTVAcxD/4=;
        b=aeuJHXuV+qzmaZVjnDcqYdAkYYlEe+tUkxgmJ1SgNHXVH8AOwEMcyIhCD8oqGssdS6
         C4C9JMniX1Mte4cRfDUPXWluC4aTjooXlh+FGd2BzYocicV7Tk8tobA9fWxgfOyJlYHs
         INmKL19ZaeVPRj9zkZ8kea5d+wb0uQ8cCL1PWwYbimWWkReJg4u+caOgcZBMxOv7wJWv
         ddI6igGjLcXYNUFegPBUXiTS5fd2jFuQ6KpzZB0Q05cv+apTAjmSPZOp1//FB4IXuWrM
         QICKFZ6XL+liNtxqy4r/JgFU+zUdD4twqkQzHGsjtnVMEN5a9mCVU58P4SWokYPEL0Kc
         Xu6Q==
X-Forwarded-Encrypted: i=1; AFNElJ9dfEq+7F+kdLeqBTkRj7XhADsMlLIMY8vveOwcjILRoCz4nZRzlqdbA8umb3z+O/F0XbesylbdXD3XSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNg8iEZCr6wUieoYXIKLZ88so5OJCu3LX7rZUSKvcq46d1FudO
	ooqFN7crNZFtRD1SGNAtTjT9smwOdZK3KTVFQ3wLAayku1nu/4Wp6//r
X-Gm-Gg: AfdE7ckTuRnFjpUXqw3ZQnQdWqVIVRlIUKK9iS94daNf5JJDKPFLCCUNe6/VLzXX5In
	9JUJgrki8cDVwHRsPbDWDpUmw7yiALUR8GuRRKgCkmksE+70HJwWT73o7YdN85B9yJEGS3SDAuL
	fky6ImjrsWlb1DSs26X69Ap6vZCTifiaAs7wzSwtMZ667H25MbLxt9gRbX1vh0XEZpzHXX1jB1W
	2kS3pOTr10oD5VcFnfrK51AIfnYFCMaFVIw91pEAs3A29oJsLdVeh2BkLI4/yW2UHap0YH2ScWz
	DMB0/nTJfqmF7Cq2OIRD/+zbyOKTTKRwEjizPS03TnoaEuQNifQa9RBLxrtqdX06VKrj8TtkSLP
	4Rr2I/mAqwkzwqXqBq5+7NA4ukApsMhTqNKivX8ZwryJpvIBgAQg3E8kHbSEPcczvZOXqI9hbPr
	BhB8e6K+FQwDEW+PTTWFyh8G1bVWM2nPSknsO6//9OwCu2mso=
X-Received: by 2002:a05:7300:230a:b0:2ed:e15:c926 with SMTP id 5a478bee46e88-30bca0e33bfmr2065004eec.34.1781692490637;
        Wed, 17 Jun 2026 03:34:50 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:34:50 -0700 (PDT)
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
Subject: [PATCH 12/78] ASoC: codecs: cs-amp-lib: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:29 +0700
Message-ID: <20260617103235.449609-13-phucduc.bui@gmail.com>
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
 sound/soc/codecs/cs-amp-lib.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/cs-amp-lib.c b/sound/soc/codecs/cs-amp-lib.c
index 371e99205b58..36da474f4370 100644
--- a/sound/soc/codecs/cs-amp-lib.c
+++ b/sound/soc/codecs/cs-amp-lib.c
@@ -83,10 +83,12 @@ static int cs_amp_write_cal_coeff(struct cs_dsp *dsp,
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

