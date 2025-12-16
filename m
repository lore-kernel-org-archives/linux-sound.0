Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9CA25FA10
	for <linux-sound@vger.kernel.org>; Tue, 16 Dec 2025 14:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765894330; cv=none; b=PhMY2qe55kdTizZkSqXhmXplbLEA5Au+bJkfcdQd8zzaNRImQxQsgFPIivdPOpnboXuA4B8TZdCfBNM7VmivDu7qg07WYoTJDyLs3p+aTlwOM/imoCemTfeTHvBR2lisGXgFzhpfrU/BwuJm66a0xUZPxRHTMktbqfgLtDW+Nv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765894330; c=relaxed/simple;
	bh=L1dQWapNUOy0qhtpQRfb9Apat4w0CclJ0ybLGwIB+6w=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=dCEqlGQOTEsLE6IWXqPFAOKaVp8YupXZUcMFntqXKve+FcCTFyfJ7tEh4edIl8uD7UMb4ryFWFYaG/RUG1NydL9IXzRMHIgjoj9pIHI52spakYPFJlZCdaG1IdBRS11Kkl2IuWT9Gv+1daBcs9OFowes+pWli6IlwoKXwXc0aT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DZssgkWv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JW5qLR1L; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DZssgkWv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JW5qLR1L; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DZssgkWv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JW5qLR1L";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DZssgkWv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JW5qLR1L"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 12280336A3;
	Tue, 16 Dec 2025 14:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765894326; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=7UtF3WwWZJQBfIOz4+EMq+s9kNVDE7vzkvJpA9qcFJI=;
	b=DZssgkWvGHkMAULQigibmT7DJ4PAJ2XgLw9AnOMa4za3/uyxJgmK7thxsBIXrCcs9EnyHM
	TessGnc/8pgXJO1gpMtQ3kG5njgzXZLnLZ75mHCU0xGZ16dnxn8dhUt3XFgDR+q/nACK2n
	nsZCVdXqsKhPu2gfIP2MF5D9In7K8Pw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765894326;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=7UtF3WwWZJQBfIOz4+EMq+s9kNVDE7vzkvJpA9qcFJI=;
	b=JW5qLR1LfMhaTt31UVBbZ8F08WJHuY+SCOSvk22o9QWVzxBINA2s1b0mZYDoPVd5T+7X0p
	4BIkONmNTGMza0Bg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765894326; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=7UtF3WwWZJQBfIOz4+EMq+s9kNVDE7vzkvJpA9qcFJI=;
	b=DZssgkWvGHkMAULQigibmT7DJ4PAJ2XgLw9AnOMa4za3/uyxJgmK7thxsBIXrCcs9EnyHM
	TessGnc/8pgXJO1gpMtQ3kG5njgzXZLnLZ75mHCU0xGZ16dnxn8dhUt3XFgDR+q/nACK2n
	nsZCVdXqsKhPu2gfIP2MF5D9In7K8Pw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765894326;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=7UtF3WwWZJQBfIOz4+EMq+s9kNVDE7vzkvJpA9qcFJI=;
	b=JW5qLR1LfMhaTt31UVBbZ8F08WJHuY+SCOSvk22o9QWVzxBINA2s1b0mZYDoPVd5T+7X0p
	4BIkONmNTGMza0Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CEBB83EA63;
	Tue, 16 Dec 2025 14:12:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id URW5MbVoQWk7OwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 16 Dec 2025 14:12:05 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 0/5] ALSA: Clean up runtime PM with guard() & co
Date: Tue, 16 Dec 2025 15:11:45 +0100
Message-ID: <20251216141154.172218-1-tiwai@suse.de>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.78 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.18)[-0.898];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.78

This is a patch series for replacing the manual pm_runtime_get/put()
calls with either guard() or new PM_RUNTIME_ACQUIRE*() macros.

Merely code cleanups, and no functional changes are expected.


Takashi

===

Takashi Iwai (5):
  ALSA: hda/cs35l41: Clean up runtime PM with guard()
  ALSA: hda/cs35l56: Clean up with PM_RUNTIME_ACQUIRE*() macros
  ALSA: hda/tas2781: Clean up runtime PM with guard()
  ALSA: hda/tegra: Clean up runtime PM with guard()
  ALSA: x86: Clean up locks and runtime PM with guard() and co

 sound/hda/codecs/side-codecs/cs35l41_hda.c    | 23 +++++-------
 sound/hda/codecs/side-codecs/cs35l56_hda.c    | 36 ++++++++-----------
 .../hda/codecs/side-codecs/tas2781_hda_i2c.c  | 10 ++----
 .../hda/codecs/side-codecs/tas2781_hda_spi.c  |  7 ++--
 sound/hda/controllers/tegra.c                 | 14 +++-----
 sound/x86/intel_hdmi_audio.c                  | 10 ++----
 6 files changed, 36 insertions(+), 64 deletions(-)

-- 
2.52.0

