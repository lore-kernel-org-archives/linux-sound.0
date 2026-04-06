Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEEF22538F;
	Mon,  6 Apr 2026 07:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775461769; cv=pass; b=c7Pu5CCrPrYYt7nxyw1eVbOFl0Om+hCH2k2dswbml+SiMnOo4f6yN+1WrzyX5rWXTRbUUhKfkbCRgZ/9ykTub0//vTgIMH/TOVB3nW6+ApqP0OHAXPLbVEMXh1W36WrTrsNVLRaRgiETsoKX4i9y1gZvdj9NbrrbT2RjOLcIl9s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775461769; c=relaxed/simple;
	bh=+YlaVWvEscZ8m1i8NltwtNzqHZS/9Gw7+6n26+gEFSY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZZucdtsQSNZPPTS3Liqryg97RIqmiZ5r08z2kY+Jsb6kXZpHqLWkHGZJGfL28OulZFWwh3UDBDxMdWd89JVTkpA+DJdbm55BpyKMs8ged+3BLum4cdi1/uNy1SZgtwvMK1MdJBVFV/T4/1s9uk3smIf72kdfpc+7Lm6/Rgsuse4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=harin.net; spf=pass smtp.mailfrom=harin.net; dkim=pass (2048-bit key) header.d=harin.net header.i=me@harin.net header.b=OaoYwc3h; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=harin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=harin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=harin.net header.i=me@harin.net header.b="OaoYwc3h"
ARC-Seal: i=1; a=rsa-sha256; t=1775461759; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YxUpJR5TSSG6iI46PJ1A7ZrKFEMq9aFMsnrL1ChLAOGt8nujQ90DLlj+shv1UJ4U9ibTgq9sJAIIB6ngrKmxu1l77MrOTeTWu2y4FF8oC/qV8nVGgITw12B6Z31BmJwoNHTxfQFl0t/emXuw9AzNLLcPb/Xl1hJY9OhNYB0/9Tc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775461759; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=CSTLe8xhfsYZxmuCXyS3HgJsFRywF28HW94FGw/LwKQ=; 
	b=Bpd6GRaMmD4GqoKru4thlK0ILPsdW0utRsXFMw0cuf/TNp0c0vFdcHt5lWaqyFm2PLQB2ly3TejXvubll8X+po5OinKWfDK4WxR+lnlE7VXhHuK8B/EG9EDiWHoCcK/uHNe1P8+qvgfyfaxYwAJH5gkFq4nOOQa+O0Fhf4MSLdI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=harin.net;
	spf=pass  smtp.mailfrom=me@harin.net;
	dmarc=pass header.from=<me@harin.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775461759;
	s=zmail; d=harin.net; i=me@harin.net;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=CSTLe8xhfsYZxmuCXyS3HgJsFRywF28HW94FGw/LwKQ=;
	b=OaoYwc3hD6AkLYS51JdxmNt7fdCYSffphl8WA3Capo7HbOcm4xEz4vaM7plwFdJo
	dDgNB0Ex2NRIiSP8U18qXQmkTe8ynRNya/DfPLiEyW1QXSzM+m2IjCeQ9ENtqzUOHCp
	eaZrIXWXcNsZHIskZuUBGYPse+kn32FhjHQ5N3uWxQigCYz3PC+pii1hkqPfYQiNA8W
	vFQ2FFgaVJz/5dX63VBeclFUjFu7tupAGQCK8wSc8udPQPjPFNfjvSLiuHbgMBNr1xX
	gAKc2QcTSO8a4kaP9bD6JpHIha4oW9k7OFMO/nqYqu73h5IOxZYeZKbJz1w/qyKeOV/
	KIAEkvPONQ==
Received: by mx.zohomail.com with SMTPS id 1775461757472716.3654522882999;
	Mon, 6 Apr 2026 00:49:17 -0700 (PDT)
From: Harin Lee <me@harin.net>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Harin Lee <me@harin.net>
Subject: [PATCH] ALSA: ctxfi: Add fallback to default RSR for S/PDIF
Date: Mon,  6 Apr 2026 16:49:13 +0900
Message-ID: <20260406074913.217374-1-me@harin.net>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

spdif_passthru_playback_get_resources() uses atc->pll_rate as the RSR
for the MSR calculation loop. However, pll_rate is only updated in
atc_pll_init() and not in hw_pll_init(), so it remains 0 after the
card init.

When spdif_passthru_playback_setup() skips atc_pll_init() for
32000 Hz, (rsr * desc.msr) always becomes 0, causing the loop to spin
indefinitely.

Add fallback to use atc->rsr when atc->pll_rate is 0. This reflects
the hardware state, since hw_card_init() already configures the PLL
to the default RSR.

Fixes: 8cc72361481f ("ALSA: SB X-Fi driver merge")
Cc: stable@vger.kernel.org
Signed-off-by: Harin Lee <me@harin.net>
---
 sound/pci/ctxfi/ctatc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/pci/ctxfi/ctatc.c b/sound/pci/ctxfi/ctatc.c
index 516c0a12ed9f..02fe09330939 100644
--- a/sound/pci/ctxfi/ctatc.c
+++ b/sound/pci/ctxfi/ctatc.c
@@ -794,7 +794,8 @@ static int spdif_passthru_playback_get_resources(struct ct_atc *atc,
 	struct src *src;
 	int err;
 	int n_amixer = apcm->substream->runtime->channels, i;
-	unsigned int pitch, rsr = atc->pll_rate;
+	unsigned int pitch;
+	unsigned int rsr = atc->pll_rate ? atc->pll_rate : atc->rsr;
 
 	/* first release old resources */
 	atc_pcm_release_resources(atc, apcm);
-- 
2.53.0

