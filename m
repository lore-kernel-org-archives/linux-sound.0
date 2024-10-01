Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5FC1C1ACA
	for <linux-sound@vger.kernel.org>; Tue,  1 Oct 2024 12:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727784836; cv=none; b=AfXX91dCd3ThkGOSqHUxbZEKia7N6IB664NwidhsKVEoZrj8vIl/Lhb9TpeGDiftSg/ha4qtaJIENpBxDLVkSJP00OxDmyls5aHwMuzObNv2pxGfQZrqyXZtgHmCf9Mz2pSvEUyO/zQ31iQ8Czm7kkw9Ondfsv5MMWoyHz+OySk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727784836; c=relaxed/simple;
	bh=n0CFpsmvj9RZA2eppSA5wYc1t80Gk9el5R49YGtpKp4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=B+Ec/ry6JuTseMJaTAtIZJnKdTOYrKCFdSgZ2uNT6o2CKXmkHC2Knz568Fnzn2jCDJVkZCfHji8BKYMhRAgpUOi/L8KJAf3YUgZtvktSWejol4jn7uOUplw6uUdskDzAUlccltzcrX0NjqjGzQyDmr/RnCTS1FGle3xkupJF0GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=G3TxhUsR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MOjesYz8; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=G3TxhUsR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MOjesYz8; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="G3TxhUsR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MOjesYz8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="G3TxhUsR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MOjesYz8"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4C0F021AFD;
	Tue,  1 Oct 2024 12:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1727784832; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=kXBjpX3bExZchztpaKePHFWygbacgUedybBPDYPc2qs=;
	b=G3TxhUsRi3c6/CgApwB2LptP+h66oV88jitC3UfzggebzjyHJOgib2MXAiotq063FEq5v9
	oaOi4GFc553X8Y0bOYfxARzoj8GVaWIqsyTqbVk2lRmNQrX+h3U1m8CWIUOHGPix8AhL3g
	iNZJLgPXf2QAXKTHRRilQqM9tnVasTU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1727784832;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=kXBjpX3bExZchztpaKePHFWygbacgUedybBPDYPc2qs=;
	b=MOjesYz86sBy451Cb8lcRHeuyuY9PizCizDwS5MEXKb2kBCZ/DZbSiFxig77jeNJW+w1yZ
	9VqzGrE+w2fVDGBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1727784832; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=kXBjpX3bExZchztpaKePHFWygbacgUedybBPDYPc2qs=;
	b=G3TxhUsRi3c6/CgApwB2LptP+h66oV88jitC3UfzggebzjyHJOgib2MXAiotq063FEq5v9
	oaOi4GFc553X8Y0bOYfxARzoj8GVaWIqsyTqbVk2lRmNQrX+h3U1m8CWIUOHGPix8AhL3g
	iNZJLgPXf2QAXKTHRRilQqM9tnVasTU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1727784832;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=kXBjpX3bExZchztpaKePHFWygbacgUedybBPDYPc2qs=;
	b=MOjesYz86sBy451Cb8lcRHeuyuY9PizCizDwS5MEXKb2kBCZ/DZbSiFxig77jeNJW+w1yZ
	9VqzGrE+w2fVDGBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3D82713A6E;
	Tue,  1 Oct 2024 12:13:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id vkt4DoDn+2YFdQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 01 Oct 2024 12:13:52 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 1/2] ALSA: hda/generic: Unconditionally prefer preferred_dacs pairs
Date: Tue,  1 Oct 2024 14:14:36 +0200
Message-ID: <20241001121439.26060-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

Some time ago, we introduced the obey_preferred_dacs flag for choosing
the DAC/pin pairs specified by the driver instead of parsing the
paths.  This works as expected, per se, but there have been a few
cases where we forgot to set this flag while preferred_dacs table is
already set up.  It ended up with incorrect wiring and made us
wondering why it doesn't work.

Basically, when the preferred_dacs table is provided, it means that
the driver really wants to wire up to follow that.  That is, the
presence of the preferred_dacs table itself is already a "do-it"
flag.

In this patch, we simply replace the evaluation of obey_preferred_dacs
flag with the presence of preferred_dacs table for fixing the
misbehavior.  Another patch to drop of the obsoleted flag will
follow.

Fixes: 242d990c158d ("ALSA: hda/generic: Add option to enforce preferred_dacs pairs")
Link: https://bugzilla.suse.com/show_bug.cgi?id=1219803
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_generic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/hda_generic.c b/sound/pci/hda/hda_generic.c
index 9cff87dfbecb..b34d84fedcc8 100644
--- a/sound/pci/hda/hda_generic.c
+++ b/sound/pci/hda/hda_generic.c
@@ -1383,7 +1383,7 @@ static int try_assign_dacs(struct hda_codec *codec, int num_outs,
 		struct nid_path *path;
 		hda_nid_t pin = pins[i];
 
-		if (!spec->obey_preferred_dacs) {
+		if (!spec->preferred_dacs) {
 			path = snd_hda_get_path_from_idx(codec, path_idx[i]);
 			if (path) {
 				badness += assign_out_path_ctls(codec, path);
@@ -1395,7 +1395,7 @@ static int try_assign_dacs(struct hda_codec *codec, int num_outs,
 		if (dacs[i]) {
 			if (is_dac_already_used(codec, dacs[i]))
 				badness += bad->shared_primary;
-		} else if (spec->obey_preferred_dacs) {
+		} else if (spec->preferred_dacs) {
 			badness += BAD_NO_PRIMARY_DAC;
 		}
 
-- 
2.43.0

