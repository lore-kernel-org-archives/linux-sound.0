Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795072299;
	b=TtIkXr9mkFgPebC+0DVr4TzSdWmZy9wgmfQdkRBybsDSvLqA3CfObR6dnm0EUY8fg9Ch
	 7/A+AvBCrOg32WasXGPJrpN2Sy4LxkcKfF2Giyt/xMpDUqV/Y0EBs06jjSu0NUWr7+Y5o
	 ZNBJQ74UY55hfmpnqAZVjcq57pHOuIRueci+bWt6Q+Ibdf/yaqQeS6Mb3e1+BKXe1ENda
	 /T4JBEl/yjULF5dZTPCnG8Uh56x/8bZP5sJ3ZB3LzdpWeffBlCJGeOZq33nzlHLWopFmU
	 e3YTiRPSq+bi77ybAS0uK8E2te4wqEgZ5b9S1QnT+hrg7ApH6NXACOrC+ic/EjKxDYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795072299;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gmQfPdDmWKnrX0XAyqEsmKfub/wtBIoPuAXJa+FkKa4=;
	b=e5vZBpGnGy+GfSZQ+7E+wcwLe46LSCXsSZJRc4BcX/0xIE2t27vDq5dNOyfCFc84iIfu
	 2xLrSqxJd71Tk7QamU+X1swk0G/OCeoK0Qc6TGI2TaBuY7F6RMyFxLvbV29I3lZYIosUp
	 RCIoSIroDBX52SFQZGARB0iW6qrxj5xyPCYZyjQ/mAw7NyU4V6zJzN+LssufcE75SYpne
	 VASR0Tq9eTZ9nmSLaPKi/mje7heEXwX9pvc60eQGppACno8qyHl6zUr/sd+ihlnB09EKi
	 jryWpL1odccqacwkRQimV6aVSBBn/gJpKkaFHq2zVafapNMNQ9inE0XLhz99ddVv3gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wPCj80qf;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B3B606A32A
	for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 07:11:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83B3B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wPCj80qf
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36dbde64409so3310791eec.0
        for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 23:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795072297; x=1795677097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gmQfPdDmWKnrX0XAyqEsmKfub/wtBIoPuAXJa+FkKa4=;
        b=wPCj80qf9x3rLyBPMPfqrgXvK9D+G9LvILqDllIhziPB8CaHd1uFvjrd+4abRp+ttt
         03hjcPbsCEowG45QF1HyoeSVNXK/2AHhHcYXv+Ti7gubrWpRmwz1kGLF2QA8c6upWawJ
         8QpVF2zyJ2EUR8365OsHx1KxbneW0J/dffJanq7gYEYaPHr1rhoD0gfNLhhHkcICQg8o
         8GySWP8LKE6z1pMKY3Th75VANM1F8VcsNvP9F/gVb/DmJnnito3KoaOrpY9bx2zZ9gZJ
         xa4JjDV3XI84NGGgUq/izjO87zWuFl1xNCzRnKU+2XqbC4qJrBvEPd9cy24HkI6XQODx
         e1ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795072297; x=1795677097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gmQfPdDmWKnrX0XAyqEsmKfub/wtBIoPuAXJa+FkKa4=;
        b=J28ssqh5JDoslGfOxUgltGI1vQDqN3efK3Gkb7AolCmA0mOXAqmE89V40sxeAQOOL8
         tJEUDtgghRO3dKfndiEAgEljv+hhXvHZq9+fKVleYIVGK8l7JgaEH2sGvA73Ul574FiT
         nvCupZr502DAC1DGO72UyYrBEEb/KYf9vldMeYdPl6EuTcEHzm0GeNbTR5sV1S+yBngw
         ZG3t7kTat28if+czz1mQ1FZMH+O51YRBL27eJhkrFSQu/dfUSAvZl31UVmofzSGmZ+eS
         MdS6Mf4LnFJR6V3263PjFyRq25ARNwyJr1d/ht+9nR+ey9eUPfQgC3HgWRnM2RyYJFKr
         Sjow==
X-Forwarded-Encrypted: i=1; AL+hErE0XiaFn96rgiXAwoio3QbtaUATlg7XL5GCNhsnUbo3gqWin92HgSWBUX7+ryYDEGaSqTw5K9FXo06CPw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+uLnoaYloqrpslV/awYLL9cF6XHDJEh+6gra+x5r+uEo3oyw5P
	pZ3bwKowmsb2YkA4mB7ovwigaSJRSeoWDrMCCAd6XPJeHlm0gsbpQ69O
X-Gm-Gg: AZFdTZdRJjh2rOqNksMdlRg6ArdTKb++WtdrvK2O0zEojemY8SqSmXs+EdBhpSVY7bS
	kNrnsmTQcJx8NzOmKOAMh2CooIbHuxiOKdvz5EKw4/y9+T9rsTykFBktlhNSNPfD2qRa919jQjH
	NdkD5FO8XMWkYDQKEqqLvc3TWJG7FJNCoImgjS7g/nB6t6fhxHITYY2a5PO+KH8Z/3ZPUSG1dMF
	TVv5QT9gKEXDyPgwe8O9q5ymMICBLPFid/JXezj4tdEPKZn4dgZ2wb2gBlpCBYE8JCDMOtSbyq8
	pzJeIZw7L8Q9ALzomQ6l3D3ml4lwr5U9QTIib7aUAp7oq2zAUfDLZazVlyiX9PF3rYunvBFJtTR
	Kgb6AM3i54N9ZuvrlMg1h4K/EoK0WH+xwPLKvwdWEFUfy3WXtdjoqyUgcVEnt1ohoZImOVPqOUu
	di32GXXpWrHhqk043yvprM7DHdyMrKdWC6enKbJ3u63557zAWJFjM/VRXV+AFhabawy2Z/HLzBh
	UcRIO2uL6bvszgdCCJb78goHuSJJU7ClMSb7iO+j/4RnMOLEU2rIYVyrmsNbqX9oK+JBMveNXTG
	3S+nOe1XW7RniOJTp4tfjPIMopsKJnq4Wn0/7dMU2MSN3CRuqfm+
X-Received: by 2002:a05:7300:f795:b0:376:2ddd:2ab1 with SMTP id 5a478bee46e88-3827d52c221mr4384828eec.4.1795072297425;
        Wed, 18 Nov 2026 23:11:37 -0800 (PST)
Received: from localhost.localdomain ([103.149.158.188])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a4522829sm14627902eec.1.2026.11.18.23.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 23:11:37 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: lars@metafoo.de,
	perex@perex.cz,
	tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH] ALSA: dmaengine: Check DMA submission errors
Date: Thu, 19 Nov 2026 07:10:43 +0000
Message-ID: <20261119071043.2943-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The dmaengine_pcm_prepare_and_submit() function does not check
the return value of dmaengine_submit().

dmaengine_submit() can return a negative DMA cookie if the
submission fails. However, the function currently returns
success unconditionally.

This makes the PCM trigger path believe that DMA has been
successfully submitted, even when the submission has failed.

Use dma_submit_error() to check the returned DMA cookie and
propagate the error to the caller.

This ensures that DMA submission failures are properly
reported instead of allowing the PCM stream to continue
as if the DMA transfer had started successfully.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 sound/core/pcm_dmaengine.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/core/pcm_dmaengine.c b/sound/core/pcm_dmaengine.c
index 1306b04be171..5b9fdad4d9a4 100644
--- a/sound/core/pcm_dmaengine.c
+++ b/sound/core/pcm_dmaengine.c
@@ -154,6 +154,7 @@ static int dmaengine_pcm_prepare_and_submit(struct snd_pcm_substream *substream)
 	struct dma_async_tx_descriptor *desc;
 	enum dma_transfer_direction direction;
 	unsigned long flags = DMA_CTRL_ACK;
+	int ret;
 
 	direction = snd_pcm_substream_to_dma_direction(substream);
 
@@ -172,6 +173,9 @@ static int dmaengine_pcm_prepare_and_submit(struct snd_pcm_substream *substream)
 	desc->callback = dmaengine_pcm_dma_complete;
 	desc->callback_param = substream;
 	prtd->cookie = dmaengine_submit(desc);
+	ret = dma_submit_error(prtd->cookie);
+	if (ret)
+		return ret;
 
 	return 0;
 }
-- 
2.55.0

