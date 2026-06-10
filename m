Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439C53B95FA
	for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 10:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781086929; cv=none; b=IKC0t9rGA7vThTW7d4molyxQm/eU0gaS2MDKefqmgJvvq1FG+f62J3zCpqUxmiy5AmNszwowS0tuZ6dZ5CSBphkr0+wOHNtrLmhD5HDqJrpdvqgj5zkTN+kUgSUn1z33uIHuU9HThOW4H9XxHwJWUJV75bz98oRC5380MoiwxUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781086929; c=relaxed/simple;
	bh=ZgLsOTmDPgl0bOgLFz0unt3vkdsvvmeFeKMYXg/J4hs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VdOgM9+m+mo1m8s3f0l38bk/ElgBGsRnJyrsbnw03uE4DYwBQiOWffBycC3X4gNCaTduT2QvXR90hznGKC6L1i7upqWDisrXGNIWySSt1MEmB/dDmLC8dwUb9S0idKq/bj6k+INoHGBRq43/1BdaTYnsLzjz7NezgDI40AbsOLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SR5U19pJ; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SR5U19pJ"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2c0c1e0d00bso63506445ad.0
        for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 03:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781086928; x=1781691728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7rPTGNjskcRtQTw6mA5VpAqBzsjh0SlCyTZZ3Fz9+0M=;
        b=SR5U19pJAM20BOq1NDdOcmkZaNmEJ3lsnulAARNNmQIPYxt5oU9mSgQis9VUOudkdy
         mfJ8ggxXZQBYKBSTnDkIMkvfZWwzSwhERSJogULH1mIr44skcyHcwCVdKhcej3YPIGR7
         HPt9wjBorx5fe6YXij3lMM9cFK7D6jlY5LABRJEqvZqVaHKlGdQ+C4s29j5Y6wL+WRR6
         Hc46ZCjQjnmiBoDbAY+/8OFItLPBdxgtlKuh9Fzegkt0ATaKvyy2XcmpHm/D+kHvIn6T
         dF9Vsah8Rxpi1TY4DUSx0sBtDQWDUXkZo2fehhLz2QkKZsOVNy8p1Uyldtp/4cWfB0WJ
         5Izg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781086928; x=1781691728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7rPTGNjskcRtQTw6mA5VpAqBzsjh0SlCyTZZ3Fz9+0M=;
        b=eElw8R0fiYY27O4FBb5gl0MA3P8fziuNbxc/CPUfeJrtoT3VaKCN9nnK5hN5f2DGk+
         LhG0KitgdIXO67INLNkUsjlbrPnB9LE4LlMWf9kEWfa8Y3fiXhHKCib5RBlvZmPuCa1+
         h8Hl0orgFA2s5wp/wu0Fd91GlOZKgmi+NW+961Dxk3DHxVaY8sGZxrJGLQdFwRoFzPJF
         cFiiEKTo5UlVCNO1HGIeF4tYbDeQREoIczDkEItDumng9TWMiGHQK6eArsUjzZnN0Nf7
         UuV+7ktzxmn4pWRAVPWwePxs3C0mwytMm+6fuhVUvECFtlGK97UUFb+zg9WbDmdPGd50
         JAvw==
X-Forwarded-Encrypted: i=1; AFNElJ/aBmJWbNEuV/ytVOegEfdCqFUFxUFpRr3hGMWgQNaNQHrPZrbeCBZYNbot+D2YQbAFs26Rgk1A6nsXag==@vger.kernel.org
X-Gm-Message-State: AOJu0Yypp37k2O2o+n2VNLlruorUB5CpC8+aCCCfVw1nns2hTriCV2Oc
	OEepUJstlTuufxKZWWCaHbivbDL0URVgwH6i3utlWVmnn/2esAU2WhOZ
X-Gm-Gg: Acq92OEQAk1xOSMSlOASMpdLJA7G0ChT++ZiGJaNDaB8jgPYUUMPm2hwRC4gbncvKtG
	4hDVQrQzKY5clIuQl9Gbnvu5mqAktk7qDzUCRbpDu2yZP6HK5wMadF5zrRn/pcwMJa7k+KH4hHA
	scq73KlVOOUq6Qg65Oub4F9eO4EUu3E34aNx3QNnrC3XH54hchgngGWj9QgwgE0o1BHeATZ/B3g
	9VmsNzoggfTGxvQ+HMhzmLvV0FTETiXbgpFyLD0VIUeuGUQltYcZ4r936BwjMtri+JSN/NqU/WA
	3kcoQDUvIy4kMbG/2EL4jzyeGotNxYmSlZvNpOiXiA6bjDeeKDWeIJ5egSeQLvuozMXJ1tSx5WF
	ZJRfN0rPDYtWDhxDSZg/WtON4zX4MJxxLhhWgLCeT0vixmoKbTHzUjyD1z1dkurPV8hPco1jSQV
	zF/s2g4DoyN6zd6iPxeud+jWCq28TKmwUt/J3BD723eo4iYfn+jRiH9d0FLR+9/n/CCRUc
X-Received: by 2002:a17:902:f711:b0:2c0:ab82:6ba7 with SMTP id d9443c01a7336-2c1e85ad8d7mr289553825ad.33.1781086927749;
        Wed, 10 Jun 2026 03:22:07 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1663981basm239924075ad.67.2026.06.10.03.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 03:22:07 -0700 (PDT)
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
Subject: [PATCH] ASoC: meson: axg-tdm-formatter: Use guard() for mutex locks
Date: Wed, 10 Jun 2026 17:21:53 +0700
Message-ID: <20260610102153.83367-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
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
 sound/soc/meson/axg-tdm-formatter.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/sound/soc/meson/axg-tdm-formatter.c b/sound/soc/meson/axg-tdm-formatter.c
index f451e4dce442..a6ba401104d5 100644
--- a/sound/soc/meson/axg-tdm-formatter.c
+++ b/sound/soc/meson/axg-tdm-formatter.c
@@ -157,20 +157,19 @@ static int axg_tdm_formatter_attach(struct axg_tdm_formatter *formatter)
 	struct axg_tdm_stream *ts = formatter->stream;
 	int ret = 0;
 
-	mutex_lock(&ts->lock);
+	guard(mutex)(&ts->lock);
 
 	/* Catch up if the stream is already running when we attach */
 	if (ts->ready) {
 		ret = axg_tdm_formatter_enable(formatter);
 		if (ret) {
 			pr_err("failed to enable formatter\n");
-			goto out;
+			return ret;
 		}
 	}
 
 	list_add_tail(&formatter->list, &ts->formatter_list);
-out:
-	mutex_unlock(&ts->lock);
+
 	return ret;
 }
 
@@ -178,9 +177,8 @@ static void axg_tdm_formatter_dettach(struct axg_tdm_formatter *formatter)
 {
 	struct axg_tdm_stream *ts = formatter->stream;
 
-	mutex_lock(&ts->lock);
-	list_del(&formatter->list);
-	mutex_unlock(&ts->lock);
+	scoped_guard(mutex, &ts->lock)
+		list_del(&formatter->list);
 
 	axg_tdm_formatter_disable(formatter);
 }
@@ -330,7 +328,7 @@ int axg_tdm_stream_start(struct axg_tdm_stream *ts)
 	struct axg_tdm_formatter *formatter;
 	int ret = 0;
 
-	mutex_lock(&ts->lock);
+	guard(mutex)(&ts->lock);
 	ts->ready = true;
 
 	/* Start all the formatters attached to the stream */
@@ -338,12 +336,10 @@ int axg_tdm_stream_start(struct axg_tdm_stream *ts)
 		ret = axg_tdm_formatter_enable(formatter);
 		if (ret) {
 			pr_err("failed to start tdm stream\n");
-			goto out;
+			return ret;
 		}
 	}
 
-out:
-	mutex_unlock(&ts->lock);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(axg_tdm_stream_start);
@@ -352,15 +348,13 @@ void axg_tdm_stream_stop(struct axg_tdm_stream *ts)
 {
 	struct axg_tdm_formatter *formatter;
 
-	mutex_lock(&ts->lock);
+	guard(mutex)(&ts->lock);
 	ts->ready = false;
 
 	/* Stop all the formatters attached to the stream */
 	list_for_each_entry(formatter, &ts->formatter_list, list) {
 		axg_tdm_formatter_disable(formatter);
 	}
-
-	mutex_unlock(&ts->lock);
 }
 EXPORT_SYMBOL_GPL(axg_tdm_stream_stop);
 
-- 
2.43.0

