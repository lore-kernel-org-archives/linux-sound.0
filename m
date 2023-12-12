Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ikySZ2R4"
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9F40D2
	for <linux-sound@vger.kernel.org>; Tue, 12 Dec 2023 06:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702391446; x=1733927446;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=oUXerigmotIr1wxntYZB0APPtlcZnfypHtwiorKtwRY=;
  b=ikySZ2R4PZR2ng3W+seNOOuN0PGFv9qBkCyr1fSjaFu2ZW3znHm3ycsx
   QtsxCO++F0+2JZQp7DHyybkXlt9GQEWKCcSQv5OlQQyqaHp9kDkhR7znz
   6jyjWBQo18MPS+KfepyTFEEDIW/LOmYK7ap6uJlatJLanMBDlp46wgdGE
   sXw5OCGUecKIVp6Lc/6GffD7XjWikFQ3APzvowAA2/7BNBJMnlQIwysyl
   5vgzKvWKefjkJmIr9gkobvMXIESFjNWSVBF7uXGfQSpfnu9Ri7/UHMmXY
   yZKXZ0lwh+vd4FHqeNkwsGo7bSPsy8IzKnHjKaTr35iLv99femOz95P+n
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="1887482"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; 
   d="scan'208";a="1887482"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 06:30:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="1104923828"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; 
   d="scan'208";a="1104923828"
Received: from ggilardi-mobl1.amr.corp.intel.com (HELO localhost) ([10.252.49.147])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 06:30:43 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: linux-sound@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	jani.nikula@intel.com
Subject: [PATCH] ASoC: hdmi-codec: drop drm/drm_edid.h include
Date: Tue, 12 Dec 2023 16:30:38 +0200
Message-Id: <20231212143038.3828691-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit

hdmi-codec.h does not appear to need drm/drm_edid.h for anything. Remove
it.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

I'm pretty sure I haven't compiled everything that might implicitly
depend on the include. However, the right thing to do is to include
drm_edid.h where needed, not from somewhat random intermediate
headers. I hope this uncovers anything I missed.
---
 include/sound/hdmi-codec.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/sound/hdmi-codec.h b/include/sound/hdmi-codec.h
index 9b162ac1e08e..5e1a9eafd10f 100644
--- a/include/sound/hdmi-codec.h
+++ b/include/sound/hdmi-codec.h
@@ -12,7 +12,6 @@
 
 #include <linux/of_graph.h>
 #include <linux/hdmi.h>
-#include <drm/drm_edid.h>
 #include <sound/asoundef.h>
 #include <sound/soc.h>
 #include <uapi/sound/asound.h>
-- 
2.39.2

