Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E958xM+l"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7392133
	for <linux-sound@vger.kernel.org>; Fri,  8 Dec 2023 05:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702041700; x=1733577700;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=N+jsBkp8QleY9VxgwP4ibX3XPOPGrBqnXEY3sDdAqlM=;
  b=E958xM+lg9RKRHU6q9fP5SbLX8gkBl8PQR0HKGur/mUV4xLbJwo5lKx2
   mTbQ2bBicIipjsuNyHez1Bn5D/7kILJwUIQJx8Gu3cM5O0GfwRrJLBbNE
   cJTzANH8nPvVojvvYUQZJOH6e9RxxtlslPLCCHAjnlXqnc7hpKfogIASy
   R89Dpol0O5AM2ft59lQBKdabFRrFKjdE+LtHKvCMF2BLpXRJ+hb/2wHNU
   iotFUyBqbWfD1tuBA8YVTpkzmi/WROCBCYVcWGxwd9l5qxcOwB3194WPN
   MFNxS7dsIFe6vFG8Hf0yRTGWDLeZR5FbQM2ZqjuYATY6r53YmyGcfZyxl
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="394141767"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; 
   d="scan'208";a="394141767"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2023 05:21:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="915948502"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; 
   d="scan'208";a="915948502"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
  by fmsmga001.fm.intel.com with ESMTP; 08 Dec 2023 05:21:38 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: linux-sound@vger.kernel.org,
	tiwai@suse.de
Cc: kai.vehmanen@linux.intel.com,
	alsa-devel@alsa-project.org
Subject: [PATCH 0/2] ALSA: hda/hdmi: add force-connect quirks
Date: Fri,  8 Dec 2023 15:21:25 +0200
Message-ID: <20231208132127.2438067-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series addresses problems seen on a few older Intel based
systems as found by the DRM i915 CI and the inject-audio test.

The patches in series have been separately tested on top
of drm-tip at:
https://patchwork.freedesktop.org/series/127515/
https://patchwork.freedesktop.org/series/127305/

Kai Vehmanen (2):
  ALSA: hda/hdmi: add force-connect quirk for NUC5CPYB
  ALSA: hda/hdmi: add force-connect quirks for ASUSTeK Z170 variants

 sound/pci/hda/patch_hdmi.c | 3 +++
 1 file changed, 3 insertions(+)

-- 
2.43.0

