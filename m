Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D293EFFB5
	for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 10:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781086886; cv=none; b=RcdthsNA4Gn/uqXjd5NXAXXfuKBcsPG1tY8C2TzzBvZpkoq4XlWIRH2XhOmLOve+VmYGNf99FG9x0c8v1rv+lGW1bSmJsGHdhGQDGgJGFq9m+fKzRzRgMxmNuml5ROhyTWNP8/pYOB5bdqM6HiCSLUfYItTHj7W+OCnrznsr7Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781086886; c=relaxed/simple;
	bh=1D3oru0dFtWb5ZXGrKjETr+J2Jt5UjZXp2oe5HZM5mw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VX2t3HoJA2R7GMJWVCQsUyANjSktsbXUpXXClDxGUgamOBYt+GQAjPPfqVwOJi1tRXiIB/DxbMwp6Ie8AgoxkYRGf2DFy+2gFHgghkTe2tOcqK+H0j+ptn21N2v7gRGLcwub9TUu+75BZfbxrt2UaX/41nl6K9rVixMT8JzZCl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ahUfTj7Y; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ahUfTj7Y"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2c0b9328c4aso45733975ad.0
        for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 03:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781086883; x=1781691683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XujJTqPif96ZcsPOUAZQ6B5C/J5OqNB1kq3+Ep+LgvM=;
        b=ahUfTj7YUV1Oy99+/ojOY1I+hwgbBRJy5SLsXUXIrcK+TDefPbH+aJBWVjwTKH/ca4
         tYYVGgB6BIP9ieu7nkD/TVQSKgOdNGc7LRIwP3y+4HN5RZLPo3MbgO8kyCLfGuBctV84
         q+IWmw80ykct+wClcHfVKesX+HKopEYbgfRgIuZlz+ZWekKg90oxX826e+sug0LQcMMa
         9FQQduXxHQ8ZC7n6c/FVLTLZ9MNC7p2CipVC6MBtPf5jmARBvp+jBqfqiOX6HzrJxDei
         fC3rjVfmFYkFA+oqezMlOBzhhQZ+SWXCmbVKd8vo66x8+qQHWRzjVb/dpPj/w1P4dtal
         /VWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781086883; x=1781691683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XujJTqPif96ZcsPOUAZQ6B5C/J5OqNB1kq3+Ep+LgvM=;
        b=s+h27DP9RoxpKxup14tqXyLwGcyg3b6/Zqt8oxOzT5/DpCLYA9lsMb2cjkQYGVu/6p
         wDZm0K3MHYRyZcTmDTgyohV+v++rxR0QOj7zkElbqTPCoMr0lcMs6GESwOjaIZVWzLfx
         Rhj1zyFz8wC0BGS7uRVqOeo+eAgb0+bP2dWft4Gj6ph3aOwCT7+hYPPDUjLTfv5YfwJW
         7Iqhofy+J6Undi6z8xStLlbkpM1VYLa4tM6IiK1CXPv/31Nap9pS6RZh4GUe7Qxs9bZP
         510to+T3OHA4KLCpPS7x0yTRU8V6LRBKEduwfgs07DlfXzy5nYxtqjUyM5khYfSmsrMb
         8kYA==
X-Forwarded-Encrypted: i=1; AFNElJ8GFjhEZZT2Jrs4GYwhzveL1jqoMiR33sdjANESXK7qj1Na1j9Ffj+J1nsUBSupn5pzD/HVa8yUGEwpPg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyB3WLHVXXsHfr3cT4YAcOOuD/dgBJmHu7/OPK5VkBYSABRw+6p
	iNyeftj+3F4ji/da/wmifhaEzgjc8O1NFmJYEfNTjCHUI/M4cD2pI9Ef
X-Gm-Gg: Acq92OHs2/OD0YAg6zLubpZ33l6U946zgxRwDPzl8mmtn6rTC1xJB+ZfFtHvBFTrDQX
	FMicflmFIH7mb7p4nXDXlZ71oqCSimSsN7AMxEoZqHwiyK4WfaiWZw1tZUn9hAwX1dNR8PO4fR7
	fDUhV9fDJztkY7jly3P/QhgJTpuwvPvQFdPTvMGcYzYXxqTlJjUtDeeg9bT1pZ232tS+1M7RDYG
	SAFvv4BrL0+bzAr24SVQ0gtTFdJj2N/ikuPpWCi1wuFe6QEsIxwuvmx26ymKRPYvd4ahYQQm06T
	WGX8tytVsgpvy725ELEoiZQgZgx67gMEFtoXzTYDbURys5JdSD+Rd47m6AhD/lJkx8ZDMV0glL4
	qGw96ZjUYj7Hwcl1iHdncW+M1YIZStWg0lMhLCXw3qvolRKyHV2dc/+Lk9bwZ6X7Sfer2bbHVng
	MpYTHd9I3Qe8+Ts0AoWDftM2tZI98EtoZC8dm1X4YzR3fxG4NxWizdAN+I4wq+nn9kXXIm
X-Received: by 2002:a17:902:ef50:b0:2bf:23c3:34ba with SMTP id d9443c01a7336-2c2a1c99a9bmr82532235ad.28.1781086883340;
        Wed, 10 Jun 2026 03:21:23 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f96b3fsm250133875ad.29.2026.06.10.03.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 03:21:23 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 10/10] ASoC: mediatek: mt8195: mt8365-dai-i2s: Use guard() for spin locks
Date: Wed, 10 Jun 2026 17:20:21 +0700
Message-ID: <20260610102021.83273-11-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610102021.83273-1-phucduc.bui@gmail.com>
References: <20260610102021.83273-1-phucduc.bui@gmail.com>
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
 sound/soc/mediatek/mt8365/mt8365-dai-i2s.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c b/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c
index cb9beb172ed5..a058973662b3 100644
--- a/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c
+++ b/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c
@@ -463,7 +463,6 @@ static int mt8365_afe_set_2nd_i2s_asrc_enable(struct mtk_base_afe *afe,
 void mt8365_afe_set_i2s_out_enable(struct mtk_base_afe *afe, bool enable)
 {
 	int i;
-	unsigned long flags;
 	struct mt8365_afe_private *afe_priv = afe->platform_priv;
 	struct mtk_afe_i2s_priv *i2s_data = NULL;
 
@@ -475,7 +474,7 @@ void mt8365_afe_set_i2s_out_enable(struct mtk_base_afe *afe, bool enable)
 	if (!i2s_data)
 		return;
 
-	spin_lock_irqsave(&afe_priv->afe_ctrl_lock, flags);
+	guard(spinlock_irqsave)(&afe_priv->afe_ctrl_lock);
 
 	if (enable) {
 		i2s_data->i2s_out_on_ref_cnt++;
@@ -490,8 +489,6 @@ void mt8365_afe_set_i2s_out_enable(struct mtk_base_afe *afe, bool enable)
 		else if (i2s_data->i2s_out_on_ref_cnt < 0)
 			i2s_data->i2s_out_on_ref_cnt = 0;
 	}
-
-	spin_unlock_irqrestore(&afe_priv->afe_ctrl_lock, flags);
 }
 
 static void mt8365_dai_set_enable(struct mtk_base_afe *afe,
-- 
2.43.0

