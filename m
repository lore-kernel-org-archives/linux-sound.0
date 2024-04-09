Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D97212D210
	for <linux-sound@vger.kernel.org>; Tue,  9 Apr 2024 15:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712676907; cv=none; b=as4F76XlBDYlVMr7erPhwA+GqT/aZ8OCpB7HkHncB+zONkJovXYgDw0HXtDBTOMJamGrNEqwJUlDKPDVeFOaksLSv1wD7bFAkBsOdQBOtSAPCe0FIr2EvBZHPJJT0mTaMlwV3GK1d7YJEZDSOSJjBQBEK9N4tbEMNkt6NZuccr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712676907; c=relaxed/simple;
	bh=wNrvvdLbU4lLzGHZBqQGhLKSFbuEYhN2gytfUcj5Leo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DF4slSsqBLPl2NlcA9LeZinMi7Bc3+x3OSDlMYIF7e9zOKOrh01EEXUfuD/sjNsfZFaICjOifGGtmvFNbaXD/CKw6mRS9W0Guu384gYsI6VVubTmvp6PMI+8jmpxQtorShgNhcjpIf20gtAEKPuKvSs5fHYWtXy+/kOkgrKgPMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:76d0:2bff:fec8:549])
	by michel.telenet-ops.be with bizsmtp
	id 93ax2C00N0SSLxL063axyq; Tue, 09 Apr 2024 17:34:57 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1ruDUP-00DtrG-Nr;
	Tue, 09 Apr 2024 17:34:57 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1ruDUv-003kJW-8g;
	Tue, 09 Apr 2024 17:34:57 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: linux-sound@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ASoC: codecs: Rockchip on-SoC codecs should depend on ARCH_ROCKCHIP
Date: Tue,  9 Apr 2024 17:34:56 +0200
Message-Id: <6cdbaf4afcf4d2059b257f6cb3a8a61bf5e17688.1712676714.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The various Rockchip embedded audio codecs are only present on Rockchip
SoCs.  Hence add dependencies on ARCH_ROCKCHIP, to prevent asking the
user about these drivers when configuring a kernel without Rockchip SoC
support.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 sound/soc/codecs/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 4e47bb6850aac5b9..995eab954dd5db41 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1173,6 +1173,7 @@ config SND_SOC_IDT821034
 
 config SND_SOC_INNO_RK3036
 	tristate "Inno codec driver for RK3036 SoC"
+	depends on ARCH_ROCKCHIP || COMPILE_TEST
 	select REGMAP_MMIO
 
 config SND_SOC_ISABELLE
@@ -1437,6 +1438,7 @@ config SND_SOC_PEB2466
 config SND_SOC_RK3308
 	tristate "Rockchip RK3308 audio CODEC"
 	depends on ARM64 || COMPILE_TEST
+	depends on ARCH_ROCKCHIP || COMPILE_TEST
 	select REGMAP_MMIO
 	help
 	  This is a device driver for the audio codec embedded in the
@@ -1447,6 +1449,7 @@ config SND_SOC_RK3308
 
 config SND_SOC_RK3328
 	tristate "Rockchip RK3328 audio CODEC"
+	depends on ARCH_ROCKCHIP || COMPILE_TEST
 	select REGMAP_MMIO
 
 config SND_SOC_RK817
-- 
2.34.1

