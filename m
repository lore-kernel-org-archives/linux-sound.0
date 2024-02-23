Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002305C60F
	for <linux-sound@vger.kernel.org>; Fri, 23 Feb 2024 11:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708688705; cv=none; b=K8GglZfGw3OJ26J1nwi+gPkgbuEFCThBXjTPMapmdNzdhRXnpqtNBaS3IEJxW78fQ8i5L8IdR7xzxfKeMQoFfMzoYabXNidP5laiPbkbMXZoB98jot1tfrbF7dizUzdzj6AMctlCWYQ+FDBRj/6Nqe/xEYSMCQv6GD+lVoi7oTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708688705; c=relaxed/simple;
	bh=cewHMOUP9XE8f1iBRQp0XY/AtymJk2wyw8t26geqAWQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TuQxaXqeTj2mF0djaw8q5o8JeWQMW+XOOSlSTTvV3GE+M5XUwGoA6o5MSk/hQycpAg/VrjB11TkDiltRiby8ywDSPWX+2v2VHspSYj/t62lrYVEhDFwnYydfdSoIhgYjMFiBSNn8n4I3JXlPfCQoxVTs6XE7vX077wQ82kPDNzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JPadYVlQ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JPadYVlQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708688704; x=1740224704;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cewHMOUP9XE8f1iBRQp0XY/AtymJk2wyw8t26geqAWQ=;
  b=JPadYVlQGniku6YYYKMFA+USUhmZWXZg9bf0H0lNsEvVyMbi5qQQv6Hy
   9HT4TZZJxGAUkLwG1ud9nARiZlkD6DprTmgJ2eC2Mc0Uai7UUc7y+DzXs
   D+te+ZZQGHHwsCwLN9z2az1GGFL2s01+f7lBE75TVMb2nmcdEfhjRV1ee
   MbVTDqGBkxJ4hmXBfnnaw7dS2WVArzHuaRGoggfNxyvRCJYsBoQSdtPQn
   KHh4Wcl8pdDYHB0ObNJmROTn4AoXiAgRbVyewe/zoOXTLrrIndfX5thmA
   RsJu0ZtZefqZHRiKV4XAkBSudfJqJKtHN5D6Y6Q/569a2SN7zIYsX4Sgo
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="3504619"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="3504619"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 03:45:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="6092942"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa006.fm.intel.com with ESMTP; 23 Feb 2024 03:45:00 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	jani.nikula@linux.intel.com,
	joonas.lahtinen@linux.intel.com,
	rodrigo.vivi@intel.com,
	tvrtko.ursulin@linux.intel.com,
	intel-gfx@lists.freedesktop.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 4/4] ALSA: hda: Reuse for_each_pcm_streams()
Date: Fri, 23 Feb 2024 12:46:26 +0100
Message-Id: <20240223114626.1052784-5-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240223114626.1052784-1-cezary.rojewski@intel.com>
References: <20240223114626.1052784-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the macro to improve readability.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/pci/hda/hda_codec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index 12f02cdc9659..2cac337f5263 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -3313,7 +3313,7 @@ int snd_hda_codec_parse_pcms(struct hda_codec *codec)
 	list_for_each_entry(cpcm, &codec->pcm_list_head, list) {
 		int stream;
 
-		for (stream = 0; stream < 2; stream++) {
+		for_each_pcm_streams(stream) {
 			struct hda_pcm_stream *info = &cpcm->stream[stream];
 
 			if (!info->substreams)
-- 
2.25.1

