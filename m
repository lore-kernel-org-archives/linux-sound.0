Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BD4145355
	for <linux-sound@vger.kernel.org>; Fri,  5 Jul 2024 07:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.48.224.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720166324; cv=none; b=d1pfNMBs7S+8SyzXJlzOIun53kPsv9HSgOjpnpO1tKhIVytdX6ml+Md2XAG2KvaMgeNFJUmGGeSZ/wxHaCBUdCyy+i0q2MQOBgGRsyOeIO6JDn6tRZn4qRQsIWF92FP7TR0c64rcceeSkiE300GFhY9dHahiOtP7GdMzUj9aIRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720166324; c=relaxed/simple;
	bh=si3vtQutvEP2Xbdp+wuMdaZt0q3WLmHPCOaU1axIC0c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r1pY/pUf09f685J6nmBAee+4jju386cskC5HlbcrD4mLANfxafXh6oSS6HDQUg1Rkao9bsmugjAa7CdVrwTTupLuqoK9k2QbjbIU8ABJO+QOG1gvzGveY5+NcA9v3q69i5saYsrLPrlQHdL435GTFlUUsbdXuAoPAFXsTO/li68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz; spf=pass smtp.mailfrom=perex.cz; dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b=tQiVsX3b; arc=none smtp.client-ip=77.48.224.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perex.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b="tQiVsX3b"
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 76DE75B95;
	Fri,  5 Jul 2024 09:58:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 76DE75B95
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1720166318; bh=dXnlVlWe3Xowm4Fa8AlmH2CJXBPGi7cXXGHK8o7Wukk=;
	h=From:To:Cc:Subject:Date:From;
	b=tQiVsX3bNZiuJil+djBZgxNtm3Ys2RRtoV1gb/vb+LGFvPq7KvR5VkBPwEWcp5Wiu
	 O3vHGulV7sTUqvU5Jvu3wgHpi5PUzqW/1KR03NCVJAyP8U/GrCacoOTbgiZkRiN3MR
	 9ra9igQgUHVEaunXi37EORXrcztuNCidjQx1c23k=
Received: from p1gen4.perex-int.cz (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Fri,  5 Jul 2024 09:58:34 +0200 (CEST)
From: Jaroslav Kysela <perex@perex.cz>
To:  <linux-sound@vger.kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] ALSA: pcm: Fix id copying in snd_pcm_set_sync_per_card()
Date: Fri,  5 Jul 2024 09:58:28 +0200
Message-ID: <20240705075828.19746-1-perex@perex.cz>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Avoid to use strncpy and do proper length limiting (12 bytes)
to avoid out of array access.

Fixes: d712c58c55d9 ("ALSA: pcm: optimize and clarify stream synchronization
 ID API")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202407050501.o5Z3bibi-lkp@intel.com/
Signed-off-by: Jaroslav Kysela <perex@perex.cz>
---
 sound/core/pcm_lib.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index c105a7597ff6..40ca8c2b6303 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -543,8 +543,8 @@ void snd_pcm_set_sync_per_card(struct snd_pcm_substream *substream,
 			       const unsigned char *id, unsigned int len)
 {
 	*(__u32 *)params->sync = cpu_to_le32(substream->pcm->card->number);
-	len = max(12, len);
-	strncpy(params->sync + 4, id, len);
+	len = min(12, len);
+	memcpy(params->sync + 4, id, len);
 	memset(params->sync + 4 + len, 0, 12 - len);
 }
 EXPORT_SYMBOL_GPL(snd_pcm_set_sync_per_card);
-- 
2.45.2

