Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D55314D19
	for <linux-sound@vger.kernel.org>; Mon, 17 Nov 2025 05:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763356640; cv=none; b=iClevA73LwGI4u38Fe69OyVK9a9o7vKJuj97DM1PT/j5e/8DnLrekte1Krnm9qPGGgsvwThMU5eUUvgb5RI7Ce+NMWLKtCrv5zmi47BIvZEAOoq/ZrgmN+gdpb90Ky3F9SZXqtlHLi4L/gkte3kptYWYdyqV2+WMJC9hWPHInmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763356640; c=relaxed/simple;
	bh=zwAbN1jSkzgifiPWeOIX+imLDGlZUonQ0rUamTiQsUo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rj2Eq38wOoZ0CZPxFGrwPyT8tthHm09gL5ozkB4JJXB97A2zSlSrBPCtS4Mc5xBSbeWikzvrkGg3djidDVsCMmyJfmJI0K+m4MGTTk0bWF6qdxxSgzKqRpJXVbv7deDonk1ikYmT+AawPIEmF0iAcvadtP67Oo4sMjd8gpQD7B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=SuvLuWQY; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="SuvLuWQY"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8b28f983333so399298385a.3
        for <linux-sound@vger.kernel.org>; Sun, 16 Nov 2025 21:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1763356637; x=1763961437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jp62wB1yVqkDM80xkGTiiFM5Q8Ole5hpi2t3ZT1mQ/c=;
        b=SuvLuWQYS0xfKOLywtnR4IlIk+1PgeWGKDUw2atOxVod9Pdavi7XqhXCg1BMtHwEfX
         XjcA1zYYHQNIA54pFo34/eCA6yGdct4PnROMw/fU0WN3V0kKRuZs+j/Du+Y5ZT8qzuUs
         zyJmB4M4WtB1JoeGIgN5luWQY96SbeGSU2RW+0JD3zbiqguJZiClAZpF71IhLrRI80oP
         2l/ME0nNdxRgwz+oLaCsTgnWkKSn31gVpA8qc4IioBEWuUGUSGsgfo7H2puahUB7OOeX
         YhV0MyEZHD0CJZ0TAw1oI1j42egpNoIF/x8ajDzUhZ2AKML3KPvfdWbotuf6qknaE7zx
         wgpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763356637; x=1763961437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Jp62wB1yVqkDM80xkGTiiFM5Q8Ole5hpi2t3ZT1mQ/c=;
        b=jWYmmFDeyMczmxu10sUOcSw0lVv4Pf+s6hXHmpntV97gYrxdPWIQ/Fw8N1AJWcrWus
         zdc5qt0npemRAd9hY69JMTvRruhvw1QRfHxrrovq8772p9fO8LY1dAGgnGdiO+Iyn4cq
         Mv+D/m0DjSgTuSCWrygWwthboCnNH8G8TJacdJohDY54sl5YkrXB4UxlwOfOw+yORN9C
         2nyhYkcdzn57LL0sU5gjukWlGPCvgs8ZWJ3sjaSX0UykVVDowit7e9/DbYhx6c/HXjI3
         +e48cLF8hM1PrcF0tvIFfIhQRGxihV3nXkmndOZ/WellrgrzAF9ZjJ3tEldhpXBvo7Rn
         FOzw==
X-Forwarded-Encrypted: i=1; AJvYcCW9ghxgr/UcVkNEiGMLW6GXmv1X5/+9k60zJH9q2QkveomDJjif/WkOgga4srlMLjSowovZThepo/IS+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCTE+WxLK9aRDI/otN6iZI75T8BLGuKFEUJXGXQOouL+955lAi
	BvQteeqWLSx9N/c8VJpEXrk6MiKURaIdfQrJxYfG/TSTBw/aVag1yozhbqxkE0LA5HI=
X-Gm-Gg: ASbGnct6zjoeWCq31K6cpKR/Hf3Vw0rAvSHeJdbQaUEph/qjdKRXTrG1PBsjfdGfr7Q
	rs1pVkqn5bOwSX5QUyYws+4psFHSQF4E1TFkqN3kOJEGdGv/A83jtOZzX8rpPbu5LMpbZ9IHKKb
	igCh2HGoiBbTPC74VR9SrLtnRUU0KzJdePihMxMxNDhhyBLdYPUKJA9H5cPZEEbVoWDN0H7ABxP
	A1sawpGfxHdEC7la0vsWNXuhGI79Pksz5Pqocsj7mAu5XpGvkPdoIE1JcjZaWFq2nMdDSzGif5i
	SXFeXn4rD/u44pIQ3TMi2Dc7/6l4pbezN5WpZe2s0OQBMvGRAVdyQaRHUDWdKlX9iOLHUGhxBvS
	N8UOZcr/cdWB4s1RM6lSMMWqTF0KWJZIux2E/TwyQMISIw1IlfA2ai23wzml/PSUr1J1Dx3uOZz
	oYUgGvlTqr7oFB0ZwSmKafH/Fw9Emp/NBiPnxEJ4wX8aGoFr/qhFf1Z5Q=
X-Google-Smtp-Source: AGHT+IGd9XDGIBuUfYxjhlUxGNpf/d+bDsyCFqlvjLd/umf0a3yk0RZS4q9Vc/ICsjo22DsWIDO9OQ==
X-Received: by 2002:a05:620a:28d2:b0:8b2:e565:50b0 with SMTP id af79cd13be357-8b2e565546emr512257485a.1.1763356637399;
        Sun, 16 Nov 2025 21:17:17 -0800 (PST)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b2aef2f936sm906417185a.29.2025.11.16.21.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 21:17:16 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org (open list:QCOM AUDIO (ASoC) DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 5/9] ASoC: codecs: lpass-wsa-macro: add volume controls for mix path
Date: Mon, 17 Nov 2025 00:15:17 -0500
Message-ID: <20251117051523.16462-5-jonathan@marek.ca>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251117051523.16462-1-jonathan@marek.ca>
References: <20251117051523.16462-1-jonathan@marek.ca>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This allows changing the mix gain registers from the default value.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 sound/soc/codecs/lpass-wsa-macro.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 27c8c060cab19..2a814a5d2d1f0 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -2248,6 +2248,10 @@ static const struct snd_kcontrol_new wsa_macro_snd_controls[] = {
 			  -84, 40, digital_gain),
 	SOC_SINGLE_S8_TLV("WSA_RX1 Digital Volume", CDC_WSA_RX1_RX_VOL_CTL,
 			  -84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("WSA_RX0_MIX Digital Volume", CDC_WSA_RX0_RX_VOL_MIX_CTL,
+			  -84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("WSA_RX1_MIX Digital Volume", CDC_WSA_RX1_RX_VOL_MIX_CTL,
+			  -84, 40, digital_gain),
 
 	SOC_SINGLE("WSA_RX0 Digital Mute", CDC_WSA_RX0_RX_PATH_CTL, 4, 1, 0),
 	SOC_SINGLE("WSA_RX1 Digital Mute", CDC_WSA_RX1_RX_PATH_CTL, 4, 1, 0),
-- 
2.51.0

