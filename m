Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE1726E6F7
	for <linux-sound@vger.kernel.org>; Thu, 21 Aug 2025 15:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755789479; cv=none; b=tCdd04QXvhVI9eBqlv6F8tdDQbPAKA2pRCZ8t+npzPtZHVzSq4IM0Jbso1v0Dr9hRf/4HzyPd9ZdBZIogVoR57NF35sxrM5Pv10+bnpGOB5+3s0p+XCf+o2DWLKMRmhypai8/dik2J0PtyE+qCMOsNdwR7rfdr/q3SzNhUbtDoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755789479; c=relaxed/simple;
	bh=TM+XeiGLe1XLBJHZiKJ9lLY48N7GtE855hl++zLFrxs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=A+ovoOn1dpavTRhIcxRpqHK+KjNQEkBhRjOsxbGrJlcVNhMyEPlZabI0ZjK/h9ruwjKY72ZKZ1n776Tcuo1/0ogUj5i7Vddxa3argFnmenFpuFfLlvWqyBeiVEh1cmsXjrEag+wJ2dotzGSzbvvnW3xswPMCZNkq/DQfORNRHmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mLgU9/am; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mLVD1gfA; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mLgU9/am; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mLVD1gfA; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mLgU9/am";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mLVD1gfA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mLgU9/am";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mLVD1gfA"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0CFCA1F7C9;
	Thu, 21 Aug 2025 15:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755789475; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=0xEn0ZelMmExUIJRl2Plb9Nca3s5f8PhxHPjlzu/vnk=;
	b=mLgU9/amZCFtKqUef7z32640frbE9OUkfqNXOvKx/Ixvs6DFs8WCsHOC8bSqeViLr5foZ7
	5P7IkCYsIM2CWGXV3W7CiCmeqOIS8+q29y2n0Xx5E1k4M2oaMqEsoezbIyQ3tT8iF+iXu4
	Egy/SNNP41q9wdzZf5E2g7fmx9Ryu7c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755789475;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=0xEn0ZelMmExUIJRl2Plb9Nca3s5f8PhxHPjlzu/vnk=;
	b=mLVD1gfAtO+5kh/QAN1tVWXELno77CJndXIRCqGiaB+PBQ2BXkLWYgngZqV2CmNWIO2H8J
	72Dvh7P2+3bwrdDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="mLgU9/am";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=mLVD1gfA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755789475; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=0xEn0ZelMmExUIJRl2Plb9Nca3s5f8PhxHPjlzu/vnk=;
	b=mLgU9/amZCFtKqUef7z32640frbE9OUkfqNXOvKx/Ixvs6DFs8WCsHOC8bSqeViLr5foZ7
	5P7IkCYsIM2CWGXV3W7CiCmeqOIS8+q29y2n0Xx5E1k4M2oaMqEsoezbIyQ3tT8iF+iXu4
	Egy/SNNP41q9wdzZf5E2g7fmx9Ryu7c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755789475;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=0xEn0ZelMmExUIJRl2Plb9Nca3s5f8PhxHPjlzu/vnk=;
	b=mLVD1gfAtO+5kh/QAN1tVWXELno77CJndXIRCqGiaB+PBQ2BXkLWYgngZqV2CmNWIO2H8J
	72Dvh7P2+3bwrdDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E83A8139A8;
	Thu, 21 Aug 2025 15:17:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id XwVhN6I4p2i0DgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 21 Aug 2025 15:17:54 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: Add validation of UAC2/UAC3 effect units
Date: Thu, 21 Aug 2025 17:17:50 +0200
Message-ID: <20250821151751.12100-1-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 0CFCA1F7C9
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
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01

Just add fixed struct size validations for UAC2 and UAC3 effect
units.  The descriptor has a variable-length array, so it should be
validated with a proper function later once when the unit is really
parsed and used by the driver (currently only referred partially for
the input terminal parsing).

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/validate.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/usb/validate.c b/sound/usb/validate.c
index a0d55b77c994..4bb4893f6e74 100644
--- a/sound/usb/validate.c
+++ b/sound/usb/validate.c
@@ -266,7 +266,11 @@ static const struct usb_desc_validator audio_validators[] = {
 	FUNC(UAC_VERSION_2, UAC_MIXER_UNIT, validate_mixer_unit),
 	FUNC(UAC_VERSION_2, UAC_SELECTOR_UNIT, validate_selector_unit),
 	FUNC(UAC_VERSION_2, UAC_FEATURE_UNIT, validate_uac2_feature_unit),
-	/* UAC_VERSION_2, UAC2_EFFECT_UNIT: not implemented yet */
+	/* just a stop-gap, it should be a proper function for the array
+	 * once if the unit is really parsed/used
+	 */
+	FIXED(UAC_VERSION_2, UAC2_EFFECT_UNIT,
+	      struct uac2_effect_unit_descriptor),
 	FUNC(UAC_VERSION_2, UAC2_PROCESSING_UNIT_V2, validate_processing_unit),
 	FUNC(UAC_VERSION_2, UAC2_EXTENSION_UNIT_V2, validate_processing_unit),
 	FIXED(UAC_VERSION_2, UAC2_CLOCK_SOURCE,
@@ -286,7 +290,8 @@ static const struct usb_desc_validator audio_validators[] = {
 	FUNC(UAC_VERSION_3, UAC3_MIXER_UNIT, validate_mixer_unit),
 	FUNC(UAC_VERSION_3, UAC3_SELECTOR_UNIT, validate_selector_unit),
 	FUNC(UAC_VERSION_3, UAC3_FEATURE_UNIT, validate_uac3_feature_unit),
-	/*  UAC_VERSION_3, UAC3_EFFECT_UNIT: not implemented yet */
+	FIXED(UAC_VERSION_3, UAC3_EFFECT_UNIT,
+	      struct uac2_effect_unit_descriptor), /* sharing the same struct */
 	FUNC(UAC_VERSION_3, UAC3_PROCESSING_UNIT, validate_processing_unit),
 	FUNC(UAC_VERSION_3, UAC3_EXTENSION_UNIT, validate_processing_unit),
 	FIXED(UAC_VERSION_3, UAC3_CLOCK_SOURCE,
-- 
2.50.1

