Received: from cmccmta1.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57DCC17C9AC;
	Wed,  9 Oct 2024 07:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.22.67.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728459592; cv=none; b=aXym6hmotRHVE3vK7rAKeSnUBqVfvFZkVZA2SroFmRGIn4QBdcTb+yZ+roCCivWsNu6FqQOSTQ2ZES0cK0bamE5xhxY0iS0X0nq0mwGHOCdp8dg2NBTVdCX42mbnLJmTe6lQ8ipzZz484NoyLJNriBEi+RZ5Yd1pZvWlGQmzzXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728459592; c=relaxed/simple;
	bh=EIblVUPShlUFmQ/WUe97ldk8Qs/Ts9lujgAx4hFJObo=;
	h=From:To:Cc:Subject:Date:Message-Id; b=u1mU7EfsZKMVHXh03III5Fq2r+aA7AbpIHPFD8DZ2iMnfy9Jl/6cTPN0w3uOTQwk/zFPDYkR+A/spDx9byTW4A8cSzbI66PEVXl3ddtdflRVcl+EvlCdLaHUYDXC3g0Z4GFQCNY8NX/IH7Zr8+ry85K/z40SaWz1IVLDaRdmFRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass smtp.mailfrom=cmss.chinamobile.com; arc=none smtp.client-ip=111.22.67.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app03-12003 (RichMail) with SMTP id 2ee36706333b87f-ba099;
	Wed, 09 Oct 2024 15:39:40 +0800 (CST)
X-RM-TRANSID:2ee36706333b87f-ba099
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from ubuntu.localdomain (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr05-12005 (RichMail) with SMTP id 2ee5670633392e0-dec45;
	Wed, 09 Oct 2024 15:39:40 +0800 (CST)
X-RM-TRANSID:2ee5670633392e0-dec45
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: tiwai@suse.com
Cc: perex@perex.cz,
	wangweidong.a@awinic.com,
	andriy.shevchenko@linux.intel.com,
	heiko@sntech.de,
	kuninori.morimoto.gx@renesas.com,
	nathan@kernel.org,
	zhujun2@cmss.chinamobile.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH] ASoC: codecs: Fix error handling in aw_dev_get_dsp_status function
Date: Wed,  9 Oct 2024 00:39:38 -0700
Message-Id: <20241009073938.7472-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

Added proper error handling for register value check that
return -EPERM when register value does not meet expected condition

Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 sound/soc/codecs/aw88399.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/aw88399.c b/sound/soc/codecs/aw88399.c
index 8dc2b8aa6832..bba59885242d 100644
--- a/sound/soc/codecs/aw88399.c
+++ b/sound/soc/codecs/aw88399.c
@@ -656,7 +656,7 @@ static int aw_dev_get_dsp_status(struct aw_device *aw_dev)
 	if (ret)
 		return ret;
 	if (!(reg_val & (~AW88399_WDT_CNT_MASK)))
-		ret = -EPERM;
+		return -EPERM;
 
 	return 0;
 }
-- 
2.17.1



