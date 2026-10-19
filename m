Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341DE4CA79E
	for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 10:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792404920; cv=none; b=mdxkUbgJEW2fdNGDm5sEqqwuYRGAYjprqY1OTtvRpL7wjD9P6m4k1Kq7GN4rx67rz9TweLmL2Z8s8Ey9hz2Tt+8vV1ESedfW/M67FDg7eh91DJcH0XBOWl67HCD2PXu4U1j5rqi3IyPNnagQGXcvUiM9POvtlDGaI1SxTGUHirk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792404920; c=relaxed/simple;
	bh=C283mnBuZO15/DNBtEg5d2hlO5HOSoKCwW2jB4d6lWY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=WRYRa1il9qUlCevt0/cgI03gGXfWO7pDW1PrFvlYKJufFxHIh67zi/p7y+dfyLPrTZ/zSOHLPDswfNZEG9giWF/8Uo2qRkJTOTDWZS5clTMUkP75ydykyhnlihb3HcwyD+F18uJ3641XVMXuaaWrpLYHkSln0iYbZ4m90khb1Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OB89yFKi; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OB89yFKi"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d6d28aa26cso7330275ad.2
        for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 03:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792404917; x=1793009717; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=daxkRKPrfQ14arV5FJlxBgklthHAHPn8HqW4o1xkfkA=;
        b=OB89yFKixYHf0SyzrHm8NNQYwZOUky4y8fuupkW5Z/sHNcLYGcWo8rBKqeG/eeG0CD
         y7Im9aFi+Nvcose92vflQaVYEqmB35RQQREv1SINC8q0Ah+WtaRSHsw7BOzfdkvQRPak
         MNtm+pTX+7bAmHclggTTEaIVezaJoqijcMQPPD5ChNOORFRfzBWOdWePM1a/rn6UXRLn
         wAqi0gJfdYsGJVTTKlgM1rTAeKm3dh36pNPRNAuaeiUHghMSdB7MXhEtNCHbgIKSIKYC
         uxS8v5qSMuQvveFzfKEoytT92G2xqIcRjUgEiWWPShyGAFcKKELXwdwwcekFdlz72+2Z
         ivcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792404917; x=1793009717;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=daxkRKPrfQ14arV5FJlxBgklthHAHPn8HqW4o1xkfkA=;
        b=Nw/9sYS3Quw84ZFmmDdkrvaKLFGPV2nIAWbp/5XAWb7THqpG0QLbvrc0emFBROo0Um
         yrDn/1Y0NLJvV8bhDSkJNRxtCjkoRwte5LxjJg3xPC3TrV4E13hVDkf9Llmkx1aWOIkP
         NafGk7F7DVIJbVmMReh+544oQFIgdlEkZFsOZIMrvl1SU4d/xrsCNHELly5iD5vCHszV
         24I33AyGYNmIKmMMhf9Eq6R4Oa6+H5KWcfl68yLC6rMSBGFX2HVowtJPjG1843vBWVS3
         NN6y4A2X5H7BtHJsKIUh6ux3MBdsqkld9/pOUIlO9zcUvXsWA+0GHaE+FGlALm3eyrTg
         mivg==
X-Gm-Message-State: AFq9FYI6V4lR3L0qrjVUzpfBGYBjiBMLOBT0UghYQ6lHeXjHhaI03uYs
	e80Db0PM/YZbf8oeIguFxbvHwW3NstVak1JpNkzrLDAaiZh4b+6KoPfyLzqvQzHrc4SXqQ==
X-Gm-Gg: AYBFou3hidQiDz/djdn3+jAaDGFjbjXR5pGSzeh3EwtGfKw5UcKbpRy+5Vh32kgjHbp
	BonVVnsLgFkvi4rorA4Ji9MQUpC40zdc8RNSMgG49JDET8BmvlMSD+PKRY5I1HQ7RHrn5ASdeqI
	n5V9FMAtl1ApKKTQoVNHC1EkI/CNCpcqe/qjh7Y0IE8+5RcU7X2jcxQR+gGxhDabSu3KboyYLle
	lss+GwFGCl4lEHSEMdI31fbMQ7xbAtN7FRG8ElnsYry10kKq8yTy0D+xp75kgtsk0acWDDsPN5l
	b5TC8P5MDsXYxtjvobHcRZYg9fl3TwKGB+uT1esjhFv5YnHYgdoN17oK8rpeutxHnGMEhYTreL1
	fjmxB1d/SXwbR/m9ItIlSLAy3XojNaeEcJ5KdAqTDmwuIGxMjPkCXCHYSY6j373WCESU6f/G6aB
	2U7kJ0g3sow+W3jjatZKvNNNbtt/hBe8jHLyI06GBnzuuGjMKYNIbCyTh1jc6dygSsPZucTus30
	eZV
X-Received: by 2002:a17:90b:4c4c:b0:3ac:a491:3cf8 with SMTP id 98e67ed59e1d1-3acef52ae1emr6319764a91.43.1792404917291;
        Mon, 19 Oct 2026 03:15:17 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc46ee274sm14723482a91.4.2026.10.19.03.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:15:16 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH] ALSA: opl3: Stop delayed note-offs before freeing the channel set
Date: Mon, 19 Oct 2026 18:15:12 +0800
Message-Id: <pm-pmb-4552c4e605507d8d9b16-v4-213af356c0046331c8ff@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

An in-tree OPL3 device accepts FM instruments through its hwdep write
interface. Loading a bank-127 instrument with nonzero fix_dur and sending
a direct NOTEON without a subscription leaves the device in its initial
SYNTH mode. snd_opl3_note_on() sets the note_off deadline, starts tlist
at the next jiffy and stores the channel pointer in a voice.

Unbinding the OPL3 sequencer device can then free the port's channel set
while the card-owned OPL3 object and its timer remain alive. Port removal
drains event_input users, but the timer is independent. Without a
subscription, no unuse callback runs to perform its timer cleanup:

  NOTEON / sequencer-device unbind      Delayed-note timer
  -------------------------------      ------------------
  snd_opl3_note_on()
    lock(voice_lock)
    set voice->note_off deadline
    snd_opl3_start_timer()
      mod_timer(tlist, jiffies + 1)
    voice->note_off_check = 1
    voice->chan = channel
    unlock(voice_lock)
  NOTEON returns
  sysfs driver unbind
    snd_opl3_seq_remove()
      snd_seq_delete_kernel_client()
        port_free(): drain input
          snd_opl3_synth_free_port()
            free opl3->chset
                                       snd_opl3_timer_func()
                                         lock(voice_lock)
                                         note_off == jiffies
                                         snd_opl3_note_off_unsafe()
                                           read voice->chan->number

The timer can thus read a channel from the freed set. Shut it down
synchronously before freeing chset, outside voice_lock and
sys_timer_lock, which the callback needs. Shutdown also prevents a
callback from rearming the timer during teardown. Clear the delayed-note
flags under voice_lock so the timer reinitialization on rebind cannot
revive old channel accesses.

Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>

---

diff --git a/sound/drivers/opl3/opl3_seq.c b/sound/drivers/opl3/opl3_seq.c
index b77d8e8f12fb9f90ac72b9209f4f59373eadf6f4..86bf2680a3b5e2ffee73b59a9056f93fb2bec891 100644
--- a/sound/drivers/opl3/opl3_seq.c
+++ b/sound/drivers/opl3/opl3_seq.c
@@ -151,7 +151,14 @@ static int snd_opl3_synth_event_input(struct snd_seq_event * ev, int direct,
 static void snd_opl3_synth_free_port(void *private_data)
 {
 	struct snd_opl3 *opl3 = private_data;
+	int i;
 
+	timer_shutdown_sync(&opl3->tlist);
+	/* Discard delayed notes before reusing the timer on rebind. */
+	scoped_guard(spinlock_irqsave, &opl3->voice_lock) {
+		for (i = 0; i < MAX_OPL3_VOICES; i++)
+			opl3->voices[i].note_off_check = 0;
+	}
 	snd_midi_channel_free_set(opl3->chset);
 }
 
