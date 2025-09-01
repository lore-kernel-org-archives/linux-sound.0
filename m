Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CDB31CA78
	for <linux-sound@vger.kernel.org>; Mon,  1 Sep 2025 11:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756727415; cv=none; b=O88AUDzqkndyhkZ4U/JZ9Qk/Y3ro/8EwuAxMo+2LhpfXx1V/m3upC0LtYV2aYVuKpUluu/Yl3apkJEb9126JIX8j5BUk7Mix3Lc05pkOCP8KUWws4E5ICpgzsmtpnhVh4i7i+3bJvwkZ8diZPz0sGIPf7d3OS8J7/gGNK9eFnPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756727415; c=relaxed/simple;
	bh=Zba6VGv3rDO0f/4ec322g1ZtQxOtBrOb6Mhkkdw2Fsk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=ryOlD5hsLTBDPrYrARV8TnHBVXcKzJC+XxqXVOU3hlTAvTYGkqVh5+C5M0+J1J1kFUZt3c9WpAdO04/gcYHDMN31/F8356e24aFQp2+Iud2Ky34fKkojMZa3ptgGzYdZ4KTRMXQmhrvqXq9RgbJy3/OndDpsNTJznQh1h5dhUuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PJ79KZrh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=plA/B34L; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PJ79KZrh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=plA/B34L; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PJ79KZrh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="plA/B34L";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PJ79KZrh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="plA/B34L"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 083E421182;
	Mon,  1 Sep 2025 11:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756727411; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ahsEyFyfeXfCHJNcHEWmq6h7sbFmYQlKAHplT9/cx2s=;
	b=PJ79KZrhYCw3mblYJNc+TzRbrnDjrYaceM0ft0QlYENKt2nE/OUESxDyclEduzWXnX5LGW
	8Ru9cPUN32OXUR5yxJ8Luvwdn3mJ/iStQWHNtQhOIYvjtev5itf2QiNkPF62998QsBFOpV
	UXoNVWJ/B358tlpiAEZYonlHMQZfaSY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756727411;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ahsEyFyfeXfCHJNcHEWmq6h7sbFmYQlKAHplT9/cx2s=;
	b=plA/B34LISbQJYGFDDaoB2NpDck3xUWmWmsA9JBdzWtZ0veffjaIbLm9bZ7beB17JMkAgO
	imvCpuMc8LkvHuBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756727411; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ahsEyFyfeXfCHJNcHEWmq6h7sbFmYQlKAHplT9/cx2s=;
	b=PJ79KZrhYCw3mblYJNc+TzRbrnDjrYaceM0ft0QlYENKt2nE/OUESxDyclEduzWXnX5LGW
	8Ru9cPUN32OXUR5yxJ8Luvwdn3mJ/iStQWHNtQhOIYvjtev5itf2QiNkPF62998QsBFOpV
	UXoNVWJ/B358tlpiAEZYonlHMQZfaSY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756727411;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ahsEyFyfeXfCHJNcHEWmq6h7sbFmYQlKAHplT9/cx2s=;
	b=plA/B34LISbQJYGFDDaoB2NpDck3xUWmWmsA9JBdzWtZ0veffjaIbLm9bZ7beB17JMkAgO
	imvCpuMc8LkvHuBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E32961378C;
	Mon,  1 Sep 2025 11:50:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id JsQ6NnKItWihGwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 01 Sep 2025 11:50:10 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: hda/hdmi: Add pin fix for another HP EliteDesk 800 G4 model
Date: Mon,  1 Sep 2025 13:50:08 +0200
Message-ID: <20250901115009.27498-1-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80

It was reported that HP EliteDesk 800 G4 DM 65W (SSID 103c:845a) needs
the similar quirk for enabling HDMI outputs, too.  This patch adds the
corresponding quirk entry.

Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/hdmi/hdmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/hdmi/hdmi.c b/sound/hda/codecs/hdmi/hdmi.c
index b5d840d9892b..44576b30f699 100644
--- a/sound/hda/codecs/hdmi/hdmi.c
+++ b/sound/hda/codecs/hdmi/hdmi.c
@@ -1582,6 +1582,7 @@ static int hdmi_add_cvt(struct hda_codec *codec, hda_nid_t cvt_nid)
 static const struct snd_pci_quirk force_connect_list[] = {
 	SND_PCI_QUIRK(0x103c, 0x83e2, "HP EliteDesk 800 G4", 1),
 	SND_PCI_QUIRK(0x103c, 0x83ef, "HP MP9 G4 Retail System AMS", 1),
+	SND_PCI_QUIRK(0x103c, 0x845a, "HP EliteDesk 800 G4 DM 65W", 1),
 	SND_PCI_QUIRK(0x103c, 0x870f, "HP", 1),
 	SND_PCI_QUIRK(0x103c, 0x871a, "HP", 1),
 	SND_PCI_QUIRK(0x103c, 0x8711, "HP", 1),
-- 
2.50.1

