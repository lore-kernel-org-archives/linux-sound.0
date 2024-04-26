Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA63824B3
	for <linux-sound@vger.kernel.org>; Fri, 26 Apr 2024 15:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714145317; cv=none; b=IlmEioCcaZ0ruzcpsNZajVZ5dFp/8cJ3jxC7CBUYyq2rsBZniz3IsoB+fABc48fmh6RFO0MgQM2MWHd34jnnDk1aUF2n+5EWHg12T//FSvYn++kRoP+vqRQ8SC0APsRR/6TIB4vNHhJjV4q+Ydl3r8RK25WgMkmmQ0/Brv0RCVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714145317; c=relaxed/simple;
	bh=V8qQRyxQ4EsnHZfZSyfBBhj9fV9onTfLS3y/sSthVA8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=WtsjkNmLbXXawbG2Hc0TssLnq/Jzz4CYuEFCK9oo9/fhcRFukkBk5JhFAbHUfaLBudMNFL7t7JxcVhNrVJ94dnlRUr0Fs4CEPgDL26p1qodiBlHu98ToajZyNVxIR3zl+fKJamM577GOewk+Q/gFYqslH1vTUynkF8ItIYkTyds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OMfOVYeq; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OMfOVYeq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714145316; x=1745681316;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=V8qQRyxQ4EsnHZfZSyfBBhj9fV9onTfLS3y/sSthVA8=;
  b=OMfOVYeq0FVQCUKhAqFkyGb/ckP37u+ZAEtS2Mc4Q6r5VcAyyXfDDJ98
   nVF6VevFjruLU/4Mc4YHU1+TWPe4s8fnuE2xbktXpzehsvpNK87UYTgpV
   YBOQS0jn8mTrtkY7a8apb98/DlK3DJDlUBsWmJ9Jaj8MmiWMT7FMOiZ7m
   /KtsAAZo3IlxIuUiJE54tHYB0GQP9UcuqYxKdiIpF4UJvIWUm8K0iXJuB
   hGxXF1T/MaD8IWKe6gKnPKSJbz/KA1tx5dYWSsVGnt6BtghfF+krIy/NW
   pXWG0iWyJY7dcAHzDxBcURZZiDRp4XP5t9XTqELLX1JQ4TNx6Z/JRgnBT
   A==;
X-CSE-ConnectionGUID: zgwMmVHGSi+MiKbOAX7hpQ==
X-CSE-MsgGUID: JXiVsWs8RQmf203Yf2QMEw==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="35272027"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="35272027"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:28:36 -0700
X-CSE-ConnectionGUID: RGMX/zuFRkCGAmcJrRUCCA==
X-CSE-MsgGUID: 7bCb/w8wQNqlD2D0P90Y3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="25523682"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.33.33])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:28:35 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Subject: [PATCH] ALSA: hda: intel-dsp-config: harden I2C/I2S codec detection
Date: Fri, 26 Apr 2024 10:28:18 -0500
Message-Id: <20240426152818.38443-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The SOF driver is selected whenever specific I2C/I2S HIDs are reported
as 'present' in the ACPI DSDT. In some cases, an HID is reported but
the hardware does not actually rely on I2C/I2S.  This false positive
leads to an invalid selection of the SOF driver and as a result an
invalid topology is loaded.

This patch hardens the detection with a check that the NHLT table is
consistent with the report of an I2S-based codec in DSDT. This table
should expose at least one SSP endpoint configured for an I2S-codec
connection.

Tested on Huawei Matebook D14 (NBLB-WAX9N) using an HDaudio codec with
an invalid ES8336 ACPI HID reported:

[    7.858249] snd_hda_intel 0000:00:1f.3: DSP detected with PCI class/subclass/prog-if info 0x040380
[    7.858312] snd_hda_intel 0000:00:1f.3: snd_intel_dsp_find_config: no valid SSP found for HID ESSX8336, skipped

Reported-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Tested-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Closes: https://github.com/thesofproject/linux/issues/4934
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/hda/intel-dsp-config.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
index 6a384b922e4f..d1f6cdcf1866 100644
--- a/sound/hda/intel-dsp-config.c
+++ b/sound/hda/intel-dsp-config.c
@@ -557,9 +557,32 @@ static const struct config_entry *snd_intel_dsp_find_config
 		if (table->codec_hid) {
 			int i;
 
-			for (i = 0; i < table->codec_hid->num_codecs; i++)
-				if (acpi_dev_present(table->codec_hid->codecs[i], NULL, -1))
+			for (i = 0; i < table->codec_hid->num_codecs; i++) {
+				struct nhlt_acpi_table *nhlt;
+				bool ssp_found = false;
+
+				if (!acpi_dev_present(table->codec_hid->codecs[i], NULL, -1))
+					continue;
+
+				nhlt = intel_nhlt_init(&pci->dev);
+				if (!nhlt) {
+					dev_warn(&pci->dev, "%s: NHLT table not found, skipped HID %s\n",
+						 __func__, table->codec_hid->codecs[i]);
+					continue;
+				}
+
+				if (intel_nhlt_has_endpoint_type(nhlt, NHLT_LINK_SSP) &&
+				    intel_nhlt_ssp_endpoint_mask(nhlt, NHLT_DEVICE_I2S))
+					ssp_found = true;
+
+				intel_nhlt_free(nhlt);
+
+				if (ssp_found)
 					break;
+
+				dev_warn(&pci->dev, "%s: no valid SSP found for HID %s, skipped\n",
+					 __func__, table->codec_hid->codecs[i]);
+			}
 			if (i == table->codec_hid->num_codecs)
 				continue;
 		}
-- 
2.40.1

