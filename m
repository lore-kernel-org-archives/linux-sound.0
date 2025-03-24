Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36F41E5B91
	for <linux-sound@vger.kernel.org>; Mon, 24 Mar 2025 11:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742814381; cv=none; b=p3mkTlVM1qu+7O5lI0Gjxou9Av6HcfWZ/HrLNgAf3oAiFVq+p/Dh6+Str4X+RsznfzSgbo3Az5zPFul/7NPPJDMUSAtkqw2524wQPPgU7Bdn3TpVlJfS/8MaB5gXnyKYUrYiBZm2aXeiuQq3eLkwud5TXZcBfyJorsKWOboHyH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742814381; c=relaxed/simple;
	bh=Fajt6GQE8QH5YN/HGXfsUTV/hu9B35JpoBIyhgJYBZI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Dv/FWImD8uKW54ujd+r/QaagjWxM3p0HGEGVsjItLXcYp6qfV6VTEsUItdjPIcpHWaERNqzoZ7jokKA5dNzuf5aYdackz5qNY9a8h1Zig3zZDaru1+LDr3ooXcapocQdC2MjY6Z2ZTWpYmtqMqjh4IWDpKelj5gGvvEuCGnaVW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fYvT1/Ls; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fYvT1/Ls"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-399737f4fa4so2357290f8f.0
        for <linux-sound@vger.kernel.org>; Mon, 24 Mar 2025 04:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742814378; x=1743419178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3WP0bnIzPp/bKVB6iCB93JUW+VRZsKoHPmvfeJJHBNw=;
        b=fYvT1/LsLbI6OxTYIU6p7yL4L3OgGeAHqF011CqWDGii24eCK4/QBfrpT5W4bdOsmv
         RODIMrgPASe4Tj2/7d7HPA4BO0jUhWMS/Izvf9Hlq9OawvC2NIbrs8JgvKdsq4xYZ4xR
         gVx/3TAXsmNbTJbWVzLz9OHQVicrxa/u7HGgtrOec0i+Up+q+weYUfrHsvuPudrcZxQU
         Afr9S8H/S0xDr9hzrBvXrKyf8U2g1uW65pjPcewGf52DYMk3s52zQaja5q+nvqYJJXNv
         igWcCs5yu9yTexvAvf7LPJk7OzLZyeTdagnP+frY09aEsifH3KqOJt75nHiuwk79491a
         4cbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742814378; x=1743419178;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3WP0bnIzPp/bKVB6iCB93JUW+VRZsKoHPmvfeJJHBNw=;
        b=frKzJ33pvVyJLW6dmPAh86mYqlWsIDR15Hm92bNz4bqLLMwYOnrPxIZ7Qkh2G6lAOg
         J6Er+tSHQcy163A4gbBp7TavYU4it/1SuSeTUL22OCOtPp3M/4N9kFeqdBBA5ugaY6Ne
         PDa9AK47q17GoQSKgAMYtfKKtZzXpT8BYM+w2m0+/alEbAgpxIVjDKA7pru6walIXDAr
         FDWv3emH5RR2wMmfgsJfRl2/K6+FE/ZsF5RQbema1CP25AWOI5VvwM6RAoS8ywX9aCBA
         7GuDFYSlllJsJTs6JEOvAcRgmYbhZI3BjyoywNPgNcYmb+tFHYx/K+hQJ20/tkTI9r0t
         Up9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWMGDEjb/syIrsDYMfxaM02S+zLcaWnJC9svUJrzD4eKwhJfJ6oiS6ft9MqHE6D/VCbZYL2OrqUpLSbmA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwD3ong9w14zv1scphA0Qc2vQXHccSCnlcDrcwdplr4xehAWIqL
	npvBRZ8zmlEjgDYuBcSzOoHt7wsJugJ1cD1sXD8WN6dTG64xLXC3GZwgIA5xma0=
X-Gm-Gg: ASbGnctQNDkpMGSoNV2ycxSpz/0w8jG1vUoTH/zh9KdAvYAON5jl28rGAcNJxTMFYQS
	lx2GwRYRFgioiwWhwTDgnE1SjPduQ6lXUDieXWP310eA3ko5QQQK2WerTHTomwD7V8+4KwjQG8d
	3HOrrByWmc0OikqrE1hq9FOYvJgz8/NlIWEgou8npXsZ4FnBWQCtYalZCsV7kv9vv+eQPnhyBwT
	Ubqf+c2SS29K2M1TH0a3AwAv8S+TZKU89ACyPdw9lYlfZsLew8Y2aBUPVnJ/ebR2FtJeULIoH0i
	W4MFbEci14REa+0EwwxSojxPrQDNnTzhPfohIJfM77SEnN4p+l6F7M/ZRWGo6t1GNsTqRj8cQBp
	dhTri
X-Google-Smtp-Source: AGHT+IGW+HXesDe2Nb6k7C43YiVAVslLNYvXirFy+tXP9WmjZ+UJP/9gumiDNsak+/cyJra/6fapvg==
X-Received: by 2002:a05:6000:1566:b0:391:3291:e416 with SMTP id ffacd0b85a97d-3997f903a53mr11643747f8f.19.1742814377893;
        Mon, 24 Mar 2025 04:06:17 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fd28a46sm117236055e9.24.2025.03.24.04.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 04:06:17 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: peda@axentia.se,
	broonie@kernel.org,
	andersson@kernel.org,
	krzk+dt@kernel.org
Cc: ivprusov@salutedevices.com,
	luca.ceresoli@bootlin.com,
	zhoubinbin@loongson.cn,
	paulha@opensource.cirrus.com,
	lgirdwood@gmail.com,
	robh@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	dmitry.baryshkov@oss.qualcomm.com,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	johan+linaro@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 0/6] ASoC: wcd938x: enable t14s audio headset
Date: Mon, 24 Mar 2025 11:06:00 +0000
Message-Id: <20250324110606.32001-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

On Lenovo ThinkPad T14s, the headset is connected via a HiFi Switch to
support CTIA and OMTP headsets. This switch is used to minimise pop and
click during headset type switching.

This patchset adds required bindings and changes to codec and dts to   
tnable the regulator required to power this switch along with wiring up
gpio that control the headset switching.

Without this patchset, there will be lots of noise on headset and mic
will not we functional.
   
Changes since v2:
	- udpated bindings as suggested by Rob and Krzysztof
	- cleaned up swap_gnd_mic callback
	- updated mux gpio to use dev_err_probe.
	- added Tested-by and reviewed-by tags 

Changes since v1:
	- moved to using mux-controls.
	- fixed typo in regulator naming.

Srinivas Kandagatla (6):
  dt-bindings: mux: add optional regulator binding to gpio mux
  mux: gpio: add optional regulator support
  ASoC: codecs: wcd-mbhc: cleanup swap_gnd_mic api
  ASoC: dt-bindings: wcd93xx: add bindings for audio mux controlling hp
  ASoC: codecs: wcd938x: add mux control support for hp audio mux
  arm64: dts: qcom: x1e78100-t14s: Enable audio headset support

 .../devicetree/bindings/mux/gpio-mux.yaml     |  4 ++
 .../bindings/sound/qcom,wcd938x.yaml          |  6 +++
 .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   | 25 ++++++++++++
 drivers/mux/gpio.c                            |  5 +++
 sound/soc/codecs/Kconfig                      |  1 +
 sound/soc/codecs/wcd-mbhc-v2.c                |  2 +-
 sound/soc/codecs/wcd-mbhc-v2.h                |  2 +-
 sound/soc/codecs/wcd937x.c                    |  2 +-
 sound/soc/codecs/wcd938x.c                    | 40 ++++++++++++++-----
 sound/soc/codecs/wcd939x.c                    |  2 +-
 10 files changed, 76 insertions(+), 13 deletions(-)

-- 
2.39.5

