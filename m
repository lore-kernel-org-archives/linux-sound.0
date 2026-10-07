Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD9239CCFE
	for <linux-sound@vger.kernel.org>; Wed,  7 Oct 2026 19:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791401624; cv=none; b=lZxNQEDFQKNtxsyIcCNLvj8rOuYMofHhmzCb80PUGpM25t4jGbL69qN8mqTzd1bIGkFFSb0TGSZkAYwdzNUdIzvgq0n3bgam9nnZgHtMrt5qvP1JrMqlBYFOFRrSNuKcvzmQcsTuuz9Qd5LLW9LYO4fw66+RbPKzEpmHAZAlAgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791401624; c=relaxed/simple;
	bh=zvG0AcLHm3S6xLDDAlwG5qp12elfTSdVRrVLvyddeZE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JQ/LblnVXa1EIC8Bly4YmWAfmttj4h5ORpWmzZlNkncQSLQAHhct7vuc8s+GBIGZsx7H6sK2AxPFv3a3AB/pDaXcDZCWTx6Xwp6AaLVWWI1EL+pTIg6L8ouv4H+mRtTa4gnGZn6habehIh57szL1AiBxUUzWmeoGdtZ/p+zHnZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pRQ2o7PM; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pRQ2o7PM"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a17f65ab8bso7556725e9.1
        for <linux-sound@vger.kernel.org>; Wed, 07 Oct 2026 12:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791401622; x=1792006422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HtWe9hd0RKevyGWq3yzE4CGMfhYNg0L6UN+xscZ5jJc=;
        b=pRQ2o7PMNDwfXd/Oqt4X4AJWOezA30hupSSavox9Bx/bGYLYljKj4rA37/G7z4iNZd
         qlcsMZkKEjt4VA71zEvPz+JVKe5xtNoiCBUVF5l/rfsmQL9SJwOn/KvwfYjY9ElHBqG5
         dvjK10SK6q0ks/XecgdmQfN2/JeXdx9V+PmFhTYzw/dBztO+917nN4wtEN7a/RdyXS1j
         AhmNFzOcYLFln+VYN2qeXxvngwh8dZTCxsGTFnfa6MjhO3Hml5Pf9lzgeFO0sCkcpbHu
         9zSLp8EhK2ION6WnrPFaxO/wdmoNQ5xZiA7VgSj13Tz1/2G7IU5gmlNVFu6+wq9lRqk6
         tdlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791401622; x=1792006422;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HtWe9hd0RKevyGWq3yzE4CGMfhYNg0L6UN+xscZ5jJc=;
        b=XTmsjAfBFjU641W1aG9Gqvcgu6RPDLE0AStQ31/qogJsUrtVs+ceP9zZOlvMV5nhfw
         IR0zaPX+GCz5C7Z5V1FMERZXkrFIrjv/prwiHCZoWgxAN6sGz48TkCnkyiTmTjS5qGx+
         Vggb5+SEDuNdnvYFfUiTKgwXh0q0ZzVBMDrDqT6YTSvlJN0HeuPl2KsJAhVETmW4CfMJ
         dT+bneCW9eCLi2gQZoXB1ertuJ/m91eYnNWW7rw+eEC6+U1GWXt8DYsOw8HFCnxoRnM5
         ieDJYaxLZKw8Grt3foEYcEKHDZKuixRIH2oWngI6hFhsr6I83ntA8Q96b8jcivufY7yY
         PLAA==
X-Forwarded-Encrypted: i=1; AKwUvBypoPJJw6HE3ynwqdKTTjXzGmxmE6Qx3GBEQODU8nEJbl+urziTwHbFJ2rINrKWDP+pU2flMgkmEGqqaw==@vger.kernel.org
X-Gm-Message-State: AFuF++n7U6cxkoY+aAvy7p70weJ3NO274Oe8F4l7SWC0VPyklhRlG0P+
	4HJ9yWA+tEGhOpdC3t06a9m5y4DygJKjYfkdnxwCvWTRG/9PRz30kONG
X-Gm-Gg: AYBFou0UsTwcDtPb3MjXAaiN/2Hs+XKa9IQMywldtAMYu69WqTTptpspumvKhkfxbUC
	zfHuPFG2i2suXOV71BkN7muHLIeO/F7vvfcMZBmnmJ7I0qM/LI4RKvM/7ar8EbotPfQ3/B9dPxr
	cNmgG8/FG/b5P2RwVwTf2GcnCdhNaTF0wub0Y4lowT+DVjzd2aLi4E82DnX+hMOKIuHKxIywlIb
	LHpcnb52Or9xRPSSeglWpscuL0KormJUbJDU5nUhxsYc05fbFLHXaBs65LPp4t5z8dBKRT0mon1
	K9zDFvw2Cn3ywtBlmwW+ph7h9AgnUKv2mvwp0M5jeLcWjHidtcu2yd5kY/1hyF8ek7qPBrnAA45
	Wv2ev/YEEldJCSYkSitzAiYh04buwfpeCDS4A31vGO68llWkWTaEr5Tq8fu/zsBVpZUPQ+46ROl
	Z1+e4sDKX21KYJgJ27n7R9BnjePLgElC/jj17zQNBmdgD9vV5YS60RmiUiELfeRMNd7MktlqYMU
	3eHw/9LIjqVEOTBg8vI
X-Received: by 2002:a05:600c:154c:b0:49c:fed6:cd3f with SMTP id 5b1f17b1804b1-4a18043c080mr60892295e9.23.1791401621545;
        Wed, 07 Oct 2026 12:33:41 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.178])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1843b5a2esm12427595e9.11.2026.10.07.12.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 12:33:41 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Oleg Keri <okerixx@gmail.com>
Subject: [PATCH] soundwire: qcom: wait for the interrupt thread before gating the clock
Date: Wed,  7 Oct 2026 21:33:32 +0200
Message-ID: <20261007193332.5270-1-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A broadcast write returns as soon as the interrupt thread signals
SPECIAL_CMD_ID_FINISHED, while the thread still has to clear and re-read
the interrupt status. swrm_runtime_suspend() gates hclk right after the
ClockStopNow broadcast, so those accesses race against the clock being
removed; on x1e80100 and glymur hclk is the SoundWire clock itself. The
next clock-stop exit then fails at random: bus clash, parity errors
reported by the peripherals or AUTO_ENUM_FAILED, each leaving one side of
the speakers detached until reboot.

Wait for the interrupt thread to finish before gating the clock.

Fixes: 74e79da9fd46 ("soundwire: qcom: add runtime pm support")
Signed-off-by: Oleg Keri <okerixx@gmail.com>
---
 drivers/soundwire/qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 6e0c5fb10efa..76f940f4eb31 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1887,6 +1887,7 @@ static int __maybe_unused swrm_runtime_suspend(struct device *dev)
 		}
 	}
 
+	synchronize_irq(ctrl->irq);
 	clk_disable_unprepare(ctrl->hclk);
 
 	usleep_range(300, 305);
-- 
2.55.0

