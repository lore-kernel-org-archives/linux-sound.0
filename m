Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20DFE13A86C
	for <linux-sound@vger.kernel.org>; Mon, 11 Aug 2025 10:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754906899; cv=none; b=rkls8wL0WUsRBvgrNMtqSW1iH86Kp1E58o0fdAWzJ0O7Yem7G0XOcB1a/XwryvHvsKh0ghDxOXjwrqCR3yzwxRwvkKAeO4XB7hvbNFpMpjWtRqkU235kDHL2Arvad7KmLjp9Xy7CsZD4kJIETUsWbcUoboIwgaSyaMEm/JlKGpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754906899; c=relaxed/simple;
	bh=jLF/i1dLEeQcqrwbot7XhKlFVCYr0I15H9m5aWV6mHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o1kkzUC3GuVH7h4Q5WUmuUuG3+Pv9PQFZQgeqkBi/SsAHMoPpaJeZFyLbJTQHNN3uTLr1rFTcmx8vsvfNdwFFPQXGDp7NNZ169SMr3PVJNsri1YHRhx/ikkDErRMkxAiT/QF3aiw18RheYXPhiWcXKSwKQpMUiPRm2nYAWoYJKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Z5wAO8TN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jdha34qm; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kclh3Y5T; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tNMYBBZe; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Z5wAO8TN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jdha34qm";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kclh3Y5T";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tNMYBBZe"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 298F833718;
	Mon, 11 Aug 2025 10:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754906894; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1YORe+m3psuwtzdH36UfIGNu02mJx8iY6iH2axASyE4=;
	b=Z5wAO8TNWszjheD11oEHNDm4LkCPOXQ15QluTMBpr/LekVAO4Xd4wKsWYKyg7IzTr2u/Fd
	h3xpQIr8ZXfZQx8zVYawaahfeuvwTfD3r2Mq7SuX0Ab1ecOb6w0CnQJxbvzn5zK3Ntuv/e
	LmMnJzMW8g37J7cby3Q5kJfF9hOCN+Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754906894;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1YORe+m3psuwtzdH36UfIGNu02mJx8iY6iH2axASyE4=;
	b=jdha34qmLO3D1xm2E5xpoQ5upGjy4ydAi3gYedhG9BqPGXt4pl3WNyUoE6PPXEZQaxqxym
	QJLExOgFOQ2gNLBQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=kclh3Y5T;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=tNMYBBZe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754906893; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1YORe+m3psuwtzdH36UfIGNu02mJx8iY6iH2axASyE4=;
	b=kclh3Y5TyNVlxjtVF6AiJ0OUMUL3ESl7QIO1gkUF6aUdD4CxhLwM5Rw5iMbYwlgVBtOsBl
	O3St6NsbP7WUuxzla+0LCSEJznBdPVgiD8GFnJZMkn6B8wH3/Aak2WBW6ee/Bm4ng9s3nv
	G8CDSUqxu+pzhPHiD5TOq4wjMDaLfbY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754906893;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1YORe+m3psuwtzdH36UfIGNu02mJx8iY6iH2axASyE4=;
	b=tNMYBBZeZ3xGJWhmCWZjEaja27pULKHFNAmHFWRero2Ii7tKog5p7oRgJQBxd+x/TTzbT9
	F9V5iR4jePhkXPDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DF76013A7E;
	Mon, 11 Aug 2025 10:08:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wMFSNQzBmWiVBwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 11 Aug 2025 10:08:12 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>
Subject: [PATCH 01/25] ALSA: hda: Introduce auto cleanup macros for PM
Date: Mon, 11 Aug 2025 12:07:35 +0200
Message-ID: <20250811100807.7962-2-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250811100807.7962-1-tiwai@suse.de>
References: <20250811100807.7962-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 298F833718
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email]
X-Spam-Score: -3.01

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
index ddc9c392f93f..e83501ff2875 100644
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

