Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFEF03F7875
	for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 09:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784192956; cv=none; b=dCI9PUFwGYWDe+Ypa59hSNjEY5PzIP0Ld7eG62M524U4mOqwcLbJfxE7m+MTx5a6dJ7ksUir4lZ8PvtXaYlNcSdzLx6OVGLPYjM4xxcMY1TE/MdwSCF8+QYRKI4xibGY4ikMpfNaGXLlGDDPKnWJ6W1voaQ/v84512HFXvNQYeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784192956; c=relaxed/simple;
	bh=XWDzYN/QmDeP+BMWU96Wibo8K6xDaS1cOUFjBPJXQQU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MzgbbOg/lcPwCEBDMXPCNc1MXaN31+nFZEOeoGDeXvwrLQHIz+d7r0LUDed1LQQNImpcxTTH4zagYOw9L59QeKbVgwYYw0yGh3LwHSIpNH/n7BA96MMSG1q29TOExW7r/dBAOIqVuLlZU2uf7V3m95FoUJ4O5bg8mMt51rJEdpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dzacJy+K; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dzacJy+K"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8485b358552so7092679b3a.2
        for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 02:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784192952; x=1784797752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=06ntY9whyt2Zuo8Uv5yBesP3vRYcbp6uEAMZexttM1Q=;
        b=dzacJy+KZKitdMVk3tWUe5PsGtZCnxSbYMrAUEwQN/gxwb9fpNW1XC9QSJ0wyzNXdZ
         Yo4AzFYBTYsseZLtrwbA7lrrpF7ihSox6oGYtsWPF+KUtZBxvN8q6c33PEOwNmYU2EK/
         C4ePNYDIAv0XfpjSkAImVmGrMQkznqw0nE28j/LVBck+Bkm2T7XKXHNQMdmfnITfkFRc
         WcrpXLgVV+eR0Q/54zg6MXuGmQFamfwaQD6J8f3zX9DACAJGUsq3ArSx3mcV4GXkC2go
         5tbQXWZFDdlWbYCjQOVqToHwB2q3TxhcAWI5vou9QgTvZxBtSdRTLIMrQOL6puLtBANU
         U2UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784192952; x=1784797752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=06ntY9whyt2Zuo8Uv5yBesP3vRYcbp6uEAMZexttM1Q=;
        b=MIru1q9gBnAx1CKj6Rb+mAj17Thh2wfWA9n623ipQxFjHr3K6FRi44XPhvxkDG7cU5
         CgXdHwJs4wjgRT0c2VMR6QciXLsnYfq2vRy9yOnwn+bPgShMT7TMrAsWtMygfO2s7DP6
         rImWY+wjpiUN32oGyzCq98WYOzS28Ik1L46R2UyafDxLVvbfehO5CfCJukG7cK73erdX
         MTi6SmRJDSKD4E8U1NjSmO7Gau0nJE4RA29if9a32NUkbM78VLO24osssYxeloiLVIp+
         A/3hRSPkwZaSgXZvTk/UsbxrbTOI+NaaJyoU7MsbgwHZkp3KbTIdxE1dZ/5ob3YanM63
         Xvxw==
X-Forwarded-Encrypted: i=1; AHgh+Rr79DZHbGcuQHPqeqHynpmceHmDnJL7Ixr4cHCsyomI9kpPugIHMOyB/kQHSnWQ6dXvy5aeXwdCLCRgAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXPuflTSB0oNe2TQpxWGag36xRNETghp4VLKMpeRs3TSzc5D7L
	8i+Dn20m6K28adOU4UD9y/wQOd8a5ySo4iDKnr0pOZa9e9sfWiO2Rejd
X-Gm-Gg: AfdE7cmGgh3XJYcQoU6B9x6j9KomEefJsmizDKlomngW8gsBHo13X1CD57K22cLr8w1
	Kw/ETrh2aPInbx69Z47b0xF2X3o5oAZnrWPKb42uhvGU6bL9P5fL8hUky4HXZY+joaVXG2BjiOE
	mhw6ooN/BY86anJ+Gm+JFc6XoVI3Y8ohj7i53ULjU3S+WCJb77T2FL01HGP3fevJTIFv30Ctnmh
	xjOLAy5XIF17WRoAZDKMu7rE51wqAhfNKMnzM0XBh8SaiHhQLrCnD3QBkuGQWjgqvTyjPDelOtj
	ySv1mNmJ/Ak/fflPf9+b1WuX+9bP2iHxXgokr31Lr2Q8IPJ6ydaK/eaRMUVj9SxgQizOqk9BybX
	mEWh2ZlMwZPKA7YTQEuITnMRobLYDktxpMmudMddS0Yu+zpuCqj12ugo8n1grheIhNm2gcrxa0E
	TZHqq39MVZiLZGcxM++kzSN8AWE/faTGOe9nR6CtJFOJgYffY=
X-Received: by 2002:a05:6a00:f92:b0:845:4cb5:2343 with SMTP id d2e1a72fcca58-84a557abe36mr10198232b3a.19.1784192951929;
        Thu, 16 Jul 2026 02:09:11 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f6bf5ecsm4511800b3a.29.2026.07.16.02.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 02:09:11 -0700 (PDT)
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
Subject: [PATCH v2 07/10] ASoC: ti: omap-hdmi: Use dev_err_probe() for error handling
Date: Thu, 16 Jul 2026 16:08:26 +0700
Message-ID: <20260716090829.72082-8-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260716090829.72082-1-phucduc.bui@gmail.com>
References: <20260716090829.72082-1-phucduc.bui@gmail.com>
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
 sound/soc/ti/omap-hdmi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/ti/omap-hdmi.c b/sound/soc/ti/omap-hdmi.c
index e60f5b483fc5..72114965c37d 100644
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
+		return dev_err_probe(dev, ret, "snd_soc_register_card failed\n");
 
 	ad->card = card;
 	snd_soc_card_set_drvdata(card, ad);
-- 
2.43.0

