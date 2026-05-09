Received: from dmail-prod-ay-skadi07.mail.kakao.com (dmail-prod-ay-skadi07.mail.kakao.com [220.64.111.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CEE7382365
	for <linux-sound@vger.kernel.org>; Sat,  9 May 2026 09:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.64.111.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778318763; cv=none; b=Zuvx8U5ETCv1FRtVmTH/zWvSe6j9+OcZZc1X/sUDLlY05KpwwOvc5P8Oz16mXLRI4N6btE9Y1HP2awFxsy81mB1TBJvU/cTEOk2gFsNQaJu5cxkep30M48LCl8Tf/MLOMAbC+loUc5U/DRlL/Z3L16Gvazijo2HjNxoS3qqbTV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778318763; c=relaxed/simple;
	bh=w721HSLkco9vsYCxqL6EWHaCRct9mzzbHS35G2+SjOI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EY3Ts2erIRTysLbTVBjnE0qSkpaUDC7jdr/aA5Su+p29ItYLiUXe7/h/AmdZr0UqnJvycrqOpq6I1mNuCpkD8FVThqaPaLT2J8Oa88MuMHEgNKKiCFOh5bDpHJheiFxHcYWpYnIN6ClxEDOsSxGND8aJINcDGhw7fW6HgOVUzeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=daum.net; spf=pass smtp.mailfrom=daum.net; dkim=pass (1024-bit key) header.d=daum.net header.i=@daum.net header.b=tm7aMu9m; arc=none smtp.client-ip=220.64.111.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=daum.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daum.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=daum.net header.i=@daum.net header.b="tm7aMu9m"
Received: from 220.64.108.54 ([14.7.27.9]) by skadi-sender of skadi-sender-normal-prod-deployment-7f9cb46c58-bs5d7 (10.240.18.165) with HTTP id 20260509175317.DnhjxHczQay7kkp5z6t4lg@vhgksl.daum.net for <linux-sound@vger.kernel.org>; Sat, 09 May 2026 18:26:00 +0900 (KST)
Received: from pyohwan-16Z90U-KU7BK (HELO vhgksl) (14.7.27.9) by skadi-relay with ESMTPA; Sat, 09 May 2026 17:53:17 +0900 (KST)
From: Jang Pyohwan <vhgksl@daum.net>
To: linux-sound@vger.kernel.org
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Mark Brown <broonie@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: Intel: soc-acpi: add LG Gram 16Z90U RT713 + single RT1320 quirk
Date: Sat,  9 May 2026 17:53:10 +0900
Message-ID: <20260509175317.DnhjxHczQay7kkp5z6t4lg@vhgksl.daum.net>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Errors-To: vhgksl@daum.net
X-Kakaomail-MID: 20260509175317.DnhjxHczQay7kkp5z6t4lg@vhgksl.daum.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple; t=1778316790;
	s=1439968795.daum; d=daum.net;
	h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From;
	bh=w721HSLkco9vsYCxqL6EWHaCRct9mzzbHS35G2+SjOI=;
	b=tm7aMu9mGEFATlJRtWVJ89njD+L/AMGFHdKLoOOtwR4WMiyiolNbrLT5Hcc8Q1wZ
	gcpXCDExRHifVtFaSkR3vCx91STCClFBdj3KBK15k6x+hM4n9UREPYsnYd/GDA0QImo
	gS2NX2KPaVzOUfaeFOutFPnmk33UArPXRNUtP84I=

Add a SoundWire machine table entry for the LG Gram Pro 2026
(16Z90U-KU7BK), which has an unusual configuration:

  sdw:0:1:025d:1320:01   single stereo RT1320 SmartAmp on link 1
  sdw:0:3:025d:0713:01   RT713 jack/headset codec on link 3

Existing rt713-rt1320 boards have two RT1320 amps on different links
("link_mask = BIT(1) | BIT(2) | BIT(3)"). The LG Gram uses a single
stereo RT1320 chip, so the new entry uses "link_mask = BIT(1) |
BIT(3)" with the existing rt1320_1_group2_adr structure, leaving the
two-channel routing to the topology.

The RT713 on this board does not expose a SMART_MIC function in
ACPI, so the .machine_check callback used by the existing entries
(snd_soc_acpi_intel_sdca_is_device_rt712_vb) would reject this
board. Drop machine_check for the new entry; speaker output and
the headset jack do not depend on the SMART_MIC presence check.

The corresponding topology source has been submitted to the SOF
project at https://github.com/thesofproject/sof/pull/10760 . The
generated sof-ptl-rt713-l3-rt1320-l1-2ch.tplg and
nhlt-sof-ptl-rt713-l3-rt1320-l1.bin will follow in linux-firmware
once that lands.

Tested on Ubuntu 26.04 with kernel 7.0.0-15: speaker (RT1320
stereo), headphone jack with auto-routing, headset mic, and the
internal NHLT DMIC array all work via the UCM HiFi profile.

Signed-off-by: Jang Pyohwan <vhgksl@daum.net>
---
 .../intel/common/soc-acpi-intel-ptl-match.c   | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
index 3b7818355..ad3af8834 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
@@ -493,6 +493,20 @@ static const struct snd_soc_acpi_link_adr ptl_sdw_rt713_vb_l3_rt1320_l12[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr ptl_sdw_rt713_vb_l3_rt1320_l1[] = {
+	{
+		.mask = BIT(3),
+		.num_adr = ARRAY_SIZE(rt713_vb_3_adr),
+		.adr_d = rt713_vb_3_adr,
+	},
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(rt1320_1_group2_adr),
+		.adr_d = rt1320_1_group2_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_link_adr ptl_sdw_rt712_vb_l2_rt1320_l1[] = {
 	{
 		.mask = BIT(2),
@@ -578,6 +592,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_sdw_machines[] = {
 		.sof_tplg_filename = "sof-ptl-rt713-l3-rt1320-l12.tplg",
 		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
+	{
+		.link_mask = BIT(1) | BIT(3),
+		.links = ptl_sdw_rt713_vb_l3_rt1320_l1,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-ptl-rt713-l3-rt1320-l1.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
+	},
 	{
 		.link_mask = BIT(1) | BIT(2) | BIT(3),
 		.links = ptl_cs42l43_l2_cs35l56x6_l13,
-- 
2.53.0

