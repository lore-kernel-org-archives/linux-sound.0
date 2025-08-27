Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202123128C0
	for <linux-sound@vger.kernel.org>; Wed, 27 Aug 2025 07:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756280654; cv=none; b=miWzkubC6wrtqpBq5qAKyIf+kD+XrLZlnjTML6em3KeB7Mr+TFzDfMd1XPFrN91xXxHHrfoOttP0jONSQgO/yBIVhWKDEQqvpjJCeAmfRDzit5W8h4F9MQ9JOKfHyzL0YEfTQsYDgjIZhGLEsxCG2T7A/lsYi0aQxsobI79cmuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756280654; c=relaxed/simple;
	bh=q0WfVfsyiBDJVnMhQRnabD16CU4frbJn+iE6kQhJ528=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BgWqZtsk8hzIEeBud5HQ3wypvTVHXjX4YOOMxzPeRnTvnvKqFeZm2WUtusJMIWESBmXW64XVI0tt8gBHVNraXVlVNkPeevFOUs2KOSdg4AJuk2jkPFCZj7h/R941KcQkUX267rNV1Snt+sNX8klK/tckL/xCpzYqOVvox75VC+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=COF+1Fcx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KwG/7bNI; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EBglm2sJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6SVTuLSJ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="COF+1Fcx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KwG/7bNI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EBglm2sJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6SVTuLSJ"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EEAC522389;
	Wed, 27 Aug 2025 07:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756279760; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NaHyOdouTjXnXiqShkHrkM82AzdhdQNa1GyopyBKN98=;
	b=COF+1Fcxi1oWAFP5PCNrhTLhwprtKOUIeEX5cwm5w9liabWnDpLLsHGsYnNccHkf1hXRma
	URXGrG28eCZVOxR7KsxcQJWSsD0NBgTMQ9pNq1HbAG3OJf9z0GhIAKISxBxj6hZ+me0wir
	HozX7flXKv1xfMkNauvgQVHMTkHS+0o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756279760;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NaHyOdouTjXnXiqShkHrkM82AzdhdQNa1GyopyBKN98=;
	b=KwG/7bNIoqx/8Mq2pdgyJedww3E9EBMwQJFYkeJ32I4jQxUCBWLe40uzK81HEO+IJGgoJX
	X9PDZWwt+xmOBOCg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=EBglm2sJ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=6SVTuLSJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756279759; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NaHyOdouTjXnXiqShkHrkM82AzdhdQNa1GyopyBKN98=;
	b=EBglm2sJegs2bdg8dNMInDll7oQ4NNZh+uDuVaXYhSlwBTpEd6fF5bZI/M5eh42U9fxXq1
	MaioBYCXcuAF7ronuBFDLfClXsxxndliOiRwlERtxL3gzrHeLBIDnZUn3GgsrgS64HB5YI
	6AIN6UyFlDn/vmzmsinPg8/dOpkf/2g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756279759;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NaHyOdouTjXnXiqShkHrkM82AzdhdQNa1GyopyBKN98=;
	b=6SVTuLSJ3vgd2oKAoa4Bk/zrtCRPJdwO9OIdjkXk3wF5/iXd4ncIH6ylLK7UM1jZajN/5q
	ps7fPrrxC+1FgrDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D55C413A31;
	Wed, 27 Aug 2025 07:29:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8MXfMs+zrmjoagAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 27 Aug 2025 07:29:19 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 03/25] ALSA: hda/hdmi: Use cleanup macros for PM controls
Date: Wed, 27 Aug 2025 09:28:43 +0200
Message-ID: <20250827072916.31933-4-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250827072916.31933-1-tiwai@suse.de>
References: <20250827072916.31933-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: EEAC522389
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01

The new macro CLASS(snd_hda_power_pm) can replace the manual
snd_hda_power_up_pm() and _down() calls gracefully.

Merely code cleanups and no functional changes.

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

