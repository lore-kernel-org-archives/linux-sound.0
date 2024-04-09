Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169B41DDEA
	for <linux-sound@vger.kernel.org>; Tue,  9 Apr 2024 08:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712651907; cv=none; b=d98ASHBlYX076mSUKYyzWwTM7wqqf7dZSS1aNYm0zsIufpuMbEug2maPb8etbc8fFEyRPLfCozCOYZ4+TAf2gWNUS/FmIPNkwB5v0Esc61DQ1bNXUaulnTUJVHyOxby5YRTXjWxpxyLOqDcZlTDRYa+sOZc6PrRtu6FCRLvpync=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712651907; c=relaxed/simple;
	bh=BxrzxZ6gdZ7SOPestbE8HkGzulH6cExlBmUpjRRMWso=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oE+il8ZJWO8EVm+gcmR8+x5PtxKcQYAn/9g/p592c+j2LvETh6DI7Q8hVAkRH4nqg0hvwVc92czrDQ4ImMA3LehE/+KfO8aRj6iYzhAwmMW73+YRt8RfNYJfwe/mW2SiAkgHJgGLt0fOr/E2E2lWEGUIVPOLFZakCmf9N2buM8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nVK2CKXi; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nVK2CKXi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712651906; x=1744187906;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BxrzxZ6gdZ7SOPestbE8HkGzulH6cExlBmUpjRRMWso=;
  b=nVK2CKXiDFlcTI8STIPdK1HVn+H4UBWa7pet+1vvRgdE8OeIztznd6MI
   hO//BBFAOD3S7FD0xtuKsJrXAoJUqmJ0CZR/VZjw8eeQ9DvuwMHf1obX4
   B7w0IjEWJ88i/RRFmC088la/D4IcWdc7ITobam2DJZy+UaGYiWOCa+e4f
   faHvddRoNMcQgotYKWhqlqVixsv8CamBtgpCBJH7DdaAz4H/UkjUsDJiT
   TghPJ1+ELhwioP3cRl9dwM0pF4D1WC3ewbfpWAfWC2lR1Ms8+YLhbmx+7
   11TN74ALZ0HTMwtfG0qEX4qy+eoYYGg0+VxXFdpsS/DkZt0FIWR7TmIOz
   Q==;
X-CSE-ConnectionGUID: LEJ1hcAhTG67PBlEuhomnw==
X-CSE-MsgGUID: gircAAtRS46S0YUCKMgqOA==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="19108945"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="19108945"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 01:38:26 -0700
X-CSE-ConnectionGUID: 5i2IMz+YSg6SVXq3vu+qCg==
X-CSE-MsgGUID: PeFMMG5bSRCMF8tDVUbz0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="20189853"
Received: from dpotapen-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.59.81])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 01:38:17 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	liam.r.girdwood@intel.com,
	ranjani.sridharan@linux.intel.com,
	perex@perex.cz
Subject: [PATCH 1/5] ALSA: hda: Introduce flags to force commands via PIO instead of CORB
Date: Tue,  9 Apr 2024 11:38:08 +0300
Message-ID: <20240409083812.14001-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240409083812.14001-1-peter.ujfalusi@linux.intel.com>
References: <20240409083812.14001-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add AZX_DCAPS_PIO_COMMANDS quirk (bit 31) and use_pio_for_commands flag to
be able to select PIO mode as alternative for CORB based command sending
while retaining the RIRB functionality to receive unsolicited responses.

This mode differs from the azx single_cmd mode when RIRB is disabled.

The mixed mode is needed on Lunar Lake family because it is recommended to
use Immediate Command Response (PIO mode) instead of CORB for HDA commands.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 include/sound/hdaudio.h        | 1 +
 sound/pci/hda/hda_controller.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index a73d7f34f4e5..85d2c3d00a27 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -351,6 +351,7 @@ struct hdac_bus {
 	bool needs_damn_long_delay:1;
 	bool not_use_interrupts:1;	/* prohibiting the RIRB IRQ */
 	bool access_sdnctl_in_dword:1;	/* accessing the sdnctl register by dword */
+	bool use_pio_for_commands:1;	/* Use PIO instead of CORB for commands */
 
 	int poll_count;
 
diff --git a/sound/pci/hda/hda_controller.h b/sound/pci/hda/hda_controller.h
index 8556031bcd68..c2d0109866e6 100644
--- a/sound/pci/hda/hda_controller.h
+++ b/sound/pci/hda/hda_controller.h
@@ -45,6 +45,7 @@
 #define AZX_DCAPS_CORBRP_SELF_CLEAR (1 << 28)	/* CORBRP clears itself after reset */
 #define AZX_DCAPS_NO_MSI64      (1 << 29)	/* Stick to 32-bit MSIs */
 #define AZX_DCAPS_SEPARATE_STREAM_TAG	(1 << 30) /* capture and playback use separate stream tag */
+#define AZX_DCAPS_PIO_COMMANDS (1 << 31)	/* Use PIO instead of CORB for commands */
 
 enum {
 	AZX_SNOOP_TYPE_NONE,
-- 
2.44.0

