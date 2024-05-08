Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B9674400
	for <linux-sound@vger.kernel.org>; Wed,  8 May 2024 09:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715159944; cv=none; b=Rg8O+w/S6erFkaoHSyLXiwsS9I10YUrbeBsLNgzhkSVa0LV+oj5XQzCgDG20w6GTewCueUabCzlia3tYB/cZmN1NEt1Sneu07/R1nX0mH5PPBAwzAOG3C9OtSsSBCTAlloTMlU7M2sQEvqXMtbdXqmiNb4l345aJW+MrvCqzdX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715159944; c=relaxed/simple;
	bh=6ZRV6G45GNHkzbbrTeWKs9MawVMCS4eH6KhG3sLCD18=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XD1bcCfVqkrVmW0LYEotfFco7Gj2zQFawh/l6CQoLSuanb5GM5xnKMsGTLn5+Ksjm5mFyNlYGhnd/oGdpVpQA28DPB5D9HuWXuz57mWA947IQupGvjPPMbZ0ELiA8gTLP6du1uzM/ak4lraXW4Ca80TDjEpFy/ZIxvCmDn/XUvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D2CFB34E9D;
	Wed,  8 May 2024 09:19:00 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AA4CC13A3D;
	Wed,  8 May 2024 09:19:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0G9MKIRDO2bFGQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 08 May 2024 09:19:00 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH 3/7] ASoC: qcom: Add missing module descriptions
Date: Wed,  8 May 2024 11:19:02 +0200
Message-ID: <20240508091909.27062-4-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240508091909.27062-1-tiwai@suse.de>
References: <20240508091909.27062-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: D2CFB34E9D

Now that make W=1 starts complaining the lack of MODULE_DESCRIPTION(),
let's add the missing information.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Link: https://lore.kernel.org/r/ZjpQm-hxLQtpgkUx@smile.fi.intel.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/qcom/common.c             | 2 ++
 sound/soc/qcom/qdsp6/q6dsp-common.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index 747041fa7866..3d02aa3844f2 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -239,4 +239,6 @@ int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
 	return 0;
 }
 EXPORT_SYMBOL_GPL(qcom_snd_wcd_jack_setup);
+
+MODULE_DESCRIPTION("ASoC Qualcomm helper functions");
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/qcom/qdsp6/q6dsp-common.c b/sound/soc/qcom/qdsp6/q6dsp-common.c
index 95585dea2b36..f74585d88bd6 100644
--- a/sound/soc/qcom/qdsp6/q6dsp-common.c
+++ b/sound/soc/qcom/qdsp6/q6dsp-common.c
@@ -98,4 +98,6 @@ int q6dsp_get_channel_allocation(int channels)
 	return channel_allocation;
 }
 EXPORT_SYMBOL_GPL(q6dsp_get_channel_allocation);
+
+MODULE_DESCRIPTION("ASoC MSM QDSP6 helper functions");
 MODULE_LICENSE("GPL v2");
-- 
2.43.0

