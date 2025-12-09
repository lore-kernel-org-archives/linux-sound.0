Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769852E0910
	for <linux-sound@vger.kernel.org>; Tue,  9 Dec 2025 09:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765272724; cv=none; b=FW3hFsWowvXoEFlZ5ylul5JT+TKdZKnzTAOAzraubxP1lUpO1gwtu2RGUqYGmx/A5aWGCLeiK8ddZ70eOjA8FvE8r1YV2QbLCIilq3UT3zzeb8DFH6PSQrexJlN7AnzfviQEpbfYJ+yHUdMgtnGdYu68NFpoeFll+rvNJJj+hbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765272724; c=relaxed/simple;
	bh=9BrUquyvgfOE5tXuWI9JhhGZxPBE1kg0z2Vo1M4aQHc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lKu0jcGtcEsJ/S5rj877xp6pcEaTUJ+H72+zfGKZXg2zvVV1pbouyvwOwcc5u5QwuGHpmZPKSIaEbKlZMu8T9GUSCxNGLEvyWStrQdaVJYXaZNkQjuY+e6nNzQFtPyjNxSjESwnuNV5521MoLVsRfrea/eVQe1bAuyZkcSgaxxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WdKPcsxJ; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WdKPcsxJ"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-343684a06b2so5688333a91.1
        for <linux-sound@vger.kernel.org>; Tue, 09 Dec 2025 01:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765272722; x=1765877522; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X/homEcZK52uy44aasdrENOooGOE5sAlOYEfUkV5W7I=;
        b=WdKPcsxJt9kZ9NmSwHfiLHuEiVZvUfhnJDSR3rb0xgZguqSZFVMmxkst2wanW5HGTv
         BSyExrwCzdrm9RgjCUVX9RWZ4J2cp/QK/hE3II3aBH1++Yzvqxc/yqx6l/7LA9Lz3FBJ
         BOxk3xWNfQndzPJ2E/xXxjFhoZhVxuVr4tdilLHbbLyYLqXr/denGDnhkkowKwdO2QGW
         3sJxW5J+z2+EVRGh7ijmI1Wka+fY4GrRfzfS7d6o3CSJW8gLO3UsC8WM+5oAAQ/tpMO0
         uldWJHeKlPypdJe0MFlGiPnnWTQdueUnPSU/Tv6ImgkhG5vLJCo33zTDy0c2qhqIQttj
         I4nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765272722; x=1765877522;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X/homEcZK52uy44aasdrENOooGOE5sAlOYEfUkV5W7I=;
        b=jwsOYIeiS8q/ILdLdwiTbfbp47wR5OOEWDNL6D0RBAUoHlDdyksoWVX7yvTOxthUXx
         kRv0KiEID6xkCpubq2KeXKH4Nmj8MdyKfrWkwhsKNEiXDCEej5BshHuAxRERktJ8ci3T
         hQ3HC/Bd+4deUvf8bXNGW7+6EI1FBL4wTdEcscQeZ+4WLrZPbP66636o4qwtVVs4tAUG
         SJUWX7u2OVtqaWTLFrp8Wa7lfrMi7GfhKCw50mg0QVU67AutJj6QXHMzov/4jjudd2pq
         BgLpZ/V6H1tdOe1NWOSLXAcW5+MSPJIq28dNRQDb+XugQv6wjSAL4KSJox7lmTxAoj2P
         YlUw==
X-Gm-Message-State: AOJu0Yxz46VLsPOq+uupjn3JYYCws5/2qcRGiqgmKyTQERlYR/+qfzbQ
	Hf899zEzRaN1lax4OixnahYZYSPMqRqLR0H/kKAaZFIMlcGc9gzRuWk5
X-Gm-Gg: ASbGncuj6GEtE83xStIUKb5qFMicUZqfMafX+4oPFRUpVszbrbpeG0V7PpQWUbLA0hj
	ehf9kM/UOYbCBUcpnCl2O1D6b8HX2HjJMiNf+JpOsqUjY4ohpbnR8eX4RVG4Rua8FSkxLAfmwST
	B5qsw97gUm1d3dsTKghFvLcyxtewHixJ2nD4XtwDtyZphytWOJ2LKHQ1mvGBjUirUsG0qluCGai
	wfOJhplyHpeyk8WUgiPksSGy4bpVY4EXdIXiWOCZk0NJtkyLjS47dRWwRtnNvbKG4yzojuBRxUu
	JdHCb5WhA0t2ZdRqtDuyvtL1yjKrH7mxwkcuncEuwSmF1ZD7VGcOdg9JepaerViK/B0gHzEtU4P
	5x1MpJJ6JNpJlPwWURYeanS85CKXSfCYMVvvpbIyYB9/+m7lcFfDRp2JlXBAdYzvV3wOJ+Bgrey
	RmaJpfRnybAtSEZ4Mv/glok1qclnMNMU3MbHYITDHL5X/2Dd0xWtczcncpZuy4AnDBKRZAP0yLq
	hRzFIUAZkPHRG/O+NNAxSvpRZ/tNcuyRCkcmCncXVcwUcCBcF9Cra4tkW48clwCCCss4qeA4G4N
	UhC0HslJY7ESYMSZk0QV/OIGE18NSKRowfHaiAdjeTcygNJtsRA=
X-Google-Smtp-Source: AGHT+IEwaeD0b9uHojQWY3Zj92Hr/X5acaNl0q97VcOUGKTdKrWTewUu7dv7EFYi+rSt77tp7bmfqQ==
X-Received: by 2002:a17:90b:3e4c:b0:349:3fe6:ab97 with SMTP id 98e67ed59e1d1-349a25c00dfmr7898399a91.22.1765272721737;
        Tue, 09 Dec 2025 01:32:01 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a49658704sm1800408a91.6.2025.12.09.01.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 01:32:01 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 09 Dec 2025 19:31:17 +1000
Subject: [PATCH 4/7] ASoC: soc-dai: define TDM idle behaviour modes
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251209-tdm-idle-slots-v1-4-38dabf6bc01e@gmail.com>
References: <20251209-tdm-idle-slots-v1-0-38dabf6bc01e@gmail.com>
In-Reply-To: <20251209-tdm-idle-slots-v1-0-38dabf6bc01e@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1797;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=9BrUquyvgfOE5tXuWI9JhhGZxPBE1kg0z2Vo1M4aQHc=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJnmb7Llv+1kaVUxfcu0Lyr9iOuUFcssFQvk35ZxHPLV9
 3RbufdWx0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 DXWMdYwYuDgFYKon2zD8L7p27p9KpcGMFdc2Tp/u92VGWJiRQcaf/Nf1cy5fVDnAEMHw32uK5pn
 yTx4z157KdWEontG08r7oaZNUBtm2Xccmfp7+gwcA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Some audio devices, such as certain Texas Instruments codecs,
include configurable bus keepers.

Imagine for example two codecs sharing a bus. When one codec is
transmitting, the other must ensure that it is holding its side
to 0, or data from the transmitting codec will be corrupted. We
can trust the "idle" codec to simply do this itself, however
this is undefined behaviour. Some devices may leave the line
floating, others still may pull the line high. We need a way to
control this behaviour.

Thus, we define five possible bus-keeping modes that a device can
be in: NONE (UB/as initialised), OFF (explicitly disabled), ZERO
(actively transmit a 0), PULLDOWN, and HIZ (floating).

These will be consumed by CODEC/CPU drivers via a common DAI
op, enabling the explicit configuration of bus keepers where
required.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/sound/soc-dai.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 224396927aef..a5784ef8e3f7 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -52,6 +52,19 @@ struct snd_compr_stream;
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
+
 /*
  * DAI Clock gating.
  *

-- 
2.52.0

