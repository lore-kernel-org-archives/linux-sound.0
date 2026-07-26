Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C04A3603F6
	for <linux-sound@vger.kernel.org>; Sun, 26 Jul 2026 01:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785027932; cv=none; b=T4oiKtgkivupB8/JfPRHTu1pmKBh4pqj3xyexI1amSFNuZjjVmOMWd/c6Wmp/oYGN7cBTSVd3bbWnQKWHEKQ0fNJet6y7wJGTqTRCdnOY38yNVX9kGKUaNgT5ey6jrBhv7J4P5MQhca5tVsSnUB4DXRygrO4MaKoZUIfxq2Tzr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785027932; c=relaxed/simple;
	bh=axSQFGz4eZY3m3WWtHLExT0Lbo+PWRhmCCRYWN2cM8c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=orMWUENkvo9e84+o+xkCaoMfpQk6XERlJ1AvtU9KUdeNsbqsacJhbAXL1Ja723nmrl5jwarml37x3Ifqnglf9VfbZHPPXQjtbi8G9aitnfrleRsBMbDEAKkzoZG3BqBryqXFFuqvwwgIE3SqfO4mkruIjdHQl+G+1VDAeHdeLd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EazZgFDm; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EazZgFDm"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c998fd549a8so1119374a12.2
        for <linux-sound@vger.kernel.org>; Sat, 25 Jul 2026 18:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785027931; x=1785632731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0XywcTn/cYwnv7iLrgGnCGReBXOpGuZG/bi/kFv8Dv0=;
        b=EazZgFDm0JLrJHHJQdrmaPUcNjFthEByFbX7OfvSDZd2wVzLDLQJR80RUdFLqruEmF
         XVQh2OZvHi5NW5IVQfKIQS/K5GMgS2H3AwO7Z2a4bRnSEmzfdXlELK9LnogZ/wIssbX1
         wxllOdx9Bo0vnMIZQhoYWzEhAh+5g+2Je4+/yD/Ia7/W1L28pl8uuAuRxtMxYLXNjEup
         Sl25ajSNvGIAnhCyQkQMqO2/KeXkyo6kfv10MfxiDPk+mryOLQRSdgLzZPo/k39m/NOm
         m7s1Qa6Zs8pvYA7h7ac0bQNQ0YHGOfCXQx6GtqQHO6xA6gEsCUUbU5OA4kGI+yhRVh7s
         9EVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785027931; x=1785632731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0XywcTn/cYwnv7iLrgGnCGReBXOpGuZG/bi/kFv8Dv0=;
        b=YUtXwJoGflOaLl1Bwd18SM3Ck9SLC7ARRwM5BcGOFYG7pEpfoWB50oaYcp+iUFED20
         yR/o8cjImBm3IfMid0J4L0HW/XTGybpVLGnNg+3ycUd3jYN1uo6TkkP/Fz5JYErtXEsj
         2bcOUy9oNOZs9I8Jddg0qWJ6B4Ao3G85694GFlQM7FhUP8OKdLjiHC703kUYsh+wvDH6
         wQreZ86TJ7OjetmbwH7QRoFeDUExTjPVZOwphpSONNKLTtfnUdYdA62g5NsMcUjSBZA4
         bLjiMfBGuWGbnvwGlG8bfesdhUREOgVfcdKMOjXnXiWtqGU5MUDR5ZL/mWMvS4RC98sN
         iNyA==
X-Forwarded-Encrypted: i=1; AHgh+Rqv/PRuQQrI7jqeJxo5hfgsqAxJ2c6PQcRmmfXriIRpzcswLLq7C25hnPTDR/OtkYpJjQGTEV8n5huMCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKRYO1nBTvUOH32V94MtQ1Y+3mv/7ZWiVzuB5+f0giVyw31ZVl
	mcg7aWLl29KUDKAyWX1GR+7P8EoCSmagZuPa3B/4s270AGjD2cAq3GR/
X-Gm-Gg: AR+sD12cLrwLLBUEUZG4zsSrQbH9/AoyzA4Aw4g419wv3Y73flUv6ZO3KVTYtWMIM+/
	m8DAbjpuF090xFUB5vUkgVuNWFgN2EIptHxKaUpmTbY2L/jHQ0k5TVCaUcYBSjA1GZ0qOUk3QLU
	be8tcxn2XUo1Wv/6bA1Uxn6WbvBg03iAtPugxH6klIbsieOORJDyEzjrOEGmsZpuyf3Ll2ecRdZ
	HDXUu8tqDLdfDZ0IQKbLIAeqzRrAmsy44AAIWBLsGxY7fb0C/KUL5wdJUKcERlMKKodXRA/DtAA
	WVbo1UUmDOt5q9Yl1VwIu61yW0xABfvuYmJd7RIEO6PcGNsI6U+UNuW2gRPfb004+KuPT9mD5Qr
	VbIRcaQm3GbILH4fxw1Dy8SOTPdAnhamXvpY24hd06mKE7thbytaFtD9Wzbg1ZEekxVe7khklRt
	PyJicvjmRMAYBnSk8j65R9Zw2qZHYU/Hv+EzyXyOycjJGgzW+/3JZkOSBJQ+m68QrOEA==
X-Received: by 2002:a05:6a20:e291:b0:3c4:3321:5009 with SMTP id adf61e73a8af0-3c67dd8b376mr3633473637.29.1785027930847;
        Sat, 25 Jul 2026 18:05:30 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:e2c2:1f24:32d5:9d51])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e0f4a039asm11821445c88.9.2026.07.25.18.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 18:05:29 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] ASoC: tlv320aic32x4: do not make clocks bulk data static
Date: Sat, 25 Jul 2026 18:05:15 -0700
Message-ID: <20260726010519.117805-5-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260726010519.117805-1-dmitry.torokhov@gmail.com>
References: <20260726010519.117805-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Declaring local clk_bulk_data structures as static inside functions is bad
practice even if the driver is currently a singleton, because it relies on
mutable function-static state and interferes with multi-instance safety or
clean re-probing.

Remove static from the clocks bulk data arrays across the driver.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 sound/soc/codecs/tlv320aic32x4.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/tlv320aic32x4.c b/sound/soc/codecs/tlv320aic32x4.c
index 72be757f559c..690acfc005c2 100644
--- a/sound/soc/codecs/tlv320aic32x4.c
+++ b/sound/soc/codecs/tlv320aic32x4.c
@@ -717,7 +717,7 @@ static int aic32x4_setup_clocks(struct snd_soc_component *component,
 	unsigned long adc_clock_rate, dac_clock_rate;
 	int ret;
 
-	static struct clk_bulk_data clocks[] = {
+	struct clk_bulk_data clocks[] = {
 		{ .id = "pll" },
 		{ .id = "nadc" },
 		{ .id = "madc" },
@@ -886,7 +886,7 @@ static int aic32x4_set_bias_level(struct snd_soc_component *component,
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int ret;
 
-	static struct clk_bulk_data clocks[] = {
+	struct clk_bulk_data clocks[] = {
 		{ .id = "madc" },
 		{ .id = "mdac" },
 		{ .id = "bdiv" },
@@ -972,7 +972,7 @@ static int aic32x4_component_probe(struct snd_soc_component *component)
 	u32 tmp_reg;
 	int ret;
 
-	static struct clk_bulk_data clocks[] = {
+	struct clk_bulk_data clocks[] = {
 		{ .id = "codec_clkin" },
 		{ .id = "pll" },
 		{ .id = "bdiv" },
@@ -1128,7 +1128,7 @@ static int aic32x4_tas2505_component_probe(struct snd_soc_component *component)
 	u32 tmp_reg;
 	int ret;
 
-	static struct clk_bulk_data clocks[] = {
+	struct clk_bulk_data clocks[] = {
 		{ .id = "codec_clkin" },
 		{ .id = "pll" },
 		{ .id = "bdiv" },
-- 
2.55.0.229.g6434b31f56-goog

