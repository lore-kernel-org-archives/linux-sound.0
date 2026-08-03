Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F41E352C54
	for <linux-sound@vger.kernel.org>; Mon,  3 Aug 2026 06:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785737783; cv=none; b=lxo7meZkdpiY6oWS/Sae+POHgjJn6n6Um6EVPQgwlAh3Pl+zywffYVPaGoye+2wpIpUlp6a3Ca5hzb7LeIVF87X+r8y3TtTjtVqcj1D4AnRX14m2hPuotm3X8oy8o18cbiSZeoCyg5XgauKB+JbSibW3yMpzZCpgru2eVRoI8ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785737783; c=relaxed/simple;
	bh=0MJrbIEJ75tt62IKggFLwU6RdLbfl6Ybay7Q5moOn1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gZ47bQMvEhLMRaUBM9yyitTvfbvwBuud1VG2oioeqOlpWSXFKulDazMMMrmmkNXax0oHimlCTYpE+pu0YGa6Ss3YcaHEvOTUS4xfLNWRD42h9qGwKBmawaw9pXZd1n7Bsnj5CnC0QTuQD94J9f0hIYlCHaSmh43kKfRrxxYEOLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CKYmuBhZ; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CKYmuBhZ"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so2782321a91.0
        for <linux-sound@vger.kernel.org>; Sun, 02 Aug 2026 23:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785737782; x=1786342582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wzT+ddXFtm+hbBbYEBZVkAXj5U4hIlNKyzNscwXTY8w=;
        b=CKYmuBhZ675lYbsSEQKoyEttRfwZgs4HzSGdcEwkWQDEFRwFlzkPCApJCxHA3uELyo
         fY8/XdIfjzkyroKO0GElnlbAOgkaWQ7FkLrdSD0w9NHlEBiZZI1XXKiWK8yCziDBq3lS
         lIfB4nQF8TaFkgGUp6O1GRtMNPvdNP7+BRsGfNCBqVHcUDdYHAyoZayo6SxZ5Tbar8dZ
         5ecMZDT18dvgqCxGuLfulH3E42muyVGBdrulm0klj0xFd/yvqcYIwo3PCB7yNl8GeGjc
         chbrWrKYvz9iEO1JRjZdrfD5FnLuHiaKrqXtc7apXXimizyLgnmnudAmwCmPqrvbl7n8
         Q08A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785737782; x=1786342582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wzT+ddXFtm+hbBbYEBZVkAXj5U4hIlNKyzNscwXTY8w=;
        b=FiCTCPLVKfIfH9fnRii2i1kUHuqsF1AHYw0s5SvzE+MVQ4UL9Kw2j5JnfCnRz8CVrd
         vuLjmeAx5adFZWf+THeii7+l67niq1PQZPt+JBiobYBbWPHCNNBn2GZYJ+J2BRw8TOFz
         2ICWs7toU2WNwjRZ5oOXmr55Eafxex+1VAhHWUrNfABR8CgKs//4UFAzEG06l3WlxwX/
         IxoSyyH1YOUNW6ebsz9W27iarhNyCXuamKq4U//ub3dvnpDmBUqwPxh/g7cOzqYTkZKL
         svv3kTbeOgfql+qvam10PGdpeIVl4irz0VnG/piKG5Q7YbhJUfQyFvi3NOxBflofaMVZ
         0IGA==
X-Forwarded-Encrypted: i=1; AHgh+RpESVXgUyrTgXHJJPBxSUxbPvrPXeG/GbI+UnF1tGFpAWCGZ/F7OeJ02liuWIvxr9bC6wVjG2zIiBizdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoDbCCxHzLOKSVQ+EHRV/lSrZKTS0m9Qod2k3wdtq9FzSQv5ed
	VKsY4UnCMycFWf1zttkyZqjDzfZsHwxMw7Oo/Tokc46Q53Ypjl/XmfQ3
X-Gm-Gg: AR+sD12Fpxv6TQ+n8g5N8ByrnDnsRtYMjOB1uWVN0+81dyEW2vUn6wuC+JrJQeKp10i
	fS4jWbn81YXjkt+PhgQZmXheicG8TE/paFL3IfyFYvqY9Kdj5LDuALS4Co+G6i9myWG+1K9nOgY
	RypOjDUpDGCRshlXo68e5z3INcMC4mlgdAfVlwF8diTzYBdXS20FkdajIPgNvhcIGUwlmxaQfI/
	F69Q0ZyazyVdpqXqYHIor4zwm2KH9EHKO1Apbpq5mV05My5KY0Un88nLgmoPz+lDfvEpKX1j2pZ
	watiwvYYLkvw+Z7ElU8zhIrx1YE4NwY9gGnRD4Dz/tF20JT+fgxhNWganxbCObbQJWHl5WDS8AT
	mmPo0x/vWnQLAo/wTco7lt3OLsHxCmng77guzooXBbj6Nl25h9oDl6b5mI9V/AeYLgRJshEwcYZ
	dld0s6Rlop67DfV/ITZwxNv+M4PF8tkcemffZaqulsv0zscBcu42Mk/+OLEJUHU92w0i2Ovnozf
	RpMHk8C5EXCyQwU2rgrIlCsBEAW4d8IdRdt8q5sRCYa6xOx41KpEpnc/psl6yJ1oaTWuNWB/PvA
	h8jSvcnjP+7r+3E=
X-Received: by 2002:a17:90b:4acb:b0:38e:8021:2ea9 with SMTP id 98e67ed59e1d1-38fbc4a1f5emr8190713a91.19.1785737781877;
        Sun, 02 Aug 2026 23:16:21 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb2f6539fsm3469002a91.5.2026.08.02.23.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 23:16:21 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Chen Wang <chen.wang@linux.dev>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	stavinsky@gmail.com,
	sophgo@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/2] ASoC: sophgo: Drop redundant error messages
Date: Mon,  3 Aug 2026 13:16:04 +0700
Message-ID: <20260803061605.35485-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The called functions already log failures where appropriate. Return the
original error directly and avoid duplicate error messages.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/sophgo/cv1800b-tdm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/sophgo/cv1800b-tdm.c b/sound/soc/sophgo/cv1800b-tdm.c
index 4cbac8c1160f..a97f775aeddc 100644
--- a/sound/soc/sophgo/cv1800b-tdm.c
+++ b/sound/soc/sophgo/cv1800b-tdm.c
@@ -677,10 +677,8 @@ static int cv1800b_i2s_probe(struct platform_device *pdev)
 		return ret;
 
 	ret = devm_snd_dmaengine_pcm_register(dev, &cv1800b_i2s_pcm_config, 0);
-	if (ret) {
-		dev_err(dev, "dmaengine_pcm_register failed: %d\n", ret);
+	if (ret)
 		return ret;
-	}
 
 	return 0;
 }
-- 
2.43.0

