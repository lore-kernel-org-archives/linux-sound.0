Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88ACD140369
	for <linux-sound@vger.kernel.org>; Thu,  8 Aug 2024 18:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723141355; cv=none; b=bopmob3pGjCOCukcRzPFN1HMzfTQ8ofmmUYSEDfce1oR6nQhUy1wkIbBt8LjxKmUHUCQ0odTmIS0z/z9LfevRF1V/E727hkwBiT79mxtH/HLJqMY0BTS2valz1Cxdv55rgARPMhB5LSE2g2KaCtqgbmpAsxqmyiVU+XYqjMyK3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723141355; c=relaxed/simple;
	bh=xbnIuYYxz3ljTKjsrKGCGK5SYzh86yoU0GEIVbl4xEM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=kjiarJW9LN8NYw1+yJObBHIwepPz3rgGnphnJB5+N0skQC2uhYIx6xybl6chkBN2i/w58YRQS0vbdkzjYcbbPHCIOUlB8jKHbe5pNd3EdTzbjYss/R12ZZhGSK7F7lWDJSOb5I9N5oUvqOe0pyjOKVBM+S8XDlgF6x8DqVGUsiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=N06RwiJd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pNuVh+hP; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=N06RwiJd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pNuVh+hP; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="N06RwiJd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pNuVh+hP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="N06RwiJd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pNuVh+hP"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 89A4921D98;
	Thu,  8 Aug 2024 18:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723141351; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Uyar/R+L8VZnKUv0UulPPBllCQgJ/LCtVDskpu1iD6A=;
	b=N06RwiJdZnPmhbbLOS8oLGKL/kcX5R3KNPj9AVY9eSclAHfBPzrZ836Mr4wRyeqdUp6gjH
	3gegJK5THScEPyXMecpt7v/FmLDTrAWyJRd32GD3ieYRbSnGDwXWwJ6gVfzhtk7cUK8xGq
	hfRvi44IMcCYT39UcxuPqm6Wyw0Bbnc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723141351;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Uyar/R+L8VZnKUv0UulPPBllCQgJ/LCtVDskpu1iD6A=;
	b=pNuVh+hPBRsetzgZgTDf1RHCkSm1dQMsoINMOdVXgttUCIkx4J78o5bm1DneQ88o1xEVqh
	9ddXyP/U8hxDaoCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723141351; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Uyar/R+L8VZnKUv0UulPPBllCQgJ/LCtVDskpu1iD6A=;
	b=N06RwiJdZnPmhbbLOS8oLGKL/kcX5R3KNPj9AVY9eSclAHfBPzrZ836Mr4wRyeqdUp6gjH
	3gegJK5THScEPyXMecpt7v/FmLDTrAWyJRd32GD3ieYRbSnGDwXWwJ6gVfzhtk7cUK8xGq
	hfRvi44IMcCYT39UcxuPqm6Wyw0Bbnc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723141351;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Uyar/R+L8VZnKUv0UulPPBllCQgJ/LCtVDskpu1iD6A=;
	b=pNuVh+hPBRsetzgZgTDf1RHCkSm1dQMsoINMOdVXgttUCIkx4J78o5bm1DneQ88o1xEVqh
	9ddXyP/U8hxDaoCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 701CE13876;
	Thu,  8 Aug 2024 18:22:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cU0iGucMtWZ5TgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 08 Aug 2024 18:22:31 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: vxpocket: Fix a typo at conversion to dev_*()
Date: Thu,  8 Aug 2024 20:23:07 +0200
Message-ID: <20240808182308.28418-1-tiwai@suse.de>
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
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[suse.de:email,intel.com:email,imap1.dmz-prg2.suse.org:helo];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,imap1.dmz-prg2.suse.org:helo,suse.de:email]
X-Spam-Flag: NO
X-Spam-Level: 

There was a typo in the previous conversion to dev_*() that caused a
build error.  Fix it.

Fixes: 2acbb5e57230 ("ALSA: vxpocket: Use standard print API")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202408090110.t0mWbTyh-lkp@intel.com/
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pcmcia/vx/vxpocket.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pcmcia/vx/vxpocket.c b/sound/pcmcia/vx/vxpocket.c
index 5f72c73eac85..d2d5f64d63b4 100644
--- a/sound/pcmcia/vx/vxpocket.c
+++ b/sound/pcmcia/vx/vxpocket.c
@@ -268,7 +268,7 @@ static int vxpocket_probe(struct pcmcia_device *p_dev)
 	err = snd_card_new(&p_dev->dev, index[i], id[i], THIS_MODULE,
 			   0, &card);
 	if (err < 0) {
-		dev_err(&pdev->dev, "vxpocket: cannot create a card instance\n");
+		dev_err(&p_dev->dev, "vxpocket: cannot create a card instance\n");
 		return err;
 	}
 
-- 
2.43.0

