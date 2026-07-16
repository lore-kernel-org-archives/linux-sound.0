Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F8F3FD155
	for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 10:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784198395; cv=none; b=tz8Tl5c9diNtgXtW9ubcVcYk9a2UJzt6zYPFc+93L56W20OpEzCgt0n2jc7vjt0Mzhy9Za+YKjVP/ZPrqwtVpiGqCrXEnneqtW8Dx+q8dHUfj4J09mvKoQ1UH6O5ojePvycsX1Dn2Eel+IzsbO2p/AOKHKORYobZhwjLcU57NcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784198395; c=relaxed/simple;
	bh=gUh7CaF4wGbT30PXRFwTqOc2i4ZkepGfjuYmMyd9c/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QIfZUbBZLTenkCMui7QH0pvF1yUU6o01uCy3Lced97mN1qOReSAHkPL7Tjyn/B9qng2gsApFYdQFD+Hc841MKrY3Q73wgPCr2ipOdyidygvEK0y/MbxomIxLRCaJyQXrfhrFNVKrgKPOxL6npjPFXJnY68+Qgx6yJcrNof1qmQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A81kHaDa; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A81kHaDa"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-ca88130e09aso4266045a12.3
        for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 03:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784198394; x=1784803194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kkf59nhXbzFYZJk8w0acxrA6dPOctZpgPDQFFqZdJic=;
        b=A81kHaDaoHy1DGugVFbvgrIEhx8NDgBAf1pHj5c6KyJ7XT6x3YmAanOFX1XLVxI7nW
         hfqBtPnyLb2ozO1Pc6s7zWwDgw7EZy6BP4/SGwZwxdTFAsLn16XuLB6mimXxd8ZEuHwE
         HNXr4CzFY4PztnhZhgpw6gKvpQIs02Ym83fvuB8t9ZE6nnPFyP7ZUn7lBzReEGjNxL1w
         cKHrr5dR9kkv5y++or93wl+MkXGFM5fYpqFskEOhXTfRpNq//XX7G1DX8oxn2MAvSQoO
         2HoHKIUk0yPHRtUt9KM5r6rcTtS+H2zLZ9vzqZfx2kzzVjhS+xaWMvgPJqXla56tdbQE
         qUBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784198394; x=1784803194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kkf59nhXbzFYZJk8w0acxrA6dPOctZpgPDQFFqZdJic=;
        b=q/LuCFXKsxajEvYSP8fkCggrVIjiuDVOOE3FS4vmoR+axkr+qcdhMFmyMRvxpTjIds
         t7iYAanMMTtPT+Ep8oIz09At/Enx/ixltJbBbmGvTHAsalIv66gEAt8r4JCNjTQ2Dpya
         85JYjZkDiZyTfhkSsxdlf7ylTwojXBFBUjNuEAbsBFu9GP+AHeVNa6JJ7tnzDwh8DqOc
         exMRGfEl/J3NksgqIy+Ck4OYaFpeUFDSdLHIKQxUJguFyPHrXV9KNmNKDSo5eTp8jpi5
         P+sircERJd6E1zDUb4qfHxtUJvKjTRSpd4A1Ujbxdhk+dKSv3KupaO0Jo8V9TDqfd4h2
         6FDA==
X-Forwarded-Encrypted: i=1; AHgh+RpYrZN+c5oOqfMz3P1nVy69F1drKLFxaHJr1tYi4sovqOvahl04/tVwifo0DqPuzgfNEArEhmqm+F5OJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQniPZ2sTv2GpdD0Bu8xVyiqFsbww7PZBx1Am6fDBpAR8N28DP
	kHyd12P7uom8eMqmcGiZxSSz6Nb34LI2TWzWeQ6BNPQqqQFr0e//lW6e
X-Gm-Gg: AfdE7cl2vdUkETvvCUelj5rtQuYXgd7xVaXQSJSNrk97OnqXduOwNbl2DzEoxD/LPnR
	2cksdrUTWX1Ab19zRvKYJIGR1XX8fR6gH62uAaKCKgN1RIqIwPAaSDn2lhersF9G3yfG7/otvrG
	sEEZ+vyZmzeNietLraxvyB79L06IPYtOSUxxjrAPOct8kTQxvKQYKc8EMOjkcA+NPUyib+XFafE
	+NncUU0U9JxJ8vCk5uCARz9+cd/5ds7McAkCnFDRUKLiDbd/K3ZAJB8DCyp5jJcCDEryjMfoPgb
	2k8bjXgfgvHm9r3xeVpV610aMhvmePvZ1tpRP+DfTNxYzVMgWyg9QZW/yZSXJlg1v1jwOIfpvFp
	AiJ7Tk0IT0AFsRE6lvYhaOXYfruVUZe/37mmVI8PpNNSK/zZXxfV5EJwdLTWZFhfojbLvkxO5mG
	UFHqJgiThxUfX1vigE8fwzcrKxBUmjN5vcmh2w
X-Received: by 2002:a05:6a00:a216:b0:848:7475:29bd with SMTP id d2e1a72fcca58-84a554fa13fmr9537852b3a.7.1784198393895;
        Thu, 16 Jul 2026 03:39:53 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f266724sm4757331b3a.15.2026.07.16.03.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 03:39:53 -0700 (PDT)
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
Subject: [PATCH v3 07/10] ASoC: ti: omap-hdmi: Use dev_err_probe() for error handling
Date: Thu, 16 Jul 2026 17:39:08 +0700
Message-ID: <20260716103911.77652-8-phucduc.bui@gmail.com>
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

Changes in v3:
 - Add the remaining missing parentheses to `snd_soc_register_card()` 
   (Cezary).

 sound/soc/ti/omap-hdmi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/ti/omap-hdmi.c b/sound/soc/ti/omap-hdmi.c
index e60f5b483fc5..1e3a9711e70c 100644
--- a/sound/soc/ti/omap-hdmi.c
+++ b/sound/soc/ti/omap-hdmi.c
@@ -375,10 +375,8 @@ static int omap_hdmi_audio_probe(struct platform_device *pdev)
 	card->dev = dev;
 
 	ret = devm_snd_soc_register_card(dev, card);
-	if (ret) {
-		dev_err(dev, "snd_soc_register_card failed (%d)\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "snd_soc_register_card() failed\n");
 
 	ad->card = card;
 	snd_soc_card_set_drvdata(card, ad);
-- 
2.43.0

