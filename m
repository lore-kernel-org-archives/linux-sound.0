Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CDB2D97AA
	for <linux-sound@vger.kernel.org>; Wed, 27 May 2026 10:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779876148; cv=none; b=gYi3mCRon6abgSc+3km9LlSFP9eaC2TeKvGnX258spH8No/5XNMflvfr7ffXchDiTQwfSpwjGN1/dVKkeV0N8zOogWYVOT7zmo/3UMGqm0BclIc2w+jMS/nMPUkgCe9OKw0lQH7e9jxNSfHbzO3xUp/Cr5ain3HCziq47bjhzFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779876148; c=relaxed/simple;
	bh=Bjf7hN3TI8rBFo86J3VB/I2bXgASxc3O0HsCfJhlguc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e3VczUulldJ2DAM5WfhRXop88rm8jBvOvWY38s4BM2ntbRh2CJnUw2woudZJm8pEZMKO0Z40Cg3PZf5wKwW6wpvU9e25Mj05BcOOUnpnMbQmou8Dz+5rNjBrg241b05GYV0IVlJpvcIM1dxx0yYF8LJdS7xWTQfOnO9JqW/6VGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M3PRau80; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M3PRau80"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-36931e4f5e8so10734317a91.2
        for <linux-sound@vger.kernel.org>; Wed, 27 May 2026 03:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779876146; x=1780480946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=llv9eK39iuv/ZdjHyRDnfcx6/aCeoNvT9KJ0UUI6ILE=;
        b=M3PRau80geVT2mfplxY45WSmjg6LeCfLv7puXYaEKwupkrD4ArgqcFuVOBDje1EXzm
         IbbbWNqTFBgb3D6rLW7E3DCek4wg38rgbWkFJdsEj/XRC1EBr3c9a1eq1Kr/AjWLekTb
         98jetiKFPId71et80qMOlZaKV27/fxJHTvsAHqYJOD4GMDyVreEdm+IstHiJSbmWcTA5
         7tFYVasYIp5SUdcCk9p80PqkRBrkqQ7XvhD8CrJZyS/crhqLCEfIVzOfHWqtq0yWVE1F
         dqx+8zuKlPwEtAW7PRJJOdebnxJTQco7LCRk9fewYR1X1LPwzkvqR+q0AracOgzcqZYJ
         4QjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779876146; x=1780480946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=llv9eK39iuv/ZdjHyRDnfcx6/aCeoNvT9KJ0UUI6ILE=;
        b=Kp1AbRBThL7ZsXBIAxUaSm3EU3iV3Fb2GbWwljjsqlPkzQb8kJ3Cga3/03BF/xOS02
         6d2slbDxzQ/ehgdnsrD0v8nl9t4jZYSu8l6J0PMD0uUCLvkbyTVGv4fT5MqqzG5sXDOn
         ib0YutYsNgXy/oZMF0VyvFMDQI2vDS7JXm8wvcWp0iZbVC9fVHrpvsbaCbftI6eiN7vZ
         aCE1hO/XMSZRWKHLOVtH5qD4ayQWqYwa98pEBD8iIcIW+TCi6kkZdnNAsnB/ApvBqPY3
         UQP8194lcMjv3CDq/IYotl03iEqHhdWXGlumzSvNYwij0nqt0FydjZdxzpmOIUezB5b1
         OXkg==
X-Forwarded-Encrypted: i=1; AFNElJ+yHJ4veUWRVKtWbh4XyRmoEDqax8zNzwj+Nl274unZqvTg/pi2TFvw/IgacbUQjXgLtuFT48p6kFFjrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+VAseFBbqbz48NSnQpM55C4O8768TiUdwLRc3ejOA/43bSLsE
	zHs6DwhyoIirFSTMWt+zv84vjnnnnqATjCNZT582yvnJ6IvqP6ueJVqy
X-Gm-Gg: Acq92OGcWsvpjc5HBAOjYjspoFuscqTru1swtxKJFFHySfSIOMnT2Bk/hizgh4MIiS5
	cPnCs1i3SMO0RSVYgWiKIGZ0s1TItliJl3LH9yt9kphXEKS9EkxWmJ6c71rzDbwjKNg9scNBcac
	jwidvTzDVVmxeKBobpS+e67oSg6G7ZPMPG31CeV0HCd/Y7m5lcw39PlGVOujB13X3YQMDVp/ppQ
	CKb1kInU1f+1DKz+KkPbY3lhY3t91ti8ZDqpiSRkwOhlvyXnidiAwginJx+dWhKsWDbZu3qNctF
	2IR5FdDqXKbIFVeZPYaOttLAH7EN0xv9KxIg0+TyOxwV2yUzQNMtpYJmkZycmUtyu6nWRvYnvju
	ysifDCFbEbcJby/nkAkLWMuKdQ3zOusSnnXip1gxEd7moZSZ7bVBYVMTXm2MAnl2nZZgis3qXCL
	DvMo8wqc5YO6w6QW2dWJsgsOqx5KStpfaaKUA4mLikT4zZn6IQ61njd/ICCA==
X-Received: by 2002:a17:90b:1d47:b0:35f:bb33:d728 with SMTP id 98e67ed59e1d1-36a67452011mr22584002a91.11.1779876146159;
        Wed, 27 May 2026 03:02:26 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85202902b1sm12205631a12.6.2026.05.27.03.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 03:02:25 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/2] ASoC: sti: uniperif_reader: Use guard() for spin locks
Date: Wed, 27 May 2026 17:02:05 +0700
Message-ID: <20260527100206.26788-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527100206.26788-1-phucduc.bui@gmail.com>
References: <20260527100206.26788-1-phucduc.bui@gmail.com>
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

Compile-tested only.

 sound/soc/sti/uniperif_reader.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/sound/soc/sti/uniperif_reader.c b/sound/soc/sti/uniperif_reader.c
index 05ea2b794eb9..45d7613f595c 100644
--- a/sound/soc/sti/uniperif_reader.c
+++ b/sound/soc/sti/uniperif_reader.c
@@ -46,15 +46,16 @@ static irqreturn_t uni_reader_irq_handler(int irq, void *dev_id)
 	struct uniperif *reader = dev_id;
 	unsigned int status;
 
-	spin_lock(&reader->irq_lock);
+	guard(spinlock)(&reader->irq_lock);
 	if (!reader->substream)
-		goto irq_spin_unlock;
+		return ret;
 
 	snd_pcm_stream_lock(reader->substream);
 	if (reader->state == UNIPERIF_STATE_STOPPED) {
 		/* Unexpected IRQ: do nothing */
 		dev_warn(reader->dev, "unexpected IRQ\n");
-		goto stream_unlock;
+		snd_pcm_stream_unlock(reader->substream);
+		return ret;
 	}
 
 	/* Get interrupt status & clear them immediately */
@@ -70,10 +71,7 @@ static irqreturn_t uni_reader_irq_handler(int irq, void *dev_id)
 		ret = IRQ_HANDLED;
 	}
 
-stream_unlock:
 	snd_pcm_stream_unlock(reader->substream);
-irq_spin_unlock:
-	spin_unlock(&reader->irq_lock);
 
 	return ret;
 }
@@ -355,12 +353,10 @@ static int uni_reader_startup(struct snd_pcm_substream *substream,
 {
 	struct sti_uniperiph_data *priv = snd_soc_dai_get_drvdata(dai);
 	struct uniperif *reader = priv->dai_data.uni;
-	unsigned long flags;
 	int ret;
 
-	spin_lock_irqsave(&reader->irq_lock, flags);
-	reader->substream = substream;
-	spin_unlock_irqrestore(&reader->irq_lock, flags);
+	scoped_guard(spinlock_irqsave, &reader->irq_lock)
+		reader->substream = substream;
 
 	if (!UNIPERIF_TYPE_IS_TDM(reader))
 		return 0;
@@ -386,15 +382,13 @@ static void uni_reader_shutdown(struct snd_pcm_substream *substream,
 {
 	struct sti_uniperiph_data *priv = snd_soc_dai_get_drvdata(dai);
 	struct uniperif *reader = priv->dai_data.uni;
-	unsigned long flags;
 
-	spin_lock_irqsave(&reader->irq_lock, flags);
+	guard(spinlock_irqsave)(&reader->irq_lock);
 	if (reader->state != UNIPERIF_STATE_STOPPED) {
 		/* Stop the reader */
 		uni_reader_stop(reader);
 	}
 	reader->substream = NULL;
-	spin_unlock_irqrestore(&reader->irq_lock, flags);
 }
 
 static const struct snd_soc_dai_ops uni_reader_dai_ops = {
-- 
2.43.0

