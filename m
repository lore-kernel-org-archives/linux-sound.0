Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RyH7+INx"
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97A2BAB
	for <linux-sound@vger.kernel.org>; Mon,  4 Dec 2023 04:29:52 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-40c09ba723eso13085645e9.2
        for <linux-sound@vger.kernel.org>; Mon, 04 Dec 2023 04:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701692991; x=1702297791; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aUhRTS4iAhhl+KZItDinLEHOyoi9efgW3+TWBHSVYFs=;
        b=RyH7+INxRtH8z0JEAg/7xFaWy7zJsa2hGe0aThKpVskF7wxdyPG4Kq8WsE/rAiqS/f
         D5mxcRCd14BwNcZ4BAlUP2hSMmYdPnSLeC1+ePH57EhyslIstmId0nNWbu90wt+abbrm
         sk06vtUAfKVW2SAyK6skhedbsem+Zw9eFJKXFLALyUhbcYsXcRdYVUNvG6L/nV8VCepY
         JSpa0+r/xL5MjJL28Yw2LlHUm6XFaRh+hkuDAc3z+aDq+fPPxw4QVWl3JumS6xiT/lmH
         FSmYyYPZHp3woJuwyA6bXlLJkCIdcROD5b0qYkIQu2EXMI/fl9ermwziLtezSOX/8Ema
         3CKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701692991; x=1702297791;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aUhRTS4iAhhl+KZItDinLEHOyoi9efgW3+TWBHSVYFs=;
        b=FI5tMApk1EYAvyip/GxhKObwB9W/M2jGXPszA7FG/Djj3Y1J4IEi8LmRVaIkzNmgmQ
         i3f2fry58jc1lj7UGoO/yWlwX/E9VQZJKAjKBTrCZcYyAPqyajTeGz2JttzQfV8E07+8
         BLoABsXcVBkAneMh+zDGna1znrb9PD2KzqW2P3e9ZWrXKFhxl7HICGLKgEv6ae9XwrXT
         acCdNzJ9cVmY4yJFeijRj0WN2RxVR63cn26wT7ozZ+FML7HYiSl6mqNI/iB7+V9NZn39
         uueBIEAPAaZN/iBedNy39ZLvMDJrPJ4tFxCvxHHDTabrksRbKcqj0wyetLK6Vubjaa5W
         a2Og==
X-Gm-Message-State: AOJu0YxeTzJptDVLkSLR1eZ9i7pH09hSm+SRsOS+uWDn6oeRnXidrdro
	8S5YHNAM6HAIYgFgrzdZXWA0cw==
X-Google-Smtp-Source: AGHT+IFZs+SwwMGzwq8yZd4jM2EoPYnALJho9VVQpkJYYZPO940zD0oFiAdm0BK1wdKLgDbGBGX3HA==
X-Received: by 2002:a7b:c405:0:b0:40c:7f6:5a67 with SMTP id k5-20020a7bc405000000b0040c07f65a67mr1327823wmi.60.1701692991052;
        Mon, 04 Dec 2023 04:29:51 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id f18-20020a05600c155200b004094d4292aesm14918103wmg.18.2023.12.04.04.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 04:29:50 -0800 (PST)
Date: Mon, 4 Dec 2023 15:29:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Shuming Fan <shumingf@realtek.com>
Cc: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: rt5650: add a missing unlock in
 rt5645_jack_detect_work()
Message-ID: <0d18b8b3-562f-468e-991e-d82d40451f9a@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

We recently added new locking to the rt5645_jack_detect_work() function
but this return path was accidentally overlooked.

Fixes: cdba4301adda ("ASoC: rt5650: add mutex to avoid the jack detection failure")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/soc/codecs/rt5645.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index a0d01d71d8b5..caf922ca90f0 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -3314,6 +3314,7 @@ static void rt5645_jack_detect_work(struct work_struct *work)
 				    report, SND_JACK_HEADPHONE);
 		snd_soc_jack_report(rt5645->mic_jack,
 				    report, SND_JACK_MICROPHONE);
+		mutex_unlock(&rt5645->jd_mutex);
 		return;
 	case 4:
 		val = snd_soc_component_read(rt5645->component, RT5645_A_JD_CTRL1) & 0x0020;
-- 
2.42.0

