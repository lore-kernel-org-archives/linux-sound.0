Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33B330F7F9
	for <linux-sound@vger.kernel.org>; Tue, 23 Sep 2025 11:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758626926; cv=none; b=XSD3OPJQilZ6xP+cRWeT0mbfSIhO2/RQ0TwZibbx8qQGBkgLMGJio6NDZK0+jzXyvt8hWGh1T7hVxkGmgBcguvN7HwtLR8Zai/JViWwTZmj4jTtyUC11UrIGEF94oIRd+dQMreJFRdwj7ILACG+9YdbesEdtzAIylQ/1vMOL6TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758626926; c=relaxed/simple;
	bh=Fg9loJYTcGYlx0MTZ4vFLQtkph2uQSlIxlL1lZRCrKo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t9yjRctDo73I1mnf6Czr/zPXBwO1TdoiWYYutI6N21auA+1ypTFy2LDdFLj+oQaSRDlGC6riiz3hW+kR687HjFHJOcvAA80ZFoalNEVY3lthmqtwAkCKb5cXDLvp+3DTkVtqHXHm7/6uktlyBA4OKxUQ8eo4iymB5hb05ikPv7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=peVkHwHB; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="peVkHwHB"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3ee15b5435bso2877937f8f.0
        for <linux-sound@vger.kernel.org>; Tue, 23 Sep 2025 04:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758626923; x=1759231723; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p3nLbAifVjvlMsTe05tZfwI7NIrolTzFIj3PkRr+oLU=;
        b=peVkHwHBt0/q22w/jyzHTnWjgKqW6VyEPmt9TnZJT2ZaVvqMTS1bGhHPERAky601YQ
         f4U7VbynEit/PxiEEatHQw4eQmqfH+5BD1WJkFUEvCHpwBuRJISAa1lSIs/iPDGG9v0Z
         Z1QIsF7rhKfE1XwSPq9WHnpLjiju1D5s8XmtNeSC9iyAtGOiQRxNf/rcAltnOkhNo1y2
         S/6yXY2xOyLHLNVSL36ix1pDyxlWtcAfBzkFkJHoU/GqYE1VVot05WF03S7pNrQmrMrc
         Hz5CgelKN6OW2dkpgCnl+xEg877WipbPuAZ0UjGOzu1CmlZI90u7/iPhbSlGcZ1wBp+F
         nTiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758626923; x=1759231723;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p3nLbAifVjvlMsTe05tZfwI7NIrolTzFIj3PkRr+oLU=;
        b=iI7wrr4cS9FJFBrr8oZxN1CA32Nuhrq5d75JGQ6iYX4dASpBXOGP3CiCa8acS9YohT
         HrT6ff1udY3umMfnq+S6ymvq1bbsDNzGt0UoejsW3NvH5pfl8ALjI23PXRsex63t97Aj
         JTgL7hqRixh4ukozjXZmm8/vQH1nKAdVEDLBdTIDvgdxCxkW3JnAxe19oIabK8CDsO3x
         eAz5WonYDDNFEoarO/m/a3HHQ6+iQqa0SnbWnnLoofcClr2ks3PF/ZK8b/M7xWbgba7F
         OJun0sqpyglmKTkPxwWeqIspcycSrUgQFMjoX0T/lO9sRnx+I61f331KOxwhA84k83SX
         3DlA==
X-Forwarded-Encrypted: i=1; AJvYcCVhMdhl5IhCm+NQRdB3hqoM2AzhY1kk7fIbSk+BqhumThJvdIWX7CG6Z5h0KWcIrE5ygmWkhU62Ax+WHw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWZwJeZY42iTdx7yZPKUpGcRuMtRLG0IJEU+lhzL9TeBGwJ5ei
	d3ktvqMTiYniGwyph/AP4IhHdbb0r6xzEIfaDEIs/+M6rGYuWrskyBa55MePvWcv+dw=
X-Gm-Gg: ASbGncu3Drn+g7nQglP7vAZctfB3RXxcvu40cGucQ2mzW4SURe7esWKtupBQTgDYMZv
	pLimGKDs/nelwWQgmMuF036H0ZuABzJ0dj7sSXbgNMekvNHZyUX5NHf/FJhJo9uv2NgZZ8wQZja
	klfgKqiCORsJJo0bfbQW8Vvj15p8n+uRXUFm2veyds0c460xlewza7vHgbja5olsXgAbIm/qtNQ
	5tUT3jhD2kuXeum+TyiFd5EP7oOUwqaQqqWR7IDqTRl50zV1EepgC2O0RjW7Y+BlqzPfljLQdH7
	fv3In+XEiUqUdYOlUaaU8ZUo/2a1PUNNXNxWFHMvimaQc5AjZIx+gA/rs8nMpUX8oyAh3/QZYwr
	wJf4HsFRK2iZhk8OL3oZus9ZmW+SZ
X-Google-Smtp-Source: AGHT+IEreieYRZZVcV4W0b1/dif/w7q6qOys4eC2iEOI56szcrpHxrUi/D3jSCJ+aNlIHebwRh6vfA==
X-Received: by 2002:a5d:5f87:0:b0:3ff:d5c5:6b03 with SMTP id ffacd0b85a97d-405ca770ea6mr1817809f8f.35.1758626922991;
        Tue, 23 Sep 2025 04:28:42 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3ee0fbf1d35sm25228491f8f.55.2025.09.23.04.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 04:28:42 -0700 (PDT)
Date: Tue, 23 Sep 2025 14:28:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] ASoC: codecs: wcd-common: fix signedness bug in
 wcd_dt_parse_micbias_info()
Message-ID: <aNKEZ3VqJ8js208v@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The error handling does not work because common->micb_vout[] is an array
of u32.  We need a signed variable to store negative error codes.

Fixes: 4f16b6351bbf ("ASoC: codecs: wcd: add common helper for wcd codecs")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/soc/codecs/wcd-common.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wcd-common.c b/sound/soc/codecs/wcd-common.c
index 9bbfda828377..9016e974582f 100644
--- a/sound/soc/codecs/wcd-common.c
+++ b/sound/soc/codecs/wcd-common.c
@@ -62,12 +62,13 @@ static int wcd_get_micbias_val(struct device *dev, int micb_num, u32 *micb_mv)
 
 int wcd_dt_parse_micbias_info(struct wcd_common *common)
 {
-	int i;
+	int ret, i;
 
 	for (i = 0; i < common->max_bias; i++) {
-		common->micb_vout[i] = wcd_get_micbias_val(common->dev, i + 1, &common->micb_mv[i]);
-		if (common->micb_vout[i] < 0)
-			return -EINVAL;
+		ret = wcd_get_micbias_val(common->dev, i + 1, &common->micb_mv[i]);
+		if (ret < 0)
+			return ret;
+		common->micb_vout[i] = ret;
 	}
 
 	return 0;
-- 
2.51.0

