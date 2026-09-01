Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5122947A895
	for <linux-sound@vger.kernel.org>; Tue,  1 Sep 2026 10:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788259065; cv=none; b=BD+VPKTfZTV8Os14JNLW4CpBPyXzvoqxHyOMfA/zDNJ8EJfz/FALNAImX+qfTzqrJrvFEAO0EUjIJu05zrZzdL04BwAUyZonzB8Ln4kgV+iobVNXN9j3bKmL9jb1824TmZSkSsd53bPCLlSvnd6spCTZ2FC5fWDkiBpn2gTk3K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788259065; c=relaxed/simple;
	bh=m162thZBVhyy0wZcbSN805/eQ6omc+etcke2hS+teWU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ijv2jX8fyhTPg3MFXl2K+hZfuGQo4py55ijjNFz929IKHbDlp/ay/1HgXbHmUI2vbdQxbra698bHxunWYzt+xtXbirR2OKFl5LDzVM5pSbr4131PuGFDotzia3M0jk6UgJ57cF53H7dSLXIJLeq3CtBg1Q2AkhNHwGJNHKfOYE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qJMdTV5r; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qJMdTV5r"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-484392e3d33so1397417f8f.2
        for <linux-sound@vger.kernel.org>; Tue, 01 Sep 2026 03:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788259061; x=1788863861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g8Xha6Xgz2f3NrS4LysABMsL2JkXYHN9WzLYcNH8QJU=;
        b=qJMdTV5rTzjfTgTG4lMBiMZIMB2yaguRcePZGrqPt0yerG8GdWkREvOm7NMNOX6CN+
         sxnJL7/yQPfdY+3L0uODuZgJ/z/d6hIM8Sq2h1vtoNrvhR06Be5uwlOYZreIjtWMUKCS
         MSTf3m/Xsh0IH9dNEfTHrnqfW8EeSywpUa9+KAKNgXg60U8CAp5m3KpmJ2xzTtkgOsRZ
         Wv96ORr1NcwtPUCLkaTMZzvMMXLKlApfovax5v8ErozL5OEq9go9cWP5AhpEl0VKu/MG
         wjUJx9/rmrXh8KvQthxWbY8kK1ythIyEBicJeCIbRs51Vj+9Zqd225lrB+7vDFm/ZqFy
         0Nqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788259061; x=1788863861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g8Xha6Xgz2f3NrS4LysABMsL2JkXYHN9WzLYcNH8QJU=;
        b=WaL0hUmkWQzqJxTJRTcgUimSFkGl7TDOGa5n3cpyEXdXcPtJs8K6gnmDjDd7XrcMO5
         ksyIzh8KnwsHuoMuWpIOYOfn/PB2Q8P4oP8pCZEjFR6XAv0+u3pxd0EQwWdMp5S5VUTa
         h6Jt54JC/r9WthjAs/rASZgULi9nEGuJOJf8IXpLCTtVZAz6FnVMKG50msb6qpE2EJEB
         1pp9bJp2cAkOoSbjCdn6o/7bw/jIWVEVWglBAkCnFdohs/GGQ25xWqOEva3L189qdMG/
         H3ytwqQMZ7kBPEY3GbdZWysJ8Ci0msOgH5ledZ9qCbbr+97+7as47pLRQuc80aR3bDvq
         gAcw==
X-Forwarded-Encrypted: i=1; AKwUvBwterUjn0BQ4M1i/p/UrmNIMfeP1/w5ACymB5GOE70d2vQV29RV/rKmgmVNxfgSlCVMTBcZu66fqaZE7A==@vger.kernel.org
X-Gm-Message-State: AFuF++kUpUdVlYEB8E2VB/GyCPUir/Sc/eLDIuMSTNHVWu3jxp9KwZ/n
	4CyaqKCryECcMbTotSxcG3XoCCjWDVbfrIp5FfPQp0NJ8f5hPNCWqPLJ
X-Gm-Gg: AYBFou1E/W9BAs6dUF1549hfq4UUxBr2ZmIJI0IuIY76e9d4m3ZSZkmqKHDJbr4e4rz
	8qp9mJGkGb1lV4y2z3DzcD1896ngkN5E+0oP8CpywlyIFM29ZSeAIKpZh6eijeebd2FPHybP5j3
	8Qo7Y6mYqWJ3ANnlAVkOfvdoSuu42RV5QMNWOMsGkZuHJjyqgO+UX3aF5W7se8mV/th96jdNGHe
	fpH4pHvaLN3NiIfLCQQTD87oldE4K7maF7TcNN7ZRUFuWPtnAmpcgEwSrxDJAkEF8GNNwW0SJJG
	xln+9HTNiTgNO+Ht67H1cxycly+y2CHd7jnNZV8NgRxLHQ3/4zJB7y2u8wNrqckVmDYgJ9Extkf
	O3sO7SXeK+9Sx2/umU/czz514EMCgaUrp5Pbb+m3Lp8loBvM0JRLKUClG3796mf8hnEb/rlVAqO
	55fi6JP7Z8tOmORe27XRWdhW0AmU69lxUu8vLjMa9E0ltesweVLOnt+5Z2msH7gd56EbBsBHjSU
	PyOpBDhfo00uH8nH9eZbCgANCRVFQ07fTZOzCQUmjBRw/sOjj1GNK7NxRc+4YUxvx+32YcyRFXp
	fSMsOmG8r7lUn9R1IOek6ZfiF3TOHmwj4F6El+FvzVlPjaAEa85aC8YxzJ2y6heWeM8=
X-Received: by 2002:a05:6000:260f:b0:484:3c3a:5932 with SMTP id ffacd0b85a97d-4843c3a5a14mr23911359f8f.22.1788259061085;
        Tue, 01 Sep 2026 03:37:41 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a16a-7801-fd8c-4b37-36b4-e53a.310.pool.telefonica.de. [2a02:3100:a16a:7801:fd8c:4b37:36b4:e53a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d3c460sm3972126f8f.13.2026.09.01.03.37.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 01 Sep 2026 03:37:40 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: stable@vger.kernel.org
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	=?UTF-8?q?C=C3=A1ssio=20Gabriel?= <cassiogabrielcontato@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+5f8f3acdee1ec7a7ef7b@syzkaller.appspotmail.com,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 5.10.y] ALSA: aloop: Fix racy access at PCM trigger
Date: Tue,  1 Sep 2026 12:37:29 +0200
Message-Id: <20260901103729.70869-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Takashi Iwai <tiwai@suse.de>

[ Upstream commit 826af7fa62e347464b1b4e0ba2fe19a92438084f ]

The PCM trigger callback of aloop driver tries to check the PCM state
and stop the stream of the tied substream in the corresponding cable.
Since both check and stop operations are performed outside the cable
lock, this may result in UAF when a program attempts to trigger
frequently while opening/closing the tied stream, as spotted by
fuzzers.

For addressing the UAF, this patch changes two things:
- It covers the most of code in loopback_check_format() with
  cable->lock spinlock, and add the proper NULL checks.  This avoids
  already some racy accesses.
- In addition, now we try to check the state of the capture PCM stream
  that may be stopped in this function, which was the major pain point
  leading to UAF.

Reported-by: syzbot+5f8f3acdee1ec7a7ef7b@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/69783ba1.050a0220.c9109.0011.GAE@google.com
Cc: <stable@vger.kernel.org>
Link: https://patch.msgid.link/20260203141003.116584-1-tiwai@suse.de
Signed-off-by: Takashi Iwai <tiwai@suse.de>
[ Karl Mehltretter: open-coded spin_lock_irqsave() instead of scoped_guard();
  used snd_pcm_running() instead of cruntime->state; dropped the access-mode
  comparison and notification (462494565c27, e299a9fd433f, cdac6e1f7164);
  kept the stop_count handling from the e5c33cdc6f40 backport. ]
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
e5c33cdc6f40 ("ALSA: aloop: Fix peer runtime UAF during format-change
stop") went into 5.10.y (83bd62fa9620) and 5.15.y (345c24b2bcf0) without
this prerequisite, so stop_count is only taken after the unlocked peer
lookup and format checks.

The 5.10.y and 5.15.y backports are submitted as separate mails with
identical source diffs. The 6.1.y and 6.6.y branches need both upstream
fixes and are handled by separate two-patch submissions.

Tested on v5.10.268 with KASAN under QEMU; a kprobe widened the race.
Vulnerable kernel, probe at loopback_trigger+0x679 after the peer-runtime
load: KASAN UAF, then a NULL dereference and Oops. Fixed kernel, probe at
+0x93, placed just inside the new lock boundary so the close contends on
cable->lock: no KASAN report or Oops.

Functional A/B, same initramfs: all 4096 captured frames matched
byte-for-byte and control/mismatch handling passed. A prepared-but-idle
capture remained PREPARED when mismatched playback started instead of being
forced to DRAINING, matching upstream.
aloop.o builds on v5.10.268 and v5.15.219. The patch also applies unchanged
to v5.10.269-rc1 and v5.15.220-rc1.

 sound/drivers/aloop.c | 99 ++++++++++++++++++++++++++-----------------
 1 file changed, 59 insertions(+), 40 deletions(-)

diff --git a/sound/drivers/aloop.c b/sound/drivers/aloop.c
index 314ced32efbbc..3901f52164933 100644
--- a/sound/drivers/aloop.c
+++ b/sound/drivers/aloop.c
@@ -323,56 +323,75 @@ static int loopback_snd_timer_close_cable(struct loopback_pcm *dpcm)
 
 static int loopback_check_format(struct loopback_cable *cable, int stream)
 {
+	struct loopback_pcm *dpcm_play, *dpcm_capt;
 	struct snd_pcm_runtime *runtime, *cruntime;
 	struct loopback_setup *setup;
 	struct snd_card *card;
-	int check;
+	unsigned long flags;
+	bool stop_capture = false;
+	int check, err = 0;
+
+	spin_lock_irqsave(&cable->lock, flags);
+	dpcm_play = cable->streams[SNDRV_PCM_STREAM_PLAYBACK];
+	dpcm_capt = cable->streams[SNDRV_PCM_STREAM_CAPTURE];
 
 	if (cable->valid != CABLE_VALID_BOTH) {
-		if (stream == SNDRV_PCM_STREAM_PLAYBACK)
-			goto __notify;
-		return 0;
-	}
-	runtime = cable->streams[SNDRV_PCM_STREAM_PLAYBACK]->
-							substream->runtime;
-	cruntime = cable->streams[SNDRV_PCM_STREAM_CAPTURE]->
-							substream->runtime;
-	check = runtime->format != cruntime->format ||
-		runtime->rate != cruntime->rate ||
-		runtime->channels != cruntime->channels;
-	if (!check)
-		return 0;
-	if (stream == SNDRV_PCM_STREAM_CAPTURE) {
-		return -EIO;
+		if (stream == SNDRV_PCM_STREAM_CAPTURE || !dpcm_play)
+			goto unlock;
 	} else {
-		/* close must not free the peer runtime below */
-		atomic_inc(&cable->stop_count);
-		snd_pcm_stop(cable->streams[SNDRV_PCM_STREAM_CAPTURE]->
-					substream, SNDRV_PCM_STATE_DRAINING);
-		if (atomic_dec_and_test(&cable->stop_count))
-			wake_up(&cable->stop_wait);
-	      __notify:
-		runtime = cable->streams[SNDRV_PCM_STREAM_PLAYBACK]->
-							substream->runtime;
-		setup = get_setup(cable->streams[SNDRV_PCM_STREAM_PLAYBACK]);
-		card = cable->streams[SNDRV_PCM_STREAM_PLAYBACK]->loopback->card;
-		if (setup->format != runtime->format) {
-			snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_VALUE,
-							&setup->format_id);
-			setup->format = runtime->format;
+		if (!dpcm_play || !dpcm_capt) {
+			err = -EIO;
+			goto unlock;
 		}
-		if (setup->rate != runtime->rate) {
-			snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_VALUE,
-							&setup->rate_id);
-			setup->rate = runtime->rate;
+		runtime = dpcm_play->substream->runtime;
+		cruntime = dpcm_capt->substream->runtime;
+		if (!runtime || !cruntime) {
+			err = -EIO;
+			goto unlock;
 		}
-		if (setup->channels != runtime->channels) {
-			snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_VALUE,
-							&setup->channels_id);
-			setup->channels = runtime->channels;
+		check = runtime->format != cruntime->format ||
+			runtime->rate != cruntime->rate ||
+			runtime->channels != cruntime->channels;
+		if (!check)
+			goto unlock;
+		if (stream == SNDRV_PCM_STREAM_CAPTURE) {
+			err = -EIO;
+			goto unlock;
+		} else if (snd_pcm_running(dpcm_capt->substream)) {
+			/* close must not free the peer runtime below */
+			atomic_inc(&cable->stop_count);
+			stop_capture = true;
 		}
 	}
-	return 0;
+
+	setup = get_setup(dpcm_play);
+	card = dpcm_play->loopback->card;
+	runtime = dpcm_play->substream->runtime;
+	if (setup->format != runtime->format) {
+		snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_VALUE,
+			       &setup->format_id);
+		setup->format = runtime->format;
+	}
+	if (setup->rate != runtime->rate) {
+		snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_VALUE,
+			       &setup->rate_id);
+		setup->rate = runtime->rate;
+	}
+	if (setup->channels != runtime->channels) {
+		snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_VALUE,
+			       &setup->channels_id);
+		setup->channels = runtime->channels;
+	}
+
+unlock:
+	spin_unlock_irqrestore(&cable->lock, flags);
+	if (stop_capture) {
+		snd_pcm_stop(dpcm_capt->substream, SNDRV_PCM_STATE_DRAINING);
+		if (atomic_dec_and_test(&cable->stop_count))
+			wake_up(&cable->stop_wait);
+	}
+
+	return err;
 }
 
 static void loopback_active_notify(struct loopback_pcm *dpcm)
-- 
2.53.0
