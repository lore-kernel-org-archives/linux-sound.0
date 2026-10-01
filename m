Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CB85226AB
	for <linux-sound@vger.kernel.org>; Thu,  1 Oct 2026 15:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790867453; cv=none; b=hcuSfbrtIIghnf7V0fYSMLhdj9yqRP/OxWV9qUcmKgkbKKPxKElDVOEOuGfPqmF0+DOh3HkqG2UO8k6Ujr6AhaCBpqk+/VOXt3lBP64TjyJ4BXHxZvvPNPl9QIWCKF5ppgncGyFOBDHtvW8f3m5qnNzdCi+dQ2evNPzwC/ux7sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790867453; c=relaxed/simple;
	bh=Gafn5CXt2Bdes7H9rLiq2DWqYxW/Xv6/YTUa0IqR8sw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=SxPlxOmhCbnVbhm4Iy3eMWzF3me5aWQbeZdjGUWKEPb9YVNu7VS/MhQEdSAQgRx/nEfpSQhA8F22gWA5Hd6ld7rsKAjElbbEAzy2RYw1SKGp8sGym+WvPuc6G/jlcblsLmEwY1tf5Odrfa7+vHZ8BLRtG1zeQiVY5Cgbb/ZnOOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=At1cvbVy; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jmLAovEf; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=x6T+MqRr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JiNX6T4F; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="At1cvbVy";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jmLAovEf";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="x6T+MqRr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JiNX6T4F"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B3DF31FD0E;
	Thu,  1 Oct 2026 15:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790867445; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=7DVlo1026kXYT6KNd+Mwg2cdfJyDckRkSPeE5DkHcD4=;
	b=At1cvbVyB2Lp0e6cbaggJV7Wz/wFjUe64Jb6EYgLj5SSIyI9ti0D25IkvFsu/IsxW/+rpO
	sFqIK3W8Cl7gl3WIK7kI3wx0k0RPZ/L+ZFIDmr0qhV2t8o1AfplsBqMiO4tbV5EkxbpB2/
	ltLxTL9VXtyNzVOEND6v/zenDo4w11E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790867445;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=7DVlo1026kXYT6KNd+Mwg2cdfJyDckRkSPeE5DkHcD4=;
	b=jmLAovEfg5CR04cG1AlAg1WXXzVWNDnsItdr+ylXwKAOKN748iawrgYRV6uNz7Q47DO6Tp
	a7zs6+tX7ugtIFDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790867441; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=7DVlo1026kXYT6KNd+Mwg2cdfJyDckRkSPeE5DkHcD4=;
	b=x6T+MqRrlhKR8/3ZvEqS+Kdx4dDET9YtDCEcNpuXF3xXnW5Fjr+a1kSttq+5sKUQKCFe3b
	eD2fHkPnxkeH6MYmoU2j1YXiez3Ax+7rRPXmckPcDrDPsbCeL+NK/P7PLxFCx/fLG6LWpL
	dU24jLGqx2xYhEU6pUluTN/bRgeyX8Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790867441;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=7DVlo1026kXYT6KNd+Mwg2cdfJyDckRkSPeE5DkHcD4=;
	b=JiNX6T4FNhvpRiYk59yTLMJqPjtxR2Oenh8uBFo8LqtjOt4MjkTpB9AX+YX37FbEQdT1np
	ifWMD+FtgTOKgpDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 78BDD13B83;
	Thu,  1 Oct 2026 15:10:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id PlFQEvF3vmrKHwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 01 Oct 2026 15:10:41 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 1/2] ALSA: core: Define auto-cleanup for snd_card_free()
Date: Thu,  1 Oct 2026 17:10:35 +0200
Message-ID: <20261001151039.592033-1-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Flag: NO

For the errors at the probe time, we'd need to call rather
snd_card_free() instead of the snd_card_unref() -- the former calls
explicitly snd_card_disconnect() that cleans up the registered
devices, etc, while the latter may leak in corner cases.

For convenience, define a new auto-clean with snd_card_free.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/core.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/sound/core.h b/include/sound/core.h
index 2ca24ac7e37f..15be947a730e 100644
--- a/include/sound/core.h
+++ b/include/sound/core.h
@@ -340,6 +340,15 @@ static inline void snd_card_unref(struct snd_card *card)
 
 DEFINE_FREE(snd_card_unref, struct snd_card *, if (_T) snd_card_unref(_T))
 
+/*
+ * For automatic error handling at probe time, assign the card like:
+ *	struct snd_card *card __free(snd_card_free) = NULL;
+ * then create and process as usual.
+ * But, don't forget to clear to NULL at successful return for avoiding
+ * the unexpected cleanup!
+ */
+DEFINE_FREE(snd_card_free, struct snd_card *, if (_T) snd_card_free(_T))
+
 #define snd_card_set_dev(card, devptr) ((card)->dev = (devptr))
 
 /* device.c */
-- 
2.55.0

