Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C189B405C48
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 10:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785492977; cv=none; b=Ktzh2IIZVDprNESG3/vpzLBaW0DabND3INjF+/2Xt9HjBIdSA9bu6XBMYPBW4K/2alAkFdwmdtgWOWV0ZVAZLKxj9RCIJNNY0UQmyRK464DjpPUIU3aI287eRTrF7rjbHlGwpTt3LI8to1coMm/tRoW2q1qlbe9LCKFizomoFYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785492977; c=relaxed/simple;
	bh=Oq0qHCMJTDXMvBr5bsOFLCduogKj3CN2uMulTxtRHKo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nvwa63UA0Qm36lvED5nUQ7LudgT4q9qGcH7ZvAq6YaLUqzVZLMDi+0LaVeryJCb6DRU7YAj2piNRD4xQCDGK8pbeAmyYfRb/DkFLFdSjXfpwrdYIB+MqRhRmZR4Hxj4yW9wa3IonLxq+KXIDnIcGgJn0k9T1c3h0e3HMTBfYAnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hn7bgeRB; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hn7bgeRB"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38e041ea211so933264a91.0
        for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 03:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785492964; x=1786097764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xhY5pmRQ6A67JZa+NLW72z8V+CYSZWnDWCHhcpLOg6g=;
        b=hn7bgeRByf3biumjG+40AslHqita4pCjntpNMex2BszqCtKh+d6CzGJFlCKF2xmitW
         5dbK6NtDlniYPTPcNt70TDhCkshWnBaJkDKTBHZ/3x92Jmzlq838bgSAk0jxLsOTR2I5
         3xNc8QjszBs7FpbsV/SC9a7CKxoFLUDTAlvQsd7EvExSkkuTxwFSJcxpVajIqoEEXEE5
         kXxyjvqvxhUA4RGbLVMVYBb7qf1GxWKAvalORV4bFda2HGmJnIO2Jh6KZ7R5i5ECgQAf
         Q5X1VfuYiY03jCKPWO8QJkePn29yckxiYoKMUSPAL+VKWaR2AER5wgiVDHx5mM8e53Y+
         r89w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785492964; x=1786097764;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xhY5pmRQ6A67JZa+NLW72z8V+CYSZWnDWCHhcpLOg6g=;
        b=jIbgQIz/HuCRO7LmDC7BrasAyKj1C2i+Sp/LQMXXlcXAxaY5mFddYp+aFN2n+WTvpq
         pcZIdVxAt+K2/B9wLchesNsdu1E59fx0G3P+V5B9JqdRxL4gXhaO7KSwAUhA43x7W79I
         ecgMQFVdvWzwdTPDOeyK6n+5qpQ5uLfSFD9un0JH/hMhSP/ByXi2Ma+VXHdrj5IXjBen
         flzPxcxNIEEFqYLnyDDhY7RjSRp50rtdO3N94X51Yf8afzlxRivIB9IYkGMD/H5ifHtD
         2Gk/TMNM5CfBcq9L5DPXFbsGzLbQt1WGjisQ46DbtZ3r0faufTn8955a5XDkkV99rG/l
         VoyQ==
X-Forwarded-Encrypted: i=1; AHgh+RpVNgeBpbei6clFTjPba692QRboKiRkv6RWdvc7qi3C3wDJb/J5JZdyRhgTJfE0mHPvKygNB4/nxqytoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNyMrJOxgcAwAxwZbSObJbObbPvre7adEYW87vAQYxIaSNxoWv
	VPx2ZKBkMUOWaOL0dPqpqCaPC8CZnAkfR1zHdOU0BAfywQqSt66NkDMb
X-Gm-Gg: AR+sD12VrIa/8WEU+Az09GJevgABWL+nkciJHzR0Q9K2X8L3T+KdHqWzEktuXt2iVNx
	L/TjDW9OikWylkjoakMcF9ecyP63O942zRD2V+HMdFl+DVcgn0hbL9S7LmBj1MhWDZCZZCZBc1p
	8SWV6r1NFAql+F8dliKJFaVfgHj6rxaFy0N68WmN4Fq0AdXBdA44j/+pYOmW0vLYRpgJVloax1J
	KUPXWdaCLlY1sCWNjDxvCOHUJkvpsIGpBk0dLkPG81GiuPxaPi3f1MgDhsnVAECii5lWIulRaKw
	mNJr4vCNFVWcYxcaLesVOl9dSK/e9GMco6dI9W49U3XKrzBIpZcjSbV0+vkJ7X2VH/ubKBSQn6q
	pbZaVi0ix0Cw0bBGQruuVMlKLcJd7vsx+4W8dScb2soB48UNLpOV61Hq+rMaIG1fFCYCmdI9lF2
	/ENA+PJ4nRoEWE8OB7V3+y8+c6zfsjZZzEjeVjsq5Wma/b1lCRazokYSxizGY2A19FSclMrlVIS
	fi7jBVeJTCpzeonbPx68IEtCvQFISVi1lxEWgBbi//VK1SjQB40QK4lNb3QmsKy9mN5/ig3AOot
	Q4MF/6aCwlvXSJo=
X-Received: by 2002:a17:90b:4d8e:b0:38e:895f:25fc with SMTP id 98e67ed59e1d1-38fb14a50b9mr1388374a91.38.1785492963980;
        Fri, 31 Jul 2026 03:16:03 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb2ce28c7sm509733a91.16.2026.07.31.03.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 03:16:03 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Yixun Lan <dlan@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Goko Mell <goku.sonxin626@gmail.com>,
	Jinmei Wei <weijinmei@linux.spacemit.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/2] ASoC: spacemit: Drop redundant error messages
Date: Fri, 31 Jul 2026 17:15:38 +0700
Message-ID: <20260731101539.36290-1-phucduc.bui@gmail.com>
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
 sound/soc/spacemit/k1_i2s.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/spacemit/k1_i2s.c b/sound/soc/spacemit/k1_i2s.c
index cd461f2aa756..64510c9a1a89 100644
--- a/sound/soc/spacemit/k1_i2s.c
+++ b/sound/soc/spacemit/k1_i2s.c
@@ -478,7 +478,7 @@ static int spacemit_i2s_probe(struct platform_device *pdev)
 
 	i2s->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(i2s->base))
-		return dev_err_probe(i2s->dev, PTR_ERR(i2s->base), "failed to map registers\n");
+		return PTR_ERR(i2s->base);
 
 	i2s->reset = devm_reset_control_get_exclusive(&pdev->dev, NULL);
 	if (IS_ERR(i2s->reset))
@@ -495,7 +495,7 @@ static int spacemit_i2s_probe(struct platform_device *pdev)
 					      &spacemit_i2s_component,
 					      dai, 1);
 	if (ret)
-		return dev_err_probe(i2s->dev, ret, "failed to register component");
+		return ret;
 
 	return devm_snd_dmaengine_pcm_register(&pdev->dev, &spacemit_dmaengine_pcm_config, 0);
 }
-- 
2.43.0

