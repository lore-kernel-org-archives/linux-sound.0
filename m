Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795561977;
	b=vlwFmJWDEYIl7z+MtV8bwLNmQ0oG8AGjPl+rpMwVDiUNGm/ahu2e4KanbreDj6tFRLLC
	 8gz8cAizj1pj9KN2Zmhmxa+4Dxl4SENJ+lcpqAqQ/CdH0599g0pX3zgmYHAh5SSFQ919X
	 MpS88z4e0CFQmqqf1se+k/pCm4OZ0PGbqR4d07FCS8JIRy+P4DQuD+F/xFlz5/GimVMaX
	 g+DlNzxia9KEDyTSCimdhuQm5OUNXljEDcc6s3iwWH77wb3j6HPUlQLrGMW3bqRcw8+j3
	 b6UMFaNafDk8mMNsyG+iVRLBzgdzQ7TuSJtvqTEwgSh8XQk9wERmQu4dMq9CY/qGUkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795561977;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Fu1JR9BwCRRgF7zql9PraHs0kE4B88Qxih1JN4hThMw=;
	b=e2eachZexf6KgZWfABFF9k/BTqFCp7yEP/+FHfxUJf6+afQWrcCbXctukDO7ywdXsLx5
	 5LlUsPjtcDGHWVU1MErcnsiBDQPI2hC6v3kSz8wvDvMPKFZwezgUx4zbR81XeTabxPDbg
	 /m5hfBPXgQxQlEJP3ZeEVjE4UQzjf33fJiF2Ay6A9BdVKsnvZWNY5jf8Jd7lbqnsNCU2w
	 MTsctsATPcxn+h6sEXh9jEY9AbHPu1sG7lNonLMyP6XzBCSmQVUVaEoOj5sOXTj/YuZ5d
	 KwytDqzgpN9paHfcCqtB0QZQZPFnXyu0YpWkPBZcHSs3PIJWClo8P/umKxYO7dqj8gA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CDLUc26G;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B21D606A323
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 23:12:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B21D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CDLUc26G
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so50116825e9.2
        for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 15:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795561976; x=1796166776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fu1JR9BwCRRgF7zql9PraHs0kE4B88Qxih1JN4hThMw=;
        b=CDLUc26GksTMAra0+lV+vKwcRDN6ljY0wmeG5ULKr75IFUdliDBmMUvTQ5ptYCjm4C
         Ob65/ciwKwLHwDt93tlPX6Xt9MXWQ4Fgz8uqWttdaHiFDF4tR0xG8R2fqmJAE1HVAVTB
         YHfafutWrQIV6voEBkN7o/M0hDGhQWwlNov6gaBE4Q113AGeBI3oxwoFjCkNDGWUcLIU
         Om+epPqmV/uL+s2P91VWAYAFE834Xg8u6iGCDDKBOYUayY9z4xmogM0cj3NlgW2DEDBU
         bunTWt1+qTSzE0dBX+y8qFn+jSobHP/76vNGiF0ilM3VRcVbsw0S57IcUQPRQ9kaFTL8
         ll9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795561976; x=1796166776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fu1JR9BwCRRgF7zql9PraHs0kE4B88Qxih1JN4hThMw=;
        b=cmCOhK5dS3f9Scb4CGLx8Hj7V2LqpqV1ZnrGn8MVNQ4avqNaqLex8OCEVFaEujr5zH
         ZYP6xbt3J+/2f8IRdeoPcEWUISq85snGXL3t42B06JWwBNcUslo1oDbANmKIfkY+Ak86
         GFelplMxIa//x+zHYBrbVqFIaZVYS1BCk9zH9LD6SEIflxli3b0GT7UYDcKvRwPVhIRw
         3vIw+l4Q8zK3aEwfVp80OFiltNQ6c9U8FdnGWEwiNYWm40HldVXeVK8xjYaPH044/qdH
         YFIHL/ffr0moHPTXaE7t5XaRe6YMiwAihByQYDK1ZuWRfysQ8FwE/kV6Zj+B3OY6YkFB
         ZIZg==
X-Forwarded-Encrypted: i=1; AL+hErGBRA+rr2mBu+xKs9HerszTyCof4hTLtoaF3n/thTZdXx8sCSp8uqt0w0SLOkIXDUla2Uut0DfAsuPMCQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z99XCYsA8UVbEO+GznPI8QmQxYXayBvoZo16IbqMVZO7e7Q+zG9
	ABRsw16RMhKs2hWMqT3VfscESK7bmekUROPAYgzCU0XeNux5pR9WvxhV
X-Gm-Gg: AZFdTZc4r+ll4qwLLf1Q3vNtGFBOX49p0M/bugLEHp/7dPuXd/RP87UGGZCuBN8VNty
	bc3MGbSueYczkDylJmgnfPUYZEu2x0CVl+kuchD1tQBzS7ehhCj7nMoQ7ct043UUrYd+04GELim
	ffYF8JBsLBTbhwfLsf03BK7ExeuAV+L4HvaKi1AfCELkA/0HNUsONLYV2aaqOfTM+Lp605Mp4jH
	zsj9AXi/ySU6bCY9pCLcsrusT7uPdewIxZivux/QPj4nX97ZzvkZ6xV6o+wB9rYN9pY5VGuR8qN
	rX2vznDkimtS7l5Dfa8Bclz+DbCLav2ffg+5QeXplxrVcATTw0z/4MM884xLuEO27CEfcpVZvEo
	UGB2Dg6GbX/p/ObRAyFh7vqQm1Y2fawlwehM6baVJpOP56Xh718sQ66SGWb2XhutyyMTCWRGwhE
	Xc8D3H8TLyay2Kw9jTJLERCOC2BUWlbTnX6jf9MNJ54lqs5IbN+r+HcPeqBfglW3VR4Y/Z7ony1
	iKjsiGKcviuGwKTznf4Xfy74SlBIjygTI87aPBcSFVG0xQRrieErFrt1KeoFeqlY15K4tuxdeUl
	eNiWmRgjPYVP0rbjoxrVuworfSQLY2zcCq8hJ7fyJ6ulb8RXYz+53cgRdELEUxlR2dC8S/QOlVG
	sidu94mVZbmv/N+Y2XFOxu1sM
X-Received: by 2002:a05:600c:3491:b0:4a2:c2b:a91b with SMTP id 5b1f17b1804b1-4bb8880014dmr336408085e9.10.1795561975632;
        Tue, 24 Nov 2026 15:12:55 -0800 (PST)
Received: from Ansuel-XPS24.localdomain ([87.13.246.159])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b3a7sm527766585e9.3.2026.11.24.15.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 15:12:55 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Cc: kernel test robot <lkp@intel.com>
Subject: [PATCH] ASoC: airoha: fix objtool warning with memif probe loop
Date: Wed, 25 Nov 2026 00:12:43 +0100
Message-ID: <20261124231245.271869-1-ansuelsmth@gmail.com>
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

Objtool produce a warning when clang is used as compiler. This was caused
by the memif probe loop when assigning the irq to the memif.

The warning is:
>> sound/soc/mediatek/an7581/snd-soc-an7581-afe.o: warning: objtool: an7581_afe_pcm_dev_probe(): unexpected end of section .text.an7581_afe_pcm_dev_probe

Fix this by giving a fixed upper bound for the loop for the memif as it
seems there are some problem with detecting the runtime value is hardcoded.

Fixes: 4974ffa0d6c2 ("ASoC: airoha: Add AFE driver for Airoha AN7581")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202611201414.1NBNxorL-lkp@intel.com/
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 sound/soc/mediatek/an7581/an7581-afe-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/an7581/an7581-afe-pcm.c b/sound/soc/mediatek/an7581/an7581-afe-pcm.c
index d47edb630452..b17d58f25d9e 100644
--- a/sound/soc/mediatek/an7581/an7581-afe-pcm.c
+++ b/sound/soc/mediatek/an7581/an7581-afe-pcm.c
@@ -447,7 +447,7 @@ static int an7581_afe_pcm_dev_probe(struct platform_device *pdev)
 		return irq_id;
 
 	/* init memif */
-	for (i = 0; i < afe->memif_size; i++) {
+	for (i = 0; i < AN7581_MEMIF_NUM; i++) {
 		int sel_irq = an7581_memif_irq_descs[i].irq;
 
 		afe->memif[i].data = &memif_data[i];
-- 
2.55.0

