Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698421E5714
	for <linux-sound@vger.kernel.org>; Wed, 11 Feb 2026 00:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770769394; cv=none; b=OUInlamNCKLDxQGnn2FmSWrhyj/QM753JcSPjIhHDvcEI6EDKAsnWQs5ri3PB2eVDD+FJ7OvaGX61cu30sDNLVP8Cd1d/lPY8bfpMt1VeA2TGazTmUl2abuKRdSwLSpODo2HhKbEQrt7NPKAoPAy+oKawHmX8Iqf0fRTI2wlECQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770769394; c=relaxed/simple;
	bh=sTOo1BPA3D0SCoSNVM9+zRHPfdEqi4Fn0mRmscBi/tc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GRRwozK5GJ6yRWDFroXcDUa7mG2v+0y8lqbVHb59k1R8IRGCkRUS3POu/4TrQ+x6FqBrqzc4Rg4SXtjDQt7w+Qw2XVqeeQbqjizIe+tAdIUkSn3m/z26VUI5cMd5At4DF1N60ivwUQjW9tQosa4Gz5vS9S2vQN7TJLUe/OXAY5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lFV4c0kA; arc=none smtp.client-ip=209.85.218.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lFV4c0kA"
Received: by mail-ej1-f68.google.com with SMTP id a640c23a62f3a-b883787268fso755331566b.3
        for <linux-sound@vger.kernel.org>; Tue, 10 Feb 2026 16:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770769391; x=1771374191; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ijERgOhpS82uvGukGaNH840CYikuzUcfKq4fqdNjwEw=;
        b=lFV4c0kALNcSUl7IyWfR5maFJA5Sl/uNKkkApA8HAMtv9MCi/TSjH/W31TCWD3O0Fe
         0ebF2tY4Ciu7prA29Vpcr7DGh857MShiLa2EOiJ1nGPHeCV0nAIagjKnKTVQm/eocOra
         EzKJDiA2Xu789ujrolZM4/GwqKn2n3daIqKnhGAJsC1tceGiYBof+tzxy7Ntovopwt1n
         LOT5dEZtBk3jATIH9KS7ANt28n6pWoEm9OQzDXaKTH9cc5u947AKKJEjo0yJp2iPGqS3
         mVLXstG/00s5CFX9471uff5Jhhvai1K23hAB55k/tDAnvHltihWsYqPIYbSv5H9cGboF
         SxFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770769391; x=1771374191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ijERgOhpS82uvGukGaNH840CYikuzUcfKq4fqdNjwEw=;
        b=HIa226OZSzwTS7vnvweduinzNb+fGWj6Z1J6u2OUGeZiiMAaIpx/e2y5AB7M4qVJQ9
         3aXvk7w8j0pqG24Mdizo9DlxZPno8MZCaNGSvqV5hVhB5LUZLQPaNnGH7wRh+Mr9LYT6
         Jg4PfsEA8zdGmA1fu0SA5oVRO1J2ASvdw5IP59Nyg6DvSTq6uKmrR1yxVXpAbmAx5XYb
         XoUctRLAlSwkqnH/8EvI5MaX54VeYNBOV9Ftcl19E7h6PNuEhFMFuk0GWlUcj99dE7BE
         wOboNUrWNa0APKFgXlWQUNHlpr98TOeW9jn2fAxAE5HmmaCYZYblG+PrHTKWJ3iolFFi
         e9WQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoCgG5WQJ8nVB4x6YF/0IrgcPS/RbL2pd0L5iXXcPu6/vaa9yZu8fCLf9U3oqLny8ZE7k+Oyl+jJSr3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXWbmPjK3pmqWHhnk88ce3zF4nioQltOk6CMksIWoEHwmarCkk
	Z0C/KM/hhon/xdOJYREO2ZpiFcU0kP3J+DALyE4H76DqalkIghg9ed4E
X-Gm-Gg: AZuq6aJxkiIk+tADhHVFk8p4LV8Sfu9rBKuEXCLcRexNziCN6T4Yb2LIgnSWtXJpG10
	OkRlaxdtYKzGBkYmqgiSGeZ+Ng3TrluDgemNTp+I6d/RA4dckEVPKTm7HOkdVH9zRO13xLtjUlm
	rzr8nj5vBNSs3WXMvKGwhOJAOyf11HPI+Ok0qOwOEgWEc9uX+TZG3EN3MJxYGYN+aRU4mcwbDVD
	ykTQ0WK6dMQkbe3fKGuiLZRmf+fR2/mmhiH/5OL7KmKz2gp3ptRHDI+0RlzraVD8GxjdtcAGNPb
	7ZwxAmSLgEYumkx1+DDQ+uvX6XL/5zPTcWWfRzptTeJUYIQUCOUIMuTlYTFPIaGi2vK9NELjN29
	lFu+m76uBeHKV+575xbrnmOOlx/YR/nrC3QGJ4cbHABXOa66MQpZg/DdDdnjdctaR1Gl6Anlhzx
	SAyG3uZqgsfmdMCg==
X-Received: by 2002:a17:907:3e2a:b0:b87:2bd6:6bc3 with SMTP id a640c23a62f3a-b8f6aec9b8bmr56432166b.61.1770769390533;
        Tue, 10 Feb 2026 16:23:10 -0800 (PST)
Received: from jekhomev ([46.251.53.180])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f6ec1db0bsm9992866b.46.2026.02.10.16.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 16:23:10 -0800 (PST)
From: Yauhen Kharuzhy <jekhor@gmail.com>
To: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	Yauhen Kharuzhy <jekhor@gmail.com>
Subject: [PATCH 1/7] ASoC: rt5677: Add 10EC5677 ACPI ID as supported
Date: Wed, 11 Feb 2026 02:18:33 +0200
Message-ID: <20260211002255.4090440-2-jekhor@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260211002255.4090440-1-jekhor@gmail.com>
References: <20260211002255.4090440-1-jekhor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add 10EC5677 ACPI ID to the match table. It is used in the Lenovo
Yoga Book YB1-X91 tablet at least.

Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
---
 sound/soc/codecs/rt5677.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index d46385249867..ccbd32cf8298 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -5204,6 +5204,7 @@ MODULE_DEVICE_TABLE(of, rt5677_of_match);
 static const struct acpi_device_id rt5677_acpi_match[] = {
 	{ "10EC5677", RT5677 },
 	{ "RT5677CE", RT5677 },
+	{ "10EC5677", RT5677 },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, rt5677_acpi_match);
-- 
2.51.0

