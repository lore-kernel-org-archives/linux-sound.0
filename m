Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8472B2D3A75
	for <linux-sound@vger.kernel.org>; Sun, 23 Aug 2026 01:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787450086; cv=none; b=UbWpzG5dEj5r0Lap2ozM5kR9Vq7fjIiB8iU+p8J3SHkLNfbuYw4e4XYkj25e7eJkuoippriyUYlhv7XGXHdtisO5KQ72aIneLPsRzxbgMSXc3Cpv6dcj4dhiAIVjCVPWv4JhHM1kUd/wlPDKmnJiUNrTD4SQTmRKp42pdeLOiJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787450086; c=relaxed/simple;
	bh=Fydxm7LFG1OM9nE+cl2166H6gpVZu5Ll3gnC5jKJD+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tQuvyA8Shkzz5qiSJ2XRIhC5CP1WBYY+O1uy21PG1SAivm/UVT4RjFmjJspQWpkrqbz1y7R30xoSxwI/UXYF5R83Ebg21vfcKnXsgjAHwoV/Yn25LWoMk7XYMjiB17esZgHp0kl+NZJLlYoftq8lKL/F1H3iYTierENA0oQNNrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NhBKFBmc; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NhBKFBmc"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7f42ef0b693so1484258a34.2
        for <linux-sound@vger.kernel.org>; Sat, 22 Aug 2026 18:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787450084; x=1788054884; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O7UaWW26OVfDq6np7FXz7yd23XYi9TgXQFkbLz3wFKQ=;
        b=NhBKFBmcRp79rUpnpnxWNesc77DFgt+eZrAn5wr50S5m3S8nQ1+aG52qeUX/1nv93T
         TdZf4TCT1tiONlhaiFa78Tg1/sxz9BDmN0PDveDtMvLS5nfQBq+eSrxxvnPIbsAsxNXn
         vKBvsBbXNUmVD5Ea88991eiMTa4RzZ1rwTOdfXQ7U2y4B8K1TwfWSjBiKDjGq/5E6O4w
         FP/zlqJFOehhqtSZEjF+tGS5c4y0iIGGt16XrDP3v7fRNLdukF+4/8yxV6K2otxvRqN5
         JwQE25Zon80imOBxoEtWnRCsQavFb9aOnGe5HJPaTQOVuABGwg75m/Bn4HgEWFZGut6l
         P3iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787450084; x=1788054884;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O7UaWW26OVfDq6np7FXz7yd23XYi9TgXQFkbLz3wFKQ=;
        b=CXecB+eJGxh4XLDefYsVr9uRDH5KEMTvinZPJq34cDUKlkvJKqyDHfkRGb2JJte9hl
         sFnTixAc+AOzLZHJBVk74mtg07lLKV2zeF44JNTg3vCH/HzMRygMvnu4l/HHbgbddCPe
         7CGi4pDR+0suwiG+Og1Kmgy5mLLz9x/LrI3bCqI59wiDpe6V7K98a+oqhLAEDGhu7VHz
         0Kougb8XPTUaaKPgJhHU7nN5pgl7ugFU+nTqGgROIiBxtNZ5FTu9zjE3Pop/KZH6sU/3
         Ul5PzFsQS3bSEV9t9c+MS72e1vcAdbP0QCcg3DSpxgs0DWtj+UZS3ydlushfRzPibAjI
         o+ew==
X-Gm-Message-State: AFuF++mvTCvFopCDlVX9oencq4BkUdbRhhHqVoZVe1bAI0+GQCIeAurp
	u9eYhBmWUQlt94LmT//8dvM1ztLtdolYPQXhqBV+ScAbKsKmzTale2qVrCjrbQ==
X-Gm-Gg: AR+sD10RPwf0Wl9g0ufw1aF+ZxH/De7Jymv437rcOF9GErnvAAYuJVUk6K7uLtGMfow
	0XKTkr4FZjIXbMBglj98XJLMmBBIPisIN0s2nVwbrNCt6hWAWzT/D0b2zfzNj8msYwIxtEZ03Rt
	56CdhFXeMJcxaTrdbj09zHXD6BE58Rwkku1+y31keHdqnN2pYtUnHq6Jv6nBK97DGaAfVWBbqvh
	zMxDZHRM/uNE+rbkUUSp7sL9EknC+5tArf3LmNd10CFUcT06phBRI+Mee6qpM3HRiFAVyWjXFM4
	lYFkapFo0dUALJsw7FD9irNpMxvvUA3U3GB3PfJoPhVTMLseuuCuMexccwCFKIKqzPH7KMvBOtr
	JgGIOLw8r1qe8qbK4qUoRo7DDFf6oD0v1fuPR4XRZvo0i90MyyYKh0Uf+jtZMKEbG2YNYCaDxmV
	X0PgW0HZwLB80t7RoHJ6slxQKK7H2VH6RvASLWdIy4rSSNYa4qnX2mmFO/Q9rZGYACvX2CSxSvW
	xfD5g==
X-Received: by 2002:a05:6830:6d4a:b0:7e9:cce4:803b with SMTP id 46e09a7af769-7f47644defbmr10486786a34.8.1787450084309;
        Sat, 22 Aug 2026 18:54:44 -0700 (PDT)
Received: from localhost.localdomain ([2600:1702:4ff0:baa0:5054:ff:fe3d:4ddb])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f48fc4e6e8sm373562a34.18.2026.08.22.18.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 18:54:42 -0700 (PDT)
From: Will Porter <mrwillporter@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Neil Andrews <neil@androos.io>,
	linux-kernel@vger.kernel.org,
	Will Porter <mrwillporter@gmail.com>
Subject: [PATCH] ALSA: usb-audio: Add iD14 MkI to monitor-mix volume quirk
Date: Sat, 22 Aug 2026 20:53:53 -0500
Message-ID: <20260823015353.686080-1-mrwillporter@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the iD14 MkI USB ID to the existing audient_id14_map. This
names feature unit 12 Monitor Mix Playback Volume.

Live meter A/B testing on MkI USB ID 2708:0002 reproduced the same
asymmetric attenuation seen on MkII. At ALSA value 104, the right
channel was 23.07 dB below the left. At 127, both channels were equal.

The misleading Speaker Playback Volume name causes PipeWire to adopt
FU12 as the stream master. Reuse the existing map to keep the control
available while preventing that selection.

Hardware-tested on Bazzite 7.2.0-ogc4.1.fc44.x86_64 with this change
backported. ALSA exposed Monitor Mix Playback Volume after module load
and USB reconnect. PipeWire volume changes from 100% to 35% and back
left all four FU12 values at 127. Channel-isolated left/right playback
remained balanced after reconnect.

Build-tested with CONFIG_SND_USB_AUDIO=m using the focused sound/usb
target.

Assisted-by: Codex:gpt-5
Signed-off-by: Will Porter <mrwillporter@gmail.com>
---
 sound/usb/mixer_maps.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/sound/usb/mixer_maps.c b/sound/usb/mixer_maps.c
index 8046d5987d5b..ace4ccad8f51 100644
--- a/sound/usb/mixer_maps.c
+++ b/sound/usb/mixer_maps.c
@@ -505,13 +505,13 @@ static const struct usbmix_connector_map gigabyte_b450_connector_map[] = {
 	{}
 };
 
-/* Audient iD14: FU 12 advertises Volume on only 4 of its 6 logical channels
- * and sits on the monitor mixer branch, but it is traced through to the
- * Speaker output terminal and gets named "Speaker Playback Volume".  Userspace
- * then adopts it as the stream's hardware volume, and any setting below 0 dB
- * attenuates some channels but not others (20 dB imbalance at 80%).  Give it a
- * non-standard name so that it is no longer taken for the stream's master
- * volume, while remaining reachable for anyone who wants the monitor gain.
+/* Audient iD14 MkI and MkII: FU 12 sits on the monitor mixer branch but is
+ * traced through to the Speaker output terminal, so it is named "Speaker
+ * Playback Volume".  On MkII it controls only 4 of 6 playback channels.  MkI
+ * testing found asymmetric attenuation within the main stereo pair.  Userspace
+ * adopts this control as the stream's hardware volume, causing imbalance below
+ * 0 dB.  Give it a non-standard name so that userspace no longer treats it as
+ * the stream master, while keeping the monitor gain reachable.
  */
 static const struct usbmix_name_map audient_id14_map[] = {
 	{ 12, "Monitor Mix Playback" },	/* FU, partial coverage */
@@ -602,7 +602,12 @@ static const struct usbmix_ctl_map usbmix_ctl_maps[] = {
 		.map = maya44_map,
 	},
 	{
-		/* Audient iD14 */
+		/* Audient iD14 MkI */
+		.id = USB_ID(0x2708, 0x0002),
+		.map = audient_id14_map,
+	},
+	{
+		/* Audient iD14 MkII */
 		.id = USB_ID(0x2708, 0x0008),
 		.map = audient_id14_map,
 	},

base-commit: 7e77c09e23dae1ff8bd8598c3c96f9db6862eddd
-- 
2.47.3

