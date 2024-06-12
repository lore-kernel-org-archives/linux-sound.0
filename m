Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8772F18755F
	for <linux-sound@vger.kernel.org>; Wed, 12 Jun 2024 16:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718208975; cv=none; b=czOQDSenz2htmrnE1i+WuN0ZBVem0T69//xfbAIg2eJzH/jcgd1ZE+3UUcQtzgktsZbX3GBgoVZqn8toRE2dpDgKQ7H50FjvPNw/vkLCNirM/TWUavIyYWAdJGr5kol8mw20sVxrbWFgOv5AWrclsaMZJNoz8spuh+hbeBFWcOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718208975; c=relaxed/simple;
	bh=qUt++NHBE72DcCvYJJXtBbloAck2ow8GLupnZk4I2eU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J/LieCGoboC/c+Oq8rQ9/UFZ//8glKanDH2KWzpFrh7Anc+v6BVXqIlYiq9TABsQXjToBtLpRQ1YXMutX/AVl0Ho9RSq3sDzVai+1p62MYu6nTYVN8bZUk5IFlvEvKBtcZyu2qtb2+OM0ekJIAm5KU0jCOYKzk0+CPCP4Aey7pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UJDHCUH9; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UJDHCUH9"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-57c83100c5fso3088661a12.3
        for <linux-sound@vger.kernel.org>; Wed, 12 Jun 2024 09:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718208972; x=1718813772; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pxtE1VEMG2w+3gwFE4no+YHVTTaRE3n7buFfP0YuBoE=;
        b=UJDHCUH9DtjoOqZHQ5TzdWSdZs8LisAE7gxGoXdsDUJ0L17XL0grIIH+psHvX9SpB2
         wgYD6M+eIBjpXi83SmWL19ArQBnQvZhQ7RYVSnsoADU6yz2ceVqpX4UKl9uMq6zcn2tC
         6MtBqjIQqzAETos4R8h4+Q3fB7Cbv1/MMw8q3putNV/qRw/dO/v688fHxkCamYjj1uvi
         7ilktUlelAskmGZ1XiDXXJPOAwHRgWm8BKB5RXDCpbvDKxGSauB80kjwt2jCYtRSHOEt
         ZO+QhBNi/d4eijs3yV8Wtdp1PvLC9cPUI03JvbVH41Ngt5sro7yYmUqybvYhzaByd96U
         DrhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718208972; x=1718813772;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pxtE1VEMG2w+3gwFE4no+YHVTTaRE3n7buFfP0YuBoE=;
        b=gDrFt4xi1ZGQaydwacMo+I82Pg/3bk/lmpX8UDB7U5SIxjNK0WiAKfvv11FliTjrew
         9KbFh6AkwZwSUocdeDg45a/y+vhvTNZkDoQHDrC4dzufcbewAJ/c6X/m8p5A5rSbhflu
         UF3tCSJNQso/QCp69S7uvMdmgFgN+blUv2lXp+tQJJDlh7WYVj67biEtOxdsoYxxYS2p
         VHMeSr4qzhuJyYsYcAhGmNG6VGZhpwKtu8wPpbwcl5jau3BXoUAsVQF0rd56SZD8Hrue
         bTUKqLf5mlJkbY8OlFoZh8OKuWcYwPhlMA74ErPhlcJjfBOFzhoxfleNesXNI0VmbgNm
         eDmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHakupOs2aU2slWJYwWCeeFHCYYWIrSYD2XkiFhmV0VLP7oXJ6szmfUemGGF4M3Qlff8UJoe9h2LyVjEPVO7I+mBJh4GiwPgV77UI=
X-Gm-Message-State: AOJu0YwUGlUn00XUOAXlQyAXCQzce3qPN4bFU5cKLewiviAvVa5toALh
	SfW/KHTprhaeYfV7SAkUlf8a9YNfL43e5fEdSR1JmaruKb5qV5QoKm9ZWhlC/9E=
X-Google-Smtp-Source: AGHT+IHPp7Vgza1ymphlJXdfflDu+EZC1XP7FBl9D444bj/tSph5Z6WqGCCucohWZtPiSDGFrcpvAQ==
X-Received: by 2002:a17:906:f24a:b0:a6e:c5b0:b64b with SMTP id a640c23a62f3a-a6f47c7d974mr131303566b.16.1718208972037;
        Wed, 12 Jun 2024 09:16:12 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6efd6cfb74sm624815866b.20.2024.06.12.09.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 09:16:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Jun 2024 18:15:32 +0200
Subject: [PATCH 19/23] ASoC: codecs: wcd938x: Drop unused num_ports field
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-asoc-wcd9xxx-wide-cleanups-v1-19-0d15885b2a06@linaro.org>
References: <20240612-asoc-wcd9xxx-wide-cleanups-v1-0-0d15885b2a06@linaro.org>
In-Reply-To: <20240612-asoc-wcd9xxx-wide-cleanups-v1-0-0d15885b2a06@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=668;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=qUt++NHBE72DcCvYJJXtBbloAck2ow8GLupnZk4I2eU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmacmn6iGzlR3wL8gkCnXRUqlYysc877RLjpSI1
 WJr7805huaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmnJpwAKCRDBN2bmhouD
 12P2EACZ/GwZF4x9vKr3nIxVzGw0Kj1fWm+rYpeuqN5GEOc2OWr+O4Xoh3v0+Zdl/w+uPBluipg
 aSGtiKgkXXGT+h6LdZfszQY4wmKTntlq14PzkxkXEVIA/dWaLj7dpO4Y1BnxERWXt3oN6PmgQZ3
 quqeh6e51u9NVrHve97PNUJzLCK3pCsvBLHeGplucWOBYHm1AqhuOn6WnD/wUaEWqysEGof2bVE
 eNRvX2L2UbVD5y37u1NIPl7mhLb2EhTSX+ID0VcfOVvQRuEjMJZJ/b6mLPoiaFRL2rbTBCc59fv
 TpkKmnhPYIG2/PesiwaYrpEKZj8+iy6mGOAYlB97Wh/zwvP+OJ+/R+OQp+XJBVKLSf3ABLuCeP7
 fv6utEQcFUXsQfWZA3krAhQROHtiryxKM7mve6xha4y30tTVWqwsTLObbmZkb3DFYiXxbDWHK+E
 98HmpDY4ReYG+NWbkffNEopD331uFBmpVzWiHMRxBeQ4JUZ2Z5cV0DkPkdHPCXHw39pDBiYFMID
 4mwRUl3LgbaOVmoaVYVtwCZtkqQRzKCTfJmZD8Wu0ixe8ZDcDMNc5CRCVr50DhSXIoS07XNTfqJ
 ZMZLaqekXsKc6s9NK/eo1dvoA8pBUPrNqik02lZWbjXAK4um0Z+gJrAvj8L8VxkMWd2/nR3Au2A
 p3Ol0XLuf/qQ1UA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

The driver does not use few 'num_ports' in 'struct wcd938x_sdw_priv'.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd938x.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/wcd938x.h b/sound/soc/codecs/wcd938x.h
index 45b7de242209..b2ad98026ae2 100644
--- a/sound/soc/codecs/wcd938x.h
+++ b/sound/soc/codecs/wcd938x.h
@@ -652,7 +652,6 @@ struct wcd938x_sdw_priv {
 	const struct wcd938x_sdw_ch_info *ch_info;
 	bool port_enable[WCD938X_MAX_SWR_CH_IDS];
 	int active_ports;
-	int num_ports;
 	bool is_tx;
 	struct wcd938x_priv *wcd938x;
 	struct irq_domain *slave_irq;

-- 
2.43.0

