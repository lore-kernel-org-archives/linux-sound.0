Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4E4449EC3
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 16:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782748995; cv=none; b=q2EYNoZVUgWEnJ9x2FujrL92rV5yBJMblJsyTsGAUxi6nNDJ9ijblRYug+uu+UE6IIS/2KFq6biv6H8b6W+saA42hssw+Jw2mrVHgOAqsY/r45Yg/ozooKTfMmJCUzn5W7XRNICTi3OQW4sTgFqy9N5kFhVXeC+t2v00VNDL4JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782748995; c=relaxed/simple;
	bh=lQmecfKWXMNpAC1+Cnv36CUgf5YpezZ1D5mIRnH5Eeo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EikvuOheUMhLIlrIt/nfBPoE5Htfg4cJfD48qUlMYF4a4FXSH0zScHjFP28t4J8dC8gyINKIbvrIHC7dx7o2CswTtYeN6/owrNj3tVf9L1h9ZAJ1pL5Pr8PAPTnByB5B7vSyJtrhGNhqvVmuQR9A9FmWszHKn82vsOxx/afZ8pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LGm+x0Qp; arc=none smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LGm+x0Qp"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-664d4478a64so1371386d50.3
        for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 09:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782748993; x=1783353793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GXjqjkEnArKhELdb/6igy1wcxHxSmnOWp+uuYS8u7bY=;
        b=LGm+x0Qp10dprJDZ1i/VVZ5ES9R1WT6Xk8PirxUfQb64A8vZ4ZnqVwx0eBaVbbgiOx
         mkHGkUAwSiGKWcURB2e8/cwV0242XNpK3oV0HJvX8cRUh3aQSs9Ki9niMazcd8yVBIcN
         Pk6V5LrNWbhoeOnkmFTjOy/caNaT85YsDT1RqkbooEVy4Kw0e+AP71UM8G9KcEFSXPNZ
         Jdntpg4aFkZGdILrymp8PX+AN4LCeCGrrC+Z/Zhqc+EK/j53cXDpVpGD+7h0a7lIWFDA
         2Aht5kVB4QAhYjcSkMPk0WP+SjC2CvFOdFfrSF9GSjcxvhT86nga5OcjnYPzdHgPThaX
         8HvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782748993; x=1783353793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GXjqjkEnArKhELdb/6igy1wcxHxSmnOWp+uuYS8u7bY=;
        b=kPHRZxj+KbHqMvrBllP0TLmGj/+IK0Zc0O0w4KXJRArmx7kc4AElfe9zR//XVqEvSK
         YMen1b9HR+gB+i1wKX99ZxGf8eqxFQqML8/MiqnAk0HlzGHooJSaJqugy1C83fL3sP1C
         obDyjG6OHuaVSqrDFEdHMGmMoCjwFMBATgeLJBbsvaJ7an/Jz47gEBPrahCSZi5kYkHz
         N3J+7xn/sPhCiNOLZnPJrtn7YTfkbx/jxKF/PRCrYkVOq66RRZKU6b6+Ey9TBXu6r+wx
         uwhrvU/dtmWnN0O7G3S5mj7H6f9hNPzCkiqoPIzdr80YklF0Rph/WUKZI44Vh6J1NzWB
         fClQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq+6FIU+xQYbqvGGfAw2qXN1YUDOXIi7i9H5tQIyoEEPeM3hCU9zOBIsQRMyBYUu+MV4m1iAUph4g7EfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXjmck4piTNyQ8zcvlZKHwsTE/D6T9T15UJNQRc6r2JCJxYJ8A
	KecKPtSnYn8NoBZmTWtRLAHbfm1zee8/SwIf56Q2vqGQsusgYNqrLx8e
X-Gm-Gg: AfdE7ckh4rDWk7ymXgwyTGUwhek4eQcY8DwmHRCxrQcycl/PJbk035LUhLSianAWeVc
	Rh6oK6I/6ESeWT4w7vTSnYmS7MG0vL2YMXNbo3Ackv0eHiYTF6fgnPk6lhATgZJeZvASABxL9hU
	o89rZLcU74F6knbjV5cH6vIPJadH+hRSqJ6w7RdPHkRLEo7lFmumdd4Giu+ZM93RRI4KLP/96FC
	jRFfnbxH9evcDEY9fy7SHKUOL+70hj+24Bx/xdRjcxonp7b/L+7whz1s99NBXOVdH7YHzQ/pi3l
	2Mv2c4R/oW3Plct+I1R2+hOijZrwPsFY4zP99cVfDhf2sHP46vgPpLOkh2p3p9HSvQOhoVXjczA
	Mai67rnHMR8MwwbPmNs1yMhZuv3GHI8c8GjlAhG+jE5MA62Jz/Ah2bhdhVe7SOlfebILjytb9+S
	plF1w3zKHId56W3nE8RdaDNZs77g==
X-Received: by 2002:a05:690e:484b:b0:664:d447:7474 with SMTP id 956f58d0204a3-664f99fdcd0mr159824d50.57.1782748992767;
        Mon, 29 Jun 2026 09:03:12 -0700 (PDT)
Received: from Dev-Null-MSI ([2a0d:3344:52ac:a808:98a4:4381:be45:536f])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-664a4076f53sm4905211d50.11.2026.06.29.09.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 09:03:12 -0700 (PDT)
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
To: "Geoffrey D . Bennett" <g@b4.vu>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yousef Alhouseen <alhouseenyousef@gmail.com>
Subject: [PATCH] ALSA: usb-audio: scarlett2: unwind notify URB init failures
Date: Mon, 29 Jun 2026 18:02:32 +0200
Message-ID: <20260629160232.29158-1-alhouseenyousef@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

scarlett2_init_notify() stores the newly allocated URB in mixer->urb
before allocating the transfer buffer and submitting the URB. If a later
step fails, the function returns an error while leaving a partially
initialized notification URB attached to the mixer.

Clean up the URB and transfer buffer locally on those failure paths.
Leave mixer->urb NULL so later cleanup or retry paths do not see a
stale notification URB.

Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
---
 sound/usb/mixer_scarlett2.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 78fb72e626ca..67a089ad7723 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -8729,6 +8729,7 @@ static int scarlett2_init_notify(struct usb_mixer_interface *mixer)
 	struct scarlett2_data *private = mixer->private_data;
 	unsigned int pipe = usb_rcvintpipe(dev, private->bEndpointAddress);
 	void *transfer_buffer;
+	int err;
 
 	if (mixer->urb) {
 		usb_audio_err(mixer->chip,
@@ -8744,8 +8745,11 @@ static int scarlett2_init_notify(struct usb_mixer_interface *mixer)
 		return -ENOMEM;
 
 	transfer_buffer = kmalloc(private->wMaxPacketSize, GFP_KERNEL);
-	if (!transfer_buffer)
+	if (!transfer_buffer) {
+		usb_free_urb(mixer->urb);
+		mixer->urb = NULL;
 		return -ENOMEM;
+	}
 
 	usb_fill_int_urb(mixer->urb, dev, pipe,
 			 transfer_buffer, private->wMaxPacketSize,
@@ -8753,7 +8757,17 @@ static int scarlett2_init_notify(struct usb_mixer_interface *mixer)
 
 	init_completion(&private->cmd_done);
 
-	return usb_submit_urb(mixer->urb, GFP_KERNEL);
+	err = usb_submit_urb(mixer->urb, GFP_KERNEL);
+	if (err) {
+		usb_audio_err(mixer->chip,
+			      "%s: usb_submit_urb failed: %d\n",
+			      __func__, err);
+		kfree(transfer_buffer);
+		usb_free_urb(mixer->urb);
+		mixer->urb = NULL;
+	}
+
+	return err;
 }
 
 /* Cargo cult proprietary initialisation sequence */
-- 
2.54.0

