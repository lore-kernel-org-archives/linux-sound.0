Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A9D392C27
	for <linux-sound@vger.kernel.org>; Fri, 28 Aug 2026 09:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787908586; cv=none; b=FHxI3XEoSm5uHT7HqnoK5PzUMS6SQJGX5zekIa5zBP7hCkBPItlOiq920dWWj0C1JlXsTXale219Nwfh1gC+n+Zrp0iVeJDxRvNcJIJCVfvX8ThhfAWI3WkScL/NT/azAKb2w/Kuft/Y/rBQzf7eSMe3sMBAwRjCOPKpGDAete8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787908586; c=relaxed/simple;
	bh=57WzuTndarJ7qPiYwu6aU9mNYVkBNYV5ZI02Raa7014=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VFLHwAqLh7Xm2W8LlRCFl7Xs7YoekhVksv7m3x95u8sP2maWSokz8PqmnMTEO0ySCxK2dWqolVxPHA4DaechXjppzirT2XcdBz4LJqLY6Wx9gZmQR1+XoeZJ8YgAL2+bKYdOOfcANptqMhrZoV4wRTj5+wfMWrKYffAJf5GI3/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GyKutsq6; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GyKutsq6"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8534d507f59so743870b3a.0
        for <linux-sound@vger.kernel.org>; Fri, 28 Aug 2026 02:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787908584; x=1788513384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dEPYMs3oUZAAKTHc6QxaYvJkApkADKiVPKec4AR+Oag=;
        b=GyKutsq6K7ql6JYNWmcgJvMT60lbTJwLAI90gqUC7ItW+vAGGbfDpNrWOdt7SMZ/1M
         3KDs4Gd40NAi0ccYE9wMpYXjCL35XAJa1b+nOpzKNeF7r8iswbQmTIBSUuqL/KyKEkoH
         NHqug4WpXDyVRIYUjZBmrpCLXee3HkhK3RivKj98XgrDZVwSlC/VXWvJ0mZxbfRXXzbg
         KuLCPTHCLaPzGTvRMURPIoYX/tdBm+Zn1Fakp3PQ2LcstcDWLa6/sMm7KyQVRoFcK7Ea
         6NOAA7lrNdh2hu3dl9b5tzpXHCB+BpWhmncrNnCFQC9O8MUfr6525CBA8/a/tS2qZIP7
         vi5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787908584; x=1788513384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dEPYMs3oUZAAKTHc6QxaYvJkApkADKiVPKec4AR+Oag=;
        b=L12+O+E4RZMhocL+XXxr4f0Wg9dOiYZf2rEyTi+GrLCw15bQTPnD1MMRTKwfbAmMWZ
         0QDk02thLXmaPHGyXQVK46AeWlVlr481AP+6+6QeUIWW86UKybTuof4S/QOBYkqpNVcJ
         DqF4DVnxmCMGSET/0MSRWTM3osqVQdVmIhp3kf4rAvppjvAgFvlRuTXQF4OB1st1+2T1
         cIT5KBnrVvXGExCd5kiuRrnnR3hjF2siPc/NXjH1bnnbZ8BKB8F4lr42XNuSi0LzeQww
         xvl1jbbvNUv2uxEkClcfM+maRfigkX7pKnSW/UQpqzgg39K0OmU2CTJA7TlcbYyIwT6y
         wUEg==
X-Forwarded-Encrypted: i=1; AHgh+Rq0qBpNSykOjut72TyeMTQPhsE69kXVhR4s4ZWi3Jba/9Y/lNS0AU6yH8FFiLsPe9W1NTJUCumIc9dLBg==@vger.kernel.org
X-Gm-Message-State: AFuF++nS95KV+QRFQkhos2U9kTiah0UV+CQ9u5+w64pqhG7p74OdNjf9
	nQEuVCQ9mOegBK3KXXBkZu04aW1vnw1sL1Z+Dj5cEMIMA4Sem3RXQfA3
X-Gm-Gg: AR+sD134xC6sTqJckylpgMmXnT+C/QLB7+hQD0vdBbhuCAC7twhDGcR5kwjSa1p+MLy
	20kmrl090dtYCr1J/HC71vjNDBV0Kljsb5HOTJn2AkbOXcvaaRV2G5K0G6qZOZ54zt8SHrLlK8B
	2kt7VJ09BGPTXvNkkeuC11L2sFIZNE8/GLzO32LN6b/2BrMhmFRkw2EMkVfQmz0sBsuG3bn8Seg
	F5QYXE9PH14uJqa00N1a2JfAzyixX2bFGzFKVkrOON03kskaFr4S592Bx8u7ALQnHMvkZI9sTqP
	CEmI0xNMtnwtuFFbCTTVax0uxPhmc8vrbeIS5mwOkkvH5M7amh4TM7tLE9vFuEAWBifbb4wGz0f
	x5PeurOf8jipgGU/TxTSF5VjOpYwZs1HJg/oOUeupRz0Ftyh+75mnuZjBch9nZ5q4tV2Bj85P2W
	ibXXNO7nMD3iaD1jYSmZzwwZS5S5LLim+0URRmvEWKokI1pUQ0yQwYo32dUf5OR+x6a5y7x1Nt5
	ysS2wnS5Qf4koVwGXVAzClGOWKRn+RTFA3Sx4PIA7W5Hjs9uETcn9dPg+9tdwG4FIENM3Cj73qa
	chhCFzA2fLwsnsg=
X-Received: by 2002:a05:6a00:f0a:b0:853:5152:a3e9 with SMTP id d2e1a72fcca58-85628c7766fmr12100030b3a.11.1787908584414;
        Fri, 28 Aug 2026 02:16:24 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8569fe78fc3sm381248b3a.24.2026.08.28.02.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 02:16:24 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 6/8] ASoC: mediatek: mt8186: Fix gpio rollback on adda dl/ul partial failure
Date: Fri, 28 Aug 2026 16:15:30 +0700
Message-ID: <20260828091532.600047-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828091532.600047-1-phucduc.bui@gmail.com>
References: <20260828091532.600047-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

If the second mt8186_afe_gpio_select() call in adda_dl()/adda_ul() fails,
the first one's state is left applied, leaving CLK/DAT in an inconsistent
state. Roll back the first select on failure.

Also fix a copy-pasted "CLK ON" debug message that should say "CLK OFF"
in the _dl disable path.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-gpio.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c b/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
index aced8e7e920c..1cff2a63ef37 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
@@ -143,6 +143,7 @@ static int mt8186_afe_gpio_adda_dl(struct device *dev, bool enable)
 		ret = mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_DAT_MOSI_ON);
 		if (ret) {
 			dev_dbg(dev, "%s(), MOSI DAT ON select fail!\n", __func__);
+			mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_CLK_MOSI_OFF);
 			return ret;
 		}
 	} else {
@@ -154,7 +155,8 @@ static int mt8186_afe_gpio_adda_dl(struct device *dev, bool enable)
 
 		ret = mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_CLK_MOSI_OFF);
 		if (ret) {
-			dev_dbg(dev, "%s(), MOSI CLK ON select fail!\n", __func__);
+			dev_dbg(dev, "%s(), MOSI CLK OFF select fail!\n", __func__);
+			mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_DAT_MOSI_ON);
 			return ret;
 		}
 	}
@@ -176,6 +178,7 @@ static int mt8186_afe_gpio_adda_ul(struct device *dev, bool enable)
 		ret = mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_DAT_MISO_ON);
 		if (ret) {
 			dev_dbg(dev, "%s(), MISO DAT ON select fail!\n", __func__);
+			mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_CLK_MISO_OFF);
 			return ret;
 		}
 	} else {
@@ -188,6 +191,7 @@ static int mt8186_afe_gpio_adda_ul(struct device *dev, bool enable)
 		ret = mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_CLK_MISO_OFF);
 		if (ret) {
 			dev_dbg(dev, "%s(), MISO CLK OFF select fail!\n", __func__);
+			mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_DAT_MISO_ON);
 			return ret;
 		}
 	}
-- 
2.43.0

