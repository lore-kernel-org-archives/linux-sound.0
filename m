Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83AAF3A874C
	for <linux-sound@vger.kernel.org>; Mon, 11 May 2026 07:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778486120; cv=none; b=M3YhaQuShePiTEhncUsxYlmOzAEbc/GCIG289VFCYC+UY8C5k4hJ1xYQeQFWN75DOySZ0eqps5GDg7ygkQViPbEMJizS7N/pqwaiHAwgVjq0qMoucc/xLECLOSYKWGwB9+2ZfyvZGMgVDdyZtRe9JlsV8c2rLys48ck1xTVjhao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778486120; c=relaxed/simple;
	bh=RvxwmdSiS+ysihBmtuaAlsjP4h9VAcJpN8WPUqG+GWI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GyR4S3WWVZ9Ta1l/d9+HK1SvOE5eEY+Mcnk4RoMeB7usRN6moDtOXwn5+tua/QIki7npNvFtd8jYKl1wokg/Y4Noy4jWMuH+8hHmOr09iu3obu6U1YuI7iwgQSceVoroM5V9Yy/Xzeiln+osYy9vsoNjrvAtDyE7aIb8BlTszgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dLYYJ+WV; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dLYYJ+WV"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3660daea6a5so1995244a91.1
        for <linux-sound@vger.kernel.org>; Mon, 11 May 2026 00:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778486104; x=1779090904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=13xuXwVyqvQTA5bNs1t2Swfq8JbojPnN3d374a7kRkw=;
        b=dLYYJ+WVDHjt2fGvwi9tdXzTsu7D1uygw/ekbz3wb8ImwyBSGLKB6AJmZPIaj06PMd
         LnzMRnRlKTfPY51/Z9r5xmQfBR2Cbbq50DJHMEFzNnEVIj0igQgIUMQjqOycFwXPpbrB
         CikVMDZnAFMMaSDphx6JFApb1CZRz0o+vVaXbu7ir1NFLHk2lZrkMNGWY6kLLX8gcP/V
         RC1CtgmZOBHEYDqzFlRHFAXg8IvSlLe7JzpSfIDulMf82oWVNYKYG/NS2g8zqnytXw0W
         ITsrjek8JUsxJCVEoNujx6Od/s0GF2JayO02seR+zIOLromSfglph+CgB5ncxPMLicfO
         6kFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778486104; x=1779090904;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=13xuXwVyqvQTA5bNs1t2Swfq8JbojPnN3d374a7kRkw=;
        b=HpJisBqDwA6WfP4qyRZ6eWXek97INcoxOCZunNMP0P6pMmnqdOiF9ImMAIDz29J4X/
         XHsZms+UGoFLiyJx61Xj7Cf6YyHAjaAAiIdg8gRRT0hTNQ7biGqQtBZcuAhOPROQkb+J
         1uN2//CbdWpuE7w5KCsRQfpr4f73fJdrl1OCpVLqnDEGwhHz0Iuv+wVFgybNXQ/A8Yb/
         IEt0c8scDYZMZdkl/SPwTg+HQdLDHxKx2WUFlljDJ82nIVhzGqyJknfy+n4DD2uLk2qQ
         XXH/P9o/6R/5NtIb8n9srqn0zQ7d2LHLhi2oyqZru74T8ELah9ZYu5109MCR9OpVhvwO
         dwFA==
X-Gm-Message-State: AOJu0YwfUcS/pdLmHFkx/Z/Ivwu+QhEip5lN6Evapga2rsidotwf1OQK
	Y1x4JDbU49fqtCVw1onwIgpP1V3dsFYprblLm1JR2KsCTwd4Xn5PD7awSGtSOXfm
X-Gm-Gg: Acq92OG/PmBXMmmF3C8piOAQcX0nttJQvMAZxnN0KWIzfuV21s3Jh5RKN3EtadAzd9V
	yCo07t8X2vQUzQKWgxfL6k/lxLwAfZ4vj9RyIxyBvNmI5eQBVpj9Pj2pxXoV7UVDAwPyGuYJRDU
	2ziJiLz/37eoeVH8aF84TLvE53Jdneg87kVAtbUzkX3JywuUQouiVE/C5nfyprpza6FOAJpCtLf
	4PNKxAoO/Lmee90bbq5bNmAhrDBC9RsVE3hyD4SmL/srKccgLKZAn9xVuR4PqlWzPRZ7kAW+6A+
	r09RHZa4wRQd40k2Qm1MMvYtM4tuwEJhp+/MNn/VCZfgQTBnComYj0jy6JTQz37ypiJJueKvd65
	MIuSbOieUCoR0OkVL/eUptsulDF0OD5ZWlBxKbrY1VRrS3dZdNjtoUo5Hjn8bWxg7C8511drxMr
	1o7DwP8kFMiKEEHvNgc4TaniV1XdQjbc8HW56so3nRgtLXSYaq6j84T+UmhnnyLyzdtJmZFWaJf
	qId+kh2X1uoz6N2U3aiBLk3cu7CKBt8/sQ=
X-Received: by 2002:a17:90b:1647:b0:366:2e1f:393 with SMTP id 98e67ed59e1d1-3662e1f05b5mr16303587a91.21.1778486104281;
        Mon, 11 May 2026 00:55:04 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e359b0sm88494425ad.51.2026.05.11.00.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 00:55:03 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH] ALSA: seq: Use flexible array for MIDI channels
Date: Mon, 11 May 2026 00:54:47 -0700
Message-ID: <20260511075447.445350-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Store MIDI channel entries in the MIDI channel set allocation instead
of allocating them separately.

This ties the channel array lifetime directly to the channel set, removes
a separate allocation failure path, and lets __counted_by() describe the
array bounds. Move the embedded emux channel set to the end of its
containing structure so it can carry the flexible array.

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 include/sound/emux_synth.h     |  2 +-
 include/sound/seq_midi_emul.h  |  6 +++---
 sound/core/seq/seq_midi_emul.c | 38 ++++++++++------------------------
 sound/synth/emux/emux_seq.c    | 11 +++-------
 4 files changed, 18 insertions(+), 39 deletions(-)

diff --git a/include/sound/emux_synth.h b/include/sound/emux_synth.h
index 3f7f365ed248..2c0a976e00ab 100644
--- a/include/sound/emux_synth.h
+++ b/include/sound/emux_synth.h
@@ -125,7 +125,6 @@ struct snd_emux {
  */
 struct snd_emux_port {
 
-	struct snd_midi_channel_set chset;
 	struct snd_emux *emu;
 
 	char port_mode;			/* operation mode */
@@ -138,6 +137,7 @@ struct snd_emux_port {
 #if IS_ENABLED(CONFIG_SND_SEQUENCER_OSS)
 	struct snd_seq_oss_arg *oss_arg;
 #endif
+	struct snd_midi_channel_set chset;
 };
 
 /* port_mode */
diff --git a/include/sound/seq_midi_emul.h b/include/sound/seq_midi_emul.h
index 88799d1e1f53..afc765437870 100644
--- a/include/sound/seq_midi_emul.h
+++ b/include/sound/seq_midi_emul.h
@@ -55,14 +55,14 @@ struct snd_midi_channel_set {
 	int  client;			/* Client for this port */
 	int  port;			/* The port number */
 
-	int  max_channels;		/* Size of the channels array */
-	struct snd_midi_channel *channels;
-
 	unsigned char midi_mode;	/* MIDI operating mode */
 	unsigned char gs_master_volume;	/* SYSEX master volume: 0-127 */
 	unsigned char gs_chorus_mode;
 	unsigned char gs_reverb_mode;
 
+	int  max_channels;		/* Size of the channels array */
+	struct snd_midi_channel channels[] __counted_by(max_channels);
+
 };
 
 struct snd_midi_op {
diff --git a/sound/core/seq/seq_midi_emul.c b/sound/core/seq/seq_midi_emul.c
index fd067c85c524..a90ebc7b3811 100644
--- a/sound/core/seq/seq_midi_emul.c
+++ b/sound/core/seq/seq_midi_emul.c
@@ -81,9 +81,6 @@ snd_midi_process_event(const struct snd_midi_op *ops,
 		pr_debug("ALSA: seq_midi_emul: ev or chanbase NULL (snd_midi_process_event)\n");
 		return;
 	}
-	if (chanset->channels == NULL)
-		return;
-
 	if (snd_seq_ev_is_channel_type(ev)) {
 		dest_channel = ev->data.note.channel;
 		if (dest_channel >= chanset->max_channels) {
@@ -642,23 +639,6 @@ static void snd_midi_channel_init(struct snd_midi_channel *p, int n)
 		p->drum_channel = 1;	/* Default ch 10 as drums */
 }
 
-/*
- * Allocate and initialise a set of midi channel control blocks.
- */
-static struct snd_midi_channel *snd_midi_channel_init_set(int n)
-{
-	struct snd_midi_channel *chan;
-	int  i;
-
-	chan = kmalloc_objs(struct snd_midi_channel, n);
-	if (chan) {
-		for (i = 0; i < n; i++)
-			snd_midi_channel_init(chan+i, i);
-	}
-
-	return chan;
-}
-
 /*
  * reset all midi channels
  */
@@ -687,13 +667,18 @@ reset_all_channels(struct snd_midi_channel_set *chset)
 struct snd_midi_channel_set *snd_midi_channel_alloc_set(int n)
 {
 	struct snd_midi_channel_set *chset;
+	int i;
+
+	chset = kmalloc_flex(*chset, channels, n);
+	if (!chset)
+		return NULL;
+
+	chset->max_channels = n;
+	chset->private_data = NULL;
+
+	for (i = 0; i < n; i++)
+		snd_midi_channel_init(&chset->channels[i], i);
 
-	chset = kmalloc_obj(*chset);
-	if (chset) {
-		chset->channels = snd_midi_channel_init_set(n);
-		chset->private_data = NULL;
-		chset->max_channels = n;
-	}
 	return chset;
 }
 EXPORT_SYMBOL(snd_midi_channel_alloc_set);
@@ -717,7 +702,6 @@ void snd_midi_channel_free_set(struct snd_midi_channel_set *chset)
 {
 	if (chset == NULL)
 		return;
-	kfree(chset->channels);
 	kfree(chset);
 }
 EXPORT_SYMBOL(snd_midi_channel_free_set);
diff --git a/sound/synth/emux/emux_seq.c b/sound/synth/emux/emux_seq.c
index 2ed01e9d79bb..01ad5b12b680 100644
--- a/sound/synth/emux/emux_seq.c
+++ b/sound/synth/emux/emux_seq.c
@@ -132,19 +132,15 @@ snd_emux_create_port(struct snd_emux *emu, char *name,
 	int i, type, cap;
 
 	/* Allocate structures for this channel */
-	p = kzalloc_obj(*p);
+	p = kzalloc_flex(*p, chset.channels, max_channels);
 	if (!p)
 		return NULL;
 
-	p->chset.channels = kzalloc_objs(*p->chset.channels, max_channels);
-	if (!p->chset.channels) {
-		kfree(p);
-		return NULL;
-	}
+	p->chset.max_channels = max_channels;
+
 	for (i = 0; i < max_channels; i++)
 		p->chset.channels[i].number = i;
 	p->chset.private_data = p;
-	p->chset.max_channels = max_channels;
 	p->emu = emu;
 	p->chset.client = emu->client;
 #ifdef SNDRV_EMUX_USE_RAW_EFFECT
@@ -182,7 +178,6 @@ free_port(void *private_data)
 #ifdef SNDRV_EMUX_USE_RAW_EFFECT
 		snd_emux_delete_effect(p);
 #endif
-		kfree(p->chset.channels);
 		kfree(p);
 	}
 }
-- 
2.54.0

