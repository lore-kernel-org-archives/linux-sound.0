Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61E61E871
	for <linux-sound@vger.kernel.org>; Fri, 21 Feb 2025 00:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740098846; cv=none; b=VNI5gs6qncO9SsEznrCh6lrATS99WGnBMsDaiW8dl/28FAl9lUnTYLSOb3mvlSWXQcMUqzAUCApYv1SsFjuxLxbBTC3lUYY0IW1TQj+GPRxyQzHJErdshzSp8GKZWBGY3j6AQ0MSmvI7/EXI/3P+9Q5w1QEpgmYPxtoXGDKnO7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740098846; c=relaxed/simple;
	bh=AFMZD8xA79SrcF7qdF9M6LpkATxyi3gQbmTSSDjdeMU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=IBJx/ER6Mw0OVaLdge9lXJ7EJBXNQ230WjJaiFEaBOtI17A0p/BCViEJzmkBwS8wjjh4JYq9oTml/CNe/gkoiZRqRDt2nYoGZgykAfw35k0A9XiAYw3n/MVGF8CydwNJriV4M/mGNi02oEKJVw6CxCk4wRmK3Ylj0XvWh3wREHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SPbadOSg; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SPbadOSg"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4397dff185fso13387865e9.2
        for <linux-sound@vger.kernel.org>; Thu, 20 Feb 2025 16:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740098843; x=1740703643; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1uwzXKEnNeEIPu52I2DCxojSGUOWNSCkUNKbC+s6sxg=;
        b=SPbadOSgWdR2bVUHmyVLYXoeXl5elxDHAqEFCVi8kUac67RWfOTSOTVAjcAXIvg1bj
         RUjJhIhMSgC1GCisOCUZ30bu/h9ylImmJ5y/R4Yv6TNX4WVzBTrgiDW0DH+n3HbzzH0B
         OjERvsJxu3TgXmgijW5o2RqaHPqEQgLbXYnETfqQJk8xILLLwa10032crjdT0hYeGlDi
         rMdakWDjCpL6Bt34zMn7L59lKTER5FTJG1p2baViBqWszVeLTObf1pPdYoNkP4EbDwq+
         7rsMGz1hdw7RgPMaIvBoROQ+XphYhwgXF8HTIgey+STtdeZYz58xltzxrharMTVrAzDO
         o0Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740098843; x=1740703643;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1uwzXKEnNeEIPu52I2DCxojSGUOWNSCkUNKbC+s6sxg=;
        b=HIRjOnOnTPFTVAavMVT3NF6fEkjEg4AR/pF8Vj0+udhV5zVOvXqYQetYgeV/aFQE0D
         N8ORvJJ98SenPDadyaPZHSDyym7hFaMXSJ80Wsd/2DcFbTlCklcwmej0gStlD/YDwZiG
         DszHAzjchnDpkkshdx8S4Qh4a+H59E86gHgyE4s2hwNoWC/wop2VREpNaQN/UH8VWeoS
         oy3Kwihdx768inXkZkxNdLF1YuLw+NaRDvjLlh7IC/SSin32H0eeuzWyi4RJH7RN/gOg
         11iYOb8gBQH2HgxapKZ2pGUiWovT4kzKvw0PCA7SeejhP/GA0dTderGd7OZZzjQtuZsA
         B7hg==
X-Forwarded-Encrypted: i=1; AJvYcCWN1HeEaxWS3WYLuRHFeiIachJs/bCC+AlXfgY8UfImOkp6FcD3glrNkPJdAKJA5aO1HH/YJYwNYuudxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzknZFz9h3Ne1vVRzSP0yg+cuHSTAbO9BY5MLOB58RN/a0JIshG
	tOTgMmJ2Jt180W5XuJi19tbLEXbObKNeICtR8sy+3/BC1RCaslx5L2JGWMgRbmA=
X-Gm-Gg: ASbGnctcPQVYHMFPOPnpbmWVOYilYvkiPLPA8g3SR9ZlN7HBWBAQXIMpHmeMe80WDfG
	4qtf89Lvj19HdlKpGbRH5fZu8VWwQ4XwXLB4qL/XNJ+ebJylj5cRuaSguU8So/smIi3hXZ2gTJV
	TmPYQc858lI+4FzpZLF8H1dmFMh/9+/uwQK6GLu5cW5ktXgxn1ugUtMdcmx201Ex19ZBInTPT9m
	j7glrc7N8BYMl2e/dhphHhqkDOipKlhf/sobWs5NJu5pU9WukNbKz3uU7kD/fYf7X+fxY/CIPVo
	Vvdv6QfTKgc3UTv84w==
X-Google-Smtp-Source: AGHT+IGP2COMTFmCb6NZD7IEUpBby+MJg1OI/LvEAFrSspNS5gqFhyuY2jzlf6BtHJjV5QSFOV34JQ==
X-Received: by 2002:a05:600c:1390:b0:439:8bc3:a697 with SMTP id 5b1f17b1804b1-439ae1d7e97mr9688025e9.4.1740098843201;
        Thu, 20 Feb 2025 16:47:23 -0800 (PST)
Received: from localhost ([2.124.154.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b0371c51sm877805e9.35.2025.02.20.16.47.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 16:47:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 21 Feb 2025 00:47:22 +0000
Message-Id: <D7XPK4C7YYVN.2H85SNZIOOPAB@linaro.org>
Cc: <srinivas.kandagatla@linaro.org>, <broonie@kernel.org>,
 <lgirdwood@gmail.com>, <krzysztof.kozlowski@linaro.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <jdelvare@suse.com>, <linux@roeck-us.net>,
 <linux-sound@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH] ASoC: codecs: wsa883x: Implement temperature reading
 and hwmon
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Steev Klimaszewski" <steev@kali.org>
X-Mailer: aerc 0.20.0
References: <20250107114506.554589-1-alexey.klimov@linaro.org>
 <CAKXuJqihpwnOTepgTkH3FaGB5=kXVCDOckPGpacJ7JWZXxsKWw@mail.gmail.com>
In-Reply-To: <CAKXuJqihpwnOTepgTkH3FaGB5=kXVCDOckPGpacJ7JWZXxsKWw@mail.gmail.com>

On Tue Jan 7, 2025 at 10:25 PM GMT, Steev Klimaszewski wrote:
> Hi Alexey,
> Thank you for this!

Hi Steev,

Thank you for testing. This really helps.
And sorry for slowly getting back to you.

> I've tested this on my Thinkpad X13s which has the wsa883x, and here,
> when idle, I see an entry, sdw:1:0:0217:0202:00:1 which shows ~26-28C
> when idle, as well as sdw:1:0:0217:0202:00:2 which has ~22-24C when
> idle, however if I play audio, both of them drop to 1C and do not move
> from that while audio is playing.  Is this expected behaviour
> currently?
>
> (out of laziness to repeat what I am doing here - I have bottom
> (https://github.com/clementtsang/bottom) running in 1 terminal, and
> then in a second terminal I either play an audio file with
> canbetrra-gtk-play or mpv a video with audio and for the entire time
> that there is audio playback, the temperature sits at 1C.

As far as I am aware there is some hw limitation resulting in that
temperature is not updating during playback/when amplifier is active or
that it is not allowed to read temp registers when the amplifier is active.

However, we should return the last good value here and not drop temp to 1C.
I think I found what the problem was and I will resend the new version soon=
.

Also, on sm8750 I see the 4-5 degree Celcius temperature diff between two
amplifiers (30C and 35C for instance).

Thanks,
Alexey

