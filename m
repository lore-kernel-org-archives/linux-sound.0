Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77ADE27E05A
	for <linux-sound@vger.kernel.org>; Sun, 18 Jan 2026 20:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768769439; cv=none; b=EgkNCbJq6EqZr0PwNffuOWN5+CkcyIFq4MvbJu0s2xqwGHghpC3YoDrlQyq39JgbYfZcCyhJrJVEeLEbrqGGbAekStzfq5k6SxRWr+F6vUAcAlxX0MVSAvMVBxAkBrU6yysNZ0CeoMy2TZnOik5LQR08cSP6D5k2w0DoQdirPfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768769439; c=relaxed/simple;
	bh=12pYU0nsh1edvtQBn+62FSk6cQSXGIkciUmANowJnNo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GlmVDhppa1ogKNFKRXzsfQypLLg+IXmz9JFYyoBMNcMejOafPnaXSipPZymksHXmewgJEXfFVJ21wkgwc+lOyk5qGH1U4tQ7M7i/DnPJOwnerdmBPPt4sht4epqUxsJRUyuVR0vEYL+rstydml/gnjwujAfDF0lEgBe2xwxhkoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SwCAJYzv; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SwCAJYzv"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2b6c6f89f23so3314163eec.1
        for <linux-sound@vger.kernel.org>; Sun, 18 Jan 2026 12:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768769438; x=1769374238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Puynjv+Dl13PC2EAzTsegEpQBiQKymq7P+RdFdVlq08=;
        b=SwCAJYzvRWoDfrr3vqRiM8HdTP9joRiSQQnxKIp6oNql5aYMsNjXi/qFoaxnCpT1HQ
         EQjIM+tMlcIWtFeJM3InTKGtEyxe8dMkHXCevz447yDZjd2+E62tk5cC8+1VKghhW0yP
         TuMl9Fl9eAuyRdjc2n47+zvY6W9lHaz8aJafoL0h6anMah2wiwNad21YrbgPL9w3cRvp
         I11xbRC++V6p0lO2jJ5x7OEr4gM/2P5a05GSTjszIf0L5psg7qLiX9VxjYXTMt8RFGRK
         JBZ1YMSrdD0VSimfCvwVgd+2dpZEDt6LMAM04zoZB9PUgPkOYO6IaR1ArZF5D+opfy/N
         Eb7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768769438; x=1769374238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Puynjv+Dl13PC2EAzTsegEpQBiQKymq7P+RdFdVlq08=;
        b=II80pGfi5T/y5SoyvasI69nU91X9griqzgKeDPKlL4Pk12YjCfhAuVzdbBRJo0SNRz
         Kf8OV4WX8NumnSE99tXStdlfoDWhGTeN56rc6j9q1A5wPb2uAf3xlUrJiuAiJIxn9Zcb
         bcWoYG3Xfa6lbnd3HSn5zp89apoXZEm9oZYj8Fb1aQQaPV7kUy4oaLztLqoSrScU0LB4
         MFojlTpIpvL6GwmBZaAMcuzjcquAQvrjmW0x3Vf7Gf2VBaBnyPHFl9l1KnleG/6U50fd
         WGc5ybs1IAccEIqwnO4pAJTjBl3/p4I4FYO90KjN5/11HbL2SaGu4fe7bzjqBO83NWV2
         exhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgaD9Pt4keolBDBsewfGNhmnzWA4+u1CDvEPTD5n5qwSSWzXdrSfBjLIeIem8jxYHSM1EKQ/923rWIkw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwE8xnMYkmJNHdh/cyEoCKKJ2PS7258P9+k2+FE+dP2yqn9pfWE
	fFgSrJF+v7mOOKbZet+KITTZoe4DhML4KjLKaBe8shO8Y1PEYYYAEUA9
X-Gm-Gg: AY/fxX7TtfEudT0F+O/JXprY2VAWvOXaEdYbR1yrvpvHzzeLApQFEvJBpvRfLS8nzMX
	V+lKOSjYQr0u7KpCO7IzWB4bydy584FOASyCqSJbgzR/eOamxV8jsWZYqTvAVt97WkK6zhE9HJq
	223DMCBAomkaU4OG5puv3WS7UrzzTy/G9CsqyDqig8K4OaYjhho2qVfRfDGNQueLsanWiuXRi4O
	9QxPVCvp9osbLNE0BnQ9L80Fk2bZnxXnktbmpLLYSZ0oGetyetfbGN/eXIu9yX5QlqODzk6x2Ru
	QlG57aWM83oRYUGpCtF7yN7SqEIwYGdAQy+YJjCzsX5b9GqoLVv4aeVXKKQuNOrmJgLA8tuvwG6
	/b14rGenib0oaJorDoo5pIS7l6ss3YCzYQxPhja4/o/QFwSCwH1RYVw+g22571f5tNvILHsdUwg
	pMeicb1Q==
X-Received: by 2002:a05:7300:cd99:b0:2a4:3593:6474 with SMTP id 5a478bee46e88-2b6b410367bmr6876089eec.36.1768769437417;
        Sun, 18 Jan 2026 12:50:37 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61::1001])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b3619a7bsm10167364eec.19.2026.01.18.12.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 12:50:35 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Cc: shengjiu.wang@gmail.com,
	linux-sound@vger.kernel.org,
	imx@lists.linux.dev,
	Fabio Estevam <festevam@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH RESEND] ASoC: fsl: imx-card: Do not force slot width to sample width
Date: Sun, 18 Jan 2026 17:50:30 -0300
Message-Id: <20260118205030.1532696-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

imx-card currently sets the slot width to the physical sample width
for I2S links. This breaks controllers that use fixed-width slots
(e.g. 32-bit FIFO words), causing the unused bits in the slot to
contain undefined data when playing 16-bit streams.

Do not override the slot width in the machine driver and let the CPU
DAI select an appropriate default instead. This matches the behavior
of simple-audio-card and avoids embedding controller-specific policy
in the machine driver.

On an i.MX8MP-based board using SAI as the I2S master with 32-bit slots,
playing 16-bit audio resulted in spurious frequencies and an incorrect
SAI data waveform, as the slot width was forced to 16 bits. After this
change, audio artifacts are eliminated and the 16-bit samples correctly
occupy the first half of the 32-bit slot, with the remaining bits padded
with zeroes.

Cc: stable@vger.kernel.org
Fixes: aa736700f42f ("ASoC: imx-card: Add imx-card machine driver")
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 sound/soc/fsl/imx-card.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index 28699d7b75ca..05b4e971a366 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -346,7 +346,6 @@ static int imx_aif_hw_params(struct snd_pcm_substream *substream,
 			      SND_SOC_DAIFMT_PDM;
 		} else {
 			slots = 2;
-			slot_width = params_physical_width(params);
 			fmt = (rtd->dai_link->dai_fmt & ~SND_SOC_DAIFMT_FORMAT_MASK) |
 			      SND_SOC_DAIFMT_I2S;
 		}
-- 
2.34.1

