Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2266437F8BC
	for <linux-sound@vger.kernel.org>; Wed,  4 Feb 2026 08:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770193096; cv=none; b=sO4vSqn5njNbuKcQL7FKBas/ufywHPdii65fDaLR9UUaxyiCuS1mg/ciW+GGA3HXKcrb79Q/YCRE5IIdnUehvk1bqN/6YMQ2PcGYkWV8ilN+GOKZ4UPeO01MVkdW0R/UhTwRuziku0ah4u0+1ShaKz/Bkjq0aMRw0VxrEoDEhJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770193096; c=relaxed/simple;
	bh=LPjlblBe6tSekOjyBfnEWiS7ZYrdvQ8LmlEaC3WWP0I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qjU4kEeX1i0RB/JlwWVUFftrPJCMO8t8e0geVe0hd4v8iXl82kyzx5N+EUC7oglIjNaedLN5TvIg9UBtU1h5rILtkyGfkc4BhgiO2+dcyzfaaKa6Up0qNLS04N5+UOXxiIfuhJj9/Xb/OhNV9iCSphuPpqoEg2U64xmEY0H7AKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=It+wYpYS; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="It+wYpYS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770193096; x=1801729096;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LPjlblBe6tSekOjyBfnEWiS7ZYrdvQ8LmlEaC3WWP0I=;
  b=It+wYpYS9TcNGHvm+CQUstcgd6q0heF8GMq0zk5yUaxsHGYN6edSO/x/
   9W/HlTIu80AY85QIjq9YzlOHuQQW/x1ReWW2F3oRWt73FHcBcAlcaoUiB
   eVRKl9VRA6bKLH/SBxc+yJ0jpGFscNwkX6d0T1nR8fIIPJih0En1NOKq2
   eZHEEDj8qocj+DePMTqlfzNhmaqjRjbjHzuw10DhmRBGh2vwe1wCXIcML
   ocoKS3R5vivPpHyL2m2OaGm5ZKMAoE0RMsu8xMBoI9+U0v7FR5qxqnLU8
   WT2hHPCsljRhPry+kbhxc1j6cqiqpd4n7BgUvh7RVBATtkMgWi1CF07Tl
   A==;
X-CSE-ConnectionGUID: BOFu/4zFR1eIwANFMrH53g==
X-CSE-MsgGUID: XZ+5aImoQdK3bfCaVnwAVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="94028478"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="94028478"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 00:18:07 -0800
X-CSE-ConnectionGUID: Q/ywd5qATHyDdtEPwjh3yg==
X-CSE-MsgGUID: SdG3nTSQSwa7no1c4FDTUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="209893270"
Received: from aotchere-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.245])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 00:18:02 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com,
	mateuszx.redzynia@intel.com
Subject: [PATCH 04/10] ASoC: Intel: sof_sdw: Add a DAI link for loopback capture
Date: Wed,  4 Feb 2026 10:18:27 +0200
Message-ID: <20260204081833.16630-5-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260204081833.16630-1-peter.ujfalusi@linux.intel.com>
References: <20260204081833.16630-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Add a DAI link for loopback capture as the last link to make sure
the other DAI link ID's remain unaffected. It serves as a dummy DAI link
to enable echo reference capture in the SDW topologies which do not have
an actual backend capture DAI.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 43 ++++++++++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 50b838be24e9..ee34282828e4 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1186,6 +1186,34 @@ static int create_bt_dailinks(struct snd_soc_card *card,
 	return 0;
 }
 
+static int create_echoref_dailink(struct snd_soc_card *card,
+				  struct snd_soc_dai_link **dai_links, int *be_id)
+{
+	struct device *dev = card->dev;
+	int ret;
+	char *name = devm_kasprintf(dev, GFP_KERNEL, "Loopback_Virtual");
+
+	if (!name)
+		return -ENOMEM;
+
+	/*
+	 * use dummy DAI names as this won't be connected to an actual DAI but just to establish a
+	 * fe <-> be connection for loopback capture for echo reference
+	 */
+	ret = asoc_sdw_init_simple_dai_link(dev, *dai_links, be_id, name,
+					    0, 1, "Loopback Virtual Pin", "dummy",
+					    snd_soc_dummy_dlc.name, snd_soc_dummy_dlc.dai_name,
+					    1, NULL, NULL);
+	if (ret)
+		return ret;
+
+	(*dai_links)++;
+
+	dev_dbg(dev, "Added echo reference DAI link\n");
+
+	return 0;
+}
+
 static int sof_card_dai_links_create(struct snd_soc_card *card)
 {
 	struct device *dev = card->dev;
@@ -1294,8 +1322,12 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 		goto err_end;
 	}
 
-	/* allocate BE dailinks */
-	num_links = sdw_be_num + ssp_num + dmic_num + hdmi_num + bt_num;
+	/*
+	 * allocate BE dailinks, add an extra DAI link for echo reference capture.
+	 * This should be the last DAI link and it is expected both for monolithic
+	 * and functional SOF topologies to support echo reference.
+	 */
+	num_links = sdw_be_num + ssp_num + dmic_num + hdmi_num + bt_num + 1;
 	dai_links = devm_kcalloc(dev, num_links, sizeof(*dai_links), GFP_KERNEL);
 	if (!dai_links) {
 		ret = -ENOMEM;
@@ -1344,6 +1376,13 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 			goto err_end;
 	}
 
+	/* dummy echo ref link. keep this as the last DAI link. The DAI link ID does not matter */
+	ret = create_echoref_dailink(card, &dai_links, &be_id);
+	if (ret) {
+		dev_err(dev, "failed to create echo ref dai link: %d\n", ret);
+		goto err_end;
+	}
+
 	WARN_ON(codec_conf != card->codec_conf + card->num_configs);
 	WARN_ON(dai_links != card->dai_link + card->num_links);
 
-- 
2.52.0

