Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1353242AB
	for <linux-sound@vger.kernel.org>; Fri, 21 Aug 2026 17:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787334858; cv=none; b=KGsCtz8k7oCwupr0jX+SqV+wmlI4nPijYARTCmS7W/8LHE20MOeCDcspjMbNGFGT91+SX1wFnignfvahyar9a/xzwf5PycORP5cWNUWQf31gpSMcfu6IyDXKycbUjjjMP1Txm5VmWL3utA+Ttx9mUn/zfxeLLmt58oUjYhLU22w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787334858; c=relaxed/simple;
	bh=8X1GIelRlwMVT1b6kK2fHbAl4zebrX9jZlLh1vijF+4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qkKkqpDrZDtK1o9Qt2sKFCMITfthH0Pt1rhKmQ/QJdN3CJucgxbSPLetOpjevdAxNvSGRk2at0PgpXwOwJrmJcx5YEaqYXF/jpUPaCXMAPnYhsRMs74ZAcr5Ai1t+pHfxO6a5EWzntn1umWhHCNGXyAE6cFbkFYMWdGZilKYTIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kDjC0Zd9; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kDjC0Zd9"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-499ac87c92bso10978965e9.1
        for <linux-sound@vger.kernel.org>; Fri, 21 Aug 2026 10:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787334855; x=1787939655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ufp93g/WVZepzkSmC3OnPpJHI4gG+vWqX+/ZiAHgneU=;
        b=kDjC0Zd9YFk1LejbEaj5kLjcDloDfai/rAIQPlxU5bp2AHeXWzbThu6cGITloCZ35T
         4l+zDBjZOT0tH7ZG7jFqi6VWMz+6avo+Fob8BP4JsvBZhHIqLOQJf4QJYunfUrwGBwOo
         Jco7MkLDZXv1eNngbwsPtt3QpF1ukHoGM8EkBfthj7XTGdbRbRhLdovMoP/mb8YW4tic
         zsPsYHF8VDwCyt8Xj9XObyRLS8FJhkob9rmRyb0mEvYsi4ClaTrps7DV4PJZ8TfipAhJ
         E4tHI6t/4dRrPv7ZzuAccgBSYTHT75LtAp99GFLtvBZ8BIE2uluihxe58dTV9laImJLh
         C7Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787334855; x=1787939655;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ufp93g/WVZepzkSmC3OnPpJHI4gG+vWqX+/ZiAHgneU=;
        b=ffBWBgkU3DXmi/5QjhQ7PIIJofzrhVTzfAaIsoXXbsymvnwFAs9F8jfr9HpyVZpL+f
         7lVpWzcSALAm+KPguvWs/WKgvp8tnHHhKfA63h/CCG51uZODPEhVZ0LdGDLChYWn1Tj5
         2t+ZkJem5PcAK8IN1CAXBeo2ObLNlLb0dYLC6Q5mXwsctcTF5fmDzTIpyGWPmddZM+70
         vc74eCRdSyPxFRS0VX/cFKoAagAEH1sxcuq+NmJ0XeBYhHS1nlFw5IcBVbOB1MF2shnA
         NCA8X87/jxdrXsDQn4AYkBQCib8LsCiN0yzgc9uWIiZkExUPkfInKHfCAr4r8XXmEgl6
         I3iQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq3HwE6hxtsbF9fD81heJHx4a/k1sqEVpnlqFnZ7eN5G408nITTYBrTCwK9xCM6MCWnNUpWGzqP0QbjCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmJYVZ6efr1rMYxdVuW2R/9LpBIAC9MIWwbztbrJ4gYBalEEK7
	LEWaOy2LKdEZ5y/SuikIcQvcE4t+h3g64AOjsSLkYcZW/qYes8OUt5u/
X-Gm-Gg: AR+sD10avWV/JatJQ4/W+sAbtTJJn51Wd01UPVGOW+nMVjTypMMMpsXNQxXOadh8Do3
	KzIO4d3s08chbpBoBvVdN3ZEo50WtU3pKYFGsTI9gMo2G1503nEVIBXyPEbu9G/y0Emqf9WLLuh
	CAtLVflp6pn0CoyA3EFk8eOOCUMyHOaJHmMqlVG4oO3EYrkO1QLvgW+vWEagAyP1KonJt2r8fkR
	C5hAgCqO4nnDyZUGaOlbXxQr8hZHFnJyhFnb3FgTKZgbAa3s9cu4/gtU1OG0kFNPaWiF4JYYuBM
	TlEydpOut2SaiiKR/8yzZJKaM5xmhJn7uq4h+76qR11ZX6CjIdkh7pMW9vQpc1Y+DH87qNm8AF1
	7qLTmgqSiR95IBOzqVMnudC3qRaJ8v2HCwktxCDnWiyugoqyONdb7xQKUKkuFOb2eGWgEgalKju
	+irtbYYkZpwnI/l3FUR6MxCBzIbGmUxKVhJJrrJtX+5s4R07uqoYhAwELBE5CBW/ch4yeUCYcue
	gUb97sTtlsS6ZncNckRb5fF6dn5bboQ6P7i057hg1Aj4mJgMeul
X-Received: by 2002:a05:600c:c493:b0:499:737c:8a8b with SMTP id 5b1f17b1804b1-499b847746fmr114986405e9.12.1787334854944;
        Fri, 21 Aug 2026 10:54:14 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b9a95fe9sm22332475e9.0.2026.08.21.10.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 10:54:14 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: arnd@arndb.de,
	rosenp@gmail.com,
	chancel.liu@nxp.com,
	jonsmirl@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH v2] ASoC: fix unmet dependencies on PPC_BESTCOMM and SND_SOC_AC97_BUS
Date: Fri, 21 Aug 2026 18:54:10 +0100
Message-ID: <20260821175410.179631-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SND_MPC52xx_SOC_PCM030 and SND_MPC52xx_SOC_EFIKA both select
SND_SOC_MPC5200_AC97 without ensuring its dependency on PPC_BESTCOMM is
met. This causes unmet dependencies such as:

WARNING: unmet direct dependencies detected for SND_SOC_MPC5200_AC97
  Depends on [n]: SOUND [=m] && SND [=m] && SND_SOC [=m] && SND_POWERPC_SOC [=m] && PPC_BESTCOMM [=n]
  Selected by [m]:
  - SND_MPC52xx_SOC_PCM030 [=m] && SOUND [=m] && SND [=m] && SND_SOC [=m] && SND_POWERPC_SOC [=m] && PPC_MPC5200_SIMPLE [=y]

In v1, Rosen pointed out that the import of "mpc5200_dma.h" is actually
unnecessary, and Arnd suggested that the 'select' of SND_SOC_MPC5200_AC97
be changed to 'depends on'.

This resolves all 3 unmet dependencies.

These unmet dependency bugs were detected by kconfirm, a static analysis tool
for Kconfig.

Fixes: a9262c4fd404 ("ASoC: Support for AC97 on Phytec pmc030 base board.")
Fixes: 6ffee43ecf8b ("ASoC: Fabric bindings for STAC9766 on the Efika")
Suggested-by: Arnd Bergmann <arnd@arndb.de>
Suggested-by: Rosen Penev <rosenp@gmail.com>
Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
Changes since v1:
- removed the dependency on PPC_BESTCOMM
- changed existing select of SND_SOC_MPC5200_AC97 to dependency

Link to v1:
https://lore.kernel.org/all/20260802144855.3596995-1-julianbraha@gmail.com/

---
 sound/soc/fsl/Kconfig               | 4 ++--
 sound/soc/fsl/efika-audio-fabric.c  | 2 --
 sound/soc/fsl/pcm030-audio-fabric.c | 2 --
 3 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
index 8ae59c094878..04940879dfd8 100644
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -244,7 +244,7 @@ config SND_SOC_MPC5200_AC97
 config SND_MPC52xx_SOC_PCM030
 	tristate "SoC AC97 Audio support for Phytec pcm030 and WM9712"
 	depends on PPC_MPC5200_SIMPLE
-	select SND_SOC_MPC5200_AC97
+	depends on SND_SOC_MPC5200_AC97
 	select SND_SOC_WM9712
 	help
 	  Say Y if you want to add support for sound on the Phytec pcm030
@@ -253,7 +253,7 @@ config SND_MPC52xx_SOC_PCM030
 config SND_MPC52xx_SOC_EFIKA
 	tristate "SoC AC97 Audio support for bbplan Efika and STAC9766"
 	depends on PPC_EFIKA
-	select SND_SOC_MPC5200_AC97
+	depends on SND_SOC_MPC5200_AC97
 	select SND_SOC_STAC9766
 	help
 	  Say Y if you want to add support for sound on the Efika.
diff --git a/sound/soc/fsl/efika-audio-fabric.c b/sound/soc/fsl/efika-audio-fabric.c
index 4d3266d9cbb7..e9c728bae8b9 100644
--- a/sound/soc/fsl/efika-audio-fabric.c
+++ b/sound/soc/fsl/efika-audio-fabric.c
@@ -22,8 +22,6 @@
 #include <sound/initval.h>
 #include <sound/soc.h>
 
-#include "mpc5200_dma.h"
-
 #define DRV_NAME "efika-audio-fabric"
 
 SND_SOC_DAILINK_DEFS(analog,
diff --git a/sound/soc/fsl/pcm030-audio-fabric.c b/sound/soc/fsl/pcm030-audio-fabric.c
index 5542c4ee6d12..a7a5dba83a2f 100644
--- a/sound/soc/fsl/pcm030-audio-fabric.c
+++ b/sound/soc/fsl/pcm030-audio-fabric.c
@@ -13,8 +13,6 @@
 
 #include <sound/soc.h>
 
-#include "mpc5200_dma.h"
-
 #define DRV_NAME "pcm030-audio-fabric"
 
 struct pcm030_audio_data {
-- 
2.55.0

