Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B9E3DD86B
	for <linux-sound@vger.kernel.org>; Wed, 27 May 2026 13:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779890302; cv=none; b=dqPeahlW7Ev/UH+rHZN7/aE5ffx7R+0VJekq49je91FMOCC2In6S2HTIpA2wOvcUNG/b2D4eNVzOokWlkhyanvRm83VHxAyFoLbT5FNOwHIHHClm+fdbl4vFd/TK/Q8Frlqf8PYBEsR4DqeGFFMWVm9F/buANqLOR8XBU6+YjMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779890302; c=relaxed/simple;
	bh=r0AY6balmI5LK5cBrk9Sz6C0q7ffejwvtR4gMM36msY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MTpi392aAU3ntW6I8B8Zv4Bro7XPobaO5RFHjougcn5TQbru/UKu+7I7v0admx4vFpWRBOJfPeyHGwSFhwP6R498rHNghG5YIFqTUsDvOcQ82E3QWMjouJEFcKm5bxVGwHUuLx3cE5nHFlfNrW60+tXK6wrqp4alj2B+S7X5F9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hN8mZyyD; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hN8mZyyD"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2f7020a928eso17222224eec.1
        for <linux-sound@vger.kernel.org>; Wed, 27 May 2026 06:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779890301; x=1780495101; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sbmScUewxy69yzIsUCuE8aXgVmgMHcoBqHlMt7xLKm8=;
        b=hN8mZyyD6yLsc+dAqBZZL0WZhm+jwqzsQ86mt4IlMVSr51mZGcuehMaJmj8rY0oQMJ
         OVt0ISJtzxqT9V1JL8trmciMvbsEfhA89P/U35ApOwLmB54hrikYjF7++mIZv5T4nj1B
         BJS8ZVFCaLc53rPBwjYiLwk2tJTUaFeoWLeGe5clLt2bIheICqV81CH4azxnVonEBECc
         faBkQxYKWWrOpZRkYQGYhuogo3E0po281Z0ZPK2p3mkIHdYc9XSwWKoTJgjDm1bxn6f1
         e6rYVmpxb9iF7m9eH16ph21F5T9baeuCSjESwI1h/+/zB2FffGRl4vVGZ72ZKqg/KzHQ
         tkWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779890301; x=1780495101;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sbmScUewxy69yzIsUCuE8aXgVmgMHcoBqHlMt7xLKm8=;
        b=qful604ww4zi72/Krix6LHOiWoMBlIA0MDyY1KVbUGqOJpRiisslzwKx/fV0BKzG5l
         T62Ng3eKknQX8DEuBAFWgzHzwjVPSIvKM5uJ217Qt6B2vQK1LkNhi/7wqdPO+MKnN7Cq
         Tc8wTrA9hZGuqU4LWqDmfuTwsm5ujmtMjN/9acon2hASFnklBaMfK3Poj7OCqc5XolaM
         rwhaNcF1OOMVmHAczEmnzVY1+gi//9kB16qW9caNZQPxjNgEbHdo/2CUURlLOb5CEVHt
         OgpQ2CAtSO9GOMJU5zeV23iArwEkdydTkLaqfaaeCAkTJ5+4dNbPy5oxLaQtwcbIWQi8
         JU1g==
X-Gm-Message-State: AOJu0YycMaBD0nHXBoktmY7gXy+4JnBPVBI/Y+tTCb85ODIhdVWqJmnW
	rcHJBpYCHILdY6VoHyNDlKlwjTru2vGCio1WLYUM0lmsk4tsZaWw5AkM
X-Gm-Gg: Acq92OFGzjeU0Vmjo6AbCubyDBbWoDEN9JH/TFBp7we5yxkpyPg6JIOEmNXvxQWKH7h
	Jm+9HDwr6a5vyXD915OlDQL6IIGNtYlmGmqno2B7GcZoAM+TQGEmFi1ISCV6D6P3f0vWxrGxiHz
	IJk6P73kXwH7ksfhZtt7+idO12dhnp9SkDp+mOA8Apnc05/96OKr1v3GFqCJhF6AXtP0CSOm7Bd
	Ocmw7ovmg4lFCdOF+L7UOgK+8BtIp6AFchQZQDtANHeHUUjpIsKMzt1ZtQdaw3RUj8MrkSZPXSq
	eqhXZfV4KkhQirYzkm4Nmk2SCbeDr1TpfYFc+2GFHY9q5vwpOwE+L1YQXU3l2FWqnR+fqbCa8Cr
	hDzZ8XyHTi5O3JrlViJcipBfVW1UFP6YVmJhjOaOrf5DcG60+JnQSrTK0rIq6Y10bGHffF4WD1o
	lYjvYTSWahm2/OGtiDil00qHLc5xt2D0f+7T+EFqDBa945RzjeSqZiWrC9Va1o/yb4403K3kxWK
	A==
X-Received: by 2002:a05:7301:37ca:b0:2ed:e14:7f5b with SMTP id 5a478bee46e88-3044922a4d1mr10566374eec.31.1779890300526;
        Wed, 27 May 2026 06:58:20 -0700 (PDT)
Received: from [192.168.1.18] (177-4-162-74.user3p.v-tal.net.br. [177.4.162.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1366aba2b9asm13013788c88.15.2026.05.27.06.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 06:58:20 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Wed, 27 May 2026 10:55:46 -0300
Subject: [PATCH 1/2] ASoC: mediatek: mt8192: Release reserved memory on
 cleanup
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260527-asoc-mt8192-probe-cleanup-v1-1-1bb834d05b72@gmail.com>
References: <20260527-asoc-mt8192-probe-cleanup-v1-0-1bb834d05b72@gmail.com>
In-Reply-To: <20260527-asoc-mt8192-probe-cleanup-v1-0-1bb834d05b72@gmail.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 notify@kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1634;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=r0AY6balmI5LK5cBrk9Sz6C0q7ffejwvtR4gMM36msY=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFliP4oslk4/pFEex7tum9+WL9wiE02MQh9tun/h9d0vl
 5K52bNOdJSyMIhxMciKKbKsTlpkuafrwdX6uBUeMHNYmUCGMHBxCsBEKvQZGX72MgtpmK0vun6+
 dHdfYPiNXz9mzhP3TzR6l2byzE41Jo6R4USD2QwLlhkTnNbLPbDZfPBamp/jK2bTFyt3WDx+vts
 rnhsA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

The MT8192 AFE probe calls of_reserved_mem_device_init() and falls
back to preallocated buffers when no reserved memory region is
available. When the reserved memory assignment succeeds, however, the
driver never releases it.

Register a devm cleanup action after a successful reserved-memory
assignment so the assignment is released on probe failure and driver
unbind.

Fixes: ec4a10ca4a68 ("ASoC: mediatek: use reserved memory or enable buffer pre-allocation")
Cc: stable@vger.kernel.org
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
index 3d32fe46118e..9f5057eeeff9 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
@@ -2155,6 +2155,11 @@ static const dai_register_cb dai_register_cbs[] = {
 	mt8192_dai_memif_register,
 };
 
+static void mt8192_afe_release_reserved_mem(void *data)
+{
+	of_reserved_mem_device_release(data);
+}
+
 static int mt8192_afe_pcm_dev_probe(struct platform_device *pdev)
 {
 	struct mtk_base_afe *afe;
@@ -2184,6 +2189,10 @@ static int mt8192_afe_pcm_dev_probe(struct platform_device *pdev)
 	if (ret) {
 		dev_info(dev, "no reserved memory found, pre-allocating buffers instead\n");
 		afe->preallocate_buffers = true;
+	} else {
+		ret = devm_add_action_or_reset(dev, mt8192_afe_release_reserved_mem, dev);
+		if (ret)
+			return ret;
 	}
 
 	/* init audio related clock */

-- 
2.54.0

