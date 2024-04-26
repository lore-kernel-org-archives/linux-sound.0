Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDDC18C1F
	for <linux-sound@vger.kernel.org>; Fri, 26 Apr 2024 15:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714145957; cv=none; b=LrScE8SQxOEte2dVqiP/93SbkQ1KoHCLzOXz9Mntdz4hajUbEzWF04sdqasJOBczCI+Cu0zYjpmuoSZog0TDUeF4YTuHIrsLbRiPOGpcYWNhN2Ydrhp+quPaP9yo/mk3uR3ThqrRJrmihXGTsV4Yf2b0ZfjNznQ5T29EFcqcZyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714145957; c=relaxed/simple;
	bh=UQPrNln96b4xHk91nmowdoB7FfPTrZkZDGSoZjVsfKg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ayqywviLT1AIT9Eifref6uQzMQ6tg4E5QpkVf23lLhbeA+HphhW1SlF7/r57R/5Q3F/0P4+8W0nikRDnWgH2kLHsQxV1rsL/fbQ2e+xADkv5dq32R8iInO46HsTT8U3xOeo3w4h1F1L66ryLcEwlxn/NQL997ru5p6bwPnGiDw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e/1St6qG; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e/1St6qG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714145956; x=1745681956;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UQPrNln96b4xHk91nmowdoB7FfPTrZkZDGSoZjVsfKg=;
  b=e/1St6qGjNINot5s/bNbteJ8xEdJyZFzCqoyQ6KJtyJJagP5ncoZy61C
   4xvM88pLVdGugZhdIHaTfvnL8Z2cMR+26SRia/EOm9xuzdp1q5emYj4hn
   nOc9HcgnzblUye6L7VJAImpZUNWXHwiUfBQ1MBCgkDogQDW15VuP+JbcY
   EPF4UlpVUE3aDyooHkwEh13HT1GuP+pr41TTQFdVkoV7adaLyFDrBMK9Z
   v0Ei2cpw/OYKcgB7Rk/CV8UN1gDSMGwqKQSrKsrJmM7P27460NyVPmNBX
   tY8xSN49vSbBnHTY6sMKLk0Pq6T17B2VEkVfi2Tgh1B6NQb7URTvI0Bme
   g==;
X-CSE-ConnectionGUID: taxGYrtqQbCuiP+gc/M+PQ==
X-CSE-MsgGUID: FXuZPImrToeRTI4xbmFzGQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="9718445"
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000"; 
   d="scan'208";a="9718445"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:39:11 -0700
X-CSE-ConnectionGUID: 9njKNL6uTtKogg1KL4lPsQ==
X-CSE-MsgGUID: 6PJtELB4S26GsJ9+ow8Qsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000"; 
   d="scan'208";a="56623542"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.33.33])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:39:11 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 4/5] ASoC: SOF: Intel: hda: list SoundWire peripherals on mismatch
Date: Fri, 26 Apr 2024 10:39:01 -0500
Message-Id: <20240426153902.39560-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240426153902.39560-1-pierre-louis.bossart@linux.intel.com>
References: <20240426153902.39560-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Most of the SoundWire support issues come from bad ACPI information,
or configuration reported by ACPI that are not supported by the SOF
driver/topology. The users see a "No SoundWire machine driver found"
message without any details, and the fallback to HDaudio w/ HDMI is
used.

We can reduce our support load with a clear dev_info() log that will
give us a clear hint on the mismatch and why a machine driver/topology
were not found.

Example log on a MTL device:
[   13.158599] sof-audio-pci-intel-mtl 0000:00:1f.3: No SoundWire machine driver found for the ACPI-reported configuration:
[   13.158603] sof-audio-pci-intel-mtl 0000:00:1f.3: link 0 mfg_id 0x025d part_id 0x0713 version 0x3
[   13.158606] sof-audio-pci-intel-mtl 0000:00:1f.3: link 1 mfg_id 0x025d part_id 0x1316 version 0x3
[   13.158608] sof-audio-pci-intel-mtl 0000:00:1f.3: link 2 mfg_id 0x025d part_id 0x1316 version 0x3

In parallel, we will also provide an update to `alsa-info` to log all
SoundWire peripherals found in ACPI tables.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/hda.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 8ddc1b0ca3c9..8ac8c10b83bd 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1645,6 +1645,7 @@ static struct snd_soc_acpi_mach *hda_sdw_machine_select(struct snd_sof_dev *sdev
 {
 	struct snd_sof_pdata *pdata = sdev->pdata;
 	const struct snd_soc_acpi_link_adr *link;
+	struct sdw_extended_slave_id *ids;
 	struct snd_soc_acpi_mach *mach;
 	struct sof_intel_hda_dev *hdev;
 	u32 link_mask;
@@ -1658,6 +1659,16 @@ static struct snd_soc_acpi_mach *hda_sdw_machine_select(struct snd_sof_dev *sdev
 		return NULL;
 	}
 
+	if (!hdev->sdw) {
+		dev_dbg(sdev->dev, "SoundWire context not allocated\n");
+		return NULL;
+	}
+
+	if (!hdev->sdw->num_slaves) {
+		dev_warn(sdev->dev, "No SoundWire peripheral detected in ACPI tables\n");
+		return NULL;
+	}
+
 	/*
 	 * Select SoundWire machine driver if needed using the
 	 * alternate tables. This case deals with SoundWire-only
@@ -1740,7 +1751,11 @@ static struct snd_soc_acpi_mach *hda_sdw_machine_select(struct snd_sof_dev *sdev
 		return mach;
 	}
 
-	dev_info(sdev->dev, "No SoundWire machine driver found\n");
+	dev_info(sdev->dev, "No SoundWire machine driver found for the ACPI-reported configuration:\n");
+	ids = hdev->sdw->ids;
+	for (i = 0; i < hdev->sdw->num_slaves; i++)
+		dev_info(sdev->dev, "link %d mfg_id 0x%04x part_id 0x%04x version %#x\n",
+			 ids[i].link_id, ids[i].id.mfg_id, ids[i].id.part_id, ids[i].id.sdw_version);
 
 	return NULL;
 }
-- 
2.40.1

