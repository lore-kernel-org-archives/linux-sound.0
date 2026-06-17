Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CAB4492182
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 10:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692800; cv=none; b=eu+kTIMAkTn4cfeksZ4ESooDPtVl8NRAV48T6EgQMsBeHTMd9E9jgCqBuQjok9xcer7tJVu54MdCLJbSZlQFqS0nKiG6/jGqDQBbaaJf3RjcT489s21oUFHwcrmHgiKhdfYSQfk1lR4ZAAnGYUiw2rNNGaeUqqEmfScGmX82mWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692800; c=relaxed/simple;
	bh=CfPSrFVheY2+VrZHiVHqixZx/q7uaP11RkObiCVMyqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pHQTB67YZBEdlZ+hpxbi+C7UMnGydB767Hw6rSBQdxTLJYDyAx8QGvUHKqcgbLovUmGv9Hjp77JbmVMMfW2I+IYFrawNNAEIFPwyvsaCFSmAt8n5hGtJ5iVJhK+hu44el46TZsrqvniYP6QS/jLE7soZOzhQqj2MLNZhl2jYMJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kj1mA3Ap; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kj1mA3Ap"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-30bdb3eb5f0so152477eec.0
        for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 03:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692796; x=1782297596; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9NimHoJxrkt0fKeQ5nDtc/hHZTnOxU7Jn5N5pQIslE=;
        b=kj1mA3ApmfFqFUXGU6/LIlztl8DgfAT8Y/wZ9lnwm3AATorYnwu3VW7l1vzJLCmKXe
         6GGmNZXCT+65pg3y6X7Wx6objXaeDjnyegB3Vc4sybXKMghwDqpIo98WC7v0YDT/YatS
         pAGTV3AmoIs4DOiuQEUpd5R/B+/Uzd113Rqx3TfF3BS2km9EP2ZcLy0Zrle9zO2jA/kQ
         V2jG53JBgw5sPS/4bYKhB7VUPXXJnlkXNCPCTtxxFHebkGFkGWHg0S6Vr+ix7R3R5rFs
         xkjKBOyUFv1xTdakBpNx0Acn6gV+XYJJm7QdQi4jwmZYPJS8Cz8olb2jdfcQvRZg9tj3
         ml9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692796; x=1782297596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c9NimHoJxrkt0fKeQ5nDtc/hHZTnOxU7Jn5N5pQIslE=;
        b=i4kQCkZ7Qsa/DyiQta0Zw8avHYeaCk71UyZ5Hbt0aDfz+Dz2gpnK5aA9TqlPtXZ+HQ
         MIGF2xQXolAHCg6op+ipSbME2uqr/dY6IAqr9Ho6RMK56y9J6aQdoWrK178HAJ+5G2uh
         UtYlRnERi2rEDFo3pucZbRrtfHOqjAaR5jpzVxSEIQeeM0wOCHDYZvoutHH8t34m48l+
         hEWy3/WDqhUgy1z6zAOk7mxii5lG2oZXYmOpRcGXZqxJXbI4OJMG02o+rsDfLy/KEJp9
         4NjqEVZXalRn0m4mvnD3r+8ddqe0it0sJFDnRN5LYhIoJbeAn6fPAjU6NcoIuEOI/Bpn
         5m9A==
X-Forwarded-Encrypted: i=1; AFNElJ9uZqtfIVS4/z9jUXEOoGowDcnW7tLz/3kgYYRMr5RrX3CSS8eiMAqKxwQRQYRZEzqkZ3v3i5I3FF9PBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTlSZ2tmC+f9xTDWI7jkjifZi51zLN/sdbk3c9le37xDFYkigR
	5BNILYcVWlap5RQgquJvz5t2GfGrK7vMypa82u7d5SPWasH8ewNvpEfj
X-Gm-Gg: AfdE7cnWKx7grmtsbLj81ExfF4aKr722l9YRm+KDQ5+1tTrsQ8gl33WVxJJsCv0Sn91
	Ux7x6Mn+rKGw4XfSHR4y5NK1dUojU+o07Kg0xB2eCXi4dlgFRlunGJG1dMaglBdsCV0dEnuUrOK
	h8wGfld4yRO/uucvGeX7p9vC+0bWMc9o1jSf1n+qpVSnycvjnakwC0GN/HUmYXe4VT/dQSB09qH
	BK/q3cp4rIJVedKjnkjewHY0cCgeNHn7/BH97CaaSppSW4+kpa4kwC7Sf9v3lsC2vINZsXna8mT
	HfizxA3p30jFxp5eePtI8HuZ1LVvbg+nUxeF5mvZbxxI4UlQKp3tYzIHuw35TKcqETOIhT/xDtA
	YkS8Wo9XR2SWwL1mu3+vkJKfmfsx+zbPYqtYVagtMpVnCwYdpDI8WtfB2wf9b/9AbdWH6nWVmje
	6BaZW6QsVQHFDjdVgL3gZk+3YkfEgaLhD/8y1DvhyP0GuzEyTur1TidSDGDw==
X-Received: by 2002:a05:7300:3aa8:b0:30b:df3b:fe94 with SMTP id 5a478bee46e88-30bdf3c0705mr266574eec.3.1781692796467;
        Wed, 17 Jun 2026 03:39:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:39:56 -0700 (PDT)
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
Subject: [PATCH 44/78] ASoC: codecs: rt5668: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:32:01 +0700
Message-ID: <20260617103235.449609-45-phucduc.bui@gmail.com>
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
 sound/soc/codecs/rt5668.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/rt5668.c b/sound/soc/codecs/rt5668.c
index fed6de40b8c8..1eba4d559c0f 100644
--- a/sound/soc/codecs/rt5668.c
+++ b/sound/soc/codecs/rt5668.c
@@ -986,7 +986,7 @@ static void rt5668_jack_detect_handler(struct work_struct *work)
 		return;
 	}
 
-	mutex_lock(&rt5668->calibrate_mutex);
+	guard(mutex)(&rt5668->calibrate_mutex);
 
 	val = snd_soc_component_read(rt5668->component, RT5668_AJD1_CTRL)
 		& RT5668_JDH_RS_MASK;
@@ -1053,8 +1053,6 @@ static void rt5668_jack_detect_handler(struct work_struct *work)
 		schedule_delayed_work(&rt5668->jd_check_work, 0);
 	else
 		cancel_delayed_work_sync(&rt5668->jd_check_work);
-
-	mutex_unlock(&rt5668->calibrate_mutex);
 }
 
 static const struct snd_kcontrol_new rt5668_snd_controls[] = {
@@ -2356,7 +2354,7 @@ static void rt5668_calibrate(struct rt5668_priv *rt5668)
 {
 	int value, count;
 
-	mutex_lock(&rt5668->calibrate_mutex);
+	guard(mutex)(&rt5668->calibrate_mutex);
 
 	rt5668_reset(rt5668->regmap);
 	regmap_write(rt5668->regmap, RT5668_PWR_ANLG_1, 0xa2bf);
@@ -2400,9 +2398,6 @@ static void rt5668_calibrate(struct rt5668_priv *rt5668)
 	/* restore settings */
 	regmap_write(rt5668->regmap, RT5668_STO1_ADC_MIXER, 0xc0c4);
 	regmap_write(rt5668->regmap, RT5668_PWR_DIG_1, 0x0000);
-
-	mutex_unlock(&rt5668->calibrate_mutex);
-
 }
 
 static int rt5668_i2c_probe(struct i2c_client *i2c)
-- 
2.43.0

