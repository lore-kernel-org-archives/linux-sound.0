Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29C3372EF5
	for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 08:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785314275; cv=none; b=VeL3qg3XN24+74u5LIz9eucKEVbEJSDe5nAUyatSNj9W0t1VXrSkdRrsqAa37nju6O9z8Gicc9YOWv9BWUIZ0GwWwsLAXnud3eL8qWZ8AwJFKPukvJj+n6Cw1tZtJbTtbyYeeJ9aPAE5sMijSlk80K+uAM7pFlXvirgIqc3y9t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785314275; c=relaxed/simple;
	bh=Uw4q20C5s66SLWt0lFpXCOp8kCG7JYzVkZ4dP/ahv9U=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gcrSwcQGEgPLg4IjF4ac1FPIWS51NY6ambVNIbdjjvDIep0Lv/YgPlmd2PwEqIeX0FI0akWNWpW7VHwZGI4mVcgl8TzIdKXkxyEa+XTFc5toTtEiCNVNdP2ngf06v62GbS8uswKljTkuskwE8oGpj3+EsZxD8cwogzXHAerwqyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=r9ZkXO+s; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JQpzMeSB; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hLhKOOOZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+g9dPHBA; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="r9ZkXO+s";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JQpzMeSB";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hLhKOOOZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+g9dPHBA"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D4AD97C99E;
	Wed, 29 Jul 2026 08:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785314268; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rn/WInhwbucHxomFsQ2Zr9BPOS0RNZo8vBmzADmP4Mo=;
	b=r9ZkXO+st38yYe0xVs7u5c7Z4B5WnAf/NIxyMGfSj6JZpOj89i2P5PyDhsk8NNmdtdDhZz
	2olSSvSRbgg8XH92uuU+DE5XpRGwAveImhttgqffyswc+CH/SFBAJbrp2YD5iWzxCIlhW4
	8B/TvQQAsD+OJQH6+45umqc6VOptXnc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785314268;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rn/WInhwbucHxomFsQ2Zr9BPOS0RNZo8vBmzADmP4Mo=;
	b=JQpzMeSBuSN7sNH70uWAPUis2sRqBzukUEDxJtZkKFN1xEOkSOVX7+e3OWpDxABY8N+tC5
	fLQrdEnaHLiCQhCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=hLhKOOOZ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=+g9dPHBA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785314263; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rn/WInhwbucHxomFsQ2Zr9BPOS0RNZo8vBmzADmP4Mo=;
	b=hLhKOOOZYZrndICoW+Xfo8Y7jVP0xUJCaK/fiLQAHGDuOUOAgkURWXnvv1xvlQ+zyeYilu
	xQARaJ9MMe6p8FiVKThE8LEIJ3d2eJdekVW4k0TLL2u9Wp4yT0tC62Lb/SukrVoiXGKbP9
	oYD6TJMdl1EOhCiwYgZfCYjS4qPR5pg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785314263;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rn/WInhwbucHxomFsQ2Zr9BPOS0RNZo8vBmzADmP4Mo=;
	b=+g9dPHBA9famSv94q96QCD5CopRx1BnMvQlkmuXhHexQsBpAhggtEmYPFUWmFsjCBtKoef
	OpUW5Z8IyJ7JQBCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B5B5C779B7;
	Wed, 29 Jul 2026 08:37:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6EMXK9e7aWqCVwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 29 Jul 2026 08:37:43 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 03/14] ALSA: hda: intel: Use auto-cleanup for firmware loading
Date: Wed, 29 Jul 2026 10:37:21 +0200
Message-ID: <20260729083735.120219-4-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729083735.120219-1-tiwai@suse.de>
References: <20260729083735.120219-1-tiwai@suse.de>
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
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid,suse.de:dkim];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Queue-Id: D4AD97C99E
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

Simplify the code to manage the firmware loading with __free(firmware)
auto-cleanup.

Only the code refactoring, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/controllers/intel.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/hda/controllers/intel.c b/sound/hda/controllers/intel.c
index 192f5c044b7a..dbcdaf12a4bf 100644
--- a/sound/hda/controllers/intel.c
+++ b/sound/hda/controllers/intel.c
@@ -2387,7 +2387,7 @@ static int azx_probe_continue(struct azx *chip)
 
 #ifdef CONFIG_SND_HDA_PATCH_LOADER
 	if (patch[dev] && *patch[dev]) {
-		const struct firmware *fw = NULL;
+		const struct firmware *fw __free(firmware) = NULL;
 
 		dev_info(&pci->dev, "Applying patch firmware '%s'\n",
 			 patch[dev]);
@@ -2396,7 +2396,6 @@ static int azx_probe_continue(struct azx *chip)
 				"Cannot load firmware, continue without patching\n");
 		} else {
 			err = snd_hda_load_patch(&chip->bus, fw->size, fw->data);
-			release_firmware(fw);
 			if (err < 0)
 				goto out_free;
 		}
-- 
2.55.0

