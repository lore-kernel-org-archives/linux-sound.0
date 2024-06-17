Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECD819049F
	for <linux-sound@vger.kernel.org>; Mon, 17 Jun 2024 10:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718618708; cv=none; b=IuVv3kkTAt/6e1nfJ5+8J41jZjy2BJtgKzVNKH4/zcRLsW8eAnaZ4RNkZ1qyjZDV0HtubyROINparPkrgnxUThBy9vuv+fvQ+vbzqxuW58PoFuY957Om+MAXLFJNYocs/5DmN2Ad6AGpWnvnsBdyePNroqq1blK2DNGjkdizrz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718618708; c=relaxed/simple;
	bh=WZwp6Iowaw6PLVc6bsNtIMJM5dbIJbvXWNRADEIQlhw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uRF3r5BvAYp8hwVLcfnMm0SHBwv1XLPhmZtLK/wdpKu3Od+4ZOOaSjnm8mzIDm9yONiHPE7cat9OdF4WKDWD6jX9PB348ua2CFqMK4a05IKB8I0iHGm0ero1CwnH+PYLa9JG1yjBnYTtR0LkviaJ8PwTRBdV2tnzJgqZehQXff4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XDQ1Ez1r; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hCnBEUIh; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XDQ1Ez1r; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hCnBEUIh; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XDQ1Ez1r";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hCnBEUIh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XDQ1Ez1r";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hCnBEUIh"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E58C75FE6F;
	Mon, 17 Jun 2024 10:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1718618704; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LHEnHuFrQDtoCsqFLFky4hGVPl2ZIqIHDfamXgmqWuE=;
	b=XDQ1Ez1rFeh/fYEL6B6+AClJR55Y2qvZZtXEgbTa/Vj6czz31gVpC7lt4OVHr0Vj2ueVul
	6qqrHLyHBVVsX9tgDqca7e3Q3lhhvqJImqCnl2DBNsNFt+MkZX4tDi/eoWHof4fD9otjPt
	dAJc9eQH1H7ksuIiOeGMkQI1IxkSotw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718618704;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LHEnHuFrQDtoCsqFLFky4hGVPl2ZIqIHDfamXgmqWuE=;
	b=hCnBEUIhYBKwHtKphGKy9xlykhFVEtroThpbmrmiwWzp4qOvS/z8a9g3LgwsdeoMIFgtMs
	Kc5x70K/IYWFsRDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=XDQ1Ez1r;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=hCnBEUIh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1718618704; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LHEnHuFrQDtoCsqFLFky4hGVPl2ZIqIHDfamXgmqWuE=;
	b=XDQ1Ez1rFeh/fYEL6B6+AClJR55Y2qvZZtXEgbTa/Vj6czz31gVpC7lt4OVHr0Vj2ueVul
	6qqrHLyHBVVsX9tgDqca7e3Q3lhhvqJImqCnl2DBNsNFt+MkZX4tDi/eoWHof4fD9otjPt
	dAJc9eQH1H7ksuIiOeGMkQI1IxkSotw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718618704;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LHEnHuFrQDtoCsqFLFky4hGVPl2ZIqIHDfamXgmqWuE=;
	b=hCnBEUIhYBKwHtKphGKy9xlykhFVEtroThpbmrmiwWzp4qOvS/z8a9g3LgwsdeoMIFgtMs
	Kc5x70K/IYWFsRDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BDFE213AAF;
	Mon, 17 Jun 2024 10:05:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EKcqLVAKcGYfAgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Jun 2024 10:05:04 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 4/5] ALSA: hda: Drop NULL check for snd_ctl_remove()
Date: Mon, 17 Jun 2024 12:05:26 +0200
Message-ID: <20240617100529.6667-5-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240617100529.6667-1-tiwai@suse.de>
References: <20240617100529.6667-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E58C75FE6F
X-Spam-Score: -3.01
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	URIBL_BLOCKED(0.00)[suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

Since snd_ctl_remove() accepts the NULL kcontrol argument now, we can
drop the check in the caller side.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_cs_dsp_ctl.c  |  2 +-
 sound/pci/hda/tas2781_hda_i2c.c | 13 ++++---------
 2 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/sound/pci/hda/hda_cs_dsp_ctl.c b/sound/pci/hda/hda_cs_dsp_ctl.c
index e6e876998e71..deb74c247082 100644
--- a/sound/pci/hda/hda_cs_dsp_ctl.c
+++ b/sound/pci/hda/hda_cs_dsp_ctl.c
@@ -207,7 +207,7 @@ void hda_cs_dsp_control_remove(struct cs_dsp_coeff_ctl *cs_ctl)
 	struct hda_cs_dsp_coeff_ctl *ctl = cs_ctl->priv;
 
 	/* ctl and kctl may already have been removed by ALSA private_free */
-	if (ctl && ctl->kctl)
+	if (ctl)
 		snd_ctl_remove(ctl->card, ctl->kctl);
 }
 EXPORT_SYMBOL_NS_GPL(hda_cs_dsp_control_remove, SND_HDA_CS_DSP_CONTROLS);
diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index 75f7674c66ee..c878967cb66a 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -597,18 +597,13 @@ static void tas2781_hda_remove_controls(struct tas2781_hda *tas_hda)
 {
 	struct hda_codec *codec = tas_hda->priv->codec;
 
-	if (tas_hda->dsp_prog_ctl)
-		snd_ctl_remove(codec->card, tas_hda->dsp_prog_ctl);
-
-	if (tas_hda->dsp_conf_ctl)
-		snd_ctl_remove(codec->card, tas_hda->dsp_conf_ctl);
+	snd_ctl_remove(codec->card, tas_hda->dsp_prog_ctl);
+	snd_ctl_remove(codec->card, tas_hda->dsp_conf_ctl);
 
 	for (int i = ARRAY_SIZE(tas_hda->snd_ctls) - 1; i >= 0; i--)
-		if (tas_hda->snd_ctls[i])
-			snd_ctl_remove(codec->card, tas_hda->snd_ctls[i]);
+		snd_ctl_remove(codec->card, tas_hda->snd_ctls[i]);
 
-	if (tas_hda->prof_ctl)
-		snd_ctl_remove(codec->card, tas_hda->prof_ctl);
+	snd_ctl_remove(codec->card, tas_hda->prof_ctl);
 }
 
 static void tasdev_fw_ready(const struct firmware *fmw, void *context)
-- 
2.43.0

