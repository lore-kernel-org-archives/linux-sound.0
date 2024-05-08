Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDD2450E2
	for <linux-sound@vger.kernel.org>; Wed,  8 May 2024 09:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715159943; cv=none; b=kt7uOabk6WUdloyRY+TQNefGs68FELgP5IV0j3GyxLzfAw2SxYEGThFxWMN4g5mSPooE4kQGiypzUi1nHI2X+r06mVnatMr1ZBhL7/TLD7txAWtyMmEPlp4hYydU9DV0NqrZGXXm97HplmVqYP+KvItGHJc+oBMhTeQ1h+iD2+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715159943; c=relaxed/simple;
	bh=G3/RdnDzeLQ3js0iD4zHDzEj/Zuw5i1urDniLk+Ym/s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j0Qjp1JjT43gbh6NX1ZC7TnyozbcnKwjFo1C37Jj1Y4jYZ/nuaYp2IzAMcFxT9oe6KFNCoZy64gYR26pqh5mvc7IKfVlavhtF6LXrgdjvsk+2eRtUEiH4bwbE6fLDjXetU3MdHONSo1Fcnjftn/cP4oQ4uwWWigiYmagsapRciY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=higHafBm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vE7MZEQi; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=higHafBm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vE7MZEQi; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="higHafBm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vE7MZEQi";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="higHafBm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vE7MZEQi"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 332E05C713;
	Wed,  8 May 2024 09:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715159940; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=LXy8NAq/dmi8/IY83MFW1E4KBQqLl0zsAYfTRDHEhzA=;
	b=higHafBm2ti881jiFNoBZuQzcSbdCnGdjhXK/C9pUdfqCfyXUG7VYkUx0mo9Ol5sDX8Prj
	3DI4PX6NfOXmkvJF0tbNbv+8XFQwNJFscIuoc3jIeycPPJlsTp1M3JDbgBty30BzC9Bodd
	L/t5KzANYt1PaCkaRPCXciUtqabY3ec=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715159940;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=LXy8NAq/dmi8/IY83MFW1E4KBQqLl0zsAYfTRDHEhzA=;
	b=vE7MZEQiLdVBY4/EZ/hc77ohbQJoeYdZ7p+zQE+wKo2hPkRvtxEwtQ/NRGF8s/EFFRJdkV
	qLOaGuiv4rE0pIDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715159940; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=LXy8NAq/dmi8/IY83MFW1E4KBQqLl0zsAYfTRDHEhzA=;
	b=higHafBm2ti881jiFNoBZuQzcSbdCnGdjhXK/C9pUdfqCfyXUG7VYkUx0mo9Ol5sDX8Prj
	3DI4PX6NfOXmkvJF0tbNbv+8XFQwNJFscIuoc3jIeycPPJlsTp1M3JDbgBty30BzC9Bodd
	L/t5KzANYt1PaCkaRPCXciUtqabY3ec=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715159940;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=LXy8NAq/dmi8/IY83MFW1E4KBQqLl0zsAYfTRDHEhzA=;
	b=vE7MZEQiLdVBY4/EZ/hc77ohbQJoeYdZ7p+zQE+wKo2hPkRvtxEwtQ/NRGF8s/EFFRJdkV
	qLOaGuiv4rE0pIDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 13A2B13A27;
	Wed,  8 May 2024 09:19:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id j/2FA4RDO2bFGQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 08 May 2024 09:19:00 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 0/7] ASoC: Add missing module descriptions
Date: Wed,  8 May 2024 11:18:59 +0200
Message-ID: <20240508091909.27062-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
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
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO

Hi,

here is a trivial patch series to add the missing module descriptions
to ASoC drivers, as make W=1 starts complaining the lack of
MODULE_DESCRIPTION() since recently.

The whole sound/soc/sof/* are untouched as there are too many files
involved, and I left SOF people to address them.


thanks,

Takashi

===

Takashi Iwai (7):
  ASoC: ab8500: Add missing module description
  ASoC: sigmadsp: Add missing module description
  ASoC: qcom: Add missing module descriptions
  ASoC: dmaengine: Add missing module description
  ASoC: topology-test: Add missing module description
  ASoC: ux500: Add missing module description
  ASoC: xilinx: Add missing module descriptions

 sound/soc/codecs/ab8500-codec.c       | 1 +
 sound/soc/codecs/sigmadsp.c           | 1 +
 sound/soc/qcom/common.c               | 2 ++
 sound/soc/qcom/qdsp6/q6dsp-common.c   | 2 ++
 sound/soc/soc-generic-dmaengine-pcm.c | 1 +
 sound/soc/soc-topology-test.c         | 1 +
 sound/soc/ux500/ux500_msp_dai.c       | 1 +
 sound/soc/xilinx/xlnx_formatter_pcm.c | 2 ++
 sound/soc/xilinx/xlnx_i2s.c           | 1 +
 9 files changed, 12 insertions(+)

-- 
2.43.0

