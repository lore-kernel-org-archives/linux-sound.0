Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795340402;
	b=mkFiTQev3b6msPX/woPFZx4i9ZEE7xav1Sql20YKYyPs2/pUtdDbQl57oB6aJIs7eej3
	 6Q36yRFyRIHLkCtSdLmSyj7YWaVDSgcfWRnF6H20OODVcEUV+QYFhqNGD500B/F6CCbYe
	 M63wKchSdqeqgcLDHwPeHclftxltY4As7tuzWRGULRJ2LzL5ZEdUpEHYRi3aY67LLC9QD
	 YHHZ7P0tWHIYHebYFhTK4kywWhZhvWcgOKFAzgjAscMf9GQg2m9i19RO0fZWZ+7m5JvK6
	 8tcQ01dPkBwVoYJiIe87JH0ZMftDZyYSsH9oM5pymbJBVjOyM5ZFjL9+Lo7rfwJKujA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795340402;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=CycmHxaCiJOvL4NPfH+Dez8s6lB2IWXlSQgqmVyveYg=;
	b=R1zecuF2KZ1YTQBKktkxDdjjpoDO5CKeMK5AUmMReemVvICsp/Ik8r9sAibCyc6vaBzS
	 hU2/5vHNY+7oUWv8USfX3RhOjc+T8xn/+LaxHHpZDeK9/EP5lRx5p8y0EgCe2Se/B8Fr5
	 Qo+X5qB6oNOwaYN1qYpXuuKAwtTKNn7lPQlO5Ej4lUJW2DO88SDXe+N4PJSGrH1MV+FP0
	 W587oW1MaxMNuFXJzlSuxYMMYmMC7M404GXsXE8LVVe5loRKVsPH9WX5I78LyaLOLjglJ
	 anxFePkN6dM9tU7HVH+cFftdX72bdJ2qYDy+klKZdXlHNNruxopDgjGNJLiHbELHfsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LRBx+pdt;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57369606A330
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 09:40:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57369606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LRBx+pdt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795340402; x=1826876402;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=is4xAJZ9f5jWucS6/Dj9g5nYAHDxSOEyDfSzIi7Jk64=;
  b=LRBx+pdtJhGaHquSq5IBCE25XOrYjc11kgdfbXLITMiqfDXRwFzNWAFU
   z7bJDkLO1fN+4twf6qr7CycRD4DrMOZn2IJxxsqqTJhK4T4QLHv62hqU8
   dvIiHt7tcxmCcldJbb6Gw7RDBay4lz4G42TWdZpC2xeYo6t+8Yakh6EI6
   EGQihuhJdIHrQSxPZmJML/zbaWrcMCpLRfF83Q5kVSsULIhcPcaCFmMkW
   j8wXy5NiWrOfLF1Uvz/+6dVCm8FTAbbAlABzDh7kDzw+gUExuSeNgJTUS
   yFtG4nLADpslFmVl1J+Hqmfvo6TsCvH47zgBeYAJDQAc48Cyiwf3EgcS0
   w==;
X-CSE-ConnectionGUID: ntnv5fXISoi9aHvdGXygtQ==
X-CSE-MsgGUID: FtAz1w1dSF+2zYibqlxtrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4051544"
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="4051544"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 01:40:02 -0800
X-CSE-ConnectionGUID: rmPFdMSaQRiQLrKKMPprIw==
X-CSE-MsgGUID: 17UXEigBTxqum66mTTZHzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="12759947"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 01:40:00 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 2/3] ASoC: Intel: skl_hda_dsp_generic: Limit HDMI ignore to playback FE
Date: Sun, 22 Nov 2026 17:39:44 +0800
Message-ID: <20261122093945.2138118-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122093945.2138118-1-yung-chuan.liao@linux.intel.com>
References: <20261122093945.2138118-1-yung-chuan.liao@linux.intel.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When iDisp is absent, limit the HDMI ignore check to playback FE links.

HDMI-In links use names such as SSP%d-HDMI, and their stream_name may
contain HDMI as well. Excluding BE and capture-only links prevents the
HDMI-In capture link from being ignored.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/boards/skl_hda_dsp_generic.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/skl_hda_dsp_generic.c b/sound/soc/intel/boards/skl_hda_dsp_generic.c
index e7f5869ff12e..3c86bb6546dc 100644
--- a/sound/soc/intel/boards/skl_hda_dsp_generic.c
+++ b/sound/soc/intel/boards/skl_hda_dsp_generic.c
@@ -92,7 +92,8 @@ static int skl_hda_add_dai_link(struct snd_soc_card *card,
 	struct sof_card_private *ctx = snd_soc_card_get_drvdata(card);
 
 	/* Ignore the HDMI PCM link if iDisp is not present */
-	if (strstr(link->stream_name, "HDMI") && !ctx->hdmi.idisp_codec)
+	if (strstr(link->stream_name, "HDMI") && !link->no_pcm &&
+	    !link->capture_only && !ctx->hdmi.idisp_codec)
 		link->ignore = true;
 
 	return 0;
-- 
2.43.0

