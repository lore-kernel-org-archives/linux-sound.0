Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A4B156976
	for <linux-sound@vger.kernel.org>; Thu, 22 Feb 2024 17:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.48.224.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708623817; cv=none; b=fP/PdywukwSODXeBYm4j5Iqu/lpmXPJqu3TeleKsGTs0h/tuANqV5zVZw5fvW02Jp+3sbwoxkXLlUQ791K29gqMc6KN88YDjW3SbWKQDyFQEMiwRZikubrHcLmcq9VEC4HU1SfAY8uasLxHbsK3qcZLmsiCjK99TqF7SYuaDe68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708623817; c=relaxed/simple;
	bh=p7EBIvPneDSJVQopydUX04CqccaMmKneL5grC37RlWU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RSkphw04IPF4EQPqCPXKnkaWOyBsUiCuRpXjk0ZqYeN8lT1ADpzNHiSp8fV83uYjlIpoyW8jVKH0j10njvCou9UTXpMLCD3EZCfbX4LOn8trOfjJBPAY3KlDX67NB3KKeLpT6ZuSNHQCIi4Gii2Hv0fz2BEAKHCmR21Us30v9RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz; spf=pass smtp.mailfrom=perex.cz; dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b=lXMLrTbs; arc=none smtp.client-ip=77.48.224.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perex.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b="lXMLrTbs"
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 061016EA6;
	Thu, 22 Feb 2024 18:36:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 061016EA6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1708623417; bh=g4va/SxH5SxxjLXtTn5cCgjCARoyCNXTwtAxZWvYlWk=;
	h=From:To:Cc:Subject:Date:From;
	b=lXMLrTbssiy3ceWDObEMJLEt6s7NhlSSxvki2Lt4PdgyDl6ZKXVHJHMRHbRY99jwY
	 JVAwfH87+64OtY73BU6nl2WIb1/DqYJYeJlSRZqwQjAL8kUXdJs9PgE0BhfXL6vIph
	 /XxofVYFvJT4cPGlbylFsyR4OVvEug+l30ucruFg=
Received: from p1gen4.perex-int.cz (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Thu, 22 Feb 2024 18:36:53 +0100 (CET)
From: Jaroslav Kysela <perex@perex.cz>
To:  <linux-sound@vger.kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH] ALSA: pcm: clarify and fix default msbits value for all formats
Date: Thu, 22 Feb 2024 18:36:49 +0100
Message-ID: <20240222173649.1447549-1-perex@perex.cz>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Return used most significant bits from sample bit-width rather than the whole
physical sample word size. The starting bit offset is defined in the format
itself.

The behaviour is not changed for 32-bit formats like S32_LE. But with this
change - msbits value 24 instead 32 is returned for 24-bit formats like S24_LE
etc.

Also, commit 2112aa034907 ("ALSA: pcm: Introduce MSBITS subformat interface")
compares sample bit-width not physical sample bit-width to reset MSBITS_MAX bit
from the subformat bitmask.

Probably no applications are using msbits value for other than S32_LE/U32_LE
formats, because no drivers are reducing msbits value for other formats (with
the msb offset) at the moment.

For sanity, increase PCM protocol version, letting the user space to detect
the changed behaviour.

Signed-off-by: Jaroslav Kysela <perex@perex.cz>
---
 include/uapi/sound/asound.h | 4 ++--
 sound/core/pcm_native.c     | 5 +++++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
index d5b9cfbd9cea..628d46a0da92 100644
--- a/include/uapi/sound/asound.h
+++ b/include/uapi/sound/asound.h
@@ -142,7 +142,7 @@ struct snd_hwdep_dsp_image {
  *                                                                           *
  *****************************************************************************/
 
-#define SNDRV_PCM_VERSION		SNDRV_PROTOCOL_VERSION(2, 0, 16)
+#define SNDRV_PCM_VERSION		SNDRV_PROTOCOL_VERSION(2, 0, 17)
 
 typedef unsigned long snd_pcm_uframes_t;
 typedef signed long snd_pcm_sframes_t;
@@ -416,7 +416,7 @@ struct snd_pcm_hw_params {
 	unsigned int rmask;		/* W: requested masks */
 	unsigned int cmask;		/* R: changed masks */
 	unsigned int info;		/* R: Info flags for returned setup */
-	unsigned int msbits;		/* R: used most significant bits */
+	unsigned int msbits;		/* R: used most significant bits (in sample bit-width) */
 	unsigned int rate_num;		/* R: rate numerator */
 	unsigned int rate_den;		/* R: rate denominator */
 	snd_pcm_uframes_t fifo_size;	/* R: chip FIFO size in frames */
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index f5ff00f99788..21baf6bf7e25 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -486,6 +486,11 @@ static int fixup_unreferenced_params(struct snd_pcm_substream *substream,
 		i = hw_param_interval_c(params, SNDRV_PCM_HW_PARAM_SAMPLE_BITS);
 		if (snd_interval_single(i))
 			params->msbits = snd_interval_value(i);
+		m = hw_param_mask_c(params, SNDRV_PCM_HW_PARAM_FORMAT);
+		if (snd_mask_single(m)) {
+			snd_pcm_format_t format = (__force snd_pcm_format_t)snd_mask_min(m);
+			params->msbits = snd_pcm_format_width(format);
+		}
 	}
 
 	if (params->msbits) {
-- 
2.43.0

