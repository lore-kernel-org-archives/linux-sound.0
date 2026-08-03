Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A54274658
	for <linux-sound@vger.kernel.org>; Mon,  3 Aug 2026 14:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785765674; cv=none; b=QfUAI6Zin0uT8SkyoC5NqmiUztZpl/jvH7cooSwjSPruztoqUVytT/9wqFcia6xZ15vqZzjJF8vMGW1EDbqZ2EYLfOCAgnESTt99ttQCpplg88SrIOsA6wsGEgVnklg0nzr7h3g+TDejn5IQQDce4SxR4kD0pdAV8v0hU4uabcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785765674; c=relaxed/simple;
	bh=x+DWbUmAtWVR4+0Eao9m8Vd3gKb3mZz6xOPfWYmKpsE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NtKcSsnzluwwyoL3BsTpxPfRqpIihRsNJNI7FNEOiLfD+aTTD3QakQFd8AQ9AePh4t7KOW1f8akwDNHG8LQMyrYr7pz4EEsHa55kP8YpVbDnR5Jd42+4ymwDr4zNKpCjiMNUgPYVjSarWfhFSSN8EfIQI9mmV0NQjjPYXDFZveU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ljH0XFa+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=c/94CwZE; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=o986XdSw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=EQSRIxCF; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ljH0XFa+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="c/94CwZE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="o986XdSw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EQSRIxCF"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 328627F14B;
	Mon,  3 Aug 2026 14:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785765667; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=VT7S6gHC2uFUGjoZfa8RVDTSmk+j58lDlVO+oXI9nEc=;
	b=ljH0XFa+bT9RVkgjJyHPZ6mNbQwmhMD1Kbr0T5GmJsvzeqdBqIKIRUjn8FxM9zZPleg1Hg
	hgn++UifGbZfvbgJ877m2Cbiu4d6fSMHb1dEzWMZSuacXNdTdXPeceG49cVNA6NJANujs9
	ojBjiBMgRaNe6q9T20m54l6Vsc88YMM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785765667;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=VT7S6gHC2uFUGjoZfa8RVDTSmk+j58lDlVO+oXI9nEc=;
	b=c/94CwZEzuE0LEGlLpKBR776hg2LQ6q/zluClJRA02QLFT5gDmCXvmBsnaXIJ4k3gh63lt
	C6pAaSo8RlLlSUAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=o986XdSw;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=EQSRIxCF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785765663; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=VT7S6gHC2uFUGjoZfa8RVDTSmk+j58lDlVO+oXI9nEc=;
	b=o986XdSwmghLjBT2Z43vxcPIQNCUFboiCa6PMc9Ve+tUDLAUW/wpJnQ9ajbqtyV1NrGSY2
	P46ao2tnIHvuUsD5v9lPCxVuNpe3t7c27nrRaLYBb8XNmweNGX5uk+t/gwvxb7m+ITV/2S
	IrnP3454SH7hTwRwzNHAD9TdhnAwlRE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785765663;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=VT7S6gHC2uFUGjoZfa8RVDTSmk+j58lDlVO+oXI9nEc=;
	b=EQSRIxCF9/hWAz1GKbolHaGJIOVJ3a+Ju8p7M73DB+57O9P5zKiBPo1LcVWjlWb42esgiX
	h7a+SCdbj6keWkBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0F7E5779A1;
	Mon,  3 Aug 2026 14:01:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Aa3XAR+fcGpJKAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 03 Aug 2026 14:01:03 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Marco Giunta <marco_giunta@outlook.it>
Subject: [PATCH 1/3] ALSA: hda: aw88399: Use auto-cleanup for put_device()
Date: Mon,  3 Aug 2026 16:00:51 +0200
Message-ID: <20260803140100.919071-1-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
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
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid,suse.de:dkim];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,outlook.it];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid,suse.de:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCPT_COUNT_THREE(0.00)[3];
	FREEMAIL_ENVRCPT(0.00)[outlook.it]
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Queue-Id: 328627F14B
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

A temporary refcount management of a struct device can be done
gracefully with __clean(put_device) for avoiding potential leaks.

No functional change but just a code cleanup.

Cc: Marco Giunta <marco_giunta@outlook.it>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/side-codecs/aw88399_hda.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/hda/codecs/side-codecs/aw88399_hda.c b/sound/hda/codecs/side-codecs/aw88399_hda.c
index 42de68faddbc..5175d341ecbe 100644
--- a/sound/hda/codecs/side-codecs/aw88399_hda.c
+++ b/sound/hda/codecs/side-codecs/aw88399_hda.c
@@ -194,7 +194,6 @@ static const struct aw88399_prop_model aw88399_prop_model_table[] = {
 static int aw88399_hda_acpi_probe(struct aw88399_hda *aw88399)
 {
 	struct acpi_device *adev;
-	struct device *physdev;
 	const char *sub;
 	const struct aw88399_prop_model *model;
 
@@ -208,13 +207,13 @@ static int aw88399_hda_acpi_probe(struct aw88399_hda *aw88399)
 		return -ENODEV;
 	}
 
-	physdev = get_device(acpi_get_first_physical_node(adev));
+	struct device *physdev __free(put_device) =
+		get_device(acpi_get_first_physical_node(adev));
 	acpi_dev_put(adev);
 	if (!physdev)
 		return -ENODEV;
 
 	sub = acpi_get_subsystem_id(ACPI_HANDLE(physdev));
-	put_device(physdev);
 	if (IS_ERR_OR_NULL(sub))
 		return 0;
 
-- 
2.55.0

