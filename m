Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C443A2E39
	for <linux-sound@vger.kernel.org>; Sun, 28 Jun 2026 11:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782646982; cv=none; b=WDpJyvTd5628Z3m5+klTcYAPQj/9bToIVCdpQa4RlV8R8PZPOQ6HdgFYRB+LLCMKPge2SFX5/ebu3AJ+fb4mt9s+ASuKUB+9PYzDtsH2JD+IsXISIpZvyjpxy3ytEH4Jypl8ecsXR3w8/2Pkujh+7UEdkGHzBmrZZz4wmew8FBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782646982; c=relaxed/simple;
	bh=t9+lcbAdwDvq6j9GMcBzxDd6Ri1EgHg8YLlczJXhS1k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YN9eAMnOuEdRD1S7ARyf1BXeROCZ7bzTmXFbh8xDCTnEsazq8DltNrRZ7oUUZjWav0x5pQqM+ZvanJPdnHqywtMBbVYWJNgTQy8vK0YAC69hNyAWERHBBcsrytOIaOqkDpJ30Pl9uRqFbpLg+nbaX4jxrfJNlRJ1ijY9NoVD+b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hujtnx6B; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hujtnx6B"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-30c965eab27so3945024eec.0
        for <linux-sound@vger.kernel.org>; Sun, 28 Jun 2026 04:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782646981; x=1783251781; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lkrl4ZHeVcLevSofgvxJDnh/ABWj9Hg5VAZmH82+HzA=;
        b=hujtnx6BIYqhT9+asdoyL6OmT5XYbPSg+5ARZ6Lt3DTMM0bVEHxlbf0MMmaRiwTNOR
         IohvsruH7UlhAkCV3TgFWeIhdfNO/DI8CDXPB+Z62BfjfptiZBppC9zxjYGcjaxNz7E8
         7v4ugRMN27Bu5ogJJBJg1EGjW08u/sybhHSLNwVXAEMxa/6qIwEm2etIebH599AibMXz
         fQv/+YZ1BjIYaUrJQYEByuA3yjPLzU3Vff254fEA33idZlXoWPQjUvcytvU6sjTNhOyq
         hZORyug4uDRFG7J+2yTUJCsVdsKXmWETfpb8JuagkVLaLXm96aMGCkd0zR3De+zP/Yvu
         g7Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782646981; x=1783251781;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lkrl4ZHeVcLevSofgvxJDnh/ABWj9Hg5VAZmH82+HzA=;
        b=F68b+XoM+hQo5OYPadWMuifR0PJtYKfBDqvOwVwEstq+RzGG9hOkvf+rS9JQrxgtq1
         9YFsG4b00+BrIWS56mWxfyURLSeiXncR/klDg9qGdxdJ3f+drJWX2p2lQreUZmB6Howe
         kZq3XumYMhHBiSNewr6oGt3DQVIOrmHwek5VFOXwprE3yUgDJ3DJgfFZI162EQSsWLif
         pYFXQOmPGxvckCOWxfeIMzTovY4n+fnD69YoFFzr5ogwy0wGcVLLm0FcbpndTrBFg/RB
         5f/QejUI4bkKwR/r+D+F6xZVazcuCFeO/wkDeJHHdimcHngymvZ/T/qK6RZlblKRHNUI
         LyDA==
X-Forwarded-Encrypted: i=1; AHgh+RoN7CRRHSkaySUgpb5ioKDGh3c9+WmLbwE7pCX2k3b0GFVmQ9U1JsAanD7cyNCLOyPKSHPZrpQYWcbu8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YweKT7zQLTd1vBoLU6s1EDmVEt4CSmGdRM2YR5Lne2OHK6aduU4
	nZvYQfJoNHLlxs/7vLoT73wD1wCRfCl6ztLmNeAgFcO4JCS65Bnqu07V
X-Gm-Gg: AfdE7cmblbL6kJE4IiYO4Uv0sA4nzuVv1iMEH/pLpZ+ajjNBxmezk+WHoug3FpynZop
	bCW64Ztg1X74kWtcA16U6quywYikCJcLpp1hEN0Xsw87w1NkqHcxApmdaLpoaEa0gS34ZQ9B9IZ
	WVZfdJU30IZZ59OzizxD11F/Pw1tTzp3ifiW8d9I209oQpFYZdIqeE5RDTYIDz+/ZNhZvN9rx2d
	4ux093d3VKa8y6c24FaoPV4QmwoUMUAPgKuAdnl0y9yP/4FKTZP3vqis+C8qGs9M/WITsywywTf
	NVmChWLDBQkd3plp0I45Ghwuz9mv3MGEpylfN4ELOE19qEcd4sutf/mBxoZrvs0RpbZSHwIozzl
	u0zPPHdwQrtmFLqytDP2rSG4thRNy3x8uuREaPu8slDstMFDvEkL+5gEahZlnkumfOssOmw8L7F
	jl+Hb8kvUe09d8+MOoex61aDOMMl3LPK1opINs21rJ8kueBnEkugbKGzWv/ALFc0nTtyld15rXa
	8WDmvmUZdUhzzmtVpzJZIXCKwaAzw+vaDX8QYeTInDAuEAKL5uX9/RHv6Q/9OgJjWoxzEugV1ml
X-Received: by 2002:a05:7300:547:b0:30c:38ed:46b5 with SMTP id 5a478bee46e88-30c84c0506amr13805935eec.12.1782646980547;
        Sun, 28 Jun 2026 04:43:00 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c8b1a80sm34520756eec.18.2026.06.28.04.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 04:43:00 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 28 Jun 2026 21:41:59 +1000
Subject: [PATCH v2 1/7] ASoC: apple: mca: increase SERDES reset delay
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260628-apple-audio-redux-v2-1-6328269c9652@gmail.com>
References: <20260628-apple-audio-redux-v2-0-6328269c9652@gmail.com>
In-Reply-To: <20260628-apple-audio-redux-v2-0-6328269c9652@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1359;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=t9+lcbAdwDvq6j9GMcBzxDd6Ri1EgHg8YLlczJXhS1k=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmOHLt3L43hvCb7UXOaWot5/nKxK/z9vd1dr4WWfKpLX
 BK+Ylt8x0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKobHjL8s0hnOjHDYHFJ5LsYb5sfCfsTDrFO9RVX7VqQK1W7sZ/lISPDY0Gfh+Z
 +pkGGej1M3rs7v1yNOWIl29bDNW3aN02Tl4sYAQ==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The SERDES clusters in this peripheral take a long time to warm up.
We tried polling the reset bit until cleared, however this is not
a reliable signal of readiness to be configured. Only waiting
~25 us to give the cluster a chance to settle makes it work
reliably.

Increase the 2 us delay to 25 us and hope we never have to do this
again.

Fixes: d8b3e396088d ("ASoC: apple: mca: Fix SERDES reset sequence")
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/apple/mca.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index 492165c0e1ea..ebe116f32661 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -210,10 +210,10 @@ static void mca_fe_early_trigger(struct snd_pcm_substream *substream, int cmd,
 			   SERDES_STATUS_EN | SERDES_STATUS_RST,
 			   SERDES_STATUS_RST);
 		/*
-		 * Experiments suggest that it takes at most ~1 us
-		 * for the bit to clear, so wait 2 us for good measure.
+		 * The SERDES cluster needs a bit of time to reset itself
+		 * and settle before we start poking it. This is... slow...
 		 */
-		udelay(2);
+		udelay(25);
 		WARN_ON(readl_relaxed(cl->base + serdes_unit + REG_SERDES_STATUS) &
 			SERDES_STATUS_RST);
 		mca_modify(cl, serdes_conf, SERDES_CONF_SYNC_SEL,

-- 
2.54.0

