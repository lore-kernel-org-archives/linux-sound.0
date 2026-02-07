Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CCC3090EE
	for <linux-sound@vger.kernel.org>; Sat,  7 Feb 2026 13:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770470014; cv=none; b=QUrEcAEVtBI53qXz1vzZlr88URbrN9xrbhYg7MGKWNT/6/mtJNK6nL/VeVULeTOyoF4dUT609Ppo6iVfJnnJP5m5WOHkpGU0eQizNEu7gWS8d7ZAl0n/Du67aC9caS8GMupVvMtaeejqcu1ayGfm/mwI4jw1ZpcKRX/GGx90RUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770470014; c=relaxed/simple;
	bh=CMrnUtcU7/ymXpxfYHAzYvdxtMQCVj/QIeL73cUvxEc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bW9o5yA2Km1LReRqWTY+RixuLkqYqFdMFmjUbvuUnbG++HUEsxyo+L16L4q7MTibzTPshL+X0JG3qWGCbOFygFqj2RnTptVBOqhTj+QgnPa9KEsEWWk1XqXSYgMOvehJ5ybsWQ8cRUMOFPXLkoAribT23Jw1frd8dda5iEzcibU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=P3k7Y2eG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=y1k74uAn; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=P3k7Y2eG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=y1k74uAn; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="P3k7Y2eG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="y1k74uAn";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="P3k7Y2eG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="y1k74uAn"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8182C5BCCB;
	Sat,  7 Feb 2026 13:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770470006; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=9N3leVFYOigzMr8Rd1iGe8oWWsElI5rtDm/HJRNO1sY=;
	b=P3k7Y2eGdfpWElewZGbTldsszZjlMfybbzu0cUvFAOExIk/tR1zu0KEkED2CcknO2Tt1Ib
	lk7aYMOndYYIDRsMckyg70re3oJ8ACPwkjacsfEZKC6Jjah+chgWxk948h5a0bVjF8UrFq
	OzDjriLUGUi3c+jainnkuwfAVzNJ5jA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770470006;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=9N3leVFYOigzMr8Rd1iGe8oWWsElI5rtDm/HJRNO1sY=;
	b=y1k74uAn0dHhqCQGvg5lVaHdCMMGJyaEcMa5eSfFwWN5G0xrvJEzeKBHLvJqdZ+yUPhyOs
	rnFFtAvw/PmLsJCg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=P3k7Y2eG;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=y1k74uAn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770470006; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=9N3leVFYOigzMr8Rd1iGe8oWWsElI5rtDm/HJRNO1sY=;
	b=P3k7Y2eGdfpWElewZGbTldsszZjlMfybbzu0cUvFAOExIk/tR1zu0KEkED2CcknO2Tt1Ib
	lk7aYMOndYYIDRsMckyg70re3oJ8ACPwkjacsfEZKC6Jjah+chgWxk948h5a0bVjF8UrFq
	OzDjriLUGUi3c+jainnkuwfAVzNJ5jA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770470006;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=9N3leVFYOigzMr8Rd1iGe8oWWsElI5rtDm/HJRNO1sY=;
	b=y1k74uAn0dHhqCQGvg5lVaHdCMMGJyaEcMa5eSfFwWN5G0xrvJEzeKBHLvJqdZ+yUPhyOs
	rnFFtAvw/PmLsJCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 50ED13EA63;
	Sat,  7 Feb 2026 13:13:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id xtIYEnY6h2lnNQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 07 Feb 2026 13:13:26 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: antonvg7@gmail.com
Subject: [PATCH] ALSA: hda/conexant: Add quirk for HP ZBook Studio G4
Date: Sat,  7 Feb 2026 14:13:17 +0100
Message-ID: <20260207131324.2428030-1-tiwai@suse.de>
X-Mailer: git-send-email 2.52.0
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
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Rspamd-Queue-Id: 8182C5BCCB
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 

It was reported that we need the same quirk for HP ZBook Studio G4
(SSID 103c:826b) as other HP models to make the mute-LED working.

Cc: <stable@vger.kernel.org>
Link: https://lore.kernel.org/64d78753-b9ff-4c64-8920-64d8d31cd20c@gmail.com
Link: https://bugzilla.kernel.org/show_bug.cgi?id=221002
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/conexant.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/conexant.c b/sound/hda/codecs/conexant.c
index 2384e64eada3..5623d8c0a0f7 100644
--- a/sound/hda/codecs/conexant.c
+++ b/sound/hda/codecs/conexant.c
@@ -1081,6 +1081,7 @@ static const struct hda_quirk cxt5066_fixups[] = {
 	SND_PCI_QUIRK(0x103c, 0x8174, "HP Spectre x360", CXT_FIXUP_HP_SPECTRE),
 	SND_PCI_QUIRK(0x103c, 0x822e, "HP ProBook 440 G4", CXT_FIXUP_MUTE_LED_GPIO),
 	SND_PCI_QUIRK(0x103c, 0x8231, "HP ProBook 450 G4", CXT_FIXUP_MUTE_LED_GPIO),
+	SND_PCI_QUIRK(0x103c, 0x826b, "HP ZBook Studio G4", CXT_FIXUP_MUTE_LED_GPIO),
 	SND_PCI_QUIRK(0x103c, 0x828c, "HP EliteBook 840 G4", CXT_FIXUP_HP_DOCK),
 	SND_PCI_QUIRK(0x103c, 0x8299, "HP 800 G3 SFF", CXT_FIXUP_HP_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x103c, 0x829a, "HP 800 G3 DM", CXT_FIXUP_HP_MIC_NO_PRESENCE),
-- 
2.52.0

