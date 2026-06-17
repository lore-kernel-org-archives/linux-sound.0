Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A2E3FB046
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 10:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692438; cv=none; b=GOomhOA+6y/8Awk747+z7VzavQdx3XErpGht+4xYs0oGw+RdMe31pWUhrYIHKPa0VMKyyYreNDPingnS2QREg3CSeq20uXHUH1gEmQ/Dvqe3oPrwHuR0mGIa4gk26nJxr9gr2hGdtsfZKJUM4q5M5gbYAOrXZ+FA0wnx1CC4ajk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692438; c=relaxed/simple;
	bh=S7IkiFODoPFXZtj5+rPYNsWBbtzbNnr/sTl4Y+gY4xY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gU9z7jqh+u95XR5ok+8M7mojjmH5rfNomEP4/vJBEVh3Bqt8BspTuvZzRTvViZ3L+PVz285Fu0ZbFs4BHQrusqsUW6AXlsFex4hYFl9IPlYYdgmZtYN70HafzY2RsoJ1mDbr8VpyzbkG+J6IzwzsQ6gEzTzzlFa3zjdKTju3Zss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DYKoZ2QB; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DYKoZ2QB"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-304d8362a58so600309eec.1
        for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 03:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692436; x=1782297236; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uLJVi2lQkwcQJakc7pftwG/u0GTIiX/FfTuiAYCAfco=;
        b=DYKoZ2QBar2tzj/lm/oRsksPdOMxMwV3/auHTB4uk6Ttv/cMqXBbC5febKg+pfwKBa
         OSwejhGh4ileBTSgVRh+5GtfOzyoL2HEhPiKGKjTCRxynjWVnWUzk31M6UDTj2cznl7S
         b5gWNuPbOWTDojfV4maS9MELM5zkq2YnsHKxJzHe7zl1THfJDuhQWhnveda6sH0Wcgk2
         7yhUigAPP4W96NVCoDXmT5zDY7kAyah69q4TujetSI6pA6U7AAqiMUJk4s2rFrhc3e4n
         XJb1bCnfFWD14OgxPXxCWzDJCKdKrx0p4jdoodM9y+q/RfX/nD4mAzA7KcAaqOFmBdRv
         KS9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692436; x=1782297236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uLJVi2lQkwcQJakc7pftwG/u0GTIiX/FfTuiAYCAfco=;
        b=Ks0WH1Nb6J5P3a791uP11yrSuD1Kj1e3KejEkv7BbpZ6bCal0vYnM7LHFel8MRr520
         thNyvc83326qPsITRdQFpPXzV8LxRfsyrx4ZaWEqtrRSGr4EQbmCybi6ibJJ1pUqEKxu
         UMXSMYWEmY6fboJdbfdxCBrnwZQJ87K6tU0Fn0UyH9Vd+mVL5qLK2d/HAEkVJ/J67QW0
         6bt+gX6glDrqZUD9DvIbu8xzkYMCZRuU76tNeROdzgxbhUky6H35nOXLWapzl2zPyEaz
         fsK0IDfgjleMm2YVYRBi5tFAEcz+f3CKNAZ34/4rO76BtmyoNJQ+X1vjndprRMRedSRw
         QJnA==
X-Forwarded-Encrypted: i=1; AFNElJ+yel+8WcmUDjJNcGuTIylkoAQlu/G9nbY8FaGkdyPeaPq/8v6ZHC6QCKRqtfPZ4S7QacNFKj1DzMFj5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxaWURFBGIqDypgnD6OjJtbU6qjTyQEXf59HsHHxMmWLgkXgF4G
	ADLyRSSoqLaeqbqTZZ0a+OBB7+Gp7TnN63IEgxojy1X7f4J5oCHz61YP
X-Gm-Gg: AfdE7clzBUysXYiw+0lbp/q4NGKGWxnY1tGN40iosU8R8zij3UasRxq+8pElVa9hGEk
	eLP0Am72/ntGgLoqmJue/rxj+VfW/4g9EP95pj85qa7Ol1o2qJHXUFDafDX6miyXkqro5RFSTKt
	nb85wC8Dv4H3bCweEDBT/9dWfvRUWFYYED46ApzFDzF9v7L+XwfOf3q7DomI5As7DZkS7P4qnew
	LphCezQN9rz3bKu+gqZx/Ows58Z3OG1ANGVx4wCN1apMIbBSe2Fd0PobrJCZwfQ3Lnpulpk9/yv
	h9Px9at9qM9uKSO02NrCYn0qYKhyDmxC0x6ENY34KZxTU9mYsyaxgXOoboNej9q5AV9ng1X6+6/
	YFSjU8nfkocrYW1E0mTTPbzHESZfNdYBvtY4NBoG/3GEmYm45zYR12MMQnigXhY4Vq+aXCL8UT5
	yWjB7L3pMvUnNw7hdvPFhsiGS58AJic67TYzAiY0b9347WPp4=
X-Received: by 2002:a05:7300:da13:b0:304:56fc:775 with SMTP id 5a478bee46e88-30bcf567d78mr865158eec.21.1781692435786;
        Wed, 17 Jun 2026 03:33:55 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:33:55 -0700 (PDT)
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
Subject: [PATCH 06/78] ASoC: codecs: aw88081: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:23 +0700
Message-ID: <20260617103235.449609-7-phucduc.bui@gmail.com>
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
 sound/soc/codecs/aw88081.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/aw88081.c b/sound/soc/codecs/aw88081.c
index d5e886a8f106..fce56a249a1f 100644
--- a/sound/soc/codecs/aw88081.c
+++ b/sound/soc/codecs/aw88081.c
@@ -763,9 +763,8 @@ static void aw88081_startup_work(struct work_struct *work)
 	struct aw88081 *aw88081 =
 		container_of(work, struct aw88081, start_work.work);
 
-	mutex_lock(&aw88081->lock);
+	guard(mutex)(&aw88081->lock);
 	aw88081_start_pa(aw88081);
-	mutex_unlock(&aw88081->lock);
 }
 
 static void aw88081_start(struct aw88081 *aw88081, bool sync_start)
@@ -942,11 +941,10 @@ static int aw88081_profile_set(struct snd_kcontrol *kcontrol,
 	int ret;
 
 	/* pa stop or stopping just set profile */
-	mutex_lock(&aw88081->lock);
+	guard(mutex)(&aw88081->lock);
 	ret = aw88081_dev_set_profile_index(aw88081->aw_pa, ucontrol->value.integer.value[0]);
 	if (ret) {
 		dev_dbg(codec->dev, "profile index does not change");
-		mutex_unlock(&aw88081->lock);
 		return 0;
 	}
 
@@ -955,8 +953,6 @@ static int aw88081_profile_set(struct snd_kcontrol *kcontrol,
 		aw88081_start(aw88081, AW88081_SYNC_START);
 	}
 
-	mutex_unlock(&aw88081->lock);
-
 	return 1;
 }
 
@@ -1165,11 +1161,9 @@ static int aw88081_request_firmware_file(struct aw88081 *aw88081)
 	if (ret)
 		return ret;
 
-	mutex_lock(&aw88081->lock);
-	ret = aw88081_dev_init(aw88081, aw88081->aw_cfg);
-	mutex_unlock(&aw88081->lock);
+	guard(mutex)(&aw88081->lock);
 
-	return ret;
+	return aw88081_dev_init(aw88081, aw88081->aw_cfg);
 }
 
 static int aw88081_playback_event(struct snd_soc_dapm_widget *w,
@@ -1178,7 +1172,7 @@ static int aw88081_playback_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct aw88081 *aw88081 = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&aw88081->lock);
+	guard(mutex)(&aw88081->lock);
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		aw88081_start(aw88081, AW88081_ASYNC_START);
@@ -1189,7 +1183,6 @@ static int aw88081_playback_event(struct snd_soc_dapm_widget *w,
 	default:
 		break;
 	}
-	mutex_unlock(&aw88081->lock);
 
 	return 0;
 }
-- 
2.43.0

