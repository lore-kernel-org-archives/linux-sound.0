Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6299C21128F
	for <linux-sound@vger.kernel.org>; Fri, 21 Feb 2025 18:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740161931; cv=none; b=YNrqIH8KDd+lWJLoHmwW1mRER2zrjZYHoId2QjsZS50DfawBSnhdBodQDRtQRC5QuJ04zqm9s4tQzxB89A79WxZGGxOW4cpOrg4NoPHf+nSd2AfSsi3jB9vkY7osN2VnleMQDIGE/mmod0t7/AfBEVQ3RBsuu7d/38Gix74JZYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740161931; c=relaxed/simple;
	bh=FUYEgtKOBlWdF5NF4x4EhlQX40g4at2PAlgir/PeVaE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HnVlXwk0cc/UBqc+x71uYgy/Y2YSj4pq49Gpa2tlWz5HbdEAyTU5sp8H/d3NSHm1F2ydfc0OsHb4dvrB+1OSoB7SG8A7lHWPaRaXotXv6vqlHIntuRQlbTNE4wEV6v8z+GoG6pjOvpGHFDzYbpHyD3HgXC+lEHqSjeYmr1d+5rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TWFC5vm/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TWFC5vm/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5B96C4CED6;
	Fri, 21 Feb 2025 18:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740161931;
	bh=FUYEgtKOBlWdF5NF4x4EhlQX40g4at2PAlgir/PeVaE=;
	h=From:To:Cc:Subject:Date:From;
	b=TWFC5vm/VXg8U5eObTMf71EDxq62lorIMYFciNnn/bZtQyFN+cBZndQxjHTHR5BWQ
	 +Z9D4sSLZjuyzC/OLtASFPJRV6di0rjcqRxFPQk9KHCNDCVLdUIWDDrUFF4s62SOiJ
	 ecyWE/ILbP51qNrdLBLdGaEF43wQXAoXktlqFXkZqcCdL6OtWb/spmAmkhn+YrCO++
	 GBn7TjFWojxsNFr/oJgFgIJb5wV0VX1y6D3pdfLlaPsorE/NUcaPtRd6ofHC0M9oLS
	 CcH+51+vvnZ+zOHQkAOfoNx+RXRucNmj55yOI0dXYiOLxA33L4IH9zvFPfvYHI6F7d
	 whwHLwNRf3/WQ==
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
Cc: kernel test robot <lkp@intel.com>,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH] ASoC: SOF: amd: Move depends on AMD_NODE to consumers
Date: Fri, 21 Feb 2025 12:18:12 -0600
Message-ID: <20250221181840.2639793-1-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mario Limonciello <mario.limonciello@amd.com>

CONFIG_SND_SOC_SOF_AMD_COMMON is a hidden option that is only selected by
other options.  It can't have a direct depends on AMD_NODE because select
can't pick another option automatically.

This was attempted to be fixed in commit b47834ee4485b ("ASoC: SOF: amd:
Add depends on CPU_SUP_AMD") but this just masked the issue as it was found
in another config.

Instead move the `depends on AMD_NODE` out of SND_SOC_SOF_AMD_COMMON to
all the consumers and drop `depends on CPU_SUP_AMD`.

Fixes: b47834ee4485b ("ASoC: SOF: amd: Add depends on CPU_SUP_AMD")
Fixes: f120cf33d232 ("ASoC: SOF: amd: Use AMD_NODE")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202502220104.a8P6ApQN-lkp@intel.com/
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 sound/soc/sof/amd/Kconfig | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sof/amd/Kconfig b/sound/soc/sof/amd/Kconfig
index 6eb5b2d148430..3ea82fa72e353 100644
--- a/sound/soc/sof/amd/Kconfig
+++ b/sound/soc/sof/amd/Kconfig
@@ -25,7 +25,6 @@ config SND_SOC_SOF_AMD_COMMON
 	select SND_SOC_SOF_ACP_PROBES
 	select SND_SOC_ACPI_AMD_MATCH
 	select SND_SOC_ACPI if ACPI
-	depends on AMD_NODE
 	help
 	  This option is not user-selectable but automatically handled by
 	  'select' statements at a higher level
@@ -33,7 +32,7 @@ config SND_SOC_SOF_AMD_COMMON
 config SND_SOC_SOF_AMD_RENOIR
 	tristate "SOF support for RENOIR"
 	depends on SND_SOC_SOF_PCI
-	depends on CPU_SUP_AMD
+	depends on AMD_NODE
 	select SND_SOC_SOF_AMD_COMMON
 	help
 	  Select this option for SOF support on AMD Renoir platform
@@ -41,7 +40,7 @@ config SND_SOC_SOF_AMD_RENOIR
 config SND_SOC_SOF_AMD_VANGOGH
 	tristate "SOF support for VANGOGH"
 	depends on SND_SOC_SOF_PCI
-	depends on CPU_SUP_AMD
+	depends on AMD_NODE
 	select SND_SOC_SOF_AMD_COMMON
 	help
 	  Select this option for SOF support
@@ -52,7 +51,7 @@ config SND_SOC_SOF_AMD_VANGOGH
 config SND_SOC_SOF_AMD_REMBRANDT
 	tristate "SOF support for REMBRANDT"
 	depends on SND_SOC_SOF_PCI
-	depends on CPU_SUP_AMD
+	depends on AMD_NODE
 	select SND_SOC_SOF_AMD_COMMON
 	help
 	  Select this option for SOF support on AMD Rembrandt platform
@@ -85,7 +84,7 @@ config SND_SOC_SOF_AMD_SOUNDWIRE
 config SND_SOC_SOF_AMD_ACP63
 	tristate "SOF support for ACP6.3 platform"
 	depends on SND_SOC_SOF_PCI
-	depends on CPU_SUP_AMD
+	depends on AMD_NODE
 	select SND_SOC_SOF_AMD_COMMON
 	select SND_SOC_SOF_AMD_SOUNDWIRE_LINK_BASELINE
 	help
@@ -97,7 +96,7 @@ config SND_SOC_SOF_AMD_ACP63
 config SND_SOC_SOF_AMD_ACP70
 	tristate "SOF support for ACP7.0 platform"
 	depends on SND_SOC_SOF_PCI
-	depends on CPU_SUP_AMD
+	depends on AMD_NODE
 	select SND_SOC_SOF_AMD_COMMON
 	help
 	  Select this option for SOF support on
-- 
2.43.0

