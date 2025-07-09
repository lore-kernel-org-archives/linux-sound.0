Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F128228F955
	for <linux-sound@vger.kernel.org>; Wed,  9 Jul 2025 16:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752077599; cv=none; b=LNN2My5KkVUXUMd+8KoXnCed/v4bxXxQ24gY1cA7rxFIrcDmElXMIYSyb8QBnEi0XMmy8nvD1Xq0hYNNdBXKZdyJMWGWdUE5n6uR6v5xzpgQ3oavoxBzC3laCxIzkaw+wnmU85+6RSe1//ygX1cd9NvejEepVmFyOMPgtHCPrBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752077599; c=relaxed/simple;
	bh=BZR17thD39U+AYUHKhq5LL5RqtrrMNrhRWzBhQ3lIPM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kNRJYmX3LcLTNdhhTVUtQIJGeX3POLpsl2Cf1g9ZjOnyeu5V/6zPqK2mnSxA5ZoTsdQz0HeMzXpXkrhwqn+OAHaCoRDBv5w1cVU5Rf6PUWpRZee4KyzaGI2P4V/hgFK4W9oVMHWceU01iu0Eu594I4YenBQIVs2u/xOcSn2TvRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=s1jGcWPk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AlrkTwyc; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=s1jGcWPk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AlrkTwyc; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="s1jGcWPk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AlrkTwyc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="s1jGcWPk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AlrkTwyc"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 14A6721191;
	Wed,  9 Jul 2025 16:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752077103; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OoLUnigK9j7EmIb6jxF5ULaSeQfLnztbPhkMlVjvv4I=;
	b=s1jGcWPkAguCy5FA0hVDAY93cbEhUa1t4RFqe+HvGm/Z2MZcVyez6MKt1vHi/WyG3AWnmg
	7bZKEVRRccJvfSwLcJs0OoPc+IZ4G7tvVj2J1TYRf5buRl1cIiO6iXIvJj+92+x0MtlOR/
	huVXqzo2XG3vm7TIbBjqsw1k9aTz7rQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752077103;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OoLUnigK9j7EmIb6jxF5ULaSeQfLnztbPhkMlVjvv4I=;
	b=AlrkTwycHlMymEVzNqRaYtY+5PsAegUkpbDQF4/MX8OFZyK893OhRo0cl5ZuTQvuNOlG4z
	pJS5Xd+DGC3FJjAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752077103; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OoLUnigK9j7EmIb6jxF5ULaSeQfLnztbPhkMlVjvv4I=;
	b=s1jGcWPkAguCy5FA0hVDAY93cbEhUa1t4RFqe+HvGm/Z2MZcVyez6MKt1vHi/WyG3AWnmg
	7bZKEVRRccJvfSwLcJs0OoPc+IZ4G7tvVj2J1TYRf5buRl1cIiO6iXIvJj+92+x0MtlOR/
	huVXqzo2XG3vm7TIbBjqsw1k9aTz7rQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752077103;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OoLUnigK9j7EmIb6jxF5ULaSeQfLnztbPhkMlVjvv4I=;
	b=AlrkTwycHlMymEVzNqRaYtY+5PsAegUkpbDQF4/MX8OFZyK893OhRo0cl5ZuTQvuNOlG4z
	pJS5Xd+DGC3FJjAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C37EE13998;
	Wed,  9 Jul 2025 16:05:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8CmULi6TbmhDEAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 09 Jul 2025 16:05:02 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
	Kailang <kailang@realtek.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>,
	patches@opensource.cirrus.com,
	Baojun Xu <baojun.xu@ti.com>,
	bo liu <bo.liu@senarytech.com>
Subject: [PATCH 27/27] ALSA: hda: Return the codec init error properly at snd_hda_codec_build_controls()
Date: Wed,  9 Jul 2025 18:04:30 +0200
Message-ID: <20250709160434.1859-28-tiwai@suse.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250709160434.1859-1-tiwai@suse.de>
References: <20250709160434.1859-1-tiwai@suse.de>
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
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_RATELIMIT(0.00)[to_ip_from(RL7bz5f8woybp4997xe1n6ecoy)];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80

The error from snd_hda_codec_init() was ignored in
snd_hda_codec_build_controls(), which should have been taken account
and abort the flow.  Fix it now.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/common/codec.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/hda/common/codec.c b/sound/hda/common/codec.c
index fa07a296abe8..8e47769ef0ce 100644
--- a/sound/hda/common/codec.c
+++ b/sound/hda/common/codec.c
@@ -3065,14 +3065,16 @@ EXPORT_SYMBOL_GPL(snd_pcm_2_1_chmaps);
 int snd_hda_codec_build_controls(struct hda_codec *codec)
 {
 	struct hda_codec_driver *driver = hda_codec_to_driver(codec);
-	int err = 0;
+	int err;
 
 	hda_exec_init_verbs(codec);
 	/* continue to initialize... */
 	err = snd_hda_codec_init(codec);
-	if (!err) {
-		if (driver->ops->build_controls)
-			err = driver->ops->build_controls(codec);
+	if (err < 0)
+		return err;
+
+	if (driver->ops->build_controls) {
+		err = driver->ops->build_controls(codec);
 		if (err < 0)
 			return err;
 	}
-- 
2.50.0

