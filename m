Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD8819DF53
	for <linux-sound@vger.kernel.org>; Tue,  1 Oct 2024 12:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727784836; cv=none; b=OtmunnKrj8EdETM7irQ2mWIC+mwXszRbMtS6Ka40blx6M/ZGpSlhK5h5JhaxWU/MvJ+6fyALx/B4Xj1KjxRLOgp4SWthp9KLIa9hWkyAELQeI+tBy2RuUcG/BHOc6mCqk5JIQjsJVNzd/yxsF2zeL2h8IHc6WDBQp5lCHr/Wo6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727784836; c=relaxed/simple;
	bh=qjSAddRcAId/ELoTA5Y+48thbLzBOwj5zprk3KwG7D4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nTpMu4oRzZ3Zk7rPvlGY+7/s1UTkAsn7p1pBIu0L00HDwbhY8SEWZeNYxHvWdTwXBof1/NNs4DpjF2JGaG7oDgFjpW9bxOJVUEnEuSAVc0NHW/SiQvc1c5M8MRKf6dUkSlp21Jt8E37aJBT/WTc4vTjnHEcpiD0Svix/fMKIynw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WDTeGDUb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8lYqbdfw; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WDTeGDUb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8lYqbdfw; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WDTeGDUb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8lYqbdfw";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WDTeGDUb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8lYqbdfw"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2385821B02;
	Tue,  1 Oct 2024 12:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1727784833; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vT40F3YM/tEVIKg6Wa8Nv3hX7ffZ+IhpotEMipuqjl0=;
	b=WDTeGDUbJbAejoBOOdhPPYLmikLDCGHqccVdp123nxPUCCaGqvF+FVybHg96wmUPZ1p8KZ
	bDWCLBfbB0QLJZ6uRZCw0iIgODbPCzlZoJxanglQSdHj/M++VeTxNAC2Y4+VCk/0w+C6ga
	wu15i5qdvekxS/RKoIYH/b1j4NTvFmc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1727784833;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vT40F3YM/tEVIKg6Wa8Nv3hX7ffZ+IhpotEMipuqjl0=;
	b=8lYqbdfwdzl0WEcS3YiY/s0f1UVMOWGnF0iHNNbLdJUsEUDSbpMsSZEVXjC93jvNXdjGy0
	3RhGHDz1ueOdsJDg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=WDTeGDUb;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=8lYqbdfw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1727784833; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vT40F3YM/tEVIKg6Wa8Nv3hX7ffZ+IhpotEMipuqjl0=;
	b=WDTeGDUbJbAejoBOOdhPPYLmikLDCGHqccVdp123nxPUCCaGqvF+FVybHg96wmUPZ1p8KZ
	bDWCLBfbB0QLJZ6uRZCw0iIgODbPCzlZoJxanglQSdHj/M++VeTxNAC2Y4+VCk/0w+C6ga
	wu15i5qdvekxS/RKoIYH/b1j4NTvFmc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1727784833;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vT40F3YM/tEVIKg6Wa8Nv3hX7ffZ+IhpotEMipuqjl0=;
	b=8lYqbdfwdzl0WEcS3YiY/s0f1UVMOWGnF0iHNNbLdJUsEUDSbpMsSZEVXjC93jvNXdjGy0
	3RhGHDz1ueOdsJDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0A5D813A6E;
	Tue,  1 Oct 2024 12:13:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sCT3AYHn+2YFdQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 01 Oct 2024 12:13:53 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 2/2] ALSA: hda/generic: Drop obsoleted obey_preferred_dacs flag
Date: Tue,  1 Oct 2024 14:14:37 +0200
Message-ID: <20241001121439.26060-2-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241001121439.26060-1-tiwai@suse.de>
References: <20241001121439.26060-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 2385821B02
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

Now we evaluate directly with preferred_dacs table, the flag is no
longer used and merely a placeholder.
Let's drop the definition and its users.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_generic.h   | 1 -
 sound/pci/hda/patch_realtek.c | 4 +---
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/pci/hda/hda_generic.h b/sound/pci/hda/hda_generic.h
index 08544601b4ce..9612afaa61c2 100644
--- a/sound/pci/hda/hda_generic.h
+++ b/sound/pci/hda/hda_generic.h
@@ -232,7 +232,6 @@ struct hda_gen_spec {
 	unsigned int power_down_unused:1; /* power down unused widgets */
 	unsigned int dac_min_mute:1; /* minimal = mute for DACs */
 	unsigned int suppress_vmaster:1; /* don't create vmaster kctls */
-	unsigned int obey_preferred_dacs:1; /* obey preferred_dacs assignment */
 
 	/* other internal flags */
 	unsigned int no_analog:1; /* digital I/O only */
diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index b42257e03344..eb45a41533dc 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6645,10 +6645,8 @@ static void alc289_fixup_asus_ga401(struct hda_codec *codec,
 	};
 	struct alc_spec *spec = codec->spec;
 
-	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
+	if (action == HDA_FIXUP_ACT_PRE_PROBE)
 		spec->gen.preferred_dacs = preferred_pairs;
-		spec->gen.obey_preferred_dacs = 1;
-	}
 }
 
 /* The DAC of NID 0x3 will introduce click/pop noise on headphones, so invalidate it */
-- 
2.43.0

