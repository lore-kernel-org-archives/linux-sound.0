Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518713BED09
	for <linux-sound@vger.kernel.org>; Tue,  7 Apr 2026 15:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775576166; cv=none; b=DDd2E2KepB2l5fvp3VMP2lqyMI7BXLhlcld9/RY+cM8RdjBCHx+VSXaUk//3PSWPSTOHmqUtKnP+67ZWibyImXEfe5Wz3yu8g46j5jF7rwJrBjXgiMRQnvda9p1QGiv0EST9ou/+Mj42TySSaFA+tf3bWLONdxbPfp8Zs4vBVZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775576166; c=relaxed/simple;
	bh=dr9NNaPgzVLX/zcwEHihdZJ0bQ47V8p9Qe3DikgzCnU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FdBB8AM6iPkmz1r0F/L+NcGjPXUVvgdN81Pv2/iq90cMH5mTHymiXO4AZ3NltUegOyze7xy8NjY+Ddd8hdi61K9caBl7iTJpHhCu0vc6aSJSoi+oSBWljLwCISyRChvGkC6KOEvt4lxPUszOkEC1oMZP5ktmFBMF3BwM7v2mttA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sRAIQ+JY; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sRAIQ+JY"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-126ea4e9694so738323c88.1
        for <linux-sound@vger.kernel.org>; Tue, 07 Apr 2026 08:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775576156; x=1776180956; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MjRb6q+G4O7wtmDOLW3dJ2X62b3Z+1AffOhEFuKUzJU=;
        b=sRAIQ+JY/NSSioku6Itd95Xdgbda43o2uZUoSkAscPKWj1+AyxIYuaAth6/qYG+dZt
         FQNPl8OzcY0441b4SsJqq+nRtHkBx37tfwhyiE525mwGJIiZlt81Mqw1ZJ/EnlLRzhe8
         xuq2zA9eP1d71GOdv3a+YKdln9SVKzqlJir7vpOx6uBY030dfc3Gk93CyT2PbrJoKieM
         hA6xjVzD6UqQPelTMCNmibACT8PessD/6WDY0SxLDBHNnGTYcnH1jCGCaJETLUKcVSAH
         2KzM/PhDK/TKC/wT+EkbS3P0rt4Yf81efv384pcvHLTVh2JYKN48vPUayhgnoCmmUzxw
         HU9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775576156; x=1776180956;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MjRb6q+G4O7wtmDOLW3dJ2X62b3Z+1AffOhEFuKUzJU=;
        b=OzA36Dm2QEvLlIE+42gzsBM8YgQuyjQgN/tMMWFqLCqu4MhDMLBaVmEqIXC8jr0w6D
         9sEPjYA1G4uSkFoH8+NNlbEwXxHs4QVA5o6qbCq7150AKDd3ik15c88mhbIOoBQKemTv
         dfJuYdcuAzfBmvtE2eV9+rAqxi+mMeHCMdzKTUwkMzgWnNPjCsFCQh6r9t+hOpDoLxp1
         Bif2/rIqLQSWNZZU+0GqKfSShsvuyjUGAvTzDG3JW0OQWz2n6Kcay0NFXJQs02oSF+Iz
         FAw2Afjn43DkWDyqo0FZKfIKleymw61G320/kEb9KZfZe+UyDGRjMujGbaDRYZL8nWSS
         K7gg==
X-Gm-Message-State: AOJu0YzSPSOjFR6di2eYd8kqQyUX6pnH+rUqE8WDaufs07qYeGv7mX65
	2WyGzXPfzmSsWgFh8M3bDIXUuAAlXualD4f4X2XqGGpYbLLQyv/Yl8Bc
X-Gm-Gg: AeBDievF4gT301PYT3zMQaMSAe9TMwWiqBcMkwBpEB1vdOwoxxl7MhazKtVQaUO3wQy
	jtllLfcc06/88NaVeJp/3d85hjYVX8VYsmlXp+eoxyYhp+zbiu82wvg1VC0JLkxqmVUiiGLZ5TS
	tkh5XPitv7zz22jW7DOhcR64T7rfoWqsBMB4sc+IVHcyS5xGeztRY8Dyg0/TWyKKIoIeZ5WLPG2
	BXfODGbCcVRmeWEeDbZTBcxJcBkp8PDQ9rRt0WPtNHEXYwR4QRjfu3Gu48XldX6dr4DmtJcvwEe
	ucNKVMC03+Yb0YMyQRgD4kCa+lY0NvyRvruk1TjTEoto0ZgcMxiDD1eqbBE3xRpxZgZ9WxtwCmr
	UlBj7wvG1yOA9EnZ8CyUJY9YXELardZo2Foa4W+RQGqKnABwC9ROtNB9Nbxpt9IK+S4c7jX09Wb
	X9sTd97jjvM5/phb7oJUuBCfxiPEx5el12hyo/WBHJ5+ENv+U0uMSzz4Qe20/K0d8wA3BWjOnM/
	TOw
X-Received: by 2002:a05:7300:6d07:b0:2c4:ec89:be7 with SMTP id 5a478bee46e88-2cbfc07386emr10247322eec.23.1775576156001;
        Tue, 07 Apr 2026 08:35:56 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-167.user3p.v-tal.net.br. [177.4.161.167])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d1b152f3adsm2918397eec.20.2026.04.07.08.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 08:35:55 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Tue, 07 Apr 2026 12:35:42 -0300
Subject: [PATCH v2 2/3] ALSA: tea6330t: add mixer state restore helper
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260407-alsa-interwave-pm-v2-2-8dd96c6129e9@gmail.com>
References: <20260407-alsa-interwave-pm-v2-0-8dd96c6129e9@gmail.com>
In-Reply-To: <20260407-alsa-interwave-pm-v2-0-8dd96c6129e9@gmail.com>
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2357;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=dr9NNaPgzVLX/zcwEHihdZJ0bQ47V8p9Qe3DikgzCnU=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJlXVYJUIp8vvvfz9f/ZxnciHubukJDRcl+5PixlWiSHN
 tM0QcdFHaUsDGJcDLJiiiyrkxZZ7ul6cLU+boUHzBxWJpAhDFycAjARjXcMPxlbn29ITlsy+4jG
 QuEPfQrvu9fFzC1wq171wWXZ98wfv7czMuybcWJFzZRwia1ThLIFrV3LpzXcLn5xpX3T54x971L
 enGEEAA==
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

