Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7071C27FB12
	for <linux-sound@vger.kernel.org>; Sun, 21 Dec 2025 09:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766309820; cv=none; b=TvBwlAxEsu1e3dFDQdz4KIjQw8D3/K/Z17+/xe6mI6ha7BWTEcA7vlSxp8+nB0KS/d8a3mwUP8hUHhXQmj64dnxDg2nhmgwsBc010ZKgAiOEZS1xvDhdRdvcFVVbfgQXJk0mdVYH6cafJ4fzJZMueynAjYRU3WQSswGSOffbNLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766309820; c=relaxed/simple;
	bh=mjOv/Tov/J+hpGHcb49MekTvZZfF0eTnGqqMKw/v44k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Uxh3gHv45aT7ZBltb+mrxVhy+4+QUVFQqFYQi8oQ/4Ln+9kUSVp0vXC2xyAC1xSdCeRlCaojCHSaSidEkpyOIgumSKtWm0ct66q7zLW8W8hhugcsdHRgyitabZLXKfpeCS1IK6U2XjOvunZ+1cDs5LRdKPHCKp+ePjd3uLR0epw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D4X6UUBt; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D4X6UUBt"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2a09757004cso38215265ad.3
        for <linux-sound@vger.kernel.org>; Sun, 21 Dec 2025 01:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766309818; x=1766914618; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oXu17unAaFSnbyi+Zk+8K05FQ3JomK2ILh566085Hbg=;
        b=D4X6UUBtks6CyuyNrtf0kqp9j8kd0G+JCj+BLzSVapIjwuh9eF5G4ewtN3kelf7+bo
         vHVKV2pRcG9IgdDJSiGbHjNnDhP4bx8w233vtDccpzfurYazkWmlWiW5l9P8sTYEnGmY
         sbcSSkiinV04ClYgK+yJc++awmuu1ZRNWdI6ii+73l6Fs1frP5qyxpKGyTFNIhrOBv/o
         M/+Tq3kTYg6wMsUZtnC/RMoohq+wU0qI6i3QjStG6owpiybgAqjGDexN+n6yOjxzELw+
         2kVjt3x5k5y0jWfssmGj3tQXij6X9DKDP08EfdcrX4GSp22hxZUFMgmHjcAliZC6IilR
         AUvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766309818; x=1766914618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oXu17unAaFSnbyi+Zk+8K05FQ3JomK2ILh566085Hbg=;
        b=thMZ1eGK35CYvsLUFsMrmVKXGEHsV0YoRP9vXle3/+jt3QaSpiWZGAzxTyHur0wOIZ
         PxjMHn+6zNpwYmXi0BetdQzOx5FvCPtd3yJU8SZgIZBpKa1hfWMvUwldPDghvIzAvpEf
         K00GHFPGzh3DAZtthZ7dDlw27cqKnChjUiEbg+7Gdk10a7O3YoUqlEfIRWhx9aruYtLi
         WK8SPSYkGdp75lseXBxng6jrYwTa55pZD5K390eB3Fx2pt4Z6CdvHL+J1w6DoLpLPhNh
         w80NMBqCPuI9+FlgFXZ24RAYhgnhDzlBRpO9tZoX5oqsEamZcSf8BuoJM4ai0xgc6zR4
         fYdQ==
X-Gm-Message-State: AOJu0YzoAKsgpfTCl35pY/IWhguHQDEdMR0wKQd6M9HeV2EQ4FBgRDCz
	WM9HvibmVzbF+LavzqmRJeV1Xd2tXVUFsN7MKUDoNWoRlScTSi9DItSL
X-Gm-Gg: AY/fxX6d55FP4hFgXL6b+WN4FouQCZg8j0/qufEb/U3jWG0nNnoGNnYc4zT13C4mtDI
	xpbmue/D2k5rSc/e3JMEMb/YUeI3ZNnKpvbH3xRlxScYFsap6pMd+Wpm06FxpPKSqchEtC8fbw+
	c8HCg/hSCryk91x8kwTzCKRBzCeMt4xQx2kozsOouHYtEKfYhYe5JlP97GiUKkSoSqVexspuWzD
	8c2BE7JG1IG2O4XQMFqmZSM05Qj/IujVA11TAaevpZ9ePMUH1VQo61WGFS/Q1HN343YJBxJXToV
	5XAv5AvlslOmGPmfO0Eu+UwUAlbAAiyVw2d/+82feU00E9CTV6N8rDqSqKQhHLvV5CCsDoy7sWZ
	b+Tm2Hg22YciQ1FJd0Wcdi4lOKl7XDaZZ18wK8h/8/i+PR3tmBrvFh9AzAw032fvewpWXyZ9SA7
	SEUjY734jBTU7XdFZ0W5/c6PgKvVJ4HZVIH1EbS8f7yKPgOqLYe/yBWEOMsy8vZs2TgqtDW/kg6
	72UdXbwcjcbrMW2iKztruibbpyMftyNDHEwa2bO1cLxnhpNQxqzifUipay6ADiJIAF+W+3kYA5h
	sIcIOKqdBFi08X8Z0ojf+adM5wQuhwzC8dykh2PP4rzzb3dnBk8=
X-Google-Smtp-Source: AGHT+IE9k5fjbxVuGHt35PQ2dBtJxutYciuw15r6xi7up9QtKT9LAT9dU495uEoMz6Mf8cwTHCKz/A==
X-Received: by 2002:a17:902:ce89:b0:2a0:de4f:ca7 with SMTP id d9443c01a7336-2a2f222add8mr78300875ad.1.1766309817611;
        Sun, 21 Dec 2025 01:36:57 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4d363sm67629495ad.62.2025.12.21.01.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 01:36:57 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 21 Dec 2025 19:36:00 +1000
Subject: [PATCH v2 4/7] ASoC: soc-dai: define possible idle TDM slot modes
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251221-tdm-idle-slots-v2-4-ed4d96413aec@gmail.com>
References: <20251221-tdm-idle-slots-v2-0-ed4d96413aec@gmail.com>
In-Reply-To: <20251221-tdm-idle-slots-v2-0-ed4d96413aec@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2335;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=mjOv/Tov/J+hpGHcb49MekTvZZfF0eTnGqqMKw/v44k=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJnu+yc/yutKemkwZXlY9yK/5pRenn0/JK9vi3E23PHj9
 rFvd3P6OyayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKhjrGPEwMUpAFPdF8bw3z/6pznLMVbdZTsX729YcvnxuSJLKz6mWU9vrzHWEMiYUMrwP0GFtep
 N5r9rKW8nhSZYHJ+mwbvD2srqxs45k654uU/+ywIA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Some audio devices, such as certain Texas Instruments codecs,
include configurable bus keepers. We currently don't have
a standardised way to configure such hardware, and instead
rely on the hardware initialising setting itself up into a
sane state. There are situations where this is insufficient,
however, and some platforms require more concrete guarantees
as to the state of the bus, and being able to explicitly
configure bus keepers enables this.

For example, some Apple Silicon machines have an odd bus topology where
the SDOUT pins of all codecs are split across two data lines, which
are summed via an OR gate in front of the receiving port on the
SoC's I2S peripheral. Each line must transmit 0 while a codec
on the other line is actively transmitting data, or the SoC
will receive garbage data. To do this, one codec on each line
must be configured to transmit zeroes during the other line's
active TDM slots.

Thus, we define seven possible bus-keeping modes that a device can
be in: NONE (UB/as initialised), OFF (explicitly disabled), ZERO
(actively transmit a 0), PULLDOWN, HIZ (floating), PULLUP, and
DRIVE_HIGH.

These will be consumed by CODEC/CPU drivers via a common DAI
op, enabling the explicit configuration of bus keepers where
required.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/sound/soc-dai.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 224396927aef..44dd06add52e 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -52,6 +52,21 @@ struct snd_compr_stream;
 #define SND_SOC_POSSIBLE_DAIFMT_AC97		(1 << SND_SOC_DAI_FORMAT_AC97)
 #define SND_SOC_POSSIBLE_DAIFMT_PDM		(1 << SND_SOC_DAI_FORMAT_PDM)
 
+/*
+ * DAI TDM slot idle modes
+ *
+ * Describes a CODEC/CPU's behaviour when not actively receiving or
+ * transmitting on a given TDM slot. NONE is undefined behaviour.
+ * Add new modes to the end.
+ */
+#define SND_SOC_DAI_TDM_IDLE_NONE	0
+#define SND_SOC_DAI_TDM_IDLE_OFF	1
+#define SND_SOC_DAI_TDM_IDLE_ZERO	2
+#define SND_SOC_DAI_TDM_IDLE_PULLDOWN	3
+#define SND_SOC_DAI_TDM_IDLE_HIZ	4
+#define SND_SOC_DAI_TDM_IDLE_PULLUP	5
+#define SND_SOC_DAI_TDM_IDLE_DRIVE_HIGH	6
+
 /*
  * DAI Clock gating.
  *

-- 
2.52.0

