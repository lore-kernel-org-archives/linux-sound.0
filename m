Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EABDBA3D
	for <linux-sound@vger.kernel.org>; Sun,  8 Jun 2025 09:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749374068; cv=none; b=FthgLGNWZdPm7s1amOImlZqo0tZofj4YhyViQ4c24RL1iiBrihpZoZ+CrGqMGfaSCAfUNM/8jvzLJt+J2lpeus4ctrGjoltv9R+0R2debOktKdZOsx4jHBQ9I+FCRQNvG2t7Ss2SnZBw7KOH3ncoY/N3GHLGV+Hp0yaCRTprMO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749374068; c=relaxed/simple;
	bh=sqBQ9qexhP03hZCNqTalgvpvDqlI5ca9BwpBEd3eTtQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=NL8gNWp9gM0NQ+UMjPB/vkbVIhPSPThY7y34LH/uXIS+XYdJGWCv5KU8uTGJGQya+2IrKanXvpz0Y2jIqwD2+4TgvRtkPJihMFRNMHQXW+znu6DlZ0pmhg+2hGbP3jWWTAf9I0EkWq20IM3LdMk69QKKKhIZo3L0lKzvH9YFR3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=E6yTe/FF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jMvBk2T0; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=E6yTe/FF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jMvBk2T0; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="E6yTe/FF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jMvBk2T0";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="E6yTe/FF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jMvBk2T0"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 91CEE1F394;
	Sun,  8 Jun 2025 09:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749374057; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=5761d9QvXVsK3xsnzu6vCSuf4rzhTzUarBepGu6VRpY=;
	b=E6yTe/FFPnkGSA6rw96XxX9k6S3Ao9eo/PQRWblB6aTLpSpRrJ4HLqCiounUzb6bKOEgZ8
	AHCC4OZpR1BHSfnNUY/oyR8/CMSxZRFE97f91k/FP9ScK/7aok0owVgPLUChtsBmr18vVq
	Y2KuTomgodrILv/5H+43t0JNSYP3Klk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749374057;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=5761d9QvXVsK3xsnzu6vCSuf4rzhTzUarBepGu6VRpY=;
	b=jMvBk2T0LprCb/hP+Ao47oWCIpT928bdCdORUhXkLTCDPNyODb2Q6b1JXkWSjy9VK71nbf
	iHilkBitNjjbO6Aw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="E6yTe/FF";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=jMvBk2T0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749374057; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=5761d9QvXVsK3xsnzu6vCSuf4rzhTzUarBepGu6VRpY=;
	b=E6yTe/FFPnkGSA6rw96XxX9k6S3Ao9eo/PQRWblB6aTLpSpRrJ4HLqCiounUzb6bKOEgZ8
	AHCC4OZpR1BHSfnNUY/oyR8/CMSxZRFE97f91k/FP9ScK/7aok0owVgPLUChtsBmr18vVq
	Y2KuTomgodrILv/5H+43t0JNSYP3Klk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749374057;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=5761d9QvXVsK3xsnzu6vCSuf4rzhTzUarBepGu6VRpY=;
	b=jMvBk2T0LprCb/hP+Ao47oWCIpT928bdCdORUhXkLTCDPNyODb2Q6b1JXkWSjy9VK71nbf
	iHilkBitNjjbO6Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6A3B1133CF;
	Sun,  8 Jun 2025 09:14:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id X2tBGGlURWjYKQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 08 Jun 2025 09:14:17 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: hda/intel: Add Thinkpad E15 to PM deny list
Date: Sun,  8 Jun 2025 11:14:14 +0200
Message-ID: <20250608091415.21170-1-tiwai@suse.de>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 91CEE1F394
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01
X-Spam-Level: 

Lenovo Thinkpad E15 with Conexant CX8070 codec seems causing ugly
noises after runtime-PM suspend.  Disable the codec runtime PM as a
workaround.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=220210
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_intel.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index e5210ed48ddf..439cf1bda6e6 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -2283,6 +2283,8 @@ static const struct snd_pci_quirk power_save_denylist[] = {
 	SND_PCI_QUIRK(0x1734, 0x1232, "KONTRON SinglePC", 0),
 	/* Dell ALC3271 */
 	SND_PCI_QUIRK(0x1028, 0x0962, "Dell ALC3271", 0),
+	/* https://bugzilla.kernel.org/show_bug.cgi?id=220210 */
+	SND_PCI_QUIRK(0x17aa, 0x5079, "Lenovo Thinkpad E15", 0),
 	{}
 };
 
-- 
2.49.0

