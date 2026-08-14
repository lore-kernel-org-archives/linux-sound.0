Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B1E42BC38
	for <linux-sound@vger.kernel.org>; Fri, 14 Aug 2026 09:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786700574; cv=none; b=AmFm8vGcWVYk/O5ZVn+wOmKgCWaxOaVO5hELSo99r+lRpVXduw6/7FpViD7FTuTkYgGEX5f8Gq+qS/AyKp7BmA47a/1Dt1M7VuqjuAl8esicBFoDT+VWEDUq2hGkFbsiimJOMIoMeeEmy3GNLO+abaN5gGZHLjvYps5ku6GGeL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786700574; c=relaxed/simple;
	bh=U6zlOTmDDp7vXuMI8Ch219rSAUzIAtsUdJy+GjmOAiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KpA4nA/Nk7w7bkrGoVYM9GyfpUs4widwPuZDbfs9cz6gPVz2Bj0DhZYNT2/dCI2setp1IWV2cKKL/txzdaVA9pltQ2mDXLsYlPNgwLHL23R/U1/9nJ02XbU9tBoVLhP3XwcE7Eons3YGOnmjfRCcnF97TGqOCdAN23ViAvGelNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jDRUnt33; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jDRUnt33"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ceb096e675so10469995ad.0
        for <linux-sound@vger.kernel.org>; Fri, 14 Aug 2026 02:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786700572; x=1787305372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DQUfUfTTlEody32mTsvlfp+8+YPg0H0ekzGI3D7V1rA=;
        b=jDRUnt33xSjuMvBNPLsZ+/JsaWs+SxOw2996Pa9vlWh/qotcp5/BLMkOBZtNfb1bZ4
         cat/UYzkgpzx+g0FZ5go3yfd3ZcYrD1I16Wz/8uew2ze+m9+P9Bxm9q92mTZ5fsEs+ep
         lOALEJm/VAB0g9p39vXcns0LsphSKm+7Md7PbMXMO5F2+wRld/TnmqrUehNOLhegxUM0
         eKE5QqhBlKjcxNJiQrwRZPfMvAqgZmL1wB9NHWhelzD1cBVVPuaNVasO2R9AMIoEeDXj
         c+KSvB6CIOQ3tQRIdHIi0zr0c+4Rd8UvuchsnY2HY1tt9wWXCP3mx3F1jAUuou73EEOl
         +0ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786700572; x=1787305372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DQUfUfTTlEody32mTsvlfp+8+YPg0H0ekzGI3D7V1rA=;
        b=Jd8dbO6XKM8ONJi1h5M0ExA/SSTr25p9DlQs0hRJntcG50axn+KYxnTUVWdnG7LNk9
         WUHg22PcsG9Ghoj/9ybu6gdSDjPL2jvGD44N4V4XuBHtOzmDcGtM3PTYeINpCw6d87Gb
         tRBkOrXH1LYioLnjrb70jGvAqtFD8b04sADDuvBtvoezPoXjBlkSUuT8LGYZzLgaFJWq
         aUBIAPndy4YVCjMrm7DgyQ9tzGb6CuM5kBWjRgL/J/0YNCQv62dLNjeG8xnPwpx9V28K
         ctwR/V0Asf6PiNqFFc6KVnCSr7IWRijvjg0U+43J0s5iha1VZrysShJy6996f456udd0
         R8bA==
X-Forwarded-Encrypted: i=1; AHgh+Rpt+oZMaPuO2NdQiQwrdEdrtGOPlO7Vv8t904zthfxtluv7+bB0p3sgzG+lVGRwv6D11j3h142FVxp/fA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7UNhGJusK736hly2QNnS+ju+bZ6TJzY6cZYoj8m4pPRAuD4xb
	VS+LVOSsEAgsC/IBgDHHBSSB2mc2cFRYWIj7CSDzfcDfYgfyDaxv2lVS
X-Gm-Gg: AR+sD12Dkh3yBNI9gv57lzqGFLMQaJz4vu6LfPziKj02yHeVq3g5aldsm0xHNHfL8zh
	AiRY0gIs2qFCB029zQpxLAZLAUlCVd7jFK7OHVzyDNhXou6CqXjb6n1rwKhchf2y5HZPpH9Nz2f
	URVD3aKaaxQyMWUmf8bUmiHz+fXYgoHXvSwCfWBUw4qvz2343CWs2LkmjsbB3FLJT5s6409mNFh
	4y0E9GQx9q7sHImJYzMFKGsykYzThDjsgMVIqO7DQUkglj4yd0HG+a2kAk/onoRf1iYibfJpFHA
	02jxFIvK5BaCVv3uqc2NOgbeCqITpmTO4xBL+AAg+w/tnDX9xz7qNzYb/PY/pro0XOEGhOcn2i7
	ndpOMW39MRryuJE9MuE3jXW+n0UFdQ/dspFXeOccScwaWON7Dr9fQcLLfTojslEQxSGXyPNOEmu
	3j1nlza9CZC+WNIJOANlB+uvbDRma88aJ7IIHKEdsG7KU7fzCFFrQEOEVDLIqLHGYXskNdcIT0i
	iJ1noS1uX438YOOKWE1/L2ofGx5bIkq0e++6J5Zdf1Sm7ozvtw7i/rIWAw+rEHQDLVeR96B+phJ
	lqrT
X-Received: by 2002:a17:903:390d:b0:2d3:89fb:35fb with SMTP id d9443c01a7336-2d3b04c40a1mr57522695ad.0.1786700572325;
        Fri, 14 Aug 2026 02:42:52 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3ae7c067asm7446345ad.28.2026.08.14.02.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 02:42:52 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/2] ASoC: meson: meson-card-utils: Drop redundant probe error messages
Date: Fri, 14 Aug 2026 16:42:11 +0700
Message-ID: <20260814094211.25151-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260814094211.25151-1-phucduc.bui@gmail.com>
References: <20260814094211.25151-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The functions called here don't log the error themselves, but the
error is already reported deeper in the call chain, so the dev_err()
calls are redundant and can be removed.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/meson/meson-card-utils.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
index f2796dc84fa5..e4c3eda24d82 100644
--- a/sound/soc/meson/meson-card-utils.c
+++ b/sound/soc/meson/meson-card-utils.c
@@ -290,17 +290,13 @@ int meson_card_probe(struct platform_device *pdev)
 
 	ret = meson_card_parse_of_optional(&priv->card, "audio-routing",
 					   snd_soc_of_parse_audio_routing);
-	if (ret) {
-		dev_err(dev, "error while parsing routing\n");
+	if (ret)
 		return ret;
-	}
 
 	ret = meson_card_parse_of_optional(&priv->card, "audio-widgets",
 					   snd_soc_of_parse_audio_simple_widgets);
-	if (ret) {
-		dev_err(dev, "error while parsing widgets\n");
+	if (ret)
 		return ret;
-	}
 
 	ret = meson_card_add_links(&priv->card);
 	if (ret)
-- 
2.43.0

