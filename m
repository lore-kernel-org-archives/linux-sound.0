Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959E7242D70
	for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 01:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782783040; cv=none; b=UHmZOETv1G6jyJatEdFDdx1hE9x2I6t1KyDWLRFolRoUjA7mXXtzhRCAnH6y4Cj5CeYvbKHW7QklcaZM368BEMWZhQwnSKFOioI5WiP7lnk4uVdTXMUJqodxSo4zj89y8peODJwSYzJ3BPp9zqDfclQ2RLDMCBEv8xuCKzS43ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782783040; c=relaxed/simple;
	bh=NpUaigxauyZXOTyLdgoExFlYTFo7RPi/zshL91x7isQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V9D7Y9htoARCfzLqd4pPU67B/CwaTL1zxZifluPtilCwZfGbbOUZBq7sADcbfkP8qD5Ati1q0O+qzEJTTFC8h5zz0Shxnd4AEIZc4JmqAJKCRAF5Maz2IhXw/5I1Are2WOOfDio5la0DYC9gTYGPqDlrrXEfDpQdDop5C6MLSUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fAB4v+bc; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fAB4v+bc"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-84236f9b638so1696377b3a.2
        for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 18:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782783027; x=1783387827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3Qe19a+z1rLWPp/tt9oeqeMHtij9RgDnTjm7JiNj6mo=;
        b=fAB4v+bcYKrgZRDSa4AUhQHFrV6RavvB4pSkzOab9U5aK06uPPd0EhF/dgYAeUAUAn
         64Ir0e/21r5WjceiY0E9D/JjUllAlMcQF8kH0Th6hGK0gt1fubQoRRSfgBUmrA+mC7V6
         au7GJZe2LI5g9hEUpOy2jPXWymN3xwurnIgGmGjS1+O2YWZSEOQxKo9G5gmahRiF1Qub
         2i4IRCv6fTjL8qYl95yrt+BpfRZ32crFft48JXGMyaqoQ7ExmOm0Gxj5sqEujsvwzJ/S
         cDcTxzBS6OBrHYKeWxy90Bia+Hshg4+UQyH+yN1qKAW9X6uy8gMVYA7oKcFVf0BTAtKT
         I4xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782783027; x=1783387827;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Qe19a+z1rLWPp/tt9oeqeMHtij9RgDnTjm7JiNj6mo=;
        b=fPBN8XoVhKsmhqIKNOmB8RGORGWKIQ48pMkhppJjwx+SOd24GctOEPqctlYuk3vvy+
         t6kUfkR8m7jnVe3NPtK37Lioc5V3HnUJX3fMyX33C/BvwSw/cPyiamLMDwI4tiCGoP0b
         TuLTnClyMiVuK8Nby5KenaxUh2jHxQ5WgMJATNiH0a/LP2nljZd2k/o/B8zrGz+5SQj3
         2xeIrIMs2k5ip1BoQWh4qbjRFrtx2chn3VLmwxORzS3sudWatYCxfpPWsgnAypjOodAl
         o4rMJBb4qhJEnWWBpfLfMTgRM3d7bjPDuxMNIjvzVghz8169HYJjw1pt/sry8VmVtVuH
         RT2w==
X-Gm-Message-State: AOJu0Yye9rcwlE3t2gc919IWlGIvSnPeaZG6zSpKfuiMLZ/COwLYhtLM
	H7krJo4u0rfShEMVqNZkqUTAJXy7IWNgAfGOSRKMdGCO7GmugKWWUk3bORTvOIoR
X-Gm-Gg: AfdE7ckIdiCk+g6cepY/HHSkUP+4EukzYyD6kkUV9D8klLvoL2kiy/RB+/G6ptEQZHB
	DJ1YNJW9d4mP6XCfjzo0gc2s4o1m1p7nFi8vcQBVuV4qNKzXmctlrj+iWesOoshBmZJ/OtdVNcY
	EqmoqNA2x/i1Ljn4dmqqdPsTLYOOLEJ0ndasR4e3da3UZZbXW074sXPyksWRGYaVkV8IKb9EuW2
	2pGvtiZUAh7OphOKMORiLQLe+hkc+hpwiAGLdyA1MFikSxk19PfFwMgSsBbYXlmJ/0q2+u2vSse
	b6Cxs7jgDdixd3uQK3v5H4km2YoAlLpLfl4evfFufWTVko9T8KD9Lj9+nefAR7YRs6Qzt51+GTY
	CeZAWpas4T++FYmEWTT7NFd9eOizQ26MKXOBdw1aJGPZ9216ok1OHduSRWTCU1DxLv3Z7mVh5LL
	ROgW7RwWhALh76ZcM+J+HJojYXTozPQYZtDnmrhInyWjxt2xRyAHLlCKO4U1FADRqUIMJd2XjF1
	R/o0gUcQA==
X-Received: by 2002:a05:6a00:bd8c:b0:845:259f:8925 with SMTP id d2e1a72fcca58-8479eed8083mr1234602b3a.6.1782783026718;
        Mon, 29 Jun 2026 18:30:26 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a03cb50esm681063b3a.60.2026.06.29.18.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 18:30:25 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support:Keyword:mediatek),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support:Keyword:mediatek)
Subject: [PATCH] ASoC: mediatek: mt2701: add COMPILE_TEST
Date: Mon, 29 Jun 2026 18:30:24 -0700
Message-ID: <20260630013024.1500623-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable COMPILE_TEST for mt2701 to get extra build coverage as done with
other mediatek platforms.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 sound/soc/mediatek/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index 4af7bbb58010..224746e7664f 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -7,7 +7,7 @@ config SND_SOC_MEDIATEK
 
 config SND_SOC_MT2701
 	tristate "ASoC support for Mediatek MT2701 chip"
-	depends on ARCH_MEDIATEK
+	depends on ARCH_MEDIATEK || COMPILE_TEST
 	select SND_SOC_MEDIATEK
 	help
 	  This adds ASoC driver for Mediatek MT2701 boards
-- 
2.54.0

