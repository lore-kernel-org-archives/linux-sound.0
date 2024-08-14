Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36131A01C8
	for <linux-sound@vger.kernel.org>; Wed, 14 Aug 2024 10:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723629865; cv=none; b=qt0WeANagfXxoNeqNAM2ojTvMDVSXwJb96k1SQhfTKvHJQI8bdWFPHRl3ew2C1kwd8c6zeLG5gXRuoO3bfu/2nwNrcokbjZ0RENrFKc3sAl4WZ6Ms8ex73T+QbSc4dKM/7cI/6F6ryv8KZv6t9K25afjn1aeg5uJeVU0oFRXRzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723629865; c=relaxed/simple;
	bh=PbAfyLIPFtCMlJ3sMuiTLghkYsHaaeMC0f691sPOLD8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m52bBV4X4opk4H/RrmJEghchdjQFgubG53L2BceJ30ys67Uq0uNZ7pfei6by+4UBh+6MjdPC40n0xwOkg7H2sNttpmDTEaB6BKxNkyjn9BvGP3tuavdN+b9NYS7DiKWFC4own7fPSGgg4BKEjIA8qa4VC8Xmn75RWss9FK1mOdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=c7PVJjS6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fihG1QmM; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=c7PVJjS6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fihG1QmM; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="c7PVJjS6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fihG1QmM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="c7PVJjS6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fihG1QmM"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C3B032256D;
	Wed, 14 Aug 2024 10:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723629861; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=64woSCB94M0fVS40IY5IvkqFVWGDFP0zDjhNnflfWRo=;
	b=c7PVJjS6cxQ+7fZnLdSuISiuO5SNj5xl3z0SLK1tn+xKfQnsQqiYAhWShL9FRU74x33dsu
	bcMlSu/eBGlSdSEtNVZva6QlFLYzspczZol681OLEgsbng6g0FulEeO8G7dQMyxzfZPXN6
	KAZyBccHKXpzgF6jcQMGh802Uo8skUQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723629861;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=64woSCB94M0fVS40IY5IvkqFVWGDFP0zDjhNnflfWRo=;
	b=fihG1QmMQCi/7hjvW/gL+EHsWCt3dRawM45nLzLz4PVjlJ1q08YOIhvdWzX8YGPZBHQFVR
	3MVk3Gv6EjXbvfDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723629861; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=64woSCB94M0fVS40IY5IvkqFVWGDFP0zDjhNnflfWRo=;
	b=c7PVJjS6cxQ+7fZnLdSuISiuO5SNj5xl3z0SLK1tn+xKfQnsQqiYAhWShL9FRU74x33dsu
	bcMlSu/eBGlSdSEtNVZva6QlFLYzspczZol681OLEgsbng6g0FulEeO8G7dQMyxzfZPXN6
	KAZyBccHKXpzgF6jcQMGh802Uo8skUQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723629861;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=64woSCB94M0fVS40IY5IvkqFVWGDFP0zDjhNnflfWRo=;
	b=fihG1QmMQCi/7hjvW/gL+EHsWCt3dRawM45nLzLz4PVjlJ1q08YOIhvdWzX8YGPZBHQFVR
	3MVk3Gv6EjXbvfDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A3811139B9;
	Wed, 14 Aug 2024 10:04:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id vVqYJiWBvGbJfwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 14 Aug 2024 10:04:21 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Baojun Xu <baojun.xu@ti.com>
Subject: [PATCH] ALSA: hda/tas2781: Use correct endian conversion
Date: Wed, 14 Aug 2024 12:04:59 +0200
Message-ID: <20240814100500.1944-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
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
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo,intel.com:email];
	RCVD_TLS_ALL(0.00)[]

The data conversion is done rather by a wrong function.  We convert to
BE32, not from BE32.  Although the end result must be same, this was
complained by the compiler.

Fix the code again and align with another similar function
tas2563_apply_calib() that does already right.

Fixes: 3beddef84d90 ("ALSA: hda/tas2781: fix wrong calibrated data order")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202408141630.DiDUB8Z4-lkp@intel.com/
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/tas2781_hda_i2c.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index 7dbfc92d9d55..89d8235537cd 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -527,8 +527,8 @@ static void tas2781_apply_calib(struct tasdevice_priv *tas_priv)
 
 	for (i = 0; i < tas_priv->ndev; i++) {
 		for (j = 0; j < CALIB_MAX; j++) {
-			data = get_unaligned_be32(
-				&tas_priv->cali_data.data[offset]);
+			data = cpu_to_be32(
+				*(uint32_t *)&tas_priv->cali_data.data[offset]);
 			rc = tasdevice_dev_bulk_write(tas_priv, i,
 				TASDEVICE_REG(0, page_array[j], rgno_array[j]),
 				(unsigned char *)&data, 4);
-- 
2.43.0

