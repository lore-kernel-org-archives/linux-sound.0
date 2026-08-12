Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D805132B9BB
	for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 06:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786514783; cv=none; b=m7Jw2DVBy5WeOD65CaI0+3rHuyBi2TGhkE/q4W4TDd501L6RbwlKnMj87TL7lqQsC6N9prDv62hrSDVAhyCjVI5d8iEU4nS81Dx5W62jI5ADVIEheAAp/d94ikqeW9W6gZgVumfyCsW6IKtDB3lFwUVPQL8UD0Aj6rFiRZ8D7xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786514783; c=relaxed/simple;
	bh=eB7NrZcxkmmMZlrPGewlvzx3jfpoWyEu3DLySHrSzxk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M/+J7JoVyfRVuanWTQ8T0UK/yWAmtxdWtGP4Lu+5gDdJXSeY/N40oEPOU/cpJfRigB/kOC7ily7aqU791tzjdgTJhSTpbPeSFWy2b6q/ZL1u3zyt+xGdzTYK2UJYTix2SEejTRJUp+r3K0QXBR5F6LXlG2dEXd+spRvG3bcwPUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ySqSLump; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SA/9xFQh; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DYiYel9M; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PzEROAOW; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ySqSLump";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SA/9xFQh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DYiYel9M";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PzEROAOW"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9534F3E3B;
	Wed, 12 Aug 2026 06:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786514775; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=aRObKEEds4d+DalDkZSYw4HeW77k7OeQi3ANe7cB9h8=;
	b=ySqSLumpFkr68fnDXcOU02dYYrfVPG0KXOrle64L15iRUqicUgbd7WcRN4naSkveDFch+8
	npnJ44x5j1LiD6kclLGbZopnlp2JrV8n6qmfvR90RKePyi2RAAckynDHwEFyRx6If1HjMo
	utTuSeigjU6usNm7+MHXiYF5jgIgdwY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786514775;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=aRObKEEds4d+DalDkZSYw4HeW77k7OeQi3ANe7cB9h8=;
	b=SA/9xFQheNQRa1BTmKc7HweLnhQ/KqXHQt1hrNwFdB/G6B3IcrilNM+KVU66O/YJFm0Gxy
	rNdJjR0tcAFCQpBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=DYiYel9M;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=PzEROAOW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786514771; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=aRObKEEds4d+DalDkZSYw4HeW77k7OeQi3ANe7cB9h8=;
	b=DYiYel9MEbYQBxNMGv3at3Al1COaT8or905Z3funVhzYr02URy+xSSXWwre1NUuDrzZnGK
	Ale3Y810RnCcBSsTBeoeSDmwNnJ1+WycJ76geE2VSN/bLMSfBRYZ5EiCiHsWKb3HuLBeUR
	QRtwTdrJzpNBHEzvXIaY2qk+5r4XbkE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786514771;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=aRObKEEds4d+DalDkZSYw4HeW77k7OeQi3ANe7cB9h8=;
	b=PzEROAOWQkqwG/aJ48ZBCp6QJ/87Ql5wBTdYDRDvIPRH6agqOU8cbXLRMSMjeRMGmpn1ao
	d9mpqGoQz7OFRoAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 586DC779B1;
	Wed, 12 Aug 2026 06:06:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id S3BbFFMNfGrREAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 12 Aug 2026 06:06:11 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Fabio Estevam <festevam@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Mark Brown <broonie@kernel.org>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>
Subject: [PATCH 00/14] ALSA: Drop __bitwise and __force prefix
Date: Wed, 12 Aug 2026 08:04:32 +0200
Message-ID: <20260812060557.80445-1-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_CC(0.00)[intel.com,gmail.com,baylibre.com,kernel.org];
	DKIM_TRACE(0.00)[suse.de:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Score: -1.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 9534F3E3B
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

Hi,

this is a series of cleanup patches to kill the infamous __bitwise and
__force prefix usage for some PCM and control parameter types.
They were added ages ago just for code safety, but its effect is quite
limited, while the drawback is significant.  Let's drop them.


Takashi

===

Takashi Iwai (14):
  ALSA: uapi: Drop __bitwise and __force prefix
  ALSA: pcm: Drop __force casts
  ALSA: pcm: Avoid macros for SNDRV_PCM_FMTBIT and SNDRV_PCM_SUBFMTBIT
  ALSA: control: Drop __force casts
  ALSA: oss: Drop __force casts
  ALSA: kunit: Drop __force casts
  ALSA: aloop: Drop __force casts
  ALSA: hda: Drop __force casts
  ALSA: asihpi: Drop __force cast
  ALSA: emu10k1: Drop __force casts
  ASoC: fsl: Drop __force casts
  ASoC: Intel: avs: Drop __force cast
  ASoC: mediatek: Drop __force casts
  ASoC: meson: Drop __force cast

 include/sound/pcm.h                           | 118 ++++++------
 include/sound/pcm_params.h                    |  13 +-
 include/uapi/sound/asequencer.h               |   8 +-
 include/uapi/sound/asound.h                   | 178 +++++++++---------
 sound/core/control_compat.c                   |  12 +-
 sound/core/oss/pcm_oss.c                      |  16 +-
 sound/core/oss/pcm_plugin.c                   |  20 +-
 sound/core/pcm.c                              |  12 +-
 sound/core/pcm_misc.c                         |  25 ++-
 sound/core/pcm_native.c                       |  28 +--
 sound/core/sound_kunit.c                      |   4 +-
 sound/drivers/aloop.c                         |   4 +-
 sound/hda/common/codec.c                      |   2 +-
 sound/hda/core/device.c                       |   2 +-
 sound/pci/asihpi/asihpi.c                     |   2 +-
 sound/pci/emu10k1/emufx.c                     |  18 +-
 sound/soc/fsl/fsl-asoc-card.c                 |   2 +-
 sound/soc/fsl/fsl_asrc.c                      |   2 +-
 sound/soc/fsl/fsl_asrc_m2m.c                  |  10 +-
 sound/soc/fsl/fsl_easrc.c                     |   2 +-
 sound/soc/fsl/fsl_qmc_audio.c                 |   8 +-
 sound/soc/fsl/imx-card.c                      |   4 +-
 sound/soc/intel/avs/probes.c                  |   2 +-
 .../mediatek/mt8183/mt8183-da7219-max98357.c  |   4 +-
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c   |   4 +-
 sound/soc/mediatek/mt8186/mt8186-mt6366.c     |   2 +-
 sound/soc/mediatek/mt8188/mt8188-mt6359.c     |   2 +-
 sound/soc/mediatek/mt8189/mt8189-nau8825.c    |   2 +-
 .../mt8192/mt8192-mt6359-rt1015-rt5682.c      |   2 +-
 sound/soc/mediatek/mt8195/mt8195-mt6359.c     |   4 +-
 sound/soc/mediatek/mt8196/mt8196-nau8825.c    |   2 +-
 sound/soc/meson/meson-codec-glue.c            |   2 +-
 32 files changed, 252 insertions(+), 264 deletions(-)

-- 
2.55.0

