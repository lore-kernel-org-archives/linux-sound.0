Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72ED93A7D82
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 14:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786024824; cv=none; b=QfhVupXGyTlmurBz8vXHeTSTD3JUTp5fZbssuziEOuC+U41CfcXhs83rNkuCSuPAqE0atIU4LnCYR6ScW1238nj2V2HkDQY+lUmiRUqoZBk4J73aCKQBZ9BoT7jKhT0S/Jbu/DvAS6gHgyAnEd4AEkAEKm9TC7ZEVhEvCsR+SZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786024824; c=relaxed/simple;
	bh=5WqkYYBOXqdnb4+KrHcKtMeo/+WJTwZSArBT51LXR7E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=enINmLR3xf+j88vpq37PV8+z2iaKLsKNnkrBrEei9f9CBgF93vDBAHS/XgeIrSksSJOzOPsZUvK2/XbZ353EtP6cF/gqeYm6e3/5Ym7kvPU1O9KqGgeoqE9mpxHrLI5rZbLcvSdIXxOqtCMeyT6S7c44OZpMnC+Nu5tJPUYy+9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QuH6Qy3M; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=q9zSXXJp; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=D2A5gHvz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6DDYE21g; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QuH6Qy3M";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="q9zSXXJp";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="D2A5gHvz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6DDYE21g"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E8BC23DF4;
	Thu,  6 Aug 2026 14:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786024814; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bDzjrsUmDQx80DYJyHoFTx8Hm6ynBaJfgrGRHQtHRPA=;
	b=QuH6Qy3ME6baureLesV7KlQmoOjX84X4/1W83f2onTiB2LBhASoBjKeazfKXku2BmHpkhX
	TMRmu7yIwJIIwYQZUSf0LC8ZdhHaAwgpXH4pDIWxeDFmshFUrJPDipWGmdNIsLQw6R+8Jb
	KgkKO8v845Emb2xm7EOtDfYtwC/ofgw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786024814;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bDzjrsUmDQx80DYJyHoFTx8Hm6ynBaJfgrGRHQtHRPA=;
	b=q9zSXXJp5hslM9kTsJeLG+jYLbEtJhwjHVVScP75Mkm79CP2FMs4ib0NsoFuupQ2ApBAqY
	P7q0rFwVUfwtqiBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786024809; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bDzjrsUmDQx80DYJyHoFTx8Hm6ynBaJfgrGRHQtHRPA=;
	b=D2A5gHvzbpND37XUpHaLX+3Afpmz8DnyvXQkeiPdWX+8LHMIZZQxJzZ8EUZeTpoYwTaHfZ
	+vR5+ALpwfp83nk4Ft+3RVifWpNSjbicUkv1FAtHSM/r1G/sfSMtUs+LpkszIZOHcuXIwt
	WKRiKDbV9lHnd5falbw7dDVSaWd4ADo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786024809;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bDzjrsUmDQx80DYJyHoFTx8Hm6ynBaJfgrGRHQtHRPA=;
	b=6DDYE21gvEcn8422wcPOXcANRhEMevFy6o1Q0YGJTjccrHkGxiG5Ea+21wy1lZc0gTUECD
	2FoirAWEttp73+CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1FC2A779B6;
	Thu,  6 Aug 2026 14:00:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id n4JFBmmTdGqbOwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 06 Aug 2026 14:00:09 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Baojun Xu <baojun.xu@ti.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Kiseok Jo <kiseok.jo@irondevice.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Maciej Strozek <mstrozek@opensource.cirrus.com>,
	Nick Li <nick.li@foursemi.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Sen Wang <sen@ti.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>
Subject: [PATCH v2 00/31] ASoC: Use auto-cleanup for firmware loading
Date: Thu,  6 Aug 2026 15:59:32 +0200
Message-ID: <20260806140006.1412298-1-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[26];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	R_RATELIMIT(0.00)[to_ip_from(RLyn1jrxitrdqefws7q17npsmc)];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,ti.com,linux.intel.com,intel.com,opensource.cirrus.com,nxp.com,gmail.com,bootlin.com,irondevice.com,metafoo.de,foursemi.com,analog.com,realtek.com,linux.dev,kernel.org,amd.com];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -1.80
X-Spam-Level: 

Hi,

here is a revised series of trivial patches to use the auto-cleanup
(via __free(firmware)) for firmware management.
Now compile warnings due to the mixture with goto have been addressed
for rt1320-sdw and wm2000 drivers.  Others remain identical, just took
a few review Acks.


thanks,

Takashi

===

Takashi Iwai (31):
  ASoC: aw87390: Use auto-cleanup for firmware loading
  ASoC: aw88081: Use auto-cleanup for firmware loading
  ASoC: aw88166: Use auto-cleanup for firmware loading
  ASoC: aw88261: Use auto-cleanup for firmware loading
  ASoC: aw88395: Use auto-cleanup for firmware loading
  ASoC: aw88399: Use auto-cleanup for firmware loading
  ASoC: fs-amp-lib: Use auto-cleanup for firmware loading
  ASoC: hdac_hda: Use auto-cleanup for firmware loading
  ASoC: max98390: Use auto-cleanup for firmware loading
  ASoC: ntpfw: Use auto-cleanup for firmware loading
  ASoC: pcm6240: Use auto-cleanup for firmware loading
  ASoC: peb2466: Use auto-cleanup for firmware loading
  ASoC: rt1320-sdw: Use auto-cleanup for firmware loading
  ASoC: rt5575: Use auto-cleanup for firmware loading
  ASoC: rt5677: Use auto-cleanup for firmware loading
  ASoC: rt722-sdca: Use auto-cleanup for firmware loading
  ASoC: sigmadsp: se auto-cleanup for firmware loading
  ASoC: sma1307: Use auto-cleanup for firmware loading
  ASoC: tas2781: Use auto-cleanup for firmware loading
  ASoC: tas5805m: Use auto-cleanup for firmware loading
  ASoC: tlv320aic31xx: Use auto-cleanup for firmware loading
  ASoC: wm0010: Use auto-cleanup for firmware loading
  ASoC: wm2000: Use auto-cleanup for firmware loading
  ASoC: zl38060: Use auto-cleanup for firmware loading
  ASoC: fsl: Use auto-cleanup for firmware loading
  ASoC: Intel: avs: Use auto-cleanup for firmware loading
  ASoC: Intel: catpt: Use auto-cleanup for firmware loading
  ASoC: qcom: Use auto-cleanup for firmware loading
  ASoC: renesas: Use auto-cleanup for firmware loading
  ASoC: SDCA: Use auto-cleanup for firmware loading
  ASoC: SOF: Use auto-cleanup for firmware loading

 sound/soc/codecs/aw87390.c         |  7 ++--
 sound/soc/codecs/aw88081.c         |  9 ++---
 sound/soc/codecs/aw88166.c         |  8 ++---
 sound/soc/codecs/aw88261.c         |  8 ++---
 sound/soc/codecs/aw88395/aw88395.c |  8 ++---
 sound/soc/codecs/aw88399-lib.c     |  8 ++---
 sound/soc/codecs/fs-amp-lib.c      |  3 +-
 sound/soc/codecs/hdac_hda.c        |  3 +-
 sound/soc/codecs/max98390.c        | 16 ++++-----
 sound/soc/codecs/ntpfw.c           | 21 ++++-------
 sound/soc/codecs/pcm6240.c         | 16 ++++-----
 sound/soc/codecs/peb2466.c         |  7 ++--
 sound/soc/codecs/rt1320-sdw.c      | 17 +++------
 sound/soc/codecs/rt5575-spi.c      |  3 +-
 sound/soc/codecs/rt5677.c          |  8 ++---
 sound/soc/codecs/rt722-sdca.c      |  9 ++---
 sound/soc/codecs/sigmadsp.c        | 13 +++----
 sound/soc/codecs/sma1307.c         |  6 +---
 sound/soc/codecs/tas2781-fmwlib.c  | 45 ++++++++---------------
 sound/soc/codecs/tas5805m.c        |  9 ++---
 sound/soc/codecs/tlv320aic31xx.c   |  8 ++---
 sound/soc/codecs/wm0010.c          | 58 +++++++++++-------------------
 sound/soc/codecs/wm2000.c          |  7 ++--
 sound/soc/codecs/zl38060.c         | 11 +++---
 sound/soc/fsl/fsl_xcvr.c           | 10 ++----
 sound/soc/intel/avs/topology.c     |  3 +-
 sound/soc/intel/catpt/loader.c     | 15 +++-----
 sound/soc/qcom/qdsp6/topology.c    |  4 +--
 sound/soc/renesas/siu_dai.c        |  4 +--
 sound/soc/sdca/sdca_fdl.c          |  8 ++---
 sound/soc/sof/fw-file-profile.c    | 19 ++++------
 sound/soc/sof/topology.c           | 20 ++++-------
 32 files changed, 129 insertions(+), 262 deletions(-)

-- 
2.55.0

