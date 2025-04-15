Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6634F186295
	for <linux-sound@vger.kernel.org>; Tue, 15 Apr 2025 08:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744705917; cv=none; b=L8ZyyD1Udu+mneuhRgRKnmR0ELb0sj3T3PdAVv/rRzX4HrZD450+LOje+FCoogc26kx7Jb3v0wEyp2QEPl0CRTK3SvJ0l/DWFyO7RjKPTyaWdqAS5pwGIcMNAmf8a7BB2umpRRaxyrSGYA+M+E7REgJqgHuJYGexnH0lPznM4pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744705917; c=relaxed/simple;
	bh=B+UeCkhCUj8dEMBjzbL8LDPvB5C2UgD7cvLd0qCejhs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BcjKKUdtHWu9RcjdsSK6w/NSLnsKziEETDHJXUXWBxkaNNppfLe/59EaXt3V5T1LviDb2TcTXhh/0Yn0o1VVEIR6LweKSuEnIaR+JW3RCbVQG+t2Y4LfJ6/770nhJdSvNm02/ADCY2Ke2DBxDcCM7mfjzubaaV3LQH7GfEduAtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Q+N1CVwn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3vsu/Lin; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BB5hDlVx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BAAsR6eB; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Q+N1CVwn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3vsu/Lin";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BB5hDlVx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BAAsR6eB"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E20B31F38A;
	Tue, 15 Apr 2025 08:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744705907; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e+2a0G0BwSObqXN7c+98plb2SBef3i4qV8RaO70bOP8=;
	b=Q+N1CVwnKVmR2igobkWJtMkm6UJSu3x+PdJaSwyOj0mERk/+44lPnS5Co/1F3tRDHsXduo
	8JZau+z0z052HF3isZrVnkLBz8wTp/o6+TniOsOrotm+XcnMxCMKYppmBuHL6VEycNen3i
	qA09sd4JyKId/PRUgFhA1sMuT+Exl2U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744705907;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e+2a0G0BwSObqXN7c+98plb2SBef3i4qV8RaO70bOP8=;
	b=3vsu/LinGdrbTD4RlWFGsB2gN156VyXPlg9rP4FPxnqH8dgpcKgYeqFK96KiY8AS0OlZXN
	H39VSLM178uRm+CA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=BB5hDlVx;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=BAAsR6eB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744705906; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e+2a0G0BwSObqXN7c+98plb2SBef3i4qV8RaO70bOP8=;
	b=BB5hDlVxL+ZZPvQHUu0yoOPBTCfoZbNJKXwI+dEsGCaRpLEh7HF/bDOlQw5RY5zhSM4PA3
	j93UWSgUmhSEmfOChUnQUv1AsP9rqwXrB/l0PViWNwv0AVByifHi6byNBMtXY45prVG5ab
	tI8O4z7bME4jjidHZ2LbJw3EdN9OveI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744705906;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e+2a0G0BwSObqXN7c+98plb2SBef3i4qV8RaO70bOP8=;
	b=BAAsR6eBLQogI2bXx7jA3JBEfvxXq42jrn8T1/H9255vQ3gGbhXFvPZvr5xFlap//a8VoV
	/+DTd6WOrdQd4XAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BE1EF13A89;
	Tue, 15 Apr 2025 08:31:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MFQwLXIZ/mfjRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 15 Apr 2025 08:31:46 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	linux-sound@vger.kernel.org
Subject: [PATCH 1/4] ASoC: Intel: bytcht_es8316: Avoid OOB array read from the map name
Date: Tue, 15 Apr 2025 10:31:37 +0200
Message-ID: <20250415083144.6588-2-tiwai@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250415083144.6588-1-tiwai@suse.de>
References: <20250415083144.6588-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E20B31F38A
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

Since the quirk bits can be passed arbitrarily via a module option, it
may lead to the OOB access over the map name string array.
Fix it by conditionally reading the array, instead.

Fixes: 249d2fc9e55c ("ASoC: Intel: bytcht_es8316: Set card long_name based on quirks")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/intel/boards/bytcht_es8316.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/boards/bytcht_es8316.c b/sound/soc/intel/boards/bytcht_es8316.c
index 62594e7966ab..808142250ca1 100644
--- a/sound/soc/intel/boards/bytcht_es8316.c
+++ b/sound/soc/intel/boards/bytcht_es8316.c
@@ -518,10 +518,15 @@ static int byt_cht_es8316_get_quirks_from_dsm(struct byt_cht_es8316_private *pri
 	return 0;
 }
 
+static const char *mic_name(int n)
+{
+	static const char * const mic_names[] = { "in1", "in2" };
+	return n < ARRAY_SIZE(mic_names) ? mic_names[n] : "none";
+}
+
 static int snd_byt_cht_es8316_mc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	static const char * const mic_name[] = { "in1", "in2" };
 	struct snd_soc_acpi_mach *mach = dev_get_platdata(dev);
 	struct property_entry props[MAX_NO_PROPS] = {};
 	struct byt_cht_es8316_private *priv;
@@ -648,12 +653,12 @@ static int snd_byt_cht_es8316_mc_probe(struct platform_device *pdev)
 	snprintf(components_string, sizeof(components_string),
 		 "cfg-spk:%s cfg-mic:%s",
 		 (quirk & BYT_CHT_ES8316_MONO_SPEAKER) ? "1" : "2",
-		 mic_name[BYT_CHT_ES8316_MAP(quirk)]);
+		 mic_name(BYT_CHT_ES8316_MAP(quirk)));
 	byt_cht_es8316_card.components = components_string;
 #if !IS_ENABLED(CONFIG_SND_SOC_INTEL_USER_FRIENDLY_LONG_NAMES)
 	snprintf(long_name, sizeof(long_name), "bytcht-es8316-%s-spk-%s-mic",
 		 (quirk & BYT_CHT_ES8316_MONO_SPEAKER) ? "mono" : "stereo",
-		 mic_name[BYT_CHT_ES8316_MAP(quirk)]);
+		 mic_name(BYT_CHT_ES8316_MAP(quirk)));
 	byt_cht_es8316_card.long_name = long_name;
 #endif
 
-- 
2.49.0

