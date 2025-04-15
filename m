Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F186D284668
	for <linux-sound@vger.kernel.org>; Tue, 15 Apr 2025 08:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744705923; cv=none; b=Zw9LVedrGrPfKGF5IJC1LMtb3nrIS3HTnLxKOYNcA8kbT0oDVmZb+xWWjtXcUv6vFAf0CeO1YMSYCyInv4CcoOpcBGZGXKp94FYj8FL9TB9yVJdYm8suxJhUhlh1UaiHH4euXwmF3zXE/8ozQEwHEv7C1P8QgqZx+8dFY5XdRTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744705923; c=relaxed/simple;
	bh=t2pOoZtKDq4E1onXsdmvCFJK6rX0wxBpWE1e7MfR6p8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S5UsL94z1+pxhxJtDXMDbcolpwiXUP4Rmy3yrtMjOxx5IqM/99hgQ/UCPmzPffzRQDOi4FBEnfdhibx5M/YyVuMvJD1ecyEquJdPvsnlJ0/n8tgFRMhBqaPvh/vwsB/w/xA5p43erARYoykCN5/ScI5IuEVzKFNx1OX8FJKwKgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cmVd0w4E; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=P9Lc+5GF; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cmVd0w4E; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=P9Lc+5GF; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cmVd0w4E";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="P9Lc+5GF";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cmVd0w4E";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="P9Lc+5GF"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1C3AC1F38D;
	Tue, 15 Apr 2025 08:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744705907; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o3FWd9elWm9YkOn9JjyDDEpnA03LnItHmWjJiPHUl80=;
	b=cmVd0w4EXlYt0wKlo1lbzXGnzfBUlguBEvbN2xY3ypF9uK4z3TQqOA05Xf1REwxA8WcoLq
	eqpyhGoPUPH4WIg8ycvRK0hHXX93s4P4J/3upUSYdvbEIX+t/P31E//k6CQMhbFk8vNRNq
	zI7SU40ne6sax2yFFhpBLo3b3yZD4Js=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744705907;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o3FWd9elWm9YkOn9JjyDDEpnA03LnItHmWjJiPHUl80=;
	b=P9Lc+5GFypg3THaqFL8U8HTKPQfAwFg4qxfT3kng5mlx4+fAhI63jU02cy0TZz4JfJcLvd
	CHmglAd+f5utJwDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744705907; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o3FWd9elWm9YkOn9JjyDDEpnA03LnItHmWjJiPHUl80=;
	b=cmVd0w4EXlYt0wKlo1lbzXGnzfBUlguBEvbN2xY3ypF9uK4z3TQqOA05Xf1REwxA8WcoLq
	eqpyhGoPUPH4WIg8ycvRK0hHXX93s4P4J/3upUSYdvbEIX+t/P31E//k6CQMhbFk8vNRNq
	zI7SU40ne6sax2yFFhpBLo3b3yZD4Js=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744705907;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o3FWd9elWm9YkOn9JjyDDEpnA03LnItHmWjJiPHUl80=;
	b=P9Lc+5GFypg3THaqFL8U8HTKPQfAwFg4qxfT3kng5mlx4+fAhI63jU02cy0TZz4JfJcLvd
	CHmglAd+f5utJwDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E8EBC137A5;
	Tue, 15 Apr 2025 08:31:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QEOkN3IZ/mfjRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 15 Apr 2025 08:31:46 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	linux-sound@vger.kernel.org
Subject: [PATCH 2/4] ASoC: Intel: bytcr_rt5640: Avoid OOB array read from the map name
Date: Tue, 15 Apr 2025 10:31:38 +0200
Message-ID: <20250415083144.6588-3-tiwai@suse.de>
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
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO

Since the quirk bits can be passed arbitrarily via a module option, it
may lead to the OOB access over the map name string array.
Fix it by conditionally reading the array, instead.

Fixes: 063422ca2a9d ("ASoC: Intel: bytcr_rt5640: Set card long_name based on quirks")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/intel/boards/bytcr_rt5640.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index 6446cda0f857..1ba9caa272c0 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -1676,10 +1676,15 @@ struct acpi_chan_package {   /* ACPICA seems to require 64 bit integers */
 	u64 mclock_value;    /* usually 25MHz (0x17d7940), ignored */
 };
 
+static const char *map_name(int n)
+{
+	static const char * const map_names[] = { "dmic1", "dmic2", "in1", "in3" };
+	return n < ARRAY_SIZE(map_names) ? map_names[n] : "none";
+}
+
 static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	static const char * const map_name[] = { "dmic1", "dmic2", "in1", "in3", "none" };
 	struct snd_soc_acpi_mach *mach = dev_get_platdata(dev);
 	__maybe_unused const char *spk_type;
 	const struct dmi_system_id *dmi_id;
@@ -1903,13 +1908,13 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
 
 	snprintf(byt_rt5640_components, sizeof(byt_rt5640_components),
 		 "cfg-spk:%s cfg-mic:%s aif:%d%s%s", cfg_spk,
-		 map_name[BYT_RT5640_MAP(byt_rt5640_quirk)], aif,
+		 map_name(BYT_RT5640_MAP(byt_rt5640_quirk)), aif,
 		 lineout_string, headset2_string);
 	byt_rt5640_card.components = byt_rt5640_components;
 #if !IS_ENABLED(CONFIG_SND_SOC_INTEL_USER_FRIENDLY_LONG_NAMES)
 	snprintf(byt_rt5640_long_name, sizeof(byt_rt5640_long_name),
 		 "bytcr-rt5640-%s-spk-%s-mic", spk_type,
-		 map_name[BYT_RT5640_MAP(byt_rt5640_quirk)]);
+		 map_name(BYT_RT5640_MAP(byt_rt5640_quirk)));
 	byt_rt5640_card.long_name = byt_rt5640_long_name;
 #endif
 
-- 
2.49.0

