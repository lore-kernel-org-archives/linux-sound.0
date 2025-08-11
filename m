Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18CF21CC63
	for <linux-sound@vger.kernel.org>; Mon, 11 Aug 2025 10:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754906912; cv=none; b=lfX20+iP5DRsUxnNj7QqAuNimOhO6CwKr21T0Jol0UkkoH7wGcMOHzAAP7Z8PUbMpB6t9jf9xJpYpOraNfaXe+4A9fGM1sH/bU1NN3X/81cJmAPzJhyWSO0F2bpy/Q5WnySu5fpjGhfpBoaP3eCUKZZ/YPXQ+S+b2LwkiGKLo2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754906912; c=relaxed/simple;
	bh=RvFrZfTydkNfOBBvX4anFZ0yA1PxgMxTTvRNB44So9g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gl8r53Qp6Lr10m2rcIMegZrgMbl4zzW3d1c7jGqlnADtjyn685IkFFB/4hgl3gvKdj1/FN+3iSIOIwuWpPpw3Nsf0a6LIKyF4xURK3tJcSdplY8Ut9EUgO0usLvYyZCefhIZ7QY9KPKFWkAkzBuhrMemXK+C2e9py7TopvaQtAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iTPdi5dM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TCk5VbFA; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SDpE9oK1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kWcV0t4N; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iTPdi5dM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TCk5VbFA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SDpE9oK1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kWcV0t4N"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A2DD933E23;
	Mon, 11 Aug 2025 10:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754906894; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0h+7vsiSmK+QMU9IS7eCwnbW4ZEIA/EwF6m0+qvSh64=;
	b=iTPdi5dMvwXwcEKmzH/fO4yjGIts3/axD29sj2h1VV2XqGd0iSYckYK+5H3LFUxn7ggB2i
	IjXka9YrXl6FVRScVfACijjcev1+j6xvKgoXAijCy7RTemlyVfkTI9Tgx43CMeWaJmIz+H
	ehJ6p46q62s+RZIA8TYCzFCW8A6ypfw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754906894;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0h+7vsiSmK+QMU9IS7eCwnbW4ZEIA/EwF6m0+qvSh64=;
	b=TCk5VbFA32yNsfxWMv1q9CWkZ+AuX3wuhC/i3seo2egSoWKa/zUZTWUKKSRkTM7b3cmk4Z
	NeSPcMdrM0C1BGDg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=SDpE9oK1;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=kWcV0t4N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754906893; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0h+7vsiSmK+QMU9IS7eCwnbW4ZEIA/EwF6m0+qvSh64=;
	b=SDpE9oK1hAalbVBw+xJUKJ7WyncwaIBYi3AS1V78WuSB5zoXI6gEgbGNrA+LIhuWLmetqr
	fXIPwwCVRPCwO5SOwQIOeplC0kNe5kc1PLv9lEX3fydfh3b4MH/Y6IIoI3PezwXzxV7AbA
	3TodXXK2aiTw2Ev8fthlthATFbqKvzg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754906893;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0h+7vsiSmK+QMU9IS7eCwnbW4ZEIA/EwF6m0+qvSh64=;
	b=kWcV0t4NeqMuW/AKHKDhOPT/gIfuaBqjqnW03lctR4arUU9nhUee28b7BEAxePUBf5rYjx
	qerlMZE7E40AFBAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6794713A9F;
	Mon, 11 Aug 2025 10:08:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4KItGA3BmWiVBwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 11 Aug 2025 10:08:13 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>
Subject: [PATCH 03/25] ALSA: hda/hdmi: Use cleanup macros for PM controls
Date: Mon, 11 Aug 2025 12:07:37 +0200
Message-ID: <20250811100807.7962-4-tiwai@suse.de>
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
X-Rspamd-Queue-Id: A2DD933E23
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

The new macro CLASS(snd_hda_power_pm) can replace the manual
snd_hda_power_up_pm() and _down() calls gracefully.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/hdmi/hdmi.c | 29 ++++++++++-------------------
 1 file changed, 10 insertions(+), 19 deletions(-)

diff --git a/sound/hda/codecs/hdmi/hdmi.c b/sound/hda/codecs/hdmi/hdmi.c
index b5d840d9892b..4b5d20f0fbe4 100644
--- a/sound/hda/codecs/hdmi/hdmi.c
+++ b/sound/hda/codecs/hdmi/hdmi.c
@@ -1270,16 +1270,15 @@ static void hdmi_present_sense_via_verbs(struct hdmi_spec_per_pin *per_pin,
 	 * the unsolicited response to avoid custom WARs.
 	 */
 	int present;
-	int ret;
 
 #ifdef	CONFIG_PM
 	if (dev->power.runtime_status == RPM_SUSPENDING)
 		return;
 #endif
 
-	ret = snd_hda_power_up_pm(codec);
-	if (ret < 0 && pm_runtime_suspended(dev))
-		goto out;
+	CLASS(snd_hda_power_pm, pm)(codec);
+	if (pm.err < 0 && pm_runtime_suspended(dev))
+		return;
 
 	present = snd_hda_jack_pin_sense(codec, pin_nid, dev_id);
 
@@ -1302,8 +1301,6 @@ static void hdmi_present_sense_via_verbs(struct hdmi_spec_per_pin *per_pin,
 
 	update_eld(codec, per_pin, eld, repoll);
 	mutex_unlock(&per_pin->lock);
- out:
-	snd_hda_power_down_pm(codec);
 }
 
 static void silent_stream_enable(struct hda_codec *codec,
@@ -1318,11 +1315,10 @@ static void silent_stream_enable(struct hda_codec *codec,
 	 * have to be done without mutex held.
 	 */
 
-	err = snd_hda_power_up_pm(codec);
-	if (err < 0 && err != -EACCES) {
+	CLASS(snd_hda_power_pm, pm)(codec);
+	if (pm.err < 0 && pm.err != -EACCES) {
 		codec_err(codec,
-			  "Failed to power up codec for silent stream enable ret=[%d]\n", err);
-		snd_hda_power_down_pm(codec);
+			  "Failed to power up codec for silent stream enable ret=[%d]\n", pm.err);
 		return;
 	}
 
@@ -1361,8 +1357,6 @@ static void silent_stream_enable(struct hda_codec *codec,
 
  unlock_out:
 	mutex_unlock(&per_pin->lock);
-
-	snd_hda_power_down_pm(codec);
 }
 
 static void silent_stream_disable(struct hda_codec *codec,
@@ -1370,14 +1364,13 @@ static void silent_stream_disable(struct hda_codec *codec,
 {
 	struct hdmi_spec *spec = codec->spec;
 	struct hdmi_spec_per_cvt *per_cvt;
-	int cvt_idx, err;
+	int cvt_idx;
 
-	err = snd_hda_power_up_pm(codec);
-	if (err < 0 && err != -EACCES) {
+	CLASS(snd_hda_power_pm, pm)(codec);
+	if (pm.err < 0 && pm.err != -EACCES) {
 		codec_err(codec,
 			  "Failed to power up codec for silent stream disable ret=[%d]\n",
-			  err);
-		snd_hda_power_down_pm(codec);
+			  pm.err);
 		return;
 	}
 
@@ -1401,8 +1394,6 @@ static void silent_stream_disable(struct hda_codec *codec,
 
  unlock_out:
 	mutex_unlock(&per_pin->lock);
-
-	snd_hda_power_down_pm(codec);
 }
 
 /* update ELD and jack state via audio component */
-- 
2.50.1

