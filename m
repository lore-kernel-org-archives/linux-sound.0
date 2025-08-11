Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF6721CFF6
	for <linux-sound@vger.kernel.org>; Mon, 11 Aug 2025 10:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754906912; cv=none; b=rQa1gG8gQJQChWJnN+qDuHFgtotkHhRroRZWQ92j1N64XvQQXPVUNmuP8JCAXs2u9uE3dcl4dN7+wgyF6i1Ze2WN92/SIXDP5nM8LGlqbbI66Sr2J5oyB2WaMjFel+78X82fVZ8pXESfgk3f+SCaeXnr9fJo2K9ThCOXNmefofo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754906912; c=relaxed/simple;
	bh=+bbtUCDozSu8AJ0wjXVe6YrboeYRwKAzkSshCWiNMT0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HHfLkC3V3/gpC8E4xC3rrVJs/soqYwnhx6rjm9Jb4UXnVWn01HpXKHLy603ecpJ3XwsUm7PbRWZdiB1BzJeeQCeN//XtsAfntcqdwkk3W+kn56ZeRVU9bA5nYgH2b/GSk8x/7lW7s8Bjh9XCVV830XyjpwhKuiuduYauXMmXg54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=e766cdCW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BuqrFt5M; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=e766cdCW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BuqrFt5M; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="e766cdCW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BuqrFt5M";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="e766cdCW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BuqrFt5M"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 32D525BE11;
	Mon, 11 Aug 2025 10:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754906894; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gwOS4wniwRkrA+g+o88io2521C80eKdapRRWHMtcKoo=;
	b=e766cdCWFhr4sPIUX9S27XonitiNBnZtbU/bAd8txE5b7AoZrB3IINXxvwxD1Ii5+3iMAz
	614Rpq+Tq79vqmqHLXxT0Z0iL5490YgQjqSzIXroK0onu7f+ScxgiHgdvQAwjjq6WqxZuq
	dLbGxAP8ZW26DdE4QqR4iXEszZ4RY0w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754906894;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gwOS4wniwRkrA+g+o88io2521C80eKdapRRWHMtcKoo=;
	b=BuqrFt5My1E8CR7OvPWN8sMy+66w9fmwT+ym7vLGnsBbM/s9LDLHEwRRs27QwbhenX8qT+
	YPSQuqmcE8/qjiCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=e766cdCW;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=BuqrFt5M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754906894; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gwOS4wniwRkrA+g+o88io2521C80eKdapRRWHMtcKoo=;
	b=e766cdCWFhr4sPIUX9S27XonitiNBnZtbU/bAd8txE5b7AoZrB3IINXxvwxD1Ii5+3iMAz
	614Rpq+Tq79vqmqHLXxT0Z0iL5490YgQjqSzIXroK0onu7f+ScxgiHgdvQAwjjq6WqxZuq
	dLbGxAP8ZW26DdE4QqR4iXEszZ4RY0w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754906894;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gwOS4wniwRkrA+g+o88io2521C80eKdapRRWHMtcKoo=;
	b=BuqrFt5My1E8CR7OvPWN8sMy+66w9fmwT+ym7vLGnsBbM/s9LDLHEwRRs27QwbhenX8qT+
	YPSQuqmcE8/qjiCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DEB3913AB9;
	Mon, 11 Aug 2025 10:08:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cLoJNQ3BmWiVBwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 11 Aug 2025 10:08:13 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>
Subject: [PATCH 05/25] ALSA: hda/common: Use cleanup macros for PM controls
Date: Mon, 11 Aug 2025 12:07:39 +0200
Message-ID: <20250811100807.7962-6-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250811100807.7962-1-tiwai@suse.de>
References: <20250811100807.7962-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 32D525BE11
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

The new macro CLASS(snd_hda_power_pm) can replace the manual
snd_hda_power_up_pm() and _down() calls gracefully.

A part of the code in codec_exec_verb() is factored out to a function,
so that the auto-cleanup can be well scoped.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/common/codec.c | 30 +++++++++++++++++++-----------
 sound/hda/common/proc.c  |  4 +---
 sound/hda/common/sysfs.c | 11 ++++-------
 3 files changed, 24 insertions(+), 21 deletions(-)

diff --git a/sound/hda/common/codec.c b/sound/hda/common/codec.c
index eb268d442201..28cdbf6dd98a 100644
--- a/sound/hda/common/codec.c
+++ b/sound/hda/common/codec.c
@@ -31,6 +31,23 @@
 #define codec_has_clkstop(codec) \
 	((codec)->core.power_caps & AC_PWRST_CLKSTOP)
 
+static int call_exec_verb(struct hda_bus *bus, struct hda_codec *codec,
+			  unsigned int cmd, unsigned int flags,
+			  unsigned int *res)
+{
+	int err;
+
+	CLASS(snd_hda_power_pm, pm)(codec);
+	mutex_lock(&bus->core.cmd_mutex);
+	if (flags & HDA_RW_NO_RESPONSE_FALLBACK)
+		bus->no_response_fallback = 1;
+	err = snd_hdac_bus_exec_verb_unlocked(&bus->core, codec->core.addr,
+					      cmd, res);
+	bus->no_response_fallback = 0;
+	mutex_unlock(&bus->core.cmd_mutex);
+	return err;
+}
+
 /*
  * Send and receive a verb - passed to exec_verb override for hdac_device
  */
@@ -45,15 +62,7 @@ static int codec_exec_verb(struct hdac_device *dev, unsigned int cmd,
 		return -1;
 
  again:
-	snd_hda_power_up_pm(codec);
-	mutex_lock(&bus->core.cmd_mutex);
-	if (flags & HDA_RW_NO_RESPONSE_FALLBACK)
-		bus->no_response_fallback = 1;
-	err = snd_hdac_bus_exec_verb_unlocked(&bus->core, codec->core.addr,
-					      cmd, res);
-	bus->no_response_fallback = 0;
-	mutex_unlock(&bus->core.cmd_mutex);
-	snd_hda_power_down_pm(codec);
+	err = call_exec_verb(bus, codec, cmd, flags, res);
 	if (!codec_in_pm(codec) && res && err == -EAGAIN) {
 		if (bus->response_reset) {
 			codec_dbg(codec,
@@ -634,12 +643,11 @@ static void hda_jackpoll_work(struct work_struct *work)
 		return;
 
 	/* the power-up/down sequence triggers the runtime resume */
-	snd_hda_power_up(codec);
+	CLASS(snd_hda_power, pm)(codec);
 	/* update jacks manually if polling is required, too */
 	snd_hda_jack_set_dirty_all(codec);
 	snd_hda_jack_poll_all(codec);
 	schedule_delayed_work(&codec->jackpoll_work, codec->jackpoll_interval);
-	snd_hda_power_down(codec);
 }
 
 /* release all pincfg lists */
diff --git a/sound/hda/common/proc.c b/sound/hda/common/proc.c
index 00c2eeb2c472..55dd70332e40 100644
--- a/sound/hda/common/proc.c
+++ b/sound/hda/common/proc.c
@@ -782,7 +782,7 @@ static void print_codec_info(struct snd_info_entry *entry,
 	fg = codec->core.afg;
 	if (!fg)
 		return;
-	snd_hda_power_up(codec);
+	CLASS(snd_hda_power, pm)(codec);
 	snd_iprintf(buffer, "Default PCM:\n");
 	print_pcm_caps(buffer, codec, fg);
 	snd_iprintf(buffer, "Default Amp-In caps: ");
@@ -795,7 +795,6 @@ static void print_codec_info(struct snd_info_entry *entry,
 	nodes = snd_hda_get_sub_nodes(codec, fg, &nid);
 	if (! nid || nodes < 0) {
 		snd_iprintf(buffer, "Invalid AFG subtree\n");
-		snd_hda_power_down(codec);
 		return;
 	}
 
@@ -932,7 +931,6 @@ static void print_codec_info(struct snd_info_entry *entry,
 
 		kfree(conn);
 	}
-	snd_hda_power_down(codec);
 }
 
 /*
diff --git a/sound/hda/common/sysfs.c b/sound/hda/common/sysfs.c
index 140e24bf4d7f..0d464d4dd7c9 100644
--- a/sound/hda/common/sysfs.c
+++ b/sound/hda/common/sysfs.c
@@ -129,21 +129,18 @@ static int reconfig_codec(struct hda_codec *codec)
 {
 	int err;
 
-	snd_hda_power_up(codec);
+	CLASS(snd_hda_power, pm)(codec);
 	codec_info(codec, "hda-codec: reconfiguring\n");
 	err = snd_hda_codec_reset(codec);
 	if (err < 0) {
 		codec_err(codec,
 			   "The codec is being used, can't reconfigure.\n");
-		goto error;
+		return err;
 	}
 	err = device_reprobe(hda_codec_dev(codec));
 	if (err < 0)
-		goto error;
-	err = snd_card_register(codec->card);
- error:
-	snd_hda_power_down(codec);
-	return err;
+		return err;
+	return snd_card_register(codec->card);
 }
 
 /*
-- 
2.50.1

