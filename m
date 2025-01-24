Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D90166F32
	for <linux-sound@vger.kernel.org>; Fri, 24 Jan 2025 08:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737707968; cv=none; b=fLTCDGPQxpXq6mWkSDRfhh46Ix1HpaofecBXcD/3gq+ll+untEexwmePdaALbT+AY1KI6qZxUpT/Ve2cNFdJXSLOQDFmlxxa3pgE2RYdTfbbidMX0dXyh/1vyAWeYJN/MazwrjPGo0JlRIWvM+HOS1YVxDxoTZSIDU7Zw1Zk4Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737707968; c=relaxed/simple;
	bh=P2legxjc70AvAvE4OdaJVBd6zw4JBxhSJ0qvXoEZw4k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lb1JWMoKd+hFvK0do4iPvaZx2zP4PY9q65NLqsyJjS4nB6dadrV3gf9S3wyL0F4pCHs1vK4J8UeeT2T/afpcGwBAm6mUzuMWeMOW+SRs/gpt2ROpDy3na9wfzpKnQaOlM/ODsLAKgTN/5y4E7WJJXmxVfWCQ99f/LKmLtEVbwoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:4563:f165:f885:ebc1])
	by albert.telenet-ops.be with cmsmtp
	id 4wfM2E00H5PrELR06wfMbg; Fri, 24 Jan 2025 09:39:22 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tbFDc-0000000EJL3-2ZQF;
	Fri, 24 Jan 2025 09:39:21 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tbFDl-00000002dsC-15tv;
	Fri, 24 Jan 2025 09:39:21 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: linux-sh@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] sh: boards: Use imply to enable hardware with complex dependencies
Date: Fri, 24 Jan 2025 09:39:19 +0100
Message-ID: <8329d88cecc1e419f6a0f3f215695d3cfcb549aa.1737707880.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If CONFIG_I2C=n:

    WARNING: unmet direct dependencies detected for SND_SOC_AK4642
      Depends on [n]: SOUND [=y] && SND [=y] && SND_SOC [=y] && I2C [=n]
      Selected by [y]:
      - SH_7724_SOLUTION_ENGINE [=y] && CPU_SUBTYPE_SH7724 [=y] && SND_SIMPLE_CARD [=y]

    WARNING: unmet direct dependencies detected for SND_SOC_DA7210
      Depends on [n]: SOUND [=y] && SND [=y] && SND_SOC [=y] && SND_SOC_I2C_AND_SPI [=n]
      Selected by [y]:
      - SH_ECOVEC [=y] && CPU_SUBTYPE_SH7724 [=y] && SND_SIMPLE_CARD [=y]

Fix this by replacing select by imply, instead of adding a dependency on
I2C.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202501240836.OvXqmANX-lkp@intel.com/
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/sh/boards/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/sh/boards/Kconfig b/arch/sh/boards/Kconfig
index 46387fd040adeaac..cac265e3e7de926d 100644
--- a/arch/sh/boards/Kconfig
+++ b/arch/sh/boards/Kconfig
@@ -73,8 +73,8 @@ config SH_7724_SOLUTION_ENGINE
 	select SOLUTION_ENGINE
 	depends on CPU_SUBTYPE_SH7724
 	select GPIOLIB
-	select SND_SOC_AK4642 if SND_SIMPLE_CARD
 	select REGULATOR_FIXED_VOLTAGE if REGULATOR
+	imply SND_SOC_AK4642 if SND_SIMPLE_CARD
 	help
 	  Select 7724 SolutionEngine if configuring for a Hitachi SH7724
 	  evaluation board.
@@ -252,8 +252,8 @@ config SH_ECOVEC
 	bool "EcoVec"
 	depends on CPU_SUBTYPE_SH7724
 	select GPIOLIB
-	select SND_SOC_DA7210 if SND_SIMPLE_CARD
 	select REGULATOR_FIXED_VOLTAGE if REGULATOR
+	imply SND_SOC_DA7210 if SND_SIMPLE_CARD
 	help
 	  Renesas "R0P7724LC0011/21RL (EcoVec)" support.
 
-- 
2.43.0

