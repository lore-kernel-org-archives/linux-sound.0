Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793688095;
	b=Yd3sBOJFIndGgBg5BiPD0t9+kTsYwTNUV6NzkdVTJKy1AhtPgWZ9skn9tnCwXOiOsUPl
	 zSdiPM18mHfeu4T5o4/x/Dh2m/nLUEVvUG46CQep09UWUtkdFEvoJwBGgPPY83p0pg/0F
	 IUEBCnGMRAC3ny0MHLKjPiTNWSNsqcoW+uwmElAZbZWYDBsZTEvEyNu///M4hsz/qzd9k
	 1Ka7lijLuQK0Ui4z3etQF1KPRQ1hS+WIiCEDyMoKCpRbOiqZen9YyrTfQthMRe6IORhQs
	 uELHefrVd+Ve6zgzlGD1eZvVsNHwFrf7xN+dMNhlQ6RBcIKm+ILgBsdQ0HN+Zm93P0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793688095;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=fTgSatG4MvjMsRT9jq0XYpI+3FtgBlqcdEho8ORyYa4=;
	b=Sbq85EBrcU7aNLIUBjtHYs7aMMxnEyJgl+p+XxinII+2Qz37/BVUAIADa0YZ/Jz1Yy2q
	 uCUQ8fX4iOa3LVaTJxOCVGfa0FpsG2JXXf+X5EVK/7dgvtKXjpMth9fk7C3q1ig7Z08di
	 MRL7o1hWbdqFFs1U3aGJEab1vLzLgFTkZEba5BoLQfHlMUW9dSAPNCNzFJ45LlknCiWpl
	 aUPP8DgUzoQF80gx1gFIy0WTovYalZzIPWmq+Rn0jhg+mJQTVRgERl+covVl2nhLkCcQR
	 7kSNZ6nVtSlnPgWMbiFI6bIZV5CycS2t5taqE4BoDDeM4MfKiLXR9Ea7zUOYJiwOcdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=senarytech.com;
	spf=pass smtp.mailfrom=senarytech.com;
	dkim=pass header.d=senarytech.com header.i=@senarytech.com header.a=rsa-sha256 header.s=default header.b=f2wG4d2x;
	arc=none smtp.remote-ip=220.197.31.97
Received: from mail-m1973197.qiye.163.com (mail-m1973197.qiye.163.com [220.197.31.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD09606A324
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 06:41:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CD09606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=senarytech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=senarytech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=senarytech.com header.i=@senarytech.com header.a=rsa-sha256 header.s=default header.b=f2wG4d2x
Received: from Wangqianghua.localdomain (unknown [27.38.136.171])
	by smtp.qiye.163.com (Hmail) with ESMTP id 534b0d0c1;
	Tue, 3 Nov 2026 14:41:22 +0800 (GMT+08:00)
From: Qianghua Wang <qianghua.wang@senarytech.com>
To: linux-sound@vger.kernel.org
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Mark Brown <broonie@kernel.org>,
	alsa-devel@alsa-project.org,
	Qianghua Wang <qianghua.wang@senarytech.com>
Subject: [PATCH] ASoC: Intel: soc-acpi: use dummy topology for SN624x
Date: Tue,  3 Nov 2026 14:41:22 +0800
Message-ID: <20261103064123.115057-1-qianghua.wang@senarytech.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1a02418d509d8kunmfda58cfb30caff
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaTkgYVkpMQkpLQ0xNSRpDTVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlJTFVIQ1VKSE1VSkxKWVdZFhoPEhUdFFlBWUtVS1VLVU
	tZBg++
DKIM-Signature: a=rsa-sha256;
	b=f2wG4d2xNar2tRML1bj8EYhaJN2zjDU4tdbUZMxDv9/paWsDiIh0pq1qWuLIsMBlZtz0ntMRignCxk3wzS7rDxbLD6RUIHiWigrUu/m2nRgIRcCM0Fm7J6svbtIBJ2s1ueF6tk4ttKKTmgUK/1ARdjEba0nzt3qYwdZslqJH2NQ=; s=default; c=relaxed/relaxed; d=senarytech.com; v=1;
	bh=fTgSatG4MvjMsRT9jq0XYpI+3FtgBlqcdEho8ORyYa4=;
	h=date:mime-version:subject:message-id:from;

The SN624x SoundWire entries in the MTL, ARL, LNL and PTL match tables
point at sof-<platform>-sn624x.tplg. Those monolithic topologies are not
shipped in sof-bin, so the SOF probe fails with a missing topology on
any system that does not carry the out-of-tree files.

The SN624x jack, amp and mic DAIs map onto the generic SDCA function
topologies (sof-sdca-jack, sof-sdca-1amp, sof-sdca-mic) and the HDMI
fragments. Use sof-<platform>-dummy.tplg so the card is always built
from function topologies and no monolithic topology is needed.

Tested on a Wildcat Lake (PTL match table) laptop with SN6244, with
sof-ptl-sn624x.tplg removed: the card probes with sof-sdca-jack-id0,
sof-sdca-1amp-id2, sof-sdca-mic-id4 and sof-hdmi-pcm5-id5. Speaker,
headset, DMIC and HDMI playback/capture work.

Fixes: 32f9c551a91a ("ASoC: Intel: soc-acpi: add SN624x entries for ARL/LNL/MTL/PTL")
Link: https://github.com/thesofproject/sof/issues/11167
Link: https://github.com/thesofproject/linux/issues/6002
Signed-off-by: Qianghua Wang <qianghua.wang@senarytech.com>
---
 sound/soc/intel/common/soc-acpi-intel-arl-match.c | 4 ++--
 sound/soc/intel/common/soc-acpi-intel-lnl-match.c | 4 ++--
 sound/soc/intel/common/soc-acpi-intel-mtl-match.c | 4 ++--
 sound/soc/intel/common/soc-acpi-intel-ptl-match.c | 6 +++---
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-arl-match.c b/sound/soc/intel/common/soc-acpi-intel-arl-match.c
index 310c4b77c..1d5f6677b 100644
--- a/sound/soc/intel/common/soc-acpi-intel-arl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-arl-match.c
@@ -769,14 +769,14 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_arl_sdw_machines[] = {
 		.link_mask = BIT(0),
 		.links = arl_link_sn6242,
 		.drv_name = "sof_sdw",
-		.sof_tplg_filename = "sof-arl-sn624x.tplg",
+		.sof_tplg_filename = "sof-arl-dummy.tplg",
 		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = BIT(0),
 		.links = arl_link_sn6244,
 		.drv_name = "sof_sdw",
-		.sof_tplg_filename = "sof-arl-sn624x.tplg",
+		.sof_tplg_filename = "sof-arl-dummy.tplg",
 		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{},
diff --git a/sound/soc/intel/common/soc-acpi-intel-lnl-match.c b/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
index cbf79eb2e..a9fef394f 100644
--- a/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
@@ -867,14 +867,14 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_lnl_sdw_machines[] = {
 		.link_mask = BIT(0),
 		.links = lnl_link_sn6242,
 		.drv_name = "sof_sdw",
-		.sof_tplg_filename = "sof-lnl-sn624x.tplg",
+		.sof_tplg_filename = "sof-lnl-dummy.tplg",
 		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = BIT(0),
 		.links = lnl_link_sn6244,
 		.drv_name = "sof_sdw",
-		.sof_tplg_filename = "sof-lnl-sn624x.tplg",
+		.sof_tplg_filename = "sof-lnl-dummy.tplg",
 		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{},
diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
index e89c5cfd6..704b4e0d2 100644
--- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
@@ -1564,14 +1564,14 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_sdw_machines[] = {
 		.link_mask = BIT(0),
 		.links = mtl_link_sn6242,
 		.drv_name = "sof_sdw",
-		.sof_tplg_filename = "sof-mtl-sn624x.tplg",
+		.sof_tplg_filename = "sof-mtl-dummy.tplg",
 		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = BIT(0),
 		.links = mtl_link_sn6244,
 		.drv_name = "sof_sdw",
-		.sof_tplg_filename = "sof-mtl-sn624x.tplg",
+		.sof_tplg_filename = "sof-mtl-dummy.tplg",
 		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{},
diff --git a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
index 0ce51c44b..a5896796a 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
@@ -599,21 +599,21 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_sdw_machines[] = {
 		.link_mask = BIT(3),
 		.links = ptl_link_sn6242,
 		.drv_name = "sof_sdw",
-		.sof_tplg_filename = "sof-ptl-sn624x.tplg",
+		.sof_tplg_filename = "sof-ptl-dummy.tplg",
 		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = BIT(3),
 		.links = ptl_link_sn6244,
 		.drv_name = "sof_sdw",
-		.sof_tplg_filename = "sof-ptl-sn624x.tplg",
+		.sof_tplg_filename = "sof-ptl-dummy.tplg",
 		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = BIT(3),
 		.links = ptl_link_sn6247,
 		.drv_name = "sof_sdw",
-		.sof_tplg_filename = "sof-ptl-sn624x.tplg",
+		.sof_tplg_filename = "sof-ptl-dummy.tplg",
 		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{},
-- 
2.53.0

