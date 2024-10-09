Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE5B18858E
	for <linux-sound@vger.kernel.org>; Wed,  9 Oct 2024 08:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728461506; cv=none; b=YopP/nLtd2JgdTk/R8FmJ1LLo8Fc701SYL/A6COBdIFVbQtBQcMaKyjtOT633bb7+yTc4L8pTa55WIapJsvrOu+fdkiktJGeXxNGJfKakcH4jspRJmcmYgAoIkyadph5SpUeqviQsFiR0V76Zr6wxmQ87pnjeSIYgB+9/1ZY3T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728461506; c=relaxed/simple;
	bh=v/ZgTTbXGnyP4nOL0UCA9iJQ4OPfrdEWYPOfVm3lk6Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=AM17Uce+4iMkJp9LZTg/FbyZebgswkKKSioyCg3J0k6fDRtL8eBoMR2f/ZiFZxKhyx9EHqdNPiFJyVZiVNPQCR8uI79G7NoHP8DRXxAzERtaU2HZ67XIVIE1p4rMqgBiKMd2W78JHurmTAP3/lSCa4ftRbQlsQ8ZhUOLwynXjGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KMB4FIYF; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KMB4FIYF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728461505; x=1759997505;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=v/ZgTTbXGnyP4nOL0UCA9iJQ4OPfrdEWYPOfVm3lk6Y=;
  b=KMB4FIYFND5WkfymIRo58Wti9GiZQtQb18My785Rp1RwlxmpMueC9MXO
   yOu/ed/ewDPFztDXydmVlZbgW2KhVH2zqH0FlFEs+9QOhXAuR/CYVAwKS
   GeciLZPzQmoNk2xQyrtr2Ob71USem8HlyHcX3x+SuEjYef+8TZ3otGgOJ
   vEj/Wy2dgjUTnf2IWXZc6pB11NpPsr97z+IV988zz5vJ5j9JhcVB6ZgXr
   use7FzXE0XMZKnwxrH305d83qvtlw42HXqoddn5vcaYeacE7jvHfcK7jY
   YpfPa9Oy5QrsYIbeJtDkdYbEaUZktJCaDATKxGuCBc4DOBJNfzVRFQPzz
   A==;
X-CSE-ConnectionGUID: CVKNAik9TM2WB0eSrx0YSA==
X-CSE-MsgGUID: vzHOCGmHQcGecbyMydzxug==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="38332451"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="38332451"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 01:11:44 -0700
X-CSE-ConnectionGUID: OEy7Pl0NQDuSSPOEF8/5bw==
X-CSE-MsgGUID: ZeAADyShQF658hbLjI5icA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="76049160"
Received: from dev2.igk.intel.com ([10.237.148.94])
  by orviesa010.jf.intel.com with ESMTP; 09 Oct 2024 01:11:43 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH] ASoC: topology: Bump minimal topology ABI version
Date: Wed,  9 Oct 2024 10:12:30 +0200
Message-Id: <20241009081230.304918-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When v4 topology support was removed, minimal topology ABI version
should have been bumped.

Fixes: fe4a07454256 ("ASoC: Drop soc-topology ABI v4 support")
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 include/uapi/sound/asoc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/sound/asoc.h b/include/uapi/sound/asoc.h
index 99333cbd3114e..c117672d44394 100644
--- a/include/uapi/sound/asoc.h
+++ b/include/uapi/sound/asoc.h
@@ -88,7 +88,7 @@
 
 /* ABI version */
 #define SND_SOC_TPLG_ABI_VERSION	0x5	/* current version */
-#define SND_SOC_TPLG_ABI_VERSION_MIN	0x4	/* oldest version supported */
+#define SND_SOC_TPLG_ABI_VERSION_MIN	0x5	/* oldest version supported */
 
 /* Max size of TLV data */
 #define SND_SOC_TPLG_TLV_SIZE		32
-- 
2.34.1

