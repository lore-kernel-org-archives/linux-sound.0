Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5D122913A
	for <linux-sound@vger.kernel.org>; Fri, 20 Dec 2024 19:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734722252; cv=none; b=ju444Rwa7QjtXAH2hdw9fJmI7O2A3kCLIdtLsQ6rlyi+McpWB33Zu9pRIWhcsu4QbfqmhDasCXBEKPU50rkmA2SNwOR3R3Z622yIvOA3926BCt9P9q2qrxdfqBExQY8zvM2UW2RZfIjqgY4rcXlsOoU4QyaRl3SyT3Aptx0rALk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734722252; c=relaxed/simple;
	bh=zd/Y8mBxMdBApDi5CzqJHH1RW7mj7RyJYMvyUl/+gqU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IftOO+hoAMkCxmV7+XAY94pqQmUN6h1zw2kUc3pFc9Yn9IRwW9fjKbyGAqMaUu4yW4LIV8pJFXJM8w1xjnOd1cBnz7ppZErAmWJ3Da36EzngGeY1cG05ZEkCJhsYZzbORajS82kgYem2OCEhv35SRr+QVZNkNSY0LBJEiNGFgBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=inbrACD7; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="inbrACD7"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54026562221so2176676e87.1
        for <linux-sound@vger.kernel.org>; Fri, 20 Dec 2024 11:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734722246; x=1735327046; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1M6HwiDjtz6MVhwJBxGtnK97LOfqJCVvtnZY32TOfk0=;
        b=inbrACD7/vW+UV8KPFtOGBc6zYY853DfkcG9W3Tmb01Nhxmbp/d0znzLsnst/Pa5k0
         CnlEDKGZIpG85yBbJuXARz+mMRDJob4L9icYf/bNC017eLI+SjJlkpCYHhm4PXYmj4UY
         aD3baAz9oQnzIaraBH4goCUOK6Hj+sVapzVqB9Wj2KftCFNayX4w+IvuatUwfFwlA3tx
         1KM08OR1fltzpHIlv0ZzjwyvF3zs2TyT2WRnxuK7rYV531qpUgSqBOZTqtVptu3AX1/K
         6QQi1iIKphYis1TVJoWHIMT7WXnlYNFy1LxYqCBIaBVeLEkNEdQ0yrT5FLDnbApUoCjo
         xaxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734722246; x=1735327046;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1M6HwiDjtz6MVhwJBxGtnK97LOfqJCVvtnZY32TOfk0=;
        b=ibcAUA+wuLvvjHR5ANkqslRY1cflrKQKrIKOmF1thc39n3XXOz8l/ufCCkeOBdUG39
         DyM1b1NF/srF15DCrrqcqeskofywC5Ib9Rct3UV8br4xCEa9Y/EOsEf3T9Tg/ZJMoaY4
         zGd7X8p8J8JILzxwgPZSy7Xd9yAwbKz4fY7DIyDelGiyvZfPoJxguLFAr08OXbZshL60
         fCw9DwAaHyemPCXPeA0B5QvipGnElkfsqFGgDNyqeFzFzy4yFqfN0ON2gSCc4Ppofu9q
         f3h6FuLpBP1p9+NDwWZpLh9lmdGFls1/puSxVPsuTp/pC/l+I5RnFUoYOzws/rd7HuZU
         uTsA==
X-Forwarded-Encrypted: i=1; AJvYcCUy8QxZfT7ibCpLlrsjbm6Uv+4BfdvRLkWq1aTC0dCcXIY7FnRbtC+Uiccc14KJ6tIVhB5zz0ttqk0b4g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlH5/9tT2wd/BP97g5a0AAWElrgJWG3nA8gmUad9LHPx8uplY4
	csMFmEmP6U0Djpl6CniAk5fOE7ZTr1IjsS0cB0/hmL/lSqbGzxuujhU69bxfNtE=
X-Gm-Gg: ASbGnctiruGYsBxCXLGKzeF49fbk14lpxSZx+zt2olnXRsKuPozyK4zxFOzP/qQO+i7
	mFg90N0AfFAcDQzxOgp0GMSZQImhPHqOkwtJ+aAR0fyO+RYYSgNpPVuq9RvIoA7QPN93/moz+mA
	hQxqY4q+WznVBu6JgVeUV/6cmJ8PyZp3u4PvBEr7IMDTgA1rRF7wYxA3DKuFk8+ke1v80YGSlfk
	b1eXW+PcgeUGo76xKtGdj45jSDVACGp69XRaUPQmRetqBc1z6XZ5QzqMnGfvUGJ
X-Google-Smtp-Source: AGHT+IG6IFV0Usn+06DX+/zaMrThIrt7paHBBkdwNJGqDNn/1W/onv1N2MVoOyFetqejTIcJnFPd6A==
X-Received: by 2002:a05:6512:398d:b0:542:23a9:bd44 with SMTP id 2adb3069b0e04-5422952e712mr1506321e87.17.1734722246359;
        Fri, 20 Dec 2024 11:17:26 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223813877sm545141e87.149.2024.12.20.11.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 11:17:24 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 20 Dec 2024 21:17:06 +0200
Subject: [PATCH v8 09/10] drm/vc4: hdmi: stop rereading EDID in get_modes()
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-drm-bridge-hdmi-connector-v8-9-2399dbae2990@linaro.org>
References: <20241220-drm-bridge-hdmi-connector-v8-0-2399dbae2990@linaro.org>
In-Reply-To: <20241220-drm-bridge-hdmi-connector-v8-0-2399dbae2990@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Phong LE <ple@baylibre.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1990;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=zd/Y8mBxMdBApDi5CzqJHH1RW7mj7RyJYMvyUl/+gqU=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ3rqofWGWfG2miK9Nk/kt60LsekVXBu+uC1vw6n5PZ3JJ
 /mC567uZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBE7E6y/w9W9tSe7sVjbvzR
 8FBbRt5itZZTS70/l66Un94pOkuWwdH5lK71svhJ7IVTW8v/1E+7um8Oq/SHghieD8s8E36nX22
 dYGtvPbPjkG758bt7Azk9c/X7bd+um6nE2PPeUjfWRN2Gr2P7Ce30e0Wr4+6KWfuXijlJxD0qzG
 gT5extinq5dKNmBvuX+iVXf9esOtz1siHufcyqFG19p2yZy68X5z4IvpRutuFxufLa2D/85/sCA
 7/nH2SZf2G25Ulhz2zR7KP7F0Y3i/VcX1Jt2vEozPjs6pcbPiy4kXkuZvpnPaknzj3r2nPNcl0t
 rX6qH1qxql3BNHpX5armvlVFP34LG4pxvVDZeeS+x+2ZAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The vc4_hdmi_connector_detect_ctx() via vc4_hdmi_handle_hotplug()
already reads EDID and propagates it to the drm_connector. Stop
rereading EDID as a part of the .get_modes() callback and just update
the list of modes. This matches the behaviour of the i915 driver.

Acked-by: Maxime Ripard <mripard@kernel.org>
Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 24199b511f2ee1bc3aa5f4a30e9d3d928d556ff1..5282dd765cc9478361a705dca85f615015b12e8e 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -470,31 +470,10 @@ static int vc4_hdmi_connector_detect_ctx(struct drm_connector *connector,
 
 static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
 {
-	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
 	struct vc4_dev *vc4 = to_vc4_dev(connector->dev);
-	const struct drm_edid *drm_edid;
 	int ret = 0;
 
-	/*
-	 * NOTE: This function should really take vc4_hdmi->mutex, but doing so
-	 * results in reentrancy issues since cec_s_phys_addr() might call
-	 * .adap_enable, which leads to that funtion being called with our mutex
-	 * held.
-	 *
-	 * Concurrency isn't an issue at the moment since we don't share
-	 * any state with any of the other frameworks so we can ignore
-	 * the lock for now.
-	 */
-
-	drm_edid = drm_edid_read_ddc(connector, vc4_hdmi->ddc);
-	drm_edid_connector_update(connector, drm_edid);
-	cec_s_phys_addr(vc4_hdmi->cec_adap,
-			connector->display_info.source_physical_address, false);
-	if (!drm_edid)
-		return 0;
-
 	ret = drm_edid_connector_add_modes(connector);
-	drm_edid_free(drm_edid);
 
 	if (!vc4->hvs->vc5_hdmi_enable_hdmi_20) {
 		struct drm_device *drm = connector->dev;

-- 
2.39.5

