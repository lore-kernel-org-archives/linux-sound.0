Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9F13D9DA9
	for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 10:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784544188; cv=none; b=Jv5MzzUemCQ7mIbhmRJ8hllTt+h5Z4flpmZbDwlAnkXnAOwOhY8kn910xBLQCXHgccdO+wwIPrLGU12B8NFkcjFHGojwbdgZ/lhHmWZgu4AuyKavFwiZb4zyFRpsyfSfcDioIzfwcIHdQ+PnEO49exfDRg40pquuik0D1Le8vbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784544188; c=relaxed/simple;
	bh=q9TywrSfOvDxQhCpYgON3acXzWKDA5d1VFIKRMAsVO8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CwQjZHyXemQKJpNScllxzaTNHp4O5DwuJR4OdstCWKlw95U4TR/QfrFADrQjG9yATvBzWYsjRIeKM0Z44S9wPEJ+qA0K17dEUpJTZmncinq93Qu6juWhmyJn64f3UNSupn1g88Ln84550dCtvR1cJYg+ckyR1I1roRS54DbLMYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ab0sl3eA; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ab0sl3eA"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-ca913a601fbso6715833a12.3
        for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 03:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784544183; x=1785148983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tz5mpOBL94RaDjJZ5VQIfWGLSNj5Yiy/M8U+BOtLdTc=;
        b=Ab0sl3eADj7WrT3DGcG+Xn2bs/mtWQRmQZUGyEPZNnqTNdDhQnrxJS3JDcULDBZvKY
         UvC2RqwEan3l1u3CGW2iDFElhMgtH84/iMArsB/KR5PxkyNxgDUgo5XHUFEMDpBBdjQH
         pZaiMh657FOpzJ89b+jhz1FCyFKCdYIdsEg4p0Vo/BjCicIJg1xQWI8NXtCo67gieVrt
         5vQ+yVaG9HgQ4yci86PDZ8zWsZMuEW+1170uFqyh/N3oKtuJMDMYFF8TrwFhqgD9ySFG
         ngmb7PGgjQmvd2K8dWVfBb4sFAv+fhtw+/BuKfhWmbJ/uYqmOsf7O++D0OssIzH6PAHc
         2TMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784544183; x=1785148983;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tz5mpOBL94RaDjJZ5VQIfWGLSNj5Yiy/M8U+BOtLdTc=;
        b=SV5EOzLD2UIL8SlpbY5T8R8B5cqrS/Wmm9o39fJGGD5Mb4PPDhw0xVehocYPX6rv7h
         i5+Xu4tKeY8k2bhiXychnkrRdLv4h/u9bmiQ+4dI1sN50jr65VE54gBcZiYk7/YWZg2U
         K+pR9vPSaS00r/HfbnsyE6crLFKv1sAuoW+5MTzhBmbBymu3EUsX1x/x8m+zqrjK1Muc
         oKOdBauR7fxOea+7tq3BJJNGM5WaVsa23w22sjBldAkl7/H30jk/tA/5hmnH9OcXVTOT
         BdO/WVPqdiGlBKcY9qvhH8ZWXkHfKIvRnF49pAq2g9f5rkk0a5PDgLzYrXzjIWOaTaRb
         yGzQ==
X-Forwarded-Encrypted: i=1; AHgh+RodX4fQYoGq6x3FO1Uqmqz6zY9i6jknm41nxRH74Kfenl4p5RvBkWojhUrRVX3w7M4qDCgNmbwc7QwNJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwtewAAzIuTbqn1tVkhCWPJeSJegkNdzDcswztkKNtSEkmHQtJ2
	qQGnCAp4qcohquKO6ckk1jOiQn09TptItL3778neFB8ugs17kkS6JF4M
X-Gm-Gg: AfdE7clFA1+d3JUk4tIWbARYWQUbTG3DGqZhnVfFrxI6d+GIEkna8pBFLv9eVUucTP9
	5ETFSNvcdOWNeY9Qle389Dlq87ATACaSDed0zuaaqq9Zk1YCvoZm2BnW8M2bTHtI4OGZ3e4TCvc
	khhaL5HDKQrwx1VkscUZlY0l4gkJcLd/KEwRbPyj8oOehl+Z9Q3jtuUmRrPptnemtXR3KmevDWl
	egYNdhyjPJdrYsw77O/ek9TqoERpRzKO8WYi39ZyFukonJYWqsswI7XBD1i3surVeLqgb8r1RjI
	nr5DdImHbXEvUNo2q5LVkGrIv1cL0OESmqTxqSqkc+XM7IeRSnP+++yzf72orlqh4w11AxCxL6Q
	ncBD89NaYAwBysBWfmmngQcsLBzhHkdFKX1L/gtNhIEnGW8OWo4m+Indor/PDte7wf5y4qOosJd
	YcU5g/h9tL8RkhvfW5wq5zbyhkbmqdlUdjD8nFA6hMbGuT5xHZUgL4/zGwJIqvoGW1l/TcEgorq
	g==
X-Received: by 2002:a05:6a20:9145:b0:3b4:b340:411d with SMTP id adf61e73a8af0-3c3ad64da60mr14537972637.24.1784544182664;
        Mon, 20 Jul 2026 03:43:02 -0700 (PDT)
Received: from steellegend.taila75641.ts.net ([2405:201:304b:4973:59cd:5c84:346b:aa8e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429fe1014sm35266781eec.7.2026.07.20.03.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 03:43:02 -0700 (PDT)
From: Uday Khare <udaykhare77@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Uday Khare <udaykhare77@gmail.com>
Subject: [PATCH] ASoC: max98090: fix missing IS_ERR() before PTR_ERR() on mclk lookup
Date: Mon, 20 Jul 2026 16:12:54 +0530
Message-ID: <20260720104254.14948-1-udaykhare77@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In max98090_probe(), the -EPROBE_DEFER check after devm_clk_get() is
broken due to a missing IS_ERR() guard.

The code intends to return -EPROBE_DEFER only when the clock lookup
fails with that specific error.  However, without IS_ERR() the check:

    if (PTR_ERR(max98090->mclk) == -EPROBE_DEFER)

is called unconditionally, including when devm_clk_get() succeeds and
returns a valid pointer.  Calling PTR_ERR() on a valid pointer
reinterprets its address as a signed long; the result is arbitrary
and is almost never equal to -EPROBE_DEFER, so the check silently
does nothing in the success case.  When devm_clk_get() fails with
any error other than -EPROBE_DEFER the check is also skipped, leaving
max98090->mclk holding an error pointer with no indication to the caller.

This means a deferred probe will never actually be triggered for this
device, and any non-EPROBE_DEFER clock error is silently swallowed with
the error pointer left in the mclk field.

Fix this by adding the missing IS_ERR() guard around the PTR_ERR() call,
matching the pattern already used in the sibling max98088 and wm8960
drivers.

Fixes: b10ab7b838bd ("ASoC: max98090: Add master clock handling")
Signed-off-by: Uday Khare <udaykhare77@gmail.com>
---
 sound/soc/codecs/max98090.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index 8c9d09c21e64..720ea85e0bf5 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -2423,8 +2423,9 @@ static int max98090_probe(struct snd_soc_component *component)
 	dev_dbg(component->dev, "max98090_probe\n");
 
 	max98090->mclk = devm_clk_get(component->dev, "mclk");
-	if (PTR_ERR(max98090->mclk) == -EPROBE_DEFER)
-		return -EPROBE_DEFER;
+	if (IS_ERR(max98090->mclk))
+		if (PTR_ERR(max98090->mclk) == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
 
 	max98090->component = component;
 
-- 
2.55.0
