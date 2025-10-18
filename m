Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE6A25F97C
	for <linux-sound@vger.kernel.org>; Sat, 18 Oct 2025 06:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760768716; cv=none; b=h+tMkxVqhLqQeUQhz5Ih8UEIwOd4jgFgM0Q2UdRecZ7pt/Z40+mFPRawhhpRQjSrnBxQSRXaWg7zNOesashLQi6ZxeIqr733kvJ9GLZ2EOyT2O2IS446Hy4xa0iUvxVcgXin8S3X2Fxfu/XNt/0O+T9i7eqZor8LSh/DWoCeTro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760768716; c=relaxed/simple;
	bh=bBK06m919fcrgtih+JVTXodl3XFTa8xsFxWUlcI5j+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Cb5D93JoTdF7FJGhuctELnDC6JrklpJpqONAhR3NmN/bfHWxqETJwCHrCsARLHcJ0WeGItq5/mJu6rdbMlkCjRgSD3XDPxlULFfmw8tgm3dxZU0qwJBI6eMSukT4feps0psnCFpCmoTEkpYxpUoCd1mDIHSh1wxbqC2XA6uzhbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CljpQGQc; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CljpQGQc"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3ee64bc6b90so1627854f8f.0
        for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 23:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760768712; x=1761373512; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IOjOlRS5epVikQ4z5SQ9kGD1JPQvt2c8mE5ArTmJEf0=;
        b=CljpQGQc/nyojHlCfT0Ze05TRRzMSN1Sv15PowzH9VCFP9SB3ErGTQqamPNTcYHyt2
         L6yKPlR0I9k0zxC8HmHh2wxreJuG0FjspGTTicgBFSpSukqin/X04ZpSIitzn1dRLtJs
         xKBMlEnUus90vuYRvETno0wEZ2zZsFZ+5vIkwRxqLKiHQtSLU5IE9c3NnAAK/sXemuGc
         3oe+GxDsqpltFJDk8/cfVvF2I2ffN5TYgicuwhKfa/tkkhkIGebTJGYcL7F7BhSo3OrG
         03d41S/cevvzBO96d7dT46fsPovofFga7826q5TRrFlIY2quaSnFWbaFkwdxlURTbfC5
         gvrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760768712; x=1761373512;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IOjOlRS5epVikQ4z5SQ9kGD1JPQvt2c8mE5ArTmJEf0=;
        b=NtGnfTBVLQ7Qfv0rTAayZymnTa6gt02URaqZ3B7uL3vPFGGxl3fx8D2IDLVovp/Zli
         2S5DAJEfI/3TWM4caywqfe1QeDzv1O+13J/hhED6JvUD+EhbuUVQiYGXV7x7dDxGgip2
         ZYrs4sALJ/S2zYXK7ztlEOOrLvYsTBNOqFb9UIbWdyJ9G6rIvwIHbokWREBiit1kP9hf
         d3x1Lmpv1BSiltM6dDceabFyMHTJBnWGPSysytE23PSTS5kbWXwkTTSrYuPJ9EJR1Jzm
         cbwUZeFYfGgXMFinuujoKk8p9crzGY2V+fZ1Vn3Lkhrn3ut9sBQZ28++xrewgm3M5p1f
         7c0A==
X-Forwarded-Encrypted: i=1; AJvYcCVjhqg78IMlhmh3wVwvNUnaaudoq+8oqAjTFNEtEbaF3V5hW89/p7Rllaqi+b4WCOZ+kF9P+lAvFvm7wQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxE86OHJBWFPjX87n+hV1xaMWGhPh+j1RP3crHFyXiKWC0M0v/o
	2Zru+MDwcAnH2kUAl3Ml1/hSrDm0MbcqYTjY5cE65J940qVyA4DS7a3fL/Lfs7Skn0M=
X-Gm-Gg: ASbGncuNvUA+lyqqrWDmhOU1U/b0J7iMlcwJQ8/Kqk2XQTsxfnq730pqIbFK79Ny2zc
	qzZC9+Oy+eBoUpyMDmA0G+WVpnkm3592NJLXjKJnKgENokWLFn6aUy7Z+WPko2cHibpOSZCxBPq
	+OaFL3ru4uArxatphZZYz/nHn7R6ocwFSFTYCVYThz4uhYeVNe9kvcEVZFJSvhZzgEEUAGGtJ4l
	L6IuNyxvl9T+9fHY4W+KeM8TImbAay5HnED6YxwaCqFM7/8cEPD/wBjf+K+byij63N8wj5tFyna
	gBixDIT3zHre2jw1y1nSv1VBiNjw7bz9GwlEyZCIAbr+ajEWMXEmfIaAtu3j/Kr2bgA/W1yt0mE
	hfm6dhopnIbF7NcaQe8eF3QnqgXFlAu7y4v3fvjMLwzwxMk6mKE/fRQKQGQLDZbiMHd/tJ4lbt8
	ziCHkoJQ==
X-Google-Smtp-Source: AGHT+IHiJtFCilIcqVXt1blvDDyHCgj8C07mXYG9xI18dPYdiNmhymktEi4vcR2/aM4gupMNGoVXIQ==
X-Received: by 2002:a05:6000:26ca:b0:428:3c66:a013 with SMTP id ffacd0b85a97d-4283c66a3f8mr683531f8f.55.1760768711850;
        Fri, 17 Oct 2025 23:25:11 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-471144b5c34sm126120075e9.10.2025.10.17.23.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 23:25:11 -0700 (PDT)
Date: Sat, 18 Oct 2025 09:25:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] ASoC: codecs: va-macro: Clean up on error path in
 probe()
Message-ID: <aPMyw_ryay9LA5SW@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Do some clean up before returning the error code.

Fixes: 281c97376cfc ("ASoC: codecs: va-macro: Rework version checking")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/soc/codecs/lpass-va-macro.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index eb4981255f2b..77a372dfb117 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -1632,7 +1632,7 @@ static int va_macro_probe(struct platform_device *pdev)
 		/* read version from register */
 		ret = va_macro_set_lpass_codec_version(va);
 		if (ret)
-			return ret;
+			goto err_clkout;
 	}
 
 	if (va->has_swr_master) {
-- 
2.51.0

