Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493D4263F54
	for <linux-sound@vger.kernel.org>; Thu, 19 Jun 2025 08:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750322548; cv=none; b=TmqjYD5K7qvnIzgra9x2a/5rpvEUDLXSq9XHenFvfj80INVgBMILUz/39J1BZMrItI0mVm7PKJ7Jfgbkr4gF09cxBKXzxwG4qWfVoJcUaWuB886OsUekVrMs5jtj3D7KMFiZb9IrkhBPw94kIcuiuToZQuBsnlm9/uxJVO4uwCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750322548; c=relaxed/simple;
	bh=XO3gosQEOWgj9ikDPsIt8ZOs2665OmEMXI0h3XjRzsA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PNz1h3tIWxo7wv5YmugYSOh0I5CzF2nU5z7lXFtikOwpiaOOFCWIUlRxSCXkVlThhWa5Gd9tv1n+i8rX0y/v07OUerM7HqlC+cQB7OdlAfTEvJErXJSddsc5bfoE959xj5fJaNXjt/QfDoKHAXOQ3kN0e0mOaFbQ6oFiP3A8kYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YnMKd30B; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YnMKd30B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750322548; x=1781858548;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XO3gosQEOWgj9ikDPsIt8ZOs2665OmEMXI0h3XjRzsA=;
  b=YnMKd30BiJTBa5vejTr+cafvHyXBbxxGJ3SRmG2prdbwMhXlU22H6tx+
   WrYOn6Vtvha3X+SSGWoIoYtlVPERAIkNNLyKWM/H5BbMIpaHLgR/zMI04
   kRyRmHwPBFjPb6WdvkevAbUWwUdooBBk+rtuXhXsezXZfXGht+NmwSUSc
   IaeWpogVqEDjBUrI/1Wbd8tqpVzVfM+y6BfGZKYeSsrnMzXyuV1u2vKe7
   8PCKHuw2MJWy4MJ6bsqE9WY82jNj6mOKUm2K6zZdan0hfvonaIC2lI602
   bOuaH1V0h8R33xjqNvHsH8TYIYv9rYnEYP43Bw9h6bZqKZtC4VqSCY/sB
   Q==;
X-CSE-ConnectionGUID: 4OVS+VA5TjSNroKspK9u1Q==
X-CSE-MsgGUID: BYlQsaeoQFeqrEM31OWg8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52491143"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="52491143"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 01:42:27 -0700
X-CSE-ConnectionGUID: FTTyjb6ZSy+iHk37fK70xQ==
X-CSE-MsgGUID: q7PKYvGQSPSQma9NYMFlZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="151225022"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.182])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 01:42:25 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev
Subject: [PATCH 3/4] ASoC: Intel: skl_hda_dsp_generic: Implement add_dai_link to filter HDMI PCMs
Date: Thu, 19 Jun 2025 11:42:21 +0300
Message-ID: <20250619084222.559-4-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250619084222.559-1-peter.ujfalusi@linux.intel.com>
References: <20250619084222.559-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the system does not have iDisp codec then mark the HDMI PCM link as
ignore.
This ensures that HDMI PCMs will not be created when there is no iDisp
codec available.

When iDisp codec is not present and the HDMI PCMs were created they were
not operational, all operations would fail on them.

With this patch it is possible to load the topology with HDMI links, but
gives the ability to ignore them and thus prevent the creation of the
nonworking PCM devices.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/intel/boards/skl_hda_dsp_generic.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/soc/intel/boards/skl_hda_dsp_generic.c b/sound/soc/intel/boards/skl_hda_dsp_generic.c
index 0554c7e2cb34..519218385fdf 100644
--- a/sound/soc/intel/boards/skl_hda_dsp_generic.c
+++ b/sound/soc/intel/boards/skl_hda_dsp_generic.c
@@ -85,6 +85,18 @@ skl_hda_get_board_quirk(struct snd_soc_acpi_mach_params *mach_params)
 	return board_quirk;
 }
 
+static int skl_hda_add_dai_link(struct snd_soc_card *card,
+				struct snd_soc_dai_link *link)
+{
+	struct sof_card_private *ctx = snd_soc_card_get_drvdata(card);
+
+	/* Ignore the HDMI PCM link if iDisp is not present */
+	if (strstr(link->stream_name, "HDMI") && !ctx->hdmi.idisp_codec)
+		link->ignore = true;
+
+	return 0;
+}
+
 static int skl_hda_audio_probe(struct platform_device *pdev)
 {
 	struct snd_soc_acpi_mach *mach = pdev->dev.platform_data;
@@ -101,6 +113,7 @@ static int skl_hda_audio_probe(struct platform_device *pdev)
 	card->owner = THIS_MODULE;
 	card->fully_routed = true;
 	card->late_probe = skl_hda_card_late_probe;
+	card->add_dai_link = skl_hda_add_dai_link;
 
 	dev_dbg(&pdev->dev, "board_quirk = %lx\n", board_quirk);
 
-- 
2.49.0

