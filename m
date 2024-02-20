Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC296773B
	for <linux-sound@vger.kernel.org>; Tue, 20 Feb 2024 11:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708429759; cv=none; b=YAjL9cBOeW+PV+HXibSuLnSfONgU4sYOH3DDiC9utWVSxqiYJnUVXSIvbpxahJay61QsusywlNeD4J+v1E6TgiRO/Kc2uDGR9Y7Uk2LWTbdn9BJZ3+dNUgzmFfDkvrlrsV4wcBexer7nNoP3zenlaII8102QgoHuUiCdxNoLVYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708429759; c=relaxed/simple;
	bh=ovZnYDdmAQI7rXlK0aS2n+UC6x/9BooKMiz/Jy6lbxk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TTlCQTtVnvfhl9/amP+8x3NvM9iXp4FxYAFvcMQ/WaAVmmxvnOSb9iuKc94h2s86gOsBe7UqVMLa8Pt2Qg2L1mn01swAFuWbRozSJ4ZUrD1DewoSQ9/H2gawXarjjCpmWP4r2lDInUZZvwc6Ab1byzt/N7XI+zMu2zC/zR8S4qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hxLF1LoQ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hxLF1LoQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708429758; x=1739965758;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ovZnYDdmAQI7rXlK0aS2n+UC6x/9BooKMiz/Jy6lbxk=;
  b=hxLF1LoQU6VlXXa42fl5z5ulC4/ld9CeE53FE/hsNz6+9AWM0w1z5R5Y
   QKzeYVKMeO+U6z/MGLlJbCfwfWOx262B1rPoJ8S6YeYFdR9zI1qXfCEYh
   DrgLn9f4/Hrg5nkQTPrdW8bpSoZr3jKt42B1fPQo3eaRfwwB/N40rxGNz
   S916F0ErAc/xq/+qg58Fs/dUYZmAeyFmuZE5XQSYI6OcJ4aQAs+4X7GHg
   EO33L8BEP18FPn4QbxDKPeb+dUkCrNfoEJ7BeCC0qLrePxtKU7UiZzrN1
   OlGex13MCtDGIxJeeCe4KO7G/SW2BDUx6VMVZ1BdgyxnXQzwNmZSn9VtS
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="2988916"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="2988916"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 03:49:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="4750941"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa010.fm.intel.com with ESMTP; 20 Feb 2024 03:49:15 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 01/10] ASoC: Intel: avs: L1SEN reference counted
Date: Tue, 20 Feb 2024 12:50:26 +0100
Message-Id: <20240220115035.770402-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240220115035.770402-1-cezary.rojewski@intel.com>
References: <20240220115035.770402-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Code loading is not the only procedure that manipulates L1SEN. Update
existing mechanism so the stream starting procedure can interfere with
L1SEN without causing any trouble to its other users.

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/avs.h  |  1 +
 sound/soc/intel/avs/core.c | 11 ++++++++---
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index 69c912feb8a7..1882b2e640f4 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -127,6 +127,7 @@ struct avs_dev {
 	int *core_refs;		/* reference count per core */
 	char **lib_names;
 	int num_lp_paths;
+	atomic_t l1sen_counter;	/* controls whether L1SEN should be disabled */
 
 	struct completion fw_ready;
 	struct work_struct probe_work;
diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index 273a90216856..d46f76f8c274 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -69,9 +69,14 @@ void avs_hda_clock_gating_enable(struct avs_dev *adev, bool enable)
 
 void avs_hda_l1sen_enable(struct avs_dev *adev, bool enable)
 {
-	u32 value = enable ? AZX_VS_EM2_L1SEN : 0;
-
-	snd_hdac_chip_updatel(&adev->base.core, VS_EM2, AZX_VS_EM2_L1SEN, value);
+	if (enable) {
+		if (atomic_inc_and_test(&adev->l1sen_counter))
+			snd_hdac_chip_updatel(&adev->base.core, VS_EM2, AZX_VS_EM2_L1SEN,
+					      AZX_VS_EM2_L1SEN);
+	} else {
+		if (atomic_dec_return(&adev->l1sen_counter) == -1)
+			snd_hdac_chip_updatel(&adev->base.core, VS_EM2, AZX_VS_EM2_L1SEN, 0);
+	}
 }
 
 static int avs_hdac_bus_init_streams(struct hdac_bus *bus)
-- 
2.25.1

