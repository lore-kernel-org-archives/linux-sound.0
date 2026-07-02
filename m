Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13063E1732
	for <linux-sound@vger.kernel.org>; Thu,  2 Jul 2026 10:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782989819; cv=none; b=mDgmrzJ68plR0mbwO1bNaJhgoYAEwcrvJAYGDNpoWTPXdncdn6VqPTfl2pY2fqeBaHqpV7IhIgF1TM3ZFwlqkF+E2RHp5pcCObBRJ+c+wNBvtgwpv9ty1okNJcoHUQfJlI8QQWBMWZk8mRY085RQcQrrFTuo9EQWLcA0fTfZg5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782989819; c=relaxed/simple;
	bh=KNk3Ydn1EVAsr7JuVTIdcH5PBqVqNrLHBwSrm2suX8o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eQUAiAmCIW/ulVs8tQMCR3r6eBOWMBNhSfyDMbLNYXRd5JZOzOxLovErRJa7MgjDzD9mWMPSxKI1XPC+5Q9YoIlbLdRrhdqxoB8yh/P2bIgeWSBaBJPOwN5sbOPkai+OcTKS6FCI15I/c/lm2aUZSdMaVE3Jc9ua8XjVq8omZMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=oXFjgWKa; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="oXFjgWKa"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493bc8fda98so14730415e9.0
        for <linux-sound@vger.kernel.org>; Thu, 02 Jul 2026 03:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782989815; x=1783594615; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MOLhbH57Fit41sYED3YzTSdJ1tqwyQs+QYySkLyPWHY=;
        b=oXFjgWKaCFg8pHqpxsB/JkIU6Uwu+ByGWA4oMsmlYj6bhq5XEerEWMfZER8VT8C8g7
         C8gvxpKstVTv3GDoCrLiTZuLRAQBSvYliRpsQ3kl7yI/jR2hMMcHdDELsn1LEt3aY5nU
         NEpSfOYzD/8DJbKIaAjuxllZ3V2onB+k2D3hTlJE0/KF60eCCwbZKUGt3ZwJhZErw9Yq
         6xTa00NWOQalAMaanc3R2I/1OahUbkNYQa7/VBZiZBFYA0OR9YUg/bRtX+FqRNDf4Cpl
         QxRfn8msekh9aQigoCWTUqoAdwgL2mcbQst2C7FRvksy/9j4vNtLYhTbctrlaTW4kUfR
         dDIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782989815; x=1783594615;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MOLhbH57Fit41sYED3YzTSdJ1tqwyQs+QYySkLyPWHY=;
        b=U7EtGKHBkxrzLIkUfVsjqzeIRjdZ5dhw8wyvdbu4MPQ7uiwQ3tVUVXdtCDu/dr91lQ
         uUXPOASAMTrbI5VwM6K+wkSwgcweGuw3M7RtHsRQpwZ+l/ZUqG/hMtDk2DjnW2kYK5f/
         vDoZIQmpJW88Hf94w8nLaHN7io7WclfNMWkEvifIZIPP//HDEQay5iYYVhF2spMQ0FzO
         Ult/r5KHt8Cwd/pupdGL60R8lfLN5ApkMObdI0TCgXL77MSJi9XqkNIT3jFQEdqKoKM9
         s6rIpgmoHv9cjotnp7IFbrS0bWkFOz0QVc4Fi+GGe5r9cgSJx3HE3KfysSKiEqaf4EEJ
         ELUg==
X-Gm-Message-State: AOJu0Yw1w/Qndv5LsPneV0rJzF5VDe/3jS8ReiLa/H12u50o3Ti7Vf3K
	q5fkzTDnZ3dAUtSMn+GoRSy0vsQC43FymhJjwIgaAx56vY6uH6ZTiarlpMkRdkzzSg4=
X-Gm-Gg: AfdE7cnla4cQvs5qnpS1ZMOu/AaD99V4EmvviAr6Mo/l5l1hoZDIV7EXNBuulV1peBW
	s+YyngqdTxMM6u6sL8sNta16t/FBgYZ2VMMaObrRLGw+PZwVRtyGg6StJicRx84c9Rl2kYS41PU
	hwR5PRcz8ztsmHRbrH7c/abFUeazX48sOIbF17RsEapzwKH9mGEJ78rhKVlX+Ty+L16n5jcLp9w
	zfNlcqtdz+CcEzQzhl+1waUqNoA5FbwZz+tdWiJdNam+KULjswHloO4iwKcLXRkhx7Bt41JFmFY
	Ycska26/xroKWcMphkXZTQx1BGWlZaPA60SHmAmgpgASLbqF3azvX38wtEreNlGsTGlYQzakmIC
	ZpwDzO7eiHyyJBwLO3d4K5BkfG1cNNSjTj/Gko0Wi4jId/8GBUhbXe/sNTDk1NZfrPuQay4Bkl5
	k9rdUCcpz8d+XkZL5M/cRq
X-Received: by 2002:a05:600c:37c6:b0:493:a5d0:d1a1 with SMTP id 5b1f17b1804b1-493c3cfb686mr59304145e9.31.1782989815167;
        Thu, 02 Jul 2026 03:56:55 -0700 (PDT)
Received: from [127.0.1.1] ([151.41.178.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6372a31sm42649685e9.13.2026.07.02.03.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 03:56:54 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Thu, 02 Jul 2026 12:56:40 +0200
Subject: [PATCH 1/2] ASoC: meson: gx-formatter: prepare on attach
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-fix-24-bit-i2s-playback-v1-1-bcd3a43fe32a@baylibre.com>
References: <20260702-fix-24-bit-i2s-playback-v1-0-bcd3a43fe32a@baylibre.com>
In-Reply-To: <20260702-fix-24-bit-i2s-playback-v1-0-bcd3a43fe32a@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3733; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=KNk3Ydn1EVAsr7JuVTIdcH5PBqVqNrLHBwSrm2suX8o=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFluzl/iFTavmra14WhqXMnXrbxNBk/2/k6/8truOttr7
 433nHwzOkpZGMS4GGTFFFlYpt/7XVCq9tA44WQBzBxWJpAhDFycAjCRdF5Ghu/JHjWfhbg6W5m3
 9D5fqc7o+MxCw8TxeWv9pXM/V3VuucPwP8LksofO6uO6l6pcH7nU8XxUK1Kc3Pp3XegvkW+vwnK
 l+AE=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

Instead of calling the formatter driver prepare and enable at the same
time when 'gx_stream_start' is called (which happens at trigger time),
split the operation in 2: prepare is called when the widget is powered
up, whereas enable is kept on 'gx_stream_start'.

This resolves a problem related to i2s playback in 24-bit mode. Commit
c7852d2dcf66 ("ASoC: meson: aiu: align I2S design to the AXG one") moved
the content of what was once called 'aiu_encoder_i2s_setup_desc' from
'aiu-encoder-i2s' to 'aiu-formatter-i2s'.

'aiu_encoder_i2s_setup_desc' was basically accomplishing two tasks:
- reset the i2s pipeline.
- configure number of channels and physical samples width.
Before being moved 'aiu_encoder_i2s_setup_desc' was called in the encoder
DAI 'hw_params()', whereas after the move it is called at trigger time
('aiu_encoder_i2s_trigger'->'gx_stream_start' -> 'gx_formatter_enable' ->
'aiu_formatter_i2s_prepare').

In parallel 'aiu-fifo-i2s' (DAI FE) already performs the very same reset
of the pipeline at trigger time in 'aiu_fifo_i2s_trigger' and then it
triggers the playback.

Since the DAI triggering order is the default one (FE before BE) this
means that the pipeline reset happens when the BE already did it and
started the playback. This cause the 24-bit playback mode to be
corrupted.

This commit re-orders operations so that 'aiu_formatter_i2s_prepare' is
called after DAIs' prepare, but before triggering them.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/gx-formatter.c | 33 +++++++++++++++++++++++++--------
 1 file changed, 25 insertions(+), 8 deletions(-)

diff --git a/sound/soc/meson/gx-formatter.c b/sound/soc/meson/gx-formatter.c
index 311e63affb23..c7333f624b15 100644
--- a/sound/soc/meson/gx-formatter.c
+++ b/sound/soc/meson/gx-formatter.c
@@ -15,27 +15,38 @@ struct gx_formatter {
 	struct gx_stream *stream;
 	const struct gx_formatter_driver *drv;
 	bool enabled;
+	bool prepared;
 	struct regmap *map;
 };
 
-static int gx_formatter_enable(struct gx_formatter *formatter)
+static int gx_formatter_prepare(struct gx_formatter *formatter)
 {
 	int ret;
 
-	/* Do nothing if the formatter is already enabled */
-	if (formatter->enabled)
+	if (formatter->prepared)
 		return 0;
 
 	/* Setup the stream parameter in the formatter */
 	if (formatter->drv->ops->prepare) {
 		ret = formatter->drv->ops->prepare(formatter->map,
-					   formatter->drv->quirks,
-					   formatter->stream);
+						   formatter->drv->quirks,
+						   formatter->stream);
 		if (ret)
 			return ret;
 	}
 
-	/* Finally, actually enable the formatter */
+	formatter->prepared = true;
+
+	return 0;
+}
+
+static int gx_formatter_enable(struct gx_formatter *formatter)
+{
+	/* Do nothing if the formatter is already enabled */
+	if (formatter->enabled)
+		return 0;
+
+	/* Enable the formatter */
 	if (formatter->drv->ops->enable)
 		formatter->drv->ops->enable(formatter->map);
 
@@ -63,6 +74,12 @@ static int gx_formatter_attach(struct gx_formatter *formatter)
 
 	mutex_lock(&ts->lock);
 
+	ret = gx_formatter_prepare(formatter);
+	if (ret) {
+		pr_err("failed to prepare the formatter\n");
+		goto out;
+	}
+
 	/* Catch up if the stream is already running when we attach */
 	if (ts->ready) {
 		ret = gx_formatter_enable(formatter);
@@ -87,9 +104,9 @@ static void gx_formatter_detach(struct gx_formatter *formatter)
 
 	mutex_lock(&ts->lock);
 	list_del(&formatter->list);
-	mutex_unlock(&ts->lock);
-
 	gx_formatter_disable(formatter);
+	formatter->prepared = false;
+	mutex_unlock(&ts->lock);
 }
 
 static int gx_formatter_power_up(struct gx_formatter *formatter,

-- 
2.47.3

