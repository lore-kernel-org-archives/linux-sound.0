Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BB334676F
	for <linux-sound@vger.kernel.org>; Wed, 24 Jun 2026 14:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782311846; cv=none; b=KRT5TAq4QfcrBiN8/g5B9iZALWBAVhrAxEPbBtzTT4pYp8HBhOoeZ5jjTLmidX3op9uDBbIcuWJxLKwzDSF0l2vFEzX5+TsLkmrmL8mCRbfab1PMduBdaJ5l/1kEBoJDAZgILVoD3xO/nOpHPvVt9BfKA9N+Tn3o5YA+52F9x9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782311846; c=relaxed/simple;
	bh=6+8dZ25wx9g3BlD/OuoBnUuvzjT9RsOsJ7dDMoA+1Xs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GlWWFJoMhfODGQOuXCGzM3vVYw+kLGhRhQZHAwueaCVjyAcjatVej+IGu11FnwMbrCQN29RgAyjNHDm1W1zwwQVs0GNhla3D2rZc4bsF/hsHdDP5MCS25gseZaSofvXHxNA0qpK9+Z2s7vbLpNXNd06U+p5q6KFa5qhJ+qM5sWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darvell.me; spf=none smtp.mailfrom=darvell.me; dkim=pass (2048-bit key) header.d=darvell-me.20251104.gappssmtp.com header.i=@darvell-me.20251104.gappssmtp.com header.b=PkPKVQk0; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darvell.me
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=darvell.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darvell-me.20251104.gappssmtp.com header.i=@darvell-me.20251104.gappssmtp.com header.b="PkPKVQk0"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2c7e8eea816so2812825ad.1
        for <linux-sound@vger.kernel.org>; Wed, 24 Jun 2026 07:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darvell-me.20251104.gappssmtp.com; s=20251104; t=1782311845; x=1782916645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fhMe8aGptZNdBSKGreM3SCPluJHCPPxWSFXY5vBNji8=;
        b=PkPKVQk079+4JZtaeQ/ElieV2tna1RYzoAF5uw6W3togxjZ+rhBB2juayNtBRyV7Ju
         OyoYawIX+bTPYGc38djs4cPkbVw6fd25W8+bntxvGWoAbKaBkMNj5itzRUGLfmxPTYXB
         UVpnRTEtfzuvWWYP+WLzAkzexSeTXkzTu6slmxBbor6E5AXnQLZQxZejNR+ShZW+scxl
         B/NfsCXlzyNzvUs4RS72hV4L4Uzac5zY8L3iZQhHUCALw9pQyYxS8ckj8BVFZ2XXrlvJ
         lgHem1s4p5bbB3qw85TN/ZPuJD9pk2BgE035XTyxzPP0TMdyhuefK5nrf9bbiXeRIVg/
         5MTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782311845; x=1782916645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fhMe8aGptZNdBSKGreM3SCPluJHCPPxWSFXY5vBNji8=;
        b=Iz+6XRbCBULS/gHntv6hUI4NmCxR8BCUJa18vEB6txPM/fQKkl51yxPt64ZK+l2G9H
         seGbH5yLYoRScnf4mRc8uLl1SiJkCndFRB/hxxMie8siB+OCpTewnoc6qr1VAot7S2Cx
         h0/1+zzMpgD1pDPM/1g1GN5haTB77LrkUiwA2mAomAlA+hLII6WGSeDaQOzL5+4fbRFC
         VrWFlIdwGecX9ORFbn5wzmeIjhwgMUIgAxvGSqisHtyO3so2kQR3TaWf07n78wKv2EB7
         YzXdKfjWLjBOgU/xLo1+wHysSTZ7O7c/vRb22HunZPBtxE61JuViIY0cHi5aENulKFSp
         FIlg==
X-Gm-Message-State: AOJu0YyZLZoqNSMy2el31YPKpcz5jSbotWihJUmqtzfOv/oXvebShImF
	lX8Y/NY2h6suEKEVUZ0rnycRkHsnDl5UUfPnKvrB/Tir10PV7pdScwZ7kMaokodXZNk=
X-Gm-Gg: AfdE7cmVoFGvLK+f1j0jKB7YxaTgGBVlTxfNkTYhCv72qgD4D1Z+GR+xLw9+kdZYMz2
	MP7otZqlBDOZnFqDS5lpMm5TUdxbF9Dd4yIe02w9xfPsb+5dvdzWq62mIQ6Bham4mwQ429ehPIn
	/BCsLn9nfzGFXLd7Lnf5M7g0nT5ZvMqEyt4VoZVWYB59RqSkV0o5o43gHTaSVw9s/FJ5/byqjr4
	FzNuw/qMStN3kd8zNStvxxiekVwjXNNWhaqG/IvIRRc1+cLOwRauiuhCfdhaoYISqsWsKAvQdbi
	sjWmfr21rb7s8HEk+d2AS1QaPXAlJRC8EroNIFNur+hJXe1pi85j+SJtg6CFmecd5Iyj8/aFWyy
	r8+DKtOlEsAPlIkeL+oVDp4Wf6UFDwEC51iHc3E6CU2Fva+bUetBvowPCqs5P7/5sYDLfVExBwQ
	WG+3SrKwRnaGiGvHZlwfe7NvFNCVSrLzn4LgYOeC+o9OcwNzPuaimpoAO4
X-Received: by 2002:a17:903:1b4c:b0:2bd:d6f1:3388 with SMTP id d9443c01a7336-2c7c41180e4mr65435945ad.28.1782311844504;
        Wed, 24 Jun 2026 07:37:24 -0700 (PDT)
Received: from lb.drongo-great.ts.net ([199.45.144.95])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c74478ff1csm141305285ad.83.2026.06.24.07.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 07:37:24 -0700 (PDT)
From: Darvell Long <contact@darvell.me>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: avoid kobject path lookup in DualSense match
Date: Wed, 24 Jun 2026 07:37:23 -0700
Message-ID: <20260624143723.2986353-1-contact@darvell.me>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DualSense jack-detection input handler verifies that a matching input
device belongs to the same physical controller by building kobject path
strings for both the input device and the USB audio device, then comparing
the path prefix.

This was observed when a weak physical connection caused the controller
to rapidly disconnect and reconnect. During that repeated hotplug,
snd_dualsense_ih_match() can run while the controller's USB device is
being disconnected. kobject_get_path() walks ancestor kobjects and
dereferences their names; if the USB device kobject name is no longer
valid, this can fault in strlen():

  RIP: 0010:strlen+0x10/0x30
  Call Trace:
   kobject_get_path+0x34/0x150
   snd_dualsense_ih_match+0x49/0xd0 [snd_usb_audio]
   input_register_device+0x566/0x6a0
   ps_probe+0xb89/0x1590 [hid_playstation]

The same ownership check can be done without building kobject path
strings. The input device is parented below the HID device, USB interface
and USB device, so walking the input device parent chain and comparing
against the mixer USB device preserves the check without dereferencing
kobject names during disconnect.

Fixes: 79d561c4ec04 ("ALSA: usb-audio: Add mixer quirk for Sony DualSense PS5")
Cc: <stable@vger.kernel.org>
Assisted-by: Cute:gpt-5.5
Signed-off-by: Darvell Long <contact@darvell.me>
---
 sound/usb/mixer_quirks.c | 46 ++++++++++++----------------------------------
 1 file changed, 12 insertions(+), 34 deletions(-)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index 50c42a4..912b8b8 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -567,46 +567,30 @@ static bool snd_dualsense_ih_match(struct input_handler *handler,
 {
 	struct dualsense_mixer_elem_info *mei;
 	struct usb_device *snd_dev;
-	char *input_dev_path, *usb_dev_path;
-	size_t usb_dev_path_len;
-	bool match = false;
+	struct device *parent;

 	mei = container_of(handler, struct dualsense_mixer_elem_info, ih);
 	snd_dev = mei->info.head.mixer->chip->dev;

-	input_dev_path = kobject_get_path(&dev->dev.kobj, GFP_KERNEL);
-	if (!input_dev_path) {
-		dev_warn(&snd_dev->dev, "Failed to get input dev path\n");
-		return false;
-	}
-
-	usb_dev_path = kobject_get_path(&snd_dev->dev.kobj, GFP_KERNEL);
-	if (!usb_dev_path) {
-		dev_warn(&snd_dev->dev, "Failed to get USB dev path\n");
-		goto free_paths;
-	}
-
 	/*
 	 * Ensure the VID:PID matched input device supposedly owned by the
 	 * hid-playstation driver belongs to the actual hardware handled by
-	 * the current USB audio device, which implies input_dev_path being
-	 * a subpath of usb_dev_path.
+	 * the current USB audio device.
 	 *
 	 * This verification is necessary when there is more than one identical
 	 * controller attached to the host system.
+	 *
+	 * The input device is registered below the HID device, USB interface and
+	 * USB device, so compare the parent chain directly instead of building
+	 * kobject path strings. This avoids dereferencing kobject names while the
+	 * USB device hierarchy is being torn down during disconnect.
 	 */
-	usb_dev_path_len = strlen(usb_dev_path);
-	if (usb_dev_path_len >= strlen(input_dev_path))
-		goto free_paths;
-
-	usb_dev_path[usb_dev_path_len] = '/';
-	match = !memcmp(input_dev_path, usb_dev_path, usb_dev_path_len + 1);
-
-free_paths:
-	kfree(input_dev_path);
-	kfree(usb_dev_path);
+	for (parent = dev->dev.parent; parent; parent = parent->parent) {
+		if (parent == &snd_dev->dev)
+			return true;
+	}

-	return match;
+	return false;
 }
 
 static int snd_dualsense_ih_connect(struct input_handler *handler,
