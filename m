Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21CE3054E4
	for <linux-sound@vger.kernel.org>; Tue,  7 Apr 2026 15:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775575390; cv=none; b=mqr/bhgev7aB0b5Xou5slMuGQhn7dUUuIqtYxWB6KUiq0aDA8jGOnn0v74ThmJbI7mMAzHA1mXp8Ei1SIbzeYsfLDTOIMa3jwI2qdaYcrQW63nD3q/8PLC0Quz7psnFuHYrieLviHEU46GsoCnx1M1LGy3MxrUHU/K9ifloWXe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775575390; c=relaxed/simple;
	bh=dr9NNaPgzVLX/zcwEHihdZJ0bQ47V8p9Qe3DikgzCnU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lasxqIx4Um4XVZ04us9NlS8D0NH/AhET/pxsvO98VguZ7JZ5sZ3f9IbyZwwqpKpd425EoDVUIYjkoB90cQHu5yN/VDPoOVWvwKxjFwATf3mko8srgPBLbVMLKMu67Cf9RbN1aEe02aVsb77CXDGuPqvuIlch5jk8bun772lwzY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lbsZZaFb; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lbsZZaFb"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-128e4d0cc48so5520865c88.1
        for <linux-sound@vger.kernel.org>; Tue, 07 Apr 2026 08:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775575384; x=1776180184; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MjRb6q+G4O7wtmDOLW3dJ2X62b3Z+1AffOhEFuKUzJU=;
        b=lbsZZaFbSsWz/vDfsINdChIhanJ5/zoUlElXC78/ixQoSXLtUIvvKxsM3Xog9FN6PB
         FBEY7KQr5o01H1VUKjr63NnvFI76gzI09srxIG6Xnhxs3WqWW0S+2D9/cFabI920wUHr
         418jEIKF2NmPDQxzF86X+28LlddukRDXQIqeApkwIvXwVoekbyuimnE+VlH+xkDX/xyd
         5qJbHlvEtDGiAK+DooY+Ckila7ZqDua1v+jJjyzAcQDRTx55TlECx9hgFeT28AyxjSDf
         pSLJJqX8EAFap1RqhYviCQDm5KGgq/qzD9y4jtk0z6Dx6zwOPWUk+N6qSvEqKx4XBbUJ
         Nq7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775575384; x=1776180184;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MjRb6q+G4O7wtmDOLW3dJ2X62b3Z+1AffOhEFuKUzJU=;
        b=MpaW6qtUPL3fzg9UFG6yhHt92dGBSHBrSPqNzWXlpiCtHiL8D0QTnYWDllNKSOTwkh
         XxHtjfS/UTtYixcm312181bXPSwCXt9LJCSqdHbjAp59cnqgOZV3ib5WTPZ7ioB0BOTo
         Br2skkN6sIBLcSXsSJm1cgZyupuCtU4jHXd4+X6y//FIe/EhmdIE8oM7aVt8eMWorX19
         0nR0VJOGEBfSlf4RI9ZWrgx4ONOW4WvSHKG500GMlK7rKY080DlES2jTy2Oljgd5naFl
         MoRrDBSCYweYf55QZGNNRh95bY4WrRlFQX++9nDXr8SWp42GL1pNekB4ZDwFZ4bGkAAM
         Mt/g==
X-Gm-Message-State: AOJu0YzFfm+YvJGg/9q6ja4GkATfm78TOOulKXk3BMBi2UDMIYY8rvpO
	B9HPtqyV98dHp2fMTjigt/6ljQt9yxHUUnzKJttG9NOtT2sUND3bzYIQ
X-Gm-Gg: AeBDietw+smTSyqqgpwPJxWGKJUYUjXixwzOidiiGLMpQRpEwCqVWjN/YoIcTFbNJEq
	aaqdlGN2oOffgAeDvsr5iYmfB5vxwPSyW/JbTTKWgy5PEDF4q4Tp1hXd1P2JPPgyXrORCp8Dld3
	dTqMkXvVf5QKAJ+tk90WFTxLDpmYblEt120GLrqffQ8ZjyvmFS7uRCmQsURaSCRrITE3wAKvdrR
	W9lQPb9qcqsAr1QzxFKQFmgqlwUlyQJGUDjzljkfcjVAG0oVUxF2jTC3pYbNOnPgF3anNTd6Fhq
	JmllwQ/TRwsUEKiRUvMlDzR5UJAZr8pRn9JhQaig0jta8psa2yu4LzpwUXnX2Epb1HF0ZZ69Tcm
	+aButj335fKHc9rQVCRnrAERwEf7QjUAddY2PILL/sbxqVD0GQNxHWsYaKKEOl+qOwJdEHuwuK+
	+V5NB2o1Thftxd0C7HUworYoVfqs0cPFnH3m9PKyVrcAZMFwXDeOrdXGKRIk0+KRb+y62tY8YTG
	QcZ
X-Received: by 2002:a05:7022:49d:b0:12b:ed30:5a32 with SMTP id a92af1059eb24-12bfb6e7d5cmr7269868c88.5.1775575383667;
        Tue, 07 Apr 2026 08:23:03 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-167.user3p.v-tal.net.br. [177.4.161.167])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bed93f861sm20628473c88.0.2026.04.07.08.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 08:23:03 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Tue, 07 Apr 2026 12:22:50 -0300
Subject: [PATCH 2/3] ALSA: tea6330t: add mixer state restore helper
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260407-alsa-interwave-pm-v1-2-80da1151f59c@gmail.com>
References: <20260407-alsa-interwave-pm-v1-0-80da1151f59c@gmail.com>
In-Reply-To: <20260407-alsa-interwave-pm-v1-0-80da1151f59c@gmail.com>
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2357;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=dr9NNaPgzVLX/zcwEHihdZJ0bQ47V8p9Qe3DikgzCnU=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJlXFf36J8u2rbDnmMpx6ODGhXXrb9jfizqdYh12f/sx7
 d9RESYqHaUsDGJcDLJiiiyrkxZZ7ul6cLU+boUHzBxWJpAhDFycAjCRF78Y/meXttzt+LNdKOEo
 S1zD7tf3XjJbumgVrj0Rlv5tp3r4tGeMDN9Ugxr+1Kzd77/8dda5R8sMWRYyF5g/eetxcFtFp8Q
 Wd1YA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

The InterWave STB variant uses a TEA6330T mixer on its private
I2C bus. The mixer state is cached in software, but there is no
helper to push that register image back to hardware after system
resume.

Add a small restore helper that reapplies the cached TEA6330T
register image to the device so board drivers can restore the
external mixer state as part of their PM resume path.

Take snd_i2c_lock() around the full device lookup and restore
sequence so the bus device list traversal is also protected.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 include/sound/tea6330t.h |  1 +
 sound/i2c/tea6330t.c     | 39 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/include/sound/tea6330t.h b/include/sound/tea6330t.h
index 1c77b78f6533..3a34033d2aa3 100644
--- a/include/sound/tea6330t.h
+++ b/include/sound/tea6330t.h
@@ -12,5 +12,6 @@
 int snd_tea6330t_detect(struct snd_i2c_bus *bus, int equalizer);
 int snd_tea6330t_update_mixer(struct snd_card *card, struct snd_i2c_bus *bus,
 			      int equalizer, int fader);
+int snd_tea6330t_restore_mixer(struct snd_i2c_bus *bus);
 
 #endif /* __SOUND_TEA6330T_H */
diff --git a/sound/i2c/tea6330t.c b/sound/i2c/tea6330t.c
index 5341907b85d1..39c5e87c6ab0 100644
--- a/sound/i2c/tea6330t.c
+++ b/sound/i2c/tea6330t.c
@@ -356,5 +356,42 @@ int snd_tea6330t_update_mixer(struct snd_card *card,
       	snd_i2c_device_free(device);
       	return err;
 }
-
 EXPORT_SYMBOL(snd_tea6330t_update_mixer);
+
+int snd_tea6330t_restore_mixer(struct snd_i2c_bus *bus)
+{
+	struct snd_i2c_device *device;
+	struct tea6330t *tea;
+	unsigned char bytes[7];
+	unsigned int idx;
+	int err;
+
+	if (!bus)
+		return -EINVAL;
+
+	snd_i2c_lock(bus);
+	list_for_each_entry(device, &bus->devices, list) {
+		if (device->addr != TEA6330T_ADDR)
+			continue;
+
+		tea = device->private_data;
+		if (!tea) {
+			err = -EINVAL;
+			goto unlock;
+		}
+
+		bytes[0] = TEA6330T_SADDR_VOLUME_LEFT;
+		for (idx = 0; idx < 6; idx++)
+			bytes[idx + 1] = tea->regs[idx];
+		err = snd_i2c_sendbytes(device, bytes, 7);
+		err = err < 0 ? err : 0;
+		goto unlock;
+	}
+
+	err = -ENODEV;
+
+unlock:
+	snd_i2c_unlock(bus);
+	return err;
+}
+EXPORT_SYMBOL(snd_tea6330t_restore_mixer);

-- 
2.53.0

