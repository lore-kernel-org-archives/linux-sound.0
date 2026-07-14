Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DF336C5B2;
	Tue, 14 Jul 2026 01:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783993496; cv=none; b=V5wX7Cz/VMftyREQQ7LPc31HLLDTRvYQ2T9J6KW01/caEzqt8609p92YHd4USBDUCmp8E4AIrL4wJRpCQLGRVOk3fOUvMn8UeVTvaNEfp1cq2XmLuD1fA+lnTm/rgRcN6hA008kfwRCxC/V7+9chCnIJpN+V4XZJ2sTdmeQVGPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783993496; c=relaxed/simple;
	bh=iM6XDWXFk9WfxulgOgLlCHNbNQH7b6XOeb5QnGFkjQg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iQJVrhJMuIpJa8nfwnOm2KELjb1907XOGf54AbuEvEh+JeuJ8jGX6Rc/3OjFUtdD902EmYZUOXG7Tb5fCaX785FS+5H0saQapYA4XAz6FiEOw1/Bbnk16f+eFoeQu3Hnkx54Z6ge6E7R9p7Ca+ikCnXC1KSMfeRrfD83CEkiinE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=MHi6NKyN; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="MHi6NKyN"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=YTu8Os74RYPgh3GgwSwVyQyyad+a4ItU+8/NSbypv4o=; b=MHi6NKyN0kkMe0gEN8StAN+8Y0
	0YQG7sh0a2wyB52FRPlsyWkstP+Be174lrAeamIhKJ84ba7zf3vLTOdq6GCEfOopM7TheSZ2hOuMb
	tdGeQDnrtrUPAMjY9uwYGG49vrn7kUkWPVFTWuCwmL5hIbfUPgU0jQdxFa7suZ6mu2E/AXu10kcCP
	zWEBY24n4AfD3jihcw2onUIkNA5hqTPSB4o4Q7JWh5Zxm36i9BtURkZ5TG5QjkiGV/2QuqtMr/TFC
	L8eFysROFIB6WBCBD76nijKOJ0/9FO0hdulST1xIJmzaAChq0S2ibDcVfxP8LPnMbmbTVhaJZSWIW
	OuNanVeQ==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjSCb-0000000AgsR-2XK9;
	Tue, 14 Jul 2026 01:44:53 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-sound@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	linuxppc-dev@lists.ozlabs.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Maciej Strozek <mstrozek@opensource.cirrus.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	patches@opensource.cirrus.com,
	Srinivas Kandagatla <srini@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 11/14] ASoC: soc-acpi: fix all kernel-doc warnings
Date: Mon, 13 Jul 2026 18:44:42 -0700
Message-ID: <20260714014445.569992-12-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260714014445.569992-1-rdunlap@infradead.org>
References: <20260714014445.569992-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing "struct" keyword to kernel-doc for structs.
Describe @mach_params in struct snd_soc_acpi_mach.
Don't document callback parameters with '@' as though they are kernel-doc.

These changes avoid all kernel-doc warnings in this header file.

Examples:
Warning: ../include/sound/soc-acpi.h:77 cannot understand function prototype: 'struct snd_soc_acpi_mach_params'
Warning: ../include/sound/soc-acpi.h:101 cannot understand function prototype: 'struct snd_soc_acpi_endpoint'
Warning: ../include/sound/soc-acpi.h:115 cannot understand function prototype: 'struct snd_soc_acpi_adr_device'
Warning: ../include/sound/soc-acpi.h:132 cannot understand function prototype: 'struct snd_soc_acpi_link_adr'
Warning: ../include/sound/soc-acpi.h:209 cannot understand function prototype: 'struct snd_soc_acpi_mach'

Warning: include/sound/soc-acpi.h:230 struct member 'mach_params' not described in 'snd_soc_acpi_mach'
Warning: include/sound/soc-acpi.h:230 Excess struct member 'card' description in 'snd_soc_acpi_mach'
Warning: include/sound/soc-acpi.h:230 Excess struct member 'mach' description in 'snd_soc_acpi_mach'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>

 include/sound/soc-acpi.h |   23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

--- linext-2026-0710.orig/include/sound/soc-acpi.h
+++ linext-2026-0710/include/sound/soc-acpi.h
@@ -57,7 +57,7 @@ static inline struct snd_soc_acpi_mach *
 #endif
 
 /**
- * snd_soc_acpi_mach_params: interface for machine driver configuration
+ * struct snd_soc_acpi_mach_params - interface for machine driver configuration
  *
  * @acpi_ipc_irq_index: used for BYT-CR detection
  * @platform: string used for HDAudio codec support
@@ -93,7 +93,7 @@ struct snd_soc_acpi_mach_params {
 };
 
 /**
- * snd_soc_acpi_endpoint - endpoint descriptor
+ * struct snd_soc_acpi_endpoint - endpoint descriptor
  * @num: endpoint number (mandatory, unique per device)
  * @aggregated: 0 (independent) or 1 (logically grouped)
  * @group_position: zero-based order (only when @aggregated is 1)
@@ -107,7 +107,7 @@ struct snd_soc_acpi_endpoint {
 };
 
 /**
- * snd_soc_acpi_adr_device - descriptor for _ADR-enumerated device
+ * struct snd_soc_acpi_adr_device - descriptor for _ADR-enumerated device
  * @adr: 64 bit ACPI _ADR value
  * @num_endpoints: number of endpoints for this device
  * @endpoints: array of endpoints
@@ -121,7 +121,7 @@ struct snd_soc_acpi_adr_device {
 };
 
 /**
- * snd_soc_acpi_link_adr - ACPI-based list of _ADR enumerated devices
+ * struct snd_soc_acpi_link_adr - ACPI-based list of _ADR enumerated devices
  * @mask: one bit set indicates the link this list applies to
  * @num_adr: ARRAY_SIZE of devices
  * @adr_d: array of devices
@@ -167,8 +167,8 @@ struct snd_soc_acpi_link_adr {
 #define SND_SOC_ACPI_TPLG_INTEL_CODEC_NAME BIT(4)
 
 /**
- * snd_soc_acpi_mach: ACPI-based machine descriptor. Most of the fields are
- * related to the hardware, except for the firmware and topology file names.
+ * struct snd_soc_acpi_mach - ACPI-based machine descriptor. Most of the fields
+ * are related to the hardware, except for the firmware and topology file names.
  * A platform supported by legacy and Sound Open Firmware (SOF) would expose
  * all firmware/topology related fields.
  *
@@ -192,6 +192,7 @@ struct snd_soc_acpi_link_adr {
  * the initial selection in the snd_soc_acpi_mach table.
  * @pdata: intended for platform data or machine specific-ops. This structure
  *  is not constant since this field may be updated at run-time
+ * @mach_params: machine driver configuration
  * @sof_tplg_filename: Sound Open Firmware topology file name, if enabled
  * @tplg_quirk_mask: quirks to select different topology files dynamically
  * @get_function_tplg_files: This is an optional callback, if specified then instead of
@@ -199,11 +200,11 @@ struct snd_soc_acpi_link_adr {
  *	files to be loaded.
  *	Return value: The number of the files or negative ERRNO. 0 means that the single topology
  *		      file should be used, no function topology split can be used on the machine.
- *	@card: the pointer of the card
- *	@mach: the pointer of the machine driver
- *	@prefix: the prefix of the topology file name. Typically, it is the path.
- *	@tplg_files: the pointer of the array of the topology file names.
- *	@best_effort: ignore non supported links and try to build the card in best effort
+ *	card: the pointer of the card
+ *	mach: the pointer of the machine driver
+ *	prefix: the prefix of the topology file name. Typically, it is the path.
+ *	tplg_files: the pointer of the array of the topology file names.
+ *	best_effort: ignore non supported links and try to build the card in best effort
  *		      with supported links
  */
 /* Descriptor for SST ASoC machine driver */
