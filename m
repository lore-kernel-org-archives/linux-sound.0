Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF93A2F363C
	for <linux-sound@vger.kernel.org>; Mon, 30 Mar 2026 16:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774887781; cv=none; b=u5zM7bP0rYxNlB/SSwF5EJFq+Zxn7FIUSMr+lh7izX5iu8LUCzs/OwWDa84etKWixNB1te/y1TZCHuAKM1lp5iQlUUzRXijItBHazJ/6AGbjc0t7pNKL+YkkM9c42f7+/qZcx/ClDzO35heONf4vEvZs+5gHtUuhkImDx39k9kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774887781; c=relaxed/simple;
	bh=pPtiPfU4vIwIg9vnFHDgaDUKwN2Kb6MmEIJ/cBhLuOE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h1tZfmx3GMopbfMf5aB8EdU3d6mpHtAo2+4xNOiXc58AJY2qjrVa6bsCUWyfN9omDHHm0/Fs1d8XapgUpSGmtsyou7JnauUTTL0z/hpzz90noJ4FcIctmdaqpFvK3cHXzl6zBXpKcbJqDe/KMmN5CznhReIDGpCnKUqpUoOHnNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NJPVo+LJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=M+XhiD4g; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NJPVo+LJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=M+XhiD4g; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NJPVo+LJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="M+XhiD4g";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NJPVo+LJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="M+XhiD4g"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 53AEB5BE52;
	Mon, 30 Mar 2026 16:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774887777; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=PGZ2gbA5A7+62YlNm1qWYGAM7MUuDudJ5oYEbCpYrIc=;
	b=NJPVo+LJPuHXW7QeM25YodjHrMBENX9a2PbVZP2BFQ5Mcu/O7TiAM/Xjbiq05RFss2ULS0
	BtZLdPqE5fReiVqMPKHLc/3xXRpd8LeAKGhYqA9lXiSZUWQQlb5Sf/MVLYRni7fRAFpCVK
	h8FpKNQmlncZrZe/wbFcC9ND28QDdFU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774887777;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=PGZ2gbA5A7+62YlNm1qWYGAM7MUuDudJ5oYEbCpYrIc=;
	b=M+XhiD4geYhtbhAc79tWycEZEDpMJEPvxZVwe0tG+3oRDeQiEJgcqNBHCjfBE7FwYMOtAH
	AKoikSY2CuQzZjAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774887777; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=PGZ2gbA5A7+62YlNm1qWYGAM7MUuDudJ5oYEbCpYrIc=;
	b=NJPVo+LJPuHXW7QeM25YodjHrMBENX9a2PbVZP2BFQ5Mcu/O7TiAM/Xjbiq05RFss2ULS0
	BtZLdPqE5fReiVqMPKHLc/3xXRpd8LeAKGhYqA9lXiSZUWQQlb5Sf/MVLYRni7fRAFpCVK
	h8FpKNQmlncZrZe/wbFcC9ND28QDdFU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774887777;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=PGZ2gbA5A7+62YlNm1qWYGAM7MUuDudJ5oYEbCpYrIc=;
	b=M+XhiD4geYhtbhAc79tWycEZEDpMJEPvxZVwe0tG+3oRDeQiEJgcqNBHCjfBE7FwYMOtAH
	AKoikSY2CuQzZjAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 339164A0A2;
	Mon, 30 Mar 2026 16:22:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Lq8tC2Gjyml5UgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 30 Mar 2026 16:22:57 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Throw <zakkabj@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add quirk for Samsung Book2 Pro 360 (NP950QED)
Date: Mon, 30 Mar 2026 18:22:20 +0200
Message-ID: <20260330162249.147665-1-tiwai@suse.de>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO

There is another Book2 Pro model (NP950QED) that seems equipped with
the same speaker module as the non-360 model, which requires
ALC298_FIXUP_SAMSUNG_AMP_V2_2_AMPS quirk.

Reported-by: Throw <zakkabj@gmail.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index c14046e09aa4..766d7bb2d4f5 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7409,6 +7409,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x144d, 0xc188, "Samsung Galaxy Book Flex (NT950QCT-A38A)", ALC298_FIXUP_SAMSUNG_AMP),
 	SND_PCI_QUIRK(0x144d, 0xc189, "Samsung Galaxy Book Flex (NT950QCG-X716)", ALC298_FIXUP_SAMSUNG_AMP),
 	SND_PCI_QUIRK(0x144d, 0xc18a, "Samsung Galaxy Book Ion (NP930XCJ-K01US)", ALC298_FIXUP_SAMSUNG_AMP),
+	SND_PCI_QUIRK(0x144d, 0xc1ac, "Samsung Galaxy Book2 Pro 360 (NP950QED)", ALC298_FIXUP_SAMSUNG_AMP_V2_2_AMPS),
 	SND_PCI_QUIRK(0x144d, 0xc1a3, "Samsung Galaxy Book Pro (NP935XDB-KC1SE)", ALC298_FIXUP_SAMSUNG_AMP),
 	SND_PCI_QUIRK(0x144d, 0xc1a4, "Samsung Galaxy Book Pro 360 (NT935QBD)", ALC298_FIXUP_SAMSUNG_AMP),
 	SND_PCI_QUIRK(0x144d, 0xc1a6, "Samsung Galaxy Book Pro 360 (NP930QBD)", ALC298_FIXUP_SAMSUNG_AMP),
-- 
2.53.0

