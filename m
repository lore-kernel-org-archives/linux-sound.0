Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B6A3D47AA
	for <linux-sound@vger.kernel.org>; Tue, 25 Aug 2026 08:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787646131; cv=none; b=AHQlDUKLCXdq+nDGydipvrvnCpqhc1rGdCo/FTauifUIaUQFFh6WZAQHhCa2YqD3AWn2FzJy0AR+B58bDC7MxRhXxBCmJ3qWKWKELEVomJlgJBwuE4fMhm7CKBkUyGUNXb+hcsaPEZld6/9ihcd9fYllGugAukFxLLQhYwbk4Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787646131; c=relaxed/simple;
	bh=mRJy0c72RRvKN67bg2xlInX3NFWUh2s+PzjaJOfoRxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=klRwyD8b/GG50GnxxX8iTbgw/TKA5zS0J7c6ZdbiiGSAXBtCYqJHEXkM5pbMys0xAfjPktLSzKHLecfO/iTg8WaJ6Rhu3g2fXIspH+DARl1DtjGut7NnC8BYozAW5TUG0cYDSUAe5MFT2ppZ7GaB2eH2lvPUyraqPL39A+4nNT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OMcs6I1T; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OMcs6I1T"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-848593533cbso1434261b3a.3
        for <linux-sound@vger.kernel.org>; Tue, 25 Aug 2026 01:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787646129; x=1788250929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fyutcEcBNhVLGX2cE6hT7o6hdT197Wb3v5dZIF2RSuM=;
        b=OMcs6I1T2mxjnqtMnkfzE6RR0OUw/UJ/2GJkaxoW5DeTY7dIOFFaiVB9IvROphSfYj
         0o5KAMRJUXp8mcPQmYCjt/EqrOjoirEcEV/XFtEjgeMsp2ZdB//lDdaJUebD2+v8WDFP
         DxQ3uX0W6nDopKst+JQvVvCEF8ruTnmAxhcv4iQWvaT+ffgAcQhrLOH6cW60BCev1Y6L
         DMrDQsNQsezCm5cu8TDQcYa6Q6XPxdDtTDGHMADaX2Lujop/kqqpjIOq0iOzBTLFRFez
         zqFWxQd3X85/O2nCCYy2xAmvFg7+ohr+NidPcPkfZ22DuhObMgXBy76Z6NMZPKja3IVL
         UGTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787646129; x=1788250929;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fyutcEcBNhVLGX2cE6hT7o6hdT197Wb3v5dZIF2RSuM=;
        b=SZUySaUGAfYHqPg3GMIeaTotE0AjQU1dI8wIxxk30X+0LHMIt9dxa+QXgZ1PLCWra3
         wobJSQJJh1eqRTQfzTL2cydPIY3ONpWtJpMF7BF9Js/F8GaSoycCfwS7laknfPZQdlZI
         ldH56BQFOqpBSgsDtolqJ7738s7HtG4GlX9hwNCXavyAInrlxPE29x9K4MtwgsrsFt2C
         nA4G/cs+vhavAdbSFKzsHm6cOq33MJyPx2rKcPKaMAtKI0oOXB5alNqGzznNQMCIKlT9
         Ue36VkcmfvMsbakE2Jw1wWBeDAZl5QI/ZlWL0t7LyIgkFeaUiBdO+P2mPzCIiAuK1UXw
         Ht4w==
X-Forwarded-Encrypted: i=1; AHgh+RqB8oaJ9jByblPJZ64mKoeIlMteqpeLGuGSVn4twO29vaEkypry3AQ4K8kpOupK6k0B60aQVY415Ukl9A==@vger.kernel.org
X-Gm-Message-State: AFuF++mNMaafMryuc2xm1nWJJYZZNKjrhBrnoVuXfQsHz6f4/wi0DbXm
	i06+Iefl1MhY0Z8M2aQ2mLFeqFxRVp5fbFHLiJrHot8KejtqaUAkGKu3dJbbtA==
X-Gm-Gg: AR+sD13cKGtYG4bUicA5+otu3gessil6bJ3S+w7pYU1SXICT9b2NWFOBiqbucmKynXd
	87kq06Fl7P1BahMAsaO2jpJWxViMHC/4YXtsg+Pv6XPn76+p799QQhbtRwvkIZrk/uN5hDeNfs5
	apUXe3Mi6WeToRE/G/j2ozAHXIT1v/c8aDNHadwKDSkvUlryycqqITLh6zUeon0B3INxvF6YNKl
	b1vuL/62DMNjkFPXRwysRFSiuVtrKGHEL6MQ87dqY8k5hEAzR0+NUBsDE4el/pkLjQmuzdXdvPe
	lt+NViI0D6ngsu83+ZviVNelJ8pbngiXilyo/UOwUqhwlp0wmLJGovPk/P1fINTRs0vvxfyJ2Bt
	6cacvztzSc83etoM0/QQ1vCbePdKlLBqPTwzUpXbNAY46ZN/BOPAzLBWvHW5dbYlVixYvyOI6qd
	GHMgivF9F2gNQWO6/AqSmuMGpPZ47QOg+dQ/+VCqUBUZof80zM7xvWoPFP+jv8QwEwmEetKdqgf
	GjrqSvivxwv0U2Ao8+NGCg/gzyH94BKFKIOjHL7kDeWlpXTFHYgaLq+lN2/ul6U207FpYL6TnrR
	JWc+
X-Received: by 2002:a05:6a00:2383:b0:835:6388:655d with SMTP id d2e1a72fcca58-8520ba30a62mr39852008b3a.14.1787646128973;
        Tue, 25 Aug 2026 01:22:08 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8520f151c7esm2749509b3a.48.2026.08.25.01.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 01:22:08 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Lars-Peter Clausen <lars@metafoo.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] ASoC: soc-generic-dmaengine: Fix DMA channel request warning
Date: Tue, 25 Aug 2026 15:19:49 +0700
Message-ID: <20260825081949.55537-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The DMA channel request code currently warns about legacy DMA failures
when the channel name is not present in dma-names. This can report a
firmware lookup failure as a legacy DMA failure.

Furthermore, failures from the legacy DMA path are already reported by
find_candidate(), making these warnings redundant.

Only warn when the channel name is present in dma-names but the request
fails, avoiding misleading and duplicate error messages.

Fixes: 9167f260477b ("ASoC: soc-generic-dmaengine: Handle DMA channel request failures correctly")
Reported-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Link: https://lore.kernel.org/all/aoyBuho270dTWYBL@jupiter.universe/
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/soc-generic-dmaengine-pcm.c | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
index 3b18d90e81c3..65b7ec52a054 100644
--- a/sound/soc/soc-generic-dmaengine-pcm.c
+++ b/sound/soc/soc-generic-dmaengine-pcm.c
@@ -397,24 +397,8 @@ static int dmaengine_pcm_request_chan_of(struct dmaengine_pcm *pcm,
 			if (PTR_ERR(chan) == -EPROBE_DEFER)
 				return -EPROBE_DEFER;
 
-			bool has_fw_node = dev->of_node || is_acpi_device_node(dev->fwnode);
-			bool name_exists_in_fw = false;
-
-			if (has_fw_node)
-				name_exists_in_fw = device_property_match_string(dev,
-										 "dma-names",
-										 name) >= 0;
-
-			if (has_fw_node && name_exists_in_fw)
-				dev_warn(dev, "DTS/ACPI DMA channel '%s' request failed (%ld)\n",
-					 name, PTR_ERR(chan));
-
-			if (has_fw_node && !name_exists_in_fw)
-				dev_warn(dev, "DTS/ACPI name '%s' not found, legacy failed (%ld)\n",
-					 name, PTR_ERR(chan));
-
-			if (!has_fw_node)
-				dev_warn(dev, "Legacy DMA channel '%s' request failed (%ld)\n",
+			if (device_property_match_string(dev, "dma-names", name) >= 0)
+				dev_warn(dev, "dma-names has '%s' but request failed (%ld)\n",
 					 name, PTR_ERR(chan));
 
 			pcm->chan[i] = NULL;
-- 
2.43.0

