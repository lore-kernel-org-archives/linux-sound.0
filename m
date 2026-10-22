Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792680793;
	b=vuMJhC8zMes5VndO4Qza+lIUTY05jLPED0N6Em0qiZMwW2lRkDkp8zO9QDV4nQlHvDK+
	 mnkZWVRVAXkthzRW4BqrZ2SXuI/qFj4oQ0Ug2s8yiM0G2IUYnwckenUfNOBKxADkmaLI/
	 y81ok1XYQWqQpHFxck/EiyBf9vbHIEXp1CV2uDd2XJYbbynifEFBMx72onGk+6Rl0MSQD
	 4c2CGcwJ9EZPP/MXEtdFqQcV3V67ic0Hj4VMJ6cmdUdTlNuYmiBPH77eO9VumotNTg/vl
	 1r0XQpguK4TDylBQcV76HdlwCZOEHveGgV20xTv0JNzCeMutPutIY9PzsoZbJqTkDfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792680793;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=H+sRkJkPW5hAtcM97zG9YoxAxPi8AjtEoexboPV7suE=;
	b=T6vcXi+tG223TusIWfU2TMS07ruKWSLWxTZPebWl5ht/9vaWI6TKByoOBLuacHKcCexb
	 VpxQX+utuGq6hGKuP6vmQ6AmQyzgfWw1JR2pqIX16PBn6KTSU+59eH8hhQxtit9rM3rfI
	 RPYoEs4o29hx50C5grywdjqCwko1q33t3lV4HRRM/LPmT1QPhQXdsemwnQZpg5CNE/0LM
	 B0r9Ex59MQ1IMZju8/Mn9qwIhoiVKVyXHd1WTAK+mewtw1Gv+++ZK79xVFlz0Cj5h8iby
	 eYqzBrcND+q8KHcdOOyd6L8FSCD+wHYzqQ74clcx/9xqvk32uX5Ig0vrEhmxlxk6pCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TSWedaXK;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE29606A31A
	for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 14:53:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CE29606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TSWedaXK
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cd69954c755so1261490a12.3
        for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 07:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792680792; x=1793285592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H+sRkJkPW5hAtcM97zG9YoxAxPi8AjtEoexboPV7suE=;
        b=TSWedaXKutKkHOavcBM3WKuGdVEIpWzMWB5neUT0vVFR/Rdh3zw7enRL0r0YZyWMHj
         ZUM9LEbGxyYvh+TKjv97CsChy9Y4PTi6lvUvGv1Dlf8zBAICKGSDheaDPsWABRya91c2
         qXJMc0XgqS5DI59texTUsaUkSQ9Nbiqaid+OSmUZIOcEeEN5YF4iugDJx+RY5+kwmvsh
         wV4odJbE8JseZX9emPbG+6eusNXXtVL/9GnjLvcx6BbpgI9DgJQdx+0OfGmakEx+AdZn
         P+WMmwvhAF/82XtAc8e6sWG29d+QIt9YKmhHuI8hx0wYGSGEICD1MOkaWHU5cg+gMuHV
         Mo+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792680792; x=1793285592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H+sRkJkPW5hAtcM97zG9YoxAxPi8AjtEoexboPV7suE=;
        b=aHZsSMM9AWh+sUEkLXOjUYQpswkoblQNPVDfB1Uh879vuSi8B8UauKizXCXHa0epIE
         Zcs3SYX/QmKX9YHuGDZzICiWWwN2ioOqKzKrfwfBkdhbTFVjW6ky9OoD8s0R/WniG2oF
         DfiwsUc/bvottQnYmrOxzvQ7t5fsq0lvdR0e4GpJG5m2gR9hL47T6zToraMkTkJRUhXa
         5+yhReb0lyBB3Qz0MNZV2FM+r76Y8gRQNFsk5e2l1xSO4i7VmAGgKiREp7CuEBvfTZWK
         D16m9PHuT2nObMzc6gsXBE/TUmRYzfZ/get+CrSBYArB13dyZY5a66JMSD8aebLEBMOK
         yZeg==
X-Gm-Message-State: AFq9FYKhwtCZdnkd+78B4XMhCyYjKxJ2xZPNu3XcfFBx/tq0e/aNPwp7
	1UivMhNZUD9vsTbpCpMjMXl7JsfLRcgZARuxJu3S8/hntlUl1HioEi2G
X-Gm-Gg: AYBFou3+3hU0zertD5f2njQ8rgKPCisa8Hic3CIWjg7N+uwr8ePlcwwvGg6Yv+bxSv4
	eSBByrHoaF6PYKjVrnsY9Wln9u9OXe3zVMqknvgwS310UahIswoNaJztfAZH5x5iInxWB9UKoV+
	Lx8DTvNcKt0/WvvxGVGCyq3XG50weY3/nnWRSsjtzxsxNwcF2HAilbUIPSN7OUWDjAO1bWE3uin
	DC+gBytAHf1yWK1lg7eeALCfcfmRDv4lb+jc774AaRTLp5yjr5JaLMHcs3H9IyS4xu+5x2X4fho
	kGUS3WpOrGS/ee4VOPvfzK8NbP0vORHuPdo0GDgFE3ybXAmiPAzTgODGLG2PSczMoIed1Wq0tPi
	ghhfsdxPK/I9+HX2WjGnoXP/gbGbv9Js9P+//Ww/6o47tI682uDw6pLK/M2hkUzt3l75PMsXEsp
	qWDqCNKFib3ZtOZSDq6BKGO20ogtjYsXjMuc6daDer/B+dK3+vTxPNt2CeaSbu1LsoHHKgRMWZk
	R8Wm5u1bLWM1aYfjmSPsFfDE7KeR0dienHts5OFI4yWyxLsDj5v
X-Received: by 2002:a17:90a:dfcb:b0:3ab:d45c:59da with SMTP id 98e67ed59e1d1-3ad86f717fcmr4333012a91.40.1792680791935;
        Thu, 22 Oct 2026 07:53:11 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4887669sm4767829a91.2.2026.10.22.07.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:53:11 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tiwai@suse.de,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v2 2/3] ALSA: opl3: Clear voice channels before freeing their sets
Date: Thu, 22 Oct 2026 22:52:54 +0800
Message-Id: <pm-pmb-4552c4e605507d8d9b16-v6-f3fa18aca2c7d18be670-2@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <pm-pmb-4552c4e605507d8d9b16-v6-f3fa18aca2c7d18be670-0@gmail.com>
References: <pm-pmb-4552c4e605507d8d9b16-v6-f3fa18aca2c7d18be670-0@gmail.com>
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

Clear channel pointers, delayed-note flags and voice state under
voice_lock before each port frees its set. This also excludes a timer
or pitch update already using a voice. Both private_free callbacks must
do the cleanup because an in-flight OSS event can refill the shared
voice array after the native port has been drained and freed. That event
can only reference its own still-live set; the OSS callback's final
cleanup retires that reference before freeing it as well.

Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
 sound/drivers/opl3/opl3_oss.c   |  1 +
 sound/drivers/opl3/opl3_seq.c   | 13 +++++++++++++
 sound/drivers/opl3/opl3_voice.h |  1 +
 3 files changed, 15 insertions(+)

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
index 2bacefc3201d..f711139c5067 100644
--- a/sound/drivers/opl3/opl3_seq.c
+++ b/sound/drivers/opl3/opl3_seq.c
@@ -148,10 +148,23 @@ static int snd_opl3_synth_event_input(struct snd_seq_event * ev, int direct,
 
 /* ------------------------------ */
 
+void snd_opl3_clear_voices(struct snd_opl3 *opl3)
+{
+	int i;
+
+	guard(spinlock_irqsave)(&opl3->voice_lock);
+	for (i = 0; i < MAX_OPL3_VOICES; i++) {
+		opl3->voices[i].chan = NULL;
+		opl3->voices[i].note_off_check = 0;
+		opl3->voices[i].state = SNDRV_OPL3_ST_OFF;
+	}
+}
+
 static void snd_opl3_synth_free_port(void *private_data)
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


