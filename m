Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA5E143886
	for <linux-sound@vger.kernel.org>; Fri, 26 Apr 2024 15:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714145143; cv=none; b=dji2SNQE7B/Az0sLrSC4Gzj4KoXT2s4vwrfBkLVf+ng0aOo3ENHRFto+OcXWJ7n9Q/CoeDTRtagT7W6OcWqXYEDU2w4pgI2lt68U0OtZnvBp5uSlz4zXYyT+mG4exChuA3qCbHWmYk7hmBpCiqQ4eb3nDciwmbb4K4VNy6V/bqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714145143; c=relaxed/simple;
	bh=MbT7M4ySziynJAlOypts7f8IrwqccgLvm/YDOfB9l+U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uAnHeCQXMKbHEOCWJJPGs4Kf4C8pVUqnm5k5RFSmmgfxYk5KtBaE4H09Wbx3upU7oOdishTY2vZdz2SoWShnArTcuTYCIpvcb0DbugyfFbIFQMdHOjF4jGxzbFCT7wYOTGI3vaaql5wSClkcfokeymNvp71/n4rL6bN0lWAq4E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MhyvNzIV; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MhyvNzIV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714145142; x=1745681142;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MbT7M4ySziynJAlOypts7f8IrwqccgLvm/YDOfB9l+U=;
  b=MhyvNzIViOPuZXeVz97IwrnrqcSyUUnerhmsja5poblSWuAyMZgV7xds
   VM0IIpUdNu2MFkpEJWhRyK1yBLDhH3GJetii20NRZtvUT2bHgCswk5SF4
   8eUUATung77tz+Iz/hGl0TkICGKIHZYnl4bYn1CLoA1lV+5rEdokCSXwC
   G8EUwzEywoRc3q43IJRDnekXnM1k+cBzVgys1FTGsst5NI/IAnVKj0ZoO
   medvIwz0a0VbKDN/mwOyXf8C67LLOX51b7wiLyaatQMEz0p1HK+XydXm3
   gA8jsmGIpwCvjfldVd3DXmqdhvOEUTPPpeoYNjEBalpHD43uBtFaq5ZCU
   g==;
X-CSE-ConnectionGUID: 2USfh511SrGOUZada42LwQ==
X-CSE-MsgGUID: ZxB7a+lGQD6ge4fUgp06vA==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21291280"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="21291280"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:25:40 -0700
X-CSE-ConnectionGUID: CbqReKXiTheIn/vQXU0kWA==
X-CSE-MsgGUID: PufFyFzFRlOqSwmck007Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="30259539"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.33.33])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:25:40 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 03/23] ASoC: Intel: sof_da7219: support MAX98390
Date: Fri, 26 Apr 2024 10:25:09 -0500
Message-Id: <20240426152529.38345-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
References: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Brent Lu <brent.lu@intel.com>

Add support to Maxim MAX98390 speaker amplifier.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig      | 1 +
 sound/soc/intel/boards/sof_da7219.c | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index b122b8aedd9a..fd1f46fad5eb 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -614,6 +614,7 @@ config SND_SOC_INTEL_SOF_DA7219_MACH
 	select SND_SOC_DA7219
 	select SND_SOC_MAX98357A
 	select SND_SOC_MAX98373_I2C
+	select SND_SOC_MAX98390
 	select SND_SOC_DMIC
 	select SND_SOC_INTEL_SOF_BOARD_HELPERS
 	select SND_SOC_INTEL_SOF_MAXIM_COMMON
diff --git a/sound/soc/intel/boards/sof_da7219.c b/sound/soc/intel/boards/sof_da7219.c
index cbbce07ec5f7..de5b0a8b5b8c 100644
--- a/sound/soc/intel/boards/sof_da7219.c
+++ b/sound/soc/intel/boards/sof_da7219.c
@@ -281,6 +281,9 @@ sof_card_dai_links_create(struct device *dev, struct snd_soc_card *card,
 			return -EINVAL;
 		}
 		break;
+	case CODEC_MAX98390:
+		max_98390_dai_link(dev, ctx->amp_link);
+		break;
 	default:
 		dev_err(dev, "invalid amp type %d\n", ctx->amp_type);
 		return -EINVAL;
@@ -352,6 +355,9 @@ static int audio_probe(struct platform_device *pdev)
 	case CODEC_MAX98373:
 		max_98373_set_codec_conf(&card_da7219);
 		break;
+	case CODEC_MAX98390:
+		max_98390_set_codec_conf(&pdev->dev, &card_da7219);
+		break;
 	case CODEC_MAX98360A:
 	case CODEC_NONE:
 		/* no codec conf required */
-- 
2.40.1

