Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239C941A792
	for <linux-sound@vger.kernel.org>; Thu, 20 Aug 2026 11:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787224417; cv=none; b=A9Ay8qcPghd1qB3NuhfYdKwie9IAwtBSe3wv8NZExB7TMSIotaLRh7Iq+fHN94irUmJGcanehXh6nMd/etFC51xpPQuvkd/gj5wwWa9g85y78HI9VmUCqM5Ubig7/kzl/hVMJz85z9vQX6culAryhGnBqzh0+Jw/oxZuJ0hXyX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787224417; c=relaxed/simple;
	bh=LCT+82lm6KznZfAuCfv9h5ezKD9PrDxKi2dRpeEV5tM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TgERDXuxMQpFdVYd63Y+NgOyZBPqYUcxoLcQs74C4vJSoToqPTWLeSnPHZSAjgIDofjGpmmVgebfqhOS2jfzFo7WjBNxUZikOw6GzvRCgh8vydQAFuIF20yzbrhjcVaGVQzMORSlYEJpPmiuLqCP24MIc5R/uG/x6gVUQ7XYh3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ClHdnWMH; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ClHdnWMH"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8485ef63b68so1485911b3a.1
        for <linux-sound@vger.kernel.org>; Thu, 20 Aug 2026 04:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787224415; x=1787829215; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KHFmktxqrJswUeFq/LOQ5JbIOjX6aGqDfIzsCeraA7E=;
        b=ClHdnWMHleK5rccT+OBpCN3YnP69RW7qdA/rZiZ3GpBX9K4g56S4Knvk+Iw3ljWljA
         39J2HoAfuMJIrrr3CECCIRyhTgPNCyn+AUMWrdUk+mh4HmKGbKCuHIw8l5oEJiiAn5eV
         2e4dqDNNw/L0Ss1oAMHDTb+4F/KskjIdEWmCctm+fvB5tbxjclhUi+4OQ2/IWNVFr9WL
         1bjcPVHVKBH16/MOUSAFUavsMqulhsrC7C+BxF7XmQQ5yhVUChXgnUl7tag+iO3uwL9O
         WDgAUcfCrJpBy8FmIrgmDlpoF8EHR9xdXJT4OEhZAXu6y1x3ztO376RyziFFWrrTz/g8
         FMUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787224415; x=1787829215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KHFmktxqrJswUeFq/LOQ5JbIOjX6aGqDfIzsCeraA7E=;
        b=hxAcEa/CNarg3yhPoghphG4hqOrsiQJ1nk+U7WS86VLVWTjZL1fmS94G9AJF+bq+KQ
         jK4ZhDsnWqyRoY/yKLJuA+a2Z4F8I+bCcarA2RLTcsIDXSIhCbqCDkzzEiZjueuYhPsS
         OhUxGDWWorq9/CWn69UF1urasTn72DOQuNbo3qLQO4xQ4jWEv0vL6yuaDx5Ty8ICqkOl
         P3l2g9rO3dk/TOANX0fHOxZ8LQlJ803npka5fAfq+c50apTH14eoq19QON+CoKkVIvoy
         lC/r5xW2ofFsl4JBYZ30sLo6PWNUALsUTI6L+NBN6cKusem/a/ZLB6p8Rd0gQHZ3kKPa
         DHEw==
X-Forwarded-Encrypted: i=1; AHgh+Rrml+K4J/IqlcMa+aIi+WK699l4qVnV086hsz9F7ShCwcQ49xnFxMNFIFMrJMBLF8SnpBvgJ50W/ngISg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXHL73FK54apO/Aw5PMBP+f0MKsPQa71dXEeqD+zeGaUG4hJws
	E2qPpJI/NnRWLRx1SGL0+rw1g2ayuCgUXIjH8bfuiPPXYknFREv7wWqt
X-Gm-Gg: AR+sD10pB5SRNrP3683TZymX7BHK7CUAr8dIzqSthPuPRhLHN6ly0HmHCp9M1eJZHVC
	k9zF8G7dRYNjzSO2J8iENcqBOqgMnwO/JhlDpj3cuJRrjksHPPm1FuMJHp/Y1DSKwm0n9fe2ZoA
	YlrgGqR2kSdXee9D29FMY5eYV4BcGwSjILw6UAF9oTmTCI37s8zhR7iADdcz8qmqEpNm0DBEPEf
	571XjVk0My+Gay8kQRF/yt2In462bqLhy31GBsJTBlDbkbXJX9cd5I0E8zSJtqGNIdrIZA58WmP
	TSbw2d3I7r4vAQ/NNeeXq/Gfnq5wMpcJjOyOA/ozZB2B7OkwIc+vGjNfnT86vurku5JPJNQO5Zj
	YY/8NQhgwsp11JUU257nB4lEHYrE7lIx2LMvBK5rdN/26IonWxpK2Yf+n8ymUouuJTEZ2ZpWQj9
	r42MLALZlrQhvx3+29VTsdWBS2zWlHQK0GsVhNitjBzh1OjN3UFOdpGdvPHupCw9vNEIcjY3GhR
	jikf6SW1UDdjPce4LXvb2zMAyQEknS54ex/kMpLCfO912K2hgUVfTEX09xtSxPjJKI79gQp4xeL
	G7vR
X-Received: by 2002:a05:6a00:a24a:b0:84c:5b65:ef86 with SMTP id d2e1a72fcca58-851d390b52bmr20899072b3a.17.1787224415368;
        Thu, 20 Aug 2026 04:13:35 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d36185c8sm1515460b3a.38.2026.08.20.04.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 04:13:35 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/5] ASoC: mediatek: mt8186: Fix AFE clock error handling
Date: Thu, 20 Aug 2026 18:12:50 +0700
Message-ID: <20260820111253.97866-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820111253.97866-1-phucduc.bui@gmail.com>
References: <20260820111253.97866-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The error paths in mt8186_afe_enable_clock() do not consistently
undo the clock operations performed before an error.

Fix the goto targets and cleanup order so that the audio internal
bus parent is restored to CLK26M and all previously enabled clocks
are disabled before returning the error.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-clk.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
index aa8b2eaf7b95..94bcaf92e396 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
@@ -294,7 +294,7 @@ int mt8186_afe_enable_clock(struct mtk_base_afe *afe)
 		dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 			__func__, aud_clks[CLK_MUX_AUDIO],
 			aud_clks[CLK_CLK26M], ret);
-		goto clk_mux_audio_err;
+		goto clk_mux_audio_intbus_err;
 	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_MUX_AUDIOINTBUS]);
@@ -321,24 +321,22 @@ int mt8186_afe_enable_clock(struct mtk_base_afe *afe)
 	if (ret) {
 		dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_AFE], ret);
-		goto clk_afe_err;
+		goto clk_mux_audio_h_parent_err;
 	}
 
 	return 0;
 
-clk_afe_err:
-	clk_disable_unprepare(afe_priv->clk[CLK_AFE]);
 clk_mux_audio_h_parent_err:
+	mt8186_set_audio_int_bus_parent(afe, CLK_CLK26M);
 clk_mux_audio_intbus_parent_err:
-	mt8186_set_audio_int_bus_parent(afe, CLK_CLK26M);
+	clk_disable_unprepare(afe_priv->clk[CLK_MUX_AUDIOINTBUS]);
 clk_mux_audio_intbus_err:
-	clk_disable_unprepare(afe_priv->clk[CLK_MUX_AUDIOINTBUS]);
+	clk_disable_unprepare(afe_priv->clk[CLK_MUX_AUDIO]);
 clk_mux_audio_err:
-	clk_disable_unprepare(afe_priv->clk[CLK_MUX_AUDIO]);
-clk_infra_sys_audio_err:
-	clk_disable_unprepare(afe_priv->clk[CLK_INFRA_SYS_AUDIO]);
+	clk_disable_unprepare(afe_priv->clk[CLK_INFRA_AUDIO_26M]);
 clk_infra_audio_26m_err:
-	clk_disable_unprepare(afe_priv->clk[CLK_INFRA_AUDIO_26M]);
+	clk_disable_unprepare(afe_priv->clk[CLK_INFRA_SYS_AUDIO]);
+clk_infra_sys_audio_err:
 
 	return ret;
 }
-- 
2.43.0

