Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2A135AC2B;
	Wed,  8 Apr 2026 05:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775627000; cv=none; b=T4C+3/L5yI/3gMZ1eNddovclaYkk48GobSWYM1/od9lG/pa4ZCOlgQ7bbCykH77JXCuskYM0QIYVFJebOQPJkNDgdBfSzzv97qS1GswXjSWLpJ2S9S2JD6uvytI2FghPA5eJus3Wd1Hn9Afb3PYss9hMe8Nu4BZqpDcKFRHEzCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775627000; c=relaxed/simple;
	bh=jmhc0AYM/6vLdOr1JQBQItyxNYi4biM8gajpcey9GqM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EOAYeNJIcK4PYzmcCNYlZU95rpt2wt/U0Qa7gqFIjMocbBXpH5hxUSgPQvNwgVNJNXcC95MX7K8WsgF9hucyyuy/R+a3A/PMZLm3VEyuEveMma4BhAwEtOwrTKV6E0myGUZ2WHx2f6YgBqxVVtgcs+MJFqK+Y+0Oue5H7vOrzIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: d29c1c50330d11f1aa26b74ffac11d73-20260408
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:ad5c3b18-18d8-428c-9455-7bc65b1314c6,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:e7bac3a,CLOUDID:3818e18324f5c9453fa3bfd09e8369f0,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|898,TC:nil,Content:0|15|50,EDM:5
	,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d29c1c50330d11f1aa26b74ffac11d73-20260408
X-User: songxiebing@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <songxiebing@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1760226852; Wed, 08 Apr 2026 13:43:08 +0800
From: songxiebing <songxiebing@kylinos.cn>
To: tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	songxiebing@kylinos.cn,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] ALSA: usb-audio: qcom: Fix incorrect type in enable_audio_stream
Date: Wed,  8 Apr 2026 13:43:04 +0800
Message-Id: <20260408054304.497277-1-songxiebing@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix sparse warning:
sound/usb/qcom/qc_audio_offload.c:943:27: sparse: incorrect type in argument 2
expected unsigned int val but got snd_pcm_format_t.

Explicitly cast pcm_format to unsigned int for snd_mask_leave().

Fixes: 326bbc348298 ("ALSA: usb-audio: qcom: Introduce QC USB SND offloading support")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202604062109.Oxi8JjWW-lkp@intel.com/
Signed-off-by: songxiebing <songxiebing@kylinos.cn>
---
 sound/usb/qcom/qc_audio_offload.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index f161eb29f911..423e4a9b62e2 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -947,7 +947,7 @@ static int enable_audio_stream(struct snd_usb_substream *subs,
 	_snd_pcm_hw_params_any(&params);
 
 	m = hw_param_mask(&params, SNDRV_PCM_HW_PARAM_FORMAT);
-	snd_mask_leave(m, pcm_format);
+	snd_mask_leave(m, (unsigned int)pcm_format);
 
 	i = hw_param_interval(&params, SNDRV_PCM_HW_PARAM_CHANNELS);
 	snd_interval_setinteger(i);
-- 
2.25.1

