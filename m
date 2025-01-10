Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41E92080D2
	for <linux-sound@vger.kernel.org>; Fri, 10 Jan 2025 11:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736507990; cv=none; b=NYh2bkIX/b3vg+fkHbiWbc8+ivnMMWqAp+VTpSf7xsoTd1CJ9MPzdgmlHFCQ4jTxva31r+p3C/JrKEdrZzxCjXutWjMTM6eChMStd8puWxHlunxQy7f4NxbEZj7d/+59xkmmvNKifiqOn41lJSJnzr9brgH4Cg+U4ATBNhayK7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736507990; c=relaxed/simple;
	bh=QQ93ztWZgVFjryLO/cktX+Up93zJbTepRuaL/pLm7hE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=A5b3D3A9CMl0dD6H3hyvWH9V+1ecUaXRI5JTzEvI4ja3sw/TCuAosBUVfFDvjlXbNqLbdfQ/YdrR3KkPIXZxjtt+GyPtKsbChO3BqOUmNsOQv770qXISgezY5+iImYmPqPRilnB+L7c+e2pptS2EIspFeYjoncVZm80L2oTXueM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JADLyhdf; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JADLyhdf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736507989; x=1768043989;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QQ93ztWZgVFjryLO/cktX+Up93zJbTepRuaL/pLm7hE=;
  b=JADLyhdf1ImpNXxWFFeGbOCIrx5TQVqgFzLIoS74m9eh5+1CAZXCwqNM
   irwZ/N//5YqXwx1g8finMuaoB/a2D6S6MAc4T0OVhnk2e72HYJCzekOdi
   wDADaoSMAr2VKTOPHI+8V+u3fwTkfCcm3gDHvdhZLFlnFwm14jVa8LdWP
   piTjbz6pYbe5Y5laS4NPtHM27PQixZLoDntuM2LcaFYPc91PWf5XJQ+vb
   ohP4qRvGmAEIzh5PD+57tWF7DCVGtWCmT0Ec1m3w73+fITlx0f6U3Fo1Q
   PLu8OkT1dsoTuR4xJotUF/cJMcjHglz4DLMfhMcv08WiugY8KUs/BIHox
   g==;
X-CSE-ConnectionGUID: USeECZZqRYyCEr6XvXI3JA==
X-CSE-MsgGUID: wyLgOAsyRoulkhJA622nKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="47373023"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="47373023"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 03:19:48 -0800
X-CSE-ConnectionGUID: Id/EoQCuRtmGNW3h6Mq0Ig==
X-CSE-MsgGUID: wevCyGW/Q4+oCF79XSeiDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="134609916"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by fmviesa001.fm.intel.com with ESMTP; 10 Jan 2025 03:19:47 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	broonie@kernel.org,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 2/2] ALSA: hda: Transfer firmware in two chunks
Date: Fri, 10 Jan 2025 12:33:26 +0100
Message-Id: <20250110113326.3809897-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250110113326.3809897-1-cezary.rojewski@intel.com>
References: <20250110113326.3809897-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As per specification, SDxLVI shall be at least 1 i.e.: two chunks to
perform a valid transfer. This is true for the PCM transfer code but
not firmware-transfer one.

Technical background:
- the LVI > 0 rule shall be obeyed in PCM transfer
- HW permits LVI == 0 when transfer is SW-controlled (SPIB)
- FW download is not a PCM transfer and is SW-controlled (SPIB)

The above is the fundament which AudioDSP firmware loading functions
have been built upon and worked since 2016. The presented changes are to
align the loading flows and avoid rising more questions in the future.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/hda/hdac_stream.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/hda/hdac_stream.c b/sound/hda/hdac_stream.c
index 2670792f43b4..18d74a28a246 100644
--- a/sound/hda/hdac_stream.c
+++ b/sound/hda/hdac_stream.c
@@ -455,6 +455,7 @@ static int setup_bdle(struct hdac_bus *bus,
 		      struct hdac_stream *azx_dev, __le32 **bdlp,
 		      int ofs, int size, int with_ioc)
 {
+	u32 bdle_size = size / 2;
 	__le32 *bdl = *bdlp;
 
 	while (size > 0) {
@@ -469,7 +470,7 @@ static int setup_bdle(struct hdac_bus *bus,
 		bdl[0] = cpu_to_le32((u32)addr);
 		bdl[1] = cpu_to_le32(upper_32_bits(addr));
 		/* program the size field of the BDL entry */
-		chunk = snd_sgbuf_get_chunk_size(dmab, ofs, size);
+		chunk = snd_sgbuf_get_chunk_size(dmab, ofs, bdle_size);
 		/* one BDLE cannot cross 4K boundary on CTHDA chips */
 		if (bus->align_bdle_4k) {
 			u32 remain = 0x1000 - (ofs & 0xfff);
-- 
2.25.1

