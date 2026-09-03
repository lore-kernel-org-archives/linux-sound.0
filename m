Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE86F38A72F
	for <linux-sound@vger.kernel.org>; Thu,  3 Sep 2026 05:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788412357; cv=none; b=fYoMH9UEInV/Y+0KPHhmOiFtEwvVnevMQ7gEhfcomL3rAAeUCgVzsqjG4EXWL7nU+ziHclh9qq6HUiE1gtzMPqdAj1RBNTK2xIUyYPieiA0K5ngP9r/Myp+fybfNtUyv2hZB+WE8hXSTAa7G+v9OOJ7Q9ZCWWwJ+6qtst82se1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788412357; c=relaxed/simple;
	bh=57WzuTndarJ7qPiYwu6aU9mNYVkBNYV5ZI02Raa7014=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cGvACQoYlOwSO4I3yQWN8FF92wvnN5xjZFkaCnRTe/Icw2A4WxJgUcR+wph9/BucUzk+Z+cw0H7NakWHa/G6IYQ+cSHJgV0WM7AJwQLZZRk5MavG5rdBdcBZfrTOeljs9pckBwr64YOQ7T9N4Of1OyMzwfLjp1d3aELb/3CNroA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fjkbw8WG; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fjkbw8WG"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc2276e6daeso1541658a12.0
        for <linux-sound@vger.kernel.org>; Wed, 02 Sep 2026 22:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788412355; x=1789017155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dEPYMs3oUZAAKTHc6QxaYvJkApkADKiVPKec4AR+Oag=;
        b=Fjkbw8WGsNJ5twUSwmsaP8oJ1iZ3S20DFcaBFTd+eDYNAQ3BpG2jQaKxKS4DmxUd82
         fuHQ1dwHnaaiyVhC5Z0VqTI5g6KQyCoJbH5oFd6l/ZD6GSE3YSZirBh3f54uu4o20/CK
         3QnA8PSCbx0LMoO8TLx2WYzs+IZzCv8eMsnXssId+Xrg5hTD3BX5Jc2tBl2daYilDdo+
         nUW/NtWzzbbUG/HjRF6GTJvU6Z7wNXN3iZ/dvJC6Tx9S+WJnU0jw8KMWB1/iuEbCuLn1
         l2NaxhXc/LjzrDJCmS8eqWZ1YUu/3Lzouzqi9gX9Cn3xgHvG9sX1gSBZA4Y9RwLsqcHX
         PPhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788412355; x=1789017155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dEPYMs3oUZAAKTHc6QxaYvJkApkADKiVPKec4AR+Oag=;
        b=eOoCV5GaMOi3Q7ankWlfU0lMAjyYLKIPBTg9Iu+zhLRxIIkoejmjzr+a6+9S+vAFX1
         kc0deFRN03q6OCsNDr7B6ni9L75Ll44D+EljnIojB5/7w4mirH7FNVljX8dILzOdrKMF
         6kBHzv9dVmw5+1ts7klmERoZwjLw/S7tMGZbQXmW/HM0lrwi3X5frQ/IVHl+elOVBbPk
         d2nuiUYhZwXz+k7QM3FFEIS2ddDLKH/Kmx49Ox0QzQx7UQuNVaM55grPW/E1Qeiu0CW9
         +zjS9JkXY0l9jLDY5pM3I50y51aIyYqhS0fmdf2sN8Zf+4zMotKy/svrOi4dbk+F94rx
         oV9A==
X-Forwarded-Encrypted: i=1; AKwUvBx05m/1TOfTpe2+3EzUb19TV/McFMnzQGZryd9rf5/dCs//WDY5KTgOJofM5Xs0deATwz/hPWqqapFwHg==@vger.kernel.org
X-Gm-Message-State: AFuF++mKh7/0DoJowm7uTYfcFFN8SXoLObrluwXSdHKJTKfQ3iX7V8ir
	3zvg3OaYdCyw3XvnxVXx1xs8/APyMn5VE8AXjocEOX1w6qnz0WYTfKsA
X-Gm-Gg: AYBFou26VUCBET2sW5Szv/Px/S1kQjI49pJvlCEGBM6PNm/6nISyDN1vcOF/1s+Bn8+
	NH0B/nvLgQttjRLxuI9AY43EGvR6t2iNaBCUTIdUoaHYUsIpFV9Ci/x9hwPTZ35l6GMXJzCPDJ0
	OT3y2GX0nMIOp5AjaRr5zBo1HdIV3Kt8b0OnghCmXOr+0sDLvHC6u/nkjASt17i/gKcw1WUGauS
	/E8SopD2kEEJEccyv4huywIgc1xxD9ePB3Cf+fDnjx1pe8fihC/2/NLQLZ9zyKQ4ILdi1l/NHdQ
	MZSwKOnbI0uJuaAsRE4VeVoVTvsipD8FEPpAtz4Ongn4mLvGudcrJVx3l/WBzEdrFTsK2f6Lcyx
	lMnMGW7j4GAwG7KIyHCZTEH+GWjNMdMR9rsT/Wka+zXTtQc/phcf1Zhznl60UIyWTu7gmkZedls
	v2emy8sn04n7YMiB5VmZFffHv936MrZyP42xnMrftTUx2b9+JmSRKGpg2bib1eaSAEblgI/EltF
	/Db00R5kKbOZekdHA9zyLI7QH23YyrEMUCZ0I/4hqpDg2/r3wD9PJiNTYSCf4ugujUGfcW/pIKx
	maUM
X-Received: by 2002:a17:90b:4c05:b0:398:d93a:b343 with SMTP id 98e67ed59e1d1-39aedebf901mr14551384a91.3.1788412355201;
        Wed, 02 Sep 2026 22:12:35 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b0875ce14sm3218092a91.13.2026.09.02.22.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 22:12:34 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 6/8] ASoC: mediatek: mt8186: Fix gpio rollback on adda dl/ul partial failure
Date: Thu,  3 Sep 2026 12:11:48 +0700
Message-ID: <20260903051150.178057-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903051150.178057-1-phucduc.bui@gmail.com>
References: <20260903051150.178057-1-phucduc.bui@gmail.com>
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

