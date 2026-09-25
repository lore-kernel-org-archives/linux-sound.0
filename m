Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249B83E0092
	for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 17:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790356062; cv=none; b=rCBW//SdXK2Tdl3TETNgssHmtG53zG7gKdFZcIyDwbHe3p8QEXdOH7R5KgzIP7iAB383W7oM0f4Y6kf0Vlc4CZvQS51SU13IN2YnoqjMq73NFQunhD8/BlTVWKMxXYlV9zVigVT9cTNxDlX8PmQBVWBH9q2/xOmMbxRQE2Zf4O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790356062; c=relaxed/simple;
	bh=l1m4b+1Tuj3AgpgIoBKvDCu/Rg9JYV3MfKsBgahuR1k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uqz7boDO/utte04T32vl5dZGHAwi9VE+ji8MabzmuZqg4zAkoG6cJJmNa13stygDAlvAX8c1gKttoX5ECb/+ZP01XsmhFQt/v7NJatTFcQciyF85hLin7gGhx8PjHa5CwD8auSn4GsT04Uofi/6ndkK/7URELhjQB3TBvWSvF1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VFA4F7RX; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VFA4F7RX"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747eefae4so3031055ad.0
        for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 10:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790356043; x=1790960843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7VpcBNdmrVh0UXb9yrYQNO/worK6M2KtwpnxLGH9ufo=;
        b=VFA4F7RXNlX/fzso5qNA4O4ygIYgbD2ZW1MW/C1gkBVOizaef/33LSgByFUkuam/pb
         kZrUGC8ihuNoy3vl+MLPXTNU6uiQ1jvj+ilhS+RPWl0OIU+1jQOeXqW7d7ylrFHvmwRt
         BBkyPflupe+ucrwDzobAIeOPS5qvGPOCWee3dSbo/8CqcroP4wwYK/8xf59R1RBvjtxv
         v8oI1b+1xq2llr6QZdSPadqmgvRKFd89ClFBWM8BREp/iyQbB6oHUTvsgMcLKZxiP8hb
         vttLE3wHQxAch7smlYFsowPoNI+BlBc376LL25OJEeLvvQZxkBa33HzBOGA8HUT4cgh7
         gDdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790356043; x=1790960843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7VpcBNdmrVh0UXb9yrYQNO/worK6M2KtwpnxLGH9ufo=;
        b=KY55tS8jropbfrYpsvYjx+3Lfhj6MEViyhyNhHjLgGZhSCpA7reNsyNW7Gwh/dqfZA
         qhu0XiZFr52KVW18Ad9ms9JDu9RV3AvqA6K8iRZrfd8BtNzg9c92ZknW0tvGRldjcA6z
         cCao1GQ6X+HzmcsuRjup85IxjkvODzTLZOiizmqe6NLdN+RxGRxKMfta1NcMy3RyRFpz
         oek/tkyLKVFDMISuJgvgZ9hoA8Rvuamwtlz3jLe+GLeklzFlNdrnbNQteppo/gUd6oYe
         kWaOHkYIo2n5ZHChS0JvSK9DmokzayklqpOL6pt5dCABQyfiogYvpn7ZktYevyP21Mil
         4lsg==
X-Gm-Message-State: AFuF++nkxs4BT1xsqnP7KCZ/vU5BpduvJwd8ChFYiAgrLkRyQo1jp9z4
	dBpKNPfBYx/YwGRKg3o5IJWXUH753kk2l2njZjlcTk9wL82w4aKYq7RQvbMC4w==
X-Gm-Gg: AYBFou1G+HvfCUGp6rpOU/972WVoHb6UXbxYbNRd85oLX+jb5W3Gr/zYeo2+9mfNgGa
	nY/xYyVSPBEi1XnSvlFX0hwKLCyWscEQi4O2HfotTTSUEwT9HnY7odTvT9NoxAcHmbdwxjQ1nWu
	F+SeVIUcFkI/OgfiZTPvotHTRHhNA+rjDGmxxAn7IJnB0owmqdOw9gzf8GMh3f9VG9zPcOgeBbd
	EYH1WHGCkGZ0yGwGqPyQSz17Q/AM0UfQudN3KrkitrtEOVuhByf++NlG0QznV6IRVp7rjaxEeGN
	S+pr2Sf0ja2v2nIXZjDEOfLFD1ndX6UASutvh3E4Xer8IPxFvQ8eHa6YWhyFx2niESx60cPGvJk
	GO4wdU0LDJturouMLJQovfvs6qCK/egiChO5woQ9bGipAg94QmHE7BMzoY2O/6sI6yXhOGggAH7
	SeJegZoNi/Fxqk8AYz7DaXPn2Byt7CLf7H0XzHH2wywp3v0HvPAMOmXCexqJFl7FPaN7wxmkYhS
	0tHuV9PHrjGXAB42iX2gyrkA8Gs
X-Received: by 2002:a17:903:2345:b0:2dd:c100:2521 with SMTP id d9443c01a7336-2df7e3b3ff9mr40533265ad.42.1790356042978;
        Fri, 25 Sep 2026 10:07:22 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:1d4a:e90:6850:49fe:a642:bbf3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df91401161sm14190205ad.36.2026.09.25.10.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 10:07:22 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Daniel Mack <zonque@gmail.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ALSA: caiaq: unregister the input device when probe fails
Date: Sat, 26 Sep 2026 00:07:17 +0700
Message-ID: <20260925170717.22462-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

setup_card() registers the input device, whose name and phys point into
struct snd_usb_caiaqdev, and then goes on to snd_card_register() and
snd_usb_caiaq_control_init(). If either fails, snd_probe() calls
snd_card_free(), which frees the device state but leaves the input
device registered: card_free() only clears the pointer, and the input
device is unregistered from snd_disconnect() alone. Reading its "uevent"
attribute afterwards dereferences freed memory:

  BUG: KASAN: slab-use-after-free in string+0x4a9/0x4f0
  Read of size 1 at addr ffff8880208f5043 by task caiaq/4967
   add_uevent_var+0x183/0x3a0
   input_dev_uevent+0x162/0x900
   dev_uevent+0x2f1/0x870
   uevent_show+0x1ca/0x3a0
   ...

Unregister the input device on the probe error path, as
snd_disconnect() does. snd_usb_caiaq_input_disconnect() is a no-op when
no input device was registered.

Reproduced with a raw-gadget Audio Kontrol 1 and a temporary hack that
makes snd_usb_caiaq_control_init() fail.

Fixes: 28abd224db4a ("ALSA: caiaq: Handle probe errors properly")
Cc: stable@vger.kernel.org
Reported-by: syzbot+2a123f6269da57ffefaa@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=2a123f6269da57ffefaa
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
 sound/usb/caiaq/device.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/usb/caiaq/device.c b/sound/usb/caiaq/device.c
index 3d821fde4582..f604846ec6e6 100644
--- a/sound/usb/caiaq/device.c
+++ b/sound/usb/caiaq/device.c
@@ -562,6 +562,9 @@ static int snd_probe(struct usb_interface *intf,
 	ret = init_card(caiaqdev(card));
 	if (ret < 0) {
 		dev_err(&usb_dev->dev, "unable to init card! (ret=%d)\n", ret);
+#ifdef CONFIG_SND_USB_CAIAQ_INPUT
+		snd_usb_caiaq_input_disconnect(caiaqdev(card));
+#endif
 		snd_card_free(card);
 		return ret;
 	}
-- 
2.43.0

