Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7595473191
	for <linux-sound@vger.kernel.org>; Mon, 25 Mar 2024 22:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711405114; cv=none; b=DS0gDfNlPe5KV0TzWAKWtLj6NXhntvJBtwK0YNcgiiv7dCQlOYxGw/4qsCpROoHhzysgRpx5ucjwBI7J/Db0LQ+EMpoeOn7pHBvJiRDBAI+x3bR5tP1t8Pi6c9DsNED+9TOWrXPU5qrmu+W9OhPq8RSgjftCEavlpwZguZZLKLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711405114; c=relaxed/simple;
	bh=9qqq0v/NMG1pivad5TU4MiNQDCZW71iFB9lBFL0S24o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gDmeE+asbKPt5h4NWnDXNXClDo9a53c3av2bbVQRj/mbPZ5qXyJbI3dH5iljz3ObtNQ4i7j1pftYTVXmpkNh+B/CKWSiJakZvVNMMdzANr7RN3lMyopaXhdgLjhw1vaKmsSz9rT8805LVn+myNz+MauYx1RZ/DII5HC052RdAhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bUyPjzfP; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bUyPjzfP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711405113; x=1742941113;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9qqq0v/NMG1pivad5TU4MiNQDCZW71iFB9lBFL0S24o=;
  b=bUyPjzfPRraFYt8X9f/xXewOf1KpZ1h7vyxJD97h5VGr04L/dZZry5BF
   Ut2Mx8MWB0WQlsms7hm9geFKXBjz539xiCKTECPCEpfCFRtGTMurZ45rn
   i7iYftfTiho6ODIKNRAlGzNsv7vEifuOxitikaRbAxdI4mWqjm6Frwhkk
   LwwJI5YMTFJEH3fWXhBjGqtPoByaKeEQLxQbGG0rlNhQrzZvE0tkEPUIX
   P3vAOJ57JykOxAU9I27a2cFaGnRz/iI1elrUQ1SuJG7YmEkRLc9SDNOTt
   ahtDMdPoA4twlr8h79LOTfW3vKYmMniuIpaI8tKzbENWohO+fTS1uXcob
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6300369"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="6300369"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 15:18:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="20309643"
Received: from jaimbres-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.lan) ([10.212.98.109])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 15:18:31 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Chao Song <chao.song@linux.intel.com>
Subject: [PATCH 2/6] ASoC: rt711-sdca: fix locking sequence
Date: Mon, 25 Mar 2024 17:18:13 -0500
Message-Id: <20240325221817.206465-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240325221817.206465-1-pierre-louis.bossart@linux.intel.com>
References: <20240325221817.206465-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The disable_irq_lock protects the 'disable_irq' value, we need to lock
before testing it.

Fixes: 23adeb7056ac ("ASoC: rt711-sdca: fix for JD event handling in ClockStop Mode0")
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Chao Song <chao.song@linux.intel.com>
---
 sound/soc/codecs/rt711-sdca-sdw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt711-sdca-sdw.c b/sound/soc/codecs/rt711-sdca-sdw.c
index 935e597022d3..b8471b2d8f4f 100644
--- a/sound/soc/codecs/rt711-sdca-sdw.c
+++ b/sound/soc/codecs/rt711-sdca-sdw.c
@@ -438,13 +438,13 @@ static int __maybe_unused rt711_sdca_dev_resume(struct device *dev)
 		return 0;
 
 	if (!slave->unattach_request) {
+		mutex_lock(&rt711->disable_irq_lock);
 		if (rt711->disable_irq == true) {
-			mutex_lock(&rt711->disable_irq_lock);
 			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1, SDW_SCP_SDCA_INTMASK_SDCA_0);
 			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2, SDW_SCP_SDCA_INTMASK_SDCA_8);
 			rt711->disable_irq = false;
-			mutex_unlock(&rt711->disable_irq_lock);
 		}
+		mutex_unlock(&rt711->disable_irq_lock);
 		goto regmap_sync;
 	}
 
-- 
2.40.1

