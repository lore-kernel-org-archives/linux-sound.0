Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF163E49CA
	for <linux-sound@vger.kernel.org>; Thu,  1 Oct 2026 16:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790870802; cv=none; b=Z7vUfs0tQSDMNwIIfMxCRjpTbEjm9IXu5bZuXaTSJoUE18Y5xyxNwuz658wNipA+6PJaK1t70DCvrrkSDI3dz9TCJ3CvjvLDe5Tj4Yg8hKv1d8BtdQvukE+4B26MyBAmXYuXUrfgzwf/PbChq18ofSy49fBkehnr6aUHQ52gXDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790870802; c=relaxed/simple;
	bh=QQUrE+DwZ1KWpqLSQpoA8URn9azrBBw3jC33CI+5l4Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CCcQa6ddhn7S6DMnZMk297ODOc8yQJgp3TkJKV+XjWWvX8Bsgo0xBORAlWXfn1Jl3S7x38qTVB8BLk/2KjR0u6luA8GUIL//95YOW01rjxRd+4DQ6aH5pRBVfOs6BDyr08zO9Ab/7ln7AgPU4fhC0fxJ9p7W8rms+YfPvAHa2q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=eGnRjpbu; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="eGnRjpbu"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d8239so53935815e9.0
        for <linux-sound@vger.kernel.org>; Thu, 01 Oct 2026 09:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790870799; x=1791475599; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3jbM+/xCOFHz2ekpLk2drdaMa28onD9DLLAyaB1dHZ0=;
        b=eGnRjpbuPPuJzW9JDdZWDid7S37OhgI3Oq3irAIl5hgl6oL3K/OrUJYDNBwdRPmblO
         m4/sL4/tvcWfkN33Q2XMRyHHOq5tysx3DM02tiE9knFh/3M+truSobV8EDdpbOLZnAL5
         3pDFQqH20uz2RxqKf9PYFqS3m3IDQ7cp+ezjckVrM+u+k2PLm3pFWQtJ5A9WsqxfqDw4
         AC/Z1fo3ymfn9B6VKiA0pA2vzuMvYSDnd2nBE3q1tDl8Ev7ohkSZQYsXVTgWK/8/M72g
         4VS4aVkfJ4P8mxnnHQFV2WBlhVLyJSsr9xFUnQgFo3Xcth9vXIQ+yP9kBpWnFbZPFHVI
         eUrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790870799; x=1791475599;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3jbM+/xCOFHz2ekpLk2drdaMa28onD9DLLAyaB1dHZ0=;
        b=bCgskxB0m34/8pPDyOs5qnhTyntYfkY/MEskFGYrQc01Mae7faVqOtGLAe1SznKzUo
         q462bruIdwjKKyAseLeXoHSR8U79zaJRVv3Mutflo3jJhW4tZIXpTZkUIrTMIkLGeiqh
         7uLuXfbEy5SYWI4KrrJHnK+lNUU8vAovc8i0mItuciQvT3x3ARWagwRlmjuYOw+vr8cC
         +NPMd54q39oUJhSETmdkbHTbDcuagpnPoTg8WeIwvC4BYMqjpDglJJUoaru8LfsR9/kx
         In8fcKdyWe0+4zyIO+j4TS+QctYlulSTN/bV9CXr9kOLGnst7qlcq6y1M1kuo5U6ZnQx
         jV+Q==
X-Gm-Message-State: AFuF++kxlhshdgm5w3xsq7pEJDUAZ7fgTBViwWs4xZTc0K8SpQHo0h11
	BPonZtFEYoMYYQvBhlHR3l6AECkd7LKL1l1ImrPMUpjTOx7ddnLNjfM7W/uX+RoQ6lU=
X-Gm-Gg: AYBFou3sG8Lb0eyQGQXnXO3nI1FG1tfDDNUUetVG+XvnTULUZEPGeI3MPQX3Barnoj9
	HbGVITHfpG39BCyw3OJcvSrGCtaoj8sopiYnc/c3DfCyvVlltP6TSUFFX2A2qZ3gUBamg/kCRZK
	nqIv/3RLMXb9fOpwTdCRw/ymswbekImZ1eSZqW/8BMlemfdJp+qwGhj29/SB4uOuaAstEFiLRAu
	SttFinybhdSCsAiMKW/4ott7Xa/DMki88mLtKLuEXBgUa32Hl1D629oPczng8uAyCyk9mcegP7p
	TVOMuVTnQ5bWtNcy0tamr7lNm4i0Sbzvq/i3mI0X3mFq55Abdj6BFlLow3Beba1wXAV+DZUxBml
	8UYkABhYgo5dKQQZLfQtkk8EOzrJG5gmxnSU6S4YGNBqoug3pHeILkeFNXkvhgKsmGxiVgolG5v
	QpBLuNPzsusJxQEjT3erhDZ1czWywQUdvccB72NUODSe6LQ/Bg4UbNCpMFJ3uQibWL
X-Received: by 2002:a05:600c:19cb:b0:49e:69ff:c6b1 with SMTP id 5b1f17b1804b1-4a0276a312fmr1303425e9.31.1790870799033;
        Thu, 01 Oct 2026 09:06:39 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.82.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f93ad0bsm52969705e9.4.2026.10.01.09.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 09:06:38 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Thu, 01 Oct 2026 18:06:27 +0200
Subject: [PATCH v4 2/7] ASoC: meson: build gx-formatter as a separate
 module
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-audin-v4-2-2476646118b5@baylibre.com>
References: <20261001-audin-v4-0-2476646118b5@baylibre.com>
In-Reply-To: <20261001-audin-v4-0-2476646118b5@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2113; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=QQUrE+DwZ1KWpqLSQpoA8URn9azrBBw3jC33CI+5l4Q=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFn7WrkUTqy4z3Vl0Q8e+9PveYtTTF9lnd4flmZ3N1Mg+
 KPFrNaVHaUsDGJcDLJiiiws0+/9LihVe2iccLIAZg4rE8gQBi5OAZjITVGGfzpNLgy3Jrp8Xbu4
 SGvmtN92qybPreZpDftuLXrS2fr5L3VGhm8e+WIVchvPN+/es+Pe0euZGhfly/fbFky+VBp/0qk
 jkxkA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

Instead of including it in 'snd-soc-meson-aiu', create a separate module
for it. This way it can be independently selected by either AIU or the
(upcoming) AUDIN.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/Kconfig  | 5 +++++
 sound/soc/meson/Makefile | 3 ++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/meson/Kconfig b/sound/soc/meson/Kconfig
index d9a730994a2a..4c40bf60dc4e 100644
--- a/sound/soc/meson/Kconfig
+++ b/sound/soc/meson/Kconfig
@@ -2,10 +2,15 @@
 menu "Amlogic"
 	depends on ARCH_MESON || (COMPILE_TEST && COMMON_CLK)
 
+config SND_MESON_GX_FORMATTER
+	tristate
+	select REGMAP_MMIO
+
 config SND_MESON_AIU
 	tristate "Amlogic AIU"
 	select SND_MESON_CODEC_GLUE
 	select SND_PCM_IEC958
+	select SND_MESON_GX_FORMATTER
 	imply SND_SOC_MESON_T9015
 	imply SND_SOC_HDMI_CODEC if DRM_MESON_DW_HDMI
 	help
diff --git a/sound/soc/meson/Makefile b/sound/soc/meson/Makefile
index f9ec0ebb01f0..1b1fbe8a0458 100644
--- a/sound/soc/meson/Makefile
+++ b/sound/soc/meson/Makefile
@@ -4,12 +4,12 @@ snd-soc-meson-aiu-y := aiu.o
 snd-soc-meson-aiu-y += aiu-acodec-ctrl.o
 snd-soc-meson-aiu-y += aiu-codec-ctrl.o
 snd-soc-meson-aiu-y += aiu-encoder-i2s.o
-snd-soc-meson-aiu-y += gx-formatter.o
 snd-soc-meson-aiu-y += aiu-formatter-i2s.o
 snd-soc-meson-aiu-y += aiu-encoder-spdif.o
 snd-soc-meson-aiu-y += aiu-fifo.o
 snd-soc-meson-aiu-y += aiu-fifo-i2s.o
 snd-soc-meson-aiu-y += aiu-fifo-spdif.o
+snd-soc-meson-gx-formatter-y := gx-formatter.o
 snd-soc-meson-axg-fifo-y := axg-fifo.o
 snd-soc-meson-axg-frddr-y := axg-frddr.o
 snd-soc-meson-axg-toddr-y := axg-toddr.o
@@ -29,6 +29,7 @@ snd-soc-meson-g12a-tohdmitx-y := g12a-tohdmitx.o
 snd-soc-meson-t9015-y := t9015.o
 
 obj-$(CONFIG_SND_MESON_AIU) += snd-soc-meson-aiu.o
+obj-$(CONFIG_SND_MESON_GX_FORMATTER) += snd-soc-meson-gx-formatter.o
 obj-$(CONFIG_SND_MESON_AXG_FIFO) += snd-soc-meson-axg-fifo.o
 obj-$(CONFIG_SND_MESON_AXG_FRDDR) += snd-soc-meson-axg-frddr.o
 obj-$(CONFIG_SND_MESON_AXG_TODDR) += snd-soc-meson-axg-toddr.o

-- 
2.47.3

