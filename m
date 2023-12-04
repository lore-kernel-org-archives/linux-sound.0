Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dh2j1ZBL"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58C34B6
	for <linux-sound@vger.kernel.org>; Mon,  4 Dec 2023 13:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701725244; x=1733261244;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DAtr0L95H16Dh6OestlLviuHH+hx+N8LCwUcYG8pUhA=;
  b=dh2j1ZBLRFuBR6lALXhl/dWP//ye+6elkDu5ZF65J2mW45OlwjeJEdWV
   b3WdHmJSjYL85NnroBcHGFeOEO7y9AEr1899ur4/cn/Fw1Sh/XTSo3bbZ
   vlsvwrVZQ2199RsA1WELAjggY1SIW7nXrTMifGwhna7/uGD6qhDpfm5jn
   1NGfKSBp+WBEv+aDTtEKMZszQiHYkqd0eYSbcpnjKtuxSmw/S9INf/tK4
   nh+w8joPxiFo5BiWia6h+vQLN6KByVW4YaVNKn3IiPisxqlS4XLRc91PE
   Ymtr9szOuGHI+lXwMlm182+MG4fR1ltZEpyldqrrq9Jd2yYzM3lFQTU98
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="479993031"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="479993031"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 13:27:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="12101164"
Received: from akashams-mobl.amr.corp.intel.com (HELO pbossart-mobl3.lan) ([10.255.231.189])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 13:27:22 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: [PATCH 1/5] PCI: add INTEL_HDA_ARL to pci_ids.h
Date: Mon,  4 Dec 2023 15:27:06 -0600
Message-Id: <20231204212710.185976-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231204212710.185976-1-pierre-louis.bossart@linux.intel.com>
References: <20231204212710.185976-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The PCI ID insertion follows the increasing order in the table, but
this hardware follows MTL (MeteorLake).

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 include/linux/pci_ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
index 275799b5f535..97cc0baad0f4 100644
--- a/include/linux/pci_ids.h
+++ b/include/linux/pci_ids.h
@@ -3065,6 +3065,7 @@
 #define PCI_DEVICE_ID_INTEL_82443GX_0	0x71a0
 #define PCI_DEVICE_ID_INTEL_82443GX_2	0x71a2
 #define PCI_DEVICE_ID_INTEL_82372FB_1	0x7601
+#define PCI_DEVICE_ID_INTEL_HDA_ARL	0x7728
 #define PCI_DEVICE_ID_INTEL_HDA_RPL_S	0x7a50
 #define PCI_DEVICE_ID_INTEL_HDA_ADL_S	0x7ad0
 #define PCI_DEVICE_ID_INTEL_HDA_MTL	0x7e28
-- 
2.39.2

