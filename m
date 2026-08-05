Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1656474262
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 13:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785937995; cv=none; b=mmibQVfY0F3wbj0J1bU7hT3bds6Bo7EvN0q+CxjaSuMaJuWR5Hspwdw/Eg0bvDSz+E31MVDrz1RAt6wSikX+5FYq5PWav1GZSyyOPBx2kwlkBuJZVS8dVgJjmHZ2RGp7GqXKvSeJaHZRaOyfGgxchQcB0vnQb/vFd+x329h0UE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785937995; c=relaxed/simple;
	bh=D32RdWCUH4hanJ9eRyO+KMlKx+Vft3iWJAy7gWBqC/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YSd26CRmzaVI4k59XH/KqaqCmdkHlJgfMuwPBnRseFCuCTkFR2HujoDsAu3CFSXX9Z+NcmQmTN3fKOdnijfm6J2/vQe7Nze/JaJUtgXP10tY2KlTbPu5Gf/4ADagzl6tcU9cdsEoCeCblmvNzDNACU7/eCcPkYmO3Hi/nfjm0KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rn94hw64; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dyr8wR5V; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=u+IcJgFk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ES3NYXI/; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rn94hw64";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dyr8wR5V";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="u+IcJgFk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ES3NYXI/"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E0C9D7F0AA;
	Wed,  5 Aug 2026 13:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785937988; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SjBuv1hlp+DTKiO99Q4F93dkqI0/iPtGgsIpZVfONJE=;
	b=rn94hw64O1oeLUe5NBSZZ1CC90w7fuq4BOLrWRH+CskZacl05S/OA6qjGIAhAKaU4gGItI
	n1XBwSN+63ngIxSuOlslxcq2+cefve8QtCN+iOdB/b6jb/aogTNaaaE3sNsFS8HCm6uAt3
	0ezAjIqp6tY0BCdjMnnl51Fu35OXgVI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785937988;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SjBuv1hlp+DTKiO99Q4F93dkqI0/iPtGgsIpZVfONJE=;
	b=dyr8wR5VAqTSOk0Ra6YldFJflfyJJtBj8VVc+vqqHq2go5mGh4C8EuHgKcQK+xU3U1atYf
	tlhvWgWaTfdQrUCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785937983; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SjBuv1hlp+DTKiO99Q4F93dkqI0/iPtGgsIpZVfONJE=;
	b=u+IcJgFkFbOFYVDSgWyje1lcE0Cv5zb2VLaOU4qtIcLHA6PhykKjb700A+r7TKIPR1n5tb
	wzcG8WuFzl9IgGN2wy88DBKgZTYJDh1g5ZvpJxNjEGOVBaGmbERF4guHkFEWiwDVACF1PC
	jHNZArPHoz618m7KjTMXuD8KVsHgAFg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785937983;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SjBuv1hlp+DTKiO99Q4F93dkqI0/iPtGgsIpZVfONJE=;
	b=ES3NYXI/YFek11boA4JV1kTQWbL2zTS6VzF5Yv1lQkI1CTFQExnV1C1PGS8IK/W1jPpRD4
	Jy1SSiU4zi954uAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 829F7779F1;
	Wed,  5 Aug 2026 13:52:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cNejHjhAc2ouSQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 05 Aug 2026 13:52:56 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 08/31] ASoC: hdac_hda: Use auto-cleanup for firmware loading
Date: Wed,  5 Aug 2026 15:52:09 +0200
Message-ID: <20260805135247.670693-9-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260805135247.670693-1-tiwai@suse.de>
References: <20260805135247.670693-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

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

