Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212E92C3278
	for <linux-sound@vger.kernel.org>; Tue,  9 Dec 2025 12:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765283974; cv=none; b=XzVja+QnIOUIQPPH62aNTnobmQYzz3AmgIh7i5oHOZdJYD/tDAN2zDTvvAefu2/plWc9JFJrBm4Sv+uPWvYcTYyWKp0Sr+pdZ5XuLTNH+8bSewBbJpXh7aeR34xoHJTgrHmr3lSn0kNQc8cqCCNmi0vdcvDWtt95OrgAcuxLoLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765283974; c=relaxed/simple;
	bh=IJXxFrLhesuRKBYfPk/D4IoDjcQSFQVfJ2/gZsmD+Pg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DX43yKZfqELUju+u8r29+W+svzkRicD9sDFl1mL18HBJm9JIwtZBExwAhx692MIrseNqJdJt7HKHJz+gfcTXP7M3uhWLEJ8YXDl5FCZVt9/SjJ7xyeVqOMqr9KPHro83lNlYO71wrMvSlXJ1G3lcOTHrFXvJ6AP+2Mlhrb9Q7io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=VYIjENcX; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="VYIjENcX"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b79af62d36bso261209266b.3
        for <linux-sound@vger.kernel.org>; Tue, 09 Dec 2025 04:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765283971; x=1765888771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3wXIgwagIyEmaLE/0aFkqrrE9iXHEuufvtD5Z/fJpQg=;
        b=VYIjENcXl2jt/3v7DMXvaseRqsFWHwzMNhbKMVMARQ84hxYZtoxocZaxWrZ5xCQccb
         5cl0a0PHrhMfh8dy1hHreOIkHApZ495qel9u0EVEW1zBU02XvHa+S7tFYMUhkGFMoJAx
         VK0MyLrZQv/SL8Sm/h6InoPN+IIFW9SLtQc6kyaZpBqHwmQB4TPWs/3PygH3x6i+ls77
         fzB6zqGRv5OqCo/Tty4ryhtiMDRQyrgUVpQ4Uxz+SnHT08+/ulffOM7CE0T4+M0Y7b4J
         6E54UQyJc+3Ct9l83/wb0pLWnS0AZk8bY82oQ4UqoB8MALLqh7d5rFDIN0cidz8zz9V+
         2pig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765283971; x=1765888771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3wXIgwagIyEmaLE/0aFkqrrE9iXHEuufvtD5Z/fJpQg=;
        b=uVb6oIR8Ux0xgopwKSG6m4ruanT0eTNJrjjZzJp5lQxz4wtnTu/9z5TIpxCxSJCfgg
         Vfb3BIQ6zhC2tV6qB9CGbGJtaWIC09L9CfaCe0RBINmzbCDqhtRQ7ZR3Jr87E76YSb6T
         206Ke9OhC6eoBpwE1TasauJprtzD0yNKvrRSufI4hvQOmfORev7ga3OyWZz4dzbKbI/2
         E1ZJ9FKUplGcuIiCX7WEYwAI/vopmqFU18y30Y8mPhxHBtLcxoVX1uXUtw4Zlos6RswT
         n20g5119eDq/w1QRqTf+vc4oryQEkiZ87jUmh2zk3cUwhZkCiZbL0Udrzk+WMqMkiDYg
         3vlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsz7SkkC/idyO7tUX7RjUgukCl77G2rhJrhbQugQHXWvwqm9JJOot7j09ME/om8Z9Wu98l1mwtWSejhg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrQh+Ujn8KkFQpwZTb8Djp1ecRkHGUd1bIMu6YiNwXD8EdTnty
	MYdge4jsgJeu3NBZO3KCpIe9feCYfSZbEY/rIUAZTJoJ1O9kPjtpFoshwBUEz9irxx0=
X-Gm-Gg: ASbGnctF8dSie4EcMXsAwBYWqtZpQM7qVhDQTtrohTN48V8uXl2Fbx/eIXMiEqkUbr6
	U2B1FbXo/yAc3IYriIPAah+TngRM8IT/KGO1zDtDlsGAGULvM5AAXtCFGESQriGUUVbRtcuw6Gs
	zH8rTP+uG3s9gG+gkoCAYgrxaPRBAZ4P8SvPA727P1wxu8vO7yd/Th7ZCJ/EAfcXPJxbxvFZfzH
	x3gbL9F3F5KT3cpTq02c+mVd5dQcQtOuBQRJ4HEZaDCwgN33XEQ8iaFZYeYbLqaW+qUXUSC/ec4
	1enAg46sW6s2o3TYi3jCoxbLbRQtJEqvrrGllRibGeaoid3zWCl4mEsX2JpJrFGA6VS2oV30ljL
	9N5uvSxCGsIdLQ6sd24Nc+U1RC3yRwczI+TIzqLSGuRDVrYGh0/Npf7tzWaNlxIG5t+dNfJ1o9F
	p/C0Lm48P8jVkkHAln9q8vfZXrChSPbf/gcmtMjdWI0ouzo9foHmx6gpKH6gip0inBqazVKTF43
	6U=
X-Google-Smtp-Source: AGHT+IHa7uSN/wS2xwu0p7SrWssKXBTi5NH4S58Bsw0KewUM4/INm+pzN6Do0msxdihDbcIidJeJ8w==
X-Received: by 2002:a17:907:dac:b0:b73:b0eb:16f5 with SMTP id a640c23a62f3a-b7a2476fc57mr1233545166b.31.1765283971411;
        Tue, 09 Dec 2025 04:39:31 -0800 (PST)
Received: from localhost (p200300f65f00660846b2ba6e435ad603.dip0.t-ipconnect.de. [2003:f6:5f00:6608:46b2:ba6e:435a:d603])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b79f4457f9dsm1405083666b.8.2025.12.09.04.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 04:39:31 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-sound@vger.kernel.org
Subject: [PATCH v2 8/9] ALSA: seq: oss: Convert to snd_seq bus probe mechanism
Date: Tue,  9 Dec 2025 13:38:50 +0100
Message-ID:  <affb5a7107e9d678ce85dc7f0b87445928cd6b94.1765283601.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1765283601.git.u.kleine-koenig@baylibre.com>
References: <cover.1765283601.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3302; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=IJXxFrLhesuRKBYfPk/D4IoDjcQSFQVfJ2/gZsmD+Pg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpOBhpYnazqfhj/t8qjuGgCLXjqj8RFhP/KsYbG N5blPngDTSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaTgYaQAKCRCPgPtYfRL+ TkZeCACy+jL56uaJD8sSHXuIJEDfvsjkg56ga05q/K152ky+Qrk8bmkUa5VaIRqjuykayk8R+kW UHPxp9wDX2ta00qxH+zAd/elOoOolptwlSvQltg1fLNAwPheMG3+WAmXddjYQTF27CyuH+i9ZVA YpTaEA19gP3gSonBXFEY2/4zxRRxr6m9qq3+5OdnaYTl2CIDnGgZ6FAceifSm76gaBHmI1kUdWD xiiP2j7ufrCJ0cJGy44rIBaA1mJ9AhHVMDEy9JOfhiSHOzfEMGRCe259cSFJmrZgSiXAJurX3r/ cMGuzA0SxUelFqdvSX0poZHF6uUsCV3pJ0IU0cuiiRZT9Bi9
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The snd_seq bus got a dedicated probe function. Make use of that. This
fixes a runtime warning about the driver needing to be converted to the
bus probe method.

Note that the remove callback returns void now. The actual return value
was ignored before (see device_remove() in drivers/base/dd.c), so there
is no problem introduced by converting `return -EINVAL` to `return`.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 sound/core/seq/oss/seq_oss.c       |  4 ++--
 sound/core/seq/oss/seq_oss_synth.c | 12 ++++--------
 sound/core/seq/oss/seq_oss_synth.h |  4 ++--
 3 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/sound/core/seq/oss/seq_oss.c b/sound/core/seq/oss/seq_oss.c
index 02d30d8b6c3a..021cd70f90db 100644
--- a/sound/core/seq/oss/seq_oss.c
+++ b/sound/core/seq/oss/seq_oss.c
@@ -54,10 +54,10 @@ static __poll_t odev_poll(struct file *file, poll_table * wait);
  */
 
 static struct snd_seq_driver seq_oss_synth_driver = {
+	.probe = snd_seq_oss_synth_probe,
+	.remove = snd_seq_oss_synth_remove,
 	.driver = {
 		.name = KBUILD_MODNAME,
-		.probe = snd_seq_oss_synth_probe,
-		.remove = snd_seq_oss_synth_remove,
 	},
 	.id = SNDRV_SEQ_DEV_ID_OSS,
 	.argsize = sizeof(struct snd_seq_oss_reg),
diff --git a/sound/core/seq/oss/seq_oss_synth.c b/sound/core/seq/oss/seq_oss_synth.c
index 8c4e5913c7e6..68bc6d4eed53 100644
--- a/sound/core/seq/oss/seq_oss_synth.c
+++ b/sound/core/seq/oss/seq_oss_synth.c
@@ -80,9 +80,8 @@ snd_seq_oss_synth_init(void)
  * registration of the synth device
  */
 int
-snd_seq_oss_synth_probe(struct device *_dev)
+snd_seq_oss_synth_probe(struct snd_seq_device *dev)
 {
-	struct snd_seq_device *dev = to_seq_dev(_dev);
 	int i;
 	struct seq_oss_synth *rec;
 	struct snd_seq_oss_reg *reg = SNDRV_SEQ_DEVICE_ARGPTR(dev);
@@ -128,10 +127,9 @@ snd_seq_oss_synth_probe(struct device *_dev)
 }
 
 
-int
-snd_seq_oss_synth_remove(struct device *_dev)
+void
+snd_seq_oss_synth_remove(struct snd_seq_device *dev)
 {
-	struct snd_seq_device *dev = to_seq_dev(_dev);
 	int index;
 	struct seq_oss_synth *rec = dev->driver_data;
 
@@ -142,7 +140,7 @@ snd_seq_oss_synth_remove(struct device *_dev)
 		}
 		if (index >= max_synth_devs) {
 			pr_err("ALSA: seq_oss: can't unregister synth\n");
-			return -EINVAL;
+			return;
 		}
 		synth_devs[index] = NULL;
 		if (index == max_synth_devs - 1) {
@@ -160,8 +158,6 @@ snd_seq_oss_synth_remove(struct device *_dev)
 
 	snd_use_lock_sync(&rec->use_lock);
 	kfree(rec);
-
-	return 0;
 }
 
 
diff --git a/sound/core/seq/oss/seq_oss_synth.h b/sound/core/seq/oss/seq_oss_synth.h
index ffc40d8a7ef1..f52283904cba 100644
--- a/sound/core/seq/oss/seq_oss_synth.h
+++ b/sound/core/seq/oss/seq_oss_synth.h
@@ -15,8 +15,8 @@
 #include <sound/seq_device.h>
 
 void snd_seq_oss_synth_init(void);
-int snd_seq_oss_synth_probe(struct device *dev);
-int snd_seq_oss_synth_remove(struct device *dev);
+int snd_seq_oss_synth_probe(struct snd_seq_device *dev);
+void snd_seq_oss_synth_remove(struct snd_seq_device *dev);
 void snd_seq_oss_synth_setup(struct seq_oss_devinfo *dp);
 void snd_seq_oss_synth_setup_midi(struct seq_oss_devinfo *dp);
 void snd_seq_oss_synth_cleanup(struct seq_oss_devinfo *dp);
-- 
2.47.3

