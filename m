Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792860606;
	b=x4Kgye83o0VpvbqngwRB9h0bz79OuHl9h4JAA9ln0lkOZ+BP9KG4j2pGmZovZB6cjjmJ
	 rha8ul8lVhMbdP4Tuna4Z6YNTM2HvoATbSP+PZuHbw+iZ95PeNo9u9k9fZz6CvnB5Paz1
	 Z/WgMe9GKhjJZwu2ppOUQCwyNQthxTTI6bq1tAUY0bD3NeerRPKFi7p8uj6nNnfIFV2Ji
	 acbkWk6KamGNi/Mg6STIDtqNNQ/r7NAy29Ew7fZ5XARYjYfd3aNA65yQdNv6jNC9XfqWo
	 nY2e036QJKNm9YJwn2M0Z2TVoXCTgcK9Sz8ysfYJ9kGgBrHTTNkOiN4HPxJxNUkNK+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792860606;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/QJKOn61cdlPWihh2236ewPeFb+j5eoz5TFcZ6beslQ=;
	b=baDhhmIZgx9nw7b2Xh8U/gxKeUf66hdbdjbQsNNh85V4PNaQXEc7qd1QKAwiJ60ooGIH
	 hsRuJ6iCDNM6hAxhn8TiFPO/fKpIG8YugPiD3GI6BEJSEOnZj63Y+SwixkHmoBZeNGdzM
	 0mOa9Hq5Sod3vvFkinjQ189nz36VnL7zFv+gS0iliMwIaWh5tFkouBDSVCcdmMo4ki0v9
	 wKcJ9P0XoJMP7XWeMTR+JepEFsxp/F0SNyqBZZiF5CahmiU7sFcz3RW20QLEA1KlxpK+g
	 RaCC1V7gj3N9R+Qnoh1yygIzw2hnUFmSvH3B6KWaImOV5xcM22DQ9abisjLxp63mIcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JNaOINEM;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C4F606A31B
	for <linux-sound@vger.kernel.org>; Sat, 24 Oct 2026 16:50:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87C4F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JNaOINEM
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc4aa0246b7so721948a12.3
        for <linux-sound@vger.kernel.org>; Sat, 24 Oct 2026 09:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792860606; x=1793465406; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/QJKOn61cdlPWihh2236ewPeFb+j5eoz5TFcZ6beslQ=;
        b=JNaOINEMzJav+1uQrYv8Ra26Svhfg12IYh7BP4fYVbL6z2h1kWLs8u4Uq+s49nirAo
         lfSGEQpXMR5Ocgw9XlOs/G8M0sRjYMs0mgOvtAOzr6SraH2l5Zql5dz7vniNOH9qNQY8
         e2Dk906m3GIl1w6TjujZ3MeWKPrFmKu+OsfwYguna5N55LGgjkGImX9e4bHQUSZ6+dyZ
         Ws2EdjxQkygSHlIEOBnzosphHxhmVBIi6L9PYQHKfA/sSbnApKsRzB6nd4WIdcFBQyqA
         GD3ISKExiK6qURhkQiZwKvQ4RZZ3VPA/A1FGZb4pwXuLLokeaSIOFf1vrrTjoeSr716b
         hvfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792860606; x=1793465406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/QJKOn61cdlPWihh2236ewPeFb+j5eoz5TFcZ6beslQ=;
        b=KE9XDgK5cv6pCdlOb37j7QpMj+Min20/d6NuVcV2zzelJbSyXg91Q2euSM2WeCHuc/
         wMTjR4IWq2VyG2de53lZHiSxMxUVzL1E+XzJRTcXLVlIgBv0VdUlxXCtcf6fup/X45aZ
         FjaKTh1UuGd3eOlzjSzoPZNIT1R+Dw1ko6rkA5aaARFAuUBgbUHE3eQwtM1dSK4qfaB/
         aLUKAap026yr//oET39ekUMnt7KIDkKHcxAPd9dO5NeotELo/e//1TrZjFHNWUhwK1KZ
         FolzZIqcsIy5Pcjt+HEDqe/9I2Fvq9PPaDVovLs0NOtA64IcBFb+BwdjVwdRvKzWlC8F
         +buw==
X-Gm-Message-State: AFq9FYJ+wxIchUfe54kezgAWVfxrHCNvkkOCIS2EWVGaBPo0eFey0kjc
	i6iKYugN5/1NAoPHxfzCw2bUNJ9e5Hj7DSi5nFIyUgnkCAaa1mp/E9Qe
X-Gm-Gg: AYBFou1k19+OEHcxx6yhaFSGIgJx2opi+Z0ZzPP+yxETIK/SoZyse+2e0QnP4vXattd
	u2javUNG+2zFAc9z4NtKZacpkyKlwnC+MKbmY5vQ43RLJ4qMZvSmNdMwmnAaMiFml+Wqul/kyDW
	YZ7RaTIykuYoIiNxjCqd/x9H07500MLSjcQKux0vXdFqOY8XWhuTAFxQHtWdiKXQOEe1th0XiYW
	Vkd13hPwx0IFXDmEEBpUkFiiCiCO3ywWlNZsfCK1aYUseYkIfzRXJSCxj/2UMHWRK/0VJRKvVV6
	C/z+QLZ2nDZ69r92S+rSTMZ5477riAOeIkEPGiQK/Bax9aowz+ht4pGBXZtDulS7sImBBDaYMON
	6MrjKt5gYuYXxr2398Ol9TFmXp+wnKEVkoYrE/n4GGxeok26D0RvgmawvqS9tHEeYHEiDk4xxrV
	nmqS7OgpEUE8vVxsWVrGMb59uf7zvrItp/XIRJsb2+i8nAKkuO6/Nm+miPiu93i+/MimdrhIW2C
	AdQOGclbDomYopvNhd3T78z96MG26MkbLR4a8GyZMZsfSQbmSg=
X-Received: by 2002:a17:90b:164a:b0:3a4:ba6b:cc24 with SMTP id 98e67ed59e1d1-3adeb137823mr1919883a91.58.1792860605823;
        Sat, 24 Oct 2026 09:50:05 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebfa4102sm3406683a91.12.2026.10.24.09.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 09:50:05 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tiwai@suse.de,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v4 2/3] ALSA: opl3: Clear voice channels before freeing their sets
Date: Sun, 25 Oct 2026 00:49:50 +0800
Message-Id: <pm-pmb-4552c4e605507d8d9b16-v9-70247b8436e10e26d324-2@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <pm-pmb-4552c4e605507d8d9b16-v9-70247b8436e10e26d324-0@gmail.com>
References: <pm-pmb-4552c4e605507d8d9b16-v9-70247b8436e10e26d324-0@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The card-owned OPL3 voice array survives sequencer-driver unbind, but
its chan pointers refer to the native or OSS port's channel set. Neither
port's private_free callback clears those pointers before freeing its set.

A direct NOTEON in the initial SYNTH mode can leave a voice allocated
without a subscription. Even with fix_dur zero and no timer, unbind and
rebind followed by direct PITCHBEND can read the old channel:

  Sequencer driver unbind/rebind      Direct PITCHBEND
  -----------------------------      ----------------
  snd_seq_delete_kernel_client()
    port_free()
      free channel set
  snd_opl3_seq_probe()
    allocate new channel set
                                     snd_opl3_pitch_ctrl()
                                       snd_opl3_update_pitch()
                                         old voice->chan is non-NULL
                                         snd_opl3_calc_pitch()
                                           read freed channel

Clearing only note_off_check or the voice state does not protect this
path: snd_opl3_update_pitch() tests the channel pointer itself.

Key off active voices before clearing their channel pointers, delayed-
note flags and state under voice_lock. Direct events need no
subscription, so port deletion need not call synth_unuse() to reset the
hardware. Merely marking a keyed-on voice off would retain hardware
KEYON and cause a later note to miss the key-on transition. Reuse
snd_opl3_kill_voice() before either channel set is freed.

Visit higher-numbered voices first. In initial SYNTH mode, direct
NOTEON events map channels to fixed voices without reserving them through
the allocator: a 4-op primary can coexist with an independently keyed-on
2-op partner at voice + 3. Killing the primary clears that partner's
software state without keying off its register. Ascending cleanup would
then skip the partner. Retiring the partner first guarantees its key-off
before the primary can change its state, on both register banks.

The lock also excludes a timer or pitch update already using a voice.
Both private_free callbacks must do the cleanup because an in-flight OSS
event can refill the shared voice array after the native port has been
drained and freed. That event can only reference its own still-live set;
the OSS callback's final cleanup retires that reference before freeing
its set as well.

Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
 sound/drivers/opl3/opl3_midi.c  | 15 +++++++++++++++
 sound/drivers/opl3/opl3_oss.c   |  1 +
 sound/drivers/opl3/opl3_seq.c   |  1 +
 sound/drivers/opl3/opl3_voice.h |  1 +
 4 files changed, 18 insertions(+)

diff --git a/sound/drivers/opl3/opl3_midi.c b/sound/drivers/opl3/opl3_midi.c
index 6d3c5b5a35ff..de611214cdac 100644
--- a/sound/drivers/opl3/opl3_midi.c
+++ b/sound/drivers/opl3/opl3_midi.c
@@ -632,6 +632,21 @@ static void snd_opl3_kill_voice(struct snd_opl3 *opl3, int voice)
 
 }
 
+void snd_opl3_clear_voices(struct snd_opl3 *opl3)
+{
+	int i;
+
+	guard(spinlock_irqsave)(&opl3->voice_lock);
+	/* A 4-op primary clears its higher-numbered partner's state. */
+	for (i = MAX_OPL3_VOICES - 1; i >= 0; i--) {
+		if (opl3->voices[i].state > 0)
+			snd_opl3_kill_voice(opl3, i);
+		opl3->voices[i].chan = NULL;
+		opl3->voices[i].note_off_check = 0;
+		opl3->voices[i].state = SNDRV_OPL3_ST_OFF;
+	}
+}
+
 /*
  * Release a note in response to a midi note off.
  */
diff --git a/sound/drivers/opl3/opl3_oss.c b/sound/drivers/opl3/opl3_oss.c
index 6d39b2b77b80..1f01d27955fe 100644
--- a/sound/drivers/opl3/opl3_oss.c
+++ b/sound/drivers/opl3/opl3_oss.c
@@ -41,6 +41,7 @@ static void snd_opl3_oss_free_port(void *private_data)
 {
 	struct snd_opl3 *opl3 = private_data;
 
+	snd_opl3_clear_voices(opl3);
 	snd_midi_channel_free_set(opl3->oss_chset);
 }
 
diff --git a/sound/drivers/opl3/opl3_seq.c b/sound/drivers/opl3/opl3_seq.c
index 2bacefc3201d..e03c88377bb6 100644
--- a/sound/drivers/opl3/opl3_seq.c
+++ b/sound/drivers/opl3/opl3_seq.c
@@ -152,6 +152,7 @@ static void snd_opl3_synth_free_port(void *private_data)
 {
 	struct snd_opl3 *opl3 = private_data;
 
+	snd_opl3_clear_voices(opl3);
 	snd_midi_channel_free_set(opl3->chset);
 }
 
diff --git a/sound/drivers/opl3/opl3_voice.h b/sound/drivers/opl3/opl3_voice.h
index be9ccca2d952..aa81512d23c9 100644
--- a/sound/drivers/opl3/opl3_voice.h
+++ b/sound/drivers/opl3/opl3_voice.h
@@ -13,6 +13,7 @@ int snd_opl3_synth_use_inc(struct snd_opl3 * opl3);
 void snd_opl3_synth_use_dec(struct snd_opl3 * opl3);
 int snd_opl3_synth_setup(struct snd_opl3 * opl3);
 void snd_opl3_synth_cleanup(struct snd_opl3 * opl3);
+void snd_opl3_clear_voices(struct snd_opl3 *opl3);
 
 /* Prototypes for opl3_midi.c */
 void snd_opl3_note_on(void *p, int note, int vel, struct snd_midi_channel *chan);
-- 
2.43.0


