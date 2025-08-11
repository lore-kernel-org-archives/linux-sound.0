Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB149220685
	for <linux-sound@vger.kernel.org>; Mon, 11 Aug 2025 10:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754906963; cv=none; b=R3FWqDo2Lm+ub58hREj0WJ+CprSI86KqYs33dH4uRG5+4GqUR0NxAfkIedC0CBcOS+X+YcoL6xjqxxIYMTOLp152S0r4btGY89DyFOrREzTGXlDt51/0rfrHa82ZPOcRQTDxEnFKpbop5wbZQtFgHI8V51INJFa4qos3DitH5hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754906963; c=relaxed/simple;
	bh=8gWulAKkeL7vExpgn9wLbPDSdz26hZ1+HBmImfUDWIg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cJa4izTlr/JxevvSuC/pmCNNDQ0jc4KY+Gwbv7ykz2iiOOzvc+gNjv2VWRzU1/O/W7UmUEoWXLFPJ3HEN6wtbyIVVj7SZA9QWDFBwUsiPSyDyWJ5XFfbx/o3eehEoJo0+zeIKL7CffkBPK+fPg9d+qWiGQ0XlKtodOVUhN7L3ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MUtxEoi9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eKpY/BAG; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MUtxEoi9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eKpY/BAG; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MUtxEoi9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eKpY/BAG";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MUtxEoi9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eKpY/BAG"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E1FA933E6E;
	Mon, 11 Aug 2025 10:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754906897; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=71lLE4Jh20+xwz2Ngf87ixv0KX/oZUeKc5sDbmhi9wE=;
	b=MUtxEoi9ScgTrNgKMDC9vRxY3Oq9gLUvGnqwd6TUzImUed9521vp4xoh5a/9lsBGtOAGV4
	rvA71Q5ectM410mWo6HudfELczsPfWJLR6yJ4R1CnxVTQogvvW1GroV1byx5q7785D4Rwu
	PcCliXLYcGJFvM6sCiEnJs4zKEfgnkE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754906897;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=71lLE4Jh20+xwz2Ngf87ixv0KX/oZUeKc5sDbmhi9wE=;
	b=eKpY/BAGZy45I4UCBSWviF7YEGOWnmEx/Zs9MtiIpC+8XuFrqP4G0VdXKMZVYXDB6VDp8q
	ct/Nvw/jQg9ShhCA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=MUtxEoi9;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="eKpY/BAG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754906897; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=71lLE4Jh20+xwz2Ngf87ixv0KX/oZUeKc5sDbmhi9wE=;
	b=MUtxEoi9ScgTrNgKMDC9vRxY3Oq9gLUvGnqwd6TUzImUed9521vp4xoh5a/9lsBGtOAGV4
	rvA71Q5ectM410mWo6HudfELczsPfWJLR6yJ4R1CnxVTQogvvW1GroV1byx5q7785D4Rwu
	PcCliXLYcGJFvM6sCiEnJs4zKEfgnkE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754906897;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=71lLE4Jh20+xwz2Ngf87ixv0KX/oZUeKc5sDbmhi9wE=;
	b=eKpY/BAGZy45I4UCBSWviF7YEGOWnmEx/Zs9MtiIpC+8XuFrqP4G0VdXKMZVYXDB6VDp8q
	ct/Nvw/jQg9ShhCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AB76013479;
	Mon, 11 Aug 2025 10:08:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QGq5KBHBmWiVBwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 11 Aug 2025 10:08:17 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>
Subject: [PATCH 20/25] ALSA: hda/realtek: Use auto cleanup for temporary buffers
Date: Mon, 11 Aug 2025 12:07:54 +0200
Message-ID: <20250811100807.7962-21-tiwai@suse.de>
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
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: E1FA933E6E
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
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
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_RATELIMIT(0.00)[to_ip_from(RLs9qncch5cpanyka9neihc978)];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.01

The release of temporary kmalloced buffers can be nicely handled via
the standard __free(kfree).

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/realtek/realtek.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/hda/codecs/realtek/realtek.c b/sound/hda/codecs/realtek/realtek.c
index 1d0f9d16e6c0..d9203d5756a0 100644
--- a/sound/hda/codecs/realtek/realtek.c
+++ b/sound/hda/codecs/realtek/realtek.c
@@ -237,7 +237,7 @@ void alc_update_knob_master(struct hda_codec *codec,
 {
 	unsigned int val;
 	struct snd_kcontrol *kctl;
-	struct snd_ctl_elem_value *uctl;
+	struct snd_ctl_elem_value *uctl __free(kfree) = NULL;
 
 	kctl = snd_hda_find_mixer_ctl(codec, "Master Playback Volume");
 	if (!kctl)
@@ -251,7 +251,6 @@ void alc_update_knob_master(struct hda_codec *codec,
 	uctl->value.integer.value[0] = val;
 	uctl->value.integer.value[1] = val;
 	kctl->put(kctl, uctl);
-	kfree(uctl);
 }
 EXPORT_SYMBOL_NS_GPL(alc_update_knob_master, "SND_HDA_CODEC_REALTEK");
 
-- 
2.50.1

