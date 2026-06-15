Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B79A3DA7FB
	for <linux-sound@vger.kernel.org>; Mon, 15 Jun 2026 09:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781516373; cv=none; b=X9J7oXzz5YHtNL9Rg9JauxYS7sr+BrHku529hrXsTkuNgxyDNWXyNBpMC7gly1eAFE3JqiESlLz0fwqE/148J6x5D9IN9BM+I9lMJqBcCzfxOmPROAPNVTsuKwSSbwWNf+lfs9mkevNzaIrPnsPhnfu+4z7q7YRassGGM1ug8vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781516373; c=relaxed/simple;
	bh=a8q+/xYdawHh02h+UnPjMJx9XTz6+kkAdJhtry5V5R0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YjVoVMYyB5W2DyUjJYioTJJeCGrueI7YkTpWXDbnzbVwfrEgMY/ia+LgaHsuZqg5nZDENN87dgSOKblB+PAswbmLab79/WumadiNm9Px8vL66cXiaLrqhEtEipPq1ZRijX+5wpXtWk3fdOr/llgArh0v9762sGDKyBrN31gU4wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=isV8/KC6; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="isV8/KC6"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-36bba9a1089so1798688a91.3
        for <linux-sound@vger.kernel.org>; Mon, 15 Jun 2026 02:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781516371; x=1782121171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IOlleqlCU9UASt9sEqw41R4UllxELkSYjKqivDR96C8=;
        b=isV8/KC6t+lam33AueB1D4XHGsP0KIDzF+VQLFoY862Sfk0o4XGQ/WejwMRmosGMjL
         Xye2a+SZCQfq+jIkkuVdiB1kYd8xMgo4NCsEld264LwuQP9nUOda7BhN8ZL4k8h3xwwR
         gyh4aDkon4I9XetP74HXiCBJ6pCE7F3EgdclSD1rNzEKlkVugO6h0ROoGDgn/SKMJ2qO
         uJC2PXJi0n12v83BhsaJrlSjHHqOKyQT6GjdG7hXHWtK042F/3FYcSjO+grV5EANzny1
         uyRzNH91sPXFSMpCES31inO6M0Pn9RfW6le8sQqlCkARif7yAzHH4Kjq+xAmUDKkiV3D
         4Qng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781516371; x=1782121171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IOlleqlCU9UASt9sEqw41R4UllxELkSYjKqivDR96C8=;
        b=XaI0Rfzf2ucGPMaeoRa50g1xZSoAbpn4wpebH/ovH8j/gcYzvwseoToh4a/3K3JkKZ
         CVlwrOlGy9B6ht8/VZb3wELUSWrC3323jme0+++d3ay6M4m8jQ460U/ZHC8fUeWvB4am
         FrB+0Fkj2FzC/35Hu+ea2EijBlDF8VovSK9SFvCOyINWFU00dy/tcU/J0jBmLQDmZbpT
         fsX089/nVm/kp/VlT8xzwmGay7++LsDA51opP04XZmyriJo9O2snoGUkPUy8XsmfrIEA
         n0rFv3/MG2E0FgDjatN3S/B1kNR5XAszu5xPEjRpC7ScZHZYNZqFq0p9VJ3Wj6OVOSjj
         5EbA==
X-Forwarded-Encrypted: i=1; AFNElJ/VaVuopYTuBcHo1c/zuE8QJkjTKTTGhLFq3YIVRzLCrs4FamnCwE50MfwQB2eP73VHKBk8NCmlMFeKfg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7UYiC1d9VKgBNy0jhfiMM8TtodcWTVPkoFSO3T5RuEMoTR+JM
	IY10rsKzwCm8XY8Z64GLrmr0fhd44rFE4SifYKmMiq26/pqfFjOp5Djy
X-Gm-Gg: Acq92OEeiwbx0Rj3nq++fIM143sk/TfHz5KZwDYFxHCFkmeEFb+0ftrG8q4EwUnqrP8
	m7TaMN56LCcqN1a4g4i8GLou+QKje/DyrS/qoDEaQ9bS3RVPY0wIHRhX1XXyk0WZVAiyV02QQyT
	bviaWrTgmsIL7gVWNUO/+Wl7rswvxSigAnhCfWQCS3j8Ptp1rMAEFOi3yYkn1sWVtXVwi7+udGy
	z1qrOLjiX0I1kSmuu4H0LMtvbiYe+GXYlB9t0Z3irsVnQlf1Ao73U0hsaHabmbx0S7vHDwnBsVz
	o3cIAw9DhYtqpf3XiQGMVWx42UrcJvsmnjM4kVL+qXwcgo9GiZG86NJedLrl33mPGH1Wgli/g8Y
	/Sn5Huo94D2LA8+DZw8VGe4HTLH97h+iJGDXUD8fzKkF8mhE4GnLD4UmfoVtyb/1a/ldR7w/h+h
	wjeML6mUlTIoMojJNZl2Ey8DsGM7D8IPSI2NECE2XCa6MLzSl4aZAZQGxj9w==
X-Received: by 2002:a17:90b:5685:b0:36b:9798:4f6a with SMTP id 98e67ed59e1d1-37c2bc86b05mr10709031a91.10.1781516370882;
        Mon, 15 Jun 2026 02:39:30 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a1eba8e9asm9936290a91.2.2026.06.15.02.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 02:39:30 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 01/11] ASoC: fsl_asrc: Use guard() for spin locks
Date: Mon, 15 Jun 2026 16:38:14 +0700
Message-ID: <20260615093824.115751-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615093824.115751-1-phucduc.bui@gmail.com>
References: <20260615093824.115751-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/fsl_asrc.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index 5fda9b647c70..0b28bcfa47fe 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -222,10 +222,9 @@ static int fsl_asrc_request_pair(int channels, struct fsl_asrc_pair *pair)
 	enum asrc_pair_index index = ASRC_INVALID_PAIR;
 	struct fsl_asrc *asrc = pair->asrc;
 	struct device *dev = &asrc->pdev->dev;
-	unsigned long lock_flags;
 	int i, ret = 0;
 
-	spin_lock_irqsave(&asrc->lock, lock_flags);
+	guard(spinlock_irqsave)(&asrc->lock);
 
 	for (i = ASRC_PAIR_A; i < ASRC_PAIR_MAX_NUM; i++) {
 		if (asrc->pair[i] != NULL)
@@ -250,8 +249,6 @@ static int fsl_asrc_request_pair(int channels, struct fsl_asrc_pair *pair)
 		pair->index = index;
 	}
 
-	spin_unlock_irqrestore(&asrc->lock, lock_flags);
-
 	return ret;
 }
 
@@ -265,19 +262,16 @@ static void fsl_asrc_release_pair(struct fsl_asrc_pair *pair)
 {
 	struct fsl_asrc *asrc = pair->asrc;
 	enum asrc_pair_index index = pair->index;
-	unsigned long lock_flags;
 
 	/* Make sure the pair is disabled */
 	regmap_update_bits(asrc->regmap, REG_ASRCTR,
 			   ASRCTR_ASRCEi_MASK(index), 0);
 
-	spin_lock_irqsave(&asrc->lock, lock_flags);
+	guard(spinlock_irqsave)(&asrc->lock);
 
 	asrc->channel_avail += pair->channels;
 	asrc->pair[index] = NULL;
 	pair->error = 0;
-
-	spin_unlock_irqrestore(&asrc->lock, lock_flags);
 }
 
 /**
-- 
2.43.0

