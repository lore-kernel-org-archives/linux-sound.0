Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ABDE21A45C
	for <linux-sound@vger.kernel.org>; Thu,  9 Jan 2025 16:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736439805; cv=none; b=WQWFXg6pugZTjBE6QibgEeHaOM8VIimN6r+YuhA3/DTFMy3L8f1dwz9EUiyexBN8B/cfG9IVoK/1Wo+yjW0lSceujkyntLhTkhcWq8nVM2a2mdDbwYB2iliix3uGJzjDXqzU3hHBFVixHnLF2gidJJA4d3U6koFcW0mHNpWMJdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736439805; c=relaxed/simple;
	bh=eNEab8SMLrccxlYa1XI+MDszF99gM0oO2d7lf5iPuMc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h5ixBmgTK8W7jXVJQLHUGo8xUPhcV+QbqR3KH40GkmZg//C3WXjstpU4WBnIlQ3Pk4Pms124pC95VmbwcC8XQLUFl/FGDVOW+BCdenCKPCyGhK4FotlF+FKkUpNHRMkxsQ9s7vuueMwIpPteFEC0VROov3aSsqXgE1O2E8L/TSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1lQgANor; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xka0blpv; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CSpcC8mp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Wpi3JPU1; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1lQgANor";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xka0blpv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CSpcC8mp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Wpi3JPU1"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B93481F452;
	Thu,  9 Jan 2025 16:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736439801; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sslQoHf02ytKMDatOHj7LiAO3d/OClNyVSPrcxG5BL0=;
	b=1lQgANor8k2bRiR91n9UDBa4JCfBVOVzmhcAz8J/XFtYn3nxQbRwy9bL/s12ECwxpuCTe5
	2Vdzvjorb56Qdum7NGy+xan5kShkR+9NOs5fS7zeb5NzKw4QCubSNCy0cNqgxL96k7LZtp
	GlfA72YuLfUj27RnIWs1Omk36pfhR0M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736439801;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sslQoHf02ytKMDatOHj7LiAO3d/OClNyVSPrcxG5BL0=;
	b=xka0blpvH3nX/6BkG7aznbeYMYhjXV0K9dz3s3TIJ5yZ8ShBTFy8A5stbR6DEfyFaT1c/q
	+1QFgoCabhTNypBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=CSpcC8mp;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Wpi3JPU1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736439800; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sslQoHf02ytKMDatOHj7LiAO3d/OClNyVSPrcxG5BL0=;
	b=CSpcC8mp3wVCAvKt1YT1W49MjKhxMQQx9Y0AwYO35sHu1s4rDrjL8mtFT5wWmkPMx4Fd83
	bopr0IiYAJV6i7etneUA7k/0YFewXAh9uT/Og/av1gAba2E+CiCGXplZhdfLhYV4dG7/JV
	00Aur+QwbQcofrE9iRvcmPlxIn3I5XM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736439800;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sslQoHf02ytKMDatOHj7LiAO3d/OClNyVSPrcxG5BL0=;
	b=Wpi3JPU1Iw5CdtymI2/tU5bgy4tfAoE9doeDGB4ePa0PjLUcPVk/tn651vOTX5nopwJdOI
	e++F+Qa94nqUCZCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8F64E13A8B;
	Thu,  9 Jan 2025 16:23:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GADaIfj3f2cCBgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 09 Jan 2025 16:23:20 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 1/2] ALSA: hda/realtek: Simplify with str_yes_no()
Date: Thu,  9 Jan 2025 17:23:16 +0100
Message-ID: <20250109162318.9172-2-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250109162318.9172-1-tiwai@suse.de>
References: <20250109162318.9172-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B93481F452
X-Spam-Score: -3.01
X-Rspamd-Action: no action
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
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

Use the standard helper for simplifying the code.
Merely cleanup, no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_realtek.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 1aba06062433..f578b9893a8f 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -5900,7 +5900,7 @@ static void alc_determine_headset_type(struct hda_codec *codec)
 	}
 
 	codec_dbg(codec, "Headset jack detected iPhone-style headset: %s\n",
-		    is_ctia ? "yes" : "no");
+		  str_yes_no(is_ctia));
 	spec->current_headset_type = is_ctia ? ALC_HEADSET_TYPE_CTIA : ALC_HEADSET_TYPE_OMTP;
 }
 
-- 
2.43.0

