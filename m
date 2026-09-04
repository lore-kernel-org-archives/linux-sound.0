Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D002E37EFE4
	for <linux-sound@vger.kernel.org>; Fri,  4 Sep 2026 07:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788507124; cv=none; b=VOaeqmBQawBGG81GT55lDfLWdTyArKmDp5f5eRNkZBpqIVL/au04PMaLXjb4OT3HY7f7EO/K1d/8lQboZPckPHIRRQQM0Hesvm+m7FypTO3swDeUWNqs77M/EnDnpRSBu2032EWmcHmos/HcCaTlYlsKkwqJz9kqvD0Fm+3VeB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788507124; c=relaxed/simple;
	bh=QYjadz/6N7Hx/yXP2qkHRBdGt6/ECOhqw6xlOSy1PwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m19CRm3Diuf4SewltHB0TcKWGLKzDKxQ/BLU56VyhAOMTDuVgXnEUqcpNXUtxZ/goUIrZlhOy/H3wBWCzdXBJ30fIKLZtGirf5cIUu+uVXZOHQMqtfCtTUblP2PamQlRDuTnztzSKYWL/HsI29yUxzxlUatw4y3qPM0JWy0ExO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HnOWJMWV; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HnOWJMWV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788507123; x=1820043123;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QYjadz/6N7Hx/yXP2qkHRBdGt6/ECOhqw6xlOSy1PwQ=;
  b=HnOWJMWVFAHg57/QWzeX4lFssogJOjPdja/4wgKD+aBj7dfk2zoWoPQ2
   aK4d+KEzdf4eyxf/+w8Y7NtrGc3Kpv63ILNOo0VyWmd8f9sDcUwmllE3w
   LfsrSDp3dOXpgpc9E4LCw4V+t9s+sBcGHNzIzH4L5QSVy7s44fh/UOw8k
   bfjVE8YWprsWdmZT0ayvD9S9BikvTVJYleTyjPOCMS1gSYhes3SSpZANH
   pvliGqUUaA74jNgjMXRq0Vjm/b+Y6Bra70zI2EncRwWNapyJBU1E+7rx6
   SDK6bj8HLmOcMyTFxed1DzaJm+7UDCi7U4LqgRXo7AO0ccP+tiXNMIVfO
   w==;
X-CSE-ConnectionGUID: yEdT4sjeRlaOs8fMlk/ILw==
X-CSE-MsgGUID: D/gAGbcKQZm0OQm4ZTgHBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="111777923"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="111777923"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 00:32:02 -0700
X-CSE-ConnectionGUID: PiFh8IXIQYCMcmOYRV8OJg==
X-CSE-MsgGUID: bz5nBgTwTmmnVbnCQBVo3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="293480598"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.213])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 00:31:59 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: vkoul@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	srinivas.kandagatla@oss.qualcomm.com
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	daniel.baluta@nxp.com,
	Vijendar.Mukunda@amd.com
Subject: [PATCH 11/23] ASoC: SOF: intel: hda-stream: Clear the current position when releasing stream
Date: Fri,  4 Sep 2026 10:31:22 +0300
Message-ID: <20260904073134.29648-12-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904073134.29648-1-peter.ujfalusi@linux.intel.com>
References: <20260904073134.29648-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

After the host DMA ID is released, reset the curr_pos to 0 for a clean
start for subsequent stream starts. This is not needed for PCM streams
but for compressed streams.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/soc/sof/intel/hda-stream.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index c95230487a1b..5097a497188d 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -317,6 +317,7 @@ static int _hda_dsp_stream_put(struct snd_sof_dev *sdev, int direction, int stre
 		if (s->direction == direction && s->stream_tag == stream_tag) {
 			s->opened = false;
 			found = true;
+			s->curr_pos = 0;
 			if (pair)
 				link_stream = hext_stream;
 		} else if (!(hda_stream->flags & SOF_HDA_STREAM_DMI_L1_COMPATIBLE)) {
-- 
2.55.0

