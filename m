Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9652F204588
	for <linux-sound@vger.kernel.org>; Thu, 22 May 2025 20:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747947178; cv=none; b=qb7SfBFoznjcjLgzigPk8X8Yc8h2b0g6253l7926K35BKLM3IGP6l/1txWX7FBI8NZDIraG5ll9B6sHrcsl1kAPShTVgJHO2UNVMh7fWQeP819itgjqok/6Uj7kFTTKgtfJVWv6HRRu3Yo82bTwR0IUyY9uDXq24DHRO0Pgp4pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747947178; c=relaxed/simple;
	bh=KdMR2BM3mm1ZKc+moEjngA8oWUCsLspxJjd/muvAycA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QXvCL145vU9649sY7B8esZmGaEqsQLM9Gr7utYiIspAlNOATW9KyJZ27wIfkkDDOSgz6+M9setkbwwZVab2sR9nH773NCmxH6I0+OS1PTbJ4ydNX3Savjul0j7kM1IDTiVapm6j4tkOE9IO8GqslA21DrhEw60F5SetbPw8L6Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GKq/ElRZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Q22RtL6T; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=aEtNoJys; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BTcYSJjW; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GKq/ElRZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Q22RtL6T";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aEtNoJys";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BTcYSJjW"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B4E22211D0;
	Thu, 22 May 2025 20:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747947174; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Mo/WtfwK6K5wD2DMK7aR0nEI0E07pYjH7KY4z3+hV1c=;
	b=GKq/ElRZ2Dtm0+zrWE5+bbjo6GPAMjUR0RYuu+/U7zBGd4OYraDyVkAtzQprMXQz4OcUxM
	h4ftVn5FVcMFKyLHiwigpKkme8Ok3IFVitXrvT6bIDeJVrl9bKDXWC8jxPi5UpTkac8Q2G
	7hfILTapsOeQwvG3VZ4kxTrT8Tt4+nI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747947174;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Mo/WtfwK6K5wD2DMK7aR0nEI0E07pYjH7KY4z3+hV1c=;
	b=Q22RtL6Ti2ewyw+ncIobjbiW9woNUhwZv7Q7kJ3EFpewX9GoTWFWdgun0yIz3rku1+P68N
	pOUkD/MeSgjOkBCQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=aEtNoJys;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=BTcYSJjW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747947173; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Mo/WtfwK6K5wD2DMK7aR0nEI0E07pYjH7KY4z3+hV1c=;
	b=aEtNoJys/yYlTy1cnFAK9NcV0mNEyOPKHn1vMyGcxqVKgWbiGwGt8gNRHfhxwO92dWnaYL
	O0t68oXUDJYyOT5GyGJZjdxDKycWO9tmx6YWozaHHwhHS5rhp2mvIJK1wAiTED4T1B2NYp
	9JJTVaVfyzIAYC2WV/59QNhFmSurnEc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747947173;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Mo/WtfwK6K5wD2DMK7aR0nEI0E07pYjH7KY4z3+hV1c=;
	b=BTcYSJjWX+XO2tQJMdPOZCBJxnNfOXRKd6wKXLovqihb9q5EuUikb8xttZL7hRs3wMKfVa
	GQMs9G6QkPYVl+Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 99137137B8;
	Thu, 22 May 2025 20:52:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id v9bVI6WOL2jAfwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 22 May 2025 20:52:53 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Daniel Dadap <ddadap@nvidia.com>
Subject: [PATCH] ALSA: hda: acpi: Make driver's match data const static
Date: Thu, 22 May 2025 22:52:51 +0200
Message-ID: <20250522205252.4056-1-tiwai@suse.de>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,suse.de:dkim,intel.com:email];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.01
X-Rspamd-Queue-Id: B4E22211D0
X-Spam-Level: 
X-Spam-Flag: NO

The driver's match data, nvidia_hda_data, is referred only locally,
and should be static.  Also, as it's a read-only data, it can be
gracefully const, too.

Fixes: 4b214c9bbe26 ("ALSA: hda - Add new driver for HDA controllers listed via ACPI")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202505230426.k8ruTgnr-lkp@intel.com/
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/hda_acpi.c b/sound/pci/hda/hda_acpi.c
index 513f8fde198b..505cc97e0ee9 100644
--- a/sound/pci/hda/hda_acpi.c
+++ b/sound/pci/hda/hda_acpi.c
@@ -296,7 +296,7 @@ static const struct dev_pm_ops hda_acpi_pm = {
 	SYSTEM_SLEEP_PM_OPS(hda_acpi_suspend, hda_acpi_resume)
 };
 
-struct hda_data nvidia_hda_data = {
+static const struct hda_data nvidia_hda_data = {
 	.short_name = "NVIDIA",
 	.long_name = "NVIDIA HDA Controller",
 	.flags = AZX_DCAPS_CORBRP_SELF_CLEAR,
-- 
2.49.0

