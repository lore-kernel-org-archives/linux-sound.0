Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gLXFRn1H"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFA1E198
	for <linux-sound@vger.kernel.org>; Mon, 27 Nov 2023 05:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701090163; x=1732626163;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MKeHYQIcm37ccjV6yff59a6zCUoujh/0QydqqvKlRA8=;
  b=gLXFRn1HWnnThf8gcD8CXj7NP+hOZTIuDKV+nXEis8QEuu/DjUbD9BY3
   +U7/H7Zj9AACN3irPEMm8Js+kN2Cqf2u/bHF4fFf/9bpX8cE8dl3FkfMA
   3f5ZtY0TonqsebOMAmIyswNf/5AsPilaDg1rr1fbwtJu5fhSXGfAmwBPI
   9mO3ebpDwFYZuw/JSM0IbXB8I8ERhwgp16itjGaK4YN+wcsF/yEaLcwkN
   RQsbVgHyjWthEsqO1Odh8b6vpM4nhEzwkQMmDY6r3e1rouNgJpoAljoeO
   JtwjN34ja4IcV7CghNKKFqf9JPBhXD9V8ilCtdloU/fpYfdCUFG7UOP4B
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="391568036"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="391568036"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 05:02:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="797228703"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="797228703"
Received: from acornagl-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 05:02:13 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com
Subject: [PATCH 1/2] ALSA: hda/hdmi: Add helper function to check if a device is HDMI codec
Date: Mon, 27 Nov 2023 15:02:44 +0200
Message-ID: <20231127130245.24295-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231127130245.24295-1-peter.ujfalusi@linux.intel.com>
References: <20231127130245.24295-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The snd_hda_device_is_hdmi() can be used in drivers to check if the hdev
belongs to a display audio device.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 include/sound/hdaudio.h    | 10 ++++++++++
 sound/pci/hda/patch_hdmi.c | 13 +++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index dd7c87bbc613..cf5483d6b5b7 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -158,6 +158,16 @@ bool snd_hdac_check_power_state(struct hdac_device *hdac,
 		hda_nid_t nid, unsigned int target_state);
 unsigned int snd_hdac_sync_power_state(struct hdac_device *hdac,
 		      hda_nid_t nid, unsigned int target_state);
+
+#if IS_ENABLED(CONFIG_SND_HDA_CODEC_HDMI)
+bool snd_hda_device_is_hdmi(struct hdac_device *hdev);
+#else
+static inline bool snd_hda_device_is_hdmi(struct hdac_device *hdev)
+{
+	return false;
+}
+#endif
+
 /**
  * snd_hdac_read_parm - read a codec parameter
  * @codec: the codec object
diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 1cde2a69bdb4..d6943575c8c7 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -4645,6 +4645,19 @@ HDA_CODEC_ENTRY(HDA_CODEC_ID_GENERIC_HDMI, "Generic HDMI", patch_generic_hdmi),
 };
 MODULE_DEVICE_TABLE(hdaudio, snd_hda_id_hdmi);
 
+bool snd_hda_device_is_hdmi(struct hdac_device *hdev)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(snd_hda_id_hdmi); i++) {
+		if (snd_hda_id_hdmi[i].vendor_id == hdev->vendor_id)
+			return true;
+	}
+
+	return false;
+}
+EXPORT_SYMBOL_GPL(snd_hda_device_is_hdmi);
+
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("HDMI HD-audio codec");
 MODULE_ALIAS("snd-hda-codec-intelhdmi");
-- 
2.43.0

