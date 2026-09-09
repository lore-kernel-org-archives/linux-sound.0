Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D491B67E
	for <linux-sound@vger.kernel.org>; Wed,  9 Sep 2026 20:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788986470; cv=none; b=HbgS3QIRvs+9aSscMSusFMk//Gbn1Pd8EaRdYF61QbdCMODuPNHal9HDlcOINw/b0U7YABl/yVC0rT35h/jZbd5dvYEqWbnWa4LIr903OaBSEZp2yKGwHWGZqEbH2elNtjknbTE9JCKRLFQZh4+i1zpwERAHrd2giwrmZlp92nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788986470; c=relaxed/simple;
	bh=V5JXF9xuhHcB9bSbIAWL384a9RlhtX4vE2mq3dg4miE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oKlQneU57NgDi3t/69bX21QM+gfnnKtxWqpTdfyeZZ+sQ9J2MxAoATcLMAXIbNVXGUPvFq27TZTtEFArUM7tzwRp5QAqwIw6cFZs63eq6pXCoYxGH1oVq8S27CkWDAg+7JfRRqP8pL1KzXaZZKZT1tFqMvU7CqxW/ImnH5lmqmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pG/oRLv0; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pG/oRLv0"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49cf4f81d86so49364635e9.2
        for <linux-sound@vger.kernel.org>; Wed, 09 Sep 2026 13:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788986447; x=1789591247; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JaOoKXT3Y9f1LpI2jFHn6H2wS4bnhm1a37EU+be2Jqo=;
        b=pG/oRLv09HyJ+yh5FN+2Huz4YF3LonlYx7VKMqppu6f71I5/aVZVDxeLA4rNKKBxJ6
         aPcXWXTUtVFGx+dbxcULvKmlyBfyJNMuagKxttDBdlRoHQgTTfCCb8dyKOPE22isOirk
         OajnWBc8nN8gBQQFyY/Z0G9ugTB+HAmh60AyXlxS7kD42R+sU1SX+xLFmkWjHYxxAbzw
         YfARWC79Vri9L7iISxkwfFkeLzgPNTylNNj3fyHdDEiq4gymHAygPljyXtVqFznN8+Um
         R842lwYHJ6L7vUQBzvreKqSXgDtAdkdlnu7R9QzaIlylh3P+97q6zg17iHkCOxr2NJnk
         l70w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788986447; x=1789591247;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JaOoKXT3Y9f1LpI2jFHn6H2wS4bnhm1a37EU+be2Jqo=;
        b=ESMpX7Z5Ajrzv42wpWFJ4eEytHvt6sUL4LbtZdzFn+XkmvkyMLY0QEi6V/Vohrrznb
         qURmF6NKtnqGExxV+YbhPlARYD3phXWEM8y4BdtF0NH+w4JsqnHRxoF3GoDWmevirxE1
         JNOtl+Rh3VwVLHn+YNb1bJIOOqZ9q4mdFI98H8uqRM+mltcWgTyDrAz+ZPu3wVtPGbmg
         9Hv9tIIoCOMGrgbN2MuCVXsdtvtZ48F3CsfG0A5fbYZv5OVDuCetOM6c8/1vbzmjTJF9
         K+EU5bgBPyESOrGkbejUWnwdcvhWYvJrJbyEZmqrJC3olt03fI8dZSP79ODGa88eTuqu
         qRZg==
X-Forwarded-Encrypted: i=1; AKwUvBwx637syc82GTVkHlrjDrk9BzZiEnGv6ODwDe32Btt9js9L4UZS/MY/4gR25OYJvme1Vts/wQPVDNFSMg==@vger.kernel.org
X-Gm-Message-State: AFuF++kyOD9w5ecaHl8efnB4JUzfUrVDjw/RQkE3DyVUZa5AxGctwbX1
	Sd/i+xinMkfAfliydLLXp8TJzWE9bqW/dUMYmFOdibx+bCaNMDANXKCL
X-Gm-Gg: AYBFou0Sm3ljNEjlHUGKr2iycP/O8qif5IMtNJ3N58OAnPpX8Iaa56v4W3UWk3PehI0
	3vJPPk2Swcr16NJJzT2pstjwmOUUjWX+Eup7CRar9M+x0oNF6UBm7CuVJYgk0XMwoXGS0B9UbpA
	/u+9D/RLhQiC6EFQwAlTUa5kEEnX55C0wB06K3+QM/e2MBkCufYznRHW10M22JolUh2EqbSpr70
	Jlj1WoWh3pmcuVl5hyd0pQgqsfo4X1b73sF2pUQ5xeHgFvzfN+Q2i0U5R2uU/OcH/aMP7U8uxT8
	ML+pOzowBjMltHC9EBaIt0FwHMyyM7sXI7o58JTqgQoE2DQP32mnTFDoFI/OARPt76ka0/GwCI8
	rhNCLJw99I1+1L3weA1yLgvuAks6IbxbGSqjYDLQOEnspIIdjUQwUsM1gFSTVNPewZ96UZf7dCe
	MESNPAQDivwrFwZJ2kx+On74B3FBR4HCe+3rhRWcpK6RyToz5F/qWF67tR0VMvrYfpYYM2QtZ2g
	S2n4Tkx9+G1kIXJyacP0VNDa8fvwNGj/jLI/mXFyMJYzXXFk6NZBTqD5DZtxqBaURqUunXSDWO9
	SvY7u9spGUFus5Uz3BdHm1h7HfXG2LX7M0wP76K2H22MDhJ4Gw8PlokI49PzwKa3H8HanIIx4bj
	fBJFD5dR77in97jC9
X-Received: by 2002:a05:600c:4f43:b0:49c:fc6c:be0b with SMTP id 5b1f17b1804b1-49cffd457a4mr279515695e9.17.1788986446464;
        Wed, 09 Sep 2026 13:40:46 -0700 (PDT)
Received: from workstation ([85.186.165.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c437besm17171315e9.11.2026.09.09.13.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 13:40:46 -0700 (PDT)
From: =?UTF-8?q?=C8=98tefan=20Ghe=C8=9Bu?= <stefanghetu9@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Mark Brown <broonie@kernel.org>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	=?UTF-8?q?=C8=98tefan=20Ghe=C8=9Bu?= <stefanghetu9@gmail.com>
Subject: [PATCH] ASoC: SOF: Bound the panic filename print to its array size
Date: Wed,  9 Sep 2026 23:40:41 +0300
Message-ID: <20260909204042.46656-1-stefanghetu9@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

struct sof_ipc_panic_info carries the panic location as a fixed 32 byte
array, and include/sound/sof/trace.h documents that the "filename array
will not include null terminator if fully filled".

sof_print_oops_and_stack() prints it with an unbounded %s, so firmware
that fills all 32 bytes leaves printk() with no terminator to stop at
within the array. It continues into the adjacent linenum field and, if
that holds no zero byte either, past the end of the structure into the
caller's stack frame, since every IPC3 dbg_dump callback passes a stack
allocated struct sof_ipc_panic_info.

Use %.*s with SOF_TRACE_FILENAME_SIZE so the print honours the
documented bound.

Fixes: c16211d6226d ("ASoC: SOF: Add Sound Open Firmware driver core")
Signed-off-by: Ștefan Ghețu <stefanghetu9@gmail.com>
---
 sound/soc/sof/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index 2d394389c945..9b0850e87bf6 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -152,7 +152,8 @@ void sof_print_oops_and_stack(struct snd_sof_dev *sdev, const char *level,
 	dev_printk(level, sdev->dev, "trace point: %#010x\n", tracep_code);
 
 out:
-	dev_printk(level, sdev->dev, "panic at %s:%d\n", panic_info->filename,
+	dev_printk(level, sdev->dev, "panic at %.*s:%d\n",
+		   SOF_TRACE_FILENAME_SIZE, panic_info->filename,
 		   panic_info->linenum);
 	sof_oops(sdev, level, oops);
 	sof_stack(sdev, level, oops, stack, stack_words);
-- 
2.53.0

