Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.128.243.59
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795028611;
	b=OvWlnqgmWA8QMgo9U4DK/9jCwO+RqeVRKN9eT+vG1N56Md1hcXFzHVp5veXijstg4Q1I
	 RZF5zlEBF/zySuBbxLEw8iQ5sC0JSBrmVkr1P642tiLtrHlgJycRmUx4RsGDAipYpt+VV
	 x0IGlzUKdDYqWPMVb085bwBvTIPgtePgLHy1m+XZzPxAf/CmBgE2uss/D2KY3A3IhoaX1
	 XvHHJbR5J1A3JxikNhUZ824fB1pqfygY4h7v/88kdYCNAYm380y0E+Egf6Sf4HMp1ur7p
	 NQiv8I8kMA2TiG7dkL6bSlzYMV3/+vbDEvLkrsxFQGQPCMYsPVexLorGaRlC7SXPAog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795028611;
	h=DMARC-Filter:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=6hjov8K1QX9lsLtAlgLoy0k0xdJAeDMKTAwu5v1tsnk=;
	b=GGoN0PiDtYrStSgwX90muaSC4quZT3I06SSl7gYGbGiWH8ZYNoShouHT4Ox7LCTraTbr
	 4Nz8AA0azIyr8VoQS+Z1o3RJR5dRS5TLlYmvZP15twaZghh+ZhqSbnpYjgw4u/Crj1qHK
	 9RsKYS4Zis8/gKw+zUWPgyC4AxrHQJgGdqTYXtMMTngqDwYFZGyoSkELD1g8QmKuLVzFN
	 ZMSMmx324D1t3koSDXAH6u9vXQLivKLBranYooi11nQ0X4qkJjssz+p+O13Su+yGyd2nH
	 GF/FrsPzyh7JcWUitn9LUL4aWJjcTVh+PxnRmoZiK7Uei9O5nWJyrbDbe5X1F04rfcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asmblr.net;
	spf=pass smtp.mailfrom=asmblr.net;
	dkim=pass header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=USPHPOdy;
	arc=none smtp.remote-ip=85.128.243.59
Received: from shared-aoh59.rev.nazwa.pl (shared-aoh59.rev.nazwa.pl [85.128.243.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC8B606A325
	for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 19:03:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CC8B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asmblr.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=USPHPOdy
X-Virus-Scanned: by amavisd-new using ClamAV (18)
X-Spam-Flag: NO
X-Spam-Score: -0.625
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asmblr.net;
	s=1706450368.internal; t=1795028607;
	bh=6hjov8K1QX9lsLtAlgLoy0k0xdJAeDMKTAwu5v1tsnk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=USPHPOdyxZdyosFvtJumYftCcHE6X4ldNF/P9nCD7rUzl5JnmcDQSeRz8ztzc0bTn
	 QFBvF2H7lVFRzBtXPej+oxllASWG5zRYe80LAEMCKvno9jlYqJmQBXqji/ikaQYV6e
	 za067aW/aUvFLtzTP4R7pr2Bt6KkNXmjmbZufyQOdfShX8YO4afdyfEGIaSA0o0pBq
	 9Unyu8MuzfYNkARmZ8gDOZNtf43yHD0NH967IUQt8/xEsJAsA7ey0Ato+pgIs2PrJD
	 tTI8An1BtbUKgVlhW1We1ns34WBmp8MkvMgqOjcqUDFInrNeHRvUCTrP+YAXLqdiDW
	 jqNzjRQpwowvw==
Received: from milkyway (91-150-220-230.dynamic.play.pl [91.150.220.230])
	by server753313.nazwa.pl (Postfix) with ESMTP id 941E61BE38D;
	Wed, 18 Nov 2026 20:03:27 +0100 (CET)
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
To: linux-sound@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
Subject: [PATCH 10/22] ASoC: codecs: pm4125: Remove orphaned SoundWire helper declarations
Date: Wed, 18 Nov 2026 20:02:07 +0100
Message-ID: <20261118190219.316811-11-amade@asmblr.net>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118190219.316811-1-amade@asmblr.net>
References: <20261118190219.316811-1-amade@asmblr.net>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

pm4125_sdw_free() and pm4125_sdw_set_sdw_stream() were declared in
pm4125.h when the driver was added in commit 8ad529484937 ("ASoC:
codecs: add new pm4125 audio codec driver"), but were never implemented.
Remove their orphaned prototypes and stub definitions from pm4125.h.

Signed-off-by: Amadeusz Sławiński <amade@asmblr.net>
---
 sound/soc/codecs/pm4125.h | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/sound/soc/codecs/pm4125.h b/sound/soc/codecs/pm4125.h
index 25fd3106f44f..f2946b70c68d 100644
--- a/sound/soc/codecs/pm4125.h
+++ b/sound/soc/codecs/pm4125.h
@@ -221,26 +221,10 @@ struct pm4125_sdw_priv {
 };
 
 #if IS_ENABLED(CONFIG_SND_SOC_PM4125_SDW)
-int pm4125_sdw_free(struct pm4125_sdw_priv *pm4125, struct snd_pcm_substream *substream,
-		    struct snd_soc_dai *dai);
-int pm4125_sdw_set_sdw_stream(struct pm4125_sdw_priv *pm4125, struct snd_soc_dai *dai, void *stream,
-			      int direction);
 int pm4125_sdw_hw_params(struct pm4125_sdw_priv *pm4125, struct snd_pcm_substream *substream,
 			 struct snd_pcm_hw_params *params, struct snd_soc_dai *dai);
 
 #else
-static inline int pm4125_sdw_free(struct pm4125_sdw_priv *pm4125,
-				  struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
-{
-	return -EOPNOTSUPP;
-}
-
-static inline int pm4125_sdw_set_sdw_stream(struct pm4125_sdw_priv *pm4125,
-					    struct snd_soc_dai *dai, void *stream, int direction)
-{
-	return -EOPNOTSUPP;
-}
-
 static inline int pm4125_sdw_hw_params(struct pm4125_sdw_priv *pm4125,
 				       struct snd_pcm_substream *substream,
 				       struct snd_pcm_hw_params *params, struct snd_soc_dai *dai)
-- 
2.56.1

