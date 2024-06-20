Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8AA819885D
	for <linux-sound@vger.kernel.org>; Thu, 20 Jun 2024 09:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718875533; cv=none; b=SdNPE0iHrQO3Fl3oROyj5MsuLa86BAd/q/aDhS8Zo9gitaQD0tp5KdUz8UHY0HLOCeVhcmrSC8xTePFtYBFkIygfsoFgmhkrQNVXdGBMreTfnjIcCV+i5q0FPbsBUWL+B7AGaxt3DlJnjOKcN2YJeAWRlsZ6oUJBsVgdmmm34LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718875533; c=relaxed/simple;
	bh=TKqkzUYhhfD22w9CKigg9XXTwlv5RIY3tN1qm51ilwA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s6njKY8LAcwhNHHmP8IlRFB8UGUw8xX8s7MenRInPO/cgn46ELkTlqflQJRRi8+rvBbnE3tyTk0ebS6f5Dhtu8TXxkJzLfv1IXtnwi0uOGEtB4zbdRflF0QwQ58pZFDw9pLjEoV909Dn15AISHax525IkEcnoA04eL3H6afZMUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YYNzqfb3; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YYNzqfb3"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7062bf8bb75so605873b3a.0
        for <linux-sound@vger.kernel.org>; Thu, 20 Jun 2024 02:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718875531; x=1719480331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rDZlI2yZ4wi+UH3k0wT+hmOJJKg/VzbaB//Srify4c8=;
        b=YYNzqfb3xNsuGedxo9sPQod2U9yJ5Be+G8kMVn5YfQ8cgDqFQQjFuMr4rcy6olzb2E
         opqut3MdF6A6pl/hmAIr3fSJzPG0JiWjDvyPCxy5pMWQx0xDXLDONzLXZuXXayZC/Eu/
         zS1igSBSVsEFA1VDYq1tK58wNSjGtM44DwC08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718875531; x=1719480331;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rDZlI2yZ4wi+UH3k0wT+hmOJJKg/VzbaB//Srify4c8=;
        b=NPjaoOL9R7R+kcwUSl5VGaLR4lbumR5/u8Pxg//IvtaEhCLBw5TNiFeyV477oFoRA6
         +vQMfAYv4fXuOe7kBda39Rdks0wMPQZlkLvZc57zkGWclyycSS4fpXvpD6aUVPbQsE/j
         3K5DXwXUQtF6GvGTKu7K3VKTnD/fEDVv9mYWAIS0AlLwj8DVWkd/Fq3ctORDQgvZwY+D
         2hABa1eONZVFOPiGa2+UDbC28ZDC1AVsSKkMO55cqqUlRoFp8rihJ5e479Iz/SJdjcLU
         9at1J96D/qvQ/dgcT1PAD1zkcJMn4XP8S/L5UFt9uANInSvS4ewybUCQOtxYVWVE12vy
         p1wQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNsuY1V6p6xdL4r9E8QHfA7bih/ks612QpLQC9HVN/FC+xfKN8mZjwAlhPUliJciYlQuMA7N+nA6OdqImXf8UoLaSZMAQ8w66VXpY=
X-Gm-Message-State: AOJu0Yzw9QZA6UO/5Jakklyb0zDWgvqPnSaoovUoDzsj2yTrCuI9wT9q
	83/K4qy62zSOztMlbehokH7JRGRmmzotnCbCxUp9GDqyUojrlFZico5joOKsOg==
X-Google-Smtp-Source: AGHT+IFjLrlNvst0OTexBZLhq72UApS8umR+VI7cUlAbt/0YeIqLW8EGKxs24IIss6Yf64ZG7G1XCw==
X-Received: by 2002:a62:f90e:0:b0:705:964e:d9f3 with SMTP id d2e1a72fcca58-70629c34f80mr4334277b3a.11.1718875530972;
        Thu, 20 Jun 2024 02:25:30 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:c53a:5326:7f72:759f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705ce168be0sm11866412b3a.28.2024.06.20.02.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 02:25:30 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Trevor Wu <trevor.wu@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] ASoC: mediatek: mt8195: Re-add codec entry for ETDM1_OUT_BE dai link
Date: Thu, 20 Jun 2024 17:25:24 +0800
Message-ID: <20240620092526.2353537-1-wenst@chromium.org>
X-Mailer: git-send-email 2.45.2.741.gdbec12cfda-goog
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This partially reverts commit e70b8dd26711704b1ff1f1b4eb3d048ba69e29da.

Said commit removes the codec entry for the ETDM1_OUT_BE dai link for
some reason. This does not have the intended effect, as the remaining
DAILINK_COMP_ARRAY(COMP_EMPTY()) platform entry becomes the codec
entry, and the platform entry is completely gone.

This causes in a KASAN out-of-bounds warning in mtk_soundcard_common_probe()
in sound/soc/mediatek/common/mtk-soundcard-driver.c:

	for_each_card_prelinks(card, i, dai_link) {
		if (adsp_node && !strncmp(dai_link->name, "AFE_SOF", strlen("AFE_SOF")))
			dai_link->platforms->of_node = adsp_node;
		else if (!dai_link->platforms->name && !dai_link->platforms->of_node)
			dai_link->platforms->of_node = platform_node;
	}

where the code expects the platforms array to have space for at least one entry.

Re-add the entry so that dai_link->platforms has space.

Fixes: e70b8dd26711 ("ASoC: mediatek: mt8195: Remove afe-dai component and rework codec link")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 sound/soc/mediatek/mt8195/mt8195-mt6359.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359.c b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
index ca8751190520..2832ef78eaed 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
@@ -827,6 +827,7 @@ SND_SOC_DAILINK_DEFS(ETDM2_IN_BE,
 
 SND_SOC_DAILINK_DEFS(ETDM1_OUT_BE,
 		     DAILINK_COMP_ARRAY(COMP_CPU("ETDM1_OUT")),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()),
 		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
 SND_SOC_DAILINK_DEFS(ETDM2_OUT_BE,
-- 
2.45.2.741.gdbec12cfda-goog

