Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202645;
	b=oMvagIKl+4OCe4dHQxRSaCyEDNYHj3DkWq3TPllMtSplJt3vHOPlKg2HFTiOBahVVPgv
	 1wcExst/c++WGv9+/m0JyuH8jIxzErqFkniF/f1PXxdlON6+dPcZjQt1SC8AA/OjjhSX0
	 Cc144TWTz7VweAeRaw2yYxvj4Nfe+VRHImgLeqTNsDX2D0pZygYQDEzBfScpQzxjL1Z3y
	 ag+VIqlI9IEm9udFYLlAFtLX38qpNmJIxt7RuJZZ/YCJ3zh96gD26HBJhA4VqWREmKvlh
	 ZBv/kDajT+/11dz69sSAQ6LKDHtLKyJ0Z2vKbi14fc7Qqvr4YJxqHsmLZ0w9Je9PXWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202645;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=3fhhPGjS1thNHUB3b+qhtFbbHubj0JR+3bV6/IGk4t4=;
	b=Saf1HQfD6AshtrOSKUCEBB1dG+trwAAVXG+hHnL4pUetSLZNDoBJ24OBdaiEfr5VYVxy
	 zNVvfZya2JYMue5oHpwG1C1Hmohq8BMScLw/sfThjMNRrERvyEratrDjAHvZriUZjHt83
	 Wc0VqekK1U6i3EiFHkjAdnlMZZVvSq8DjkxHmLbT3dFiFfmfGnrJQDVMbeOxolXGyZMDP
	 jVCm7/hM8j8dBzsDSuEudDA2HGyvRNPJ5YaTXmd5fxfyjnNGLVVrw4xX9oYHBREyp8+s2
	 uJaMcjSOiFTGlbAZX+JSSIHpISmTvng5NDx4DoUmYebfPDeYAmSEZcabo9ffvZFkPOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ckmxVrcT;
	arc=none smtp.remote-ip=74.125.82.72
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684EF606A6E8
	for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 19:24:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 684EF606A6E8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ckmxVrcT
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1a71dd190b0so3646289c88.1
        for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 11:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795202643; x=1795807443; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3fhhPGjS1thNHUB3b+qhtFbbHubj0JR+3bV6/IGk4t4=;
        b=ckmxVrcTbitKNtemuk5b8GC2WFoXRVOUdF3WVHB9AbPh2EZs86ZXFZ50srAN/P1lP7
         I4XtxldXGq92BakhgHJ9yvkBEy9ID0EaRDbInhLp+bvp3sQ8DRCam5oVgsrDND1aYWiw
         JOkjUIDQcAAu0IPr6HbeFTqpBgEBTc1tmesGQmql883I4As4PV6ID7ECPjDVMaynZyB9
         hpOE9XPb7G6YFV8Fs8on0I9jVrylQARZvrWsEzNbY3IxBsM2NzQXYOJMPQMKjRHvuYKt
         S9j+HCKbPmA0muJvZDnPLf50wDrEsy1bgSFyIOqZ7br3KzCLO8hsWR4OFd290GPc1yrd
         GvEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202643; x=1795807443;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3fhhPGjS1thNHUB3b+qhtFbbHubj0JR+3bV6/IGk4t4=;
        b=iEHy1Yh8RaH//1sL+7y6PQyvD16yjLUdsVnjks3exslJvN4De/I/2PdHhBUiKGMdyJ
         cUGpGknB3iPpa0GxEeirp36ZHI67u48xX2FYpT30f8Vo6YKdLntz9VcrBWrtMZwFHe8Y
         Q5GqqWDPxiMVTPrOiUDm363a3L9N+dHkfOBFMAJVybycmoaHM42E1Yzrv6I6CBvM0dLW
         g0KjuHV75EzxSfXWQKcOyNGQl40ZL1ohSQfAy4tsqTuKnfg3r4AGOGMDkjXgqImv5rim
         rKgZhKFOcMSjxoRHvkf/EwLvfWBd9Q5kIkFZKS8RYXANEWQnBOVFUFNH9tsOyLpGxjYb
         l/Jg==
X-Gm-Message-State: APuU4Z/3rxHEFSHQN4gjKbnLGPVHc95O9m2Sj/c2bx4DwIYJ1Wjb29fU
	BnbpkbqZjrsTo11kM69XOwd3FVE7vZ1De5aUy2ZWqMmEJ+hk+R4QnY9Tcg0ac1ozR5/9+rQmQEz
	Inw==
X-Received: from dybmh16.prod.google.com ([2002:a05:7301:f10:b0:386:33c7:a7cb])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:1715:b0:144:f089:b189
 with SMTP id a92af1059eb24-1b55691a623mr3662644c88.36.1795202642255; Fri, 20
 Nov 2026 11:24:02 -0800 (PST)
Date: Fri, 20 Nov 2026 19:22:36 +0000
In-Reply-To: <20261120192237.2870582-1-elkin@google.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261120192237.2870582-1-elkin@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261120192237.2870582-2-elkin@google.com>
Subject: [PATCH 1/2] ASoC: mediatek: mt8196: clear afe->regmap on
 devm_regmap_init_mmio() error
From: Elkin Cruz <elkin@google.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"

When devm_regmap_init_mmio() fails in mt8196_afe_pcm_dev_probe(),
afe->regmap holds an ERR_PTR() while unwinding through err_pm_put ->
pm_runtime_put_sync(), which invokes mt8196_afe_runtime_suspend().
Because mt8196_afe_runtime_suspend() only guards if (!afe->regmap), it
passes the error pointer into regcache_cache_only() and crashes.

Clear afe->regmap to NULL before jumping to err_pm_put.

Fixes: e38353138a09 ("ASoC: mediatek: mt8196: Fix probe resource cleanup")
Signed-off-by: Elkin Cruz <elkin@google.com>
---
 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c b/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
index 82b5ae91751a..3028aa82c4a8 100644
--- a/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
@@ -2450,6 +2450,7 @@ static int mt8196_afe_pcm_dev_probe(struct platform_device *pdev)
 					    &mt8196_afe_regmap_config);
 	if (IS_ERR(afe->regmap)) {
 		ret = PTR_ERR(afe->regmap);
+		afe->regmap = NULL;
 		goto err_pm_put;
 	}
 
-- 
2.56.1.750.gf70dc682cf-goog

