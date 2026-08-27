Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E6636B92B
	for <linux-sound@vger.kernel.org>; Thu, 27 Aug 2026 23:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787872925; cv=none; b=iq7BVydAoyJQeDGuiJ5v4rfJgCC/hK7ObVUYSWr0KlAJcfybmKDPiIFXXWvx5ODaZ0GioSKIrtrsrCCLOIiT+er9aLHcmpZFaPqdhiCsJMVMZmBDm+w+jYN1Ve5zwxYfb/aKYH9Tvwvu6gbjbX0G3/MvUMcq1ppfUsC61BSo5yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787872925; c=relaxed/simple;
	bh=PURQP6ZO5l8U5LecyA8nFec2CWoAEjm0KPyDK/TL9pM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C+LnqloI8ZL6gRdvqxwBzOVP8wSVtDzAuBkR3u/mlYu1XG2m7ozTv+LFgeMOBES0x8ZWyAg69KKKYXXKR2YrlyDOlPUEyYijrTUMysvoby77nRY3YWd6mZKZiSdcYXHciuBFawfWYpjFnw8q95MDEh3qUR+NzDqHXdwY0qMPS50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZWZ9D1BW; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZWZ9D1BW"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-4563ac048f4so605663fac.0
        for <linux-sound@vger.kernel.org>; Thu, 27 Aug 2026 16:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787872922; x=1788477722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=17uEs7Ned+dWqz4ZIVhnARGDREWSqKdWLg/j4K6DqdM=;
        b=ZWZ9D1BWZxBYe1ODuWt0Mtpqaz1V2Uvwn7F03fLy0019uebUeYmUkBHho0FS9SiP3D
         6XPZdUeJOG3qzk575m+gDnqIcW3V+w+B4HEUgyy1aGPFbE2pt/P2jB/7n8XQ3b8fcdxJ
         W3XXaapg92W258yWzKP07lMJ5D8g6TYAL4T5iZcf4jV2FO1pt7769A3S35v00xrmaUsr
         jC+kZhw+fzrWXDGA78IDlskuaqC67/tSBMQrcj/ApzmUK09mtMBdXs5Ztmb28VmLdn15
         8wS10InS/Ojx9tv+El7dtGyaVSgeO0FZWgK5fKuvz6JsOQe8Uo01gi9T1ckBnjxaDv88
         2Urg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787872922; x=1788477722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=17uEs7Ned+dWqz4ZIVhnARGDREWSqKdWLg/j4K6DqdM=;
        b=n6YAh2ea1FgMo5pvVwS2g8VrkAqh6oCriK6jwYoF3jBAaXk4X8lsCiBd/U32Iie0cG
         MjUltEkNnMSIv77nP1q2pdPtuTqQnm+cIkwhAHS63xKrYJQggnie6QotBHwqzr4Bso/z
         3HuCEzjTF3HQtTP7A0xlILWsXGs3zkG0Cz+dx4RdqMBMvSHgrlORmioEvAR4FH9cZTeT
         XFObSZW9f1ZdWfXMRlXdposr0X9l9pVug4bGYg3QmJDhhuez3aMXJrjHKrokNg+YNLwK
         yu1MHdr5yDqAfScml/0LgCsncBP/A4NPxAQpKfE1aSrRxXLxEbnK/LsGP3+IFvz6yMSB
         O6Lg==
X-Forwarded-Encrypted: i=1; AHgh+RrpiE0LW95curF0R0ygyFFZQc//llQQwpX4USwyCY7SGam8YUi/Rpzl4xiE2sqr0WkblwgoDA0Sx3ObOw==@vger.kernel.org
X-Gm-Message-State: AFuF++lljGRUYMpUyoBCLuTBRU/sQ+Z5jRQaIPviP+oHShKCtM8ZawnF
	+YEHbFCPJBV5RTR5ZpXTd4m1P4lDOoeSPZhx9QBtfRprcRUH5mK0BtbG
X-Gm-Gg: AR+sD10vwFGuG7zx+t6vMEYJnBu0y4XGDzVaxrtldlNhQBgF9IFLe5pGf/KsFcyNNLv
	3/AaUu2ehSrSvjLLBDF2ysehprz8MRAFib+PJTGKgdcMnIAjSrpq5s/+TGOdxSnOOTS0U8uMKGy
	caX4yvWI2iK4fayN9mMUhFhlL/fJAD/n6Ii/yJ3NtHj3dwoWmet74Wxa4m2tnBDNMlUfQW3Idni
	uhwIJi7tr/AjyxGKRIgZr24+8Y7m/2f0WuPp3wBzbFw3lH4mpRGXZxHIqNO3d8zdLjUNcN4GClq
	CrOp8IH6JihnWkIhl+hQ/0Qjbg6hYIsLB2CW+/R9g3z5gqERW7aaBSMoO1sU3LiGA6gV4IDHtGe
	jTaNBK6q1O3tdXMYvVadXCgDcjMQB6Z22qOrRTkL9TJ4bh1cvzMnaVS/2RVIXSZRZQ5w4xMtOQ0
	kDfQvHASP2PF51gk/Yo4Eh8sjLt5ww3VwNP2rjRsTysn1+5oIgb4zjNDXby29ptesceNKHJnsjq
	ZRhlW3+fbQhZhET
X-Received: by 2002:a05:6808:c3ee:b0:4b3:1e40:6451 with SMTP id 5614622812f47-4b397f09e25mr3397971b6e.1.1787872922428;
        Thu, 27 Aug 2026 16:22:02 -0700 (PDT)
Received: from localhost.localdomain ([2600:1702:4ff0:baa0:5054:ff:fe3d:4ddb])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b38fbfe089sm1589553b6e.14.2026.08.27.16.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 16:22:00 -0700 (PDT)
From: Will Porter <mrwillporter@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	"Geoffrey D. Bennett" <g@b4.vu>,
	Asahi Lina <lina@asahilina.net>,
	Chris J Arges <chris.j.arges@canonical.com>,
	Nick Kossifidis <mickflemm@gmail.com>,
	Detlef Urban <onkel@paraair.de>,
	Roy Vegard Ovesen <roy.vegard.ovesen@gmail.com>,
	fenugrec <fenugrec@mail.com>,
	Frederic Popp <frederic.l.popp@t-online.de>,
	=?UTF-8?q?C=C3=A1ssio=20Gabriel?= <cassiogabrielcontato@gmail.com>,
	Shipei Qu <qu@darknavy.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Will Porter <mrwillporter@gmail.com>
Subject: [PATCH 5/6] ALSA: usb-audio: Add PM guards to RME Digiface controls
Date: Thu, 27 Aug 2026 18:21:42 -0500
Message-ID: <20260827232143.149197-6-mrwillporter@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260827232143.149197-1-mrwillporter@gmail.com>
References: <20260824230302.27965-1-mrwillporter@gmail.com>
 <20260827232143.149197-1-mrwillporter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RME Digiface status and register helpers issue vendor requests
without preventing runtime suspend or disconnect. The volatile status
controls can repeatedly reach these unguarded paths while userspace
polls them.

Protect both helpers with snd_usb_lock. All Digiface get and put
callbacks then resume the device and hold the disconnect reference
across their transfer.

Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Will Porter <mrwillporter@gmail.com>
---
 sound/usb/mixer_quirks.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index a1f5592cc5d5..fc622eb95dc5 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -3480,6 +3480,10 @@ static int snd_rme_digiface_write_reg(struct snd_kcontrol *kcontrol, int item, u
 	struct usb_device *dev = chip->dev;
 	int err;
 
+	CLASS(snd_usb_lock, pm)(chip);
+	if (pm.err < 0)
+		return -EIO;
+
 	err = snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
 			      item,
 			      USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
@@ -3499,6 +3503,10 @@ static int snd_rme_digiface_read_status(struct snd_kcontrol *kcontrol, u32 statu
 	__le32 buf[4] = {};
 	int err;
 
+	CLASS(snd_usb_lock, pm)(chip);
+	if (pm.err < 0)
+		return -EIO;
+
 	err = snd_usb_ctl_msg(dev, usb_rcvctrlpipe(dev, 0),
 			      RME_DIGIFACE_READ_STATUS,
 			      USB_DIR_IN | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
-- 
2.47.3

