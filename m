Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16162372EE9
	for <linux-sound@vger.kernel.org>; Sun, 26 Jul 2026 06:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785048628; cv=none; b=E1M2B6PaRmIoYXPvrAGuwKEFZ1hGrellhuP4PgKdf1g69oyRTSAIARoxzsej1Ic7bmqvcE9KGmG2ij5mJTdqaRUii667N+GUCV7i61qmBpderSrE7FncwDB8iiFWRXAkDH63f0NqMO1qLL2Cw3yZJ6WEPL7/R+XATeBf+oy2r8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785048628; c=relaxed/simple;
	bh=YqC9iDwpxyUc/X5PROvGek7XpCxoo71vmGdQ1f40fXU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TMZ9hszApIUrIXyCsxyueRI8FvGV6i1KllcJ2nZX36eqmeKz+Oi0tU6EcwIB0rngwzCWho4+tsBZIy5K3tve0XeGxpv8KwUPcHw6zat5cXflfVeXwVyyffOmHycl0U/B/HZ/Z1bBwRIgSd9KAair+IPCrhfgOCSmkHtSWjifgZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xbow.com; spf=pass smtp.mailfrom=xbow.com; dkim=pass (2048-bit key) header.d=xbow.com header.i=@xbow.com header.b=DQAzVio2; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xbow.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xbow.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xbow.com header.i=@xbow.com header.b="DQAzVio2"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8485b358552so1801711b3a.2
        for <linux-sound@vger.kernel.org>; Sat, 25 Jul 2026 23:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=xbow.com; s=google; t=1785048626; x=1785653426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VaArLYkUWmaM9MJAuJdcx0UyuZzpKZG00TXXySfOH00=;
        b=DQAzVio20T5EZcoZH7A07F69ADDcLwJDEn8uvj7FLr9tV3NJXT/bYokCimxg9xq5kF
         ePe9sVZq4Z+RzBP2+SF3XBfnm1Lid4wnJTc1Pxj9LU72Fk6V0fuGzf8OFSo1GBlPKBz2
         +qn/XFMvoFHi1GvbwJV6zQv7m9woByR5peKn2QyZ7qZWuohTuUVkcClSsvIP59lnewG8
         W/WV3P43cNj3nadFX723I+0i5vDua61cdVlVLoJyyQHVGME9L68ad4Z4MTxX6nJmocWc
         kmbbkrnIv2V1Fl4CeO7Uzz2dwA6E8NQNEuTZZngcIgDP6prSj7N3AJ9FUStuKIvNgwaE
         GJSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785048626; x=1785653426;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VaArLYkUWmaM9MJAuJdcx0UyuZzpKZG00TXXySfOH00=;
        b=mvH77lDjS6eympO7/7cixSgr0OfDbYlJOQAEW9mg6iZLQWGR9OyOdPL6IqQwx3LBUB
         hhWkTQ+sgxdOsdEw8NyZqIDarBJ1oJxeHtary2e4iFA6BBT5ROk4J2pQdsb6Nb3I9SFy
         8YL/y2/4wyktbagNJhEVGleID3hOHyeH1amWwoDIJL4W4oC1mM1UJdUeOokkZpyAjQ0t
         pxC8fL+bHBx9Ufe6aukkFD9iaht9lGTrXb1kjAMFx0d+RYnDraba4dWT3WC/03Ngl7yh
         8NEVtP10anb1PHXH3omwQ1nabrnHmG1VQ9+qggQgVZB44Qc9TtDwA9wU2NV3x2aVBYby
         Bt/g==
X-Gm-Message-State: AOJu0YyHlelkA6p/kLFGGUWiKFZ2Zq4i3VzfcrseZUGvkG3gNfOfStP+
	kIFvR4B38GiIarXGWmMDEtY327MFH3NlUX5Ssf46S2gYyk1oNNeMfN8iwRfyFOzq0cdv3oaMf2e
	XDpeN8JU=
X-Gm-Gg: AR+sD11KifPAa13D1AhDdo7xd/i/CC9dm7ymx8M+m9SLDuGcnuNSmTAI+fN8U1rU4FK
	EVmXThgp/3esseDVsEgG5TxBctXyL6JmGJIq3OkMXcGi227mThpt7CddJozpDWM6rltxzX67Gr1
	luvGC8/B7KCknjAejUK8Br31GKfqlmBAKQvEuo3rJx21tR8PwokRr9jvIIekZzGunv+35B4Xm3o
	DZ2YMHUJ39U0JcfHpFgMSFVH+m84JhRgB3laV+T7k/1zP+XwJ9+Fea8CPSOdsQH72dbK1NHE61p
	4AZsNCr3VHPoGSaIOaYO3x9yLgeBf8/bjK3kiJ/7/WFb8naIZo4yThrCRf+3J97wOQlBtc67wws
	XtuKC0FOUydBFDHneJNF5rXpLaNB6HDJvg19R6N9bTdKZ4gsTpTJbi5t99jPYarIYXwMqZV6yV9
	VepFbz3gh3e1NCYGcEgYa7LXTpXUnMLTQuq4xOeJzPUVu4WMxfJWBPAvJ5B6OjloIOAZaCIbU=
X-Received: by 2002:a05:6a00:1ca2:b0:848:7b92:8e74 with SMTP id d2e1a72fcca58-84e59544834mr3284997b3a.39.1785048626213;
        Sat, 25 Jul 2026 23:50:26 -0700 (PDT)
Received: from localhost.localdomain ([125.128.148.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533ce1f7sm1632320b3a.34.2026.07.25.23.50.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 25 Jul 2026 23:50:25 -0700 (PDT)
From: Baul Lee <baul.lee@xbow.com>
To: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	lina+kernel@asahilina.net,
	federico.kirschbaum@xbow.com,
	Baul Lee <baul.lee@xbow.com>,
	stable@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: fix stack info leak in RME Digiface status
Date: Sun, 26 Jul 2026 15:50:20 +0900
Message-ID: <20260726065020.46070-1-baul.lee@xbow.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

snd_rme_digiface_read_status() reads a four-word status block from the
device into an uninitialised on-stack __le32 buf[4] and, whenever the
vendor control-IN transfer does not return a negative error, copies all
four words into the caller's status[].

snd_usb_ctl_msg() copies the full requested size back into the caller's
buffer regardless of how many bytes the data stage actually delivered:

	buf = kmemdup(data, size, GFP_KERNEL);
	err = usb_control_msg(dev, pipe, request, requesttype,
			      value, index, buf, size, timeout);
	memcpy(data, buf, size);

usb_control_msg() returns the transferred length on a short control-IN,
which is a non-negative value, and writes only that many bytes.  The
remainder of the copy back is the kmemdup()ed image of the caller's
buffer, so a device answering with a short data stage leaves the
trailing words of buf[] holding leftover kernel stack.  The only guard
in the caller is err < 0, so those words are stored into status[].

They then reach user space: snd_rme_digiface_get_status_val() selects a
16-bit halfword of status[] per the control's reg/mask, and the eight
Digiface status controls together expose the whole 16-byte frame to an
unprivileged reader of /dev/snd/controlC*.

Zero-initialise the buffer so a short read yields zeros instead of stack
residue.  This mirrors snd_rme_get_status1(), which already clears its
output word before the same kind of vendor read.

Discovered by XBOW, triaged by Baul Lee <baul.lee@xbow.com>

Fixes: 611a96f6acf2 ("ALSA: usb-audio: Add mixer quirk for RME Digiface USB")
Reported-by: Federico Kirschbaum <federico.kirschbaum@xbow.com>
Reported-by: Baul Lee <baul.lee@xbow.com>
Cc: stable@vger.kernel.org
Signed-off-by: Baul Lee <baul.lee@xbow.com>
---
 sound/usb/mixer_quirks.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index fb3bd360e5a9..a1f5592cc5d5 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -3496,7 +3496,7 @@ static int snd_rme_digiface_read_status(struct snd_kcontrol *kcontrol, u32 statu
 	struct usb_mixer_elem_list *list = snd_kcontrol_chip(kcontrol);
 	struct snd_usb_audio *chip = list->mixer->chip;
 	struct usb_device *dev = chip->dev;
-	__le32 buf[4];
+	__le32 buf[4] = {};
 	int err;
 
 	err = snd_usb_ctl_msg(dev, usb_rcvctrlpipe(dev, 0),
-- 
2.50.1 (Apple Git-155)

