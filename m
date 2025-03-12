Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F60D2CCDB
	for <linux-sound@vger.kernel.org>; Wed, 12 Mar 2025 14:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741791408; cv=none; b=o6C+L7AsGUZFFG/C73LrbWvOweFujnIkMjLj8tmdB1I0znRwyflhKcJAmon1xU6/wcNA9Opa3D9C1lxQGHBYz24RBlHDFlvjzjHi+kG5EFZbLePiIZ3zillG6cDSA6QlJI2R6QdAs6G8NC5hmgOq85EBWh5Yn1stCD/FYCnFinw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741791408; c=relaxed/simple;
	bh=SwJ5kAeaGuhh9X3kHX2xyUWk/+jKztrIjbL849PlchQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RcDU0O6EZhCpl1aicmp5ALUlNp8U6AueGtyEiv1N0Q8RC0dCBepBiO6lHcnci0oceZ3nVnqsRXSXrss/f4AlT9FhoCw4/9DfK9UOntlud9JtOv6j+V3OHPEw/qvx/0vS2oJX6Rhn/vGEkz4V+xjD2g9H6k6M/X9grv6q552zreI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Hjz6Dan2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Os0AQf7D; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Hjz6Dan2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Os0AQf7D; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Hjz6Dan2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Os0AQf7D";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Hjz6Dan2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Os0AQf7D"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 22DBD1F388;
	Wed, 12 Mar 2025 14:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741791404; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=sIqc2Us3BPTUQvsevLAJTJdf209McDfdIXap2Dikfgc=;
	b=Hjz6Dan2OhOMBR6hJFXYLFYEScqRzDq3z5F2ZfdSB248svYZ+5oy3UydaNTKxakVGv7h5d
	mhK80abWhhoSAT4Jy+iXcoOv3n+oQ8ZsPQ17Hie3j/hlEFXUeBNlp4mOWlKpVkwMHvft8Z
	lN4t1P3eSswmRoTfkbHqW7zRzaNSG/4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741791404;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=sIqc2Us3BPTUQvsevLAJTJdf209McDfdIXap2Dikfgc=;
	b=Os0AQf7DXl+nrhr1Z7dQGXGlQ/NzW5tFKNuFoi3SJ2Hy/8a/0xLYHi7HhA0piXaQHPfNNX
	6xE9NhetnEkwz0Ag==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Hjz6Dan2;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Os0AQf7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741791404; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=sIqc2Us3BPTUQvsevLAJTJdf209McDfdIXap2Dikfgc=;
	b=Hjz6Dan2OhOMBR6hJFXYLFYEScqRzDq3z5F2ZfdSB248svYZ+5oy3UydaNTKxakVGv7h5d
	mhK80abWhhoSAT4Jy+iXcoOv3n+oQ8ZsPQ17Hie3j/hlEFXUeBNlp4mOWlKpVkwMHvft8Z
	lN4t1P3eSswmRoTfkbHqW7zRzaNSG/4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741791404;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=sIqc2Us3BPTUQvsevLAJTJdf209McDfdIXap2Dikfgc=;
	b=Os0AQf7DXl+nrhr1Z7dQGXGlQ/NzW5tFKNuFoi3SJ2Hy/8a/0xLYHi7HhA0piXaQHPfNNX
	6xE9NhetnEkwz0Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DC3D9132CB;
	Wed, 12 Mar 2025 14:56:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OmCZNKug0WflAQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 12 Mar 2025 14:56:43 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Maciej Strozek <mstrozek@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org
Subject: [PATCH] ASoC: cs42l43: Fix build error without CONFIG_PM
Date: Wed, 12 Mar 2025 15:56:39 +0100
Message-ID: <20250312145642.26646-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 22DBD1F388
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

Put __maybe_unused to work around the build error without CONFIG_PM
or CONFIG_PM_SLEEP for the newly defined system suspend callback.

Fixes: 164b7dd4546b ("ASoC: cs42l43: Add jack delay debounce after suspend")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/cs42l43.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index d307b56a7f38..4c7a598f5e73 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -2402,7 +2402,7 @@ static int cs42l43_codec_runtime_resume(struct device *dev)
 	return 0;
 }
 
-static int cs42l43_codec_runtime_force_suspend(struct device *dev)
+static int __maybe_unused cs42l43_codec_runtime_force_suspend(struct device *dev)
 {
 	struct cs42l43_codec *priv = dev_get_drvdata(dev);
 
-- 
2.43.0

