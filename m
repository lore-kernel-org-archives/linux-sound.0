Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE4E322E
	for <linux-sound@vger.kernel.org>; Tue, 27 Aug 2024 01:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724723040; cv=none; b=KQEsPURQ+oNTSd5OXs1fXTnNm9BV2akaqx6Xx9N5QEUtWYdFvPjXIg76GFtRFX32t6mZThhMEa7ekyUnxIw1cqBMiQ4tz9TMxx5KBt8rgTnxHnsfxlNCgTOxlJZx5jIViQLFqSbhiSCW3gxJ7FfV9KwjCLlBgLybNkoLuXTSe7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724723040; c=relaxed/simple;
	bh=+erI0cZfbAPbte3WK3rAmGM0TnJT/SoElDyA6rCuVSc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VXAw+giHInzLfhhoG+ihUpurJ/VwZ1QVjK4w0osAYM4bo9WbLit+5AU4ETwA9jGgAXEFFLZjzwGGJ9CeMIMMN+dowe2D1LOpp82VL8xjULunY37w4eQWGewgzGionXUEWUIsETQg6al23LTkMvEGqTdXjLSR9z9p/aYsL0awkvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VyXk3sc+; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VyXk3sc+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724723039; x=1756259039;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+erI0cZfbAPbte3WK3rAmGM0TnJT/SoElDyA6rCuVSc=;
  b=VyXk3sc+9+/69aH/9h7d/I/HG/ttxVtRCR+p/mF61XSIH6Dkn3cwPq1s
   7m26taUT6hwSf3J711b3twnlqWkjKXjruKjN/SlXlqNEDzzL2/Z6v1+w+
   7AcC4mPCd7fSwGDxCTr4udO8vaQqPxxWgOYq6etJLR1dhMepw0qN4jXc2
   D3ApiLYZmmXuLGHn65zuw5je+qYj20t+qKRTINciCL0U/Fua+n12F3yW6
   dtJpa7yRtclCuorE6c2tPG400UVO5ZY5HiZ1MQ7s7u7aO6wl0xdW1xS1d
   6DZXkPjTmlqIDVAcT1uU319pNUK8ON7Y9skAIk0b6DU4voevXQnRyiKCy
   A==;
X-CSE-ConnectionGUID: XIyXzBvsRW+cj/lOoUi8Zg==
X-CSE-MsgGUID: rz9w1WDHTv+aqgtIzqOjdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="22984896"
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; 
   d="scan'208";a="22984896"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 18:43:59 -0700
X-CSE-ConnectionGUID: v/calaQ3RMePeIxEazJZtQ==
X-CSE-MsgGUID: VQzuEnLiQdGh5SNpFmknkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; 
   d="scan'208";a="63427846"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.118.39])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 18:43:56 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 06/16] ASoC: Intel: sof_sdw: move ignore_internal_dmic check earlier
Date: Tue, 27 Aug 2024 09:43:18 +0800
Message-ID: <20240827014329.6542-7-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240827014329.6542-1-yung-chuan.liao@linux.intel.com>
References: <20240827014329.6542-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dmic links will not be created if ctx->ignore_internal_dmic is set, and
dmic_num should be 0 in this case. Move ignore_internal_dmic check
earlier where dmic_num is set to get an accurate dmic_num.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 9b642c6883b0..3781a27bfbed 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1102,8 +1102,12 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 		hdmi_num = SOF_PRE_TGL_HDMI_COUNT;
 
 	/* enable dmic01 & dmic16k */
-	if (sof_sdw_quirk & SOC_SDW_PCH_DMIC || mach_params->dmic_num)
-		dmic_num = 2;
+	if (sof_sdw_quirk & SOC_SDW_PCH_DMIC || mach_params->dmic_num) {
+		if (ctx->ignore_internal_dmic)
+			dev_warn(dev, "Ignoring PCH DMIC\n");
+		else
+			dmic_num = 2;
+	}
 
 	if (sof_sdw_quirk & SOF_SSP_BT_OFFLOAD_PRESENT)
 		bt_num = 1;
@@ -1148,14 +1152,10 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	}
 
 	/* dmic */
-	if (dmic_num > 0) {
-		if (ctx->ignore_internal_dmic) {
-			dev_warn(dev, "Ignoring PCH DMIC\n");
-		} else {
-			ret = create_dmic_dailinks(card, &dai_links, &be_id);
-			if (ret)
-				goto err_end;
-		}
+	if (dmic_num) {
+		ret = create_dmic_dailinks(card, &dai_links, &be_id);
+		if (ret)
+			goto err_end;
 	}
 
 	/* HDMI */
-- 
2.43.0

