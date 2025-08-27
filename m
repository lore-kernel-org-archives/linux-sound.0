Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B16319849
	for <linux-sound@vger.kernel.org>; Wed, 27 Aug 2025 07:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756280192; cv=none; b=HB90Hjehbz8OjXo1blTdnwb2xO2SKkQh11PbXHN039vnkaw7H3MQ5HSfgHOqgjPAo0XZHVAdY1COPmt5ayzwUZ8sMX+5m88vjI52etLueCaj1LWEuKHr5Gcj4iB9WumzbHhaFcnRPZ6/sbODL3qU7sShmYDmURZVJoPlkAbdCzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756280192; c=relaxed/simple;
	bh=9PsRM5+Sfr9DxWJfwelI6xHmiLXiH2gXT178Ah3TQ1U=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AVOyl2NjCGsQWll0cfz+QnN3BBWoe3vI6373arK54cnGfOMXOxbMUOcF2pqe0G4YZBD0fCzR9cAVcM4fO2RvVKoES+Aml4VwnT2/L+12W8fXJn7OkOewyjc7Z6UW1DEJiWxrEBR7YgGRLtNq/mkO4ubhNndQ0j9Dy/Qmxg6wa8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2InyQg1L; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wKVU2Ex2; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2InyQg1L; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wKVU2Ex2; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2InyQg1L";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wKVU2Ex2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2InyQg1L";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wKVU2Ex2"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AF66822388;
	Wed, 27 Aug 2025 07:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756279759; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q11oAOSzv/uwbQQ6p2iokdGo4Cjbw7RF5+ockKyo0To=;
	b=2InyQg1LaaM3AMA30eqjIBLOQiyioDBNpaDsYqoaE9mwFcMxiKHa3mjbMJFYYWywKdPIib
	7Mp0xr7zOk7i8YGXoARoMHxYEWfQhYvh9RRkE35SxAsWpsD1iD83QsMWnFWTsxIqdq4jvc
	JJwR7QtIgALIewjUfePU6TuWqNBcFGk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756279759;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q11oAOSzv/uwbQQ6p2iokdGo4Cjbw7RF5+ockKyo0To=;
	b=wKVU2Ex2j3ylYt0La2/2Sqb3bcjgUNTmGOv58rDz2nIlgzaVnljVKZdGh8ZDIyAPCob52/
	FufDuzLdiN8dYdCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756279759; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q11oAOSzv/uwbQQ6p2iokdGo4Cjbw7RF5+ockKyo0To=;
	b=2InyQg1LaaM3AMA30eqjIBLOQiyioDBNpaDsYqoaE9mwFcMxiKHa3mjbMJFYYWywKdPIib
	7Mp0xr7zOk7i8YGXoARoMHxYEWfQhYvh9RRkE35SxAsWpsD1iD83QsMWnFWTsxIqdq4jvc
	JJwR7QtIgALIewjUfePU6TuWqNBcFGk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756279759;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q11oAOSzv/uwbQQ6p2iokdGo4Cjbw7RF5+ockKyo0To=;
	b=wKVU2Ex2j3ylYt0La2/2Sqb3bcjgUNTmGOv58rDz2nIlgzaVnljVKZdGh8ZDIyAPCob52/
	FufDuzLdiN8dYdCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8FCBE13A31;
	Wed, 27 Aug 2025 07:29:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wG3YIc+zrmjoagAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 27 Aug 2025 07:29:19 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 01/25] ALSA: hda: Introduce auto cleanup macros for PM
Date: Wed, 27 Aug 2025 09:28:41 +0200
Message-ID: <20250827072916.31933-2-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250827072916.31933-1-tiwai@suse.de>
References: <20250827072916.31933-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

The temporary power up/down of the codec via snd_hda_power_up() and
_down() (or snd_hda_power_up_pm() and _down_pm()) is seen in various
places.  This patch introduces simple auto-cleanup macros for those
call patterns, so that the drivers don't have to call the
corresponding power-down calls explicitly.

Namely,
	err = snd_hda_power_up(codec);
	if (err < 0)
		return err;
	....
	snd_power_down(codec);

can drop the *_down() call by replacing with
	CLASS(snd_hda_power, pm)(codec);
	if (pm.err < 0)
		return pm.err;

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/hda_codec.h | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/include/sound/hda_codec.h b/include/sound/hda_codec.h
index 006d4e4a8195..5d9f0ef228af 100644
--- a/include/sound/hda_codec.h
+++ b/include/sound/hda_codec.h
@@ -503,6 +503,36 @@ static inline bool hda_codec_need_resume(struct hda_codec *codec)
 	return !codec->relaxed_resume && codec->jacktbl.used;
 }
 
+/*
+ * PM with auto-cleanup: call like CLASS(snd_hda_power, pm)(codec)
+ * If the error handling is needed, refer pm.err.
+ */
+struct __hda_power_obj {
+	struct hda_codec *codec;
+	int err;
+};
+
+static inline struct __hda_power_obj __snd_hda_power_up(struct hda_codec *codec)
+{
+	struct __hda_power_obj T = { .codec = codec };
+	T.err = snd_hda_power_up(codec);
+	return T;
+}
+
+static inline struct __hda_power_obj __snd_hda_power_up_pm(struct hda_codec *codec)
+{
+	struct __hda_power_obj T = { .codec = codec };
+	T.err = snd_hda_power_up_pm(codec);
+	return T;
+}
+
+DEFINE_CLASS(snd_hda_power, struct __hda_power_obj,
+	     snd_hda_power_down((_T).codec), __snd_hda_power_up(codec),
+	     struct hda_codec *codec)
+DEFINE_CLASS(snd_hda_power_pm, struct __hda_power_obj,
+	     snd_hda_power_down_pm((_T).codec), __snd_hda_power_up_pm(codec),
+	     struct hda_codec *codec)
+
 #ifdef CONFIG_SND_HDA_PATCH_LOADER
 /*
  * patch firmware
-- 
2.50.1

