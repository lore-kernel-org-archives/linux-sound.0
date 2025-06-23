Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C6C28B40A
	for <linux-sound@vger.kernel.org>; Mon, 23 Jun 2025 15:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750691926; cv=none; b=W4yBc53SemcOeCtTKq8j1slR+UkDPbkPCU/atoUpRE41smKAQxCD/uPAfG3cSSzNn6pfJmy2UdeNY3SzORmTWrRFBV0hRhAMxDjhEa6ZQyLZBDkCWkqm7tWqDYFNfQdiBtghDJHwJWwj704gMOmGtREcWyHKdK2pyaspRzVhYoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750691926; c=relaxed/simple;
	bh=8pHwSzLlsjtqdDjKuKihF3gBkSmwc03aUPXFgmhB/vE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=qdKMd8sp8X+CVAnF7OMYWavUabNS9p14Jcr2UonJrSDT+sOZDaPdZhvpS+JbXqn5nVf2r3qxjkji6pHi9/ExSz26Kjk4vrXtidxX3YcaF5NM7JDiM+az7mM4/em+FPEjICDtD1l85Aukfij0eO+O1afP2XIcO88KiqLVot4zrXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hLGo27pz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LpVM6xay; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vwdiZpoN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uxFiLbDB; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hLGo27pz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LpVM6xay";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vwdiZpoN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uxFiLbDB"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E91421F385;
	Mon, 23 Jun 2025 15:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750691923; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=R2r6QVIaTv31OT6YQ5XwfRqNEHiy6+GdX3FyCv2oJJY=;
	b=hLGo27pzDvR24j4hrt9BdQ6GYgCgX5lXcDSpCGJ2iNk2CF54tD4IhPjybdRYlDwnVKNGE7
	oKeKTQtiBX2L/pr9iwLXvvcGD8IB6TgnMld1HXMKjlFVCaPslDeLHmeYbf5lXltlTSvikG
	XUSxa8dVezgHdTP4FkeNqZ/JWJxG51w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750691923;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=R2r6QVIaTv31OT6YQ5XwfRqNEHiy6+GdX3FyCv2oJJY=;
	b=LpVM6xayIj+lDdaGLx+A6F1/7EOwyJBiyrE7ZLB32vzDaFJpW2pvhrrYQJUJBGJOfCdhus
	q+CZusOpKDGk43Bw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=vwdiZpoN;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=uxFiLbDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750691922; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=R2r6QVIaTv31OT6YQ5XwfRqNEHiy6+GdX3FyCv2oJJY=;
	b=vwdiZpoN/tTl7dTsO09bxzX5nn1orT5EY7X52nmXgEhdyztfckSg12pYGJDV+p4Xybf5Gm
	yCwOZHUKVLA/0dre7kXpVAm/Goj4NshEXofmQJ09NufzT5Kf6vL9krEcKHxztltNfH7WGE
	7JrEP+t73b3IVkULQjl6YvaEQjanVXo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750691922;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=R2r6QVIaTv31OT6YQ5XwfRqNEHiy6+GdX3FyCv2oJJY=;
	b=uxFiLbDBQ/Mnnv9zGTg2iyKOSYYLQPB2kjy6Kkz8miqgH28yl3HLjQg9pRYozfXn+vxxmL
	yVVxah/UJb+wlLDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CF44913A27;
	Mon, 23 Jun 2025 15:18:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UDNjMVJwWWhXdwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 23 Jun 2025 15:18:42 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: Add mic-mute LED setup for ASUS UM5606
Date: Mon, 23 Jun 2025 17:18:39 +0200
Message-ID: <20250623151841.28810-1-tiwai@suse.de>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: E91421F385
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01
X-Spam-Level: 

ASUS UM5606* models use the quirk to set up the bass speakers, but it
missed the mic-mute LED configuration.  Other similar models have the
AMD ACP dmic, and the mic-mute is set up for that, but those models
don't have AMD ACP but rather built-in mics of Realtek codec, hence
the Realtek driver should set it up, instead.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=220125
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 166730f00e5e..784644a2b51d 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6610,6 +6610,7 @@ static void alc294_fixup_bass_speaker_15(struct hda_codec *codec,
 	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
 		static const hda_nid_t conn[] = { 0x02, 0x03 };
 		snd_hda_override_conn_list(codec, 0x15, ARRAY_SIZE(conn), conn);
+		snd_hda_gen_add_micmute_led_cdev(codec, NULL);
 	}
 }
 
-- 
2.50.0

