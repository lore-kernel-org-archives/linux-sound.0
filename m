Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24BD74400
	for <linux-sound@vger.kernel.org>; Wed,  8 May 2024 09:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715159480; cv=none; b=WvdOquMjzEAebLNnxUFOQtcag050saWYgznraBneKnEylAq+y9X6vlFMMNSeM5yIQsz+i6W0+gpS9sld08nysjJFTBfPpEGBdJ2tA82bijMN4STyWd6zyy4LcrwaKL0lNSLVP4Xv7eyimrdQU0YpFxpZK2S1JSzXTihKn0Gza5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715159480; c=relaxed/simple;
	bh=atCqZA+kuS9Kx9ET85iH4CsxZs678oluxBXzpxgLZ4A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EfaMowRuhrwD925R5rP9HwMkcAg5u0JH74Oaa0ho5cy+mIkR5xtWT5yFaMaxGOBAEKyoyumjsc0dJA4U4gYKz8w0SpnYbzjBjmVFKNBAjBWpvknFHm0oGNYFZ9ivYu9+aRMqui4jgV5rWGu1f8U6jx46Iedbw5X+LuCxuSt6pcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xSppB/xn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=obLt4N5J; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xSppB/xn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=obLt4N5J; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xSppB/xn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="obLt4N5J";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xSppB/xn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="obLt4N5J"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 14D7D5C6F6;
	Wed,  8 May 2024 09:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715159477; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=c9sBRY5ImFgTotn617DwITiQvg4NIdQGgPN++1YUo1A=;
	b=xSppB/xnlfRa/yTsEjViNxv2rG8V1+6Pyj12yzfphumvTGSD5GPD4bn+/jRQnVu09impjQ
	EacECBqKWwsXO2MULtOX+te4tHOqYnkEz36nzdF3Imjb2TuBezjIsYBbyA6kPKxnYWVzkd
	piowHYJmmm/PkHViHoI2CF0lRYTK1zU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715159477;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=c9sBRY5ImFgTotn617DwITiQvg4NIdQGgPN++1YUo1A=;
	b=obLt4N5J0paejW/cUsouSkLkO4knnuXm4iGL1umZRp1b1Tmx5o+F52Z/IyQPEow4mgLxsT
	RHexOIzwA6FlAUBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="xSppB/xn";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=obLt4N5J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715159477; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=c9sBRY5ImFgTotn617DwITiQvg4NIdQGgPN++1YUo1A=;
	b=xSppB/xnlfRa/yTsEjViNxv2rG8V1+6Pyj12yzfphumvTGSD5GPD4bn+/jRQnVu09impjQ
	EacECBqKWwsXO2MULtOX+te4tHOqYnkEz36nzdF3Imjb2TuBezjIsYBbyA6kPKxnYWVzkd
	piowHYJmmm/PkHViHoI2CF0lRYTK1zU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715159477;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=c9sBRY5ImFgTotn617DwITiQvg4NIdQGgPN++1YUo1A=;
	b=obLt4N5J0paejW/cUsouSkLkO4knnuXm4iGL1umZRp1b1Tmx5o+F52Z/IyQPEow4mgLxsT
	RHexOIzwA6FlAUBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EA7CA13A27;
	Wed,  8 May 2024 09:11:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id dgDmN7RBO2YcFwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 08 May 2024 09:11:16 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 0/7] ALSA: Add missing module description
Date: Wed,  8 May 2024 11:11:19 +0200
Message-ID: <20240508091128.25274-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.88 / 50.00];
	BAYES_HAM(-2.87)[99.43%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 14D7D5C6F6
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -2.88

Hi,

here is a trivial patch series for adding the missing
MODULE_DESCRIPTION() to the code that can be built as modules
where make W=1 starts complaining the lack of MODULE_DESCRIPTION()
since recently.

Fixes for ASoC follow later.


Takashi

===

Takashi Iwai (7):
  ALSA: ac97: legacy: Add missing module description
  ALSA: ac97: bus: Add missing module description
  ALSA: pcm_dmaengine: Add missing module description
  ALSA: kunit: Add missing module descriptions
  ALSA: pcmtest: Add missing module descriptions
  ALSA: hda: cirrus_scodec_test: Add missing module descriptions
  sound: oss: dmasound: Add missing module descriptions

 sound/ac97/bus.c                    | 1 +
 sound/ac97_bus.c                    | 1 +
 sound/core/pcm_dmaengine.c          | 1 +
 sound/core/sound_kunit.c            | 1 +
 sound/drivers/pcmtest.c             | 1 +
 sound/oss/dmasound/dmasound_atari.c | 2 ++
 sound/oss/dmasound/dmasound_paula.c | 1 +
 sound/pci/hda/cirrus_scodec_test.c  | 1 +
 8 files changed, 9 insertions(+)

-- 
2.43.0

