Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2CE28BA8D
	for <linux-sound@vger.kernel.org>; Tue, 15 Apr 2025 10:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744713966; cv=none; b=OwFz918K+AGbCyjF3TZbydMa/WqM3VZ3pLWtIKO6C4UUlZEoADhWEFvXTBF0af6Cta9h7Mpi4vEPtaTT0Xx5Z+/o1XGqjuM/npQO98PhdLijln2if4iMlF5sHgW9wgDSkPCqLc2CA0ANF0/lzc5s4qBUKGk76V8CeyZPau3+9og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744713966; c=relaxed/simple;
	bh=62EDoSV5fr/+NmDoX0H93net+ojkqMEqG9Aj1TnT+E0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sqcPB0Y/5LuaXAvKJwYwZD6zokuiDP1xImu+Rf5YlLGsFounfskB1gShD16hXV9pMcU7tVVKPRSuKuaSab0CokYjQ4eeoTHtcfTn7O/GUxvbyyZ1nw/uftk91uEOW4kGrNThxvpTfuP06fWy94B2jVyGpHJKfh5gK70ItQTtHmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P8gLzSIr; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P8gLzSIr"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cf848528aso44776645e9.2
        for <linux-sound@vger.kernel.org>; Tue, 15 Apr 2025 03:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744713963; x=1745318763; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YQaWyRKtoMYOuzjQi/UaY0dF/POie1UHEF8CXbYiDJk=;
        b=P8gLzSIriEwqcJ3SVK3V3MDz0sb633Mpg390yEMZwLxYtGg6hPNq+JeOAe1cEtRf37
         cVvQ3/YZFsPKRj9dyDEMgssZEPu8UWdO3zBVeByD+q6XXaX9HRPO6FmAFtOuKxDQsO2T
         j+tzG83mpWZ85mIG1siSq0HbqrXCBF51vRvM0PpfUNZNdi28NcRWlTb0lmX+b3kmNozL
         zWAp+NzOkQagGKX3o9ur46YYxY+HckOopzaoFwVAtNmv+NhktDamB/CGa+e3H9NJn+Nj
         bYe8F+3MOUKEjnr/lEQA+bGBCzROZuWWD1E63sDgyFn8yfSAn5DNIK0FgSZOuBaF67Ys
         zmBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744713963; x=1745318763;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YQaWyRKtoMYOuzjQi/UaY0dF/POie1UHEF8CXbYiDJk=;
        b=OgTQndI3AWyU/uSDj6p9/5eOkxbxm6eQlD0VPBlqx4orFhFKJ6nSOYEWafQpxsporp
         MD6KxBy1/h4rB/soopIA3lMFaq60OF0x/9MawWCYyZxuv8qfJ612l1g0XFT45voKWd4A
         AQEDad7N+1H89f8/c3d4/xDMCHGeZ5aRSUtp2P2490mnq2t7wIzjNxL9fZVmBMCLvbI+
         n/Ovg01RYyActEfJuCIAumomjKGoXyMv3jSdiyhI876h+729ERx7w0ar5XpETYd5B7XQ
         3KNnihYAMbtSwRBObZQHtxAPrFVlhKLDsmIgnW17Wdo6YZmLS9YuE+t+Nn7YNJ5ETyBc
         dxeg==
X-Forwarded-Encrypted: i=1; AJvYcCUO7iX7rdedybCeatWlCzbYzxQ0Uwul4ir+v/JMyyzG6S/YSx+FijBjQDLo9AP03kq0gKOmw65r/9gRGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ+IDD06aNPQHB6mtptw4Fg5DTiRldcFNXyaGIIVXR/ilh2/HF
	wkYN4TEqVj7UpA0OmXv8VA/peLoOdKBWGPbc6kHdAzJamGo6JDv/8D2QHWEI8uLfrCrpXodYvm1
	s
X-Gm-Gg: ASbGncsmSLJaChRj1vNk3JoA9qmkkEYM6MMlyAEn6d7h/EeZOVtjtP80LM90jKr4poT
	w57mTE79lUXL2B/+Ji1cg+6SB8Fc3jYC2wfydomfIDH17oNXGZ/WqYLrwM4vPDdoTJBvk5Qzas+
	1yz/NOZ7BRJqkscEtr7R3ykZNxESX2KF2a68VRmi0QndvWNFzoMN9mszj7buMkFJkv9Z1NVRofL
	Q2h9zHAmTHc/YwvhYOb3I9uozlBwmIfyBj81D/tgGQ78elC74J3TbLej6AEmEug5Bkx45/ates+
	kCeUC0Fc0NL/F6YSv/g0GozULg4FuliynS9UOWSvMcReVrVCNTxlZujN
X-Google-Smtp-Source: AGHT+IF9J6YTfX5akGPjOT/s3VBMw222DuUVaFgs0VJ6eOUCfIE607Qv0sYxi3xUVj+vgeq2WWXWzA==
X-Received: by 2002:a05:600c:1e28:b0:43d:7a:471f with SMTP id 5b1f17b1804b1-43f3a959967mr143990565e9.18.1744713962777;
        Tue, 15 Apr 2025 03:46:02 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43f205ecb8dsm207835665e9.7.2025.04.15.03.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 03:46:02 -0700 (PDT)
Date: Tue, 15 Apr 2025 13:45:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: qcom: delete a stray tab
Message-ID: <Z_4458uUI3LURa8M@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This code is indented one extra tab.  Delete the tab.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/usb/qcom/qc_audio_offload.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index 5874eb5ba827..8b096f37ad4c 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -379,7 +379,7 @@ static int uaudio_send_disconnect_ind(struct snd_usb_audio *chip)
 		} else if (ret < 0) {
 			dev_err(uaudio_qdev->data->dev,
 				"failed with ret %d\n", ret);
-				atomic_set(&dev->in_use, 0);
+			atomic_set(&dev->in_use, 0);
 		}
 		mutex_lock(&qdev_mutex);
 		mutex_lock(&chip->mutex);
-- 
2.47.2

