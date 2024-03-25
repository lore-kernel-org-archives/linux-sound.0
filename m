Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9185D737
	for <linux-sound@vger.kernel.org>; Mon, 25 Mar 2024 22:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711405115; cv=none; b=O7CngQPE2GGNYTHZjIBl46lMOgrP1TYz9WB8qC5oCnrS7CR+9UgodQsZ3Reho8CNSLBNzbgVzY2Q+cBO1dCxE/iEr4cAJuwtYYsD9WqyX5PxLtgLkBsS9nwWZ9+NwBLEuDUUYZ8iaYa/eEUcqFm72HHQGp/4FbL/Ha/CScV05OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711405115; c=relaxed/simple;
	bh=aZ8MMlAsNmooCug9EY0e4T+B0db6AgX3G0/wpztkAFc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YiCtcv3+bfClqK3bzEEkAatX8Jmflr479Zqmr7jAB+TRda0gNUHx0ksVeBnfnV7cbGhhD/2LqOzvKHMVnUr80xjSSKPvcXzjaBGdOK63WvjAAg/cVzM4CpLRcb/TeKxay+frfpgDdC5PIAEntc95kkAQ3r8wycnDXzxav4eNXNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ldl/dRar; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ldl/dRar"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711405114; x=1742941114;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aZ8MMlAsNmooCug9EY0e4T+B0db6AgX3G0/wpztkAFc=;
  b=ldl/dRarDB6ZE7/yUCGLq54/P2J6AK+Ky8eI/vETbT7JORIQfTcKubp/
   MyoUM09UwEdaqzK55JyskdrFq4j8j3HVbIxP5qAKgxXdS6Idb9k5PHr28
   E/JyZMg3VYNWrO/gFKEz9+kE2KTYpmBcwztQP4ytYKk7QOIQp5rKFZ9XA
   Cf1s0yNveLM0nEDx3b9xKzAk1sTDGkX6SMes33Ax2t9v52QpAUxP3Egzs
   rFyZm9CbJZ7KRjciCgfzsNqHdW7XvPmjlyfJvkb4dsdfxgKGjbcPh68UA
   joVT9kmCuOwhf2AA7XyOl3VfPgl8FOLdwSiSb3jV0xpUTs/5AXRTKI14K
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6300373"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="6300373"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 15:18:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="20309646"
Received: from jaimbres-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.lan) ([10.212.98.109])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 15:18:32 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Chao Song <chao.song@linux.intel.com>
Subject: [PATCH 3/6] ASoC: rt711-sdw: fix locking sequence
Date: Mon, 25 Mar 2024 17:18:14 -0500
Message-Id: <20240325221817.206465-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240325221817.206465-1-pierre-louis.bossart@linux.intel.com>
References: <20240325221817.206465-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The disable_irq_lock protects the 'disable_irq' value, we need to lock
before testing it.

Fixes: b69de265bd0e ("ASoC: rt711: fix for JD event handling in ClockStop Mode0")
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Chao Song <chao.song@linux.intel.com>
---
 sound/soc/codecs/rt711-sdw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt711-sdw.c b/sound/soc/codecs/rt711-sdw.c
index 3f5773310ae8..988451f24a75 100644
--- a/sound/soc/codecs/rt711-sdw.c
+++ b/sound/soc/codecs/rt711-sdw.c
@@ -536,12 +536,12 @@ static int __maybe_unused rt711_dev_resume(struct device *dev)
 		return 0;
 
 	if (!slave->unattach_request) {
+		mutex_lock(&rt711->disable_irq_lock);
 		if (rt711->disable_irq == true) {
-			mutex_lock(&rt711->disable_irq_lock);
 			sdw_write_no_pm(slave, SDW_SCP_INTMASK1, SDW_SCP_INT1_IMPL_DEF);
 			rt711->disable_irq = false;
-			mutex_unlock(&rt711->disable_irq_lock);
 		}
+		mutex_unlock(&rt711->disable_irq_lock);
 		goto regmap_sync;
 	}
 
-- 
2.40.1

