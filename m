Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D7926B2D2
	for <linux-sound@vger.kernel.org>; Wed, 18 Mar 2026 14:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773845443; cv=none; b=ZSQFtaPS1CBdvgrxWFWveT7dCYmpo5Hnk5mzHv1ZPnLuwU72nDwESYPs0zKFXOCElBjdu+ToI9yXyhWCy7ADK+O6C572kaQr2/TfvObt9f8KqMh486Eyt2jtFOOZMkgqV415D8J6OA4cLEAdZP6Ve/+f5X1XBt9W7+AhV/JsYfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773845443; c=relaxed/simple;
	bh=NLuWlcb8pDVc/jx4hn9f+1Y4XpERqSPMPejDpC3HkM8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fY+JX4hbfXQ0XvEASw4E/6HalNaNRIBx47xgMWO1rDo3d6w0D3cIAuCPbE6IrmkGjFVd05tiENYxlSat5Wbt7niHlwT213Ohd3/gA5unknENxK1QfMTFl/dSGhFqTBQ2SwXkY8tvcy1A6+ld079x0uEgzZ2X8PMRgRmxOjvtrZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=ks1QBwoK; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="ks1QBwoK"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-486507134e4so23428945e9.0
        for <linux-sound@vger.kernel.org>; Wed, 18 Mar 2026 07:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1773845437; x=1774450237; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v4jx9be2ixpeez8G3+677w21LKJvNvIiDEiSr10SzEQ=;
        b=ks1QBwoKU3XSB9oaHbxpsCtyvCaVhgW/Js3cEUr/snbzBUVlfk1RvoVnXFN8Eg1T0K
         I+HZD+GpqZ/inZykKDEfK7vHeDhIDs2n3FMeN2g+OwpS1HCx0c/1mLbleFCxMV4pyBCZ
         pxJWREQy4k9zdetybrOTW5jtw+PfCPDR0eNGuHDaxrcQrDsoMeoh5qaNa/WRXN+XDjtl
         mP2yGc6CdE/KMeCWPjIcY2cXPMo8DziX+NuiezspsBJB6GLHLE+8S6B6cVy6JDbBFAhn
         ViLTKuiLLhIYF1Fk1tncVwvq9qrcG343SfrE5wTluYZxjBcg4L5WlEXxmXDhtDCSbwj2
         JfNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773845437; x=1774450237;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v4jx9be2ixpeez8G3+677w21LKJvNvIiDEiSr10SzEQ=;
        b=KrwqhL9TkvnTDH8ZHlxTnlLL788oXKANwfQgqd7UpeRpQQOhQ2pd37F+BTTI+3XNcI
         Mj8VUEUxWWUS02fTD8LOuMeZC+piIFi/84YZGne34qYwGGEIrYhi8mpY0j+DvUBMJE0x
         RsQ1recRLW04n4UKFBuOTI+m/8QsbE0udCOjBr41IQGxKNAye+sf/mIdSKWZVap1s8Jm
         1BHYVFqxAI6xrSJEtejJ25YPR7E71PEXIH9TSjCmodMkd0jdwNGcYCf/Y3rFmamxqtX5
         hLSn37AhRbza/dUyZ5fwRqM6inUU1qInFr7Fqd/Qqqg7fYsXNNFNK3TmdCUDw6N2HzGI
         pnsw==
X-Forwarded-Encrypted: i=1; AJvYcCVFH0GEdTuxjm9St5+tY2Wm41m/FM1GQPcJEg5HK0G2Snl0o1xF6eC3SpdXwE8DtkmOqfeeWH/E44+SNg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOcFVFv6/0OoAVu0GFHrcmFZ1sLl7mLxJjDylOTuonNVYEDfiz
	ZoaCTWMctzfkw/BUOoLAIX6BqWr9qVd1BRMPh61bRUxQh3wf2OjIJbyklZ7mUOa7jXg=
X-Gm-Gg: ATEYQzyKh6FGAtt765Dge1MJlCA/M3wGjGm6rMpCmxDROcFbkZ4CS2o78GbPvBfjnpG
	Olp+kdJfM4liAF8XBWSZJQf1ezUj9bPE5yIllNxxZyJh8Y+snIHgFq8K6N3yaSVrcDTMcaqHnl4
	zi21pnyDRFA0A2ohifJTkg6gNEZ5cK57GrP6NcFuNzSWcaf0qruzGUHAgqB4wZSdf2jzlgB8qDp
	UpK3F06REiL5NpWIjhEmiXngNZme/XvJkFI/vmjXdhEoANeLIJP/iWQV6rl8MSAOxDyzNS7reTp
	3ISkwfxNEweOQF4mrrBekFv1HV74n1Aj84VYyoAArH2Wvn/WecsLFlRWVDYCe8wtnbQwBe33iQX
	9mfjPCdKVHr003DHPbxIO5Oks/KONwEuZGdKL6zNiKwcG3m/ATIn+63s+EE2ycpG6v2sbqXa7WL
	/ViqvxgJzN1fw4M/CQ1o/8prr5CphUEMxKNVPgrIohBLV0qnJgnJ5vZ29y7swLb97oVLjzfbSNS
	lutbQ==
X-Received: by 2002:a05:600c:1f13:b0:485:3c05:24dc with SMTP id 5b1f17b1804b1-486f4465ec5mr61165625e9.33.1773845437260;
        Wed, 18 Mar 2026 07:50:37 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-192-109.alshamil.net.ae. [86.98.192.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f421a6f2sm64455665e9.8.2026.03.18.07.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 07:50:36 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 18 Mar 2026 18:50:25 +0400
Subject: [PATCH] ASoC: rockchip: rockchip_sai: Set slot width for non-TDM
 mode
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-sai-slot-width-v1-1-1f68186f71e3@flipper.net>
X-B4-Tracking: v=1; b=H4sIALC7umkC/x3MQQqAIBBA0avErBswo5KuEi1EpxwICycqkO6et
 HyL/zMIJSaBscqQ6GLhPRY0dQUu2LgSsi8GrXSv2sagWEbZ9hNv9mfAdjBEvnNaOw8lOhIt/Pz
 DaX7fD/krs4pgAAAA
X-Change-ID: 20260318-sai-slot-width-378eed5c22cd
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Heiko Stuebner <heiko@sntech.de>, Sugar Zhang <sugar.zhang@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1654; i=alchark@flipper.net;
 h=from:subject:message-id; bh=NLuWlcb8pDVc/jx4hn9f+1Y4XpERqSPMPejDpC3HkM8=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTu2r2LQXabQmNxUOTmuWuVZk1xYDH7F7xj3tm5YhsuT
 d5751SZX8dEFgYxLgZLMUWWud+W2E414pu1y8PjK8wcViaQIdIiDQxAwMLAl5uYV2qkY6Rnqm2o
 Z2ioY6xjxMDFKQBTff4ZI8P3KSv/KzEcnL3vu/K+l+pbFh3xStZe+UPM8PKzyZlhs3YwMzLskdU
 R9W1wm3mARX752pKM9Qv8kr5alHXePbncc8pXtio2AA==
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Currently the slot width in non-TDM mode is always kept at the POR value
of 32 bits, regardless of the sample width, which doesn't work well for
some codecs such as NAU8822.

Set the slot width according to the sample width in non-TDM mode, which
is what other CPU DAI drivers do.

Tested on the following RK3576 configurations:
- SAI2 + NAU8822 (codec as the clock master), custom board
- SAI1 + ES8388 (codec as the clock master), RK3576 EVB1
- SAI2 + RT5616 (SAI as the clock master), FriendlyElec NanoPi M5

NAU8822 didn't work prior to this patch but works after the patch. Other
two configurations work both before and after the patch.

Fixes: cc78d1eaabad ("ASoC: rockchip: add Serial Audio Interface (SAI) driver")
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 sound/soc/rockchip/rockchip_sai.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/rockchip/rockchip_sai.c b/sound/soc/rockchip/rockchip_sai.c
index 1bf614dbdf4d..ed393e5034a4 100644
--- a/sound/soc/rockchip/rockchip_sai.c
+++ b/sound/soc/rockchip/rockchip_sai.c
@@ -628,6 +628,10 @@ static int rockchip_sai_hw_params(struct snd_pcm_substream *substream,
 
 	regmap_update_bits(sai->regmap, reg, SAI_XCR_VDW_MASK | SAI_XCR_CSR_MASK, val);
 
+	if (!sai->is_tdm)
+		regmap_update_bits(sai->regmap, reg, SAI_XCR_SBW_MASK,
+				   SAI_XCR_SBW(params_physical_width(params)));
+
 	regmap_read(sai->regmap, reg, &val);
 
 	slot_width = SAI_XCR_SBW_V(val);

---
base-commit: 8e5a478b6d6a5bb0a3d52147862b15e4d826af19
change-id: 20260318-sai-slot-width-378eed5c22cd

Best regards,
-- 
Alexey Charkov <alchark@flipper.net>

