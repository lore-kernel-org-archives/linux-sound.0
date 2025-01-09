Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BD7217667
	for <linux-sound@vger.kernel.org>; Thu,  9 Jan 2025 12:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736426285; cv=none; b=GwPzo0ZeqHYq1NHZ7rKbfII9+//1yHf1ZBlvi77Pa0qDhz5gNpbTHJo3Lf8sUm00sHy29DSKvFzoQh+y/LqAAdfTFmupcy0JuaSuAOyyltpfJ2hbS5haauBvEHsbSMjWcnWO+80ji8iYKh4MwAcVkL01poUwDpj8SKGv6qGMdfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736426285; c=relaxed/simple;
	bh=QQ93ztWZgVFjryLO/cktX+Up93zJbTepRuaL/pLm7hE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jgOvi1H/riud5FC0SeqC9Ww6i/CaF75zhqzwe/n+8Ccgam0lYN3iOCf68HoFEszQFbZypo7l14ptX4fcxfJ1W2PmuUPpKih0QloHGIWqt7tpArXjwvYv2x0wkEbA12wGGycM4tTHP2h+LCsyyKgrSVWdv8X8Pxr1fnAacZNPzxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M16AqScW; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M16AqScW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736426284; x=1767962284;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QQ93ztWZgVFjryLO/cktX+Up93zJbTepRuaL/pLm7hE=;
  b=M16AqScWI8HBDd4WKfRPL5wMRvZvf3NqYeCkNOi4UZTuUb2ZLtAtBfln
   Bmd5zaZ3izxUrHlJxnQfEaZAzFP5zFAtOVwPW3+7VFeFjiklBuZeeSaDv
   3DfvW2TdMpXDWzqHOWnHPV677KV4P/WkwPeflViW7b0EOPrzO4kOIpjxG
   uFHe07rc3tYCS0Smm36HYlF6lAfRxylt552q4+AUifJzAPJuSKKNqxOds
   P3/XUGSOMuqJInA7OZ/oTfU5kSNUodI/KkxAICgFkMeG14F7H5Q7PFJCb
   LJ9ECtqK1WOAyY3naYWb1IqGoP+vd50CssWakgtoGEZPYtjGM9h9or2lT
   Q==;
X-CSE-ConnectionGUID: ZVrkyU/mQsWr9i3CZpQNPg==
X-CSE-MsgGUID: BWWxqcTWQC6/6yxKPiTg8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="40449789"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="40449789"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 04:38:03 -0800
X-CSE-ConnectionGUID: EpCJ11sPSj+8rDBPKsjR0A==
X-CSE-MsgGUID: XIXKgLHFRXOj4aWA8xtnTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="103194348"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by fmviesa006.fm.intel.com with ESMTP; 09 Jan 2025 04:38:01 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	broonie@kernel.org,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 2/3] ALSA: hda: Transfer firmware in two chunks
Date: Thu,  9 Jan 2025 13:52:03 +0100
Message-Id: <20250109125204.3668961-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250109125204.3668961-1-cezary.rojewski@intel.com>
References: <20250109125204.3668961-1-cezary.rojewski@intel.com>
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

