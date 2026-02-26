Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B655E426D2A
	for <linux-sound@vger.kernel.org>; Thu, 26 Feb 2026 15:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772121309; cv=none; b=B016g279hsLynKQQz0HtxrQiHjSw+I3+FVPUrqpfnPfdoi19fI/gpVT3SPX5zOASSAxIvV4c2WN5O7VygU9AGCFzOIVd0N1PZCjtWxbBVTloFNU68jQad/Bq3/G3Xw5DEY2sZZxG2AWkv8hO0MM2Ne4jkl84JDugFg3oFivxpX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772121309; c=relaxed/simple;
	bh=7T0p/pjGjI2hGkDy9diklX4ndv//AEsFYnQVYdyfTyQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=flydPqqwXQcde0eqO0bxmngPVI6Y8BydI0GdYuIT/KqzSQXAbOmwVFgaUtOPXHYKVWYZ8CCrsZIxfWbCF3JNxOSCZYMAwU3V9QyjLkkNRWTlmT0PoTmFnBJOzHaRnAwSKm0njFsV74WB1TD1ZYnR6KzhZ6pE9qFfidm5WrSKSRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TObqmdXP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TMDeQZpy; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TObqmdXP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TMDeQZpy; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TObqmdXP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TMDeQZpy";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TObqmdXP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TMDeQZpy"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 71CC340218;
	Thu, 26 Feb 2026 15:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772121298; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dUw+EEnBPzeTgzAzm8vt/xbNXtxprtGyN6eCCPbvWSM=;
	b=TObqmdXPBt+ylzJ0qubUH5GKSBy+u0jMnTPK5I1zshHJmOLZVHwKHvBVToIxWSON37DfQA
	s+cCQ56fnkL1ML0DV1TpcNNfChMu4W+JpLR4HyzWEP5yS5j0bhSiVmep/jprsrwcfLy1mO
	Y5cq7HHi7FyJQkPaJrKhLadEkdvbg3I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772121298;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dUw+EEnBPzeTgzAzm8vt/xbNXtxprtGyN6eCCPbvWSM=;
	b=TMDeQZpyGDiut9zc2F/7c4tOsYBNcjVFLTJbPHbD6r45AwqT6gXVmcwnX7xa5JtdL7RLXW
	LMfRjaNpP5hExOCQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=TObqmdXP;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=TMDeQZpy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772121298; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dUw+EEnBPzeTgzAzm8vt/xbNXtxprtGyN6eCCPbvWSM=;
	b=TObqmdXPBt+ylzJ0qubUH5GKSBy+u0jMnTPK5I1zshHJmOLZVHwKHvBVToIxWSON37DfQA
	s+cCQ56fnkL1ML0DV1TpcNNfChMu4W+JpLR4HyzWEP5yS5j0bhSiVmep/jprsrwcfLy1mO
	Y5cq7HHi7FyJQkPaJrKhLadEkdvbg3I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772121298;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dUw+EEnBPzeTgzAzm8vt/xbNXtxprtGyN6eCCPbvWSM=;
	b=TMDeQZpyGDiut9zc2F/7c4tOsYBNcjVFLTJbPHbD6r45AwqT6gXVmcwnX7xa5JtdL7RLXW
	LMfRjaNpP5hExOCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5009E3EA62;
	Thu, 26 Feb 2026 15:54:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id vULZD9JsoGmedwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 26 Feb 2026 15:54:58 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2] ALSA: us144mkii: Drop kernel-doc markers
Date: Thu, 26 Feb 2026 16:54:45 +0100
Message-ID: <20260226155456.1092186-1-tiwai@suse.de>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid,suse.de:email];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: 71CC340218
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

We don't process this driver code for kernel-doc, and the "/**" marker
leads to warnings with W=1 builds.  Drop the superfluous markers, and
also fix the invalid mark up, too.

Link: https://patch.msgid.link/20260226154414.1081568-2-tiwai@suse.de
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
v1->v2: cover all files now

 sound/usb/usx2y/us144mkii.c          | 14 +++++-----
 sound/usb/usx2y/us144mkii_capture.c  | 12 ++++----
 sound/usb/usx2y/us144mkii_controls.c | 42 ++++++++++++++--------------
 sound/usb/usx2y/us144mkii_midi.c     | 22 +++++++--------
 sound/usb/usx2y/us144mkii_playback.c | 10 +++----
 5 files changed, 50 insertions(+), 50 deletions(-)

diff --git a/sound/usb/usx2y/us144mkii.c b/sound/usb/usx2y/us144mkii.c
index bc71968df8e2..0cf4fa74e210 100644
--- a/sound/usb/usx2y/us144mkii.c
+++ b/sound/usb/usx2y/us144mkii.c
@@ -10,8 +10,8 @@ MODULE_AUTHOR("Šerif Rami <ramiserifpersia@gmail.com>");
 MODULE_DESCRIPTION("ALSA Driver for TASCAM US-144MKII");
 MODULE_LICENSE("GPL");
 
-/**
- * @brief Module parameters for ALSA card instantiation.
+/*
+ * Module parameters for ALSA card instantiation.
  *
  * These parameters allow users to configure how the ALSA sound card
  * for the TASCAM US-144MKII is instantiated.
@@ -269,7 +269,7 @@ void tascam_stop_work_handler(struct work_struct *work)
 	atomic_set(&tascam->active_urbs, 0);
 }
 
-/**
+/*
  * tascam_card_private_free() - Frees private data associated with the sound
  * card.
  * @card: Pointer to the ALSA sound card instance.
@@ -291,7 +291,7 @@ static void tascam_card_private_free(struct snd_card *card)
 	}
 }
 
-/**
+/*
  * tascam_suspend() - Handles device suspension.
  * @intf: The USB interface being suspended.
  * @message: Power management message.
@@ -332,7 +332,7 @@ static int tascam_suspend(struct usb_interface *intf, pm_message_t message)
 	return 0;
 }
 
-/**
+/*
  * tascam_resume() - Handles device resumption from suspend.
  * @intf: The USB interface being resumed.
  *
@@ -390,7 +390,7 @@ static void tascam_error_timer(struct timer_list *t)
 		schedule_work(&tascam->midi_out_work);
 }
 
-/**
+/*
  * tascam_probe() - Probes for the TASCAM US-144MKII device.
  * @intf: The USB interface being probed.
  * @usb_id: The USB device ID.
@@ -565,7 +565,7 @@ static int tascam_probe(struct usb_interface *intf,
 	return err;
 }
 
-/**
+/*
  * tascam_disconnect() - Disconnects the TASCAM US-144MKII device.
  * @intf: The USB interface being disconnected.
  *
diff --git a/sound/usb/usx2y/us144mkii_capture.c b/sound/usb/usx2y/us144mkii_capture.c
index 00188ff6cd51..af120bf62173 100644
--- a/sound/usb/usx2y/us144mkii_capture.c
+++ b/sound/usb/usx2y/us144mkii_capture.c
@@ -3,7 +3,7 @@
 
 #include "us144mkii.h"
 
-/**
+/*
  * tascam_capture_open() - Opens the PCM capture substream.
  * @substream: The ALSA PCM substream to open.
  *
@@ -23,7 +23,7 @@ static int tascam_capture_open(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-/**
+/*
  * tascam_capture_close() - Closes the PCM capture substream.
  * @substream: The ALSA PCM substream to close.
  *
@@ -41,7 +41,7 @@ static int tascam_capture_close(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-/**
+/*
  * tascam_capture_prepare() - Prepares the PCM capture substream for use.
  * @substream: The ALSA PCM substream to prepare.
  *
@@ -62,7 +62,7 @@ static int tascam_capture_prepare(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-/**
+/*
  * tascam_capture_pointer() - Returns the current capture pointer position.
  * @substream: The ALSA PCM substream.
  *
@@ -91,7 +91,7 @@ tascam_capture_pointer(struct snd_pcm_substream *substream)
 	return do_div(pos, runtime->buffer_size);
 }
 
-/**
+/*
  * tascam_capture_ops - ALSA PCM operations for capture.
  *
  * This structure defines the callback functions for capture stream operations,
@@ -109,7 +109,7 @@ const struct snd_pcm_ops tascam_capture_ops = {
 	.pointer = tascam_capture_pointer,
 };
 
-/**
+/*
  * decode_tascam_capture_block() - Decodes a raw 512-byte block from the device.
  * @src_block: Pointer to the 512-byte raw source block.
  * @dst_block: Pointer to the destination buffer for decoded audio frames.
diff --git a/sound/usb/usx2y/us144mkii_controls.c b/sound/usb/usx2y/us144mkii_controls.c
index 62055fb8e7ba..81ded11e3709 100644
--- a/sound/usb/usx2y/us144mkii_controls.c
+++ b/sound/usb/usx2y/us144mkii_controls.c
@@ -3,8 +3,8 @@
 
 #include "us144mkii.h"
 
-/**
- * @brief Text descriptions for playback output source options.
+/*
+ * Text descriptions for playback output source options.
  *
  * Used by ALSA kcontrol elements to provide user-friendly names for
  * the playback routing options (e.g., "Playback 1-2", "Playback 3-4").
@@ -12,15 +12,15 @@
 static const char *const playback_source_texts[] = { "Playback 1-2",
 						     "Playback 3-4" };
 
-/**
- * @brief Text descriptions for capture input source options.
+/*
+ * Text descriptions for capture input source options.
  *
  * Used by ALSA kcontrol elements to provide user-friendly names for
  * the capture routing options (e.g., "Analog In", "Digital In").
  */
 static const char *const capture_source_texts[] = { "Analog In", "Digital In" };
 
-/**
+/*
  * tascam_playback_source_info() - ALSA control info callback for playback
  * source.
  * @kcontrol: The ALSA kcontrol instance.
@@ -38,7 +38,7 @@ static int tascam_playback_source_info(struct snd_kcontrol *kcontrol,
 	return snd_ctl_enum_info(uinfo, 1, 2, playback_source_texts);
 }
 
-/**
+/*
  * tascam_line_out_get() - ALSA control get callback for Line Outputs Source.
  * @kcontrol: The ALSA kcontrol instance.
  * @ucontrol: The ALSA control element value structure to fill.
@@ -60,7 +60,7 @@ static int tascam_line_out_get(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
-/**
+/*
  * tascam_line_out_put() - ALSA control put callback for Line Outputs Source.
  * @kcontrol: The ALSA kcontrol instance.
  * @ucontrol: The ALSA control element value structure containing the new value.
@@ -89,7 +89,7 @@ static int tascam_line_out_put(struct snd_kcontrol *kcontrol,
 	return changed;
 }
 
-/**
+/*
  * tascam_line_out_control - ALSA kcontrol definition for Line Outputs Source.
  *
  * This defines a new ALSA mixer control named "Line OUTPUTS Source" that allows
@@ -106,7 +106,7 @@ static const struct snd_kcontrol_new tascam_line_out_control = {
 	.put = tascam_line_out_put,
 };
 
-/**
+/*
  * tascam_digital_out_get() - ALSA control get callback for Digital Outputs
  * Source.
  * @kcontrol: The ALSA kcontrol instance.
@@ -129,7 +129,7 @@ static int tascam_digital_out_get(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
-/**
+/*
  * tascam_digital_out_put() - ALSA control put callback for Digital Outputs
  * Source.
  * @kcontrol: The ALSA kcontrol instance.
@@ -159,7 +159,7 @@ static int tascam_digital_out_put(struct snd_kcontrol *kcontrol,
 	return changed;
 }
 
-/**
+/*
  * tascam_digital_out_control - ALSA kcontrol definition for Digital Outputs
  * Source.
  *
@@ -177,7 +177,7 @@ static const struct snd_kcontrol_new tascam_digital_out_control = {
 	.put = tascam_digital_out_put,
 };
 
-/**
+/*
  * tascam_capture_source_info() - ALSA control info callback for capture source.
  * @kcontrol: The ALSA kcontrol instance.
  * @uinfo: The ALSA control element info structure to fill.
@@ -194,7 +194,7 @@ static int tascam_capture_source_info(struct snd_kcontrol *kcontrol,
 	return snd_ctl_enum_info(uinfo, 1, 2, capture_source_texts);
 }
 
-/**
+/*
  * tascam_capture_12_get() - ALSA control get callback for Capture channels 1
  * and 2 Source.
  * @kcontrol: The ALSA kcontrol instance.
@@ -217,7 +217,7 @@ static int tascam_capture_12_get(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
-/**
+/*
  * tascam_capture_12_put() - ALSA control put callback for Capture channels 1
  * and 2 Source.
  * @kcontrol: The ALSA kcontrol instance.
@@ -247,7 +247,7 @@ static int tascam_capture_12_put(struct snd_kcontrol *kcontrol,
 	return changed;
 }
 
-/**
+/*
  * tascam_capture_12_control - ALSA kcontrol definition for Capture channels 1
  * and 2 Source.
  *
@@ -265,7 +265,7 @@ static const struct snd_kcontrol_new tascam_capture_12_control = {
 	.put = tascam_capture_12_put,
 };
 
-/**
+/*
  * tascam_capture_34_get() - ALSA control get callback for Capture channels 3
  * and 4 Source.
  * @kcontrol: The ALSA kcontrol instance.
@@ -288,7 +288,7 @@ static int tascam_capture_34_get(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
-/**
+/*
  * tascam_capture_34_put() - ALSA control put callback for Capture channels 3
  * and 4 Source.
  * @kcontrol: The ALSA kcontrol instance.
@@ -318,7 +318,7 @@ static int tascam_capture_34_put(struct snd_kcontrol *kcontrol,
 	return changed;
 }
 
-/**
+/*
  * tascam_capture_34_control - ALSA kcontrol definition for Capture channels 3
  * and 4 Source.
  *
@@ -336,7 +336,7 @@ static const struct snd_kcontrol_new tascam_capture_34_control = {
 	.put = tascam_capture_34_put,
 };
 
-/**
+/*
  * tascam_samplerate_info() - ALSA control info callback for Sample Rate.
  * @kcontrol: The ALSA kcontrol instance.
  * @uinfo: The ALSA control element info structure to fill.
@@ -356,7 +356,7 @@ static int tascam_samplerate_info(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
-/**
+/*
  * tascam_samplerate_get() - ALSA control get callback for Sample Rate.
  * @kcontrol: The ALSA kcontrol instance.
  * @ucontrol: The ALSA control element value structure to fill.
@@ -400,7 +400,7 @@ static int tascam_samplerate_get(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
-/**
+/*
  * tascam_samplerate_control - ALSA kcontrol definition for Sample Rate.
  *
  * This defines a new ALSA mixer control named "Sample Rate" that displays
diff --git a/sound/usb/usx2y/us144mkii_midi.c b/sound/usb/usx2y/us144mkii_midi.c
index ed2afec2a89a..4871797b1670 100644
--- a/sound/usb/usx2y/us144mkii_midi.c
+++ b/sound/usb/usx2y/us144mkii_midi.c
@@ -3,7 +3,7 @@
 
 #include "us144mkii.h"
 
-/**
+/*
  * tascam_midi_in_work_handler() - Deferred work for processing MIDI input.
  * @work: The work_struct instance.
  *
@@ -75,7 +75,7 @@ void tascam_midi_in_urb_complete(struct urb *urb)
 	usb_put_urb(urb);
 }
 
-/**
+/*
  * tascam_midi_in_open() - Opens the MIDI input substream.
  * @substream: The ALSA rawmidi substream to open.
  *
@@ -92,7 +92,7 @@ static int tascam_midi_in_open(struct snd_rawmidi_substream *substream)
 	return 0;
 }
 
-/**
+/*
  * tascam_midi_in_close() - Closes the MIDI input substream.
  * @substream: The ALSA rawmidi substream to close.
  *
@@ -103,7 +103,7 @@ static int tascam_midi_in_close(struct snd_rawmidi_substream *substream)
 	return 0;
 }
 
-/**
+/*
  * tascam_midi_in_trigger() - Triggers MIDI input stream activity.
  * @substream: The ALSA rawmidi substream.
  * @up: Boolean indicating whether to start (1) or stop (0) the stream.
@@ -150,7 +150,7 @@ static void tascam_midi_in_trigger(struct snd_rawmidi_substream *substream,
 	}
 }
 
-/**
+/*
  * tascam_midi_in_ops - ALSA rawmidi operations for MIDI input.
  *
  * This structure defines the callback functions for MIDI input stream
@@ -205,7 +205,7 @@ void tascam_midi_out_urb_complete(struct urb *urb)
 	usb_put_urb(urb);
 }
 
-/**
+/*
  * tascam_midi_out_work_handler() - Deferred work for sending MIDI data
  * @work: The work_struct instance.
  *
@@ -282,7 +282,7 @@ static void tascam_midi_out_work_handler(struct work_struct *work)
 	}
 }
 
-/**
+/*
  * tascam_midi_out_open() - Opens the MIDI output substream.
  * @substream: The ALSA rawmidi substream to open.
  *
@@ -301,7 +301,7 @@ static int tascam_midi_out_open(struct snd_rawmidi_substream *substream)
 	return 0;
 }
 
-/**
+/*
  * tascam_midi_out_close() - Closes the MIDI output substream.
  * @substream: The ALSA rawmidi substream to close.
  *
@@ -312,7 +312,7 @@ static int tascam_midi_out_close(struct snd_rawmidi_substream *substream)
 	return 0;
 }
 
-/**
+/*
  * tascam_midi_out_drain() - Drains the MIDI output stream.
  * @substream: The ALSA rawmidi substream.
  *
@@ -340,7 +340,7 @@ static void tascam_midi_out_drain(struct snd_rawmidi_substream *substream)
 	usb_kill_anchored_urbs(&tascam->midi_out_anchor);
 }
 
-/**
+/*
  * tascam_midi_out_trigger() - Triggers MIDI output stream activity.
  * @substream: The ALSA rawmidi substream.
  * @up: Boolean indicating whether to start (1) or stop (0) the stream.
@@ -361,7 +361,7 @@ static void tascam_midi_out_trigger(struct snd_rawmidi_substream *substream,
 	}
 }
 
-/**
+/*
  * tascam_midi_out_ops - ALSA rawmidi operations for MIDI output.
  *
  * This structure defines the callback functions for MIDI output stream
diff --git a/sound/usb/usx2y/us144mkii_playback.c b/sound/usb/usx2y/us144mkii_playback.c
index 0cb9699ec211..7efaca0a6489 100644
--- a/sound/usb/usx2y/us144mkii_playback.c
+++ b/sound/usb/usx2y/us144mkii_playback.c
@@ -3,7 +3,7 @@
 
 #include "us144mkii.h"
 
-/**
+/*
  * tascam_playback_open() - Opens the PCM playback substream.
  * @substream: The ALSA PCM substream to open.
  *
@@ -23,7 +23,7 @@ static int tascam_playback_open(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-/**
+/*
  * tascam_playback_close() - Closes the PCM playback substream.
  * @substream: The ALSA PCM substream to close.
  *
@@ -41,7 +41,7 @@ static int tascam_playback_close(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-/**
+/*
  * tascam_playback_prepare() - Prepares the PCM playback substream for use.
  * @substream: The ALSA PCM substream to prepare.
  *
@@ -108,7 +108,7 @@ static int tascam_playback_prepare(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-/**
+/*
  * tascam_playback_pointer() - Returns the current playback pointer position.
  * @substream: The ALSA PCM substream.
  *
@@ -137,7 +137,7 @@ tascam_playback_pointer(struct snd_pcm_substream *substream)
 	return do_div(pos, runtime->buffer_size);
 }
 
-/**
+/*
  * tascam_playback_ops - ALSA PCM operations for playback.
  *
  * This structure defines the callback functions for playback stream operations,
-- 
2.53.0

