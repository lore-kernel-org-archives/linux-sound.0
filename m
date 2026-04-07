Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5A81FFC59
	for <linux-sound@vger.kernel.org>; Tue,  7 Apr 2026 01:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775524944; cv=none; b=lX3z5zxa1eVtih9vpHgR2Zycu5YP+PiIaG1i6aNmEmVXL6Gnr8pD8dJbYweTi3k9xvw20oYXlmrCmVdUXKZMkzlA2GuP4a4jgyneXSP471pHERUimWFgYhTgYNXV474Mpr9KMHHhS8fQucRAoP3G0h50KPHVBjDq8wOs9ORxrLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775524944; c=relaxed/simple;
	bh=z9s/p5PQGu3avNoLNxkLd/+nY7pGFm6czZmVEulcgt8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vFs/ESu0ZA9PjX2NPNySV45mfbz8ruy7wveZGGNZplIHpXfnAV6J392kQjIio2bFe40ipU+RnsX9FNOGWZ6pEQEUve9o0YzovjCRZM5txvaC/Xx41HrZ5Ct6MQzTf0VEBUz8gLwUcx/XLw0H6HuNy+NYGSC8vc6mOLSj2usijxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CGnvTkmj; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CGnvTkmj"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-12713e56abdso1721984c88.1
        for <linux-sound@vger.kernel.org>; Mon, 06 Apr 2026 18:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775524942; x=1776129742; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ywEzq2jDLbdB086l4DZerwlNKFMBB9GYOjD7yZEzPTc=;
        b=CGnvTkmjwUuJJMTQ2PabMPdx612bYqg+V3JAqglq7+xvJgdw0BiVit/P1gZuDraI4f
         f7u7T+PEahNrXFHcWmu0cyES017mgensusjKen3pLxCVkLJPmISftkITU7DIuLiWPr9G
         sB4wy/FWtAXQFNCUMG78xRHMcSTosdTPDtAnM4VsryICVBPLn9ZNOpnAz6IOTKKUQKEQ
         BvjlzL4dliTJAapXO6q5srtP8XKEPImg3MevBiXGZKQWUXEP7V3Tdl1b5PqwSPwNVHJt
         UbRLCObTkZnMOg2g5wP4DrMC3VL4dZAXI8sxwTuMJF3KPyn9qlGFSNspMsdswSMQi6Dy
         CiQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775524942; x=1776129742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ywEzq2jDLbdB086l4DZerwlNKFMBB9GYOjD7yZEzPTc=;
        b=bB5pXMkdnMC6frwBNTjKopTM401vTa0toK8o7Y0D4CFvolOXk5+TqCacLdcGItBfIj
         Dze458VEiQ76XALZ8ORfvrYlrXT4rVlgftHMZWrUI33pWCW5Oz+/y0SUhxPd3ThGIRAC
         U7/0gEJTUvDirHVFQd9Iohv/UdoIwUM9GiW7ugYEuSpap3T0yhh1511RpiPcxdJ0sWgN
         F9ImHa3uQGQ88dkTUqL4et/AGbAIoK2O8X3s/ZvmjsrqDlJ8iUOlDa8YtGc/+VOtsXJO
         GCmvvA/inX3OJ5Yv8xIAwq5GpPcY8JvMV3EexrkBc4UwiEY64OhijFTIj7RqdSEeIyOK
         1oTg==
X-Gm-Message-State: AOJu0YzTiqCPCyZesPDZ+2vKA6niRdGmuWMRg4sVQ6nYLVLI9vfXAfP3
	qszT+etnBenu4KXvc6IE8tNVGQwW9ZCzIg7M5O40YVJLBgb8corF1z0RlwhXDw==
X-Gm-Gg: AeBDiesuYzFThTQGqVwXG3+W6Ze+1KulT0q3e2mUQwVZ1z0FGNWpGHKB1rdRBVzNNVH
	uUpllMe1xyviK2K6PRWAi48VkMF1Zxss1WOKfI7AIP1c/OMQHdXxEqWR7XCMwAmJQvee9eMpDuC
	xxtQJ8suypOKCRgzm3ZGx/xWY9SZ52m35aOVuS9uVY81mHm8cPlZzqP06zJxWFWuoJQQKU4iLhc
	4fh6GVcyZO99hIOBI8l1uwZK17l1UKUt8AAU9C96ERTscxm4+Beq8fttwNyJwh0CnF1O92+x2ku
	HiMV7ryVs0N6pU2mT8RrEj/wnRCHf0l9XgaOz0eWggnz750slFoQKVR+csGmD32a1GAgPwN1sdT
	ld9fti0bV/h1pGri/8heJX4UHezw3BdumwW7SiM5MSLOKCaz3PRK1r8YCG5REDbHGrQhwBru3P8
	xUoX4zDNGRtd2wdWk3Iq6bSTBvjf1d9j0AupQhyOKxOCpjgwUXiK6K2kUPpd3khOKcBoFAGIrGO
	P5/
X-Received: by 2002:a05:7022:60a1:b0:128:ceac:6db4 with SMTP id a92af1059eb24-12bfae11275mr5149027c88.6.1775524941945;
        Mon, 06 Apr 2026 18:22:21 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-167.user3p.v-tal.net.br. [177.4.161.167])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bede7f542sm13098567c88.14.2026.04.06.18.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 18:22:21 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Mon, 06 Apr 2026 22:22:07 -0300
Subject: [PATCH 1/2] ALSA: tea6330t: add mixer state restore helper
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260406-alsa-interwave-pm-v1-1-6ffa6f317c8f@gmail.com>
References: <20260406-alsa-interwave-pm-v1-0-6ffa6f317c8f@gmail.com>
In-Reply-To: <20260406-alsa-interwave-pm-v1-0-6ffa6f317c8f@gmail.com>
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2121;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=z9s/p5PQGu3avNoLNxkLd/+nY7pGFm6czZmVEulcgt8=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJlXYjwubHR40e0x86aIb1DA7bfLz/IFR668kM17q+moQ
 SdLZJN2RykLgxgXg6yYIsvqpEWWe7oeXK2PW+EBM4eVCWQIAxenAEykpoiRYUbohYCuOpZJfyY0
 FYm1ep34Xuaa9d1fyojpxGHllOOLOBgZ9nhn2/5hsb/D7d0678WxrbuTk7yMdLQ7gpvELrEaMMb
 yAwA=
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

The InterWave STB variant uses a TEA6330T mixer on its private
I2C bus. The mixer state is cached in software, but there is no
helper to push that register image back to hardware after system
resume.

Add a small restore helper that reapplies the cached TEA6330T
register image to the device so board drivers can restore the
external mixer state as part of their PM resume path.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 include/sound/tea6330t.h |  1 +
 sound/i2c/tea6330t.c     | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

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
index e8c50a036bea..3e413929d3ea 100644
--- a/sound/i2c/tea6330t.c
+++ b/sound/i2c/tea6330t.c
@@ -358,3 +358,36 @@ int snd_tea6330t_update_mixer(struct snd_card *card,
 
 EXPORT_SYMBOL(snd_tea6330t_detect);
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
+	list_for_each_entry(device, &bus->devices, list) {
+		if (device->addr != TEA6330T_ADDR)
+			continue;
+
+		tea = device->private_data;
+		if (!tea)
+			return -EINVAL;
+
+		snd_i2c_lock(bus);
+		bytes[0] = TEA6330T_SADDR_VOLUME_LEFT;
+		for (idx = 0; idx < 6; idx++)
+			bytes[idx + 1] = tea->regs[idx];
+		err = snd_i2c_sendbytes(device, bytes, 7);
+		snd_i2c_unlock(bus);
+
+		return err < 0 ? err : 0;
+	}
+
+	return -ENODEV;
+}
+EXPORT_SYMBOL(snd_tea6330t_restore_mixer);

-- 
2.53.0

