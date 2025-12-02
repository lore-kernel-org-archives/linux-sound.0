Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF65030BF6A
	for <linux-sound@vger.kernel.org>; Tue,  2 Dec 2025 12:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764678997; cv=none; b=UTfO5VywaSWKy57fgUSGE1UfzEwbKRRzY6yWg2NMZAUiAN0Sa8ouiaQgW3/BWmi4FsFZw+zTjtxHz0tuvOgy1F+YOvjk9sod4/8orVPR9QZcLaAMt9flUs5e2T1ZnuIJ0DfhO6/QXOsRfO0NZYeZH3VbdfCiIrlfLDsSOQjaTFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764678997; c=relaxed/simple;
	bh=IJXxFrLhesuRKBYfPk/D4IoDjcQSFQVfJ2/gZsmD+Pg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q+iIsZo+CaFqI2IYQALPFDCpBKmkoaAyXViLIM9KWhLGCUSnUEO0LmhBU128YIICeH4U3M6dhY2DUeegIwPO7M/gUScx9q+KXs9aOHzCblRV0ILqIk5Aemba3Gv71QR9CAd+YwoMVciS4nPW+lHiy5tgPrRSx7T1if7K9KBnJog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=c9Vs2mjX; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="c9Vs2mjX"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b73b24f1784so1025188666b.0
        for <linux-sound@vger.kernel.org>; Tue, 02 Dec 2025 04:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1764678993; x=1765283793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3wXIgwagIyEmaLE/0aFkqrrE9iXHEuufvtD5Z/fJpQg=;
        b=c9Vs2mjXmNkN49/rE9SjL1zgQCuKvrVF16lFNFjGbYdkZt8aCZ2Hc7AuowmY7eSdLF
         S2TQwaJmeEpuEs79LB8iATqcsMQuBUZInwX+LpxS8PG+AHzwHZh277R1L+CLo54YMu15
         92nPTEFMG7PGjkeJ0ihsiWEsbgwhOZtJ8JFcS4D/vgZveCfzLRSAS+jj4lcYINb+rEp4
         ackuxzJqwacG1wBbllG9kawGvkV+tE4l9XkfK01yHaAlxiwhr+p3FuLx8CKsPggflkCC
         aJnApSmZJk4Xl3DbZKgkP96siin84Y6aDUeX8+0emsMTLrDAuIBg8ngDrD96y1/5fyeM
         3tBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764678993; x=1765283793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3wXIgwagIyEmaLE/0aFkqrrE9iXHEuufvtD5Z/fJpQg=;
        b=U3D0CnekgBZEgz6tTNOjO2b575qSYLAdt9oqj0GTD71kZtqXH616lzHL9VQYvl/+p+
         WAMmnB4zIWwayxRjgspKeqQlvDf/B3oJFhGEMY8zqp0fXOo3zwPOtn3SSumsoAiBWuyu
         rTNHFl+aXtZ38eZHqWdZARfgnGRMfonJRlCtMxXduydWwyYe9KBU7e9smvtJTxyUnzDv
         DkMD6gNoHm9Q6svvEAFYWvnNjV+xQwqQWJrzAOXZi/u8S9/0vYJ07E1NLH+j5zE6gyWK
         eg6pl31OxxPW5Rbghm7ssleNoSPgdzmPch0wv/FE7rZw8YMwY5BRxq+6OBYzUx5bW8GP
         gBdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDelZD6Vv2YIKQUARvb5sy2Qwsi7v3g8t6jpzyVe+oqkfVf/YwjCGaZZL+lElYGzTMYmH4EXxRxZfzsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+5+Ffkibs2miLAVCe8TWy/PscMswWmm6C0PFD3mg04w3Kz07m
	zw20A33CLbYfXcVr68A7DV18oImuEwUXDy2J9ZRoXtTVPoHSKQ787URltkDeBdq/MUY=
X-Gm-Gg: ASbGncs/C8krvV4OesDNWfdTHNOBeycxo1Hx9TOZn8qR6oiVTirCkqyv9SYEFsYMF6y
	OjPq81LcGJzQLMI176GqN0x23e63n62lrZxTxqD7EmswN8sqiivJZFuPnxvGs5W+nvAr5x0K7yW
	EurpcanAxJ835jNLsGOnan0BqyN4sfbU+V4D3NpreHoU+77s/Btm7zlhV+HnznrD89urX/EXUcv
	N3GFUbKuFpAaxbSWUj5eSdB51Ox0z2XrihbRpnnkzPSRPa7xdQyG3pvkL8UHQmkijScAP0lA0fp
	CuwvYhxgr/J2w05xmsaT574wGA3N1RhGPlxtCU0G9EOHOxaR4H95C3Xe6WZuLrzDN4yHKAB+CzU
	LR1I4iayND0O5XkqZ/fOt41IU38K6FmGsrDQPj8sIqQguT2rHiWYGtPJ6QsXcpmrA3i18yj/2QZ
	CnSIgsaHB5MD7IDxHB9zpwXDFD/DiTxK6EFsnqCr3fnvgNoIcw2xs28+35qMNLM0c23GCQG0VuT
	rA=
X-Google-Smtp-Source: AGHT+IFfJYESozBm6lmqmwQYckVZsPvrmKZjQAGskoKR3kcX/WpDU4B4PlgazzUyC9kINZ9mWJlD5g==
X-Received: by 2002:a17:907:86a2:b0:b73:1b97:5ddd with SMTP id a640c23a62f3a-b79c2212720mr286360666b.8.1764678993057;
        Tue, 02 Dec 2025 04:36:33 -0800 (PST)
Received: from localhost (p200300f65f006608c90d1d7fe637464b.dip0.t-ipconnect.de. [2003:f6:5f00:6608:c90d:1d7f:e637:464b])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b76f5a4b757sm1495412166b.66.2025.12.02.04.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 04:36:32 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-sound@vger.kernel.org
Subject: [PATCH 8/9] ALSA: seq: oss: Convert to snd_seq bus probe mechanism
Date: Tue,  2 Dec 2025 13:35:57 +0100
Message-ID:  <6ad63d5f181f33cbaf815546c398d253b2628da9.1764677854.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3302; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=IJXxFrLhesuRKBYfPk/D4IoDjcQSFQVfJ2/gZsmD+Pg=; b=owGbwMvMwMXY3/A7olbonx/jabUkhky9u1Y7/rw9GJHZZrxXK3jG5aeLdtmXLl6f9cjs57J7J oJhUZWmnYzGLAyMXAyyYoos9o1rMq2q5CI71/67DDOIlQlkCgMXpwBMZHYo+z9loTnr5wcF7uv/ zlq3RKHAVo5P7t/bt3+5vq3ecux0jtWLP1zb1isz5Si28TI5cce5CU8IsRT6zKB3/p6Ajk9PssN 6hgVbcue6GB35HX368QQOI8uc3xyiHkYep+y+NMgx/pSxmSwl/N9IQvrFATPty1t47TkeXtuX2L eJ+R9z7C6+2zH60+13X59bv3KK3p9pTwvNdx8P3NUQlaXwcNniCM3cat53DVO4LPvdGgwXv+r1n rhed0fV4s/B5QZL3JwOMDHkXzK09VM7LmbI9nqlYafFu8W837nidi5f9sXhoKH0CZ2VeSeBYcUc skEnQU/m6S69O1cdPaKfLdnKq/9Xt/HhvWz5irTX8wIyAQ==
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

