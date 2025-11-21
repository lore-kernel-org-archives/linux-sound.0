Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C96829E10C
	for <linux-sound@vger.kernel.org>; Fri, 21 Nov 2025 05:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763703953; cv=none; b=FjlHtg5778nONic/lx4Yy7TSVNz83lfgdRgIPUL+7SZDE0m1687GKNn9zG5lM1ujt6lM5vwgKEXIDGN57RdyyB0Y0eZyaSr9ve4/oBOrPab0bI6Yt/4VxQmwQsG6oTrXLvjgfsSDiRFkClOz9734iwiq4jVbnoWQaibEUJJxI8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763703953; c=relaxed/simple;
	bh=6yaCyE/J7ah65HyMivs7ztqv+3PsPYnDamRQJkcEcY8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=X5CCFI/pN3Xo3aP7pE81IMWURXdSwYhKWzB267y+I/YWbv1NIsp7aUZ9lbapI51/SLL3csSKJWqZ8b4rJs91F6boOIGFG8i3vcHpysc7mzLez5fOm4w40bzU3AdPhXPbPgqF8ZUBNIdgAsiOiPyh8BHhm4XunLDiWnv+b5aN2nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WkXzaY90; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WkXzaY90"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42b387483bbso1064423f8f.1
        for <linux-sound@vger.kernel.org>; Thu, 20 Nov 2025 21:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763703949; x=1764308749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=uJbxIqEiqm1f8qF16st2qXQheMIfNt3xVg34Igpt82U=;
        b=WkXzaY907MXiJsH5tkMKuGPEKHtuCTspPYWWzXSM/uKPz8PgdIE3Iedu7QR8KeRw6h
         B3khp3nANwXj0MzaIEvzcfg+QmRF7eZ/k2UI3DuvzpM6SibO3S7gKGIzKIAwhO+cncgJ
         8pEYdZjjGRz4uiXTGgF+csiwTESOw1ZMhPNkU7gDhpXcoMtoJSjcTswC9KEpWBj5Zk4z
         hJYo2k6zCaydE6okuPLKwAAqa8E7ig4aeXgY7fgRBI05/JpCvSGmB/Rkx2cCtaY8vulp
         7QmuSJ6Zus+B2tL6N6Zy+Dd3f2i6iGt9a75/cHn0YdI/3tCv7pfRi2AHJrYdjbDRebaV
         RC6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763703949; x=1764308749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uJbxIqEiqm1f8qF16st2qXQheMIfNt3xVg34Igpt82U=;
        b=BhRGYyCXAPghNvh9Zf46wNMUmJ9WhJ8kb0Eg6hdtXJz8zhAXwZ4nRjNDRHoEZYZCOU
         gTP7fydQiU277JUOwpFjUm866lLDUE5xF6lx6KskI9G4yxvrnKo2q8O/ZoTA0IpyM/R6
         yJppARZqtqaL7wWcyqEvXiGc2edK1uQz2kvFW1SaWCN+BTQ1qQ1K+qli8l5P9SKzjVOh
         VYpP0slC6tfXVSt1q2GfwC6gPHumRaYsEo9FmzrjZZNw8u2WsPhzbJM0b45dI69dsmMq
         PiS5HuZOzGg/go29OCB5W2TiLI4bcPkWCLiT0qhY4Ppwoel4CV5Xt5MB/jvRB6l+tYKq
         HlWw==
X-Forwarded-Encrypted: i=1; AJvYcCUAwdVopfOcPDWujcb1j/NRHU5UjJMIIqE9gTlVRuh59DNev3UxwasTDUMYmEUPrknMdD2z/I0iOP9QHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDT65aXyZqkjluc/HHyn6I+v+Lf2Zng4jWwcBFC1K5LRAAcvNt
	6o+Z5obG3M6ATvuV2YhhTbEwvI4YVJeT9+fEhk9rUTd+lY3+9uApuHts
X-Gm-Gg: ASbGnctUF1frnVsqFUoXkzqBlX96YEJVY48j3NZMVXdxfzK6MGkuqVBPEc10Iv9HTax
	30oDowbgIwC34aiS6Rm0v/H0aZK92i0HhK5KenEnG11hjdnV/lSugJ7KwCkA84IwDOZAQ9CIf21
	lAo0HsENpTeP8sxwRzwhkWIdgaRheXzaoLz6deX3xmL5GdDP6JK4Lh3wKKUK/HM50MAVBrfZU/9
	BEFUodIWSXMoqJRAXIJcfbmG2RZTYynwuO8LjNvJ8atpOqqTMg+WtObcBFxgdJwcQFSSuB6mCM3
	WzTbncEFytUnAFvECI8KQPBMh+80l7/1/J5IYlxySwees8heqKIH3FlJVu3J7cRcVdZh0I2z+nf
	8f+r5R5oKEBi8UqA0Pv0MB9zlMNB7tN9tvRJWNLiiV5RwEk0Vr9PRDWatp2IqvPqBhoR5q2iXXW
	KPuhIakryJfb2VT7QZWgAoJ2S9tNnJfgzvnvFy2EFa
X-Google-Smtp-Source: AGHT+IHRFaiUyVpXiQGxAycMp6yKMdInYPmebcx1lHdJv0Jzj9BEBBTmyVen82ZvCHfumXjJ/rAv0A==
X-Received: by 2002:a05:6000:2004:b0:42b:5406:f289 with SMTP id ffacd0b85a97d-42cc1cd8f27mr741379f8f.3.1763703948284;
        Thu, 20 Nov 2025 21:45:48 -0800 (PST)
Received: from Ansuel-XPS24 (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-42cb7fb9190sm9239273f8f.33.2025.11.20.21.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 21:45:47 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	upstream@airoha.com
Subject: [PATCH v2 0/3] ASoC: Add support for Airoha AN7581
Date: Fri, 21 Nov 2025 06:44:58 +0100
Message-ID: <20251121054537.25796-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add all the patch and documentation to support Airoha AN7581
sound driver.

The card follows similar implementation with Mediatek with
the codec present on i2c but with a simplified implementation
register wise and additional frequency supported.

Changes v2:
- Fix wrong edit in MAINTAINERS file

Christian Marangi (3):
  ASoC: dt-bindings: Add Airoha AN7581 with WM8960 YAML
  ASoC: dt-bindings: Add Airoha AN7581 AFE YAML
  ASoC: airoha: Add AFE and machine driver for Airoha AN7581

 .../bindings/sound/airoha,an7581-afe.yaml     |  41 ++
 .../bindings/sound/airoha,an7581-wm8960.yaml  |  67 +++
 MAINTAINERS                                   |   8 +
 sound/soc/mediatek/Kconfig                    |  20 +
 sound/soc/mediatek/Makefile                   |   1 +
 sound/soc/mediatek/an7581/Makefile            |   9 +
 sound/soc/mediatek/an7581/an7581-afe-common.h |  39 ++
 sound/soc/mediatek/an7581/an7581-afe-pcm.c    | 456 ++++++++++++++++++
 sound/soc/mediatek/an7581/an7581-dai-etdm.c   | 371 ++++++++++++++
 sound/soc/mediatek/an7581/an7581-reg.h        |  61 +++
 sound/soc/mediatek/an7581/an7581-wm8960.c     | 170 +++++++
 11 files changed, 1243 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
 create mode 100644 sound/soc/mediatek/an7581/Makefile
 create mode 100644 sound/soc/mediatek/an7581/an7581-afe-common.h
 create mode 100644 sound/soc/mediatek/an7581/an7581-afe-pcm.c
 create mode 100644 sound/soc/mediatek/an7581/an7581-dai-etdm.c
 create mode 100644 sound/soc/mediatek/an7581/an7581-reg.h
 create mode 100644 sound/soc/mediatek/an7581/an7581-wm8960.c

-- 
2.51.0

