Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1126319F464
	for <linux-sound@vger.kernel.org>; Mon, 11 Aug 2025 10:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754906899; cv=none; b=jKLHH9m4H1tJMoZZwVRJrAIn+pPhr5hvfS5UIQImvquYRMPtV0UIFqqnNLiZLMeQWu/ZZDMuxBtgKDxOSPFdPMZbuSYYZcnN3gXVLLfX3j+BC+rXyShUUmQEqQYHXEvb6KBh/PaF+AypGnAkG5VphjUbzsqyazMn0XHm202ep0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754906899; c=relaxed/simple;
	bh=+To/oo2p1Y0gIvbh5/7hw1VtegdRg5s8aFDBiWK4kns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VJl2VRBICEQLilrvPmAbPqhdFvgrhF0BVBzxkyIcvL1Px/1NAQn3W8+QQaGKjNMo2RU2ypiMji7nUZPnKvd/9GQptxarriuVQ5rWphMAXCvzCor9ztlUtj3Z3oYtVvbNJWTdKvpEomVrlU5RM7JzqP0R4TQ+QfdYlGbTQ6FK4t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WWZYzbSP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=NmY2WMwY; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=K4C3RstW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xTsdWAKA; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WWZYzbSP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NmY2WMwY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="K4C3RstW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xTsdWAKA"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DB2395BE07;
	Mon, 11 Aug 2025 10:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754906894; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zt262e8iUWGw7qplkcrG9kJq30oe+zzyDT8wv+gbBLc=;
	b=WWZYzbSPDNeFWPxpyBuJEsu4ao/80XIfCYj5RxCKNdahzR3PGtxdJgQxiIk0P/qWgiYK+o
	BpkmLPT7JSLylbOJW5S9UmZNkl2LMJ2W7+nv30CfUOG7uEv+wAptRzUfTOGv2zs2PlZbAF
	BAiXMoDjn30AlPFraTicpUCEwo1uM3s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754906894;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zt262e8iUWGw7qplkcrG9kJq30oe+zzyDT8wv+gbBLc=;
	b=NmY2WMwYCl4pqWK6B1jIXADeoMt1c679ZdS6v7qFg51czv3U2+bxHxXS4Z7AE4yAS+eS/4
	jXuJcqb7PQIYktAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754906893; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zt262e8iUWGw7qplkcrG9kJq30oe+zzyDT8wv+gbBLc=;
	b=K4C3RstW7uCIeAoj01RBAeQfvKoLIo3ivgVh8Ezgl5LdtFwc8f4/RKTslQ9a4y5Juv92Rq
	gMfTabU4kENqbG2wgqelUtiV8JP6JRMVtuWvj0Iev2lNudVSEbGvOl4+DFuRQ0NPpzQTmc
	tX5fm8wqJfBnoIxWCzjai/d4XRqdTk4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754906893;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zt262e8iUWGw7qplkcrG9kJq30oe+zzyDT8wv+gbBLc=;
	b=xTsdWAKAC759xQG5zwTf2WxKju7fuHdujXBGgH9KqE73K5AR+8azD6KfTH9Yc4R+5bENNV
	SJqgiysiQt6tE2DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A36CF13AAA;
	Mon, 11 Aug 2025 10:08:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OE68Jg3BmWiVBwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 11 Aug 2025 10:08:13 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>
Subject: [PATCH 04/25] ALSA: hda/realtek: Use cleanup macros for PM controls
Date: Mon, 11 Aug 2025 12:07:38 +0200
Message-ID: <20250811100807.7962-5-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250811100807.7962-1-tiwai@suse.de>
References: <20250811100807.7962-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -2.80

The new macro CLASS(snd_hda_power_pm) can replace the manual
snd_hda_power_up_pm() and _down() calls gracefully.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/realtek/alc269.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 337e33a59de8..8c13fd84417d 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -1223,9 +1223,8 @@ static void alc_update_vref_led(struct hda_codec *codec, hda_nid_t pin,
 	pinval &= ~AC_PINCTL_VREFEN;
 	pinval |= on ? AC_PINCTL_VREF_80 : AC_PINCTL_VREF_HIZ;
 	/* temporarily power up/down for setting VREF */
-	snd_hda_power_up_pm(codec);
+	CLASS(snd_hda_power_pm, pm)(codec);
 	snd_hda_set_pin_ctl_cache(codec, pin, pinval);
-	snd_hda_power_down_pm(codec);
 }
 
 /* update mute-LED according to the speaker mute state via mic VREF pin */
-- 
2.50.1

