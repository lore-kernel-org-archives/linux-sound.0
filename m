Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0536226D14
	for <linux-sound@vger.kernel.org>; Sat, 27 Sep 2025 17:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758994790; cv=none; b=niYcVp5CbcO+UjOTARsX0d3xPYstxAknxBQqoLd/3woPCuMPLTVxV7DYJbIJ2SqC3xPJJCkow6LdoHLfZReWI01RhRkOLVJ3tDdSc0XsWB5sWXq8Bw/ARztj+GhN7DzPNePKEqbEoa2PaJlf0IcljCBKRO6qewnsoUk9oXZxVB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758994790; c=relaxed/simple;
	bh=CB9nqcr/wZx3sYbWSmMvdTfrkigS3UhAGNiP+5quUM8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DzhSFK3tlpSEjja7VZ6U5Vel5UYxp11FWCF1rX40B3pVKSwzzozOb6lndJ/ADEHLSkTBfkSid/rqyHc+pYggSEtEOBsH4iwN4IS09M37AtABViTNnPPUcnUVx3K0beR8w4Jb6o0YhHgA88XZ89hFI77Mj57bbzDeFYZIia6J3P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H0JjEyKB; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H0JjEyKB"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3306d3ab2e4so3742050a91.3
        for <linux-sound@vger.kernel.org>; Sat, 27 Sep 2025 10:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758994788; x=1759599588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZUqnN1F3bgHuD+82ry4kJwIftFdoS866ISrdw4jG2EM=;
        b=H0JjEyKBm4pbcFMcnKnklmj6wI4i7PHga5Kn7qd1VjKDFgEkRNo9nTI0/kA4HXMx6Z
         JgkBL8r2rssA165J+qPHsCpJaNbhBRYG3YmjrqL04stTG4J5F7oWwdf8qCQ6gnlV1Ul4
         WvNNiTRRg2D+aOi0crCD26owGoPzxpPAgBlA1alz5Fr9CJgdGnIpWGPlTFSp0TZr6T3H
         HCn6HxtepaFg+1BsaoIu9vR73KfTzqF2h3DjoIdABfPMt5kE96XWmUe0ueEFHUHZbyVr
         X1B4OigiEGxKK74deUmFqEJ061i30xyd1YCla+Vz3OnUVJPq51mDDSVDjW/ffhFWZunL
         Invw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758994788; x=1759599588;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZUqnN1F3bgHuD+82ry4kJwIftFdoS866ISrdw4jG2EM=;
        b=tMcrW5e1LhRn70Mk+4HGmKxakl5Bg5yF1ks2TEBkTaHP2x41+KcEQDk6ccWeMwgDv6
         4eX0xa3gtSo0ryHO3UFlOh9zZBxJK6uF5gYdQrI2G43J6Fo9pJispXyRIW9lts9P9E3p
         WAtd5CBrprBHTkzmol91iWURwGhK9UCmqc0KqgJ4fgJXzG8qesm+HUKzxOi1ZeE6P+/E
         J1L7JR/f23bXMWtrOt+mJIcwpnBC6DRda3i4OVlVzS/Sl1k6lSPGJD795m9f0x2yMtlS
         pWbDIAECj0EeKf8TDXfHpqdqFLDRogQ4Rv7Bq7BpLm8b+JaqmsQS430y0ZQJ0oCRMTxJ
         LUrg==
X-Forwarded-Encrypted: i=1; AJvYcCXIkNbBtjlHgD75rzcsk1JLUqfPfYN10ArX6HCvNV3VXUHhI7CbuQv/1+uPOMqEuDmkn+sn11ZcUDE5ow==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxowl3LeYGBhWLY7CTD2Ql6ob0GER+ODfln09X42ObhQd4VhRvm
	hBEDYxtCTaXU9K6RJcmPVKMBPPOk44n6TlXAGy+9it2kmZMG59PUN6NW
X-Gm-Gg: ASbGncujuocu00hYlqQ4oiVRcShJ4/6TxG5JwDppymAwLDBX/nWZp0M8nsgcAx1ynBI
	ZRkByGzxFxWVt94XMh9RzhvgvsNA85cLugyjvfoWIq23rbwUuYuIp+rxbrIITm4Uz63R8kKHTXx
	Ofiu1KMAXXfl/12l4mvsjttAKLbvHNSXLZ3/WGbVl0PHXE3gdwCf0HLBfhvxOOs/UC/nQsNOsTf
	lmNqIrM6JrojpVxArbbJujjMP3YmH9mfxivQmdDNWPR8uJbOG9ZEk5e5Prz+LC4spy9MBlTPseH
	43UFuZK+sD9mNQ4eo6WSuglF8AaaNbUk1R5rlMW3g2W2tjFUnzCmyeWsIETjTe/5XqDzGDQUKze
	HW3f4IAv43LPxMW/o7kt/YPgll1lmcTCMVS5MeqoJGEJIQNuUZqsN3turtWFA
X-Google-Smtp-Source: AGHT+IGtvJzCfxKqyh3P6VUpzcJjl7MCBE1zezF/b+a1T0k+e3+Zv5Rfcds1WIgUWSp6qGUOi5ossA==
X-Received: by 2002:a17:90b:1d92:b0:32e:d282:3672 with SMTP id 98e67ed59e1d1-3342a2c0fcemr11749970a91.23.1758994787774;
        Sat, 27 Sep 2025 10:39:47 -0700 (PDT)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3342a3cea96sm4377008a91.2.2025.09.27.10.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Sep 2025 10:39:47 -0700 (PDT)
From: Jeongjun Park <aha310510@gmail.com>
To: clemens@ladisch.de,
	perex@perex.cz,
	tiwai@suse.com
Cc: hdanton@sina.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	syzbot+f02665daa2abeef4a947@syzkaller.appspotmail.com,
	Jeongjun Park <aha310510@gmail.com>
Subject: [PATCH v2] ALSA: usb-audio: fix race condition to UAF in snd_usbmidi_free
Date: Sun, 28 Sep 2025 02:39:24 +0900
Message-Id: <20250927173924.889234-1-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The previous commit 0718a78f6a9f ("ALSA: usb-audio: Kill timer properly at
removal") patched a UAF issue caused by the error timer.

However, because the error timer kill added in this patch occurs after the
endpoint delete, a race condition to UAF still occurs, albeit rarely.

Additionally, since kill-cleanup for urb is also missing, freed memory can
be accessed in interrupt context related to urb, which can cause UAF.

Therefore, to prevent this, error timer and urb must be killed before
freeing the heap memory.

Cc: <stable@vger.kernel.org>
Reported-by: syzbot+f02665daa2abeef4a947@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=f02665daa2abeef4a947
Fixes: 0718a78f6a9f ("ALSA: usb-audio: Kill timer properly at removal")
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
---
 sound/usb/midi.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/usb/midi.c b/sound/usb/midi.c
index acb3bf92857c..97e7e7662b12 100644
--- a/sound/usb/midi.c
+++ b/sound/usb/midi.c
@@ -1522,15 +1522,14 @@ static void snd_usbmidi_free(struct snd_usb_midi *umidi)
 {
 	int i;
 
+	if (!umidi->disconnected)
+		snd_usbmidi_disconnect(&umidi->list);
+
 	for (i = 0; i < MIDI_MAX_ENDPOINTS; ++i) {
 		struct snd_usb_midi_endpoint *ep = &umidi->endpoints[i];
-		if (ep->out)
-			snd_usbmidi_out_endpoint_delete(ep->out);
-		if (ep->in)
-			snd_usbmidi_in_endpoint_delete(ep->in);
+		kfree(ep->out);
 	}
 	mutex_destroy(&umidi->mutex);
-	timer_shutdown_sync(&umidi->error_timer);
 	kfree(umidi);
 }
 
--
