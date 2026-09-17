Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3659C495AEE
	for <linux-sound@vger.kernel.org>; Thu, 17 Sep 2026 21:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789678964; cv=none; b=p4M6IyFhnIvexTLJf6mhVhJqpxz1yLiy7D545tcr9clJQIJa7A7BmPXISOD+SnGlJkKKGhaKDzcBcs3zv9E29WsZ8b0e0nlfjBX4RT/IncTuGjMsrduK4o1VCWOhGim/k7XWICsd9qo72imYhCCLbK55wyKfXwxr4nrmrXLBxY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789678964; c=relaxed/simple;
	bh=QQUrE+DwZ1KWpqLSQpoA8URn9azrBBw3jC33CI+5l4Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bB3Ap4bv4iNefIRG2naAcN6hiSh2wFiQEHsjHG2JCb0ZBbR2ba/AwKCql97+gYX1lMLhLBAoy7EXkUcOeh+Wt0i9QiY8frmvmJ76ZvFK542i7gLmp4iEsLVOM7KL86l8RVs+ipN/7jv/cUu4iTa8iVz3TrQlyRlWDst0uL0NRLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=kvMRcmRq; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="kvMRcmRq"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e8185e037so445655e9.3
        for <linux-sound@vger.kernel.org>; Thu, 17 Sep 2026 14:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789678961; x=1790283761; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3jbM+/xCOFHz2ekpLk2drdaMa28onD9DLLAyaB1dHZ0=;
        b=kvMRcmRqM3DL8mI5LTcS+zb28kEG24CbsM+8fVvbf8mXh+RTGiMrkPCCEtGozIWgLO
         1bydYgn0WBOW9DaHmq9es5yrmM9GvFNlymBFBY2+C1qXtHoiE3heRxOBTxDv0SgwF1zM
         r3qjRXwr+j6/zBEnNdlI0PAwu3Fch19NqKGr3hCWjTTpvXvsOfMQ5vAJe4gTiBVVT/il
         EGVXjwV9w0bZf73kZbJE/hmqU+dkcWMeH/2PdNfXy527xk9BTykyhO9a6o/JsfdWUXso
         /3allJYPE547ttQHhU7REsX8KWDUSbAdywX91VcCpMw9GnuXD/xWvrkxQb621oLhVn3u
         K8mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789678961; x=1790283761;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3jbM+/xCOFHz2ekpLk2drdaMa28onD9DLLAyaB1dHZ0=;
        b=dDHfhSup0QgiQTpdtQa6LI1S61M20PXTPDXNRtTek6d+8LHY/3W9fwR7AfVfGQvSQX
         h1wDLAZhNcZW8jGGy3LZEJlZkq/aOaQvhZF1pdA8F4BnMGy3z6qVc+6k1g1/EnJc2dGT
         w9F7T1PLWybv1ldDU9LAB/DilMoTEZPnAsOXQnyoDc+hMIktrSA1JK5Yc3LQ4GGLAHwp
         Ur6LGAZZ9i7IaJcRFeM/R9eb3+ISEpRazeMKSQPAuoFUrAR2ZMvUdxHWZ9bx7yq33zsf
         Q0sscF08vZw1nE2qOSFkffakkUSew7TOEeqGuTph646c4EySg4GhVIc2+WsFwsumSL9W
         grJg==
X-Gm-Message-State: AFuF++ljgGa3Pn6eEFuJqQJb94UG2uE+2u0rwMBT//juoasbuOCP49Ro
	RcbsoDhkBXOFoGB2qmL53gyZ35jjZikYayxd1je8zYgdlf03BukDp3WUaVa1RkP9M0E=
X-Gm-Gg: AYBFou0fik7ox/DmNXDZ+bSAwE4Z3a8WbMTlBq4tkxDLvrmA6fldS3r9xJs93StmMYO
	6aPfhRvSeGWMxmhA/pPFuVtgRUfg8RorRHSJRcV7wW+EF3crqc8VoFtJ6XzkTlcxOFTmrF21nTd
	YEvXe5oXh1Q0gQ0dArIxZWhtq1n2oxcBgPfXbK2VkHyaRXw4+mpqGmwNYOorsex3LoF6laK5MIP
	b9z7mbEzHTqn0bnDx39yXM4c/ipftnJrK42cJQ+qnGEn3wDzYipcW4XEPBTpNctXMvig+H+GsES
	5ynvLZTCB/cYTlCVkv14t1SL9wgzsKV3MfMfPrOE8k8y67GdMmqDlfZFpE53tIO8Az57y4QMCkb
	aUqaTI97y7+s0jdmFzSKxwLrxAk3HUbVPrNY9yntP5MpvBLMHGN98qdJhzihZjEHb1LgH/fY5Hi
	Errk42D92Amaf0fO0cMRQMwnNEgeeBBWdP0TDSz/x3CDbBexbkJqz3AuY2OmHvV1t4pg==
X-Received: by 2002:a05:600c:1382:b0:49d:1d7e:4085 with SMTP id 5b1f17b1804b1-49fc5750e24mr1268555e9.22.1789678961573;
        Thu, 17 Sep 2026 14:02:41 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.87.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc5755c40sm3106095e9.3.2026.09.17.14.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 14:02:41 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Thu, 17 Sep 2026 23:02:32 +0200
Subject: [PATCH v2 2/6] ASoC: meson: build gx-formatter as a separate
 module
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-audin-v2-2-38de4bc1de34@baylibre.com>
References: <20260917-audin-v2-0-38de4bc1de34@baylibre.com>
In-Reply-To: <20260917-audin-v2-0-38de4bc1de34@baylibre.com>
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
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFlrQnO/ntzvH79Q1yg+wHDPzcDdgsyPt4S7+TmzcyTnS
 q6tPyjRUcrCIMbFICumyMIy/d7vglK1h8YJJwtg5rAygQxh4OIUgIlMjmVk2D3tWLfIEYmnStLP
 /m/gO1Gyv01q+5md1iVJinUf3L7fWMrwT/X1lLkaX47s9/Cy4d9UN/tG6+v8jQampY+YJrX/q7X
 p4AMA
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

