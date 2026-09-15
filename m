Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com [74.125.227.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89E443F8BA
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 18:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789496236; cv=none; b=Hs+UCs1K4cjrOQKWj0wApHMfuP9V87ijnphyILtcYLoZqDrzdCo7wI35MTHARQtkwA+fikegLg+wbdP3l6tfyemDXrwvyGrOinJ/EZWzxgS8wb3ccWOSVf0piWekWSlWyhbrgLs1VCCuBvolPARXoWGZL527hDv8VQNBiP7KiaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789496236; c=relaxed/simple;
	bh=A7in0Alu7BM8kUxRkWxLv9TvBfe4QvgWoOD+yHVx2j4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CIeVoN3gK6LnB3IoUasECpL1zaXSAj4WUPoNblgr5jurItt4bIRNBy0vDIL2kZh6j9Xr702O1/xIBVtaWMMRNynUJQ9Fe2t41+9FicHBWvuYEo+kq7qL+AiysVCQYAl2/VcgvMIWxxXZR8R8esuDuAuFCPBNfgK0ZSA68iBBjEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g//yLgFJ; arc=none smtp.client-ip=74.125.227.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g//yLgFJ"
Received: by mail-vs2-f41.google.com with SMTP id ada2fe7eead31-785692e59e9so4822137.1
        for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 11:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789496232; x=1790101032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lhABGOr78fp2q20gHs/L/QQ2y1BCAwuXhlRy5NO8sA0=;
        b=g//yLgFJbe4+i6+NUjaUGafxtqFGMS47x7HDcC8tenhLuMMEtX44pOpIpENyfN56W+
         JbQIB8oE8sW2RvlHam7BMD4bBTgl5sG4dfft6v1fSmIpOtjnbq08BaU2aWUGaG8+sGci
         YMovr2qcVyvg0Dq1zf2VW/2Xbgg3RJLMGwUBy6qtZlApLFavfdutJE7D7NhwuJ7xda4d
         1qP+uen6AICgUBX3eH/C6NTpnlwrUY51+V2GgySSWJ4vbnxDQ2AUv8TKD24OtM3NKLMn
         PWgsN8gUQi5fEy8HnE/X1qW5Y7n8z/rpJEQYg/usO6Q5UJPQ9KGB3+wEMY9JYuXFg3gu
         pCtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789496232; x=1790101032;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lhABGOr78fp2q20gHs/L/QQ2y1BCAwuXhlRy5NO8sA0=;
        b=sa8adZqM2WjfOBStIzrPa6Gpf0ZKBzgZd0pzXqEiJZuRjVJnEgLqRP0a9bg3ikt/oN
         C9CESVnHy0CP6EYnHhU+i0nRapCLMHABt75AZUPUAYaeVllNuEetdY34nMStYE9eBH8o
         yp6rGJW6CEwZsyk5+m9xQr8Jj3AUXTk8UsM6jjk5xzhviAUOx8PnyPH4NweYBNbuKH1h
         imcLfGfx8oQmbsm8p3bs9jTSDGt+As8h+LidXM/uQI95JnPqWZ+hkO9+j5BEFjyd3r9t
         yql+Zk1X/FfbxzkGaSI1kKaBXofDIZKI5slVDO/bKx8WKnWP5M0U+P1sgmaJ0dsGPoPa
         sH5w==
X-Forwarded-Encrypted: i=1; AKwUvBx8eHPmLdf7JfuyJk7MM7LkyfY96DrN//u8BB+LpxeLplzSrR9ggfe2yxLLxa/PR52pPU78iG9IDMqVMQ==@vger.kernel.org
X-Gm-Message-State: AFuF++l0zhKJ415tV/E/RjkjWNGEMVst3hVjgHT2uykAFKHJyqk8lGo+
	5mthYNjJnljH0MNM1gRFGitY2c90G/yEyQCNG4jk9k0Wg95ZLWJyEinp
X-Gm-Gg: AYBFou0RNab2bBL8pHCgsY2qF9uOzq/+XkACH+a3RXQHzxWhwPikBngCHjYIKeNFkfm
	8mVPyYVA2pUXF7r4VkQ2xMw14Xy87Z9YG2pVutf645R3gWRz105+laYZb1cfpCAihCFSyGq7ScW
	q5Qn2e+PxGtuhvnLyFaYrYXeXlWAnrsid7oTkQJW+miKxJuvcb3Lu2Ta8cZ7baSUXKaf+rig3p9
	iRkNB3yzGWNuhlwM84YNd2Imxmju4sVGv+UmifgyykpfKkCmsZfLpy9F5v91ViwGWP2ggVoIHcW
	oMryg3KMREv1kt+Hf/n6A18qujIIcyQ8/y1NKqx+uWHvHbSW311C4+DlC7MwIUQ4RG/XE4v+zEz
	7N0hPb8Nf5552wIhBdF0IjrOATELh3su+Es1v2SUi0ChbpoqC0zU6EU4x+XEAOYrOD8tbNRN+qd
	3n+RO8dXGqOt/EmEZZMxuqCMkchAzRHNetqDTnjvnFgPyy5YJFJJAH9xEGgq6RXF05NmXSa9Whp
	dGw1zrB74tJ9Kdz4SrLsg4hSaiJLN1jzVM5X2uHQkbJxLr6prKe9olapQeHL0O7MvKaAUpkskO6
	gvTGp+SQJyOwqAc7E6SPrK5GdnMm4N5wMlVsJaqRc02vYjCe
X-Received: by 2002:a05:6102:6a85:b0:79e:221f:704 with SMTP id ada2fe7eead31-79ed4c2905dmr5071549137.7.1789496232542;
        Tue, 15 Sep 2026 11:17:12 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9123be5fcfasm4717636d6.12.2026.09.15.11.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 11:17:12 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org (open list),
	netdev@vger.kernel.org (open list:NETWORKING DRIVERS),
	linux-sound@vger.kernel.org (open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM...)
Subject: [PATCH] dmaengine: bestcomm: Enable compile testing
Date: Tue, 15 Sep 2026 11:17:09 -0700
Message-ID: <20260915181709.11323-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow the BestComm DMA engine to be selected for PowerPC
compile-test builds.

The freescale ethernet and sound drivers now need a dependency on
PPC_MPC52xx as they use headers/functions from that platform.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/bestcomm/Kconfig           | 3 +--
 drivers/net/ethernet/freescale/Kconfig | 2 +-
 sound/soc/fsl/Kconfig                  | 2 +-
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/bestcomm/Kconfig b/drivers/dma/bestcomm/Kconfig
index 5dd437295964..153b5492c93c 100644
--- a/drivers/dma/bestcomm/Kconfig
+++ b/drivers/dma/bestcomm/Kconfig
@@ -5,7 +5,7 @@
 
 config PPC_BESTCOMM
 	tristate "Bestcomm DMA engine support"
-	depends on PPC_MPC52xx
+	depends on PPC_MPC52xx || (PPC && COMPILE_TEST)
 	default n
 	select PPC_LIB_RHEAP
 	help
@@ -34,4 +34,3 @@ config PPC_BESTCOMM_GEN_BD
 	depends on PPC_BESTCOMM
 	help
 	  This option enables the support for the GenBD tasks.
-
diff --git a/drivers/net/ethernet/freescale/Kconfig b/drivers/net/ethernet/freescale/Kconfig
index b34c0fcfddea..d81984fcec64 100644
--- a/drivers/net/ethernet/freescale/Kconfig
+++ b/drivers/net/ethernet/freescale/Kconfig
@@ -38,7 +38,7 @@ config FEC
 
 config FEC_MPC52xx
 	tristate "FEC MPC52xx driver"
-	depends on PPC_BESTCOMM
+	depends on PPC_BESTCOMM && PPC_MPC52xx
 	select CRC32
 	select PHYLIB
 	select PPC_BESTCOMM_FEC
diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
index 04940879dfd8..101bc952aa14 100644
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -234,7 +234,7 @@ config SND_SOC_MPC5200_I2S
 
 config SND_SOC_MPC5200_AC97
 	tristate "Freescale MPC5200 PSC in AC97 mode driver"
-	depends on PPC_BESTCOMM
+	depends on PPC_BESTCOMM && PPC_MPC52xx
 	select SND_SOC_AC97_BUS
 	select SND_MPC52xx_DMA
 	select PPC_BESTCOMM_GEN_BD
-- 
2.55.0

