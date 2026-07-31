Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2383B47F3
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 10:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785492987; cv=none; b=X+864zqotPccfFrx3d291aFuJVNR15B0WmN9gZM/RrhywdOpPQGuMoYvcv0KSmZfOly0N4WlcQr9wz7V3mjEAUs62J7xgmVEA4QTIKQIfjWZYL2G7VlmMywtPkcuq6PooDLOOMq2KVmn5do2AU6kM/EXZBbnyUtOrEnZu1Zg2fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785492987; c=relaxed/simple;
	bh=tIZl0SczIAIEGn6ulaKByJ4cIgNcPn8uPvyKgIjiEDc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cSSHkm+65+21jpRMRPvrWvbBGaUBzRVHQp7GMvxYiL+sHVJ6Zh+1izjXtv4gzNY3oXBXRgdddTHXO3ouG8Oa/VZXlfOuFe4dGTRJfooZpaQoCmbeGbtXwKzl5tOwTlaWiWSEbDxMMKIdhar9t0X6CzWYbb6aGVJs2pkCSwnteqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bsrcDyWn; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bsrcDyWn"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38e3617ba36so893041a91.3
        for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 03:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785492972; x=1786097772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VAZMksOYurF3tSXLo/jShDOr9iNsQwZ9titE58N+ejE=;
        b=bsrcDyWnFB7QMJ8pAiJ+Rj+/PNpfhnN3j9oTePeL+L6LgUml9MpoOQDRWRtf0SsiiF
         yiA+/p2Fx0o+pJFQLgb5ebi1S5oGOlclGGPejPPyi9fICrg5gVICZYOR7IxgP0dv+YI6
         NPUfMYCILy9zI5RyDjhrILFPIQu1Mxs0+yFWXwnDjC8w1X6tnApcB4u4Kfbp/8QjALnU
         HbE1aumDfT+ib1Jo8j8/lXtFE/tGUpzMGPasbNvy+p86mCNUcMI/kWctshVPUj1YN+lC
         4/qzRzt3bmMf3wbVmK5iOYzs28Ca8rXQ6MXIdBIY71HXuVgFRCCjqrB6xC9jpF3WUiwR
         fmJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785492972; x=1786097772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VAZMksOYurF3tSXLo/jShDOr9iNsQwZ9titE58N+ejE=;
        b=SHsglTy1STx704gcT3enJCWlhH0qTsAnibu9+LhNz/i2OAJkybWCbnc2LZfjLVaaV5
         SXxkkoTh8lME7NYuT2o5MwlTBfqcp3WtzI54aHG9WvuuXSsiX7oxm9E34bpH9HarvGzX
         XH/okdix0fEvZ3z1dsACN6bWmYt4tJcnjy98luKTEbI/VviH6PAUSQwQnrnEIUGhbRXK
         CKZZDrHpS/RGsXfVytW3b2ImQ2KUDKvn9dJwRc/02w+CpguAUhoN3MUU3JIn4+9OyO7e
         9bGT9XNm9RXUUXxdjweVn6yZFguoYXxPcndz47LerjMhJm8k+uAlP53A/9lsJ1rrHv7Z
         wa/g==
X-Forwarded-Encrypted: i=1; AHgh+RrP864Bzl/S6kk6IV+GDDHiaoow9YDVNWmZY+ylI+aS5cPduiVFSw6KOQEx78xSOXV/etYAwtogX0vGkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYyPUj2IwSpUa5Q9fp/p9VbnZ0uPA1fT9yaJJJG+ix2lH7hOnP
	6KGWP2vff8eh8HsgCcWPmEd5v5jtlPxAmu7IzRks2AtvXQtNEngYAgCA
X-Gm-Gg: AR+sD10dQVQkwtB258LFngsmIjyT2tn6FnYWUxzfu+z3vJhPQbCFZaKtpvULjLaTX76
	wi1Gr5YCtovRbJ/Ezh20pNAB7L6ZDFkvIyNE5ke+0odXjl0hJd9Aq+rc4a1Ks/d/SHsJXXz09Je
	+QTO7FgKjE60F1FGXPTF4Y0beY1zND8747pQUHcD/ENxWi10PGXZ8nYkUhmRLPrwSRLXtd4M/5z
	uFev0xm9bvSLiAS4h18Cr1DjeR/07E+PDupz5QA3PxmGFwCVEsrmXvNKhFzxKZKOVvIWoaQIHeI
	PyY9S0t0O8nqpgGAZz2mVicxW4hEy0bDq/mfl9E6Mx84zpdVpk0EAwMYs2sJLuKsimr9mSKr0x6
	i8zqgb09lGef08gz9rSWZWg+yWahrVkibDeuGJJ3KG9EZ9gCoEb164nY1N8Wpjz4gPKQN521zUg
	nTWlwSTRr7KFo7PMLaM4IAFVJLH4ZBmVGpXVRGERUfSm+EgV8UKex0x8jOThIzDukxq7AW6maiJ
	hsWBqZmwDM+yFj86PLB5ZCBEhAndzruk8M3neMJ2l5JEnfJZx1AOFTgFgWz69gky+E0ABiCNm0O
	mXWh
X-Received: by 2002:a17:90b:4cce:b0:381:cef1:11bb with SMTP id 98e67ed59e1d1-38fb13e74femr1383086a91.22.1785492972150;
        Fri, 31 Jul 2026 03:16:12 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb2ce28c7sm509733a91.16.2026.07.31.03.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 03:16:11 -0700 (PDT)
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
Subject: [PATCH 2/2] ASoC: spacemit: init *dp to NULL before error paths
Date: Fri, 31 Jul 2026 17:15:39 +0700
Message-ID: <20260731101539.36290-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260731101539.36290-1-phucduc.bui@gmail.com>
References: <20260731101539.36290-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

spacemit_i2s_init_dai() takes an optional output parameter dp, but only
assigns *dp on the success path. If devm_kmemdup() fails, *dp is left
untouched.
The current caller does check the return value before using dp, so this
isn't an active bug. Still, initialize *dp to NULL upfront as a defensive
measure, consistent with how core helpers like _snd_pcm_new() handle
their optional output parameters.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/spacemit/k1_i2s.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/spacemit/k1_i2s.c b/sound/soc/spacemit/k1_i2s.c
index 64510c9a1a89..23037fa4233c 100644
--- a/sound/soc/spacemit/k1_i2s.c
+++ b/sound/soc/spacemit/k1_i2s.c
@@ -382,6 +382,9 @@ static int spacemit_i2s_init_dai(struct spacemit_i2s_dev *i2s,
 	struct property *dma_names;
 	const char *dma_name;
 
+	if (dp)
+		*dp = NULL;
+
 	of_property_for_each_string(node, "dma-names", dma_names, dma_name) {
 		if (!strcmp(dma_name, "tx"))
 			i2s->has_playback = true;
-- 
2.43.0

