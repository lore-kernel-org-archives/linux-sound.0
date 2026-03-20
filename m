Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A56382379;
	Fri, 20 Mar 2026 15:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774019878; cv=none; b=NRSJgucjm7rlij6gMyaTsMMY62qA4tI5+v3ajzixIOFQmq+9IEQsBA/ytm7TE4KR5XqQsAg4UqoGhGGNp9ohgH9/thD9VjrNnBqYY5v3vD8xJZ3w4ij9T+5y08VSg1qd0B2w7Rob0nBfSZKr2jsCoMSSeE2uLEsMVURVBaxTgJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774019878; c=relaxed/simple;
	bh=1fR1J78HLi9UXbMD1e7AK7T7FW6YhDUvIGugUBZ8Ac0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=s1VYonauWg2FoS2205o74i7LDRQ7zKgC5UVUWeiCKDkcOYxY+3zjClfYZSwz95UAx9SV5dphmjnVi3csxvQmS3A0dSiA2YKtweSyIoL9TJVPkryW/4xy7Qucy/ceR4A/72xHPCXqrZKYW5DECf/DGSo4prPfWhMk5K0fsQULIxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VbPAclXE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VbPAclXE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ACE1C4CEF7;
	Fri, 20 Mar 2026 15:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774019877;
	bh=1fR1J78HLi9UXbMD1e7AK7T7FW6YhDUvIGugUBZ8Ac0=;
	h=From:To:Cc:Subject:Date:From;
	b=VbPAclXEwMW483ayD3nsZmjS5piMP2SP7pNPAYnBP/KYwbPULt1EltFAsdNblKWhB
	 9y1DRojiO9NU0UHqeuDS7Sv4lNsJr9FqdCDtn9kHgMGGsOJ6Nwe/YanxChyffBbR7V
	 VnzpAtZKn4FwL5X1c2g9Mhlf4Y1iDqgQydZpd6sJCND4PQ7MEe3iA0uAueAE/JNbO+
	 vYeKhk+w8FHOC75Ey1vcYQHhNc4jd/6vii5ENmsYMSB+zDARN4sDMKL7mBstQg8iht
	 04n73u05P4BkPRiv+o0TcRCC3uBgT7MC02JKuh7XfeIYCQMnbGCZNLjZMF+6Keh3hW
	 57eZNijv7NLnw==
From: Arnd Bergmann <arnd@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	ChiYuan Huang <cy_huang@richtek.com>,
	Zhang Yi <zhangyi@everest-semi.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: wm_adsp: select CONFIG_SND_SOC_WM_ADSP from all users
Date: Fri, 20 Mar 2026 16:17:31 +0100
Message-Id: <20260320151752.3439218-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The addition of the kunit test made it possible to enable the WM_ADSP
driver even when there are no users. However, an unintended side-effect
was that it is also possible to turn it off when it is actually required,
leading to build failures:

ERROR: modpost: "wm_halo_init" [sound/soc/codecs/snd-soc-cs35l45.ko] undefined!
ERROR: modpost: "wm_adsp2_remove" [sound/soc/codecs/snd-soc-cs35l45.ko] undefined!
ERROR: modpost: "wm_adsp_hibernate" [sound/soc/codecs/snd-soc-cs35l45.ko] undefined!
ERROR: modpost: "wm_adsp2_component_probe" [sound/soc/codecs/snd-soc-cs35l45.ko] undefined!

Reverse the logic to replace the ununual list of 'default y if ....' with
the regular 'select' that do the same thing but prevent it from being
disabled if that would break the build.

Fixes: bf2d44d07de7 ("ASoC: wm_adsp: Add kunit test for firmware file search")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/codecs/Kconfig | 31 +++++++++----------------------
 1 file changed, 9 insertions(+), 22 deletions(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index f9e6a83e55c6..d6104796db4f 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -401,28 +401,6 @@ config SND_SOC_WM_ADSP
 	tristate "Cirrus Logic wm_adsp driver" if KUNIT
 	select FW_CS_DSP
 	select SND_SOC_COMPRESS
-	default y if SND_SOC_MADERA=y
-	default y if SND_SOC_CS47L24=y
-	default y if SND_SOC_WM5102=y
-	default y if SND_SOC_WM5110=y
-	default y if SND_SOC_WM2200=y
-	default y if SND_SOC_CS35L41_SPI=y
-	default y if SND_SOC_CS35L41_I2C=y
-	default y if SND_SOC_CS35L45_SPI=y
-	default y if SND_SOC_CS35L45_I2C=y
-	default y if SND_SOC_CS35L56=y
-	default y if SND_SOC_CS48L32=y
-	default m if SND_SOC_MADERA=m
-	default m if SND_SOC_CS47L24=m
-	default m if SND_SOC_WM5102=m
-	default m if SND_SOC_WM5110=m
-	default m if SND_SOC_WM2200=m
-	default m if SND_SOC_CS35L41_SPI=m
-	default m if SND_SOC_CS35L41_I2C=m
-	default m if SND_SOC_CS35L45_SPI=m
-	default m if SND_SOC_CS35L45_I2C=m
-	default m if SND_SOC_CS35L56=m
-	default m if SND_SOC_CS48L32=m
 
 config SND_SOC_WM_ADSP_TEST
 	tristate "KUnit tests for Cirrus Logic wm_adsp" if !KUNIT_ALL_TESTS
@@ -834,6 +812,7 @@ config SND_SOC_CS35L41_LIB
 
 config SND_SOC_CS35L41
 	tristate
+	select SND_SOC_WM_ADSP
 
 config SND_SOC_CS35L41_SPI
 	tristate "Cirrus Logic CS35L41 CODEC (SPI)"
@@ -852,6 +831,7 @@ config SND_SOC_CS35L41_I2C
 config SND_SOC_CS35L45
 	tristate
 	select REGMAP_IRQ
+	select SND_SOC_WM_ADSP
 
 config SND_SOC_CS35L45_SPI
 	tristate "Cirrus Logic CS35L45 CODEC (SPI)"
@@ -875,6 +855,7 @@ config SND_SOC_CS35L45_I2C
 
 config SND_SOC_CS35L56
 	tristate
+	select SND_SOC_WM_ADSP
 
 config SND_SOC_CS35L56_SHARED
 	select SND_SOC_CS_AMP_LIB
@@ -1112,6 +1093,7 @@ config SND_SOC_CS47L15
 config SND_SOC_CS47L24
 	tristate
 	depends on MFD_CS47L24 && MFD_ARIZONA
+	select SND_SOC_WM_ADSP
 
 config SND_SOC_CS47L35
 	tristate
@@ -1133,6 +1115,7 @@ config SND_SOC_CS48L32
 	tristate "Cirrus Logic CS48L32 audio DSP"
 	depends on SPI_MASTER
 	select REGMAP_SPI
+	select SND_SOC_WM_ADSP
 	help
 	  Build the codec driver for the Cirrus Logic CS48L32 audio DSP.
 
@@ -1391,6 +1374,7 @@ config SND_SOC_LOCHNAGAR_SC
 
 config SND_SOC_MADERA
 	tristate
+	select SND_SOC_WM_ADSP
 	default y if SND_SOC_CS47L15=y
 	default y if SND_SOC_CS47L35=y
 	default y if SND_SOC_CS47L85=y
@@ -2489,6 +2473,7 @@ config SND_SOC_WM2000
 config SND_SOC_WM2200
 	tristate
 	depends on I2C
+	select SND_SOC_WM_ADSP
 
 config SND_SOC_WM5100
 	tristate
@@ -2497,10 +2482,12 @@ config SND_SOC_WM5100
 config SND_SOC_WM5102
 	tristate
 	depends on MFD_WM5102 && MFD_ARIZONA
+	select SND_SOC_WM_ADSP
 
 config SND_SOC_WM5110
 	tristate
 	depends on MFD_WM5110 && MFD_ARIZONA
+	select SND_SOC_WM_ADSP
 
 config SND_SOC_WM8350
 	tristate
-- 
2.39.5

