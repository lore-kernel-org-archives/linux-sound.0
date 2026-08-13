Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92045485515
	for <linux-sound@vger.kernel.org>; Thu, 13 Aug 2026 15:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786633451; cv=none; b=J5uC7NjWHlZDqvV3VdUI13oboom6/kpwjKz2wSXqgJ5E2Skr/kXPVawIU/8ImCAGLwUR+ZP8yG495KnGC2Oh6cHLOXudpMSyPDQ48y7WOKK7VkDbM/bCWaxwETZDdPqhUpeYTbTrTq4lAO6Stubi7yL0NKxo+PpGq7kM/7N1Wy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786633451; c=relaxed/simple;
	bh=80UIt5lSnDZjy51kBQ6B+3CH+OvvQctNnyrI0fowceU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=GjrdbDhyPeANaOW4C0fPTz1lwjs+WbXo4B/R8HIe73cd+NicBicBi+dpxGnbjAKb/WItrUpBkxf40Ki9t18lCbhaRUZ6oBlSUaZ1Jv40NZNNydcpoHobBhhuy7Av2gtHFlVm4DKX0CqcuR8w6fbpbz0LipT6dGXueFcfIIHX2wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=N1ILWKoq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=iWNwamXi; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vzNy8uxu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eAoSHBjy; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="N1ILWKoq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iWNwamXi";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vzNy8uxu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eAoSHBjy"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7BFBE8289F;
	Thu, 13 Aug 2026 15:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786633443; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=yQJG4oNscfZmTFqClATW8REoLKCBxoSV56VVYazxwno=;
	b=N1ILWKoqXvqkT3nwT0NSEbpLdNYTNWWydo6gBeYXj+vd4Eat8J+JKHVFNI4DJ34geZ42ne
	lZf30QDV2ju/pokk8GRPijsGVJJegZzyWPbzD+BXBDGuprFeqMtzwdEGMCnNWt/S27CU5U
	o24yq1qGvxeN+weqyrNVHBFpvKxzgRE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786633443;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=yQJG4oNscfZmTFqClATW8REoLKCBxoSV56VVYazxwno=;
	b=iWNwamXi6mFBKb8I+ckXE4GwLUDimxojWCDRfVYZzpi/sEhB3/+fPKTF89Luvi9hwebt9z
	kvP6ue1hWn/JmhDg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=vzNy8uxu;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=eAoSHBjy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786633439; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=yQJG4oNscfZmTFqClATW8REoLKCBxoSV56VVYazxwno=;
	b=vzNy8uxubOsej0Ir3JbQhfq0TMLLtGYQwauSYSbGrRBrbnyotHY0pyWjjN2LpbhgHccfTA
	Kjt4ZkrJrwHZdtjPdiApG+iy36wmQZuNKGtcRcccGwNsa8xxoaG09keOUKlVh6Oim8zyP7
	wC4nDHaw5aJixXhJvN+DaKqRv2NcPgs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786633439;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=yQJG4oNscfZmTFqClATW8REoLKCBxoSV56VVYazxwno=;
	b=eAoSHBjyiYvbQp9RThBUoDggbYOXmY9Jsl8z8wpvJTjWejJtY9O29hM970iZvwBrVjBW6e
	sezWoFMjq1rty9CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6279577E97;
	Thu, 13 Aug 2026 15:03:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id pUjAFt/cfWpFZgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Aug 2026 15:03:59 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: hda/intel: Add sanity check for BAR0 size
Date: Thu, 13 Aug 2026 17:03:49 +0200
Message-ID: <20260813150354.763502-1-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 7BFBE8289F
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,appspotmail.com:email,syzkaller.appspot.com:url,suse.de:mid,suse.de:email,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

The recent reports from syzkaller showed that we can bind any wild PCI
device to HD-audio controller, and if PCI BAR of the device is too
small, it may lead to a crash, as the driver believes as if the full
register range were accessible.

For avoiding such a problem, add a safeguard before the actual probe
to check the available BAR0 size.

Note that the threshold (0x200) is chosen to cover all needed
registers at probing.  But this doesn't mean that it would cover fully
for all features including the extended ones.

Reported-by: syzbot+10cd2d1efe8eeb604bee@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=10cd2d1efe8eeb604bee
Reported-by: syzbot+5ebe7cd17e48b4293660@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=5ebe7cd17e48b4293660
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/controllers/intel.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/hda/controllers/intel.c b/sound/hda/controllers/intel.c
index 8f592032ac15..1e6d97e08fee 100644
--- a/sound/hda/controllers/intel.c
+++ b/sound/hda/controllers/intel.c
@@ -2197,6 +2197,15 @@ static int azx_probe(struct pci_dev *pci,
 		dev_warn(&pci->dev, "dmic_detect option is deprecated, pass snd-intel-dspcfg.dsp_driver=1 option instead\n");
 	}
 
+	/* A sanity check against wild device binding;
+	 * here the range 0x200 is enough for the registers used at probe,
+	 * but it doesn't mean covering all HD-audio registers
+	 */
+	if (pci_resource_len(pci, 0) < 0x200) {
+		dev_err(&pci->dev, "Too small PCI BAR0\n");
+		return -EINVAL;
+	}
+
 	err = snd_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
 			   0, &card);
 	if (err < 0) {
-- 
2.55.0

