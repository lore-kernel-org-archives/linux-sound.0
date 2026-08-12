Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C417C2D2487
	for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 06:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786514795; cv=none; b=K1MeH/iD6xlIcAcy+c4AfY/L0ELOTj5lAR2rb8gTjXJXaFg7S8jqzxlLfSwj7fT1qZBo7PElzXtiXiQmOYECGhv8vIptY6B9pfemKGG52UOAqXBHZOVbfw+OZ/EpJEz3AvA5GGKcvhWyzqybtW4Ve9HksJZvMco3y4E+AbfMs+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786514795; c=relaxed/simple;
	bh=60U9YoNAK3zfrer3pYbUWiza0kdKZsZqBHaLlr0qixM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lIFcevh1J7jWk6vyepLWL6DjB0/97LUqs5n8WsuVlZV6NshcYQC4VHenrAGp06UhzbZfmp+iq2FAUK1vI4Z4Xs5qfBDZs4C50sSqlNPt3O/tDDYyrA2QFIaM8XyN3QOMTubm7pHUpf2ryi6E42ixQGTly/9gWLQzkaY6VeCXnlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Si9W96/5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2Euawdnk; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Q/Wg05RA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AeL9B1XW; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Si9W96/5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2Euawdnk";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Q/Wg05RA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AeL9B1XW"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 803B0820EC;
	Wed, 12 Aug 2026 06:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786514784; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mnyLDCA0wCWqECX0SECOMxmX+0r5WRIWMnq0GEgyfCs=;
	b=Si9W96/5La6he0kJnm/vAKxvIsRfUaD9vOZy4acd+PJjAzIW0F3T9q/u4TRHkjTxm9qk+e
	3Or7OWeMge/jNI8II7+M5yHKdhX94vEpNs7JtBH00K6zDXiuXRDssS0XEAXqiFUA3mRC5A
	90LbnwpJ7EGgSlQLAsUfDH/PPFnLpFM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786514784;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mnyLDCA0wCWqECX0SECOMxmX+0r5WRIWMnq0GEgyfCs=;
	b=2Euawdnkq1WUOWIb3H1QXxLh3CjZ1tXrsWECHB6e9DYVGpr0RlcVbzW5d20kPzbrWurrJc
	/hug8x/32yFU2nDg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="Q/Wg05RA";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=AeL9B1XW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786514780; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mnyLDCA0wCWqECX0SECOMxmX+0r5WRIWMnq0GEgyfCs=;
	b=Q/Wg05RA/fTPXEJxkfDyOyHBxVIdAq1x+mpYC3LUCz8/AX84Po1dEFvvimrjsvWIyD95Yq
	HsXS2D57IiQyPss6fJymdbIWgvCLvEmRH5SSpOaBtyr6oihWocgsBjDyDWVaWvmm1IqPWP
	tpZv7kO/h14aol3gxryJ1HrBpV4XL/U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786514780;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mnyLDCA0wCWqECX0SECOMxmX+0r5WRIWMnq0GEgyfCs=;
	b=AeL9B1XW20FlP5wYil92bYsLdHfohGdciUlATLqnyhodQQ8Jt2t6Lf8np7D75EslkgLZIE
	2n6HnmxKwVcJ4+Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B475C779D8;
	Wed, 12 Aug 2026 06:06:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SD3XKlUNfGrREAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 12 Aug 2026 06:06:13 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 14/14] ASoC: meson: Drop __force cast
Date: Wed, 12 Aug 2026 08:04:46 +0200
Message-ID: <20260812060557.80445-15-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260812060557.80445-1-tiwai@suse.de>
References: <20260812060557.80445-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid,suse.de:dkim]
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Queue-Id: 803B0820EC
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

Now that the bitwise parameter definitions are gone for PCM
parameters, we don't have to cast with ugly __force prefix.
Simply drop a superfluous cast.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/meson/meson-codec-glue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/meson/meson-codec-glue.c b/sound/soc/meson/meson-codec-glue.c
index 2ff6066e1b6c..8773bf06e154 100644
--- a/sound/soc/meson/meson-codec-glue.c
+++ b/sound/soc/meson/meson-codec-glue.c
@@ -74,7 +74,7 @@ int meson_codec_glue_input_hw_params(struct snd_pcm_substream *substream,
 	data->params.rates = snd_pcm_rate_to_rate_bit(params_rate(params));
 	data->params.rate_min = params_rate(params);
 	data->params.rate_max = params_rate(params);
-	data->params.formats = 1ULL << (__force int) params_format(params);
+	data->params.formats = 1ULL << params_format(params);
 	data->params.channels_min = params_channels(params);
 	data->params.channels_max = params_channels(params);
 	data->params.sig_bits = dai->driver->playback.sig_bits;
-- 
2.55.0

