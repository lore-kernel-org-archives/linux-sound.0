Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B2320A5FB
	for <linux-sound@vger.kernel.org>; Fri, 10 Jan 2025 15:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736524792; cv=none; b=Xg9kP5AsVv3qCOP7K2c9E94LHDdBaPZEc7pvY4GlkO7TUmGRfWrL6SCZC1s24wXgXU7Pnf+7jHoq9lpVwisuROdb41UKmTbT/R61tcdxAnRAeXZiv6xMWb1zfE/BpJh07gKAt+w0JXT194ktk1VNJwOnYJooPZXVP2OH5D1oOaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736524792; c=relaxed/simple;
	bh=18SoCqaFWjBdfrNFJUMjfZ9egi/YOGY0jIaz9MyXClg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k1NAjH4q0WEDihVi+6BJQIVMaiJnK4FBr3HUW6QeD7DpBmNC0UmqZMQOld//3HL+hp2Ei3lWaC/S0b5BgE4sJ64WP5mXGwnUfLs2gHR6N0pBp1zc4qznFdjswq4Hzv4b+6L43s4gO7Ufz8u5+T8LrNCEnLK/3JQ/+ITROCfxPtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TMYukxUN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yTsUtCiG; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TMYukxUN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yTsUtCiG; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TMYukxUN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yTsUtCiG";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TMYukxUN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yTsUtCiG"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D40BC21191;
	Fri, 10 Jan 2025 15:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736524787; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ygu71Gx5I7je9KNv3DtV66196jG22foY1wqBHD8l2+Y=;
	b=TMYukxUNNkYBzOFIGgGorNNjRDOTIlY7g8t28C42xWL0V/wUpfwdJzvrA6B7B/1YX31QZN
	zQkqq8mOLWYbIUzjEOcKUhl0XoN8h2fZXRqR50nNi5BLb84iqHKPt5ayE+1OHXPI8kthr1
	J6fg2x+u1byxHrJazDC1E7uNtX3aLms=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736524787;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ygu71Gx5I7je9KNv3DtV66196jG22foY1wqBHD8l2+Y=;
	b=yTsUtCiGygtHtD/8FmsjTggdIAADnfSQdzaNOBorvBM1rwGViMYo5rMe9mqy1209M5ued1
	uW9kUNls6OPFKMDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736524787; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ygu71Gx5I7je9KNv3DtV66196jG22foY1wqBHD8l2+Y=;
	b=TMYukxUNNkYBzOFIGgGorNNjRDOTIlY7g8t28C42xWL0V/wUpfwdJzvrA6B7B/1YX31QZN
	zQkqq8mOLWYbIUzjEOcKUhl0XoN8h2fZXRqR50nNi5BLb84iqHKPt5ayE+1OHXPI8kthr1
	J6fg2x+u1byxHrJazDC1E7uNtX3aLms=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736524787;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ygu71Gx5I7je9KNv3DtV66196jG22foY1wqBHD8l2+Y=;
	b=yTsUtCiGygtHtD/8FmsjTggdIAADnfSQdzaNOBorvBM1rwGViMYo5rMe9mqy1209M5ued1
	uW9kUNls6OPFKMDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B8BEF13AA7;
	Fri, 10 Jan 2025 15:59:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0AS0K/NDgWefEQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 10 Jan 2025 15:59:47 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 2/8] ALSA: rawmidi: Show substream activity in info ioctl
Date: Fri, 10 Jan 2025 16:59:35 +0100
Message-ID: <20250110155943.31578-3-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250110155943.31578-1-tiwai@suse.de>
References: <20250110155943.31578-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -6.80
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

The UMP legacy rawmidi may turn on/off the substream dynamically
depending on the UMP Function Block information.  So far, there was no
direct way to know whether the substream is disabled (inactive) or
not; at most one can take a look at the substream name string or try
to open and get -ENODEV.

This patch extends the rawmidi info ioctl to show the current inactive
state of the given substream.  When the selected substream is
inactive, info flags field contains the new bit flag
SNDRV_RAWMIDI_INFO_STREAM_INACTIVE.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 Documentation/sound/designs/midi-2.0.rst | 6 ++++++
 include/sound/rawmidi.h                  | 1 +
 include/uapi/sound/asound.h              | 1 +
 sound/core/rawmidi.c                     | 2 ++
 sound/core/ump.c                         | 9 +++++----
 5 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/Documentation/sound/designs/midi-2.0.rst b/Documentation/sound/designs/midi-2.0.rst
index d525bc2805f7..d6c17a47c832 100644
--- a/Documentation/sound/designs/midi-2.0.rst
+++ b/Documentation/sound/designs/midi-2.0.rst
@@ -298,6 +298,12 @@ Rawmidi API Extensions
   On the other hand, the UMP rawmidi device number is found in
   `tied_device` field of the legacy rawmidi info, too.
 
+* Each substream of the legacy rawmidi may be enabled / disabled
+  dynamically depending on the UMP FB state.
+  When the selected substream is inactive, it's indicated by the bit
+  0x10 (`SNDRV_RAWMIDI_INFO_STREAM_INACTIVE`) in the `flags` field of
+  the legacy rawmidi info.
+
 
 Control API Extensions
 ======================
diff --git a/include/sound/rawmidi.h b/include/sound/rawmidi.h
index 7f1fec786b72..6f2e95298fc7 100644
--- a/include/sound/rawmidi.h
+++ b/include/sound/rawmidi.h
@@ -89,6 +89,7 @@ struct snd_rawmidi_substream {
 	unsigned int framing;		/* whether to frame input data */
 	unsigned int clock_type;	/* clock source to use for input framing */
 	int use_count;			/* use counter (for output) */
+	bool inactive;			/* inactive substream (for UMP legacy) */
 	size_t bytes;
 	spinlock_t lock;
 	struct snd_rawmidi *rmidi;
diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
index 1fcff031b5e3..9f3b32602ac1 100644
--- a/include/uapi/sound/asound.h
+++ b/include/uapi/sound/asound.h
@@ -728,6 +728,7 @@ enum {
 #define SNDRV_RAWMIDI_INFO_INPUT		0x00000002
 #define SNDRV_RAWMIDI_INFO_DUPLEX		0x00000004
 #define SNDRV_RAWMIDI_INFO_UMP			0x00000008
+#define SNDRV_RAWMIDI_INFO_STREAM_INACTIVE	0x00000010
 
 #define SNDRV_RAWMIDI_DEVICE_UNKNOWN		-1
 
diff --git a/sound/core/rawmidi.c b/sound/core/rawmidi.c
index 858878fe487a..8a681bff4f7f 100644
--- a/sound/core/rawmidi.c
+++ b/sound/core/rawmidi.c
@@ -629,6 +629,8 @@ static int snd_rawmidi_info(struct snd_rawmidi_substream *substream,
 	info->subdevice = substream->number;
 	info->stream = substream->stream;
 	info->flags = rmidi->info_flags;
+	if (substream->inactive)
+		info->flags |= SNDRV_RAWMIDI_INFO_STREAM_INACTIVE;
 	strcpy(info->id, rmidi->id);
 	strcpy(info->name, rmidi->name);
 	strcpy(info->subname, substream->name);
diff --git a/sound/core/ump.c b/sound/core/ump.c
index 0bfab84eaafb..d6cd11be8750 100644
--- a/sound/core/ump.c
+++ b/sound/core/ump.c
@@ -1250,8 +1250,8 @@ static int fill_legacy_mapping(struct snd_ump_endpoint *ump)
 	return num;
 }
 
-static void fill_substream_names(struct snd_ump_endpoint *ump,
-				 struct snd_rawmidi *rmidi, int dir)
+static void update_legacy_substreams(struct snd_ump_endpoint *ump,
+				     struct snd_rawmidi *rmidi, int dir)
 {
 	struct snd_rawmidi_substream *s;
 	const char *name;
@@ -1265,6 +1265,7 @@ static void fill_substream_names(struct snd_ump_endpoint *ump,
 		scnprintf(s->name, sizeof(s->name), "Group %d (%.16s)%s",
 			  idx + 1, name,
 			  ump->groups[idx].active ? "" : " [Inactive]");
+		s->inactive = !ump->groups[idx].active;
 	}
 }
 
@@ -1272,8 +1273,8 @@ static void update_legacy_names(struct snd_ump_endpoint *ump)
 {
 	struct snd_rawmidi *rmidi = ump->legacy_rmidi;
 
-	fill_substream_names(ump, rmidi, SNDRV_RAWMIDI_STREAM_INPUT);
-	fill_substream_names(ump, rmidi, SNDRV_RAWMIDI_STREAM_OUTPUT);
+	update_legacy_substreams(ump, rmidi, SNDRV_RAWMIDI_STREAM_INPUT);
+	update_legacy_substreams(ump, rmidi, SNDRV_RAWMIDI_STREAM_OUTPUT);
 }
 
 int snd_ump_attach_legacy_rawmidi(struct snd_ump_endpoint *ump,
-- 
2.43.0

