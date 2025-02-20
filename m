Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F786212D69
	for <linux-sound@vger.kernel.org>; Thu, 20 Feb 2025 16:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740070290; cv=none; b=uU1Jo3lkSfePmQBDlXcgfZjfJdU4L9u67DfPh4BzJV/Gg8qio1j/3WTreZ0MVJqj1g8oT4PeoXJRNEZkNj2sEPTDkkS1KBUF6vWJPm+A0BoS2OYdmtpmedT8hUP5dIYGy/rfTiFBcN2LAW/IS88qQqG8M1Gv3Ih88MZ465M7XWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740070290; c=relaxed/simple;
	bh=2Mn0FbrRTTD96RspkydLAH88fgCfIhE8hu8tR2JtIds=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tnPVCAupkpoY9NVfyptGkWRLYTZRQqozSIFiuYxMvnJMe0PGaLAKMweo7P6nzIaj7nnSZ3Id1jC/mA2ai6eK1F6hV0qnmeyAG7GN0BYMpRA23p92Y49x3f4HChXRRDX6FXI5W8y/h3T9zc3YteV1MXtfNcqFi4YARCKOTvQieIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a2Aaf1Aj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a2Aaf1Aj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 540C3C4CED1;
	Thu, 20 Feb 2025 16:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740070290;
	bh=2Mn0FbrRTTD96RspkydLAH88fgCfIhE8hu8tR2JtIds=;
	h=From:To:Cc:Subject:Date:From;
	b=a2Aaf1AjyDYYlxTfW6WKQb78ydjGAdORn4peli/k/fe1nGGZ6gjwAoev19gMXydbb
	 5W+sigF387qrVDeUCtSzOMHJy6rLdPaSw/WU3lN+PZ0rACXlhh9rw45lrp9VgcmsCV
	 jqDsScDjchL/3GnbsuLA33qjWrE+kFLHl180wJYyfdOEhcTfRKPaLhhLQh3tavYgeV
	 uh0r4Kp3Mnl3Ry3eIonOK2JH4FzIW/VRBZhaAozcm02ddY+TMZXXAo5IwKZN4gMeBi
	 a7AiuXOVsrzesA4UBWLzxsmoN02hbT7IOqI1G/pejqBpX1SmNQ1dIms5uOF+sBzPKi
	 F8xTBUV0ZtePQ==
From: Mario Limonciello <superm1@kernel.org>
To: mario.limonciello@amd.com,
	lgirdwood@gmail.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	daniel.baluta@nxp.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH] ASoC: SOF: amd: Add depends on CPU_SUP_AMD
Date: Thu, 20 Feb 2025 10:51:26 -0600
Message-ID: <20250220165127.492927-1-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mario Limonciello <mario.limonciello@amd.com>

When SMN support was switched to the kernel wide AMD_NODE instead of
local implementation this broke compilation on the allyesconfig for
some architectures.  AMD_NODE is only supported on AMD platforms, so
modify all the AMD drivers that use it to also require CPU_SUP_AMD.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/linux-next/20250220160950.2cd64bdb@canb.auug.org.au/
Fixes: f120cf33d232 ("ASoC: SOF: amd: Use AMD_NODE")
---
 sound/soc/sof/amd/Kconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/sof/amd/Kconfig b/sound/soc/sof/amd/Kconfig
index 28216c8c1cf97..6eb5b2d148430 100644
--- a/sound/soc/sof/amd/Kconfig
+++ b/sound/soc/sof/amd/Kconfig
@@ -33,6 +33,7 @@ config SND_SOC_SOF_AMD_COMMON
 config SND_SOC_SOF_AMD_RENOIR
 	tristate "SOF support for RENOIR"
 	depends on SND_SOC_SOF_PCI
+	depends on CPU_SUP_AMD
 	select SND_SOC_SOF_AMD_COMMON
 	help
 	  Select this option for SOF support on AMD Renoir platform
@@ -40,6 +41,7 @@ config SND_SOC_SOF_AMD_RENOIR
 config SND_SOC_SOF_AMD_VANGOGH
 	tristate "SOF support for VANGOGH"
 	depends on SND_SOC_SOF_PCI
+	depends on CPU_SUP_AMD
 	select SND_SOC_SOF_AMD_COMMON
 	help
 	  Select this option for SOF support
@@ -50,6 +52,7 @@ config SND_SOC_SOF_AMD_VANGOGH
 config SND_SOC_SOF_AMD_REMBRANDT
 	tristate "SOF support for REMBRANDT"
 	depends on SND_SOC_SOF_PCI
+	depends on CPU_SUP_AMD
 	select SND_SOC_SOF_AMD_COMMON
 	help
 	  Select this option for SOF support on AMD Rembrandt platform
@@ -82,6 +85,7 @@ config SND_SOC_SOF_AMD_SOUNDWIRE
 config SND_SOC_SOF_AMD_ACP63
 	tristate "SOF support for ACP6.3 platform"
 	depends on SND_SOC_SOF_PCI
+	depends on CPU_SUP_AMD
 	select SND_SOC_SOF_AMD_COMMON
 	select SND_SOC_SOF_AMD_SOUNDWIRE_LINK_BASELINE
 	help
@@ -93,6 +97,7 @@ config SND_SOC_SOF_AMD_ACP63
 config SND_SOC_SOF_AMD_ACP70
 	tristate "SOF support for ACP7.0 platform"
 	depends on SND_SOC_SOF_PCI
+	depends on CPU_SUP_AMD
 	select SND_SOC_SOF_AMD_COMMON
 	help
 	  Select this option for SOF support on
-- 
2.43.0

