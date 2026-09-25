Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146123C4B60
	for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 04:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790311766; cv=none; b=NPeITCVLeSMYPi55J7ANIvBIBN6im8bfD+1g8KVjNNkoTXtB5mTVcG+OYNn7uVN32yis5KG4LF/vbWhh2yun837XYbUr+YIE5lgLzoi2K4onK7O5o+g3AMlqMagPar7qQCreV7vC1afoYCTEJCOq4Mc7buvcmQ+Fyn8pEBfCPD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790311766; c=relaxed/simple;
	bh=Sw50ybQz8s9syiHD7m+se5DHakcc1EVB0zADgnHwXUg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l3HTaEB6ccg820+XRSO0YB38xq7yOJyuqOw7StOBhpTSLl00UskNFSnNEKXgJbTOVxt5WUEjub6LSUISk9sT5cfxslRHkYANKLq/UgGBkIjOLzl3FuADDIMWIlAX+V0UjfpvZAt2Vyj5vunTLLutyaNmN+ulIq60tF0fEFU38W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BP8fDhGH; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BP8fDhGH"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccafb752so297112a91.0
        for <linux-sound@vger.kernel.org>; Thu, 24 Sep 2026 21:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790311764; x=1790916564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5tULBCWFB/U0caaVPBQD4RzyLkFgB8apGNGUQ7Hv3hk=;
        b=BP8fDhGHtfva+EisZlk9FJ+Wc8gLVmk9yrAxL493rhPThKyDAJNcAZgBEP7bGydMDc
         LxyEXAZAKgPaW6d32sV/ajR51wEE4uGD8uDC65u3gdZhqRVuiZc3lv1mwFObEXso+dOD
         CFI9ArNSDsy/aXA8pCJjzJX0AmzYvB7HADiBjXa+a45b4gscr38PgbltljCDRkW0wWhB
         QzpSO0dkIWBt/li4RCeRmKsJzS3mm/bKgVfpLAgT1e687dcgoXZx8CO1T45mc4VQtPvp
         wjpAkYpm9wIa0Ym/sMYByXHo/8UI6ktku0hc24Bu1ab+pwUdzQZHr8cdedCRQSgLmik3
         UdHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790311764; x=1790916564;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5tULBCWFB/U0caaVPBQD4RzyLkFgB8apGNGUQ7Hv3hk=;
        b=ij4gR+LfpKIrveAcQ2ItEnhkPzMK59Zvo3ovK4WF1oDBH/nIB2pMsFP4IOKXc/MH10
         BmgjCe+GS+9EgWs70K/6RVa8HUFnu6wg6vx1bPRuxCJZ9wCBymeeQJWGUqnuRzOytKna
         xklnwY1tskd50QV0gIagsQOfRb1lOVH7WdUseMr8oy3TPFX9pKnxcKSjtpqFN50G9gSz
         ts7p6eUfVNGKZUb3n+ChGvzokSTBRwmOiaHrnwcQofH1tEAx0v61E2x0Y4WFOQzH7zDO
         ckFyfOkk4j4X/UEhAoENWZ7l+7l7rZD2Ht3X2wFlF9t3jBaTxEPVHhfXz5yQRwRz5QEY
         6M0g==
X-Forwarded-Encrypted: i=1; AKwUvBzKeJPTl3aMhIPgKzp3HBNYwZwbDJ0dfeTeHN1dpzGJ0pZjtHT2winDMOPq4HHyBkiyO72uF9GgKksixg==@vger.kernel.org
X-Gm-Message-State: AFuF++kzzQhQ9I96cKthXNPLfuKkOGuuvhBCvivoCyGnjq4lsDImH4jL
	2r0dHYV0JAcaKvi6xeAiKotiXkmx8cHGx0vlq+5/RG48JDuIfArmi5zI
X-Gm-Gg: AYBFou3XJmSpHxBhME1KD9CV4qSJoQLjjQvz+Nt89E6O9eGsWp2dRtCSZw4GUIDwJqy
	mgcB4NBBQbJIjBhDZoBdGItMnheJTnZRbpQ9JQjNvyc1otLBK8AHk4+gg7XWshGQff2SLJyHzkp
	/POy68lfJ2OW6CFwGUArQBWkOD8BV2w5EtwD6VFW9s7lxg9cdmsAQ1fFfa46tN9mrxAir9bVLN6
	+Is9NweiFIsaeLL8XnwmilY6u2EZx4p+FYeTLQUFru2+MaD4vfi9vth1/3JT3QumJtMib29hwlh
	LcyVd++QGG7FYSdgPJywfEx8i+Cy2zH2YpoUxkqq+QvISwnihpfcGICiAeL3jG1kDqzlVHpyDoH
	7CHkb/oUyfatvEWvHh8L3J3TSyB1EFavfNR6EBML0GNYGprUrxo00S/tqMabHlgXr3Y4ayuI1Zd
	57jdl7P/hZNxlTchHX75lJgBxntOZHvFL+rTf+A9lUBPi98FHw1cc21Jr3GbM1BREANn+ZtCXfs
	xDRyTOwXoo8sFzKkR64YPbB4yZ+8FDh2GF+6bA6LIbTHfnItwveZWbvECTL+ZMFtS4QtY8+ddk0
	fsAq3RSnh24nng==
X-Received: by 2002:a17:90b:3c4f:b0:39e:6c69:7775 with SMTP id 98e67ed59e1d1-3a09898525fmr4416407a91.30.1790311764283;
        Thu, 24 Sep 2026 21:49:24 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976cacbesm8151528a91.13.2026.09.24.21.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 21:49:23 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 00/14] ASoC: mediatek: mt8195: Fix clock error handling
Date: Fri, 25 Sep 2026 11:48:54 +0700
Message-ID: <20260925044908.450775-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all, 

This series improves error handling in the MT8195 ASoC driver,
mainly by checking and propagating errors from clock operations.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (14):
  ASoC: mediatek: mt8195: Fix tuner clock error handling
  ASoC: mediatek: mt8195: Use dev_err_probe() in mt8195_afe_init_clock()
  ASoC: mediatek: mt8195: Fix register access clock error handling
  ASoC: mediatek: mt8195: Fix timing system clock error handling
  ASoC: mediatek: mt8195: Fix paired memif clock error handling
  ASoC: mediatek: mt8195: Fix FE startup error handling
  ASoC: mediatek: mt8195: Fix runtime resume error handling
  ASoC: mediatek: mt8195: Remove redundant error message
  ASoC: mediatek: mt8195: Propagate IRQ lookup errors
  ASoC: mediatek: mt8195: Fix ETDM MCLK error handling
  ASoC: mediatek: mt8195: Fix ETDM startup error handling
  ASoC: mediatek: mt8195: Fix HDMI TX startup error handling
  ASoC: mediatek: mt8195: Fix ETDM probe error handling
  ASoC: mediatek: mt8195: Fix clock parent error handling

 sound/soc/mediatek/mt8195/mt8195-afe-clk.c  | 69 ++++++++++----
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c  | 98 ++++++++++++++------
 sound/soc/mediatek/mt8195/mt8195-dai-adda.c |  3 +-
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 99 +++++++++++++++------
 4 files changed, 196 insertions(+), 73 deletions(-)

-- 
2.43.0

