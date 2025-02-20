Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C681E3761
	for <linux-sound@vger.kernel.org>; Thu, 20 Feb 2025 18:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740077308; cv=none; b=eHSLAM0iDahDCyiUcsTBGeTlVRjvgwPJxNq5mnLf590NVfwAJ65q2M8LZUTELeSvnaw6Uc82/6oYXiZXvRLoTAb057VyCRSZbBzIlL1Qt6ONs1rDQIF4q6Mt34hsxOsI+rVTTpgB6FJ6sEq/wYCaNO0E8mdTqEQWOzSAUewNtq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740077308; c=relaxed/simple;
	bh=eHZ3IzZ28mNPIYkCIhphl9kVzpAWR5keaVhYW//xdjk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zbc7Qkv+sqA78D+7UySGxg6zSub8et9WHpJcgQHMsnTphBcYjnFaF2aIpSDjxC+LAdpZMtoKhkdd/86/tx01qkFTsDgXeIT+Ticvg8/csqhSCleDAJUICcnxYAqFv9cxErdtpQWz1fgnBAWz1Ep3kH2s0CryCZUGYiAO4i/R8C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nsbrs6Qm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nsbrs6Qm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE2EFC4CED1;
	Thu, 20 Feb 2025 18:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740077308;
	bh=eHZ3IzZ28mNPIYkCIhphl9kVzpAWR5keaVhYW//xdjk=;
	h=From:To:Cc:Subject:Date:From;
	b=Nsbrs6QmohEPSYa2Ljp3/9NoBeSqKxgy6FemnXC9V3q3Qr+sjv737VQzpjc1x3/5Y
	 myz/75A1BlFc/diM3QgZ76mY1cuu/+DwloRQ/4xP8beqEB4C4D+tDMWl3QCIddtIur
	 6QDEW/5mVPgCWeVdd7yTQQRSG/NAEXKZZNwf7X58Xmdj3GJDaSHkov+d5C4EFTAmae
	 edFuN9cNTGWQC0urioDOQoKrDLj7CxZv5y/6esOYa/FGpH8NePZWHfBPFWx85rUxJl
	 NNtRjUO0zOngZigPWtieaymbvtre/KJcCGpIBOaEMooHRvykaJhDEKM4fS2v2F+6Ep
	 Vj6Lh/2IVUcIA==
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
Date: Thu, 20 Feb 2025 12:48:20 -0600
Message-ID: <20250220184822.916090-1-superm1@kernel.org>
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
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
Resend with S-o-b
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

