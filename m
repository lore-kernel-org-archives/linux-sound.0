Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39D113C90D
	for <linux-sound@vger.kernel.org>; Tue, 26 Mar 2024 16:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711469132; cv=none; b=ZK3r+NB+8APQ0Xe0K9pASaZHaD3tkrwkx1rEJbqnR+DZE4MnNYtvDG0xH17HXO1PDRlUCeargd64bP3d9VdLW9iPg3JBZb+xJSqU0LWMBmJhF0H2ZlyJVSferFE7voeDRx/jVHJmxvXWhh5zXNWlNzpxko2U1gyNSahqFIKROlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711469132; c=relaxed/simple;
	bh=+RqUgqGIVdP7peYMwm0LbrXLh8sPQbx6LB6mT/cLrZQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pExTKrkXX1XTUY5vSnhuz8VgVV7OLgCiaCVKfaA2kopXrYnwmPs1yT3Q4quBp+WNXUm7ng2/zLttTgrwfcDE72H/tkVKrYMT2SQRcs3E8/gVtUVaqydOo0o7EJwwmBYqe3Pl29Ok3JebJULrvUn6P8WeattVPg2FWGIlD+xmkkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UVhy2bnP; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UVhy2bnP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711469128; x=1743005128;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+RqUgqGIVdP7peYMwm0LbrXLh8sPQbx6LB6mT/cLrZQ=;
  b=UVhy2bnPPOq1KV6bwXygZONvy6FL2qc9g4MpQk5SP3bkYHke5EPYx8Rr
   qjbWr946Db4z4laWiHUowOcB3ZprrJUVAelau8JAgDSFPWEZ7R8KkHUH+
   juqzEUBqbUx2dqM0VAXijqC9SNQPyzVyikwGTQ33ttG0mDqbuDM6tofNu
   b3h3Z5PDC4QgxjDSUBIsi4SDtJSou9tWEUyqdBbUuY5Q0d9jYetXBpUX+
   5NlnWkpEnR3q3SJlsqS2z9oFfROFoW8TerKx9Vd3X9ayB0nr52bDm+kAZ
   ajiSVu6XDeyKKffuTkMeKDtIiWjM1UDzZIuE98pqQwOXpxKckUzEvH83j
   Q==;
X-CSE-ConnectionGUID: DlMM9ZM4QF2C4lXJEUDCqA==
X-CSE-MsgGUID: lJK54WBnSb6eM5tMnlzWPQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17260396"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="17260396"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:04:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="20482218"
Received: from bhubbert-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.65.108])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:04:49 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shuming Fan <shumingf@realtek.com>,
	Jack Yu <jack.yu@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Bard liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 11/34] ASoC: Intel: sof_sdw: Factor out DMIC DAI creation.
Date: Tue, 26 Mar 2024 11:04:06 -0500
Message-Id: <20240326160429.13560-12-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
References: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Charles Keepax <ckeepax@opensource.cirrus.com>

Factor out the creation of the DMIC DAI links into a helper function.
No functional change.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 53 +++++++++++++++++++-------------
 1 file changed, 32 insertions(+), 21 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 9980652c901b..5571c9e85dd7 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1659,6 +1659,34 @@ static int create_ssp_dailinks(struct snd_soc_card *card,
 	return 0;
 }
 
+static int create_dmic_dailinks(struct snd_soc_card *card,
+				struct snd_soc_dai_link **dai_links, int *be_id)
+{
+	struct device *dev = card->dev;
+	int ret;
+
+	ret = init_simple_dai_link(dev, *dai_links, be_id, "dmic01",
+				   0, 1, // DMIC only supports capture
+				   "DMIC01 Pin", "dmic-codec", "dmic-hifi",
+				   sof_sdw_dmic_init, NULL);
+	if (ret)
+		return ret;
+
+	(*dai_links)++;
+
+	ret = init_simple_dai_link(dev, *dai_links, be_id, "dmic16k",
+				   0, 1, // DMIC only supports capture
+				   "DMIC16k Pin", "dmic-codec", "dmic-hifi",
+				   /* don't call sof_sdw_dmic_init() twice */
+				   NULL, NULL);
+	if (ret)
+		return ret;
+
+	(*dai_links)++;
+
+	return 0;
+}
+
 static int sof_card_dai_links_create(struct snd_soc_card *card)
 {
 	struct device *dev = card->dev;
@@ -1825,30 +1853,13 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	if (dmic_num > 0) {
 		if (ctx->ignore_pch_dmic) {
 			dev_warn(dev, "Ignoring PCH DMIC\n");
-			goto HDMI;
+		} else {
+			ret = create_dmic_dailinks(card, &dai_links, &be_id);
+			if (ret)
+				return ret;
 		}
-
-		ret = init_simple_dai_link(dev, dai_links, &be_id, "dmic01",
-					   0, 1, // DMIC only supports capture
-					   "DMIC01 Pin", "dmic-codec", "dmic-hifi",
-					   sof_sdw_dmic_init, NULL);
-		if (ret)
-			return ret;
-
-		dai_links++;
-
-		ret = init_simple_dai_link(dev, dai_links, &be_id, "dmic16k",
-					   0, 1, // DMIC only supports capture
-					   "DMIC16k Pin", "dmic-codec", "dmic-hifi",
-					   /* don't call sof_sdw_dmic_init() twice */
-					   NULL, NULL);
-		if (ret)
-			return ret;
-
-		dai_links++;
 	}
 
-HDMI:
 	/* HDMI */
 	for (i = 0; i < hdmi_num; i++) {
 		name = devm_kasprintf(dev, GFP_KERNEL, "iDisp%d", i + 1);
-- 
2.40.1

