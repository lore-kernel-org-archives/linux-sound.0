Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C361340405
	for <linux-sound@vger.kernel.org>; Thu, 28 May 2026 22:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780006788; cv=none; b=N+vkPdTS7ZSLtPTwNtTfGFFt+2Sh5zArdpnIS/VX1wlXxulDcuXAjKwvrN4fdYXvGEarewGNx97KW7db2c7slhG2WR4lH1evYlkHgtZrXEznLBr57sAyCenRRn/tg17Xheci/UT69qMUWxUCcPTro5+7N035hQ4PHXdSf/tvquE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780006788; c=relaxed/simple;
	bh=y8fllK6DUVg+fbHg/xFlPqcnl+q3JGyAPz5ibsHKLaA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pm/eilYpsMD6aLh9lIb9WkBPcEpeWRPhoq4r7jB6AZXVECBB97ECbbi7iYNWWtZ2Wem/LJ0zOTCoSIkT/nYny94hONc0qt1FjZaHFAN5iQqBHL4soZffTQ5GTxo1hB5tPf5AH3KAjCHxCS9+Zwtgtn2+ccx2hlWLgSgAP+xc1xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YcheFF6e; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YcheFF6e"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-365cae89bf5so6015653a91.3
        for <linux-sound@vger.kernel.org>; Thu, 28 May 2026 15:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780006786; x=1780611586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/fWMHr/nSoDRFka1B2UjzHLozjqK4nBjXv2Q9bUH4PQ=;
        b=YcheFF6ehzBj5UfBXFzr9nL4mrscp0T9kY7aZLQXD/qKQlUv0rtCW1G/NIJO2Ujcz9
         iXYwpCtWIVVrkkys/bq5YzBtno7sGRau4UkH18RtaIDk06v/Psc93f7OaXa1nvclUTNo
         xRpmEBuJj/8Py7R8Ahp5KL4eb7royu5MlRs2Bn8KC2+Jq9RpBWTdy1DUwXrHxZc4CUEQ
         823rHN1hyF/SRiOM3PZeCqtlF6wS1tRv6zxea/70bzMqIpdQrrjtCsGvdv+3GuMD5Nx4
         sfldefzY0p4k4J78G/AhaF/B0ToHwsRmJj9kKbRVmTR5b2LSFph+OZm54xGbz1Qo6vAC
         KFHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780006786; x=1780611586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/fWMHr/nSoDRFka1B2UjzHLozjqK4nBjXv2Q9bUH4PQ=;
        b=M1FRJ7ttKtDTRCLlmJnlv/6I/ZgxoPgMPk2ipMG8PelLgXoDtwNM8jl6NXq1OcNOs5
         3+qR8bDDadBiY7WeYVKSSlLj4bDFg/hURTohpZ1sL0elzMHaxsaTQiLanu3iVoRrcbeS
         hHHCsb9fudxvXT2mwOZKTBbPxmi/lphNtCgflRJ/zOSaQM25ZbqP4wZ3xnpDqc8oPoNa
         d4WUqF7IFWxMS3CbAq4U1IbYxrdBS+nqYHt21JExxMTH0k847bAVzPrRjE5L+xrLWBuN
         C8kQc1wdkwnMG0zzMcG1T82INQn1YDalbVJ8W/H+iyT9ZneaEzEmoy4csZWcvvTpWLhL
         7WbQ==
X-Gm-Message-State: AOJu0YwQ8lGUIYxuWnUpr3aYAemer5M84ya0JI4sPt8wifxln+hF0/+5
	8cTvxF8af/kDu+LGnWGmswRsKycH8nHhrVOVXX/IBjZmkPVfxgJEIsDJma/DWIRa
X-Gm-Gg: Acq92OEBXYJC8Xg3KOMt96cHwCbc2mfAs7EMahzeZRGrs331EjMAgNBbbOGVXymOBEW
	eNq8e44Pw992ydHXR3evGpXhCxWh5teiBMusXdTYUMz7HF1Sn3nk5t+qGq673qXuuoqR0lvMf6d
	ca/QhrzWLxy157Pf4jwg6DTfSU86J8avDJQvSU9EMHtAkmwzGZcruwFB17LrJIOggY+KEuzaWWa
	KR9dHpzUbtqXEJMt78FpNHaj708yUFt6h/aj/XMhy13zcXxYTYRI9ru1l/qlJNmkKGzbvhiIPLy
	bKXo/lVuLdHyPjhmZKP8cSbbDre3+nRKKfUCJrwY8GzrYNadVPXLGws6oA6Lf87bV/GOQfPlI+L
	N4CwO//ggmFUSknNfW2wbQczTNaXfFULs2oZFS9K6KVWSrdvHCN7XNAUNLRVRbVxXNp9Cv/71M/
	tTWexqNGF7dExxBWEiAuZM07aS6LR3phtJrT6kl6B4lumTphikEDSINRLcdgpehQjMVxeYNu9eA
	jcBLLBT6qUfm6xzwksHlAK9qIvn6gA+VICJOiLSdhNLhg==
X-Received: by 2002:a17:90a:d44f:b0:367:f76c:4cbb with SMTP id 98e67ed59e1d1-36bbcd91aefmr393328a91.18.1780006786435;
        Thu, 28 May 2026 15:19:46 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8575c9ecefsm35232a12.24.2026.05.28.15.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 15:19:45 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] ASoC: tegra: ADX: use of_device_get_match_data
Date: Thu, 28 May 2026 15:19:28 -0700
Message-ID: <20260528221928.142511-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove open coding of the function to simplify the code.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: move back soc_data assignment to the same place
 sound/soc/tegra/tegra210_adx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/tegra/tegra210_adx.c b/sound/soc/tegra/tegra210_adx.c
index 12371f895234..9b662fcee66f 100644
--- a/sound/soc/tegra/tegra210_adx.c
+++ b/sound/soc/tegra/tegra210_adx.c
@@ -677,8 +677,7 @@ static int tegra210_adx_platform_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct tegra210_adx *adx;
-	const struct of_device_id *match;
-	struct tegra210_adx_soc_data *soc_data;
+	const struct tegra210_adx_soc_data *soc_data;
 	void __iomem *regs;
 	int err, i;

@@ -686,8 +685,7 @@ static int tegra210_adx_platform_probe(struct platform_device *pdev)
 	if (!adx)
 		return -ENOMEM;

-	match = of_match_device(tegra210_adx_of_match, dev);
-	soc_data = (struct tegra210_adx_soc_data *)match->data;
+	soc_data = of_device_get_match_data(dev);
 	adx->soc_data = soc_data;

 	dev_set_drvdata(dev, adx);
--
2.54.0

