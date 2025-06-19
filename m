Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC85263F54
	for <linux-sound@vger.kernel.org>; Thu, 19 Jun 2025 08:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750322551; cv=none; b=WjcnfxmYM+KSitPkrbI9Qo5mt2he6WYD96VAzT7ZSX1iu5LMU60Bfr2pkJQ2hvlJ3kd3jSN+OqZI/yyRiy9pzHD/w74bMu6mGBo8xeUTO4OcKSmRWUXHcjEWwJDfzlmZLR0X/V8EqYB9eBr7yfJTvBoMoqbBXvmUaj8YxstZ07I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750322551; c=relaxed/simple;
	bh=nPwkDDJgAJnhtA5oH4sS+s2/D7veSWcauggHmwetIvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WJI191jpys944ou9G7uCQSEdxA6HXj8gPE6iofhpTt4mq5iyhMRhgo0jT/A6XJQpPM8e2+R0qg6wjoJWk0KGE3Tq/7Cv9ZBsq9LCa+nzbXXLuTqyDYBkqg7atfuqrq6rc1tg4/BYMwmd+3dq50DRA0eVaJ0lANHVyGXYC3IDRIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HZjsIFqp; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HZjsIFqp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750322550; x=1781858550;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nPwkDDJgAJnhtA5oH4sS+s2/D7veSWcauggHmwetIvo=;
  b=HZjsIFqptFX+1B6FQgakfDRtZzZOwTDDEH0KIkvC3ZT+7SWGKHBmhmbl
   qXw1kL2byxxkeYyTBmmxfczOxiOLr+Z1zluvSl+WhMDl/3hYpHR+UO89x
   cDea0mXRzW/pt5qcBVKfOurmcqD84bIapmnpU8oiYKZ/WeIA9KdAA+yAx
   3L545Be3zBOenSnYNmee1pO7rg+9uPd4fTs2aEV5B/bD9CEl8PEth1aZH
   EFOgh3g3AivJpMhvNLOaIr9OjOLg7wXevwtqu5mJe9jvMS9CbTByrNlQ5
   2pdGaMzqJkebTieo3uoKI69vDZ6k5egvG8QLloCKkyNCvbAKxXfWWDH95
   A==;
X-CSE-ConnectionGUID: Xg3J+wAeSLSQamLX2lzIBw==
X-CSE-MsgGUID: xRPS853PRg6ounHXDR+Cgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52491151"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="52491151"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 01:42:30 -0700
X-CSE-ConnectionGUID: c0SL4QQwQuGX0JiGgWZAbA==
X-CSE-MsgGUID: ZwVIZdDpQEKVWpkiA0ZKnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="151225051"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.182])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 01:42:27 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev
Subject: [PATCH 4/4] ASoC: Intel: sof_sdw: Implement add_dai_link to filter HDMI PCMs
Date: Thu, 19 Jun 2025 11:42:22 +0300
Message-ID: <20250619084222.559-5-peter.ujfalusi@linux.intel.com>
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
 sound/soc/intel/boards/sof_sdw.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 81a914bd7ec2..05d13bacf88a 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1295,6 +1295,19 @@ static int sof_sdw_card_late_probe(struct snd_soc_card *card)
 	return ret;
 }
 
+static int sof_sdw_add_dai_link(struct snd_soc_card *card,
+				struct snd_soc_dai_link *link)
+{
+	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct intel_mc_ctx *intel_ctx = (struct intel_mc_ctx *)ctx->private;
+
+	/* Ignore the HDMI PCM link if iDisp is not present */
+	if (strstr(link->stream_name, "HDMI") && !intel_ctx->hdmi.idisp_codec)
+		link->ignore = true;
+
+	return 0;
+}
+
 static int mc_probe(struct platform_device *pdev)
 {
 	struct snd_soc_acpi_mach *mach = dev_get_platdata(&pdev->dev);
@@ -1321,6 +1334,7 @@ static int mc_probe(struct platform_device *pdev)
 	card->name = "soundwire";
 	card->owner = THIS_MODULE;
 	card->late_probe = sof_sdw_card_late_probe;
+	card->add_dai_link = sof_sdw_add_dai_link;
 
 	snd_soc_card_set_drvdata(card, ctx);
 
-- 
2.49.0

