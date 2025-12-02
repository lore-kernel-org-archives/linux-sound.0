Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91D8311C32
	for <linux-sound@vger.kernel.org>; Tue,  2 Dec 2025 12:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764678995; cv=none; b=q9gLIwdkCbKJRqAXcqRVu0/ZpyKI57PFOPfsrfNvoJ4C2HYm6mqEPz9HoOb7hduhKNnC8yncM+r2EcopKd0PPnLfTnCKmnf8PxuVlFFQLkUxvTd2KYYAl6YU1hcA8cS8HX9aFx6Kph5eBFH/wCwuqkak/S2Ciy/wWApmhYkWJjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764678995; c=relaxed/simple;
	bh=j2UpVV5A5Ju0ZnRHLsj4VYR8L/xCiTeXzOhY+/e4TnU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZVvg1IGeVwyZeT4rCF3lpYpkesWIxIp8bRiMXPTH1GrKfBdqTdW0KzcZ4BkPavE+UQmAGSxs6wftALr5XQrePdArj+H+aXVAI29RWVkZpqDK2ApVklIaonAMqe5NhhnGJ4hm+uwE+x1SgkV5mrqfUa2vAmIFieaSQBt9AlXg2zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=yK6NyfGu; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="yK6NyfGu"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b72b495aa81so699883266b.2
        for <linux-sound@vger.kernel.org>; Tue, 02 Dec 2025 04:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1764678992; x=1765283792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pz0AZ8osGS/hAluVwIcKZt8szT+OkIZIfK1R7p75FPI=;
        b=yK6NyfGutQhnAWIxIkBvOM3XAWX96yz7if6SvhTapJ/AlOmVhC4iIDdSPaRpkFMIsu
         JenQdV8Vv5+HHDkY4uqAPu1S+e2wdOaRQWxo3JhWVVXhs/GJOjHRh7UbCiqIqAeOO4MJ
         fLckq0aiNXlFsVvlbGlkP8xvhSc8/uKWr/42IzKX4t9Su93KuOfhzWXgU4EGydTFM6of
         +kvHO6ElWipjKsR+goPoGASCdKBAHNyFsjuB+35A+2IoElHx9pnHs74LhjC+3Wk4+Nxv
         9zp6/TrTtn/wvjCQN4vkJ2gTaPsH2f+CD7Pbj10vj10pHg0gyfy/CRUmD4xe5FXz28EI
         sKZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764678992; x=1765283792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pz0AZ8osGS/hAluVwIcKZt8szT+OkIZIfK1R7p75FPI=;
        b=LL6K+369/mmIUGGpB0ToTrmHNWgLsr1gNWOE1FQFQn6l/awKiRUA+PUPsHuSCHGs6k
         i2Tjdb0N16TX5jZ4hUUc6vbkNOoBAA4eMq3277LzLWPAjmMYvYvpa32yz1qABqRaJaJR
         TjxlNQVcIou4nYghc+UHDJBFZxzXgB+aaweDPF8yWAoDUJCItymHW38HMK+jsj7dnIqj
         wE2s3lrFtVlCnHI5GUG+u9l70eGN+Tah1/ngr54ROP/qd0qk8ysr/Qs1T8x6oGFIeMmf
         OwpAKpxQDpfEm5Ol7ewZyO/PQU7aFKxJ5mbw9lkonlZcu5/AnWfWHhukx5Uid+FI8EIi
         N7sw==
X-Forwarded-Encrypted: i=1; AJvYcCWjbMLWYV/4DA4Ag0r72MZrKfqUxqxHfCVDP5ZgWywZILnISWFXSsVSD0BbPqeh6XH4zIM3yAp6Blz1ig==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfneulFkdRbQbzivIA6AvD4u4MSd66ynZ/kaWUOOk4+GENk6GC
	C4ikZqh3pMCgBkVBZPquJwOfaq/Bxw+qoDZuRRXtMhlveI0mruLUWW4TBWX+NX+H22s=
X-Gm-Gg: ASbGncu6OsdwBitqTv7Qc/RcgAxe2jOl77eqLOp0h4EBt8EQS/lstM+PP+XJ2FcXqw3
	ILdI/Q1h3pO/MD538kOTPoKcfRLCfTUGSP8wDaxNhwuF7dF1AQ1FOudFwztAzHD8m0FmDTjzsK2
	Qvx7Nd4T4CNYP/qUn5fts6OOjdLXENPuO2zY4P/FOlvrM7sgXVKyoWpziGenerHv34SgpodvMhl
	HF4WDnqTqqGrG1dM/flxUvBELFnw1sbpaqFLmgsCprqsohivWpZC/aqLy2YR3JvayiJtyirsQ9k
	tjQkIY1bgzS3pgsLhECan8zsdswZRE4OxcAIiFIPcb7UsFst6/B33NWy8LfroZ8DpUl9tnHJsAJ
	IoKsFvHQolqW0eZutrW2LW0wO92EpXbpUoaAEblqSzijFkte6sD8VpBCxC7TX0B28KcDyQV+tUi
	6p983v+ZuRB7g9WnH5Lrcg0Gz7/yZWJcWbdD1LHXD29o5RPPeQpTCMYRu5IAc4dvat0zEOl3kR3
	TQ=
X-Google-Smtp-Source: AGHT+IEtjBlkPvQtOqPQRtYKHQy/+eiEkLTe0Y9uC/XOkhoAuQn6QcpH3Ia04i9EJSZmZnHaniXqhg==
X-Received: by 2002:a17:907:1c21:b0:b77:1b05:a081 with SMTP id a640c23a62f3a-b771b05a427mr1522152466b.27.1764678991875;
        Tue, 02 Dec 2025 04:36:31 -0800 (PST)
Received: from localhost (p200300f65f006608c90d1d7fe637464b.dip0.t-ipconnect.de. [2003:f6:5f00:6608:c90d:1d7f:e637:464b])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b76f5162088sm1527515966b.1.2025.12.02.04.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 04:36:31 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-sound@vger.kernel.org
Subject: [PATCH 7/9] ALSA: emu10k1: Convert to snd_seq bus probe mechanism
Date: Tue,  2 Dec 2025 13:35:56 +0100
Message-ID:  <53f1b6e05b3b7f8f10d1a5b19678f84a23bd7f37.1764677854.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1764677854.git.u.kleine-koenig@baylibre.com>
References: <cover.1764677854.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1998; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=j2UpVV5A5Ju0ZnRHLsj4VYR8L/xCiTeXzOhY+/e4TnU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpLt034gtLDSgGmdEELPabyok/4bc1JG6ZPfHIJ d5g1dmEfeCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaS7dNwAKCRCPgPtYfRL+ Tgi+B/9K4aUGWdH1WAOoTZRCuamM/xp6E9t5QXPYwr1nUltTx6tpgfDD6Kvd9h2gp5LYb3EeUBn A+3BKoxs7XpOJZPvTSpoQjCFP3URWcX/sb7LXAvvIrKwOwpTTfTGbS6QdN6FG6nMjqszQ6eOJPr QFleAVdRxvOi73kzvmJzoG5ShQMJN3lXALzA1m/0RRDIA2TzahMmuziRy5KuPJwpn8n3Em4tAq7 hkvSWKCbtRNxHF4xXyKrpUY/APCKzaK6EssOahe8aH4TgfHQHfUSQSZBkEomEUxzqYFPwD2MAyj 0N6neSvNGPYGAqxUM8iYjJ2H+Jpcr6do/q3hAUt+QFTfhCOa
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The snd_seq bus got a dedicated probe function. Make use of that. This
fixes a runtime warning about the driver needing to be converted to the
bus probe method.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 sound/pci/emu10k1/emu10k1_synth.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/sound/pci/emu10k1/emu10k1_synth.c b/sound/pci/emu10k1/emu10k1_synth.c
index 662d20eb9689..26499c31eaa8 100644
--- a/sound/pci/emu10k1/emu10k1_synth.c
+++ b/sound/pci/emu10k1/emu10k1_synth.c
@@ -16,9 +16,8 @@ MODULE_LICENSE("GPL");
 /*
  * create a new hardware dependent device for Emu10k1
  */
-static int snd_emu10k1_synth_probe(struct device *_dev)
+static int snd_emu10k1_synth_probe(struct snd_seq_device *dev)
 {
-	struct snd_seq_device *dev = to_seq_dev(_dev);
 	struct snd_emux *emux;
 	struct snd_emu10k1 *hw;
 	struct snd_emu10k1_synth_arg *arg;
@@ -64,14 +63,13 @@ static int snd_emu10k1_synth_probe(struct device *_dev)
 	return 0;
 }
 
-static int snd_emu10k1_synth_remove(struct device *_dev)
+static void snd_emu10k1_synth_remove(struct snd_seq_device *dev)
 {
-	struct snd_seq_device *dev = to_seq_dev(_dev);
 	struct snd_emux *emux;
 	struct snd_emu10k1 *hw;
 
 	if (dev->driver_data == NULL)
-		return 0; /* not registered actually */
+		return; /* not registered actually */
 
 	emux = dev->driver_data;
 
@@ -82,7 +80,6 @@ static int snd_emu10k1_synth_remove(struct device *_dev)
 	}
 
 	snd_emux_free(emux);
-	return 0;
 }
 
 /*
@@ -90,10 +87,10 @@ static int snd_emu10k1_synth_remove(struct device *_dev)
  */
 
 static struct snd_seq_driver emu10k1_synth_driver = {
+	.probe = snd_emu10k1_synth_probe,
+	.remove = snd_emu10k1_synth_remove,
 	.driver = {
 		.name = KBUILD_MODNAME,
-		.probe = snd_emu10k1_synth_probe,
-		.remove = snd_emu10k1_synth_remove,
 	},
 	.id = SNDRV_SEQ_DEV_ID_EMU10K1_SYNTH,
 	.argsize = sizeof(struct snd_emu10k1_synth_arg),
-- 
2.47.3

