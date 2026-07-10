Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F60407CF0
	for <linux-sound@vger.kernel.org>; Fri, 10 Jul 2026 10:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783678927; cv=none; b=IV7MDUHXPah8wfS7DEMe4euuvvhKjTnNnJRXVOP8BH+ZrRqLwUfhqup3rxn3fOS0fN5TM0I9ueAyeHS94LiSbLkRHnUjEdvwLou6zwaiuh4dPTVECeotojJrOwOrn35cMpHuni0TqHOrokJ/a2pnkhaaRN2CYluZTDi73uDqxsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783678927; c=relaxed/simple;
	bh=1FZVoSjzKMyVRnA+73pI8+UhFeytlac2ubKrBiaTzGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nCQMZPWQb02444Lshd+CVBTeQiOJrol7tmlCx8zji6ZI/hnw1Rzs6GJlZaBJ7HNsq62edAshykiLqZxBZ+PxBkiL0cN8YYEFXkpd5qXv3LNGKcsMh1ALOTB0ksfmfTFkV7XXD6IV1M/omWyPQ374Ukg0eXzE0ovrWCjXLcVfG6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XPpil9Cs; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XPpil9Cs"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so702373a91.2
        for <linux-sound@vger.kernel.org>; Fri, 10 Jul 2026 03:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783678926; x=1784283726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4RFOqWcsEwd6ePMQdZZ8QPUfPlo/GmYQwqUASim0itw=;
        b=XPpil9Csi1AwGks8HRKtC+TgroO0KPOlEAZWyrrzaO3oF2LRHvFnErRiR3iAy90o72
         b3QAwLBgBwOj9uocxs3bzDJ3skZLZPF5KTmbXbGeQj1P7yuaJ6H9BIbVK+OojaU6yLL7
         AbZ84dAC/f2ACv8RNpBEyqFve6S7sOC+iKBSznbqqfCrQ37wn2Ny0p8o7gr5WeSL/1mT
         xb+TOqJDntXLID29dmT9rinccz7+UzfURibFKSqyS1MKKdNs/ZCcb6jqg/+CXGYUkmBH
         oUN9uM7WxvqNG0jkhTVWWr+etR0L0GeqhxH3aXQBH2oDjMuK61feIBwWeTdGb2EN+6Pc
         CBrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783678926; x=1784283726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4RFOqWcsEwd6ePMQdZZ8QPUfPlo/GmYQwqUASim0itw=;
        b=CoiMSh9nZhsyjSp+9ucWb0zSgKtdDMSUU3F8ElhGulQgDFqp25v7Ck36I2Gtcyw36i
         FdNgyK2mmvZkkYaYqIyTuTkP6zP2ZaLIiRYSjPpzoiJCLrk3XyiUJwykhpVMhkzB4qXz
         HEZjqJsLkQ5CJ//yx7vEe0j/vD/hvsGvVMMYU2kNXcFCRqAvRJXP8Qh9aA81ltgi4GUr
         U8XoYLyYlSe6Z15duANbjM7wMQKxxW0VlArH+VE299KMaxqHHT85iPCnRB1JnmO7dgsl
         cXx5O6xKRKT2PC4JqacBG3XNTGSMf+2XDyxh6+DFpSUBPNXczpLWBlXa6SOZH/LZW/gw
         e3Cg==
X-Gm-Message-State: AOJu0Yxg7lrX1uCOqE7k+vdLTwwjxWrHgRnmSWVMdy8yxRdyDqUbNZYX
	O9agvn8Bc6+IMUL6i+b2TNEjVU44X3b6ct1lv0v4eCtzl/xfkH6lRgD4
X-Gm-Gg: AfdE7cmvD0Gy+woz7vhsxMh27TwEkcxhNB1MTyvJmgJxOblldn7dBIjFwrBnCKHW3FL
	awmfKvt2pezAdNDmgHLyIpaopqsXkSnr7kqL2M/yYEXFW/BDogHMya7kuS8R91M+kb5O8lkgZv8
	cuE98wYVqQtYWdICwOOBcvZdYFtiD6GfoMZ9gwZFioT2dlFVsOYxQI7KK4pX3YzJRDmirgI38KD
	DRCSoG53rORc67xlRRDS3/EXFDwIiYNiH8CL5Z9ZFsEGVdcVLnXm3Ipe7R6TkfVrlHFogiFmrxw
	922A+780ZoxcBO343cdOfa6TwQ+Mo7DjdHK2v5ydyEt6W/p4k8h6/BBBmfQXIOQeFx0kLsDVdLe
	tBVUYZbrYrh4ik7D4dtRS8JJDai3wOl5H4RtqlaIxMS68TnF+fNehkv6maqZzB4edV30TsQZ+F4
	8rX3oqNFaZtQrAX6Zq4HcckjJKsunnHQsx6Z2tT6qrh/P17kM=
X-Received: by 2002:a17:90b:2586:b0:387:e0db:bc30 with SMTP id 98e67ed59e1d1-38d6d1eb86cmr1754316a91.38.1783678925820;
        Fri, 10 Jul 2026 03:22:05 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a5516abffsm2490240a91.4.2026.07.10.03.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 03:22:05 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Michal Simek <michal.simek@amd.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 2/3] ASoC: xilinx: xlnx_spdif: Preserve devm_request_irq() error codes
Date: Fri, 10 Jul 2026 17:21:37 +0700
Message-ID: <20260710102138.29347-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710102138.29347-1-phucduc.bui@gmail.com>
References: <20260710102138.29347-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

devm_request_irq() can return various error codes, such as -EINVAL,
-ENOTCONN, -ENOMEM, -ENOSYS, and -EBUSY. However, the driver
overwrites all of them with -ENODEV, which hides the actual cause of
the failure.
Also, devm_request_irq() already reports failures internally, so the
additional dev_err() call is redundant.
Return the original error code and remove the duplicate error message.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/xilinx/xlnx_spdif.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/xilinx/xlnx_spdif.c b/sound/soc/xilinx/xlnx_spdif.c
index 017a64ab9f1e..deb7225c1b4b 100644
--- a/sound/soc/xilinx/xlnx_spdif.c
+++ b/sound/soc/xilinx/xlnx_spdif.c
@@ -274,10 +274,8 @@ static int xlnx_spdif_probe(struct platform_device *pdev)
 		ret = devm_request_irq(dev, ret,
 				       xlnx_spdifrx_irq_handler,
 				       0, "XLNX_SPDIF_RX", ctx);
-		if (ret) {
-			dev_err(dev, "spdif rx irq request failed\n");
-			return -ENODEV;
-		}
+		if (ret)
+			return ret;
 
 		init_waitqueue_head(&ctx->chsts_q);
 		dai_drv = &xlnx_spdif_rx_dai;
-- 
2.43.0

