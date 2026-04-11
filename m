Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CA3389E18
	for <linux-sound@vger.kernel.org>; Sat, 11 Apr 2026 14:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775919496; cv=none; b=A9ke0rPkl4SgKThjNGZOKs4WKtZ8uvLn4iuHjIpRKVU1YLxHaKMl1jU8xF3AhB/fRPdpkUfmZyhy78fKUCn5q3CJU87qkiwPdZahEpqVKlp7T3zazN53eZf2MaBfoHHkbIeV3MibCQ9lciSS3WfS+MJ18ekMEiRxhzcPVpx9Dms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775919496; c=relaxed/simple;
	bh=2ntYm7/hmH/uH7c2NHvmQVtKZ8poNaDp8J/gvOxFEnk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bZIEVMVqoSUbSaMBNx62dYYuztLPuOVLSlI/L88kLgVwC1macclUqssAlj1r74RZPQrx/I9PyLmNt9GXo2/qF+7NkkxkCct0KUIZtiIKYcXSNu0HxWfj0iTJbfFtVSA6qO+g4VGle8TW64C12uYqYcq+Sdmv0d42Zz2s8Vu6Leo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=xO2gMGmO; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="xO2gMGmO"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48374014a77so41853155e9.3
        for <linux-sound@vger.kernel.org>; Sat, 11 Apr 2026 07:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775919490; x=1776524290; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DII7aCMHxbnEfo6qVNehUuDSdlZbo8e6WaMr0UUHHGk=;
        b=xO2gMGmO03TMIIxh26JDuKigo3E2SsVrhI0fth7ztBWS+K1d2p4fdyBLHefEPLgZdI
         l28SZMO0RI1Pqgx4KCjYik5bWnbtcx6J1UnfAHpOYkzUTGDmqHq/21b0Qn+PCxmogKzR
         y7B5IUOWVqEJnI1ekUGaitgKFZAkyf8CH5F+9si0tjmczrczmPtWyOrUXKF4q/76fUD5
         OhCY8TFjvUFDTT6D/9bqD4g0AIsgVMu6KseFu1+Zvd/f0xHV7IzGZmOX1PbG/wIRPp3y
         kakZsa2Bo691TTegG2sQ62+hrF7qSUmHYfKb5nCgM0oUKMkmDDwEcVCSa+vuA0n43IlV
         3gMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775919490; x=1776524290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DII7aCMHxbnEfo6qVNehUuDSdlZbo8e6WaMr0UUHHGk=;
        b=CKpS+kIe1EUHO2Ca62Tudew1SVSkTPQ2hizNEhTgk525/P4dknd0Ruptu+uIGzyagj
         Ar9pzqstRMrebxdxi5KiHdBq1Nd/CQIcfopzAl8x/zGnWocnllbur1EIBv7SlZCbtVeV
         RR4yJDAwEqBefhPNywebDWVAGn9PEqqjUmpo3pyrFMr4Xk71UCFbypeE54XqMoMXMPTy
         fI9+J2E4JgvwKl+T1bH8lGbJfHjm8BZoXWeGONA+m6V1+TdbxIwigpT+ve1UImO+etTI
         CGXM8r6shOG9dx4BOI9JmZrmJ++8GwhlSWadpmzVpHEeoGKdnwzGXNNMyFdUqy6ZnVOt
         PG6w==
X-Forwarded-Encrypted: i=1; AJvYcCUP7qRWXMY7TsmZSJbkWP8z6v8F0l+W3DTT6p90hS+AFcqfZfo2HoW4/DlZYsYfxE5Nb2Tu8GDLEQHDDg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAZLc5H0AvPufCDEcgg+7TAN+m/zw+V66k8DmAIVksBeleoE2a
	9Xi5s1gmgegIUY02lTbtVvac0cLfzuyCOzBWaieiWousk5sfr0NVUazteNw8n+ueZ1g=
X-Gm-Gg: AeBDievE4fp/mqEnNi5hRIb05Dqz3EwskkhVUR4XMTaEhaoCR9fI0nWNoaQBp4POnHj
	rMBtKvh6aHnx/Rfg+iZUGB7+Fx7XFZmCUAdJV0lffy+UlwNekQ0LCkTPv/a4tAKL0E2Yz9/qq6v
	YnTFap3yRvu8Xssk1nlnbT3xqijBufq03iBr+DiSftc9uzSls9+yBwUjNTfcotcZvc+2WRaJaeP
	I+WL0IX9y/q4865XEkgu4SWyFk86pPdheT6O80bFH3aSik9x7mRRhUQBbJdKG1DSEh3NRKdKou4
	lJ24k3y1lA+zhx/UtuT0xZQRur6LislYmmKOiKpkcb+7gIHkC3L+jfp0wMhvUISstBcYJloQYfm
	QAg08pU/HhQ3aDWD9U++L6BGBhppa3VEh49TtbdIInliZhMIPvCUCVFRxIY3RAMs40Jg567zeOe
	Y2M1fbIRiDpHssU2RzDNXU
X-Received: by 2002:a05:600c:30d2:b0:488:e192:6fb5 with SMTP id 5b1f17b1804b1-488e19270cbmr11503025e9.24.1775919490161;
        Sat, 11 Apr 2026 07:58:10 -0700 (PDT)
Received: from [127.0.1.1] ([151.61.248.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5dc7070sm48882375e9.10.2026.04.11.07.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 07:58:09 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Sat, 11 Apr 2026 16:57:34 +0200
Subject: [PATCH RFC v2 09/11] ASoC: meson: gx-card: add support for AUDIN
 FIFO
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-audin-rfc-v2-9-4c8a6ec5fcab@baylibre.com>
References: <20260411-audin-rfc-v2-0-4c8a6ec5fcab@baylibre.com>
In-Reply-To: <20260411-audin-rfc-v2-0-4c8a6ec5fcab@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Valerio Setti <vsetti@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2163; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=2ntYm7/hmH/uH7c2NHvmQVtKZ8poNaDp8J/gvOxFEnk=;
 b=owGbwMvMwCF2z3ty7kUrRgbG02pJDJm3EksmrahWzn5x4WJtQN9LV2MG+cX3n90/v2bLvk2Pc
 56rXmW06yhlYRDjYJAVU2RhmX7vd0Gp2kPjhJMFMHNYmUCGMHBxCsBE/mgx/K+7ttJNs2e2wi0/
 j5oX17Y4BPCdOmtw+cEkWbmYU/HcskaMDI+OnHHQteZYLetsyuvQYCp/q3T7pBKJ8ze1v4kfnCj
 lywEA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

Slightly modify "gx_card_cpu_identify()" by making the compatible matching
string an input parameter. This allows to easily support also
"meson-gx-audin-fifo" with minimal changes.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/gx-card.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/sound/soc/meson/gx-card.c b/sound/soc/meson/gx-card.c
index b408cc2bbc9193ae56d02b4fcd05af8df3f93d80..1e48dbbf7324dfa6ca66026d944422dadf4204c0 100644
--- a/sound/soc/meson/gx-card.c
+++ b/sound/soc/meson/gx-card.c
@@ -65,10 +65,10 @@ static int gx_card_parse_i2s(struct snd_soc_card *card,
 }
 
 static int gx_card_cpu_identify(struct snd_soc_dai_link_component *c,
-				char *match)
+				char *compatible_match, char *dai_match)
 {
-	if (of_device_is_compatible(c->of_node, DT_PREFIX "aiu")) {
-		if (strstr(c->dai_name, match))
+	if (of_device_is_compatible(c->of_node, compatible_match)) {
+		if (strstr(c->dai_name, dai_match))
 			return 1;
 	}
 
@@ -94,21 +94,23 @@ static int gx_card_add_link(struct snd_soc_card *card, struct device_node *np,
 	if (ret)
 		return ret;
 
-	if (gx_card_cpu_identify(dai_link->cpus, "FIFO"))
+	if (gx_card_cpu_identify(dai_link->cpus, DT_PREFIX "aiu", "FIFO"))
 		return  meson_card_set_fe_link(card, dai_link, np, true);
+	else if (gx_card_cpu_identify(dai_link->cpus, DT_PREFIX "meson-gx-audin-fifo", "FIFO"))
+		return  meson_card_set_fe_link(card, dai_link, np, false);
 
 	ret = meson_card_set_be_link(card, dai_link, np);
 	if (ret)
 		return ret;
 
 	/* Or apply codec to codec params if necessary */
-	if (gx_card_cpu_identify(dai_link->cpus, "CODEC CTRL")) {
+	if (gx_card_cpu_identify(dai_link->cpus, DT_PREFIX "aiu", "CODEC CTRL")) {
 		dai_link->c2c_params = &codec_params;
 		dai_link->num_c2c_params = 1;
 	} else {
 		dai_link->no_pcm = 1;
 		/* Check if the cpu is the i2s encoder and parse i2s data */
-		if (gx_card_cpu_identify(dai_link->cpus, "I2S Encoder"))
+		if (gx_card_cpu_identify(dai_link->cpus, DT_PREFIX "aiu", "I2S Encoder"))
 			ret = gx_card_parse_i2s(card, np, index);
 	}
 

-- 
2.39.5

