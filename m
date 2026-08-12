Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40013546C8
	for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 14:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786544114; cv=none; b=B7vK6qghO0+ucb1F+WXdK6P0Lh8a9Z253YPVp8rPqrniY/kGSQpX6Wwa1JqLjFb7QwQ+Xa/ybFuUYlgdeiMqIMXHUT1vmHTq4b5rWOZ+VxAURvvfuetjxwTmZ0UQ5wxiauRTANQIptfxPFCKCf8k5Ok4py/VKzejwOnPbIOXg78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786544114; c=relaxed/simple;
	bh=k94y1skuHgzdcvRUtwTDZNKVSs1yZ2sekwO1XbkQs/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RTzVlAqJDHwN5Flb4WqiqWZdkQzZCdIPbrgX0qGZxAXfHMFHCiuF0Lu5FoZhDQCDW1NGM3a37nXqCvSAAg8Sz1sHeCwqe/GCyKrkvHFTNtyZnnWynbtpP/RaPqnAVqhTGaF0XNsQehdFaU6iPDePCzBzSd9Ajgf43zlCloeyZsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sgd5Z1/g; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sgd5Z1/g"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38759bcd877so1456766a91.2
        for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 07:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786544112; x=1787148912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gDx7OjPh4B/ZXtkR2yuJExeNBKvFNoJy/PHxR186p5k=;
        b=sgd5Z1/g5osZvJqAz3VQM6gob9PWw/nRt036G/1cll5kcwQW3nzLJasqE/xiabPKOz
         9pSOcGgbL0ON3nKs4u4UbaVbGzHinKpqiFD+Ckv6hLLI0ekh/TL93LYzkvDDvjrL0moy
         EQezAUTHk3j6Ys2sxMVIla7HBNw3sW7Dg/6D75yOUo1u8YCFLDLiqQOv5shK7iRDKu0C
         0vh7Y9/HsD/7Geng1QbwRfj7QrR6DgDgv5DoTomuKBMy5fFC6CXY7ldXByhn3Ll5E8Gi
         1uf0Zrd85f//5cgOrSb0h/XvqdBoQXCUFVV4QEUgKPnMvDpNHuKWKb8lc2VTJyFseD0H
         9m7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786544112; x=1787148912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gDx7OjPh4B/ZXtkR2yuJExeNBKvFNoJy/PHxR186p5k=;
        b=XfDlkHvxQBk5qEIFF6C0OZnow6lvLO/XN8helSmDcKyBmsE2aBwb0MHZAhH9dINrfQ
         jJEi23DBvWWIraDdAURr8WZwhyVdYLki8nuaEiWQjwj2sCSVOaT1aesgaWaO4DMZ5XH/
         a63j0yBuRP6us1e2CZ3q3dLXVOorF+BOx8tBa7nflp97GooGnVPGOVrYrKmMOH/E7LP+
         Ckm2yFtdJxEH5RRdzK5iSihyC2wRS8Z/BtunplNWF6OdASk7Y5QIn8Gb1+ngZOyWtFC9
         bU+gwc0OHXeMG5wFx5blGvNQfv2XIol2Fj8ZKrUu2PlaKaJp2tN60k2oRZGBtOCJnCDB
         FjQA==
X-Gm-Message-State: AOJu0YziY9ktXaDlXziToZtm++F445VDyMJC6vGVzif/2DMLZX6w/2YY
	qMqEZS0o7Hdsij26j6UdWV157MA6dlcrniixp/1xobLkt8Mj2V/X+tO1
X-Gm-Gg: AR+sD108NKFD3/ItUzlz1v6jbls6R8Jxp2CUzO9Hh4jarVUi3+9RBuTbdGnmCLPAiIG
	j4Gzv/N77H+rceHDm6q8Y3Nw6JKRnIBUmr88RUei/4EBz090txcofg/1evC6lhQVOPg6nnFi7/R
	nQd5mIfuhqbAfwB7EQP2golgXkND3SB9pR8ZwvOjuf8NKS3i5UlA7AgtYJEYRDk4JpfHbQp+lG8
	S2EVJxMoHfaHnsR6neK/UjGmxekHIeX5eV4nAtLA81lH+gBCmLIoykei/WR1MJ/I5QYKWmU536W
	gclVQl73FIPr+I7l+X0mHx192Gq/ZvPb7XdiaeHxBvsfVtjtb4hzkanftAbVs4p6zO7hzPEPGEY
	sVv16qp1TJ2pq8Do/Imbf26i2G7qHEPQ5BzngCD/kWIpzq+8hZ9pS07E5r2N3JxabERdjsDs4SY
	Jpwk0d8PQo54n3NtU0QBQ2fFjyGXyvwqbtHf1L45CuRzF4DcM0VtD8c+EQz+pNwN0Y5TXp5DQMF
	/WJGkhMMQrUE7yDCkZYjI5AijSkdlZooW7z8sZQ5IX+X2t6FAQLyQ==
X-Received: by 2002:a17:90b:17cb:b0:37d:f983:7b5 with SMTP id 98e67ed59e1d1-39301261ccamr5775338a91.9.1786544111659;
        Wed, 12 Aug 2026 07:15:11 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392f8896c20sm3846908a91.1.2026.08.12.07.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 07:15:11 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH] ALSA: seq: Drop the dead struct snd_seq_event_bounce
Date: Wed, 12 Aug 2026 23:15:06 +0900
Message-ID: <20260812141506.4016387-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <87se4jze5c.wl-tiwai@suse.de>
References: <87se4jze5c.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The struct describes a bounce payload of an error code followed by the
original event and its external data.  No kernel has ever sent that.
Before commit efc86691e4d8 ("ALSA: seq: Fix kernel heap address leak in
bounce_error_event()") the kernel emitted no SNDRV_SEQ_EVENT_BOUNCE at
all, and since then it sends the event record alone.

Nothing has ever read it either.  Its only accessor,
snd_seq_event_bounce_ext_data(), has had no caller for the whole git
history, and it did not even compile until commit c7e0b5bf9fff ("[ALSA]
Remove xxx_t typedefs: Sequencer") incidentally repaired the type name
it referred to, three years after the git import.  Drop the accessor
along with the struct.

This removes a definition from a UAPI header.  Since no kernel ever
produced the layout, nothing can have parsed it, but a program that
merely names the type will need to stop.

Suggested-by: Takashi Iwai <tiwai@suse.de>
Assisted-by: Claude:claude-opus-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 include/sound/asequencer.h      |  3 ---
 include/uapi/sound/asequencer.h | 10 ----------
 sound/core/seq/seq_clientmgr.c  |  5 ++---
 3 files changed, 2 insertions(+), 16 deletions(-)

diff --git a/include/sound/asequencer.h b/include/sound/asequencer.h
index ddbb6bf801bb..efad366736a4 100644
--- a/include/sound/asequencer.h
+++ b/include/sound/asequencer.h
@@ -11,9 +11,6 @@
 #include <sound/asound.h>
 #include <uapi/sound/asequencer.h>
 
-/* helper macro */
-#define snd_seq_event_bounce_ext_data(ev) ((void*)((char *)(ev)->data.ext.ptr + sizeof(struct snd_seq_event_bounce)))
-
 /*
  * type check macros
  */
diff --git a/include/uapi/sound/asequencer.h b/include/uapi/sound/asequencer.h
index a5c41f771e05..3deba3965ca5 100644
--- a/include/uapi/sound/asequencer.h
+++ b/include/uapi/sound/asequencer.h
@@ -308,16 +308,6 @@ struct snd_seq_ump_event {
 	};
 };
 
-/*
- * bounce event - stored as variable size data
- */
-struct snd_seq_event_bounce {
-	int err;
-	struct snd_seq_event event;
-	/* external data follows here. */
-};
-
-
 	/* system information */
 struct snd_seq_system_info {
 	int queues;			/* maximum queues count */
diff --git a/sound/core/seq/seq_clientmgr.c b/sound/core/seq/seq_clientmgr.c
index 11fa7e825819..5b86e75c2658 100644
--- a/sound/core/seq/seq_clientmgr.c
+++ b/sound/core/seq/seq_clientmgr.c
@@ -530,9 +530,8 @@ static struct snd_seq_client *get_event_dest_client(struct snd_seq_event *event)
  * Return the error event.
  *
  * If the receiver client is a user client, the original event is
- * encapsulated in SNDRV_SEQ_EVENT_BOUNCE as variable length event.  If
- * the original event is also variable length, the external data is
- * copied after the event record. 
+ * encapsulated in SNDRV_SEQ_EVENT_BOUNCE as variable length event.  The
+ * external data of a variable length event is not copied along.
  * If the receiver client is a kernel client, the original event is
  * quoted in SNDRV_SEQ_EVENT_KERNEL_ERROR, since this requires no extra
  * kmalloc.
-- 
2.43.0

