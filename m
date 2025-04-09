Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5386F25D911
	for <linux-sound@vger.kernel.org>; Wed,  9 Apr 2025 10:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744195895; cv=none; b=dDXB8zOK46xEgzg/t7Yj4cPInkaazxWm83ZLOrzYyLixs8FOEUV2SISp4AEDJ8dwsFV3P/JZlSEvjqPHvGe59Jr2KPa39sPRVi0fOvLu9aoxJ0G65V2O+JBlzXHqnY4AXWb3GQcBeji0ZhUIU5KMz5wyu3J8LaU/UmxzNJRKR/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744195895; c=relaxed/simple;
	bh=UIm2xgMMzbCgGrUeyg/CFqfru4d+TTJow4fKf4Fflyw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iL+mj44Cvmb2JHXzm1Urr//UgPfJycK3EjIus17KfAt0LHfiHoQjJFOHmTwmBwIw6ehQZ5gW4zj3bm398NnfgWAQ7N1P7AQrrdz8b8YZw8GCEj499epqMlhofJHZD43CyoTj0anF3e0LtHjuzV5MiOhPg6qpqBzF67CB65J1mOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JxiYMT2E; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JxiYMT2E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744195893; x=1775731893;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UIm2xgMMzbCgGrUeyg/CFqfru4d+TTJow4fKf4Fflyw=;
  b=JxiYMT2Ew1blE0uNsvfi2YiWJZQR5gjzdgLwmEx7j/+5X7FgCLuNTt2X
   q350498vVHVU2hz2KSUsglHzPVUdTp1ADn8s+42BFqjEP+S/ZSjHDOsH+
   yBawlVcjX0+K/YsA+DCpWowPr7M4PNcydTtOr3Yu9IU/a9AYxUjiZFrre
   2QiswsEsO14W5hgSQjoCppBg806tw0aKzGrJxlH0Uh6GRmksf+5Oik7QS
   xytiIGDOCsQTiEvRpNgZ+nxrhFwQU5GuQ3C5Cba/3ymcFFiC7Zha+d30n
   s5Kakghgf8zbaXQKwlbigdMo8GzrE4j2R8MvtZoeZ1ebsXKMb3zPGyis7
   Q==;
X-CSE-ConnectionGUID: U4d2cz/zRRq/Lt1M5HMhdA==
X-CSE-MsgGUID: OhMXMKRgRKqrmFwWN7CuDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45380133"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="45380133"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 03:51:32 -0700
X-CSE-ConnectionGUID: jVRXJcwdSl+WwHTwJYeGMg==
X-CSE-MsgGUID: mAlclXiXSDakM2FmUqbRWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="133426257"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa003.jf.intel.com with ESMTP; 09 Apr 2025 03:51:27 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	perex@perex.cz
Cc: amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	gregkh@linuxfoundation.org,
	quic_wcheng@quicinc.com,
	mathias.nyman@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [RFC 13/15] ALSA: usb: Add getters to obtain endpoint information
Date: Wed,  9 Apr 2025 13:07:28 +0200
Message-Id: <20250409110731.3752332-14-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250409110731.3752332-1-cezary.rojewski@intel.com>
References: <20250409110731.3752332-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Intel's Audio Link Hub (ALH) requires information about the data and
feedback endpoints to manage the offloaded PCM stream properly.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/usb.h |  4 ++++
 sound/usb/card.h    |  4 ++--
 sound/usb/stream.c  | 51 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 57 insertions(+), 2 deletions(-)

diff --git a/include/sound/usb.h b/include/sound/usb.h
index b20badfda6a6..8f6e26d4de48 100644
--- a/include/sound/usb.h
+++ b/include/sound/usb.h
@@ -96,6 +96,10 @@ int snd_usb_bind_card(struct snd_usb_audio *chip, struct snd_card *card,
 		      struct usb_driver *driver);
 int snd_usb_bind_pcm(struct list_head *stream_entry, struct snd_pcm *pcm);
 void snd_usb_pcm_hw_init(struct list_head *stream_entry, int dir, struct snd_pcm_hardware *hw);
+void snd_usb_pcm_get_epaddr(struct list_head *stream_entry, int dir, u8 *data_epaddr,
+			    u8 *fb_epaddr);
+void snd_usb_pcm_get_epinfo(struct list_head *stream_entry, int dir, u16 *data_maxp, u16 *fb_maxp,
+			    u8 *fb_syncinterval);
 
 /* USB interface operations, see struct usb_driver. */
 int snd_usb_probe(struct usb_interface *iface, const struct usb_device_id *usb_id,
diff --git a/sound/usb/card.h b/sound/usb/card.h
index 6ec95b2edf86..00c6e9046296 100644
--- a/sound/usb/card.h
+++ b/sound/usb/card.h
@@ -21,10 +21,10 @@ struct audioformat {
 	unsigned char ep_idx;		/* endpoint array index */
 	unsigned char altset_idx;	/* array index of alternate setting */
 	unsigned char attributes;	/* corresponding attributes of cs endpoint */
-	unsigned char endpoint;		/* endpoint */
+	unsigned char endpoint;		/* bEndpointAddress of data endpoint */
 	unsigned char ep_attr;		/* endpoint attributes */
 	bool implicit_fb;		/* implicit feedback endpoint */
-	unsigned char sync_ep;		/* sync endpoint number */
+	unsigned char sync_ep;		/* bEndpointAddress of feedback endpoint */
 	unsigned char sync_iface;	/* sync EP interface */
 	unsigned char sync_altsetting;	/* sync EP alternate setting */
 	unsigned char sync_ep_idx;	/* sync EP array index */
diff --git a/sound/usb/stream.c b/sound/usb/stream.c
index 601dc9ed020a..8f8a049f5b43 100644
--- a/sound/usb/stream.c
+++ b/sound/usb/stream.c
@@ -623,6 +623,57 @@ static int snd_usb_add_audio_stream_v3(struct snd_usb_audio *chip,
 	return snd_usb_parse_pcm(chip, stream, fp, pd);
 }
 
+/**
+ * snd_usb_pcm_get_epaddr - Obtain addresses of the stream endpoints.
+ *
+ * @stream_entry: The USB stream
+ * @dir: Substream's direction
+ * @data_epaddr: returned bEndpointAddress of the data endpoint
+ * @fb_epaddr: returned bEndpointAddress of the feedback endpoint
+ */
+void snd_usb_pcm_get_epaddr(struct list_head *stream_entry, int dir, u8 *data_epaddr,
+			    u8 *fb_epaddr)
+{
+	struct snd_usb_substream *subs;
+	struct snd_usb_stream *as;
+	struct audioformat *fp;
+
+	as = list_entry(stream_entry, struct snd_usb_stream, list);
+	subs = &as->substream[dir];
+	fp = list_first_entry(&subs->fmt_list, struct audioformat, list);
+
+	*data_epaddr = fp->endpoint;
+	*fb_epaddr = fp->sync_ep;
+}
+EXPORT_SYMBOL_GPL(snd_usb_pcm_get_epaddr);
+
+/**
+ * snd_usb_pcm_get_epinfo - Obtain runtime information of the stream endpoints.
+ *
+ * @stream_entry: The USB stream
+ * @dir: Substream's direction
+ * @data_maxp: returned wMaxPacketSize of the data endpoint
+ * @fb_maxp: returned wMaxPacketSize of the feedback endpoint
+ * @fb_syncinterval: returned synchronization interval of the feedback endpoint
+ */
+void snd_usb_pcm_get_epinfo(struct list_head *stream_entry, int dir, u16 *data_maxp, u16 *fb_maxp,
+			    u8 *fb_syncinterval)
+{
+	struct snd_usb_substream *subs;
+	struct snd_usb_stream *as;
+
+	as = list_entry(stream_entry, struct snd_usb_stream, list);
+	subs = &as->substream[dir];
+
+	if (subs->data_endpoint)
+		*data_maxp = subs->data_endpoint->maxpacksize;
+	if (subs->sync_endpoint) {
+		*fb_maxp = subs->sync_endpoint->maxpacksize;
+		*fb_syncinterval = subs->sync_endpoint->syncinterval;
+	}
+}
+EXPORT_SYMBOL_GPL(snd_usb_pcm_get_epinfo);
+
 static int parse_uac_endpoint_attributes(struct snd_usb_audio *chip,
 					 struct usb_host_interface *alts,
 					 int protocol, int iface_no)
-- 
2.25.1

