Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793712363;
	b=N47kGBb/JZTOA8tkmtsAd/1zMhJYuXvZ8/qW/YesXp/38oBfi1WYvI+rp0Vt5suZngcz
	 FIln4ttN0K1319lnUa9ZBdfKuLdM7Hy5nhLYcZ/OxZVnHKz3fyBYHl1J4JU0GgVgiok5T
	 vOtik2xGMyflXm0xTjI9TLrWjVr4uMi5TyopyMBLeKRJ0VuK9pCHMMJr9/8H1BRTdn+0n
	 Y2IvsqG4AFigkMyo86JFYEgJyqHZvbdyPf6Aw9xV/ku2fMdSot28F/FQHmlXuaMLhen+P
	 XI2wFVlDS41f244W7xf0ONWoMoCgZ0EgJBjsAz0DAXYWK+NdmOnJZ4hh7PcF/LK6UVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712363;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iyxcrfJd2R6utTsQVGbm2c3rEERhlQ+yqDUDF6loNwA=;
	b=MVPsGx5yekQO7corQI7Nj2DBBNI6RjfNJEo7fkPfhhFY4pGaHKRyY+Uz7BKkzLNeaDt3
	 dcgMXTPi0bc+9licaBpAaP065o7ftioz+CnyAO6Ezo2vBVVNXD/hXtKUMuJeHpf1KdGnz
	 6ej3PN8xzThjCwgTqKZPCHRFKxqj1RnvVq0LLzTePGY+pXvbFPTsQrSmizsY42pYmLMz6
	 bXwAUftFF5PHH7j+GfeXNqdS5PkUmcipe6KNw4l5kNEGEc9Dbg2MpB1ib2IaiUUuF42/a
	 NBeMzs9T3rthYSXudRFEp6N5fnRY+jHhsMpkvkL8SyYuIYoPP1NmLEj8oJVbpdpm+ZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R7VkuIbj;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D37606A329
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 13:26:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27D37606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R7VkuIbj
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a218c463d1so28223195e9.0
        for <linux-sound@vger.kernel.org>; Tue, 03 Nov 2026 05:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793712361; x=1794317161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iyxcrfJd2R6utTsQVGbm2c3rEERhlQ+yqDUDF6loNwA=;
        b=R7VkuIbjFzlOrnPSNxpJE2G2yXkwSEIR7kaAD95jDwLmTnu9WhLHaf/BiAaLV+lcc2
         lyjTVdUr2jPPEnWGol7yqT//AwaacuZLAXKVAHrWbGyL2tT1GSqyC9359QOh2Dg5II65
         lkvy2o2QoEpALrBrnnYdy5wfVJTYY+GEI/1ryrUerThfxGmM+xwsSSLWzWHnhwBIYXOD
         Z622L2yYMFm9oatgvg5OrRvM419Lf/PsQT92FRqJiqh8702bYk+45MGmqiAxPl0z+6hc
         bvAzDvsD8HiA0hJORkLqkRNDp5hGmBIwRKS1l1+cwuIvXTjFR5W8gk+KM4vgwZrRxKi+
         Fo7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712361; x=1794317161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iyxcrfJd2R6utTsQVGbm2c3rEERhlQ+yqDUDF6loNwA=;
        b=DvIEQTYc/NMBtPG5MOqAHil+Sx6CK6bcehOkiPJgp0zZQYMVMPMmW8Yf+JWj2UthZb
         mSwY2GjzIQSoDhoA6al7PeqHAqy/rVFD+nZ5iwRj9t9dknIGRsKaxs+TSatBKPHvhrGB
         PSNpWZeAURAnrTqohdkW7drt6Z/L98dzM4yjbnqeUk/xgXHqwzPDDUJvcsKkVTMMNHaS
         fEegEAxFg88lUReFvMLA25UqorLXMOU+UkoLMHv1kkJr7t6aT0kBNtAq0iRjWR3mR5ZA
         QlkuyDcar8oFGTRlMNVQtiwP5HAhzyO1fpEeEBAqDFGboX40gyOoFC7DkYyHFifOII5+
         nAGg==
X-Gm-Message-State: APuU4Z8hHM8eqeaBtK/Wj3nN8U/4TbmUPq82KX7K4Oo4/x8Kvoku9Va+
	PvfW52nS4E0lLwe+eKkJxWKQueHUDDgM6UwWdUmz7rs8cOHdjkh4KZjc
X-Gm-Gg: AYBFou2M5nFnPPfkMMkejnXJMWyOa+jRwC4j7mRWYszXwXpgZIWt678Z2ciK6G8AUtM
	8TFHoK05tmYAaXuOZhQYCr4T5frV6BuIgOWNNj/FxVMJSDuuf+r3VK7ywlgwJF6+WGYv4TpMD6b
	qG850nvO0U+bDMvq1beLy96wptffRbMbPOlZfS+l63UbXAB194aOe/f5+MipUDCk80qSs/qUFwN
	d057S8VxnUIYEXe74DFYKs8K+2L19gAYFJsy0pdph1yNOKZBlhcv7Q/8SMMRR800FS6MDItRfh1
	buydFrpxhiHmNzgRZQpPjwZdaqrEiftl+y9AgeXYmtmzClQPjI6lLJnC+q89QOjnLM7qxiRPjnF
	gC9c/M/GmBBqk2HrzxF5/NfY//UVsLOHcY6IF1uCRZW1iRvgUg3qyCsURx5V/IESp7OszVCKu36
	wmWlgKsbgtAT4gtC4n80HMJiaW9sK2PqqMHR+7sjrumcDq+4XkTyLmqpbDgpYoOdn4Jwi754bhB
	mZp2cdOiXQMX9eSTMqa2+uyMYtFejtEGeCFPhLV42YcPOg3bx6LxaZ11yLNvNr8+YO0luwX/EkS
	wzD1NkESO9JR8r15q78OdsZOjTiWNKssrK5NmeOtJ025JsoDxUkRTxuYoAN/BB5epIgwG2ZmC5F
	wTwU=
X-Received: by 2002:a05:600c:46d2:b0:4a1:d537:1c8d with SMTP id 5b1f17b1804b1-4ac187a6a38mr302145995e9.19.1793712361435;
        Tue, 03 Nov 2026 05:26:01 -0800 (PST)
Received: from kreach.multipass (nat44-21-238.net.ruhr-uni-bochum.de. [134.147.21.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a82cebc1sm84725725e9.1.2026.11.03.05.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:26:00 -0800 (PST)
From: Jude Gyimah <jude.gyimah87@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	heiko@sntech.de
Cc: linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jude Gyimah <jude.gyimah87@gmail.com>
Subject: [PATCH 1/5] ASoC: rockchip_i2s: select REGMAP_MMIO
Date: Tue,  3 Nov 2026 14:25:33 +0100
Message-ID: <20261103132537.3717496-2-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103132537.3717496-1-jude.gyimah87@gmail.com>
References: <20261103132537.3717496-1-jude.gyimah87@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rockchip_i2s calls __devm_regmap_init_mmio_clk, which
drivers/base/regmap/regmap-mmio.c provides under REGMAP_MMIO.

  rockchip_i2s.c:(.text+0x418): undefined reference to
    `__devm_regmap_init_mmio_clk'

The driver can be built into vmlinux while REGMAP_MMIO is a module, in
which case the symbol is not there at link time.

Select rather than depend on: REGMAP_MMIO has no prompt of its own and is
only ever enabled by a select, so a depends on would leave
SND_SOC_ROCKCHIP_I2S unselectable.

Reproduced on v7.3, x86_64, with CONFIG_SND_SOC_ROCKCHIP_I2S=y and
CONFIG_REGMAP_MMIO=m.

Found with kreach, a static check that compares what Kconfig allows
against the symbols the compiled objects actually reference.

Fixes: 4495c89fcf26 ("ASoC: add driver for Rockchip RK3xxx I2S controller")
Signed-off-by: Jude Gyimah <jude.gyimah87@gmail.com>
---
 sound/soc/rockchip/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/rockchip/Kconfig b/sound/soc/rockchip/Kconfig
index 391ce2225fde..d7ec1fbe17a5 100644
--- a/sound/soc/rockchip/Kconfig
+++ b/sound/soc/rockchip/Kconfig
@@ -5,6 +5,7 @@ menu "Rockchip"
 
 config SND_SOC_ROCKCHIP_I2S
 	tristate "Rockchip I2S Device Driver"
+	select REGMAP_MMIO
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	help
 	  Say Y or M if you want to add support for I2S driver for
-- 
2.43.0

