Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C89012A14A
	for <linux-sound@vger.kernel.org>; Mon, 26 Feb 2024 14:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708956150; cv=none; b=H5MhjwyYHZok2lyuRC4VUkZO7SmZVS1Y9VVAkP1ACm/7pXpjpkmZHpDnquGbNoRK6N8RFcU7GEftuiWNOUuWAU8CnVUMEXLo2cfHz2ixCly2PYdQOHNvXjbm42owqm76EUCJgXIo9HHPdvUhXpb3MMwFLtXhY3Zk1o8G43BzGgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708956150; c=relaxed/simple;
	bh=qrZwwuTRTZwtV/ywWqyLXe4Q7uOXoLUUQrclwWnFp7Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IP7WKqek7qNgjl02j6i+Uv9MOeYZK9Vz6Ylt4LLFrczezMXGEXthPFiUOf5YGuo25bkrMxCz8xvuAEy0ItTHz8dp6Q2D2CEUBUS85M2aRpmEzfJz9AU+XKvjYyWcZY5kmrXqupSw05xgZda15wAzmQeiy22iLveJ+kT/45KYzm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=gxD++Meo; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="gxD++Meo"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-412a5de8a06so4994235e9.2
        for <linux-sound@vger.kernel.org>; Mon, 26 Feb 2024 06:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708956145; x=1709560945; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SzteyAfQmYgd04c3xIbcEszPYVc0e3vP5LLdlStO4ro=;
        b=gxD++Meo7HHhvvwPN0W705yOEoGKYWwu7sTZoeBCtezbiiCVJdXF9r4n+J1xvJ8wp/
         FuQGVZRUM1x+9qPcdoLS5ySMuU2tjTbu1R8ttuZE9sc/BkH8NvZc5ZwWX5pgyPvRBW31
         VVLj9A5Iphwxfam+cl81Q6ZafhWwjVzvSqSkFZmqnauVaA1IaRTajMQfcJuC67yaiDhS
         BvjGksWDORHr5ufLO32FlDlRnsY64xJEEgswtJIYUENe0M06THPJvWaPAcddOBYvLybK
         HtcFV6n7BRK7joASzjR1zohiaUqWhb2e8D8ZNjTsg9yiTRqsfo4Pjk3sPrJSUOcj14E5
         2xFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708956145; x=1709560945;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SzteyAfQmYgd04c3xIbcEszPYVc0e3vP5LLdlStO4ro=;
        b=aKXuGyubSWdRX+/5caLMS/qKTd9LGXx0vigcaJxJE/SH5ALbBoYdCYSNLGqFO+H//B
         7snwQKOVu5L7Y5MLd2qEMYqRgtVZS6Fk0kgXLu/K2jZZyr7z4fWkzAeqy6WJZH+Y+ewF
         Akv8AdtY8QugifGKM93y6F4jyhOBPvscPbFJvzlk/54to02yshwmKrHUXvIVTZ+UcD1u
         +mME/ugVDdT4hqpbWLBbSEHdbA2KB3U0LRXPqItshw3vW9gPSPhiRXL2MfqYFUOUYiRh
         ar0DKruLNULxekwkGfWm+CbhKIjCsEpyc+e80o1jVPWodsYZx40f8SAfcWHuyPJz+YRp
         KKiw==
X-Gm-Message-State: AOJu0YxcxcE1pqlW1RdNQFzfdkyp5LLxF/THso/GBp/ZGhFAckh+Fi5k
	hhEAvHFe/QEdzHlU7clki9U9Qg/gmzkGixRCtBJ0DNX7KHk5wFj/xekjCmDYfmc=
X-Google-Smtp-Source: AGHT+IFc3ZtCNmpbpEYAJHKn2ZQ9YqyPoGmBc4eBeC0117sAQ472ltXWjc/Xa516gqcnqMw1sOOt8w==
X-Received: by 2002:a05:600c:a001:b0:412:a47d:1fb2 with SMTP id jg1-20020a05600ca00100b00412a47d1fb2mr2070382wmb.19.1708956145474;
        Mon, 26 Feb 2024 06:02:25 -0800 (PST)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id d33-20020a05600c4c2100b004129f87a2c6sm2838475wmp.1.2024.02.26.06.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 06:02:25 -0800 (PST)
From: amergnat@baylibre.com
Date: Mon, 26 Feb 2024 15:01:51 +0100
Subject: [PATCH 13/18] mfd: mt6397-core: register mt6357 sound codec
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v1-13-4fa1cea1667f@baylibre.com>
References: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
In-Reply-To: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Fabien Parent <fparent@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=803; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=Z2yJ/oBlNczeCIJzQKH6oIlg8xoLP0FDW9ftHO97UdY=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBl3JncCWphAeGutpqeyL4/OPzJoTjMSUOe7sBai3g6
 KqqPwIGJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZdyZ3AAKCRArRkmdfjHURT3eD/
 oDk2BfGI180002+laCNdSwG+8z26O11oUe+X/vcITvLRl8uMowpsX2Oia6rHtaeJPd49fFMgyUOtDs
 0uSjOeVUMe45iYIOiO+dGqIn59SpKw13K0I31SEsg8661CYSTrUJkpKX3DsLbcDAu6wkg/t7BY3TPT
 ELDPQZlEUPun5D8HIIiNND00hiLwznLngaPPr9ju83cpvSrmsKngPH5uUEDFQ8aRL8jB6E2ue+5ePA
 tN/9r+yw/ID3Z42bTGjN1DumsEKB7hEqM3+dn82SOwsYK9e3G16spC7a2f3xwUkbNEDVAtkOT+N+9j
 e3loRcMxyTqSh1PWd3ByYdW9aV98q0rIcvxlkJNINdHhglQgWgGRNQJTXHUfyj4eEAbYLSlX27tPnv
 X3LJQ7qBhetlZcd/OR4YUcgWxF2L7AXwytkKKpv74Cv1kfNvrUNZG3TVO7C/DJzItl9yJqbTRdNkSV
 Vnlb+Zjcl75QjgM5OsgAZ0rdR5fvOEEmXEEJrthVt7qTY/0ozZVmricnmd4Dktxjg41iHqFF/7E4WZ
 FscF9yqDi1c0990MlHE/WcHu0TBepjrpd6XHKE+1l8D3fetAhFuGgNrD7RKBWgUb/E55GPU1bVl4rZ
 Lijf6U8oITrWDehsCRAyvjTtqEximqHMFOv0UsiSeSUKtNkIyoy7FmYMhdZQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

From: Fabien Parent <fparent@baylibre.com>

Add MT6357 codec entry in the MFD driver.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/mfd/mt6397-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index 4449dde05021..4fd4a2da5ad7 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -141,6 +141,9 @@ static const struct mfd_cell mt6357_devs[] = {
 		.num_resources = ARRAY_SIZE(mt6357_rtc_resources),
 		.resources = mt6357_rtc_resources,
 		.of_compatible = "mediatek,mt6357-rtc",
+	}, {
+		.name = "mt6357-sound",
+		.of_compatible = "mediatek,mt6357-sound"
 	}, {
 		.name = "mtk-pmic-keys",
 		.num_resources = ARRAY_SIZE(mt6357_keys_resources),

-- 
2.25.1

