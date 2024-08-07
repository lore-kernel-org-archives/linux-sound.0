Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB52768FD
	for <linux-sound@vger.kernel.org>; Wed,  7 Aug 2024 15:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723044412; cv=none; b=m3IAbxTaUGUusQWlN1iEXENZMlUmip6W0w1EOv6VynXl5oScGdSq/qec3h8vEFrP41mcsjK7ZMtVkoqA7vlMnqacNvbuget5r00vjjZDuQaNTYhKuyWyeNyitsmsJfS7rUWrXVnxMur1k9+fVgVEWE+d7gmRKaJ1t47eQCqiGW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723044412; c=relaxed/simple;
	bh=27V6w7KxDzxPSH/bgdRj7jam0Mh0AaW1fZ/7udhlx8E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nqavk5vaNbZlz8WNg6Z0a9B5+qI3y8qDj2wokAEjlWJTPIAZ/IQlMjnwZQ6pCoCyfkn5nMr0ADaWs/MxDxE/c0sMpBVXp2mNq+/xsnNlNqLyNNi9/QUek2PqcmILcz65rMHjx3HGxd2GGI7PR93VmWREbvQdcSTU+ndDma3JPAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fGVuxe2j; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bMl9Tkv6; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fGVuxe2j; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bMl9Tkv6; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fGVuxe2j";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bMl9Tkv6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fGVuxe2j";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bMl9Tkv6"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9015D21A8B;
	Wed,  7 Aug 2024 15:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723044408; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=HuLDm8AF4KM2JXlRhi/8GhHOyeSqQq9gOrPmYrRRpEo=;
	b=fGVuxe2jpmdSv+XKU3lwSdlQPNDt1dLfIHR/IhY7mH0ojAAAbNGK+2RilWMq0A8+YNqlkZ
	h95Q1HiPJnvCg9SuWJ59chtCrsfjGRDnIkNoQ4IvwIfNMu215+OPJVyN5VTb/8BL6JY+//
	MCoemaMTkq/yORXN7h1BSms12DVtb9E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723044408;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=HuLDm8AF4KM2JXlRhi/8GhHOyeSqQq9gOrPmYrRRpEo=;
	b=bMl9Tkv6DPnlQXd4ybMeYHBtO8w77QP3yfU4doY0nzGVu8Tsub3a+IOU2PvLcfPMzuX6tl
	UMsMA8q/RFclgNAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723044408; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=HuLDm8AF4KM2JXlRhi/8GhHOyeSqQq9gOrPmYrRRpEo=;
	b=fGVuxe2jpmdSv+XKU3lwSdlQPNDt1dLfIHR/IhY7mH0ojAAAbNGK+2RilWMq0A8+YNqlkZ
	h95Q1HiPJnvCg9SuWJ59chtCrsfjGRDnIkNoQ4IvwIfNMu215+OPJVyN5VTb/8BL6JY+//
	MCoemaMTkq/yORXN7h1BSms12DVtb9E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723044408;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=HuLDm8AF4KM2JXlRhi/8GhHOyeSqQq9gOrPmYrRRpEo=;
	b=bMl9Tkv6DPnlQXd4ybMeYHBtO8w77QP3yfU4doY0nzGVu8Tsub3a+IOU2PvLcfPMzuX6tl
	UMsMA8q/RFclgNAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 43D5113297;
	Wed,  7 Aug 2024 15:26:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id BnteDziSs2bxewAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Aug 2024 15:26:48 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/2] ALSA/DRM: vmalloc PCM buffer helper cleanup
Date: Wed,  7 Aug 2024 17:27:21 +0200
Message-ID: <20240807152725.18948-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de];
	TAGGED_RCPT(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -1.30
X-Spam-Flag: NO
X-Spam-Level: 

Hi,

we still keep the legacy vmalloc ALSA PCM helper API since there is
only a single user of it, namely, the DRM dw-hdmi bridge driver.
In the past, I attempted to change the buffer management of the
driver, but due to the lack of testing, it failed to get merged:
  https://lore.kernel.org/20191210154536.29819-1-tiwai@suse.de

So, this is a second try after some years of gap: now the relevant
code snippet is moved from ALSA core to dw-hdmi driver itself, and the
API functions are dropped.  There should be no functional changes in
the driver.

If DRM people don't mind and give an ack, I can take the change for
dw-hdmi code together with ALSA core code drop via sound tree for
6.12.


thanks,

Takashi

===

Takashi Iwai (2):
  drm/bridge: dw-hdmi: Move vmalloc PCM buffer management into the
    driver
  ALSA: pcm: Drop PCM vmalloc buffer helpers

 .../drm/bridge/synopsys/dw-hdmi-ahb-audio.c   | 30 ++++++++--
 include/sound/pcm.h                           | 42 -------------
 sound/core/pcm_memory.c                       | 59 -------------------
 3 files changed, 26 insertions(+), 105 deletions(-)

-- 
2.43.0

