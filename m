Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCC3313E0E
	for <linux-sound@vger.kernel.org>; Wed, 27 Aug 2025 07:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756279771; cv=none; b=iDIWoa1hSqy4iL4QgOKjrDDDGyDVDVUMKTSkTG5wIpDLTINnRtLS6UTbXNpkiLyO3izUAALCuXlxzulVs6/P14VBW4iz7ojVkMz9wAdIS7dwV0i9R2YAT7LxE7/0LNos2sH6bekHzQChYv2sDyPgYWAsWeDqtPsI3RVrZ8k8yys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756279771; c=relaxed/simple;
	bh=/kmxn9CUMPzYcnhuxyywN9eE7EGnb4YnQSjxVXR+dXc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FYheWnoMJv7KHn3PtQ0Kugqy+SZGwPrXDoCnwSZMrRmVuYHaUpdlvORcQcyOW9OAh1cY10Df00Qbj0anAlVgrByixoQEbcZhkqQ9J2Spfoxlbj8bkuICe+H+jBmrRMEt0XNo6WPfrTbrGZXnOhBzi111nrdq/9vPuIw5zEfquUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ilOONc/F; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=w5MreFx6; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ilOONc/F; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=w5MreFx6; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ilOONc/F";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="w5MreFx6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ilOONc/F";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="w5MreFx6"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1B5EF1FE95;
	Wed, 27 Aug 2025 07:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756279760; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2M0nZApW+mG+MMcDwKug6qOIPgjq6lz7plv/R5K0YHM=;
	b=ilOONc/FXz41I7qQpGgOjZqN3Tps26GgNE7G/S4OkC83SpWv9zAD5XXY+P8A1/pIZesVDQ
	fXOdpvdliodu4SgisO4pmUgmHdSXuuz/eu+Ixx1Hx4h4G9J/Rzf5lSBH3B5z5ohiGt+4XX
	gOsleShdufODZV1mkAV+RRX1oEO1VsQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756279760;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2M0nZApW+mG+MMcDwKug6qOIPgjq6lz7plv/R5K0YHM=;
	b=w5MreFx6ztkPJ8AuLOWmGalsgDkJ+l3P7gAIVXZ3WJJRH8i93jR6sMtPFOyyYPiNcfgJl0
	SFZPFOlNCiLYy/Bg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756279760; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2M0nZApW+mG+MMcDwKug6qOIPgjq6lz7plv/R5K0YHM=;
	b=ilOONc/FXz41I7qQpGgOjZqN3Tps26GgNE7G/S4OkC83SpWv9zAD5XXY+P8A1/pIZesVDQ
	fXOdpvdliodu4SgisO4pmUgmHdSXuuz/eu+Ixx1Hx4h4G9J/Rzf5lSBH3B5z5ohiGt+4XX
	gOsleShdufODZV1mkAV+RRX1oEO1VsQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756279760;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2M0nZApW+mG+MMcDwKug6qOIPgjq6lz7plv/R5K0YHM=;
	b=w5MreFx6ztkPJ8AuLOWmGalsgDkJ+l3P7gAIVXZ3WJJRH8i93jR6sMtPFOyyYPiNcfgJl0
	SFZPFOlNCiLYy/Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0132113867;
	Wed, 27 Aug 2025 07:29:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8CCMOs+zrmjoagAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 27 Aug 2025 07:29:19 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 04/25] ALSA: hda/realtek: Use cleanup macros for PM controls
Date: Wed, 27 Aug 2025 09:28:44 +0200
Message-ID: <20250827072916.31933-5-tiwai@suse.de>
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
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80

The new macro CLASS(snd_hda_power_pm) can replace the manual
snd_hda_power_up_pm() and _down() calls gracefully.

Merely code cleanups and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/realtek/alc269.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 0323606b3d6d..e2e65845d329 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -1224,9 +1224,8 @@ static void alc_update_vref_led(struct hda_codec *codec, hda_nid_t pin,
 	pinval &= ~AC_PINCTL_VREFEN;
 	pinval |= on ? AC_PINCTL_VREF_80 : AC_PINCTL_VREF_HIZ;
 	/* temporarily power up/down for setting VREF */
-	snd_hda_power_up_pm(codec);
+	CLASS(snd_hda_power_pm, pm)(codec);
 	snd_hda_set_pin_ctl_cache(codec, pin, pinval);
-	snd_hda_power_down_pm(codec);
 }
 
 /* update mute-LED according to the speaker mute state via mic VREF pin */
-- 
2.50.1

