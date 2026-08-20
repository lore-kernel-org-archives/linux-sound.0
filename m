Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC8541A900
	for <linux-sound@vger.kernel.org>; Thu, 20 Aug 2026 11:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787224425; cv=none; b=XblcByor7dkvhsYpH0D6wf87wWornpXvY2zBTEoOLvA1txk+Gda4RBUncb+tS/2/QhSysbnoXdgQTvzXlSz9Yr1FgY4vtykEmRa6N6kh3sM/xo1IPUJZcRQrDoq9qgjNU7GvXvqov3KbSvF8ZlJj20TYfNzFZsyTVL3m5MSgIZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787224425; c=relaxed/simple;
	bh=IGekffpxX+5XQIthJK09IM5/IbjcyIoKPxjpP4fEsk4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QirxByb1V3vpClx1T3AllAZufK7Eanzy4ytX+dDLhBUxRf+pA7+8iFyNuXnnjSB8lrTmt8WjlDofoJQfK2RELEDmxfx7p+Dqj83OuE0NVgO5Sv4Jalp+QP1m85kP6lN2wjISQ9+jAIsr7NeLH6LBvVtVgkzyNd8AFHzQfE/4pmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kbdl/KPY; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kbdl/KPY"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8518d5ddaabso1619433b3a.2
        for <linux-sound@vger.kernel.org>; Thu, 20 Aug 2026 04:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787224424; x=1787829224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=viEEjaaD0HZpFwginbzlEKGXqOy8NFo8cx0Pc50ZQ9I=;
        b=kbdl/KPY0XnYgBEOe0NoomT+B3G8JgD8UrUZ6YK36BGkazX1clA2e4lN6OIY7U4I0M
         D11WAhnmpqJmFgBrYaYClTxL1vSrNRNgzYAjz6m4IPN2qTVCt7Rv07/R7Xg+Y18dEeRY
         VeTsdMVdlTeDu2SJwykU3d3OSUdoTyXQpDj8UduDMBXOzoOJqtTjULEexcvYENARub3n
         uEHd0Z7ovIwYMaZveanslS9afHQO5sc2cEv0TaY7sRq+9TTGIgr8km/5SXuK3pUmGzIx
         lQ6pvjfj4pW2jHyetCh/jeLTZ6doEiBMTcl92L3ICWQ76pm56HDUMLnfFdRKqzTU+QZ4
         spig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787224424; x=1787829224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=viEEjaaD0HZpFwginbzlEKGXqOy8NFo8cx0Pc50ZQ9I=;
        b=FrpYzrsWisZLzxSRe1/vIo/WMpUqkyF9ag6o4x64iijyIv31vAJrbWiMu+h09uD5/M
         Go313J4AqTWi8Ixre3XePABmMqO5yZ9mzBrZFgBjVgwREKQn4ouFGLCNwv/D6Z+qDWLh
         zMb975nhwu7PrgBKMAP3FDkapWWmrV/p6DiSrUSaOqc/pYAZ7KYwnuP7qxG314y7A7ab
         3Xj8qfLvRd7gYokKAVycLehI1R8DZl8QNkOGswfjvnreYVWLyUSgfppQhPwScqMzA1aT
         CojGMXC1djezeZDJqWVmKsgLPFdTpnzDsjzxRAWm04dGTEKv+GOcrXpqFWIjImgrJwvn
         PCfA==
X-Forwarded-Encrypted: i=1; AHgh+RoSH9hIaONwjWEsXPGVYd5fhFzNPQw4DkwzMCEpIkVZZdqK8YjlpUyXZpEffQKo5XOpntl8M4+mSXPXVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxujSbv6GkirQG3v/ziik7Iva6G6heaoEJ6NEMzPMy09nzzsatU
	ud13ldV2UC0ACMwhc+Ef+sMzvxQzwO2T0rWjIop2SN2+OmpcKmLdrJqX
X-Gm-Gg: AR+sD128yBMvJXUNNIEgmifmD898/TZ6I4wFnWYDcHwIJPD8wWbduDNgACw7heyBtO/
	LeOMzQDoJbbpkoULZ+uW3ZntDrsnIhyNr32uPVS+LRNX2fRj3p6EjNhgu/SKviO8vT4yxr3yy4T
	OCFZygl9LzYWExZ/3TSMs5HB1N1tDZY837jNZMNYV1+ET70HGdOsS3eXKvJKnx/bY64mH/SfVnQ
	JNCaicxAIPPSUhr6+BIoJLLUjeqKXaDMfNAkI5zHjbYuXKq/Uui+YUxUxgiLFzLX4TxX4FTTrFR
	LUuT1NthfOsVVnFiE640ZngWWH0NJ42KHfCwMH9i9abaZlK1ugoz+AGITmLOQikZgWW3c6x+vT/
	ehdMQaGF0wgxlbK7Pj5NTb0eypCLlAtTd7kBaTiA+IxjVu7zAC/KtoOtz1ZoWudbrNxqqosiRRE
	+oFZe+MNlq9Anvx43onw+GdgXRXnHSY4KaeKsp9pStcRmM6RHw6leKEjmoFbkrvIupwycZtifN8
	36JM605t/qt510jY8yg4kQb4RFEzB75Y7VMS36WbahG3lgMODJB3HSLRV+MZKmlVYLmqL1LrKUB
	/Pe29nQv7Zjto0Kicv9RhZJBBAE=
X-Received: by 2002:a05:6a00:9296:b0:84e:24f:2667 with SMTP id d2e1a72fcca58-851d38a4dc0mr18511585b3a.8.1787224423908;
        Thu, 20 Aug 2026 04:13:43 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d36185c8sm1515460b3a.38.2026.08.20.04.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 04:13:43 -0700 (PDT)
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
Subject: [PATCH 4/5] ASoC: mediatek: mt8186: Fix MCK error handling
Date: Thu, 20 Aug 2026 18:12:52 +0700
Message-ID: <20260820111253.97866-5-phucduc.bui@gmail.com>
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

The mt8186_mck_enable() function returns immediately when a clock
operation fails, leaving previously enabled clocks active.

Add error paths to disable previously enabled clocks before returning
the error.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-clk.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
index d6b0174e2655..8cc8eb8022b5 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
@@ -528,7 +528,7 @@ int mt8186_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 		if (ret) {
 			dev_err(afe->dev, "%s(), clk_prepare_enable %s fail %d\n",
 				__func__, aud_clks[m_sel_id], ret);
-			return ret;
+			goto ERR_ENABLE_MCLK;
 		}
 		ret = clk_set_parent(afe_priv->clk[m_sel_id],
 				     afe_priv->clk[apll_clk_id]);
@@ -536,7 +536,7 @@ int mt8186_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 			dev_err(afe->dev, "%s(), clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[m_sel_id],
 				aud_clks[apll_clk_id], ret);
-			return ret;
+			goto ERR_SELECT_MCLK;
 		}
 	}
 
@@ -545,16 +545,25 @@ int mt8186_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 	if (ret) {
 		dev_err(afe->dev, "%s(), clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[div_clk_id], ret);
-		return ret;
+		goto ERR_ENABLE_MCLK_DIV;
 	}
 	ret = clk_set_rate(afe_priv->clk[div_clk_id], rate);
 	if (ret) {
 		dev_err(afe->dev, "%s(), clk_set_rate %s, rate %d, fail %d\n",
 			__func__, aud_clks[div_clk_id], rate, ret);
-		return ret;
+		goto ERR_SET_MCLK_RATE;
 	}
 
 	return 0;
+
+ERR_SET_MCLK_RATE:
+	clk_disable_unprepare(afe_priv->clk[div_clk_id]);
+ERR_ENABLE_MCLK_DIV:
+ERR_SELECT_MCLK:
+	if (m_sel_id >= 0)
+		clk_disable_unprepare(afe_priv->clk[m_sel_id]);
+ERR_ENABLE_MCLK:
+	return ret;
 }
 
 void mt8186_mck_disable(struct mtk_base_afe *afe, int mck_id)
-- 
2.43.0

