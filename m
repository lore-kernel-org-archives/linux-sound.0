Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759CF3C09E8
	for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 05:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789534903; cv=none; b=Jxq6Hty9wLOA7+VsWriweFY8uQPM4VWQ1s1uzhoNNobz44Gu0PAZRRQP/Os6f8gfsPYQ6KKs0P8bJeh8jacbofkd7ffc+6OeDx5Ied1XpcAwtZ2itgEpy4eu0sQpxMEC2lnE3xWTb47u7r27psZ2EpD2heNpokEKs939/icdQa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789534903; c=relaxed/simple;
	bh=IsAFDMAvv2PPza76qRYZGtakVEj0dj2ce+A6qA3jXuQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eaABAWN2A5g6BXC0FNLxFtmL11w8xHKitW2rPk8XcF9P9CXUWDND57HaWAlvmIo2BimQfVF+XTyEYfoyUKJVkyRvsVtPlJd9RKnXrDxelmeWSa6tbY6kqOpVnXvyt0+WCMc8fYlsQEs+F/gKWNDUolxhscSVHbYIIYAbh8wVtWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WITcWrT8; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WITcWrT8"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4cacd3409so531913a12.2
        for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 22:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789534901; x=1790139701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9y50VuB/l2kLa1542VqPbt/G57KIRr9fbdB6tbrEkBk=;
        b=WITcWrT8GNIxsSx4IDqcvl+ToelDc9QjLr/ONjAKVBPkzvrsiKTWWM11v6zXPVx6cX
         2E7zvRXl6OAttcMA6ABD5qDPofNoDHhYnPdA3c9K2CuNayLVd/RCHzKfmRJ6jY2nwQwf
         lNRyLxNjD1BmVL3tyK2AcRVFX2x+7B3XNabffue9spcylKlb2ClMcGXvSvilqCFHvOA3
         GcYToDgrNIXWC2OrGLjBDBbSRNOjTXvi+/owpeF+h/XS5JHNrKgw5HujcfJ9Adubm/B2
         KWnQQOdGcHTgMaN34z48Sw5gXer7lfxEZEps4/I7s0ZNniESaDdLzOLlBcud26+2usmr
         Z93g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789534901; x=1790139701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9y50VuB/l2kLa1542VqPbt/G57KIRr9fbdB6tbrEkBk=;
        b=mKgxO5B5jx123Ni2++tChahQVbyhc9zmXfHA+8leQgBwaZImMvZxDYcb7V/0QDB+Vf
         z6qgCceceDmORHt/nKcRpI+NZrZw5dgB8QT2d+5NEMQOCiMqp5QXNxuEMSMyv0VFAYlE
         qUQ3bcQYFPTLQ9Pz4qyq7R2FCoHR0YcdkEQjfJa+jVX/46kW1lufXaKupmlWPhiW1zhP
         PPVPilcocxkcnO8kpZFXuiFjl0ADuPm8/w+a9Sqb2mxmKVqKY0NyavmYPLbSb5RJ1SVx
         cLhFXO+UjDf/aNvH6EqIQlZeaeOIjh6ZtLqV6zGgw7IXDi7Ss+RH3naTwPt/ljOd1rKt
         z8pA==
X-Forwarded-Encrypted: i=1; AKwUvBw8K4ADUZdIMBCG3dnkF9/f9NGelH8TTwu8mtVkJTWBwo7idGeQzEDKpxX6wxfX4SftvglwFPQBT7an4g==@vger.kernel.org
X-Gm-Message-State: AFuF++k9Hz+b2ruKtOLev2T3Hm9Z3EeEyeKageGXBRoLALMykb5iPxoc
	ic96yILIXdRCZtCgwf4ORJBw3ieRPadi4jv25QzQoEXKnjggLR/iMMFX
X-Gm-Gg: AYBFou19//O4KCI0TE9CnEFXHOQAyqim4w6VMk/k4wOxYiVuvfrvkCZ/7bOx+HWUoQX
	WVjmusIUpS1bKsjryrGOawRXci9BW+i9dAMdZu1JH7aCsEsr8eWrxCJ5CxgqbR/6EfKQ5sXleRG
	qC1HAzpem4JfXZwrpR5j1Fgij/jhL85QoiqoS+vWVTb9F6XVpcITJ2osMbvP6orcpteF9M4ge1q
	lSVrTERKGyUvBDs/wr24TghfP7GFIHq7PtQmqAXj5pjlSmDBupZynJElJmGIv6j0o7SZrRH5PMI
	AFL/PGQKzAuN96NcG2TJ/+U64or44hGhUpHoyInSSIpJ03V4VDUD9Cq510yq3rlwRlZUYGNSKdK
	5GhjH8GN8/paXnEHTbnUmkT4ZfRgQcycfo0S0XOvi12ePzV1kL08zM+BEMQMZ+fTNkaCxEExjqz
	e5NF/WW9ersqaKPc0z1RIL1THPE0QDfLNwwQDNZV4nrcl4deGSLte5voy7KZlcuQmO0hRvCyz2B
	UIZgTkqHaYeStyD1bsrMJ1aj/ABn41WlsymxS759D11e49sKkvZ2NlZmOh6D6GlIr+z9hm1esPS
	vVwaJPlnN6yVAcA=
X-Received: by 2002:a05:6a21:6803:b0:3da:e1b5:2baa with SMTP id adf61e73a8af0-3dd5f4041a7mr2929083637.2.1789534900789;
        Tue, 15 Sep 2026 22:01:40 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50abb1776sm850589a12.27.2026.09.15.22.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:01:39 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Dan Carpenter <error27@gmail.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 12/12] ASoC: mediatek: mt8189: Validate TDM MCLK frequency
Date: Wed, 16 Sep 2026 12:00:19 +0700
Message-ID: <20260916050020.14575-13-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916050020.14575-1-phucduc.bui@gmail.com>
References: <20260916050020.14575-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

mtk_dai_tdm_cal_mclk() accepts zero or negative frequencies.
Reject invalid frequencies before configuring the TDM clock.

Fixes: 9f202872ba04 ("ASoC: mediatek: mt8189: support TDM in platform driver")
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v3:
 - Add Angelo's Reviewed-by tag.

 sound/soc/mediatek/mt8189/mt8189-dai-tdm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c b/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c
index 9aebd0320614..e113c52fe06a 100644
--- a/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c
+++ b/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c
@@ -383,6 +383,9 @@ static int mtk_dai_tdm_cal_mclk(struct mtk_base_afe *afe,
 	int apll;
 	int apll_rate;
 
+	if (freq <= 0)
+		return -EINVAL;
+
 	apll = mt8189_get_apll_by_rate(afe, freq);
 	apll_rate = mt8189_get_apll_rate(afe, apll);
 
-- 
2.43.0

