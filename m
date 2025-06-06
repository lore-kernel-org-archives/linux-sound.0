Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA410286429
	for <linux-sound@vger.kernel.org>; Fri,  6 Jun 2025 10:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749205592; cv=none; b=KV/8IaVs2SoPbzzhgC4hCgfYVFyS7ugWOq8SQ+5RGSzo5BT/Co0M41YMHEDwWd7+n1tFbTjuJHg0MYGoiJm7MPvv945gXZa661d6q7bDg/wy/ZJK2Z+ukuIZKpCjGehreo1zKL4KnBUkbds+0UUfQ9gOoUEY/VIf6mpdvIOtqzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749205592; c=relaxed/simple;
	bh=xywcUUHNBg1GQxxY3yQ/wG7JEVvdddSoDa3fwOJsAv0=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=MSrBiAvAeG1k5A4Z7bD+hWlItlrf4tYR3zqdG18AC3SfJ4dbATaMK7pE1/eYoy+V4RIYacnwOCUSxOpbnMjr+9LT9T0F9FCjITwCK1lj6eY0tRr6qDSbeajEOeraV3aLO6vtpiTfyt10EzMnvLpZgIs7eW34En7pD/SOqMDjDWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: b124d4c442c011f0b29709d653e92f7d-20250606
X-CTIC-Tags:
	HR_CTE_8B, HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE
	HR_FROM_DIGIT_LEN, HR_FROM_NAME, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER
	HR_SJ_NOR_SYM, HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT
	HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED
	SA_TRUSTED, SA_EXISTED, SN_TRUSTED, SN_EXISTED, SPF_NOPASS
	DKIM_NOPASS, DMARC_NOPASS, CIE_BAD, CIE_GOOD_SPF, GTI_FG_BS
	GTI_RG_INFO, GTI_C_BU, AMN_T1, AMN_GOOD, AMN_C_TI
	AMN_C_BU
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:f8a10929-956d-4354-9a32-352e72346488,IP:0,U
	RL:0,TC:0,Content:0,EDM:-30,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-35
X-CID-INFO: VERSION:1.1.45,REQID:f8a10929-956d-4354-9a32-352e72346488,IP:0,URL
	:0,TC:0,Content:0,EDM:-30,RT:0,SF:-5,FILE:0,BULK:0,RULE:EDM_GN8D19FE,ACTIO
	N:release,TS:-35
X-CID-META: VersionHash:6493067,CLOUDID:2f86a75e7759ea9d5d622ffcc48e34e4,BulkI
	D:250606182036RPWYW094,BulkQuantity:1,Recheck:0,SF:17|19|38|66|78|102,TC:n
	il,Content:0|50,EDM:2,IP:nil,URL:0,File:nil,RT:nil,Bulk:40,QS:nil,BEC:nil,
	COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_FSD,TF_CID_SPAM_SNR,TF_CID_SPAM_FAS
X-UUID: b124d4c442c011f0b29709d653e92f7d-20250606
X-User: lijun01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lijun01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 114135264; Fri, 06 Jun 2025 18:26:22 +0800
From: Li Jun <lijun01@kylinos.cn>
To: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	lijun01@kylinos.cn
Subject: [PATCH] sound: isa: combine lines that defining variables and assigning values
Date: Fri,  6 Jun 2025 18:25:38 +0800
Message-Id: <20250606102538.95678-1-lijun01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Because the vars be assigning values immediately after
defining, so combine them.

Signed-off-by: Li Jun <lijun01@kylinos.cn>
---
 sound/isa/ad1816a/ad1816a_lib.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/sound/isa/ad1816a/ad1816a_lib.c b/sound/isa/ad1816a/ad1816a_lib.c
index 2b87036cb94f..29ec91ba8c51 100644
--- a/sound/isa/ad1816a/ad1816a_lib.c
+++ b/sound/isa/ad1816a/ad1816a_lib.c
@@ -276,8 +276,10 @@ static snd_pcm_uframes_t snd_ad1816a_playback_pointer(struct snd_pcm_substream *
 {
 	struct snd_ad1816a *chip = snd_pcm_substream_chip(substream);
 	size_t ptr;
+
 	if (!(chip->mode & AD1816A_MODE_PLAYBACK))
 		return 0;
+
 	ptr = snd_dma_pointer(chip->dma1, chip->p_dma_size);
 	return bytes_to_frames(substream->runtime, ptr);
 }
@@ -286,8 +288,10 @@ static snd_pcm_uframes_t snd_ad1816a_capture_pointer(struct snd_pcm_substream *s
 {
 	struct snd_ad1816a *chip = snd_pcm_substream_chip(substream);
 	size_t ptr;
+
 	if (!(chip->mode & AD1816A_MODE_CAPTURE))
 		return 0;
+
 	ptr = snd_dma_pointer(chip->dma2, chip->c_dma_size);
 	return bytes_to_frames(substream->runtime, ptr);
 }
@@ -425,11 +429,11 @@ static int snd_ad1816a_playback_open(struct snd_pcm_substream *substream)
 {
 	struct snd_ad1816a *chip = snd_pcm_substream_chip(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	int error;
+	int error = snd_ad1816a_open(chip, AD1816A_MODE_PLAYBACK);
 
-	error = snd_ad1816a_open(chip, AD1816A_MODE_PLAYBACK);
 	if (error < 0)
 		return error;
+
 	runtime->hw = snd_ad1816a_playback;
 	snd_pcm_limit_isa_dma_size(chip->dma1, &runtime->hw.buffer_bytes_max);
 	snd_pcm_limit_isa_dma_size(chip->dma1, &runtime->hw.period_bytes_max);
@@ -441,11 +445,11 @@ static int snd_ad1816a_capture_open(struct snd_pcm_substream *substream)
 {
 	struct snd_ad1816a *chip = snd_pcm_substream_chip(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	int error;
+	int error = snd_ad1816a_open(chip, AD1816A_MODE_CAPTURE);
 
-	error = snd_ad1816a_open(chip, AD1816A_MODE_CAPTURE);
 	if (error < 0)
 		return error;
+
 	runtime->hw = snd_ad1816a_capture;
 	snd_pcm_limit_isa_dma_size(chip->dma2, &runtime->hw.buffer_bytes_max);
 	snd_pcm_limit_isa_dma_size(chip->dma2, &runtime->hw.period_bytes_max);
@@ -618,10 +622,9 @@ static const struct snd_pcm_ops snd_ad1816a_capture_ops = {
 
 int snd_ad1816a_pcm(struct snd_ad1816a *chip, int device)
 {
-	int error;
 	struct snd_pcm *pcm;
+	int error = snd_pcm_new(chip->card, "AD1816A", device, 1, 1, &pcm);
 
-	error = snd_pcm_new(chip->card, "AD1816A", device, 1, 1, &pcm);
 	if (error)
 		return error;
 
-- 
2.25.1

