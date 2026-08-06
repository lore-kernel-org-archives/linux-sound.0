Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FAEA2550D5
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 14:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786024831; cv=none; b=DvdjsAldq7QBPTZBx7+yqVK8ababrcy25LL1bdH+ouYQOKajipUUD5kNVCc3FNrcax2aoRP63ObMu83rs6shrx8ZyK6YpZtKg4vjFnz2pDIWQJPpbmsFHNTBaoS1e55V07M0ozARGVhX1vZ2G4rFGr6RpI3/RFIGAelN5jSIjt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786024831; c=relaxed/simple;
	bh=D32RdWCUH4hanJ9eRyO+KMlKx+Vft3iWJAy7gWBqC/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bO3LUtqkoDJTt3OiVa2s7EW7+CzzCwQbJydS8PZkJzy4qkC5LAU3O+02yQtICLTiDRtPkoTMauLIV506goQ67LirYxEKY0d4Jjsy0YdBjidgdj1DzJTLA/I+/ar5beLGLSR1klC5qzfz2Vfy54Q4NiJp4wfAkHlSN3tSpIJtT48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZuY+8+kS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qtRSRHxq; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0kBH4CM/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lNQouIw7; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZuY+8+kS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qtRSRHxq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0kBH4CM/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lNQouIw7"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7F44D3E28;
	Thu,  6 Aug 2026 14:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786024822; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SjBuv1hlp+DTKiO99Q4F93dkqI0/iPtGgsIpZVfONJE=;
	b=ZuY+8+kSiCFpu11+9ArcYDJ5GW3vCgh7Vyhxd238QU9Ob7erb7GM5wL8FPlISGtyJIhnsG
	U49io7B3XtsLbJfWQBUafW11O2FHOPAX5JzFtjy88izvizgckBenZbb9hfxnQiX8OL/KTu
	OXN9bcnjsrhFmmwUC8YAdbK+Sz1Zg6A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786024822;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SjBuv1hlp+DTKiO99Q4F93dkqI0/iPtGgsIpZVfONJE=;
	b=qtRSRHxqkTZcR3RwpGOrQKs6ys2em+lZgAV9uxsO1HTjJgryd5x8MoP8s1BH4ELWANvrp/
	z28MJ7g9w9i4h3AQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="0kBH4CM/";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=lNQouIw7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786024818; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SjBuv1hlp+DTKiO99Q4F93dkqI0/iPtGgsIpZVfONJE=;
	b=0kBH4CM/jH86Qz7ZSXRAGfaE186TfNFiumIiuIKFrgQAR7fH4FsS4kQWJe8AIXtmzkPeJ+
	/3RAz69c8dXniq306opk85/RR4HAgv9GKik0iVtD32j4M2sPKoL4qNgxKda6iDrGZsDEfh
	gNlLg5BhGem9LPbLP1J7+pYtuKYnRXQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786024818;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SjBuv1hlp+DTKiO99Q4F93dkqI0/iPtGgsIpZVfONJE=;
	b=lNQouIw7lya4iSNukzR7/Sump/VVoQdeu/N+nKDokHEPF7tdcgS6WNVp0dKin5cL365lt8
	yb1hODc3KNA8nXAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 58729779EC;
	Thu,  6 Aug 2026 14:00:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iL4nFGuTdGqbOwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 06 Aug 2026 14:00:11 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH v2 08/31] ASoC: hdac_hda: Use auto-cleanup for firmware loading
Date: Thu,  6 Aug 2026 15:59:40 +0200
Message-ID: <20260806140006.1412298-9-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260806140006.1412298-1-tiwai@suse.de>
References: <20260806140006.1412298-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_TWO(0.00)[2];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Queue-Id: 7F44D3E28
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

Simplify the code to manage the firmware loading with __free(firmware)
auto-cleanup.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/hdac_hda.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/codecs/hdac_hda.c b/sound/soc/codecs/hdac_hda.c
index 1ab5f8a26e03..1c06fdbf0e71 100644
--- a/sound/soc/codecs/hdac_hda.c
+++ b/sound/soc/codecs/hdac_hda.c
@@ -437,7 +437,7 @@ static int hdac_hda_codec_probe(struct snd_soc_component *component)
 
 #ifdef CONFIG_SND_HDA_PATCH_LOADER
 	if (loadable_patch[hda_pvt->dev_index] && *loadable_patch[hda_pvt->dev_index]) {
-		const struct firmware *fw;
+		const struct firmware *fw __free(firmware) = NULL;
 
 		dev_info(&hdev->dev, "Applying patch firmware '%s'\n",
 			 loadable_patch[hda_pvt->dev_index]);
@@ -451,7 +451,6 @@ static int hdac_hda_codec_probe(struct snd_soc_component *component)
 				dev_err(&hdev->dev, "%s: failed to load hda patch %d\n", __func__, ret);
 				goto error_no_pm;
 			}
-			release_firmware(fw);
 		}
 	}
 #endif
-- 
2.55.0

