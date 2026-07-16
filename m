Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1143FA5FD
	for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 10:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784198378; cv=none; b=uJE5Ap9Aw2N+lTN92p3/xQJsNI54+52qxPXGpR5wGH0YCOZ7Tj7CyK+ZTOmI0Y+FkfMWn3qiwcuG1/oDCY9zSohXEZSKaRkmqD/jazrblWBnInxQvYipq9BtNjbnvnkG42NM/gKQo+LoQkaddULFnvDf+F3JRzQBUmB+HivjoYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784198378; c=relaxed/simple;
	bh=bly5g/vrF4ctQv0fYWIQy5hsDFKEKRsbvFXr7VSnXeA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vm/fLdhDVzwy+UsV/41D5lpHJXLTeFEkl0C8EohQUAjWNhlT9Si7igUm9/YSHekl8YTtm7DOsz0KV7S8vTT4u4Hkl9+OIX18Qb9SOFcs1URSM2rfTzxZMUadKKoi1dKBBacaee9c55A/SMUoEkUZTWZxoD89GdJG0DG6irkSN5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZvacTViq; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZvacTViq"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-848761b5897so3387837b3a.3
        for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 03:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784198376; x=1784803176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yEt6Uvr9Ac4AHA1sp4pMgGGdcdpdh8Mxz+CChY0s25Q=;
        b=ZvacTViqIdpWo3wkTyzvzAbYaL0F0Q/wJvRx2V/eJwDhcnrv62pYLsVduZWcmNWv5d
         /2fmvWp2ZY5kvpXOCLXdxaJ8DekV8W1zBEux55WMiSrZqpNG1ZLHvRAsSz4OhdLRicUX
         k2LXUHbBYC4NS6f9aZ/d4VV/cCUtykXtz+5nqYCoGva6axl2XT3PMho4Jn3tAB7ybRN2
         ns3TIBOcP2oUA++NnYY6OGZyp3nT4IZTOw2VdB9mxlLqedggs42QXxR141HSQQXJfTFs
         z6VcIzdPi/RvSJ6M3GnJs2r/7Bz4snfXGtlYIyHUptqGtJGoV5rfDHqidhtDh6gOOBCy
         LUIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784198376; x=1784803176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yEt6Uvr9Ac4AHA1sp4pMgGGdcdpdh8Mxz+CChY0s25Q=;
        b=gRCArKRvNzPYho56QPJSXbO7dU7Ey3wj5m96bbHc97wW6L6vaumDUxQnSOAJzD021h
         rW1jg5rgRiNl0S/t87d4Bt5x+Sj0er1HP4qLZg0PebS2E/b1dV2YxWjssw39DhDCntDs
         TRILuN6jmaeMFD3/GA/KPvh0I26eBqm60jiIcq67qJbdphHeqreiJRTtyuvAOPTsxpjU
         uoKyjW18W1Up+nZXZoyYhlmgO2F59c9PoIqq1oyS8BxkaRwEC+muMBKsU6NBuvJllKRN
         mAEYgQ3COYD7PQAiIXS5tz9hkhGRgW/2+9HqHi3H1AAs3Q0f/kR+4Fi0KbC5+USAz7WO
         zHGg==
X-Forwarded-Encrypted: i=1; AHgh+RoCjxoqIDPZizgyeQB6Cwvr19Hm2bTpg2BsLXWcrrJVqUAHrQ2YkmFEAdXzC7N6U0aQ/2/vXfEsDmB6TQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6GMT4HcP9++o7fiBePZSRZJLxyv73QXQxF9tD3Asd2sPb+nsF
	ElTbguadEjHKqSIZSemnLc7i4sT9l7Rx87I0gmzSmHjA9sl1k7rgjvRK
X-Gm-Gg: AfdE7ck9If1gG9pC4uJ+84gmbGuUodophh19Mhxq1Yxj+hpwnH4UxGIXCkmROqwOYmK
	PTxeUdFQCCLEqz6RrUd/1HMZIfxj5kAWIgk9bp4HMr+KoOgKoldzzuzF+fRK8U1ms2D0ZOauAJM
	jqnMsqeZ8ipcaLIwcGzEqO7SlqhGbEhyuI5pHYVrnBgoqvqkEfwaSdsiFX4fc0gAfNGYntsgCPY
	YnvLYvJg67C6Cua3TXWvPRevlpM9ylmpGajsUaA6QioRucHaLDoYsz6fVFXQUPWqe9ukzkOeidJ
	QYKTU9zYrGUKeKFvW3O2vVJewnOfVWI6ODrmFD+KIm9oOeKRLwaFBFwSvxwjC+ffiLRbgBf8mbL
	NfsGa+JcHDAVrMFBotiJbqGu+T27cVL866hn0OQlS9o6JyDh2i7LmNSRmnIxCmk2hka4a/fQH+H
	fn1ZbCD3OR4hZhvNW5aBsVs9gzk4UVO34gI3Ts
X-Received: by 2002:a05:6a00:a883:b0:848:54ff:a2bb with SMTP id d2e1a72fcca58-84a55850472mr9104210b3a.61.1784198376026;
        Thu, 16 Jul 2026 03:39:36 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f266724sm4757331b3a.15.2026.07.16.03.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 03:39:35 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Sen Wang <sen@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 02/10] ASoC: ti: davinci-evm: Use dev_err_probe() for error handling
Date: Thu, 16 Jul 2026 17:39:03 +0700
Message-ID: <20260716103911.77652-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260716103911.77652-1-phucduc.bui@gmail.com>
References: <20260716103911.77652-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Replace dev_err() with dev_err_probe() when reporting
devm_snd_soc_register_card() failures. This suppresses
unnecessary log messages for deferred probe errors.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Add missing parentheses to `snd_soc_register_card()` (Christophe).
 - Remove an extra blank line (Christophe).

 sound/soc/ti/davinci-evm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/ti/davinci-evm.c b/sound/soc/ti/davinci-evm.c
index ad514c2e5a25..3156d87a3a12 100644
--- a/sound/soc/ti/davinci-evm.c
+++ b/sound/soc/ti/davinci-evm.c
@@ -245,9 +245,8 @@ static int davinci_evm_probe(struct platform_device *pdev)
 
 	snd_soc_card_set_drvdata(&evm_soc_card, drvdata);
 	ret = devm_snd_soc_register_card(&pdev->dev, &evm_soc_card);
-
 	if (ret) {
-		dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n", ret);
+		dev_err_probe(&pdev->dev, ret, "snd_soc_register_card() failed\n");
 		goto err_put;
 	}
 
-- 
2.43.0

