Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB6572621;
	Tue, 23 Dec 2025 21:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766526619; cv=none; b=BCOdHOVqKmYslpgKSBGWlOUXkOnwqjCxsRDGwLs7jJocF+jfO+Vi0V94jq37y7YJzfwfGfhxJP8PEmHDAJlEXCxkHe9RJB/JkPx1qbNwAQMyTb4zOO7FspGppMcQWvFlUWqAVBG/xziFbA9q92SBWcWfM3rsjigv45zh8aVxAp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766526619; c=relaxed/simple;
	bh=N6ssYbMD7DZjU/6UDXghoWZBmGLZf2RfQAb1HEJt0HE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dyrF7zMKSF5+V0mX2+vGor62bUCm6KO22f42ebd49RycDpaOfiHD4fctQD4T51y76KWbzl2naQ0L+7BzUQjx+aEhNsNUs+LAxBMWsOCVoe45m7Mr2IU2oN3fnQoOcHMm8qiRug3nZqIhZjqQYUtn8U0h5Zqk4p04htN7zChhY5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KuGrCtzh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KuGrCtzh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DF97C113D0;
	Tue, 23 Dec 2025 21:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766526619;
	bh=N6ssYbMD7DZjU/6UDXghoWZBmGLZf2RfQAb1HEJt0HE=;
	h=From:To:Cc:Subject:Date:From;
	b=KuGrCtzh4vnVGopkRtdcspQBUgVSQ4iFtWIKte8uj6za2FhUuXyeTKbYj3KGVoDus
	 S5KDM+vhOHNHOWIu+9mXDNJp8gLXEPKmXQYEbGkWB9h8vsATcAgwUXwf1zYLiSS0Hu
	 ZiLPIuUbQOYxA4wMaf1WDKXqcIif2gOFWr9k0nwD/Uzn9vIzOJyn6spI8Er9uwJzvX
	 vqm4p/VDKKvpZLcdGIEhmg57CzKIokfElWoGt0AjS0+NbYt3L7Lw2w8eciWb6vRmm2
	 cWwKaGIOwA6ZOxjEKv8JRxLnZLMijrP7V7eYNlXl2x7Nk15MoQSDtJQwOmDOuN5rqm
	 rvD8PVPvqkcxg==
From: Arnd Bergmann <arnd@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Liam Girdwood <liam.r.girdwood@intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] soundwire: intel_ace2x: add SND_HDA_CORE dependency
Date: Tue, 23 Dec 2025 22:50:01 +0100
Message-Id: <20251223215014.534756-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The ace2x driver can optionally use the HDA infrastructure, but can still
build without that. However, with SND_HDA_CORE=m and SND_HDA_ALIGNED_MMIO=y,
it fails to link as built-in:

aarch64-linux-ld: drivers/soundwire/intel_ace2x.o: in function `intel_shim_wake':
intel_ace2x.c:(.text+0x2518): undefined reference to `snd_hdac_aligned_read'
aarch64-linux-ld: intel_ace2x.c:(.text+0x25d4): undefined reference to `snd_hdac_aligned_read'
aarch64-linux-ld: intel_ace2x.c:(.text+0x268c): undefined reference to `snd_hdac_aligned_write'

Add a Kconfig dependency that forces the soundwire driver to be a loadable
module if necessary.

Fixes: 79e7123c078d ("soundwire: intel_ace2x: fix wakeup handling")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
I saw this build failure only once, but don't know if this is a recent regression
or was originally caused by the 79e7123c078d commit.
---
 drivers/soundwire/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soundwire/Kconfig b/drivers/soundwire/Kconfig
index ad56393e4c93..196a7daaabdb 100644
--- a/drivers/soundwire/Kconfig
+++ b/drivers/soundwire/Kconfig
@@ -40,6 +40,7 @@ config SOUNDWIRE_INTEL
 	select AUXILIARY_BUS
 	depends on ACPI && SND_SOC
 	depends on SND_SOC_SOF_HDA_MLINK || !SND_SOC_SOF_HDA_MLINK
+	depends on SND_HDA_CORE || !SND_HDA_ALIGNED_MMIO
 	help
 	  SoundWire Intel Master driver.
 	  If you have an Intel platform which has a SoundWire Master then
-- 
2.39.5

