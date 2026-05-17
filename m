Received: from mail-dy1-f194.google.com (mail-dy1-f194.google.com [74.125.82.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A9C327204
	for <linux-sound@vger.kernel.org>; Sun, 17 May 2026 02:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778985460; cv=none; b=boT19atABob4N7Li0vxd3vcAV+BQ28qyEnjghSR5FN48OzSUTlfID9ooNLdRC7wNgOdqt6m040c5nFa1LbrTS/KY54NmaXOY5i1kf0f4jeQ2AFHFKCmkcsGThFdmD5E6+8jgHEy/C4PkxO/w2XINtMxLRB8ztuWsE8HMjrtBXPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778985460; c=relaxed/simple;
	bh=nkr8/NF0Epi/NaFan8Kk2N3mFZHQBA8PazqHLbcxLsA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ivDGa8/hd0935QwXMf0YUlFDp4HGFt9rLHNT+m4E6qgtzXOhl2H6wt4Q5eUJdV1pF5anN9eApRZWOP6vmrj1VoGrO36eehhsZGjcL4JxejB56Um4RKnGKmRTfWfIWLzpf5xsbc6/eDF5sS0mY7/rDgY3wTr44D5dOTsNY+5pzCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZYWDxxbN; arc=none smtp.client-ip=74.125.82.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZYWDxxbN"
Received: by mail-dy1-f194.google.com with SMTP id 5a478bee46e88-2f7020a928eso1504663eec.1
        for <linux-sound@vger.kernel.org>; Sat, 16 May 2026 19:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778985457; x=1779590257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=64N9mxUmbn95xk3hRi+FhhFjawkaA9BLaMqdL0SOqL0=;
        b=ZYWDxxbNH78fpsHmWy4jfQP+Z7FN2qLNCL85kFGHbz9vy7cp9lagEwi1ucK4qrnKd8
         MZ3LwIBpjxkV9OVbo41buzWERVMupXHW/XE4SkBBmARTnVoXufwwegJDZQCzsl0+Ry8x
         +k602T7iT4LcoIuNhtaT1ODLPLHu00rSkfRR33TRXCELN+t7ivve2DTlylKpzxX6U1bM
         siOqcp0Om6FIG3Dnc9Swtub5ATUJ3Gs48dkS4dHybRFqxUF1IwnWRwxkYDfmu/gs2R+H
         FmGURDQCoK+YiHM5A13huCfJ/QfnlbZjG+heY2thShE4tSoqmv2VsK6FNZNVzA2hD0ul
         LxOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778985457; x=1779590257;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=64N9mxUmbn95xk3hRi+FhhFjawkaA9BLaMqdL0SOqL0=;
        b=jsY8k2IQWlMssIfG7CnAEveB1qh2aI77Ir1qWU7JtQrhxLovz3YyXMhB8kCmFYWRmg
         ifabjzk10QBq+AmiQ4YpxRb/+oF6fTK6NjzMXw/Cv8u+iXZDMZd+yYOAsq/vw2TbGkgz
         IqLQW6KfCgbL/xiaSJLZC8Jm0WC72D8i4RPklK2DPsFnYl0hmAHfAmom6lLw7jAu7M/Y
         xwqg3RtnIuTZQcsn5cLRWM18IIOZ4zM+pZ0dIAdnPZYMO3hD5k6bsFHd2KCokMXbtxfp
         FyssG3A3LG7WSgnS0iSyotVh+wUl5qMLPjeBhHugAqApeVcO30MHDp08BJrOuHXW4udP
         Hlvw==
X-Gm-Message-State: AOJu0Ywm2jF7rirc9sk/D7juTVXp2V7AKD6Isdo4klDGMCsWLewpGZ6A
	398ZXXCm75uqKTW7j4MhimPProoLLe+sPQ/suxgbZHaPeRGsHtSaeiyTpkKTnOcSubg=
X-Gm-Gg: Acq92OE9f+MxwJCsU89sOPabJ2WNiSTypBOHPbnUKWLwPc+8bdQl7QQABx3FEk2KJWx
	B/ISRqDFTnkWvJ9wNQe+/y/LW/AkxAZ6ODjSz283NRjv2aIB8g1K7fsVr/fW5Bqn+Y9ovlXnCzM
	ShT1dgzvDeXzpaJdKi0XxbqlEAdIoNpVfz8vyvM6bdZFlct35Cjbf6zQDJSOuyRQFjq5L3uLXNk
	QmixmHDGZk1xnJGzekGEIHmS15ogEVmsnrhZV7iGnVujlL+p+PI8Lmtd5EMoFjr34fMEKkCIjX7
	o3vlEB+mW4OoTQ/envjf237G+B/63doCSHUMRydQoHIWuLvV+TxLsoyJsK/HOxnn85F2TFix8cB
	mbZEGHyDFSp6zHF1XzMMc61IRuyMJytMVEDYqT9EK4Tl3pYoRcucd8gX08NmzDMPKXntDy/2nA0
	vI5Y6twi6+uleXxKf2YXOKHekLEdXUzxI3PC4eBruQ865lrYc5JQW6awtgvAHZnt2YQ7lSqTtNm
	wX/lg97m0Gi2orNMpOsziyk+SDEtsNn/0ajfNrG8rkv96OtgXGjS3KE6Zt0lAlUTXJONcwxo6Q6
	j6d+8t1QFbnZQmurB8VuM7yIdqhd
X-Received: by 2002:a05:7300:5708:b0:2c7:3a7:c792 with SMTP id 5a478bee46e88-3039867717emr4432185eec.20.1778985457292;
        Sat, 16 May 2026 19:37:37 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302978b1a79sm10850097eec.28.2026.05.16.19.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 19:37:37 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-sound@vger.kernel.org,
	linux-omap@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v3] ASoC: ti: omap3pandora: update board check to use DT compatible
Date: Sat, 16 May 2026 19:37:22 -0700
Message-ID: <20260517023723.92731-3-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The omap3pandora driver contains a check for the ARM machine ID via the
machine_is_omap3_pandora() macro. The board concerned now supports
only FDT booting, which does not use machine IDs, and therefore the
code should be updated to check the DT compatible property instead. The
legacy board file for this machine was removed in commit 7fcf7e061edd
("ARM: OMAP2+: Remove legacy booting support for Pandora").
The presence of this machine ID check prevents the removal of machine
IDs no longer used by the kernel from arch/arm/tools/mach-types,
because the machine_is_*() macros are generated from mach-types. To
resolve this issue, use of_machine_is_compatible() instead.

Acked-by: Jarkko Nikula <jarkko.nikula@bitmer.com> # v2
Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
Changes from v1: Fix mistake in commit message and remove Fixes tags -
machine ID checks still work with DT booting if the bootloader passes
the ID
Changes from v2: Correct changelog formatting (there were two ---
sections in v2)

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

