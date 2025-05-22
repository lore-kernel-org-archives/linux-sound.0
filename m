Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA17224A05A
	for <linux-sound@vger.kernel.org>; Thu, 22 May 2025 20:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747946790; cv=none; b=KemeG38iZ+O9wp5J93vxOB73vF7r6gh7BbziB6B8Y59NRPMUOr34t+sUL9T2faQ1FFPa4Aim++x33a+EYI0pX5dfjB5rroxKfPRSDPUH81oMLRBKZjvgFXpAtjIfWWh2sBUwCqtWL9AkhOPmULihDMUF0GdGbs44OlY3FK0y4Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747946790; c=relaxed/simple;
	bh=hORnI4Yxj4l+GTDBP6A/ozuvFRfwKjCTG0TQrIf1xaE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MEEa6I14xqfdb1UVxy57SR0l0JSvQ/ybnmJJlOTrHhnvEiwcTtIOqoeSaQpcJ32cHRIgavmYEpDrJITF5E+598Lzkkle75LdTSOSuletmNWuBm0hb+DiXeontBNfmV8o5aPP4KCC8h+v+CfsE/yxhZ5v1YJdec1L+Gv7FU7gEjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UFKdDAfe; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wggeg9y8; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UFKdDAfe; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wggeg9y8; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UFKdDAfe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wggeg9y8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UFKdDAfe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wggeg9y8"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AC76A1FBEF;
	Thu, 22 May 2025 20:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747946786; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=fu4p03GuJDgAjmE846ibIZYHzn0km3Ey+PrgDTbfAgc=;
	b=UFKdDAfeJZC+SSE1Z90+Qdml0MCdSNRjRH/9VsFYrxdc4Y5N7ZfQ8gLDINbsNSwjaRODcX
	ieqgMtAA/we9wWOBIDZuQRXGzaDfCQ9lzsbYgqGf4ZXkSRq+HYcGg3j5x2Q230cfal0lSr
	sMvDVcwJnmRrJP3rhn06+iMMVZz5BKw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747946786;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=fu4p03GuJDgAjmE846ibIZYHzn0km3Ey+PrgDTbfAgc=;
	b=wggeg9y82kGqDQKZi33qHsk6iqOs5I1SvAaPE3Mn+IVGu1n/2nxKcvy7Dpw5D28J0H6bEJ
	iwEiHPs2MR8Y64AA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=UFKdDAfe;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=wggeg9y8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747946786; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=fu4p03GuJDgAjmE846ibIZYHzn0km3Ey+PrgDTbfAgc=;
	b=UFKdDAfeJZC+SSE1Z90+Qdml0MCdSNRjRH/9VsFYrxdc4Y5N7ZfQ8gLDINbsNSwjaRODcX
	ieqgMtAA/we9wWOBIDZuQRXGzaDfCQ9lzsbYgqGf4ZXkSRq+HYcGg3j5x2Q230cfal0lSr
	sMvDVcwJnmRrJP3rhn06+iMMVZz5BKw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747946786;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=fu4p03GuJDgAjmE846ibIZYHzn0km3Ey+PrgDTbfAgc=;
	b=wggeg9y82kGqDQKZi33qHsk6iqOs5I1SvAaPE3Mn+IVGu1n/2nxKcvy7Dpw5D28J0H6bEJ
	iwEiHPs2MR8Y64AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 928A5137B8;
	Thu, 22 May 2025 20:46:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QsbkIiKNL2g1fgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 22 May 2025 20:46:26 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Daniel Dadap <ddadap@nvidia.com>
Subject: [PATCH] ALSA: hda: acpi: Use SYSTEM_SLEEP_PM_OPS()
Date: Thu, 22 May 2025 22:46:23 +0200
Message-ID: <20250522204624.1757-1-tiwai@suse.de>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Bar: /
X-Spam-Flag: NO
X-Spam-Score: -0.01
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: AC76A1FBEF
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-0.01 / 50.00];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,suse.de:dkim];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]

The dev_pm_ops definition must be SYSTEM_SLEEP_PM_OPS() instead of
SET_SYSTEM_SLEEP_PM_OPS(); otherwise it leads compile warnings without
CONFIG_PM_SLEEP.  The latest patch version I took was back to an old
macro (likely mistakenly), and I overlooked it at applying.  Fix it
now.

Fixes: 4b214c9bbe26 ("ALSA: hda - Add new driver for HDA controllers listed via ACPI")
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Closes: https://lore.kernel.org/20250522203020.1478369-1-rdunlap@infradead.org
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/hda_acpi.c b/sound/pci/hda/hda_acpi.c
index c90865ca876e..513f8fde198b 100644
--- a/sound/pci/hda/hda_acpi.c
+++ b/sound/pci/hda/hda_acpi.c
@@ -293,7 +293,7 @@ static int hda_acpi_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops hda_acpi_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(hda_acpi_suspend, hda_acpi_resume)
+	SYSTEM_SLEEP_PM_OPS(hda_acpi_suspend, hda_acpi_resume)
 };
 
 struct hda_data nvidia_hda_data = {
-- 
2.49.0

