Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HRsyNJDz"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA3731739
	for <linux-sound@vger.kernel.org>; Fri, 24 Nov 2023 05:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700834232; x=1732370232;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MBa0sbZ5OfSGKnvLbayVusDHUZ7L4u2k9/Ba47MuuOU=;
  b=HRsyNJDz0yDECX9Flf11AwsRQf+uJ+Lsb48nbcHLtsN4wOQ2Xs5eGGOZ
   RGyBjPj+jxmBYVBy2ibbzQsZWQMH1KlUmrgTxCVIcXwi4uYGZ6M0YA7fd
   LDXl5sI77lZH7enkb62vBh8JBda7OCsQBcR+iWGiOJsoMnvFn81mOp58d
   9VLCMmI24bYpole+J7DQJh7kH1VNac7dYrWyUzuV7YuRT7VoqRTFWkEwo
   9XokwMGXrRyM5cEldoK9xZX5/N0jSIPPEEx2OlMr0iNSB8DCRsh37jF1m
   XBR6qRby9hqj+hA2FpcTdIT/g//h/jDbPOWDcfA+V+7hGII7l2nAjEbrb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="372590351"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="372590351"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 05:57:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="858397217"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="858397217"
Received: from barumuga-mobl1.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.58.182])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 05:57:10 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com
Subject: [PATCH 0/2] ASoC: SOF: Extend the enabled DSP core handling
Date: Fri, 24 Nov 2023 15:57:41 +0200
Message-ID: <20231124135743.24674-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.42.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

In the current code, we enable a widget core when it is set up and
disable it when it is freed. This is problematic with IPC4 because
widget free is essentially a NOP and all widgets are freed in the
firmware when the pipeline is deleted. This results in a crash during
pipeline deletion when one of it's widgets is scheduled to run on a
secondary core and is powered off when widget is freed. So, change the
logic to enable all cores needed by all the modules in a pipeline when
the pipeline widget is set up and disable them after the pipeline
widget is freed.

Regards,
Peter
---
Ranjani Sridharan (2):
  ASoC: SOF: ipc4-topology: Add core_mask in struct snd_sof_pipeline
  ASoC: SOF: sof-audio: Modify logic for enabling/disabling topology
    cores

 sound/soc/sof/ipc3-topology.c |  2 ++
 sound/soc/sof/ipc4-topology.c |  9 +++++
 sound/soc/sof/sof-audio.c     | 65 ++++++++++++++++++++++-------------
 sound/soc/sof/sof-audio.h     |  2 ++
 4 files changed, 54 insertions(+), 24 deletions(-)

-- 
2.42.1

