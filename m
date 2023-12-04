Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AZmXI5vi"
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFBDCC4
	for <linux-sound@vger.kernel.org>; Mon,  4 Dec 2023 13:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701726135; x=1733262135;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JvpWN1lrJ/q8VSr5e3Mn06qyhtl7YZ6dRHYKh+HOmUo=;
  b=AZmXI5vixpaUgvuNWVrUA3DQNTjbqmHgfRwHK/GSi4Uy0wAEdSkrbVnq
   qCqxoz++QRH07oLZBb1EpCFSqZJ4z4ZcUeUdRAK5UmcyxCo9jtNE0UQtn
   Hyj3cDBRumWn+fyUB6twicOwsUPTIJnyw8xi9o5fiqX3IWTT7KE/RnxXC
   dtf6TeXjopS70rtIeA3iwCM/DyZg9K7xdF7ZmY3I3m3n/6oOUJuisUdZ/
   H0e2jrOMh6361sTxltJtD0Jnu6fg9c/ERZm4PWuWDsbjVwEYvYDAGazUU
   z256y++haaW9HSxKXrU1TWnlsvrC7CZCKWWSp4bpjdXvFF5qYvwcAz2f0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="859822"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="859822"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 13:42:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="764104382"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="764104382"
Received: from akashams-mobl.amr.corp.intel.com (HELO pbossart-mobl3.lan) ([10.255.231.189])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 13:42:13 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 4/5] ASoC: Intel: sof_sdw_rt_sdca_jack_common: ctx->headset_codec_dev = NULL
Date: Mon,  4 Dec 2023 15:41:59 -0600
Message-Id: <20231204214200.203100-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231204214200.203100-1-pierre-louis.bossart@linux.intel.com>
References: <20231204214200.203100-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Bard Liao <yung-chuan.liao@linux.intel.com>

sof_sdw_rt_sdca_jack_exit() are used by different codecs, and some of
them use the same dai name.
For example, rt712 and rt713 both use "rt712-sdca-aif1" and
sof_sdw_rt_sdca_jack_exit().
As a result, sof_sdw_rt_sdca_jack_exit() will be called twice by
mc_dailink_exit_loop(). Set ctx->headset_codec_dev = NULL; after
put_device(ctx->headset_codec_dev); to avoid ctx->headset_codec_dev
being put twice.

Fixes: 5360c6704638 ("ASoC: Intel: sof_sdw: add rt712 support")
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c b/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
index e430be7681d2..1e5725f0ae33 100644
--- a/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
+++ b/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
@@ -176,6 +176,7 @@ int sof_sdw_rt_sdca_jack_exit(struct snd_soc_card *card, struct snd_soc_dai_link
 
 	device_remove_software_node(ctx->headset_codec_dev);
 	put_device(ctx->headset_codec_dev);
+	ctx->headset_codec_dev = NULL;
 
 	return 0;
 }
-- 
2.39.2

