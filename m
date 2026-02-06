Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8993ED13A
	for <linux-sound@vger.kernel.org>; Fri,  6 Feb 2026 13:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770385312; cv=none; b=FqHd7nPw8P8vqWG12FEexJX8/L828e/+rb9PYLDwnUEsmWMBtGeCo4CKmH4kq05scX5RRS/7z9r/Ew1S2CAn32PRrfxNhB2kROEpw4fUOMEOMxS2XKy8b3+fOi4HDxlbqcIW2RuYoZ/0STFdsjUqdFy25wpHnygna3ojOE2n930=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770385312; c=relaxed/simple;
	bh=wm+AbAD/OUh3v7Xv1DEHbPwpasL4lhsjO1KXmiB15S4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=grJU2qfs0Qb+1i0Vz5fEhDOnMR/3QwhAoD9WrmqHQzrSNsmMsVzTm/ooPUgPvKPPOd5Zf8Y4RHQc4gUzf6UzCJ461Oyb7IqhpqA1jjkXRo7nBX5V6Sc4S1TGNXX8SKePDizTNxOr5TPyh5V0XVNgOlLRJSAvWkLN14DadWy5jz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bXodLrFF; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bXodLrFF"
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-47ee2715254so13656475e9.3
        for <linux-sound@vger.kernel.org>; Fri, 06 Feb 2026 05:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770385310; x=1770990110; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zWXO9hygv8TJht16X4K5FTKGWCSFK8mS2WBoiikearA=;
        b=bXodLrFFrLEBuGuEHkZsMrU4CLInVA7+VWz/WC0cdn0RSFSjAYT7LzfJ9Y4RW27pTf
         4GpIWVU1+wWkXwBgM2/k4ZCUQ91o/Ub7bjzImVPCJa7Nz+rI2qWqqndHaXm+1GftEZtf
         GMfkNNMxzgHj32Fr6/AbygIIh6fxIl2r8Tm4MnREWxXhyJbfyCLwokOEq+Nba1/TXn/s
         bY66ZQpK/I4vrzwy2H4JG9m+z3CUYfFo+oBS1vuwP2jV93V3F1Gi40c5COLXxLCzmXCu
         kJoduvuRUv9AqoOlJV2GWbb7ldySuV14aviej6jt1R/h831H3kYn2wahWxlILul7HDAm
         LYqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770385310; x=1770990110;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zWXO9hygv8TJht16X4K5FTKGWCSFK8mS2WBoiikearA=;
        b=hXIOnvb0rT/av6++zrzw74jdWp77NpMhilQLA2AXZBBNIjBrZb94X15J/yHLKv+lOk
         1SolyqagAEhelib67EvmJivclTDPpojlVK44eutHazgw0gmBgrUgvXGIjX/6R74OvNLy
         flEqRUshX4Xkgnh+uiRAIQI8ON0emaUMR7S8j1YPWVVCyCktdDRxDVqdst/cMl7qytaC
         Cm+b63As2/HOniGU1mzLGzrHOO8MsOQwKVm2u0oOk5JOf4Vzq0o7Yj1o/GFymRWm3hJE
         UuViTu4BtLg6IQ0WlTNVd0QHkP6N8lBzru6Q+catrScZw7ACGbK1bMiWpPirGNnVVWA0
         r9Ag==
X-Forwarded-Encrypted: i=1; AJvYcCX3F3GUM0q8h0Wc9M5v76KL+yBkR0QThfW9N8TKF49bRA57eEVJTfSPpYuNszqGpo8jgfgYVBGxU50wBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmQkn6jK30tTqnpFBgzwKHja13+hZjAKfuiVmyHWUUbIpD6640
	3uElTZb8QrcVqOiW3vJkgETjaBUqbgats6+wvTU9HJDCOUwRh0pYdbtQcm/aUpfpWzg=
X-Gm-Gg: AZuq6aKfGcPwZh5fAHblzqQysSiXCdiNZ/FeW/NxSx5L0K5W2RLsPlZoILKdcZo5PZw
	v1cm6cG4HG4wpkx9IMVoTc+Zzg3e4lEvuyyBwttTfpJ+8dDoJCgsqEsjLCGnsc1FLoHFNrFMHnh
	9eFqdAmvtNIEIdJnf5o263K6vY9mwQgCsmAuNswvHhkUB8ZZpj6aAME3R+L9TxNu9mfkaeTD6bo
	Me2zLQvtLNPQRzG2V1HPB548XyqKkhMw/tZTLttEym/NyQnwM6YtXFTRjegnWv1rDKRO2kMe2UU
	tcyUrGjfjWpPEOtp/0S+Vr4R4wTy1FskJv5Ermf9fYW56AMHd2wSe6p78QJSvHn5K5iLu7hsZ4u
	oAK9CkiLxGatHRX3BOqKA+b4GMBW3Y7ARrVLSVU4Hl1LHaMpGOffh3kKxUswVt9hHCj5Y4/LWOT
	idf5n4QpB5ItCDIRc/kZL6/XJwfwmL
X-Received: by 2002:a05:600c:3e1b:b0:477:76bf:e1fb with SMTP id 5b1f17b1804b1-483201ef97amr43561275e9.16.1770385310385;
        Fri, 06 Feb 2026 05:41:50 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48317d8341csm123379965e9.13.2026.02.06.05.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 05:41:50 -0800 (PST)
Date: Fri, 6 Feb 2026 16:41:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] ALSA: oss: delete self assignment
Message-ID: <aYXvm2YoV2yRimhk@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

No need to assign "uctl" to itself.  Delete it.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/core/oss/mixer_oss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/oss/mixer_oss.c b/sound/core/oss/mixer_oss.c
index 69422ab2d808..8d2d46d03301 100644
--- a/sound/core/oss/mixer_oss.c
+++ b/sound/core/oss/mixer_oss.c
@@ -792,7 +792,7 @@ static int snd_mixer_oss_get_recsrc2(struct snd_mixer_oss_file *fmixer, unsigned
 	struct snd_ctl_elem_info *uinfo __free(kfree) =
 		kzalloc(sizeof(*uinfo), GFP_KERNEL);
 	struct snd_ctl_elem_value *uctl __free(kfree) =
-		uctl = kzalloc(sizeof(*uctl), GFP_KERNEL);
+		kzalloc(sizeof(*uctl), GFP_KERNEL);
 	if (uinfo == NULL || uctl == NULL)
 		return -ENOMEM;
 	guard(rwsem_read)(&card->controls_rwsem);
-- 
2.51.0

