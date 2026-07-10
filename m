Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718954071CB
	for <linux-sound@vger.kernel.org>; Fri, 10 Jul 2026 10:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783678918; cv=none; b=F90BpFa99doKwMSCsFIS/+IEtG4fgLerY5OZCvlOsuxuiISfL6fODm0UI2LbCwnShC4gNqIfG7VRz7AXxCmqpm/Psir4EbS8/WpGctM0n6W9stJpFOQA6oSLe8Ix/A+CjjAeYX/ps0Sc0Ryty/8ivDFaXS+ZISU5bgpstQfH7DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783678918; c=relaxed/simple;
	bh=DV+IjJm97lcQmwr63933Go28p3QIBLN1pP4lq0vJEgs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nhUU7WE7mLHqeCsKwOlgvgwN9IbnssfcqZwmb0s43s7nomkGhaOmIcozghRbDuOyXVB91OddO4vEnvyOYtG8N0PKFp8wakm0ZAyngNs0H0Zyq/KtJSD8SIDnxkP3tMZ53GJpadPyrclsDk6QouQWd/74OG9AlMCEmbkNGS7W07o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IOsH5ivl; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IOsH5ivl"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so702318a91.2
        for <linux-sound@vger.kernel.org>; Fri, 10 Jul 2026 03:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783678917; x=1784283717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TTtR6zb7RY5US4QxCqQbjVg6WYnuwA1xwAvwueuuMcQ=;
        b=IOsH5ivlOFzAs1TDfJMdwfuC/Kj2l6ZhuWEHhmfi1rahvudsgeJ9C8kuXPEM9skjYq
         gHE3aBxb3BuwXLyB5cfQWO3aiMQVSPGXM+o2RDQ2T/YgThKQ9aepe7Ycojz3wRtRZ60D
         hSZmcYYhcAm/GftAdrYPgQoipNFPyQATXUFt80MQlso1CgYSTLX6DuwJRldl4gATC4js
         oqJbaGJziIAMAI6r/R50KVmgrpTRMS7xPmReTkrnQZBCzYA++tCzseBpb3S0yGrAS8c5
         QMRAXC6KnofBRkBJS2O4bLKffJ0H7PMpyBrWH2QctQAUpXRrJZN1udMRSxImaRUtE6Ce
         ErXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783678917; x=1784283717;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TTtR6zb7RY5US4QxCqQbjVg6WYnuwA1xwAvwueuuMcQ=;
        b=O8c8jmsyjuOMsxUiuurt6+Td0DXdhzP5IdTEmD7Sw8nBCpjnWPc48869eJVITnbYfC
         hczrs+m8E7wlSxJ4TrTophOcyy66xQFMYY+vqFHzIaAyhziEVU0C7SbbKBzZA0mmaxDg
         FokZSZciijauIjm/De8eZAbx/qqFD8rLQak9S2adR8Gr2evAOrw58nR+S3AdlQxpKm9x
         baikzh8Q5ONQxobYlpNOMxhw1LGK+GY67+7wuLBUUC0butBSi6f6vxI1JhVb6T1xpog8
         CvFcG0PcEWajC2WaOciVRy9pwYpnJITnS7kdOcwMNGW2n/NqYnZqFGixiHbdjK56BcB0
         xRgA==
X-Gm-Message-State: AOJu0YwbKWOSqbGmZLYVGQHbtrACXJZ7HZv+DdPpF2TSM4t4OXaXWv0A
	RAvjICBCPuIvZP52u1uBlt5/xiIMzuUyzEEJWGKFRYIyY3i9E6cOZp2g
X-Gm-Gg: AfdE7cmrLaTey0eIVS9UP0tIjr/5n4lWcKjwtPqjiQ8kAZC+Fw0lvpgyhmzw8Dy888f
	xN8fd7Luzqpt/qc6aoUAPJYoOK6r1WEhQzkJ3QDNzyr33zolh/oLXZ0ax3aRWwUfphCf0Kn8RBb
	UcaRJC9DluWaW4E7Zo/IdgnfNXJNIUA4T+oTRd+dDuYSd1QRmbBtHam4NYNsBWQ30W4mVr3QF0K
	2COOPjexuzdj3TpC1h4N4Uoua8Is5iyliUU2XYGah1df8Ct0KfB9oQ7zk+ffuQeZW5KZPdX9rAY
	qFvr1SQ+Td9WNRxbuZwJKAxBLnl7fjAudlDUK+Hu/dbR1emRnJ9tpZkF1gBJ0Byt/oVLruGtCv4
	g2/XTPPtIC4V3emXT+nHeR4bhcLIw5UagfoLz5itDnxo7E4+sndGLStj1+9PPZLX42h9S6eoZAX
	2rVVqNelqyC2yPOPE0ojYsGVO0mn9jlxGdCEBy6BcSkRX1Xo4=
X-Received: by 2002:a17:90b:4d0c:b0:37f:9cdf:f038 with SMTP id 98e67ed59e1d1-389417e5081mr9744825a91.27.1783678916723;
        Fri, 10 Jul 2026 03:21:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a5516abffsm2490240a91.4.2026.07.10.03.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 03:21:56 -0700 (PDT)
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
Subject: [PATCH v2 0/3] ASoC: xilinx: xlnx_i2s: Use dev_err_probe() and drop redundant error handling
Date: Fri, 10 Jul 2026 17:21:35 +0700
Message-ID: <20260710102138.29347-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series cleans up error handling in the Xilinx ASoC drivers.
It replaces dev_err() followed by return with dev_err_probe() where
appropriate in probe paths, allowing deferred probe to be handled
correctly while simplifying the code.
It also removes redundant dev_err() calls after helper functions that
already report failures, avoiding duplicate error messages.

Changes in v2:
 - Split out a separate patch to preserve devm_request_irq() error codes.
 - Adjust line wrapping.
 - Add the Reviewed-by tag.

Best regards,
Phuc

bui duc phuc (3):
  ASoC: xilinx: xlnx_i2s: Use dev_err_probe() and drop redundant error
    handling
  ASoC: xilinx: xlnx_spdif: Preserve devm_request_irq() error codes
  ASoC: xilinx: xlnx_spdif: Use dev_err_probe() and drop redundant error
    handling

 sound/soc/xilinx/xlnx_i2s.c   | 18 +++++++-----------
 sound/soc/xilinx/xlnx_spdif.c | 31 +++++++++++--------------------
 2 files changed, 18 insertions(+), 31 deletions(-)

-- 
2.43.0

