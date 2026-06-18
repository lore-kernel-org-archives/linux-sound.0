Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CB230567C
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 17:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781802036; cv=none; b=uiAGw3DdxXEV3Gw1Xq9BjrXQJ0iQFz7vgAJLRUn1gmfLWjq828wNztdg76wLehGqU6ItZGBfKyF8E4bz/On7iJvw6JN+jPf3JM35pXzPmGvqaIvRB5TbDpsKog7cdVA3HMk05DdCCB3VfBAoryQYb0OT9IYzCg2rcFEEqrq7Bc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781802036; c=relaxed/simple;
	bh=sayk4LycQXyEyx/10e9taaOeBg7bpjSKsKjTehNoXdY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MFh2W2KsKIMFnq/9PpvRXi95DW0h9JZMHfHyr+ExurBIjn5/hPuOZnlw4rANHTkt46RKTvzefThS2OsHw0457Muq9Io8OZ3DWATiIzxLKtBimjeNevwFJqGrjf4tnCFQkK68lr6p/jG97yV9QKL57VCA5NROU+Sy9b3nxPz5Nuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GGEtb9xM; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GGEtb9xM"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84540eb70b2so582723b3a.2
        for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 10:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781802034; x=1782406834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LoYMVOubLDK4EH2VwQ4ZzVfUZmSFYYqKjBwvWvrno0o=;
        b=GGEtb9xMgJrCQW4FwfHqS6oJOrcjm1k0m8LgIYNHRSXc3byj1vCFFGqUrf7sn57k4a
         xjHHL1wdNi0nqagTz1cibd1mzMcwFXoDnaF589UikZvZrT671ko2mEql06HaXI91OwET
         zkruuuM3Bvn+vZVmwxSJ2xhXisOng+ccR475y3VOlWbKlkG6O2ufZQ7qGAh4vDo/nHXC
         RBlX6ZIhxBK94QSxhl+qH+4q7QNRyqClVjoOsUM8UEqqT0Y/eTNpEjpwqkEbR4OJBrjt
         zJrl/eR6kW2QOcnbviIWAG5/92PjhJVEcKGzji3vGPlNjFzmTRhpjMcQMjnzUUcQHz8C
         yG8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781802034; x=1782406834;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LoYMVOubLDK4EH2VwQ4ZzVfUZmSFYYqKjBwvWvrno0o=;
        b=JFiJj3/iiDYbLmn6yvoYHOrVqvc+rFtcfiS1klKxculg5+FkEkMbX1X3MrQZPuZcm0
         zCBwu5yrXPNzLxKKpPqulIfkClaBKQV77OP+jilpNLU5vPuX66hOXyjQkq+cXKebxrYK
         UvYVgBipJs5Eud2TmbBKmiCoEmUx9UbSvyzla9421vBCba1zFZcx6PpUNMm+9bXAQ5EI
         ktDRBeGCPvBn2C9X2vJJLDbRTO2m4BO63Ca/q39z8D10CVrqhFHZEudcMZi+BwTXip7k
         OOkQ1+0xK92PDyxMynMOflwE17rh1d1yGZRPor7CroFC7N06SYHfpFO6Ej51r/Wmavh5
         t/aQ==
X-Gm-Message-State: AOJu0Yy68XT34Q/YTDL5ZL9vXcgap20oSWdSD8Q5Ceb+uBKjcdyBHVqe
	KTfS1K0ovpRP+eLM/Zu2NZgUghinb9xLoCI1M/GJ219sJ2gfkdlqERTI
X-Gm-Gg: AfdE7ckfy2zL6q76T9Bn39+Bp/vJsZItGT7aEggXK9Xdth2y6Kw+neOx/adsYQ6NRXN
	g3wlg0CSOM0n96Dd1NAO6rS8zceYJSx3e/YgFPLcpPNXJkj9NLMmZpYmtJnG55+2HXu7dJAXw+F
	lWqPqVCHrQpYxUzVo1RkT2NVgPMmIh4Xv2Gt8vGbg1KCOkNRSEF67cYPl2ma5q7jn1XALwyvSfh
	dD25pvlSqZAoc/cWLdrIauu2dQ4rqXLq6UxP0RmTr/oqR32hn7ZXzBRDvKCL2Gc21Qhetx8ZctP
	eWPL3cOoz0U4gGIe9Ku89JLZft4SxWgOE6IznDpz9beJ+e2i67rjkFpQ1Fx7/4CzeU2vJYWtmQO
	1M2IGP+Pg8cWO0iuZsTg3CAmYv4qRcowjmS5szx3R0tCA4kumzcNMRYPS3aPT9dMirRjNO3Gp9Z
	4djT8dqzQ=
X-Received: by 2002:a05:6a00:340a:b0:842:5b1e:5908 with SMTP id d2e1a72fcca58-84541d5ac0dmr4144708b3a.25.1781802033971;
        Thu, 18 Jun 2026 10:00:33 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8453f91e292sm3131282b3a.17.2026.06.18.10.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 10:00:33 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH] ALSA: usb-audio: Release components on probe errors
Date: Fri, 19 Jun 2026 01:00:26 +0800
Message-Id: <20260618170026.192212-1-zzzccc427@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

usb_audio_probe() can create USB-audio component resources before the
first interface is recorded in chip->num_interfaces.  If a later probe
step fails, the error path drops chip->active and frees the card directly
when no interfaces have been registered.

Normal disconnect first releases USB-audio components in a fixed order
before the card is freed.  The first-interface probe error path skipped
that sequence, so partially initialized PCM, endpoint, MIDI, media, or
mixer resources could be left for the card private_free path without their
disconnect handling having run.

Move the existing normal-disconnect component release sequence into a
helper and call it from the zero-interface probe error path before
snd_card_free().  Keep the normal disconnect ordering unchanged: PCM
streams, endpoint resources, MIDI 1.0 resources, MIDI 2.0 resources, media
device cleanup, then mixer resources.

Assisted-by: Codex:gpt-5.5
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
 sound/usb/card.c | 70 ++++++++++++++++++++++++++----------------------
 1 file changed, 38 insertions(+), 32 deletions(-)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index 6a3b576fb067..b36f513dccb9 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -905,6 +905,40 @@ static int try_to_register_card(struct snd_usb_audio *chip, int ifnum)
 	return 0;
 }
 
+static void usb_audio_disconnect_components(struct snd_usb_audio *chip)
+{
+	struct snd_usb_stream *as;
+	struct snd_usb_endpoint *ep;
+	struct usb_mixer_interface *mixer;
+	struct list_head *p;
+
+	/* release the pcm resources */
+	list_for_each_entry(as, &chip->pcm_list, list) {
+		snd_usb_stream_disconnect(as);
+	}
+	/* release the endpoint resources */
+	list_for_each_entry(ep, &chip->ep_list, list) {
+		snd_usb_endpoint_release(ep);
+	}
+	/* release the midi resources */
+	list_for_each(p, &chip->midi_list) {
+		snd_usbmidi_disconnect(p);
+	}
+	snd_usb_midi_v2_disconnect_all(chip);
+	/*
+	 * Nice to check quirk && quirk->shares_media_device and
+	 * then call the snd_media_device_delete(). Don't have
+	 * access to the quirk here. snd_media_device_delete()
+	 * accesses mixer_list
+	 */
+	snd_media_device_delete(chip);
+
+	/* release mixer resources */
+	list_for_each_entry(mixer, &chip->mixer_list, list) {
+		snd_usb_mixer_disconnect(mixer);
+	}
+}
+
 /*
  * probe the active usb device
  *
@@ -1077,8 +1111,10 @@ static int usb_audio_probe(struct usb_interface *intf,
 		 * decrement before memory is possibly returned.
 		 */
 		atomic_dec(&chip->active);
-		if (!chip->num_interfaces)
+		if (!chip->num_interfaces) {
+			usb_audio_disconnect_components(chip);
 			snd_card_free(chip->card);
+		}
 	}
 	return err;
 }
@@ -1091,48 +1127,18 @@ static bool __usb_audio_disconnect(struct usb_interface *intf,
 				   struct snd_usb_audio *chip,
 				   struct snd_card *card)
 {
-	struct list_head *p;
-
 	guard(mutex)(&register_mutex);
 
 	if (platform_ops && platform_ops->disconnect_cb)
 		platform_ops->disconnect_cb(chip);
 
 	if (atomic_inc_return(&chip->shutdown) == 1) {
-		struct snd_usb_stream *as;
-		struct snd_usb_endpoint *ep;
-		struct usb_mixer_interface *mixer;
-
 		/* wait until all pending tasks done;
 		 * they are protected by snd_usb_lock_shutdown()
 		 */
 		snd_refcount_sync(&chip->usage_count);
 		snd_card_disconnect(card);
-		/* release the pcm resources */
-		list_for_each_entry(as, &chip->pcm_list, list) {
-			snd_usb_stream_disconnect(as);
-		}
-		/* release the endpoint resources */
-		list_for_each_entry(ep, &chip->ep_list, list) {
-			snd_usb_endpoint_release(ep);
-		}
-		/* release the midi resources */
-		list_for_each(p, &chip->midi_list) {
-			snd_usbmidi_disconnect(p);
-		}
-		snd_usb_midi_v2_disconnect_all(chip);
-		/*
-		 * Nice to check quirk && quirk->shares_media_device and
-		 * then call the snd_media_device_delete(). Don't have
-		 * access to the quirk here. snd_media_device_delete()
-		 * accesses mixer_list
-		 */
-		snd_media_device_delete(chip);
-
-		/* release mixer resources */
-		list_for_each_entry(mixer, &chip->mixer_list, list) {
-			snd_usb_mixer_disconnect(mixer);
-		}
+		usb_audio_disconnect_components(chip);
 	}
 
 	if (chip->quirk_flags & QUIRK_FLAG_DISABLE_AUTOSUSPEND)
-- 
2.43.0

