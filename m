Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F107921ADB9
	for <linux-sound@vger.kernel.org>; Mon, 11 Aug 2025 10:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754906906; cv=none; b=a1DZMN4lPwEP+NFGlbYSoRuM/5S9kCYXI+UMv3i5u358u7aneizzlDPTLh/cXP3jZQjo+KATmM9MJ3mMzGteTkkfs2m9nYa3u+k5cJOPGEdHNZ969PFR6wGGvpC+8C0bxmIDnS4kquJdPvt1zCrzghkTWz034RwBZjh61pyPjpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754906906; c=relaxed/simple;
	bh=n8G/lcq4o8BFthSdwE0qIy5c6NLuwVB3aYVAve/2yKs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pq5IesIbU5P5biM8c5N2t8m90HhMBIkuuXph/mfx2JiZIISIoZMozE1HibHamPXk7PluCp7Z0GjBL3IKhqUDOiEedRNEl7/OTAYSrUQiGNk+PSby9PCTrdz6pF3/rWssvdnrfGzcSr73LQuGnWpYfXXRP5BQczcWSJesFfGDV20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tcNFwhd9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cfAzHQzd; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oOp/Z6yE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Bi+nhL/Z; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tcNFwhd9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cfAzHQzd";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oOp/Z6yE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Bi+nhL/Z"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D9D1C5BDE7;
	Mon, 11 Aug 2025 10:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754906894; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=lEsxqqNgaQGjPtP4S2SzofaQqqgDefs40ptrgo4TTy8=;
	b=tcNFwhd9Qr/dPvONX3xzt1QDkmhFOzx+VK8W59TI050hmjTAtUd+dZkEio6tIdJToYQyP2
	7sWes4RYd8kWHFr/92geBeIISd18QXiEc6YeRHmqmcpLDzd9WYTCq9WY8dc2dKIs5B0/YQ
	onVb47cGQgv5U9E4KhpH7JDdewohdBQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754906894;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=lEsxqqNgaQGjPtP4S2SzofaQqqgDefs40ptrgo4TTy8=;
	b=cfAzHQzdXnITMBEAvpWFMABg1OwkrvV2ViNHpw6NqBJdBbAT+iy/Q3ywuuqW2++Lh3Rz/0
	jTOQOJr/zFxSQ6AQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754906892; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=lEsxqqNgaQGjPtP4S2SzofaQqqgDefs40ptrgo4TTy8=;
	b=oOp/Z6yE+ZxSKF/cMtc5DZG0vF2Aut+m+unHE7InXr5Nc6orVFAWlLXUUeiWqiQZ/IYoUV
	zZwBtpHHHgWzUbVUpNkDlZo10kWtGbGUIjPxchjP0IfM+q8oDXdGNlwzxr0KYGh+7y3rho
	FeciXrQgzcV+5NJ5NOGTh1+oS+210cI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754906892;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=lEsxqqNgaQGjPtP4S2SzofaQqqgDefs40ptrgo4TTy8=;
	b=Bi+nhL/ZXoSsrjToLBHdtRdXSexRgKIaeX6z2RsVCTWB10U6twmkSDtNVp/E9WaA3RSnEp
	5nNls+1+nN27uRDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A180413479;
	Mon, 11 Aug 2025 10:08:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0Fk6JgzBmWiVBwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 11 Aug 2025 10:08:12 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>
Subject: [PATCH 00/25] ALSA: hda: Use auto-cleanup macros
Date: Mon, 11 Aug 2025 12:07:34 +0200
Message-ID: <20250811100807.7962-1-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80

This is a slightly largish patch set for cleaning up HD-audio code to
use the auto-cleanup macros like guard(), CLASS() and __free() for
managing the locking and temporary buffers.

All patches are only about code refactoring and no behavior changes
intended.


Takashi

===

Takashi Iwai (25):
  ALSA: hda: Introduce auto cleanup macros for PM
  ALSA: hda/ca0132: Use cleanup macros for PM controls
  ALSA: hda/hdmi: Use cleanup macros for PM controls
  ALSA: hda/realtek: Use cleanup macros for PM controls
  ALSA: hda/common: Use cleanup macros for PM controls
  ALSA: hda: Use auto cleanup macros for DSP loader locks
  ALSA: hda/common: Use guard() for mutex locks
  ALSA: hda/core: Use guard() for mutex locks
  ALSA: hda/ca0132: Use guard() for mutex locks
  ALSA: hda/hdmi: Use guard() for mutex locks
  ALSA: hda/realtek: Use guard() for mutex locks
  ALSA: hda/cs35l41: Use guard() for mutex locks
  ALSA: hda/tas2781: Use guard() for mutex locks
  ALSA: hda/cs8409: Use guard() for mutex locks
  ALSA: hda/component: Use guard() for mutex locks
  ALSA: hda/generic: Use guard() for mutex locks
  ALSA: hda/analog: Use guard() for mutex locks
  ALSA: hda/intel: Use guard() for mutex locks
  ALSA: hda/common: Use auto cleanup for temporary buffers
  ALSA: hda/realtek: Use auto cleanup for temporary buffers
  ALSA: hda/generic: Use auto cleanup for temporary buffers
  ALSA: hda/ext: Use guard() for spinlocks
  ALSA: hda/core: Use guard() for spinlocks
  ALSA: hda/common: Use guard() for spinlocks
  ALSA: hda/intel: Use guard() for spinlocks

 include/sound/hda_codec.h                     |  30 ++
 include/sound/hdaudio.h                       |   1 +
 sound/hda/codecs/analog.c                     |   3 +-
 sound/hda/codecs/ca0132.c                     | 276 +++++++-----------
 sound/hda/codecs/cirrus/cs8409.c              |  22 +-
 sound/hda/codecs/generic.c                    |  76 ++---
 sound/hda/codecs/hdmi/hdmi.c                  | 199 +++++--------
 sound/hda/codecs/hdmi/nvhdmi-mcp.c            |   3 +-
 sound/hda/codecs/realtek/alc268.c             |   3 +-
 sound/hda/codecs/realtek/alc269.c             |   3 +-
 sound/hda/codecs/realtek/realtek.c            |  22 +-
 sound/hda/codecs/side-codecs/cs35l41_hda.c    | 110 +++----
 sound/hda/codecs/side-codecs/hda_component.c  |  15 +-
 sound/hda/codecs/side-codecs/hda_component.h  |   3 +-
 .../hda/codecs/side-codecs/tas2781_hda_i2c.c  |  53 ++--
 sound/hda/common/codec.c                      | 129 ++++----
 sound/hda/common/controller.c                 | 124 ++++----
 sound/hda/common/proc.c                       |   4 +-
 sound/hda/common/sysfs.c                      | 110 +++----
 sound/hda/controllers/intel.c                 |  14 +-
 sound/hda/core/bus.c                          |   8 +-
 sound/hda/core/component.c                    |   6 +-
 sound/hda/core/controller.c                   |  58 ++--
 sound/hda/core/device.c                       |  23 +-
 sound/hda/core/ext/controller.c               |   6 +-
 sound/hda/core/ext/stream.c                   |  38 ++-
 sound/hda/core/regmap.c                       |  35 +--
 sound/hda/core/stream.c                       |  31 +-
 28 files changed, 559 insertions(+), 846 deletions(-)

-- 
2.50.1

