Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DDD53D9529
	for <linux-sound@vger.kernel.org>; Tue,  6 Oct 2026 10:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791281814; cv=none; b=HbAAL0sjxC5Sro/VFJqLXYS6vrXLewGUyRMm4erej26nEZK50hsgO3OdDY8oM18zXVcZpwBViV3IlPXAVof6Xdbx0k0WcQfAIUvhP5YZs0YWPLHD8rWF8NFqI7sieoJZF4A/moE4VktnQ6tmSIEvWu7tWPoa3AF26xfVGO07b5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791281814; c=relaxed/simple;
	bh=H3PDzDrtO5c8WYmCowPyg7cQ4FV1kL+eaDhtUert0sI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fVEtjO+ApTz0yIZMAE5p7d8ndo87+bZ1ucZ4RSOijmeXo2epIlKqIEZ2B+82QEaZ7AewBQNOyjVaG3sevAlVytFFjhIYumN28aUppFQURAiu5QF5XR3jrSlGAsFWx7aK9418d6iNvgNODUgT0cYHl9cXUnctDe94OUXgv8yWXFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ADvQQykl; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ADvQQykl"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-868b3248b2cso300078b3a.1
        for <linux-sound@vger.kernel.org>; Tue, 06 Oct 2026 03:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791281812; x=1791886612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZrZPU62D++2Mpf09f9HLGIFyK7TMDyESiaONSZX8Yvw=;
        b=ADvQQykl1LchdSoLvrzhY899sxtdDcGqK7duvhOAm+5vTGZdeE9rsKm7NrNYHvL/bb
         WMmhmW2Dkq4hscUS3Tpk5zqVrnyFC5mKIo5eyiX/wCowHSe5VOCJX48vHpFe7/8nPvKQ
         JCsrtVn5Cxbh7pEdSIy4gPIj4B7uWDmuBOay1lJrgUV+YzJxcSQSI8uY3Vaj3w1rVnKU
         vvb797q9wzGwR1nVRV0g+0y8FMMlkUgXWhcRp8UbekiS54Zfr1odr8Fbx4nAdlYGB+N0
         QnH7EjilExwxxVZur7uHezwt+JysddJEheWE0DhPoeg0hugDSdp3nqCNaAA3W3UtQGrV
         FVrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791281812; x=1791886612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZrZPU62D++2Mpf09f9HLGIFyK7TMDyESiaONSZX8Yvw=;
        b=vx00D8IwUf2VBb/oNhViHHU+goMIjR7oA58nbu5VObrwLEdpAy4XshgR/kT8T7Pw8s
         1MGKnc4yeoieANt2gPbjsXMweT35Hg5MbHsIKfqlKcWKCa//IBExelYvRFc8zVeQ0zp+
         8mgop+lnUSZJzwyMEsW3XxHMJNgYDyj42tDSSdvXaA0IDZ12K/P8LRWRqMX1S6oTmMcx
         FGsiYAeWUvCJLWhvl3XB3/BzOQ2kXneO9tPfeqy7nXpsjAsBwYcwTK3x/XguUiJHhLB2
         2MQkAo35yIn3Y1ssKOgJ/PS2U2pzs7OnS+8k3KuAyV8+UxLT3gwSZIIDu9Ju1el0gByB
         w4ww==
X-Forwarded-Encrypted: i=1; AKwUvBy7AfnL1IKnfTg1NCw04f7dNLRRaThYvnNtOVyOYfwJaQgT2SkWDDSP/Y4cjz3/C6Ta7RJ9OtTLWMhugQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mSR2FLNt5r+Zsuxy/wXWI0/yn5U5EyHW+nMvnc+IX5WkOfD5yr
	1eaIxrQvxvzRamDFVgRzentx99piSt8LcNQ8Xn03fl0yWKQbNYcgACuI
X-Gm-Gg: AYBFou0ZnZpR6rPo9iOCvnYZ4nyWa8SL9oEAl0mxEy1gBV33vMU0a18kYXKdFypXf9a
	0LvVrafbC6vXn1HzxdiRqc3ckFEL0lz+ju4pOWyjz60j2hTidzfyqBN69NfcJpg6RO53js/C80X
	sOBs+TH2co9uShFA5J+IjY67T04UVxow6GNokZc4k2iOtQC/pv/GmjRRDwoRJ34JnI3izj8zzb8
	5A/rS7Xp6SiSjMinrsLRgwMnhpiqyT7sPVVtGOKzbH4VpdbSocTBUCO4Y1/g+keJuwplMWFAG+R
	iR3lVVqVEqA8726+ozT3Y0RDQldpffCDEF2js38M8bO1pLcv/IdQ3ppJxVONqn4B2UkdfM5wDg/
	x0iTALAteESUTBLDjNXcQotr3q+MnqkbvnHDLqPzW/Wfo8Fv0puaIbfJuNT4skO1fE16SPI9lVl
	Z7lZUO/BZEZEVka38D9IrS83FdfPTG6ZR1Izbc7x8JiBq0qp6X8/UjCXriI+FnZW9rudMP6dPmt
	/Xt7I3NkqhwUbscvyTHkpEj9h/woftJghix542m0xpVWI1KTGB2otu5YeBry8lOzFx5MOUGc6Ff
	yR4lN7Qgswg7wQ==
X-Received: by 2002:a05:6a00:2d88:b0:888:add:a74c with SMTP id d2e1a72fcca58-890db797184mr887589b3a.4.1791281811950;
        Tue, 06 Oct 2026 03:16:51 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0d152432sm4547505b3a.53.2026.10.06.03.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 03:16:51 -0700 (PDT)
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
	Haotian Zhang <vulab@iscas.ac.cn>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Tuo Li <islituo@gmail.com>,
	Rosen Penev <rosenp@gmail.com>,
	Garlic Tseng <garlic.tseng@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Dan Carpenter <error27@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 4/4] ASoC: mediatek: mt8365: return 0 from mt8365_afe_fe_startup() on success
Date: Tue,  6 Oct 2026 17:16:06 +0700
Message-ID: <20261006101606.54079-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261006101606.54079-1-phucduc.bui@gmail.com>
References: <20261006101606.54079-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

snd_pcm_hw_constraint_integer() may return 1, which is then returned
from mt8365_afe_fe_startup(). ASoC only treats 0 as success when marking
the DAI as started, so .shutdown() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: e1991d102bc2 ("ASoC: mediatek: mt8365: Add the AFE driver support")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8365/mt8365-afe-pcm.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
index e9497246f37c..314235557fdf 100644
--- a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
+++ b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
@@ -514,11 +514,14 @@ static int mt8365_afe_fe_startup(struct snd_pcm_substream *substream,
 	snd_soc_set_runtime_hwparams(substream, afe->mtk_afe_hardware);
 
 	ret = snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
-	if (ret < 0)
+	if (ret < 0) {
 		dev_err(afe->dev, "snd_pcm_hw_constraint_integer failed\n");
+		return ret;
+	}
 
 	mt8365_afe_enable_main_clk(afe);
-	return ret;
+
+	return 0;
 }
 
 static void mt8365_afe_fe_shutdown(struct snd_pcm_substream *substream,
-- 
2.43.0

