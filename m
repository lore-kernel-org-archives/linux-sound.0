Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62837156221
	for <linux-sound@vger.kernel.org>; Mon,  6 May 2024 16:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715012032; cv=none; b=GmE+PlKwkYgUctlgRGdHB9dxpocwFIJHByx76K6GX8JldQwrds3c/b2STo4AVXUVhDTQuzVkuyqavl3RK/EfRhyDcX5DV9Q9dbzerpiRpo60MkMFYoFgrSahhX4egh+exfHt0jOrinwP8Lp3adBj8q77IlHBKIKu14iz7Gt3iTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715012032; c=relaxed/simple;
	bh=tenHXb/DjLcnoVyZGN7YnozgLDnSeKij8sKLLG6jgxY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lon/hsE1Xq8NPVi2rBiESHNCYJ9ytTDY1yxgWMKdg9VvbYARL87/RQIVQJzsJ4h1kn7ctnCAnJ3pITstHZaHlcqLOMbmpYmnTLMX5CBNZASLhUipmm3Tz5cN+iwfDITrpQzCeSZ2fZFqAGXkJiKpBoH75rAZBe2kEyyBtiRO/LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UUlS0Agi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3Uu/9+bH; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UUlS0Agi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3Uu/9+bH; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UUlS0Agi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3Uu/9+bH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UUlS0Agi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3Uu/9+bH"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C3372385E0;
	Mon,  6 May 2024 16:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715012029; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EmP04HHUMr6jyySnZ0A40CC+x7GGBp4pAhBm+AIEgAc=;
	b=UUlS0AgiRKOgptYCezkB8m/3qTcJ9m+fO/JOaarhdX2WWRE25mL+E1XdO22gOh8Sq6Z9rb
	jxxi4RMlONo/s0PWKTwfiSO0hLLQ7fy2rsGdLfidm7HvWgCBNM3O00FQUmam0rfoOr0z4q
	y9ifdyGOku9uno/beCtKbFU1UmfI/oc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715012029;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EmP04HHUMr6jyySnZ0A40CC+x7GGBp4pAhBm+AIEgAc=;
	b=3Uu/9+bH6SnHK8p6wHl1e1UgYxFVBkxwbPjVIAXXougd0QFhL4lyOpiKjTrWPIs2F+vM4c
	1HIGTMDciinnT3Dw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715012029; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EmP04HHUMr6jyySnZ0A40CC+x7GGBp4pAhBm+AIEgAc=;
	b=UUlS0AgiRKOgptYCezkB8m/3qTcJ9m+fO/JOaarhdX2WWRE25mL+E1XdO22gOh8Sq6Z9rb
	jxxi4RMlONo/s0PWKTwfiSO0hLLQ7fy2rsGdLfidm7HvWgCBNM3O00FQUmam0rfoOr0z4q
	y9ifdyGOku9uno/beCtKbFU1UmfI/oc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715012029;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EmP04HHUMr6jyySnZ0A40CC+x7GGBp4pAhBm+AIEgAc=;
	b=3Uu/9+bH6SnHK8p6wHl1e1UgYxFVBkxwbPjVIAXXougd0QFhL4lyOpiKjTrWPIs2F+vM4c
	1HIGTMDciinnT3Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A78C913A32;
	Mon,  6 May 2024 16:13:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UI9sJ70BOWbwFQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 06 May 2024 16:13:49 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 03/12] ALSA: hda: generic: Reduce CONFIG_PM dependencies
Date: Mon,  6 May 2024 18:13:46 +0200
Message-ID: <20240506161359.6960-4-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240506161359.6960-1-tiwai@suse.de>
References: <20240506161359.6960-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -0.57
X-Spam-Level: 
X-Spamd-Result: default: False [-0.57 / 50.00];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	BAYES_HAM(-0.77)[84.36%];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.982];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]

CONFIG_PM dependencies got reduced in HD-audio codec core driver, and
now it's time to reduce in HD-audio generic codec driver, too.

Simply drop CONFIG_PM ifdefs.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_generic.c | 4 ----
 sound/pci/hda/hda_generic.h | 2 --
 2 files changed, 6 deletions(-)

diff --git a/sound/pci/hda/hda_generic.c b/sound/pci/hda/hda_generic.c
index de2a3d08c73c..f64d9dc197a3 100644
--- a/sound/pci/hda/hda_generic.c
+++ b/sound/pci/hda/hda_generic.c
@@ -6021,7 +6021,6 @@ void snd_hda_gen_free(struct hda_codec *codec)
 }
 EXPORT_SYMBOL_GPL(snd_hda_gen_free);
 
-#ifdef CONFIG_PM
 /**
  * snd_hda_gen_check_power_status - check the loopback power save state
  * @codec: the HDA codec
@@ -6035,7 +6034,6 @@ int snd_hda_gen_check_power_status(struct hda_codec *codec, hda_nid_t nid)
 	return snd_hda_check_amp_list_power(codec, &spec->loopback, nid);
 }
 EXPORT_SYMBOL_GPL(snd_hda_gen_check_power_status);
-#endif
 
 
 /*
@@ -6048,9 +6046,7 @@ static const struct hda_codec_ops generic_patch_ops = {
 	.init = snd_hda_gen_init,
 	.free = snd_hda_gen_free,
 	.unsol_event = snd_hda_jack_unsol_event,
-#ifdef CONFIG_PM
 	.check_power_status = snd_hda_gen_check_power_status,
-#endif
 };
 
 /*
diff --git a/sound/pci/hda/hda_generic.h b/sound/pci/hda/hda_generic.h
index a8eea8367629..8f5ecf740c49 100644
--- a/sound/pci/hda/hda_generic.h
+++ b/sound/pci/hda/hda_generic.h
@@ -340,9 +340,7 @@ void snd_hda_gen_mic_autoswitch(struct hda_codec *codec,
 				struct hda_jack_callback *jack);
 void snd_hda_gen_update_outputs(struct hda_codec *codec);
 
-#ifdef CONFIG_PM
 int snd_hda_gen_check_power_status(struct hda_codec *codec, hda_nid_t nid);
-#endif
 unsigned int snd_hda_gen_path_power_filter(struct hda_codec *codec,
 					   hda_nid_t nid,
 					   unsigned int power_state);
-- 
2.43.0

