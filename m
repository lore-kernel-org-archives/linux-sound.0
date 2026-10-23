Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792751321;
	b=SOHwcueSji7JlTp2RYxGw0ZHrlQabuxIHMHmBPT9lWCbIiONPzFBn4ktxdkEllgZEHqa
	 JNxep2IYzzc8RDYnEL+Tfd1nK41DydMfIKzLEi/DGbFPDvH3U5JqnvuySZd1ufHfSdgU8
	 tUwlm9sF3+jRhpDus7sYDGN9Pw/xek3K4vYBdv8yhkPXFFRnIaRIUemJZl3iNOCzm5JNs
	 KW1PsrYx/ml+I3HRQB8oQvZK+7QC8VqC3EQk1/vddgGkJnITkRWV9+12aNo53YNxgNOhs
	 +q1STL2ZTH7LYw/3vuqPy0ktzeMKR8Mwm4JdJRfJpVOLFof0EzVQDQmwl58J+8lSIVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792751321;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZSiqZT2td7X8PBpUFev+SBKmb9LVtdkGi5NisJg23+o=;
	b=O/rmWFaK71bfIQ4PjK4GOzlE/MX58CY4UPeuQJCjVOPeQdPLFzvfmFtpxzkZPyUNULnj
	 +R3Z/KkcBfq9Lh0OZrUjYwFj62Vojj3y7X0Xwa0gv6erecczef3Fkl+3mw4XhhHMTygGt
	 6+8U9XzRkAm2QvPBUrHee+k+gd0U/JiXce7XMqhXWSjZ+S/3fTHTPtOIjlzQt3aF3Lw7z
	 Li2BVGtmlC5ugTDcqAHPqc8cnfJwTFFVxA1AY4jOXPGtGXsOS9m9lE5GxEYFxN/ejLxW7
	 sISF8Mx5qJMOSK5dZ2fAxIqTuYBQ7rb4czkyR1faNA+1eIrG8h9d3HKCXRcKwHeSGYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=H9aJsCpt;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BED2606A322
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 10:28:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BED2606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=H9aJsCpt
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc758830601so482382a12.2
        for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 03:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792751319; x=1793356119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZSiqZT2td7X8PBpUFev+SBKmb9LVtdkGi5NisJg23+o=;
        b=H9aJsCpta1HcQMZyGsva9k65fBRiHIKNlWEtbpeJxhwa1ZwRrWlWH1EXNdkvmkVbAP
         8kykDM54MThG3owuPigfW2euoL0Mx2fqraJAgvBSTTrG7FAyPGlSciggdpFLRnTlN3yw
         cKb/w8bFvr6OFrGBm7rs6UW1wAWVkhpXNK+el3cgNY0u9I6hf+7dU0rUy5/uUhEFNAA+
         0r56WZmYhQ5L3hpDAlvN11nv//HstzvuWW6jgrXQyL72HVXm3I9vIL2Ze5lJghZ+So28
         8GcOMZ2fnyiiEgImBSD43bPoqqAjjJYl0QSTOmkarkGNJOHogU/g7awtqDc/RrzkOeHN
         rt7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792751319; x=1793356119;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZSiqZT2td7X8PBpUFev+SBKmb9LVtdkGi5NisJg23+o=;
        b=PqNQZY5+8FKAfm6T8i2sJeLgtP/jWxyds/Xexo3euaHfoRDMPprFjL49IR3vWEh8P1
         iHGz4hmIRctua80WXpY1uAqRGJ7UGOanzDPSeU+46MOQMTcymY71gxPiDPwRRBkD07vc
         IsA+q7Ns3xMkqzkRAOaO18rdNz5PjZDpd4P3abtTrhJh7QABXxJLCTneZjPm7TFX4mMg
         28l2ybXcgssFA8i0AvQGZwgey0S0onaf4jK0rofjIh/7GGPFKgTIYfa3SLIVZNlISeu7
         G13mGoNR+/DR+07kZNmha8DpbBdjQIshHRQrYoCGvYy9PL6H9pYqgHuJoViry+3tkk/7
         fBhw==
X-Forwarded-Encrypted: i=1; AKwUvBwKPIUOEeUYxlyndLMs1aKEguFclZQx3W7O8mSm1Ov7T0O8q38fQWTs9XHheFbd1LPuE9BXZ4/xyt8gQQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLJIRWk9Tj+LqsmMsBltY/Y51U7g8SV1agWiGyYpfXLReji0VF1
	ifQXr9IKeVxh9MLoY4bOBsoR1Vjz1M0CZGCH+apdULof1kSgXPF/7NyX
X-Gm-Gg: AYBFou3PmasfJu8bFOAF+3+ah9xEGbXl3jUltF67bbtF4HKWzrfIW9PE9I8FC3wGcRF
	o7jq8tCh9dm5Ddf7gP1X5CtX9epHiiih7U/3Odr2FczIK0LoeZ7EUqOsWif6T/mopldcYV/m0Fe
	cdxqMfi4yBJwS+6lIZwXHeez2IhqhTEQNi9I+PAGFKOFXtpueW24wZdLYIOosKzIromw/8T0JsF
	1zjydgsCFqgT0vnd1zGT2zJJnhgrlToj4ux78mJmJF+o1QWE3tHusTqNvWQWaaZqD17xbNT179Y
	wF9vnBDq/GauZY/AXs9QKNHogneAJCpqt5u5H3YtLAe+Z2Vtxsp9wUHXTBQHC15CBQ17+aVwSYW
	JhDaFDhoFbB7vW1La16DNvcFxLVqC4dGWBlYK0IDVoFecD+lKwgSvfESjNgwC4Y5Zj88KUcbeS8
	5sE4Yr3hXL6MEcWVoBCwmsohn+bmGg4gPDUmgz5HGGlk462PA9MQmjmZ6+0e/ZImg3g7QWfwix7
	45vOnqTwH9o4MWuxsyunjJDXKqhpo3r8WbrpLX+xmF3r6FkRzKoPtbqmghniYXAB4kQniiW6wc3
	3IP7q8zgwqZw4Fh0t4Z+ZXZE2bkTIP+yln96UJsAExuf+i5kzF3T+juZr0wIcDJtcLFV7nl8Jww
	yea91FyI7npQ5C04K
X-Received: by 2002:a17:90b:3c0a:b0:3a8:bd51:205b with SMTP id 98e67ed59e1d1-3adce0cbffcmr1612715a91.37.1792751319402;
        Fri, 23 Oct 2026 03:28:39 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3add263384dsm1074082a91.1.2026.10.23.03.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:28:38 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Michal Simek <michal.simek@amd.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Maruthi Srinivas Bayyavarapu <maruthi.srinivas.bayyavarapu@xilinx.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] ASoC: xilinx: formatter_pcm: Fix read-modify-write of AUD_CTRL in hw_params
Date: Fri, 23 Oct 2026 17:28:18 +0700
Message-ID: <20261023102818.523331-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: bui duc phuc <phucduc.bui@gmail.com>

xlnx_formatter_pcm_hw_params() does a read-modify-write on XLNX_AUD_CTRL
but only ORs in the new data width and active channel values without
clearing the old ones. If hw_params is called more than once on an
open stream, these fields may retain bits from the previous configuration,
resulting in an incorrect sample width or channel count.

Clear both fields before writing the new values, and use FIELD_PREP() so
the values cannot spill into neighbouring bits.

Fixes: 6f6c3c36f091 ("ASoC: xlnx: add pcm formatter platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Compile-tested only.

The field masks follow the Control register layout in the Audio Formatter product guide (PG330).
https://docs.amd.com/r/en-US/pg330-audio-formatter/S2MM-Control-Register-0x10

 sound/soc/xilinx/xlnx_formatter_pcm.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/sound/soc/xilinx/xlnx_formatter_pcm.c b/sound/soc/xilinx/xlnx_formatter_pcm.c
index 304220d9aaf5..781508aef885 100644
--- a/sound/soc/xilinx/xlnx_formatter_pcm.c
+++ b/sound/soc/xilinx/xlnx_formatter_pcm.c
@@ -6,6 +6,7 @@
 //
 // Author: Maruthi Srinivas Bayyavarapu <maruthis@xilinx.com>
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/io.h>
 #include <linux/module.h>
@@ -55,8 +56,8 @@
 #define CFG_S2MM_XFER_SHIFT	29
 #define CFG_S2MM_PKG_MASK	BIT(28)
 
-#define AUD_CTRL_DATA_WIDTH_SHIFT	16
-#define AUD_CTRL_ACTIVE_CH_SHIFT	19
+#define AUD_CTRL_DATA_WIDTH_MASK	GENMASK(18, 16)
+#define AUD_CTRL_ACTIVE_CH_MASK		GENMASK(22, 19)
 #define PERIOD_CFG_PERIODS_SHIFT	16
 
 #define PERIODS_MIN		2
@@ -506,28 +507,29 @@ static int xlnx_formatter_pcm_hw_params(struct snd_soc_component *component,
 	writel(high, stream_data->mmio + XLNX_AUD_BUFF_ADDR_MSB);
 
 	val = readl(stream_data->mmio + XLNX_AUD_CTRL);
+	val &= ~(AUD_CTRL_DATA_WIDTH_MASK | AUD_CTRL_ACTIVE_CH_MASK);
 	bits_per_sample = params_width(params);
 	switch (bits_per_sample) {
 	case 8:
-		val |= (BIT_DEPTH_8 << AUD_CTRL_DATA_WIDTH_SHIFT);
+		val |= FIELD_PREP(AUD_CTRL_DATA_WIDTH_MASK, BIT_DEPTH_8);
 		break;
 	case 16:
-		val |= (BIT_DEPTH_16 << AUD_CTRL_DATA_WIDTH_SHIFT);
+		val |= FIELD_PREP(AUD_CTRL_DATA_WIDTH_MASK, BIT_DEPTH_16);
 		break;
 	case 20:
-		val |= (BIT_DEPTH_20 << AUD_CTRL_DATA_WIDTH_SHIFT);
+		val |= FIELD_PREP(AUD_CTRL_DATA_WIDTH_MASK, BIT_DEPTH_20);
 		break;
 	case 24:
-		val |= (BIT_DEPTH_24 << AUD_CTRL_DATA_WIDTH_SHIFT);
+		val |= FIELD_PREP(AUD_CTRL_DATA_WIDTH_MASK, BIT_DEPTH_24);
 		break;
 	case 32:
-		val |= (BIT_DEPTH_32 << AUD_CTRL_DATA_WIDTH_SHIFT);
+		val |= FIELD_PREP(AUD_CTRL_DATA_WIDTH_MASK, BIT_DEPTH_32);
 		break;
 	default:
 		return -EINVAL;
 	}
 
-	val |= active_ch << AUD_CTRL_ACTIVE_CH_SHIFT;
+	val |= FIELD_PREP(AUD_CTRL_ACTIVE_CH_MASK, active_ch);
 	writel(val, stream_data->mmio + XLNX_AUD_CTRL);
 
 	val = (params_periods(params) << PERIOD_CFG_PERIODS_SHIFT)
-- 
2.43.0

