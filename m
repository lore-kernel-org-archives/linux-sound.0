Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18A4410D0A
	for <linux-sound@vger.kernel.org>; Thu, 26 Feb 2026 15:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772120667; cv=none; b=qRHxCecwMtmy/PYewiGoEUa2VJpeVUSdepkLgotDdqB9i++O3hmSn++CMkaCSnx0IsiRT5poW7A68HT1e1zhyV0veZBCBrkMBDWwpx9cI/x8NSrdBtP0hPUGGWzdxhY4LN7ww8KFQ5UxkcFJl79MQwFYOSdD32WqRvMUVlq8jvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772120667; c=relaxed/simple;
	bh=8dyOrtvUi8iHLzhaCyhLBcmzm7oWByZJtqs6fVegKDQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NbsXTAY0nBmsrw3VTKUhMqsT6aQYU3qaPWKg6Roak3HuhLw9fmYrLxo37QuhmEsbK04MvYs60nbYzf/qAf4T2hW9ZpzMk7XGLCKFgZxi+dEwTlrVl3e4kMBlXnI/wN4eGNBSfpvHty8xvAWTxj6MYSVASHJS6qdTUY82hT9R4z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=br69CiIi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=My3SMzrB; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JO9QZoIs; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Zkryv/rJ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="br69CiIi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="My3SMzrB";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JO9QZoIs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Zkryv/rJ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C18061FA90;
	Thu, 26 Feb 2026 15:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772120658; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=665+Q9M3qxpK6ByFsDqfWJFjsPAUikRAunacbW77XjQ=;
	b=br69CiIiDSPf7lZTY7uSepaEirRud1r1O0v6jZbqLg992a5T5yETj3h06LNPRnuwkeOIUT
	GoI0Dra7ePtF5j11GhSM0aUqtRp6IWmYfg382ALSiCLNPwAZynZMEMoK2etHotUPXNbgWH
	PziyX50jBW0WIGO33Ks0alz4UCZKdzU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772120658;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=665+Q9M3qxpK6ByFsDqfWJFjsPAUikRAunacbW77XjQ=;
	b=My3SMzrBdgN+qOzsugoi4WJf8o7rjMsbDTAYOXuzSEMf1nZ0hixH8UB+7vRQbHlk9MVcU2
	sDX6Z94pZ6wa/SCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772120657; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=665+Q9M3qxpK6ByFsDqfWJFjsPAUikRAunacbW77XjQ=;
	b=JO9QZoIsLh7QzRXKwfqSB5+I7f0hAydodjvlWBwXKHyApqKoEAPd9GHG6W2ke7nVXWb0E7
	dkh3x/IIZ3PGfCv0G/uRqGKrQpSV9CHeF4CHkGUhAZhrjvyT6LzRObqA08Im9mhkghWseL
	2onB4ohMEpJ9H9k2+LNYirOIQiHwfHU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772120657;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=665+Q9M3qxpK6ByFsDqfWJFjsPAUikRAunacbW77XjQ=;
	b=Zkryv/rJaR3P620kFQgXqab+E5fjJqbYFSHNCZcCoK5lriq5ELXY6Bb8/9nPfxeYFSyB+y
	h+yIHZ8Mw1arutCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A3F5E3EA69;
	Thu, 26 Feb 2026 15:44:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MKHfJlFqoGnMawAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 26 Feb 2026 15:44:17 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 1/3] ALSA: us144mkii: Drop kernel-doc markers
Date: Thu, 26 Feb 2026 16:43:47 +0100
Message-ID: <20260226154414.1081568-2-tiwai@suse.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260226154414.1081568-1-tiwai@suse.de>
References: <20260226154414.1081568-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

We don't process this driver code for kernel-doc, and the "/**" marker
leads to warnings with W=1 builds.  Drop the superfluous markers, and
also fix the invalid mark up, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/usx2y/us144mkii.c          | 14 +++++++-------
 sound/usb/usx2y/us144mkii_midi.c     | 22 +++++++++++-----------
 sound/usb/usx2y/us144mkii_playback.c | 10 +++++-----
 3 files changed, 23 insertions(+), 23 deletions(-)

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

