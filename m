Received: from mail-dl1-f68.google.com (mail-dl1-f68.google.com [74.125.82.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3289A24B28
	for <linux-sound@vger.kernel.org>; Sat,  9 May 2026 02:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778292508; cv=none; b=tjqwWO9aNiCm2H8xPgvn1ABEdWptOfImgnBAmH7uKJMAEor7tcpT5qwyAgbVxuEE+Iyt7X9X8Ean217stOAL3ZHxY5hfUL1GqGt3LX1pvcl01orBc/3ZZAB10ohjBX+eLcaM8ZV0Hgel/x04KLefO0bpFSBVTF1GxrYhbw4vu2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778292508; c=relaxed/simple;
	bh=SU+hHyKOv1UwoAy5W/MYlY8U0fwS9OgvizqU7s+S1vM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MaIOmrefqkdULZnO+JFzP0g0nUlZ/eiiFvwsvMFjiMtexslHB+cPZgXprVM+E2efU7DQTPeNvG2AgFqmrEoJDn/o+sMX2n7oLTtwVKfhjwfBABKclI6g8VijxfvmjB5UIDdWmOSTkRbsBPVEuHBMVTt1rKrorE16Ph0Z227SM2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HMLe8EDF; arc=none smtp.client-ip=74.125.82.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HMLe8EDF"
Received: by mail-dl1-f68.google.com with SMTP id a92af1059eb24-13298f7e84eso1327817c88.0
        for <linux-sound@vger.kernel.org>; Fri, 08 May 2026 19:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778292505; x=1778897305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+bFJzQA8V6grxSKW5mpCmQoAxXzJUQzk3wcMN3B8fCY=;
        b=HMLe8EDF6M6PXnLNN+GnJSMrPyi++6jeE9feeHByf1C6KK6iTGV8aW26booz70YwP8
         LQBWKEZRuGtbFVDtuiifqOg6rP6+S95KxPKW1kC3g7Vr+CTQ9z15cNme6BPxmGo94Jmd
         0Hbj+HF8vE7woEcxWraj0/LfATzoC8A6uWlpakT5fh39WFHizDeXMJS4jdFXz6gHqLZc
         lkfQpqbAW+Ent7pWlwcEGZfcWcSt3i4IJ8/TI5yJH+txv/gfiFgygnNErJUiFvxEgM8B
         KNtcbor5GUpIaJOYVh2DdMvR15YowKEAYRj7h1LD/jyjnXCNaeUF8GKRqia7pTI6jML1
         P3JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778292505; x=1778897305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+bFJzQA8V6grxSKW5mpCmQoAxXzJUQzk3wcMN3B8fCY=;
        b=Vh5+KQVYRkjvauoJTXltd8zoodefmn+hb5X2/cMsERJCdDKn2vw3EeTtehq1OsHMKu
         GJPPlw42HyUbQhkht32WIN6fNBISwQ5ituI90ytGAWQ/a0AekLpVRWfWDCoE7FugcpvY
         0hc32ndAtNXjS4nq3v5LIc7TBD9DcGmbo3B9EfGkWABXb2Ury+zzfRZTmT7KiEsAjreR
         DcJWllvtURPfvgMTA+IH4nrSh6Dfl18uMw7vRswOuJNw7EmlGm6fKPx0vHyASxhMeg3g
         kbtK8CwCRWlHbXiOtsu+2LJqoO6cy5wVrVQjAkPDSY7M4daPvWW98lz2bFsHp0zlsaM1
         ZAWg==
X-Forwarded-Encrypted: i=1; AFNElJ/SjSfmp67UqdCKTsIX9a9KQRNWxV0ZWomGvG6p1USOd1XdBOc5N0M1uOC5Y7Ykm1vB/mFmIQDvyVtRfA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdhidEtfk1CKor27NFGMfYasXn5MKCCCaTdi3BRnI+eSaeTQD4
	RG6yYON4kNYJz8l9tA/MhkF3RyL34fhNVJY5oZV225hQR6Rb4nySnE5Q
X-Gm-Gg: Acq92OEfpGUmSxJI3iaRwhZT5RH0b5Bu1h0T4HKN9Ueu0uFWDgQP4tDgPyrN3fb6KkS
	d9IE0j+sBqulVbtcYtpnzErRjJyKIB6YY/9XWyott39+ROnJZSSMO/7HBTVcbW6C1zEebBPbVjn
	OBFGtYbnwWgb9ylkmW/j57Rpp2sW8fH511ojuLr5lCv2prQnPiv+qEPEiztpmAPG6MFHmSew+ZC
	cTPNYLwXKo7dUbrhGldsq1nA4M2jB4q5mlSAQDXK369KuvNCMfUcbN3p4hWGk817a9lHmTq8ale
	O5GYghtvH9pJ+qIXg5/Qew/1MWCaUJOHJJnb/kWVpwdjkm1YS6pOULcZKmkcLAv5HWYYNENMJnt
	RSo1Wf/R+WCZo7nJ/hPPx7pWr2I4Y38b/q93nEw5wrdhzqFdtRfM3E2l48cbGgCvPa3hMZJuqC9
	JoiXxnv/784SnAwVA8zzCyO4z5niChrCq2DHmCZeJAr4LFJ/56JLkQPNgEW2kVmnRSR5hjAz22g
	AM/l3xL1iD+Lms/6cLR5HiQUFLf+ePygbdV5D9PU1gxeG6feXCwULgQjTyxalTMvl0JqMuwo/Gm
	/9moxUOWtmYisUV+AQ==
X-Received: by 2002:a05:7301:e0b:b0:2e6:e504:5431 with SMTP id 5a478bee46e88-2f54cc681b9mr7932458eec.22.1778292505264;
        Fri, 08 May 2026 19:08:25 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88847502fsm5423080eec.14.2026.05.08.19.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 19:08:24 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-omap@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	stable@vger.kernel.org,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Grazvydas Ignotas <notasas@gmail.com>,
	"H. Nikolaus Schaller" <hns@goldelico.com>,
	Tony Lindgren <tony@atomide.com>
Subject: [PATCH] sound: soc: ti: omap3pandora: fix stale ARM machine ID check to use DT
Date: Fri,  8 May 2026 19:08:08 -0700
Message-ID: <20260509020809.33060-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The omap3pandora driver contains a check for the ARM machine ID via the
machine_is_omap3_pandora() macro. This check is incorrect because the
machine concerned now supports only FDT booting, which does not use
machine IDs, and therefore it will always fail. The legacy board file
for this machine was removed in commit 7fcf7e061edd ("ARM: OMAP2+:
Remove legacy booting support for Pandora"). To resolve this issue, use
of_machine_is_compatible() instead.

Fixes: b715da74deaf ("ARM: dts: omap3-pandora: add OMAP3530 600 MHz version")
Fixes: 9ccd0106c9db ("ARM: dts: omap3-pandora: add DM3730 1 GHz version")
Cc: stable@vger.kernel.org
Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 sound/soc/ti/omap3pandora.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/ti/omap3pandora.c b/sound/soc/ti/omap3pandora.c
index f11b1d8a1306..6c9c184cd9d6 100644
--- a/sound/soc/ti/omap3pandora.c
+++ b/sound/soc/ti/omap3pandora.c
@@ -11,12 +11,12 @@
 #include <linux/delay.h>
 #include <linux/regulator/consumer.h>
 #include <linux/module.h>
+#include <linux/of.h>
 
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/soc.h>
 
-#include <asm/mach-types.h>
 #include <linux/platform_data/asoc-ti-mcbsp.h>
 
 #include "omap-mcbsp.h"
@@ -225,7 +225,8 @@ static int __init omap3pandora_soc_init(void)
 {
 	int ret;
 
-	if (!machine_is_omap3_pandora())
+	if (!of_machine_is_compatible("openpandora,omap3-pandora-600mhz") &&
+		!of_machine_is_compatible("openpandora,omap3-pandora-1ghz"))
 		return -ENODEV;
 
 	pr_info("OMAP3 Pandora SoC init\n");
-- 
2.43.0

