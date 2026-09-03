Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2854C383991
	for <linux-sound@vger.kernel.org>; Thu,  3 Sep 2026 05:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788412345; cv=none; b=K9/5Mx6VbAVl0EXZnMleR9U/tHkVKeevePaGWiOcvljwToE0SX5teYDE69USUEdMwbt8wIQxnfCisTaBcAiPyAmQjVeAZSxCbKMWSfK8Bj1YjMjN1T/NcnhuFSbofhjQ79r/tnz5h2pZD8eS1oy+bvaoBj8fq2JgF6mIXpvY4Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788412345; c=relaxed/simple;
	bh=UmnqL6M25drr5zDmIxrr/zQAOZdWt9FGZuHi/bpNqM4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WDEmL/ydUVpoW8ctRBw2CmfoNBDuFGdbAY3zWoCW9gmz6bu2hZyHpz0PtQKInwtX2Mc7ncLW1cYXPTzLFt0mTZ4KmGiNhk47TaBuC2wIfxvfaD3NE7vzgl1KOTfPtxFdMDvzJSIVUm6+KDDnQBZwM5RxGURdDWux2H0A6xAoB2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ArdzoqXH; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ArdzoqXH"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc1cb472b76so1777484a12.0
        for <linux-sound@vger.kernel.org>; Wed, 02 Sep 2026 22:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788412343; x=1789017143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MkJ39B1HLIjudCYGC3Enm23IBUt9PIrUzK1D2BnlrWM=;
        b=ArdzoqXHtQyTSXVipafzxLkbhvHaoA+TFUYJ0Fdnc3Mwo2bpS1cQELWV4sbKbeDIyH
         xjGOV9+oalwJOgylE0YEK2flAAol1LU8cOkhFixe5/8pInjH+KArQAiyNkOlQCuUiMY2
         wyW3IN/ubb+dB5ZAlHdP1tid2j1GmM/ONJIasYa9LPE2UJPTH8qlgCbyMjHGT7LfAOI2
         MV+RYno691bVjoxneidxowb0N1yvVt6tz/1F2oymoRyjcclZDWNWlqRMX7ZztPbQ3NCw
         BMbSwlbg/rybS6wn5aNLulMyq1xbb2S+y6/0tNqa07lNySb1ydqB37Oz1uoduokfVDh1
         d9Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788412343; x=1789017143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MkJ39B1HLIjudCYGC3Enm23IBUt9PIrUzK1D2BnlrWM=;
        b=VQclkRRRZFzV+a7Kcn+XD2GwwfG7caM9k8kW6qhml+cjHnIU8S5654CLXCp19xPl74
         BMsG/5tGcxL/1Awn+hfnSBJIFvC7vfthsK4x4z/JNmY0XkuMg2VaXtsFYUGMKCMi09CN
         m/InNkvCNaiIk/eyE7IbEy3u5RgYTk+FmFWYtQDMzpkiT3KO3llrMvI044ZEoB8Qeab3
         9yBamC5lzRD6IG6Oxs54ncbMADFnI9o7U3b1tjkcPhoMNZGLD9mXV2fKv7RVMVjhn3XA
         s/8fXYi/NV6WQqZv74+QEGmAMG346SqTjJSXiRV9G2zqFy2YtvGpUUKVAWjFi85bGfdj
         XdPg==
X-Forwarded-Encrypted: i=1; AKwUvBxIbv4DuH51JVo6BAs9BCPsikVyDTF+SNLlT3q1f66V6Aki2PUzCWbQDWKri9BPyduRfwNAnMGLQdVjYA==@vger.kernel.org
X-Gm-Message-State: AFuF++nzUKz3jt/dDbAMH1H2oLOHAJnuHKpIgmqnvzRLZeJNA4cVwvRR
	K1Gsu5sAKhKWkOv0KUXV5OSMjJqJw6K0bsVNUgjnUnEQ6H6TrBn6TQAe
X-Gm-Gg: AYBFou1QX2+IeQhj+4SoG9jMYUXDUwzP0WT0BKTXSbyk3V7mtSFMwZBG51eAip6iUc0
	X7BKsEzl/hkZCC3+FpSVXRF9xBiw11ACHysjESpwE8e+opr7/L37asViA/tc3R2+9gYRxMJUYTp
	1rdVv3hJM3NMMH4zMcVONjTe8z7OrtbZJo8QZqKXUr/+jxfJkylL0ozk2UbITGhLBQX5c+mxLxm
	RJjW3cKWFQ3EVpFTuSsvgvvMhB6ZdsQs+fOqO4TnH7W2+SQ8J5Mn3Pq/k5/uVG+dw+6TpqpqBmP
	5XeuYpygfv8qvEJHCAnOVQHGDc6JvJ1iqY4IhYR+Hwg9xzNTCeAOz1QtpRk+HEwvWcV2LBpljGy
	JTPiEr7s/lukMrXpCyexHl6w/mWiFZ/qW0sZj1G0URd/k7jQ9uLS/Uryowl/1Z48hIOZBz99Frn
	TTfk/ddmfHfjyevDH3ndU2Zp/6eCFfNUf+ze+CilTYdiVPaHtPfjXfjj1mGcTDj/jP+V7EX6DzU
	ftt3fM1ZR68Jvpjqx5rZbOzEAQ0zG0eW2K6Va1K1uR4eDvROrCxAgEqf+zQWVhAE7EcwOSu/9Ks
	NCuLsFASkVXJDf2s
X-Received: by 2002:a17:90b:1c8b:b0:398:dcfe:967a with SMTP id 98e67ed59e1d1-39aee0ab6f2mr12102665a91.17.1788412343352;
        Wed, 02 Sep 2026 22:12:23 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b0875ce14sm3218092a91.13.2026.09.02.22.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 22:12:23 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 3/8] ASoC: mediatek: mt8186: Fix AFE clock error handling
Date: Thu,  3 Sep 2026 12:11:45 +0700
Message-ID: <20260903051150.178057-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903051150.178057-1-phucduc.bui@gmail.com>
References: <20260903051150.178057-1-phucduc.bui@gmail.com>
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

Fixes: 55b423d5623c ("ASoC: mediatek: mt8186: support audio clock control in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-clk.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
index 3edd0dd20eed..685dc27c7780 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
@@ -288,7 +288,7 @@ int mt8186_afe_enable_clock(struct mtk_base_afe *afe)
 		dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 			__func__, aud_clks[CLK_MUX_AUDIO],
 			aud_clks[CLK_CLK26M], ret);
-		goto clk_mux_audio_err;
+		goto clk_mux_audio_intbus_err;
 	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_MUX_AUDIOINTBUS]);
@@ -315,24 +315,22 @@ int mt8186_afe_enable_clock(struct mtk_base_afe *afe)
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

