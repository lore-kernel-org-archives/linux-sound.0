Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7185A38C419
	for <linux-sound@vger.kernel.org>; Thu,  9 Apr 2026 09:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775727534; cv=none; b=j/o6nVU0nlksmwa0+dAndxbJDOnSU7UeQwLd9TkPn7lhVHmnNEKURjBPUCJAKORnUWyAs6K6ZZsXwtlVkUJ9HomxAACpPkfBPjGyvbpDavdEBG5njNayE1OoD09prhHFirJhg0nHBm+LuOTHjBLP1R96yrC6Vfeuw0LEpIau8Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775727534; c=relaxed/simple;
	bh=GUT9xRRe4YYdz2OPL+ls0Wxq3QYG1qfeY/D8VEgfq2A=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=icaCr9ik9ehV/lt000kkYa8ilOrIh/0adcoARr5RRdHfBiy0lYM8RsrR1o1/v65Q3GpiFPK6mXfIom9YqrAYoJ6vMCFZNlLvwVa75app7hWcBHiUpwCExFgC8pkiYAxLryhhRM9F9O+P8uabt3ljmda1V5zzZ5xj98bfbOLQSho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ry3cufc+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=69Kf4Qoe; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ry3cufc+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=69Kf4Qoe; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ry3cufc+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="69Kf4Qoe";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ry3cufc+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="69Kf4Qoe"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4B5EA4EE86;
	Thu,  9 Apr 2026 09:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775727510; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y4poQiuxM6ILsBDig5AMbYAWQEVRrCBMl5QgX123jV4=;
	b=ry3cufc+hZZQu75FdbeuiDxaOGx51lx9/CzAZ+28vvxcrEwqIpaT7SdxdZDE+eSSd1FiP2
	tsit4bew2UeMdxUMY4GXlxAjRmvx09AvAEZkdxykrhSUXnWHFjqYbIMzJdeUTP90tOOtuD
	oHNN7i2I9j9BHP+K9HDzdLrhgvDEyIk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775727510;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y4poQiuxM6ILsBDig5AMbYAWQEVRrCBMl5QgX123jV4=;
	b=69Kf4QoenCRqZgz3R0Zj3G7vXFaHhLd+Kw1IGWmlU8YtWt21invoFMbC0e6fSpiKtAEMBj
	T18HF51TCfksIICA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775727510; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y4poQiuxM6ILsBDig5AMbYAWQEVRrCBMl5QgX123jV4=;
	b=ry3cufc+hZZQu75FdbeuiDxaOGx51lx9/CzAZ+28vvxcrEwqIpaT7SdxdZDE+eSSd1FiP2
	tsit4bew2UeMdxUMY4GXlxAjRmvx09AvAEZkdxykrhSUXnWHFjqYbIMzJdeUTP90tOOtuD
	oHNN7i2I9j9BHP+K9HDzdLrhgvDEyIk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775727510;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y4poQiuxM6ILsBDig5AMbYAWQEVRrCBMl5QgX123jV4=;
	b=69Kf4QoenCRqZgz3R0Zj3G7vXFaHhLd+Kw1IGWmlU8YtWt21invoFMbC0e6fSpiKtAEMBj
	T18HF51TCfksIICA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2E26D4A0B3;
	Thu,  9 Apr 2026 09:38:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sN4lCpZz12mdWgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 09 Apr 2026 09:38:30 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 02/10] ALSA: hda: Add a simple GPIO setup helper function
Date: Thu,  9 Apr 2026 11:38:15 +0200
Message-ID: <20260409093826.1317626-3-tiwai@suse.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260409093826.1317626-1-tiwai@suse.de>
References: <20260409093826.1317626-1-tiwai@suse.de>
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
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO

Introduce a common GPIO setup helper function, so that we can clean up
the open code found in many codec drivers later.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/hda_codec.h |  4 ++++
 sound/hda/common/codec.c  | 29 +++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/include/sound/hda_codec.h b/include/sound/hda_codec.h
index 292d6024388b..24581080e26a 100644
--- a/include/sound/hda_codec.h
+++ b/include/sound/hda_codec.h
@@ -481,6 +481,10 @@ void snd_hda_unlock_devices(struct hda_bus *bus);
 void snd_hda_bus_reset(struct hda_bus *bus);
 void snd_hda_bus_reset_codecs(struct hda_bus *bus);
 
+void snd_hda_codec_set_gpio(struct hda_codec *codec, unsigned int mask,
+			    unsigned int dir, unsigned int data,
+			    unsigned int delay);
+
 int snd_hda_codec_set_name(struct hda_codec *codec, const char *name);
 
 /*
diff --git a/sound/hda/common/codec.c b/sound/hda/common/codec.c
index 3ac4bf6005d6..c2af2511a831 100644
--- a/sound/hda/common/codec.c
+++ b/sound/hda/common/codec.c
@@ -4052,6 +4052,35 @@ void snd_hda_bus_reset_codecs(struct hda_bus *bus)
 	}
 }
 
+/**
+ * snd_hda_codec_set_gpio - Set up GPIO bits for AFG
+ * @codec: the HDA codec
+ * @mask: GPIO bitmask
+ * @dir: GPIO direction bits
+ * @data: GPIO data bits
+ * @delay: the delay in msec before writing GPIO data bits
+ */
+void snd_hda_codec_set_gpio(struct hda_codec *codec, unsigned int mask,
+			    unsigned int dir, unsigned int data,
+			    unsigned int delay)
+{
+	snd_hda_codec_write(codec, codec->core.afg, 0,
+			    AC_VERB_SET_GPIO_MASK, mask);
+	if (delay) {
+		snd_hda_codec_write_sync(codec, codec->core.afg, 0,
+					 AC_VERB_SET_GPIO_DIRECTION, dir);
+		msleep(delay);
+		snd_hda_codec_write_sync(codec, codec->core.afg, 0,
+					 AC_VERB_SET_GPIO_DATA, data);
+	} else {
+		snd_hda_codec_write(codec, codec->core.afg, 0,
+				    AC_VERB_SET_GPIO_DIRECTION, dir);
+		snd_hda_codec_write(codec, codec->core.afg, 0,
+				    AC_VERB_SET_GPIO_DATA, data);
+	}
+}
+EXPORT_SYMBOL_GPL(snd_hda_codec_set_gpio);
+
 /**
  * snd_print_pcm_bits - Print the supported PCM fmt bits to the string buffer
  * @pcm: PCM caps bits
-- 
2.53.0

