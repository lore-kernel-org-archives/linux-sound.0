Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LwjUySzv"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 202D5D5
	for <linux-sound@vger.kernel.org>; Mon,  4 Dec 2023 13:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701726445; x=1733262445;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tcWoVUw3oimwIe0yqx07U0upo+CLmQGYugfD5xMlpJs=;
  b=LwjUySzvdbnIc64wXEHkh9rmIhtq6noU4dMv/Jbewu3gq5dLVzxv8qBZ
   T9l3DDyMAU2KFuCW3avQbDrud7A58Mzb1NW+CrXMzk3NZ/FCBRLoX1fFW
   AEeMFTqQL3ZDYrS3m03MQpgjBHrPlC6Rzd5FUAr2sp+CcSTyjWY0pji6z
   5FoDfN34ZMmH45LqGhguBnawU12gi71NOTXovs5XB/Kk6pXS/vyTYM6Ph
   LMFztybCUb87IcumRhb5xbmZor1mo3/w5fITUSSQOjBbxdJXNdkzNh8vz
   /updog/rqxQnZ/ZJriHivOMqZT5HvvMOnPf16HGo4u82jWkbX0cecKey5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="373249514"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="373249514"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 13:47:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="746978893"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="746978893"
Received: from akashams-mobl.amr.corp.intel.com (HELO pbossart-mobl3.lan) ([10.255.231.189])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 13:47:23 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 1/4] ASoC: SOF: topology: Use partial match for disconnecting DAI link and DAI widget
Date: Mon,  4 Dec 2023 15:47:10 -0600
Message-Id: <20231204214713.208951-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231204214713.208951-1-pierre-louis.bossart@linux.intel.com>
References: <20231204214713.208951-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bard Liao <yung-chuan.liao@linux.intel.com>

We use partial match for connecting DAI link and DAI widget. We need to
use partial match for disconnecting, too.

Fixes: fe88788779fc ("ASoC: SOF: topology: Use partial match for connecting DAI link and DAI widget")
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index f1add75afbe1..e3e7fbe40fa6 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1135,7 +1135,7 @@ static void sof_disconnect_dai_widget(struct snd_soc_component *scomp,
 	list_for_each_entry(rtd, &card->rtd_list, list) {
 		/* does stream match DAI link ? */
 		if (!rtd->dai_link->stream_name ||
-		    strcmp(sname, rtd->dai_link->stream_name))
+		    !strstr(rtd->dai_link->stream_name, sname))
 			continue;
 
 		for_each_rtd_cpu_dais(rtd, i, cpu_dai)
-- 
2.39.2

