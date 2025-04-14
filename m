Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F0F1925BC
	for <linux-sound@vger.kernel.org>; Mon, 14 Apr 2025 06:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744612402; cv=none; b=CaYc7jkzcNMGdXOQLaG4xEaHdiStWtUeG0rDKAzOG9WchULTj8qoZPDw++vZ7ljXYDDSJBFRDaICeeT9B2CdUaRGr0Y+WmnQXWpEL1QeOJvj0C1qwqeY5pds02DkVaoNvBFJ7YBhD4ncd0vFMdZUCeNNEvGD9bzC+mIHy96J/NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744612402; c=relaxed/simple;
	bh=gZMwZgvvlxmR4PeHegjiDrodipamfKr7vWFuH+eHbRE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DsY9EG+oUyjNwtI1b7rJK23PDGZVn9c1TRFlKkdf/DWzmqB5S2CrhbyKhqrSJUC4mC9maiy4c4kCgYhHHCVReBSkSDNxMqZkXZsZA5BfeaW87+wY1wMHYR+Pd3U1gButUEU4XNH8D21NiKwLXlfyOOxqyMI8ZcXSu59BHa1gpZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YZh4N/wG; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YZh4N/wG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744612401; x=1776148401;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gZMwZgvvlxmR4PeHegjiDrodipamfKr7vWFuH+eHbRE=;
  b=YZh4N/wGAcRjRUWZ/qBzrVgR24JCGYK4PZ29/aSBEGEuUF4Z05PWmseI
   dI1gMvrjTZ1SfbuCQd7bzFz8XfsJeZmIRG3iImjrUTjz5qxsvWWDvdf2u
   EM2drIVMYbcN6R+H7acXNNioAb5GUZR3uDTsiPXHLlVYt9bjyFWWlH8M8
   LGhR94qhjEwWG2sCim2V6wcKVDm2AsZPsVcA8VizC5oti73/Af9MU92zD
   JZaGcYqYtb6huyRhZBu+4qH2Y64rQ+AgriX0Ef0tflY0z7jGUw3cnuCmc
   CqkPMByBiZAUSt1i9wfReMZvCXm8vXEwe5SI5ycUBi3JTg/Cf1YvAeD8c
   g==;
X-CSE-ConnectionGUID: j1P5FxfcRQiQPql8iSIS4A==
X-CSE-MsgGUID: SyIzWBVZQx+aKNDSuqenCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="49872609"
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="49872609"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2025 23:33:20 -0700
X-CSE-ConnectionGUID: 7vvNnLW4Tj+YaITy5KpkjA==
X-CSE-MsgGUID: xUJIdWZmTWikwOpY2PN2tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="130275267"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.118.73])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2025 23:33:19 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 02/11] ASoC: SOF: topology: don't convert error code
Date: Mon, 14 Apr 2025 14:32:30 +0800
Message-ID: <20250414063239.85200-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250414063239.85200-1-yung-chuan.liao@linux.intel.com>
References: <20250414063239.85200-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

No need to convert the return value of snd_soc_tplg_component_load().

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/topology.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 15e8ca62ab14..fc4a9cddd162 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -2486,11 +2486,9 @@ int snd_sof_load_topology(struct snd_soc_component *scomp, const char *file)
 	else
 		ret = snd_soc_tplg_component_load(scomp, &sof_tplg_ops, fw);
 
-	if (ret < 0) {
+	if (ret < 0)
 		dev_err(scomp->dev, "error: tplg component load failed %d\n",
 			ret);
-		ret = -EINVAL;
-	}
 
 	release_firmware(fw);
 
-- 
2.43.0

