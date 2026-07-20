Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B050E3C3C15
	for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 07:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784533278; cv=none; b=fquB+qthAO601w0zsgxVKf6ElOFhPA9PAIQZ2E2khcWmJUJxJcMfipEC/F0nkRFRh/Qx8TC/9F3p4QjP91FsH521Z5rQ4sY8SEbvAe3syBUwfx1wXSuFhkplsKT/o6h8gcOZCNyykwWdlTuV7xCY0MTXovxoDoNiOxnd9neEBH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784533278; c=relaxed/simple;
	bh=P1BWBCuSMBkPDa2NFAGSAPxJ5vbk5UKLN1ndBku1mkg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r9j44gQHiBSJBZAYDGOA9PUKx0sgle9xf+4zsFlvW26kyPu5rqt/7rghY2Eo2qwSWkIg9Q8/yQ4183AdAe7tTSNnhK+P8jP7rmIanljf40suLJJk1U4pRkahDTIRBsNWK5GkF8urLiebLVBcS4n0J1eLYCTVRmNJqRsJJxAsgco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O9YnZYyR; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O9YnZYyR"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-385ea3ce80dso9811935a91.2
        for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 00:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784533276; x=1785138076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QGaNvrdWrI81wJxxoSDN2zk2fUww4x2xHVeZ5hAGgN8=;
        b=O9YnZYyRXRUChOi7WWYT15R1/zG6Ga87DpXMUqSx0T//ouOVcZnoxwQ21kaT9sjEge
         5hsFW1XJxSxqNRn1RYicgAFSi4vYB2UMIZSlcWmjN/Kk+cfVDA3njzSu/fMhWHsFYtZg
         cd6GCrNjmSfipIn1+JnwXWniHm+LEREXSnBO++zemBo3YmwuRCnj8axKuv54sXQ+DZd6
         hQS+foYmB9UY6mW6hWH9QJJPbbDlLkH09AWyJ5XhcDKOP3RXqXin2JaAc/UHRFClmW1t
         QPQTJ2yyemQy2kgmcshYtC6kO16tfg5JdqJM84URNNVE5a+2DYiaOIZpQr//zQ2NJ+3t
         5GHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784533276; x=1785138076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QGaNvrdWrI81wJxxoSDN2zk2fUww4x2xHVeZ5hAGgN8=;
        b=Qcys8uwYDkUMuQtUV19Z2depYgmJrANVu5H2v7HPL3wsOpIj3o3PjfBggpFL1yRwfp
         AHSyDmsxr/8Y+PvnQ/eVjCdwONCrayUzBeiilgKu1lDppfmIGgdNg3+sfcY0szomPb8a
         vZrgCrNRZdmt9Pks/PVOCZ3iItCu5KjKnGiM47ahImgZjMciqWRXjGsdLBD4M9IMUx9U
         hWjsGI1PWCrmUSCsKGKSxoQNmVlS3ZPKs+OMYd99xUpuoo4g+sa5cKszbnumem90kdNV
         5nvbIxb+XOiflyvyFGfVr97kM2s1YIrkMkvVO9aeXNRbgISwy6z0/GOPxc1/0pTSi/Pd
         HLSw==
X-Forwarded-Encrypted: i=1; AHgh+RomQeEdprmtuGeyMKOuZu6Mpkpn0wEmxuPw3YLUdsZyWUWFoBXhvLXFF1dUd9+5nbC0JFTwODQbYzi+kg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIzWgLoHcuZHIDnvDYetFrVw3Vp5ioxWp6zqCXj0UxQglTGxC4
	Chzk59WwQhF3vipOfrDABDIMyao9VGHpek061K1DE/IYmH1KI2dd2/Tj
X-Gm-Gg: AfdE7ckxAbmRlgOWihGQdU6lTKwoBJy7UlKAr/hheQjDMs9FEX6udn6BbvzCEfbeUwL
	qMJlOwobqEf0kfNkmsqdnWcff6lqSCLrDUlIuQTC0Q4hAVvsqsRH5nqDsI6yE+HsfLcZTf31PXJ
	5bfoq8CcF371IEOkcqCTsNbXXTGw5dp1O1oIa/+YLS3sTQsMjjJs4+7R+iO39+aG/A4qI1Rm+96
	cEhFj7Y1FjAg1y+w/1yY7vG2phEG3sUC/GEMtQw/2QVkiOLxESM9yArCmEcdvESotD6WvEGiy2O
	6wnvmqolVvzRgIWXBggQR9PAu+KNoocyDZYyBX43iPp15clLj62avv7rncIfBpcjN5Kj8paNhQu
	KRmGp8z+vqRNJ/4wR8j8hkpxoHpHWShtQk6lJ28n9RkBOTtbhZFqsO6oePeXLmAC91ApmaLyL/t
	woWMcoflTV0x7fbfyIeAks/iqRe099OehSr8Qo
X-Received: by 2002:a17:90b:52c4:b0:381:85c0:1d88 with SMTP id 98e67ed59e1d1-38e4b417454mr14266360a91.9.1784533276029;
        Mon, 20 Jul 2026 00:41:16 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e60cc2ad5sm470171a91.4.2026.07.20.00.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 00:41:15 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/4] ASoC: stm: stm32_i2s: Drop redundant error messages
Date: Mon, 20 Jul 2026 14:40:41 +0700
Message-ID: <20260720074044.87528-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720074044.87528-1-phucduc.bui@gmail.com>
References: <20260720074044.87528-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Both devm_request_irq() and snd_dmaengine_pcm_register() already log
failures internally. Drop the redundant error messages and return the
original errors directly.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/stm/stm32_i2s.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/stm/stm32_i2s.c b/sound/soc/stm/stm32_i2s.c
index ae9e25657f3f..83b51893b37c 100644
--- a/sound/soc/stm/stm32_i2s.c
+++ b/sound/soc/stm/stm32_i2s.c
@@ -1238,10 +1238,8 @@ static int stm32_i2s_parse_dt(struct platform_device *pdev,
 
 	ret = devm_request_irq(&pdev->dev, irq, stm32_i2s_isr, 0,
 			       dev_name(&pdev->dev), i2s);
-	if (ret) {
-		dev_err(&pdev->dev, "irq request returned %d\n", ret);
+	if (ret)
 		return ret;
-	}
 
 	/* Reset */
 	rst = devm_reset_control_get_optional_exclusive(&pdev->dev, NULL);
@@ -1295,7 +1293,7 @@ static int stm32_i2s_probe(struct platform_device *pdev)
 
 	ret = snd_dmaengine_pcm_register(&pdev->dev, &stm32_i2s_pcm_config, 0);
 	if (ret)
-		return dev_err_probe(&pdev->dev, ret, "PCM DMA register error\n");
+		return ret;
 
 	ret = snd_soc_register_component(&pdev->dev, &stm32_i2s_component,
 					 i2s->dai_drv, 1);
-- 
2.43.0

