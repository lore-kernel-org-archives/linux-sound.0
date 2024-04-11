Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749F23BBC2
	for <linux-sound@vger.kernel.org>; Thu, 11 Apr 2024 22:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712873056; cv=none; b=Qof3lopcPQGLBCxi/UXUw9VltILA+pUMbkCs04v5GaRDkwztFdXQqxCPcmxSSOfqv3aGBl9XXEl60ag+ZSIUKr2PqWFgrtNJCjkZA+3gCU9NgiVWUEjP1f8YP9Y7nOf1O+gpshocNPIsW4s4ASsolQ48AGooOiFmArONZNWefR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712873056; c=relaxed/simple;
	bh=c6lstUGBF8ul5qNCqvj7138ObR+8fKLSLVj5b2moD88=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Utb+Pe/4ZGlU5/OltQGEIM+OndETnMZr2GHyCV/H9B+HGvA8zPdQcTvw3g48BFHzifTnIeJee52n13hIXYU1cnLwbIl1eOgWdTet0fKOshOKrARCg/LiiCjEL/iuG6zXHrwLT1jfqJ4569XXVIxEEeSHkg4RIolmT5k6GLFFieQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hz9u9jJ5; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hz9u9jJ5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712873055; x=1744409055;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=c6lstUGBF8ul5qNCqvj7138ObR+8fKLSLVj5b2moD88=;
  b=hz9u9jJ5nximh58cCSVnxBWduzdQH/IkBQqw0c0Wy70hXGxZseGMEEVw
   HnV7CsTlRtbU+3KpFXjWSurMZh3JBPqUQJeems0SoTVCarBWSIHp5zWgp
   qc8NfhhdTPpQYMyHsWke7UhNt4RbktZwiLtOe9DnRQPSuL9iWpJ+242Ex
   /BNxbguxY+gcJeUW0OKgEOTfp7fqqs+b3TPqgpNuNCem3QEbgs7+ve8I1
   JtNMaY5z2ytmimxj1uHOW8nBuvb7Afv1FuXFJjCy1B8gH39h6oK0dqogz
   q3fmt8VdC39dTnokCsyyZa8gW8+loi5QopWAXTaGMnUS1s6xqjMTPRsVx
   Q==;
X-CSE-ConnectionGUID: gLmlzcmTS3uC4XIj6mgxSQ==
X-CSE-MsgGUID: UZ2V0e8rRrOpQfoABbveKg==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="19708351"
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000"; 
   d="scan'208";a="19708351"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 15:04:14 -0700
X-CSE-ConnectionGUID: wyCfV3lnR46/qELWVn/wlw==
X-CSE-MsgGUID: pRbaKG5sQoaDEYfLkevyFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000"; 
   d="scan'208";a="21628733"
Received: from aramana1-mobl.amr.corp.intel.com (HELO pbossart-mobl6.lan) ([10.213.177.233])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 15:04:14 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 04/12] ASoC: Intel: sof_sdw: add quirk for Dell SKU 0C0F
Date: Thu, 11 Apr 2024 17:03:39 -0500
Message-Id: <20240411220347.131267-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240411220347.131267-1-pierre-louis.bossart@linux.intel.com>
References: <20240411220347.131267-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The JD1 jack detection doesn't seem to work, use JD2.
Also use the 4 speaker configuration.

Link: https://github.com/thesofproject/linux/issues/4900
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index f191dc72bc3d..6253fc464198 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -432,6 +432,16 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 					RT711_JD2 |
 					SOF_SDW_FOUR_SPK),
 	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0C0F")
+		},
+		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
+					RT711_JD2 |
+					SOF_SDW_FOUR_SPK),
+	},
 	{
 		.callback = sof_sdw_quirk_cb,
 		.matches = {
-- 
2.40.1

