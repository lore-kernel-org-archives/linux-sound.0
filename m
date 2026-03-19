Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6713DFC8D
	for <linux-sound@vger.kernel.org>; Thu, 19 Mar 2026 16:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773938021; cv=none; b=DfxIwgYlO4L/fYyrBpq2xsKq+8BjBF9OT3DfWW831SdwHGgZlCU0uOrqwhv1TYgkqP8NxA/MC5Hn5Fl7szFqaBHGObk8TGULGQ0SkryEbLn38zCuDvXVIrCrjyAlmPFuauGYNFvPsfkkZoAm7dSAZCMEG4PA02JQ1KTY/coZ4AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773938021; c=relaxed/simple;
	bh=3QgIX5Ex1ZkRvnkSecAYuBnq6uCsowFGDGW+yb7vlFE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b6Te+opWRqDK4l4WU+gJ1glcO3Ss+ho+F4n3F/vQY8HvmuoQSXn2ZBYLi8hKkzm5uzJHdz8ZpjfjoKQ+0+lzoZK+/cu964qeElwwKOZTKhaqLdkJiio477lxz/4n/QhQdkssyAchSGzadmEnkhz7AICbenEjC7a+wXQwvB84STI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NPnq8vF1; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NPnq8vF1"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c742bc88d87so431654a12.1
        for <linux-sound@vger.kernel.org>; Thu, 19 Mar 2026 09:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773938015; x=1774542815; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mx2NSLi8Ta6XyKIEg/c4DV48kO867STjlkMk9jmZ99s=;
        b=NPnq8vF1OQLaXZoz+dhSYLnI7RP+kpZAybmxYbGk0pUZXS4HDEJUb6OnuHZ/PRgOp9
         LJ+1jMmjZUWqFlrOHXuktKDmUUeTx9j7ORXsPhvoa1xkn4Zf5PSpKHb5yDhrVVrr4wGE
         z5lazEphMAM2se9/lHmcEklqQw9y5GRye1E7U/+H2Tx+PgIhI/yiC2pFiGAsydP6UtLn
         14Mb92yNbKAHN+aTjyPZ/MKDVSYU332UYzBLu1o3lEXip7c927CkvZNvYnB0lQCWCRfN
         Mh6UCXF7dblCB7t9s7YRdAAMgc+ui7tz7GbYL8xMvQr+xqP2vispNKE/Ji/WXM+/q60E
         20+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773938015; x=1774542815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mx2NSLi8Ta6XyKIEg/c4DV48kO867STjlkMk9jmZ99s=;
        b=Ztr7RsZDz9TYFgOYKQDxGyl+3fxrvC5Ks3b+3dZM8ltL68oc34YgEeLADT5louKxbz
         pTnp3XK9I3NALCMb8W0CAnHOayJ3mi9KsqfmQbpipeRcLEUqfNUpQ8bgArDBiG45gfGR
         9AvEc+fBFzAMQY1K1WLkCaAj6QsfAiHci5HXvyyTPde/1wsTD/j1AgT8OZyDCfwebLQF
         usjpQkxoBaihxL+n+svVne+/f+LwXk8OQSSSHZYu+ATzWQnPEMQ2QPXjhQe9VlAusuQ3
         qSEtoQcsIr7wMEWMRa/X8m0Vh0ZfoMfyh1WDcf7c8nJ0QSSbxVtH8dwBLTSCy3gPgtrQ
         icUg==
X-Gm-Message-State: AOJu0YwuUf+xi3GQehtuD92KiOOsaJYtHzgOnLLbMkmSDlsaumeIkNr9
	QDWg5vMDwi+H+1ZqzcWUVut6kaSjn2lPm82j1kNUX0uXsVTJi3hsIOGv1fUc3bLiT1E=
X-Gm-Gg: ATEYQzyWnbK843WF3msbM4r/T80tYxCQkn41AS+F2KtbGoSexFe07K1cCIMeyvbIKWg
	MlhXzh7SccAKPl4MSDNK5zzbb+7XGi4UDy41ASKxQk7PFFgkl7ItlNw0PZVH6QjQePJ/qoBm6lF
	jfFktZt0peCIhqawAQffbjEI6UmKbV7E7InBQCMppV+B3mpHFTKHEM205xFIDtB2c+eouwCH8qM
	ev6J1H1y25sWnqOBuDqdVYFzKpJzowVdzi6DHhtw0+ogCFmSjCtt47KOLvKB3kFs98RR/m61T/8
	wxMWOQ6DJz+o67Q8P9DCMNguWOi23no4SH56AP7BwVf+SMwrNq426JQ9V3RpxGniVQyK2yHIQL6
	dYwo3SAKA7E93+jGVH59+zZdqt6RPxV8hCubBIjUeY9CHqGcchamFF0BgzYXYEa6fLa0i4bN3cg
	/lC9NQM0cjb18OJkhVYMQ2tqaF
X-Received: by 2002:a05:6a20:7350:b0:38b:de3d:d542 with SMTP id adf61e73a8af0-39bcebbae6fmr58558637.51.1773938015283;
        Thu, 19 Mar 2026 09:33:35 -0700 (PDT)
Received: from px13 ([218.155.71.249])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6b541cafsm6546131b3a.12.2026.03.19.09.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 09:33:34 -0700 (PDT)
From: Hasun Park <hasunpark@gmail.com>
To: linux-sound@vger.kernel.org
Cc: broonie@kernel.org,
	vijendar.mukunda@amd.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.de,
	linux-kernel@vger.kernel.org,
	Hasun Park <hasunpark@gmail.com>
Subject: [PATCH v2] ASoC: amd: acp: add ASUS HN7306EA quirk for legacy SDW machine
Date: Fri, 20 Mar 2026 01:33:21 +0900
Message-ID: <20260319163321.30326-1-hasunpark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260308151654.29059-4-hasunpark@gmail.com>
References: <20260308151654.29059-4-hasunpark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a DMI quirk entry for ASUS HN7306EA in the ACP SoundWire legacy
machine driver.

Set driver_data to ASOC_SDW_ACP_DMIC for this board so the
platform-specific DMIC quirk path is selected.

Changes in v2:
- drop RT711_JD1 since only DMIC needs quirk

Signed-off-by: Hasun Park <hasunpark@gmail.com>
---
 sound/soc/amd/acp/acp-sdw-legacy-mach.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/amd/acp/acp-sdw-legacy-mach.c b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
index c30ccf23005a..6388cd7cb28e 100644
--- a/sound/soc/amd/acp/acp-sdw-legacy-mach.c
+++ b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
@@ -111,6 +111,14 @@ static const struct dmi_system_id soc_sdw_quirk_table[] = {
 		},
 		.driver_data = (void *)(ASOC_SDW_CODEC_SPKR),
 	},
+	{
+		.callback = soc_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "HN7306EA"),
+		},
+		.driver_data = (void *)(ASOC_SDW_ACP_DMIC),
+	},
 	{}
 };
 
-- 
2.53.0

