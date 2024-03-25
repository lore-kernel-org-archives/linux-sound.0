Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6AC76045
	for <linux-sound@vger.kernel.org>; Mon, 25 Mar 2024 22:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711404690; cv=none; b=Acm0hQwQ7oq+V69tSW0+5FhUmJIO8MCrSi42vZZcEo4LIucL1taRsWBl0RBlBn6TonAgly0mBMgQmN99vx8NWkbzhELMU3ek0Z2+8K5ezzRHefqJuF9btPv+QsgkUuKlSQOSjhkHp8x9IMaSR464DqheqzwfcAwni9ZbUTZrxAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711404690; c=relaxed/simple;
	bh=gQL3YXeDyA5WniIBUY3v0SIELfeKyoQhHUp8fHkCRPY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Y3MetXB9sFBumAAjIR/2hkPziznzxyawAMLoJKjbyRUaUhpSB73AxOYGIH4MJ7XB/Ybg07nv0it2FUbHtjdEeoxu9FS7E3X+Wx7nLxhmRIj/g59j7SzHOqbrQt1A9lslYNaaXSBF6qahKz+tBLufn0TLcwVbTSBfvs/5fgnv2aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ALKjiMZM; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ALKjiMZM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711404689; x=1742940689;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gQL3YXeDyA5WniIBUY3v0SIELfeKyoQhHUp8fHkCRPY=;
  b=ALKjiMZMeIqxn5q+WCzGBTOYFPjUmn73FdQFMg5cCtfSJSoM+pt7zvqs
   J6QScKUAUu8o56nypkKZx+q4bTxpE9ERnN11HGPg7c0PqlFsIjkArYJd1
   QEFtCy7PlDoA5acGu8wejjMdsrvQ4f4MYay658Fhfxng5YGv1M4e+m+yJ
   9E33swoRfz6l0+E2JuUvOmuCq4vsf8+jIk3YBEbmKB3W+IAyh9rX1aTnH
   yptNzi4Y+eyG1/MLghNSNgiuqmRphpCfBunMStckEFJnfiwmH4zckoXRY
   QNC0SK7L5ohkgYkIjYQAKUJAFrVqv2rA89SRtwfhZgw5mx5W1gnt96vhv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6643693"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="6643693"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 15:11:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="15722182"
Received: from jaimbres-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.lan) ([10.212.98.109])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 15:11:27 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 20/21] ASoC: Intel: sof_nau8825: remove sof_nau8825 board id
Date: Mon, 25 Mar 2024 17:10:58 -0500
Message-Id: <20240325221059.206042-21-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240325221059.206042-1-pierre-louis.bossart@linux.intel.com>
References: <20240325221059.206042-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Brent Lu <brent.lu@intel.com>

Remove sof_nau8825 board id and use adl_nau8825_def instead since SSP
port assignment is the same.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_nau8825.c              | 14 +++-----------
 sound/soc/intel/common/soc-acpi-intel-adl-match.c |  2 +-
 2 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/sound/soc/intel/boards/sof_nau8825.c b/sound/soc/intel/boards/sof_nau8825.c
index b9db6e236a93..23fe8b4015cc 100644
--- a/sound/soc/intel/boards/sof_nau8825.c
+++ b/sound/soc/intel/boards/sof_nau8825.c
@@ -271,10 +271,10 @@ static int sof_audio_probe(struct platform_device *pdev)
 	case CODEC_RT1015P:
 		sof_rt1015p_codec_conf(&sof_audio_card_nau8825);
 		break;
+	case CODEC_MAX98360A:
+	case CODEC_NAU8318:
+	case CODEC_RT1019P:
 	case CODEC_NONE:
-	case CODEC_MAX98360A:
-	case CODEC_NAU8318:
-	case CODEC_RT1019P:
 		/* no codec conf required */
 		break;
 	default:
@@ -297,14 +297,6 @@ static int sof_audio_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id board_ids[] = {
-	{
-		.name = "sof_nau8825",
-		.driver_data = (kernel_ulong_t)(SOF_SSP_PORT_CODEC(0) |
-					SOF_NUM_IDISP_HDMI(4) |
-					SOF_SSP_PORT_BT_OFFLOAD(2) |
-					SOF_BT_OFFLOAD_PRESENT),
-
-	},
 	{
 		.name = "adl_rt1019p_8825",
 		.driver_data = (kernel_ulong_t)(SOF_SSP_PORT_CODEC(0) |
diff --git a/sound/soc/intel/common/soc-acpi-intel-adl-match.c b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
index 6c710e9a26f1..7ce8aade07d7 100644
--- a/sound/soc/intel/common/soc-acpi-intel-adl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
@@ -563,7 +563,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
 	},
 	{
 		.id = "10508825",
-		.drv_name = "sof_nau8825",
+		.drv_name = "adl_nau8825_def",
 		.sof_tplg_filename = "sof-adl-nau8825.tplg",
 	},
 	{
-- 
2.40.1

