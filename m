Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30D429D26E
	for <linux-sound@vger.kernel.org>; Sun, 27 Sep 2026 00:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790469402; cv=none; b=YpX/RKydCCLyj0A9c4mVOMW9BBTIA6H8Ja+lLxhymHK4ZHzZelg3oP+/KhxXK3SgbR30jqTdUK1lwiGU6yEYd42vavvlQWR8EaYiiQhGlvvN0qCpCB0EF9bPHaJTGaitUq1bkwZmmoQhER+81K4Eo7BAqHp/H5u8uEIAAYsdtzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790469402; c=relaxed/simple;
	bh=h0+hWDcuATKDDLHN4h6iV9vBhMwE7TyKm/PBzhkCuqk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t40CuocbMeQBi6ipJ5HT2EfqIGLDAcEZoFwp9EBlF2yYZVzgP2OEMEYtMkrCJDa9yn2gQVN8OUc0b6B2KsHeHX6GkUcrcpMvJKZfEQFMjVNauwA7vyvdoi/FzDvPRoE/XI26whNdaKvYW229Z/T11imILLRcSFv5UXpwB5kByGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CHxp7mMf; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CHxp7mMf"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b8e6ec4e1dso1414397e87.1
        for <linux-sound@vger.kernel.org>; Sat, 26 Sep 2026 17:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790469399; x=1791074199; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eOStFp2MdNou7rOxzqbMyppeAUuhKg3HHXO2Vuv9JBs=;
        b=CHxp7mMf9nMfFVa+mD3i0CD8FfzdxzM/9C9lBuqTg5UZLdzUTXtZbEm/gAQ+ga8uoK
         Rvpb0rv5XfzLzwVmhRTBSaiNSLEfhZ9L3MwSQG3RE/zuhJGWYQJdxnEsGvkvCuMDQYQv
         QuErkYKLUvdFDN9QczpG/YE9nZ8sy7wUl4OMHYaJdf8IeCtfPrrU78rZMq+0RqIRCcWh
         49GkBXBsqneaoh8ZnEKlI/j/BvbXPBtz4bSY3uu2MhG0XAvT321RiND70e+w5Xzrv6fk
         JaFGJtINGtOvYHchZdtIvbR+7FLcPE1KaN4Bpd1M7vQpdBmUYm4P04qBx8GD/BBAlhNr
         59UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790469399; x=1791074199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eOStFp2MdNou7rOxzqbMyppeAUuhKg3HHXO2Vuv9JBs=;
        b=lu/GmWKeYYZ2g4/qhDz5tv2SpIco5YU89UD9Z/dWijUmvMvKFLD+nqrE9UBvHSZz89
         Dh/tlgzeHzL3uMK9sEdiv3d9JPGpxG/vhRJY8pRNh6wlzYcdJBnvjy98ZEKseZd1Gifu
         4rhTc9zK8pIpUzIix9c84ejl6ya/OG3nkvMWet70gzFZV37q13bwgbcCnamLRJxA2JVm
         A4nQomnRiS4NT9UkuYvcvh3M+zj6D6b5TtPOfPuc2uoO3mjCs+t7Ax+ZwzpNvpBRZvf2
         aAXa0wDkirsumt/De9U2ev+2o1J5oSfK5r9k3IZgPJKcBTgJ0gQhpKAPB1eTu/Vr6wEE
         b5WA==
X-Gm-Message-State: AFq9FYL0X0+cycEntS/zhs4UGb29ilRkNCeXtIJhzNK2v21Mhpg9KnRV
	y7vhVp+glqgt8xc3QKVjgIqdCLAT+fTnNCuA2dyiojbE48bVoiOUNGC7
X-Gm-Gg: AYBFou26SHxtlofNJckenex0vegh/8BDabYsuDAsmdn1DJMzjyLU6ZYdzBPsyrtFZ9K
	UwBfsH6qviGlgHEbl4bF09lQLVfMSa93PR2qS5OlGRlNj4Zwsm3ZsOyTKq4AAijwjK3o7YpNhGV
	o15ybWiZ3i+1V7b7N7wZFZC2OP1HRY0O/01u0UCdr9DQv+ojF3mRnPsIGhyC/ix02P0uzlKAzsi
	/VNvMuaoGkG12DEwPHMr1GaFKSyJVmILAGrYfq208fqY06DWvb0usHZa0cKzgU4HEVC07AjUqYv
	lcGu13fHGN1xad1QltUfCuMfpG7n2DhX9BbzdWD4iGz+7Xt5Kbm52aIKRMtgaOswnWuFgJRRrXr
	bk4HU4K4dRZuy+4DXvSU3p4IqFtoBYHNgsYh+pnNEkCJHpV2iTOV78p3mgnrwMYU3YJjpEuXFc2
	lB7GIWdCoYBKGEFwqcFXn09V5IG7sgEt1ikVuz1kfaiSmRMJOj+xrL4hs8Xo9MEhfWsxuhDbKS7
	g30z/zdKx+yl59nMRZH3BrLorm0yGJg
X-Received: by 2002:a05:6512:3f26:b0:5b6:183c:5c9c with SMTP id 2adb3069b0e04-5b8e0a2ff87mr2954491e87.58.1790469398655;
        Sat, 26 Sep 2026 17:36:38 -0700 (PDT)
Received: from Shigure.lan (n30b00u6luibwsaibf2-1.v6.elisa-mobile.fi. [2001:999:2c9:b0::44e])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8e6a8bdf3sm1572795e87.8.2026.09.26.17.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 17:36:38 -0700 (PDT)
From: Niko Huuskonen <niko.huuskonen.00@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Daniel Mack <zonque@gmail.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Niko Huuskonen <niko.huuskonen.00@gmail.com>
Subject: [PATCH 1/4] ALSA: caiaq: Serialize access to the EP1 command buffer
Date: Sun, 27 Sep 2026 03:35:29 +0300
Message-ID: <20260927003532.289468-2-niko.huuskonen.00@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260927003532.289468-1-niko.huuskonen.00@gmail.com>
References: <20260927003532.289468-1-niko.huuskonen.00@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

snd_usb_caiaq_send_command() and snd_usb_caiaq_send_command_bank() copy
the command into cdev->ep1_out_buf and send it with a synchronous bulk
transfer. Nothing serializes their callers. An ALSA control write, which
sets the LEDs on the Kore controllers and several other devices, can run
at the same time as a PCM prepare, which sends the audio parameters
through the same buffer. One caller can then overwrite the buffer while
the transfer of the other is still in flight, and the device receives a
mix of both commands.

Protect the buffer with a mutex. All callers run in process context and
already sleep in usb_bulk_msg().

The problem was found by code review while adding another user of the
buffer, the Kore LCD support later in this series. It has not been
observed or reproduced.

Fixes: 8e3cd08ed8e5 ("[ALSA] caiaq - add control API and more input features")
Assisted-by: LLM
Signed-off-by: Niko Huuskonen <niko.huuskonen.00@gmail.com>
---
 sound/usb/caiaq/device.c | 5 +++++
 sound/usb/caiaq/device.h | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/sound/usb/caiaq/device.c b/sound/usb/caiaq/device.c
index a16e59248480..3e63eecebe00 100644
--- a/sound/usb/caiaq/device.c
+++ b/sound/usb/caiaq/device.c
@@ -212,6 +212,8 @@ int snd_usb_caiaq_send_command(struct snd_usb_caiaqdev *cdev,
 	if (len > EP1_BUFSIZE - 1)
 		len = EP1_BUFSIZE - 1;
 
+	guard(mutex)(&cdev->ep1_out_mutex);
+
 	if (buffer && len > 0)
 		memcpy(cdev->ep1_out_buf+1, buffer, len);
 
@@ -235,6 +237,8 @@ int snd_usb_caiaq_send_command_bank(struct snd_usb_caiaqdev *cdev,
 	if (len > EP1_BUFSIZE - 2)
 		len = EP1_BUFSIZE - 2;
 
+	guard(mutex)(&cdev->ep1_out_mutex);
+
 	if (buffer && len > 0)
 		memcpy(cdev->ep1_out_buf+2, buffer, len);
 
@@ -439,6 +443,7 @@ static int create_card(struct usb_device *usb_dev,
 	cdev->chip.usb_id = USB_ID(le16_to_cpu(usb_dev->descriptor.idVendor),
 				  le16_to_cpu(usb_dev->descriptor.idProduct));
 	spin_lock_init(&cdev->spinlock);
+	mutex_init(&cdev->ep1_out_mutex);
 
 	*cardp = card;
 	return 0;
diff --git a/sound/usb/caiaq/device.h b/sound/usb/caiaq/device.h
index 743eb0387b5f..0354e348e919 100644
--- a/sound/usb/caiaq/device.h
+++ b/sound/usb/caiaq/device.h
@@ -2,6 +2,8 @@
 #ifndef CAIAQ_DEVICE_H
 #define CAIAQ_DEVICE_H
 
+#include <linux/mutex.h>
+
 #include "../usbaudio.h"
 
 #define USB_VID_NATIVEINSTRUMENTS 0x17cc
@@ -68,6 +70,7 @@ struct snd_usb_caiaqdev {
 
 	unsigned char ep1_in_buf[EP1_BUFSIZE];
 	unsigned char ep1_out_buf[EP1_BUFSIZE];
+	struct mutex ep1_out_mutex;	/* protects ep1_out_buf */
 	unsigned char midi_out_buf[EP1_BUFSIZE];
 
 	struct caiaq_device_spec spec;
-- 
2.55.0

