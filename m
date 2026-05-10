Received: from mail-dl1-f66.google.com (mail-dl1-f66.google.com [74.125.82.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84D7242D6A
	for <linux-sound@vger.kernel.org>; Sun, 10 May 2026 22:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778451290; cv=none; b=C594lqhMJkhdTAdAc0fYsaYUX8nbGDhIN0tte3PxJFFblJai9lX0yCJUy2PdHuyGls9WKQJol51HZ915praHBugXIMQvU1z0n0JZt8K06VM06ktd0S4xQpB5t5DmeEPJkiaDzWGY02QaUB9OXeqkvCT0N2rCegiQKs8zUsQUPnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778451290; c=relaxed/simple;
	bh=G464R6s/mBSeUcIPVmW4ye2mTqta/myRZw7eM60lfPU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ooiBSQ+WcknMwBIPdDeMDwZig2xKh3pEfa+Px/EXwDT5DTfE/uNFJPGNheq6RkxeUyOtBnYEs3nMgHvBleHKwvOjhZ8TnYbNU43j4F0vhcg5jTdF2RIyPBUH4nOkcQ7BDW2k+hSZgfmr6eFjuHVdX8AcV7JEhd7MccC8aPRPje8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nuMBXE66; arc=none smtp.client-ip=74.125.82.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nuMBXE66"
Received: by mail-dl1-f66.google.com with SMTP id a92af1059eb24-12c1a170a50so4898623c88.0
        for <linux-sound@vger.kernel.org>; Sun, 10 May 2026 15:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778451288; x=1779056088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lcl4frxf/FI5DrvqAUcE9Gs8Beib+78XkFZmYtTA36w=;
        b=nuMBXE66UY+hkwLLkpLsPd2bSKhUtvF6QG63n4ySAuQA8mjqHVICjpXE7h6bZqneyG
         w7phBGJ2g8OEjI+2VP21Hyv2LhogGLXgEemFvuKIE0DuJogLy7LVeSeDerOExeTjvTXv
         8bbRTeQOMQz2I3szo32cRKvLtKNuaS34GGC63/JEoedisvBnUzmKQHV8xBneIOE5NJzl
         7PwgsFrhdnqGLwt3BT+e9njhiGMNEx5yypDIsfnsgrozpBx4kbKiEHD21U/SEUVot/sA
         6A2UrVfwsBzA76Z76nOIl8wL1ANFBSpQAwY5MPjy70rSW/vFqeQxKQ++9FGpfcbRpred
         O7YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778451288; x=1779056088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lcl4frxf/FI5DrvqAUcE9Gs8Beib+78XkFZmYtTA36w=;
        b=V5OpFhInFoIs1mXANcSOBVEqmDoojAgj4+j4QrKcxYcAtXqysG8pYWa1dluGcWeDVW
         71QTzVRkVrAVw+8LNZj2WPgBdL8pSR1miNweV/slVyTJT5q8uoiVh24M0VjIS/LqP6e0
         rnvF6DpBsDA5EK8or7x4ENvpvjZI0ZfJO1Tu57606I1X6kUPbF0OTYxiHbgqV7+sbuWO
         +nCg1igjk6nzZwuFRzZRyEBCNWF1tX8Yf/wQsWeVFt0OheiMGfq0WQKs4Fh6kgyUAHGj
         B62uYcbLmJYTTUmMFzt7eXidmGgwGmtQOMVLD5FRDE2E8ueKN2RepK+osV7A75ASagtk
         SzsA==
X-Gm-Message-State: AOJu0YySBEbDvvUGpTrf+Hfn3Gp3ySTg0qZJPAZgpye2DsHg74ueYLGs
	xDXABt/0CZwT7et0Pt7rBjeB549U6Uv63tqfcSlTJ8aXEKK/FdE4dftnANoCsFDxENw=
X-Gm-Gg: Acq92OHZY+DS3Ox+M2/8ax7GqYXpnecvvLJQ//ZRtq8JyfZJhvmkDcgt8svSmL3UKFg
	BqLMhepmvCyQvme6hL0SgfwnmopUtexunxMaNJiBLLbCz64UhHz/jRknsda8cu+Ud4Rvs0qdYDd
	WI7FS2TgKWtpkp/jibJ69zbqUqzp2465JdZJhfy0j9F/4a5ARG+bk7PQP70NH73GtUbijTQHksn
	a3VW5PzXcLfmlEt9qXB7I7WkMoKSWnWDCoB9UA1Gjq6r80XkiFDX47359Q5AF3cHDv9cP7WppBi
	K9XhFLh129pw+jTTkh9Afr6DJwBCM17pTqGRdEWyxV4daQAhKZ7wguvKBjKktjnLES3YZprww7F
	g/Hx0R3OeZ+JOo5+SAhyFmhMTTSTMdjBb7m8Pl4ZbFftLedfgR6qcG4Ro5BAnB+D1Xt89bXgc4r
	jFxb7gyt9CwNDXw4OFU3du6kF9AMO4qQSk1U4BegZ3At/GBep1RNJf+lh/AWfRvDnG6EvKAz3NN
	usNbHVlPfxd0++iNavneJ+aG0UyZ0m8BBVqaxq2AeLAlA1Naf3A0TTc7CynmMrV01Cw1FOV0FOZ
	B8TiVOXpumrfOavcfg==
X-Received: by 2002:a05:7022:61a:b0:12c:4928:e57e with SMTP id a92af1059eb24-1319cf55b08mr9800873c88.21.1778451287363;
        Sun, 10 May 2026 15:14:47 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8864c37basm10863380eec.13.2026.05.10.15.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 15:14:46 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2] ASoC: fsl: eukrea-tlv320: update board checks to use the DT
Date: Sun, 10 May 2026 15:14:00 -0700
Message-ID: <20260510221403.11283-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The eukrea-tlv320 driver contains checks for ARM machine IDs via
machine_is_*() macros. The boards concerned now support only FDT
booting, which does not use machine IDs, and therefore the code should
be updated to check the DT compatible property instead.
Non-DT booting support for these machines was removed in these
commits:
commit f2f55499942a ("ARM: imx: Remove eukrea_mbimxsd35 non-dt support")
commit 3877942b0c7f ("ARM: imx25: Remove eukrea mx25 board files")
commit 7c5deaf77526 ("ARM: i.MX: Remove mach-cpuimx27sd board file")
commit 8da4d6b2f798 ("ARM: mx51: Remove mach-cpuimx51sd board file")

The presence of these machine ID checks prevents the removal of
machine IDs no longer used by the kernel from arch/arm/tools/mach-types,
because the machine_is_*() macros are generated from mach-types. To
resolve this issue, use of_machine_is_compatible() instead.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
Changes in v2:
Remove unused <asm/mach-types.h> inclusion
Adjust commit message style to match subsystem

 sound/soc/fsl/eukrea-tlv320.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/fsl/eukrea-tlv320.c b/sound/soc/fsl/eukrea-tlv320.c
index 6be074ea0b3f..5bb31a5cdf23 100644
--- a/sound/soc/fsl/eukrea-tlv320.c
+++ b/sound/soc/fsl/eukrea-tlv320.c
@@ -19,7 +19,6 @@
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/soc.h>
-#include <asm/mach-types.h>
 
 #include "../codecs/tlv320aic23.h"
 #include "imx-ssi.h"
@@ -142,7 +141,7 @@ static int eukrea_tlv320_probe(struct platform_device *pdev)
 		eukrea_tlv320.name = "cpuimx-audio";
 	}
 
-	if (machine_is_eukrea_cpuimx27() ||
+	if (of_machine_is_compatible("eukrea,cpuimx27") ||
 	    (tmp_np = of_find_compatible_node(NULL, NULL, "fsl,imx21-audmux"))) {
 		imx_audmux_v1_configure_port(MX27_AUDMUX_HPCR1_SSI0,
 			IMX_AUDMUX_V1_PCR_SYN |
@@ -159,12 +158,12 @@ static int eukrea_tlv320_probe(struct platform_device *pdev)
 			IMX_AUDMUX_V1_PCR_RXDSEL(MX27_AUDMUX_HPCR1_SSI0)
 		);
 		of_node_put(tmp_np);
-	} else if (machine_is_eukrea_cpuimx25sd() ||
-		   machine_is_eukrea_cpuimx35sd() ||
-		   machine_is_eukrea_cpuimx51sd() ||
+	} else if (of_machine_is_compatible("eukrea,cpuimx25") ||
+		   of_machine_is_compatible("eukrea,cpuimx35") ||
+		   of_machine_is_compatible("eukrea,cpuimx51") ||
 		   (tmp_np = of_find_compatible_node(NULL, NULL, "fsl,imx31-audmux"))) {
 		if (!np)
-			ext_port = machine_is_eukrea_cpuimx25sd() ?
+			ext_port = of_machine_is_compatible("eukrea,cpuimx25") ?
 				4 : 3;
 
 		imx_audmux_v2_configure_port(int_port,
-- 
2.43.0

