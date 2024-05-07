Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6969916E89F
	for <linux-sound@vger.kernel.org>; Tue,  7 May 2024 15:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715097340; cv=none; b=RARYPBV3kMQVubaekBVbV7nF96eEGq6p0rGVND/rJMkAbRRyCfofoW5BiFVQRE6O/ObOx/s2hu+nh20U1iXHu/2eAoThD0mpu2osNy7EuyFE86N9eMQxSXPXJSyvJNYryU6zTw2P1e0rJI/9maca/jTdaMFCODuhIU47nRdGZDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715097340; c=relaxed/simple;
	bh=oJ6GCcTS4qZlesH7NKlAQ1vHqX1OSECzJmgdBYKjMuc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UJxXqJb7gR7mTgsR0Ae+4Lh2wkzv2r9ZF2nAKsSJvBdAHUFPysKmRAA4WZUv6YrliGTFos3bhTHs/AnvTx7qPn4IpQZiwM1Ds/MBGjs06kT9ORczDPAVspUDgsQY4oCmwxwx/0L3UYQRFL1adUMMNm4SO+NqICY/Awr83Tz/kRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mUgo8wQ4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dtzG+t6X; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mUgo8wQ4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dtzG+t6X; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mUgo8wQ4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dtzG+t6X";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mUgo8wQ4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dtzG+t6X"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3E42A20C9B;
	Tue,  7 May 2024 15:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715097335; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mb7DFDLZUThEAsRgb/IfLjYkW1ey8GQAlivB1kwpwz8=;
	b=mUgo8wQ4VcUgIRTdw70DhCTYwgB2JmE+qK1EH6K5zj+tzIpH03jiyS+37X5bFXuRw+ZAT4
	lN8seiV1YUpuXb6iW9PuL4xKKcLOhx/LliPoYEFNh1K9Wf/2umT4jE1Lx/qbRXumQN1Unc
	SY8mfYFObhBoSHlKkhos4T7dogxhg1g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715097335;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mb7DFDLZUThEAsRgb/IfLjYkW1ey8GQAlivB1kwpwz8=;
	b=dtzG+t6XYkjt/EfKxY1pvHX8FGTwBRqTkprp94FPNHoXMESFg9BOJcZ2D4hTLjBhpd30LT
	o8MBpnL5l4UhGFCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715097335; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mb7DFDLZUThEAsRgb/IfLjYkW1ey8GQAlivB1kwpwz8=;
	b=mUgo8wQ4VcUgIRTdw70DhCTYwgB2JmE+qK1EH6K5zj+tzIpH03jiyS+37X5bFXuRw+ZAT4
	lN8seiV1YUpuXb6iW9PuL4xKKcLOhx/LliPoYEFNh1K9Wf/2umT4jE1Lx/qbRXumQN1Unc
	SY8mfYFObhBoSHlKkhos4T7dogxhg1g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715097335;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mb7DFDLZUThEAsRgb/IfLjYkW1ey8GQAlivB1kwpwz8=;
	b=dtzG+t6XYkjt/EfKxY1pvHX8FGTwBRqTkprp94FPNHoXMESFg9BOJcZ2D4hTLjBhpd30LT
	o8MBpnL5l4UhGFCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1F6FE13A3A;
	Tue,  7 May 2024 15:55:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2MNxBvdOOmaNXQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 07 May 2024 15:55:35 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 29/34] ASoC: tegra: Use *-y instead of *-objs in Makefile
Date: Tue,  7 May 2024 17:55:33 +0200
Message-ID: <20240507155540.24815-30-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240507155540.24815-1-tiwai@suse.de>
References: <20240507155540.24815-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -6.80
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[]

*-objs suffix is reserved rather for (user-space) host programs while
usually *-y suffix is used for kernel drivers (although *-objs works
for that purpose for now).

Let's correct the old usages of *-objs in Makefiles.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/tegra/Makefile | 46 ++++++++++++++++++++--------------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/sound/soc/tegra/Makefile b/sound/soc/tegra/Makefile
index b723c78e665d..cea4b0d54378 100644
--- a/sound/soc/tegra/Makefile
+++ b/sound/soc/tegra/Makefile
@@ -1,25 +1,25 @@
 # SPDX-License-Identifier: GPL-2.0
 # Tegra platform Support
-snd-soc-tegra-pcm-objs := tegra_pcm.o
-snd-soc-tegra-utils-objs += tegra_asoc_utils.o
-snd-soc-tegra20-ac97-objs := tegra20_ac97.o
-snd-soc-tegra20-das-objs := tegra20_das.o
-snd-soc-tegra20-i2s-objs := tegra20_i2s.o
-snd-soc-tegra20-spdif-objs := tegra20_spdif.o
-snd-soc-tegra30-ahub-objs := tegra30_ahub.o
-snd-soc-tegra30-i2s-objs := tegra30_i2s.o
-snd-soc-tegra210-ahub-objs := tegra210_ahub.o
-snd-soc-tegra210-dmic-objs := tegra210_dmic.o
-snd-soc-tegra210-i2s-objs := tegra210_i2s.o
-snd-soc-tegra186-asrc-objs := tegra186_asrc.o
-snd-soc-tegra186-dspk-objs := tegra186_dspk.o
-snd-soc-tegra210-admaif-objs := tegra210_admaif.o
-snd-soc-tegra210-mvc-objs := tegra210_mvc.o
-snd-soc-tegra210-sfc-objs := tegra210_sfc.o
-snd-soc-tegra210-amx-objs := tegra210_amx.o
-snd-soc-tegra210-adx-objs := tegra210_adx.o
-snd-soc-tegra210-mixer-objs := tegra210_mixer.o
-snd-soc-tegra210-ope-objs := tegra210_ope.o tegra210_mbdrc.o tegra210_peq.o
+snd-soc-tegra-pcm-y := tegra_pcm.o
+snd-soc-tegra-utils-y += tegra_asoc_utils.o
+snd-soc-tegra20-ac97-y := tegra20_ac97.o
+snd-soc-tegra20-das-y := tegra20_das.o
+snd-soc-tegra20-i2s-y := tegra20_i2s.o
+snd-soc-tegra20-spdif-y := tegra20_spdif.o
+snd-soc-tegra30-ahub-y := tegra30_ahub.o
+snd-soc-tegra30-i2s-y := tegra30_i2s.o
+snd-soc-tegra210-ahub-y := tegra210_ahub.o
+snd-soc-tegra210-dmic-y := tegra210_dmic.o
+snd-soc-tegra210-i2s-y := tegra210_i2s.o
+snd-soc-tegra186-asrc-y := tegra186_asrc.o
+snd-soc-tegra186-dspk-y := tegra186_dspk.o
+snd-soc-tegra210-admaif-y := tegra210_admaif.o
+snd-soc-tegra210-mvc-y := tegra210_mvc.o
+snd-soc-tegra210-sfc-y := tegra210_sfc.o
+snd-soc-tegra210-amx-y := tegra210_amx.o
+snd-soc-tegra210-adx-y := tegra210_adx.o
+snd-soc-tegra210-mixer-y := tegra210_mixer.o
+snd-soc-tegra210-ope-y := tegra210_ope.o tegra210_mbdrc.o tegra210_peq.o
 
 obj-$(CONFIG_SND_SOC_TEGRA) += snd-soc-tegra-pcm.o
 obj-$(CONFIG_SND_SOC_TEGRA20_AC97) += snd-soc-tegra20-ac97.o
@@ -42,9 +42,9 @@ obj-$(CONFIG_SND_SOC_TEGRA210_MIXER) += snd-soc-tegra210-mixer.o
 obj-$(CONFIG_SND_SOC_TEGRA210_OPE) += snd-soc-tegra210-ope.o
 
 # Tegra machine Support
-snd-soc-tegra-wm8903-objs := tegra_wm8903.o
-snd-soc-tegra-machine-objs := tegra_asoc_machine.o
-snd-soc-tegra-audio-graph-card-objs := tegra_audio_graph_card.o
+snd-soc-tegra-wm8903-y := tegra_wm8903.o
+snd-soc-tegra-machine-y := tegra_asoc_machine.o
+snd-soc-tegra-audio-graph-card-y := tegra_audio_graph_card.o
 
 obj-$(CONFIG_SND_SOC_TEGRA_WM8903) += snd-soc-tegra-wm8903.o
 obj-$(CONFIG_SND_SOC_TEGRA_MACHINE_DRV) += snd-soc-tegra-machine.o
-- 
2.43.0

