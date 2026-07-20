Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52143C3F74
	for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 07:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784533273; cv=none; b=uVvdRT8Dbvxx5r22tHaJQHmdfBkcO6yafywOVAMKPRsBMFmcubG0Tv+of0alk18g0ZaIN7X4//9LtLqEtUBTzyl+KPBthXdXkwdhYZGx+y37s+akHxK6kLKmfD7rJEES/oF40HjrEneEwn6fRtGwNAoTIZ84s6WuuA9g9M26Xz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784533273; c=relaxed/simple;
	bh=u88Le1fV0hlOGZ81Qp53coKrtVP9bOQJkZkhQ+nRmbM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N3/FRGrZx5VzAO/pepluJwijq0gPy7k1pJBevnRnv+O9zRTaBXg69ciXUAoWW7Wun5/Al26tM4VGDFSz2hY3144Awgm4U4Ce0IprW9lxj4egxaMRsgU4nTH81YsVbJbtCrb4WUnlI6bhU6zqxbyCSaES3BujSTKynTWf35KksfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kxv7zBoR; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kxv7zBoR"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38e3efab7e0so2406210a91.0
        for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 00:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784533272; x=1785138072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=scpaRJrlW34d2i0T3LPzlbqHWj1iPSwqpLVD8tv+N3k=;
        b=kxv7zBoR7+Ghvd6kBVkeLk98iml4R872qxdY+UpoHurMnNk7rtvenZ9YRFLXZj9QY5
         ZbKTQyKQu7F96wh+RrUmG2Lre3e07CzrABZ1APEsOe3KF0Q8k3havYeA+CzgV7hAqe5A
         9CewQKSoTkJ+DY1XQr5YT/yiEmz/psiCS2VBKKYTwkzi7/9U5oUcWJyaoCABjowepO/p
         VPryEJ3zfN9UOPiRjyH5hqeFultpB7tYvC9lNX/FqCj2t3wb683uKn7RI5Uuflf2bKhQ
         qCBZibxpM/9/lMSG9bFqMuoPUPYI9YnPRLNP9UwwZHmwEf847Ranxx1XAOAN42HK7PjF
         v41w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784533272; x=1785138072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=scpaRJrlW34d2i0T3LPzlbqHWj1iPSwqpLVD8tv+N3k=;
        b=Rke5ULbayrZlMOd3TX4UqYPsErNKJPnKFVmgHe3kGNgrNe9qNKTwyN839g9vH/N7bX
         TTdNOBVnqPa7sNlONtRv8UOdaD0arLzywSeGJUqn75ORUji27I6rZVgMpNOan+IEnGVf
         c/L0X4u6j35ogL8deirFnKDAwHoq8yIO/dbr7b9j9fm4c6b1hGJAH4vKHNX6Dup+O17O
         AQZ2SKyJgQyRLUbd34NDWyUAkNHNNga6fHh832MOJ4RAjGjhbZmyQcr1N+80h5NtazQ2
         F2LylRdfqSThd5661RhQEjvGtzmRR13qkrTMM9o0Bdsp/jukKIAjEJRXwNJeI76CrCNi
         kNgw==
X-Forwarded-Encrypted: i=1; AHgh+RoTRHLS+PEs66gMWBRJ8Q2XweLzjuKIa/yz/5Bfi1H0qYuFPCAHge+3g47Y3Bofskk/E+pjefw8LgpUcg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwF0xcYBpNNqJXwvZvBnANURcpXhdu9Wv/vbDExZhr9DJt7yKcB
	C9rlnMzoVtryqWAomItOVB2mxNqu+y1FScwOedkVlDGEJTRNeRu0H6ZB
X-Gm-Gg: AfdE7ckOVH+4kvByMjd/X6GVMneVki024aJPBjtMdtGE3pIneZtN5B9u9BBi2FcYkKk
	Xaj/xOKJezjIiUPH5Zo9GkuuzfbzmUHosbmQnzxLOB1eFQFyTzAbffaIiE18ZUvXLpq7rNj4uy/
	9chMVL2hy4ioF5UNamxXZlmJlfn1j7azwqNiW/yq4oJQM1TUQOc6hMF+X15oysb5rzLxxUMGZrX
	odns5daUGMTyaZsDYCsja4ojS2s3LV2jKohSSPGfVb/5YRhdw9STAtahfU6LLPZR+R7kTlwzdOa
	q5UlVSYW1FQjaKpYs+izBfgKvBFdAUrNnWnatJdEdbRQ+aBQbj0Ezk9vbNMKDVUhRrNSSDtq5+b
	vmYepk977rjDBMJN5sLZoRfmidY+EAntqhLKEQOPX0tnZqVkBFv7nNHxpG2PWXxqqlX6wbY/j96
	H6weiD0KGRedmt8WYDN/iAsZgfjq+n5iHGIDgo
X-Received: by 2002:a17:90b:1d48:b0:37f:9e21:91d6 with SMTP id 98e67ed59e1d1-38e4b610362mr11098900a91.13.1784533271902;
        Mon, 20 Jul 2026 00:41:11 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e60cc2ad5sm470171a91.4.2026.07.20.00.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 00:41:11 -0700 (PDT)
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
Subject: [PATCH 1/4] ASoC: stm: stm32_adfsdm: Drop redundant error message
Date: Mon, 20 Jul 2026 14:40:40 +0700
Message-ID: <20260720074044.87528-2-phucduc.bui@gmail.com>
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

devm_snd_soc_register_component() already logs the failure internally.
Drop the redundant error message and return the original error directly.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/stm/stm32_adfsdm.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/soc/stm/stm32_adfsdm.c b/sound/soc/stm/stm32_adfsdm.c
index 66efb9a0acb9..73c6460a6327 100644
--- a/sound/soc/stm/stm32_adfsdm.c
+++ b/sound/soc/stm/stm32_adfsdm.c
@@ -360,11 +360,8 @@ static int stm32_adfsdm_probe(struct platform_device *pdev)
 	ret = devm_snd_soc_register_component(&pdev->dev,
 					      &stm32_adfsdm_soc_platform,
 					      NULL, 0);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "%s: Failed to register PCM platform\n",
-			__func__);
+	if (ret < 0)
 		return ret;
-	}
 
 	pm_runtime_enable(&pdev->dev);
 
-- 
2.43.0

