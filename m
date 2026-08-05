Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98D0472F65
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 13:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785937987; cv=none; b=PkRfdfSVOWL1wafZZpkAzx0UThX2HcBM7sGSP3FXJ7d8+0iPFiHuydU0xZ0hve7pq3gceeTkzbXKl41+7dDJrYIsvHFemnjAxX6HbuMMjRt2fv2v0mG+JUcRUbjnqKWqRup/tEV3WxWSrmlsnDurekb3aE7AtFRPqUfEBGKPT+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785937987; c=relaxed/simple;
	bh=sK6tMQFcJ66jMHO2PTxL0Diqw0/yPxn7ZaoVi1xCIkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g4EnBK5Gk81hQRae+3ZRjNF3VGVsV9GbNb4RO+Er2EojnBYxuR552RlyKNyE5S4LbIOqu9jKZbex1Hs4u/TpWOXN+J+KslI+29KslNQv5Mk/a6yi844ukzCtZAc0gXW8fhxUqfaImRcTRoFzjsCuWFMvO7Jo4OD8cEpPvlafIlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=K3EpbguW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GS7TK6sM; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rfiAm37V; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=v3uTKiiB; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="K3EpbguW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GS7TK6sM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rfiAm37V";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="v3uTKiiB"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 67FB33CCD;
	Wed,  5 Aug 2026 13:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785937979; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=oaX3S+BZHwYFEnNZS104XHp8naID5pdtL8x1aa82kUM=;
	b=K3EpbguW34PigBGZ4QMy9ln93lg12UQyHaUDAsyguyLqohVNPpUbYbQTIX4fB43d+BXgo1
	VW8cHP71yQzzMJANonT/cZYNkup8dolG7qtPZddNey2nCSRdVsYYu6BQe/8qYr/d+xxUsx
	YO7+/9I0xMTTsctWPgryfATQgJeYVbw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785937979;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=oaX3S+BZHwYFEnNZS104XHp8naID5pdtL8x1aa82kUM=;
	b=GS7TK6sMKrSB4mcZwfZTVaazsnIl+ixCi0+c0Eem/13ACVQnJTVpEMWzZMZX1K4a627mCj
	qgL219Znd/O4aTAA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=rfiAm37V;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=v3uTKiiB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785937975; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=oaX3S+BZHwYFEnNZS104XHp8naID5pdtL8x1aa82kUM=;
	b=rfiAm37VcHVW3aqUJZWF7T+22dqfyHuiglHfuf1JuuEcaNK9LQKPc4DV2phLFzG126l7EU
	n0YLGO2QzJX3FHp08nv4D5rS/mMzrxyFvxxYsSHu+Gc80rQ/IL2zu7liSikTj02NCd+XH3
	XmFY401QK3yFlwSdWfXwMl/7ttZjIx0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785937975;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=oaX3S+BZHwYFEnNZS104XHp8naID5pdtL8x1aa82kUM=;
	b=v3uTKiiB/oWH8JtnoOVsd5iYXaSHNwYh0Y2U9suCwUaICq9hQpGga5rAtnOihxvGPjOz9B
	5PhwvEkjQ0h4hdDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4C86A779C2;
	Wed,  5 Aug 2026 13:52:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id dh6NETZAc2ouSQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 05 Aug 2026 13:52:54 +0000
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
Subject: [PATCH 00/31] ASoC: Use auto-cleanup for firmware loading
Date: Wed,  5 Aug 2026 15:52:01 +0200
Message-ID: <20260805135247.670693-1-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.51
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 67FB33CCD
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
	RCPT_COUNT_TWELVE(0.00)[26];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_CC(0.00)[vger.kernel.org,ti.com,linux.intel.com,intel.com,opensource.cirrus.com,nxp.com,gmail.com,bootlin.com,irondevice.com,metafoo.de,foursemi.com,analog.com,realtek.com,linux.dev,kernel.org,amd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	R_RATELIMIT(0.00)[to_ip_from(RLna17kie9usqamwcp1qp1qygs)];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

Hi,

here is a series of trivial patches to use the auto-cleanup (via
__free(firmware)) for firmware management.
All simple cleanups to reduce the manual calls of release_firmware().

Only code refactoring and no behavior changes intended.

Targeted for 7.3 or later.


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

