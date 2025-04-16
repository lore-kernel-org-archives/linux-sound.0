Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4ECA221272
	for <linux-sound@vger.kernel.org>; Wed, 16 Apr 2025 11:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744801929; cv=none; b=J5IyCk6k6rLtjFrTEWbSrrKNiQIDwLcaYfz2wJNZf3Q4dlLJiKYqbibzmlJUvBcnVkAvlRUd/vsWH/MY2vaL0n3CiS1Y8vfQIMYQJ5T9dDyZmZ94HecHwv3BT/+47sCx98dAfA2ZNpPm3hDdbVIP6aROZF5a5nWvXrC5Vn0unic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744801929; c=relaxed/simple;
	bh=6u4D9m9m7RDulIKmQ931tc+SVsJTlrnnAHXzSj0fR1U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Nram+OCHf95U2WBpkp/8lcSaTF0N+pwnZ2bLP8AybrnT84e4EEaWguWP215eFesSAaRfHYd3sfJUfXN52qbqm+4y/eAU8UAAAj/vWHKAIr6tlPwvorCn5uLAeYgRW2SKiAEF2vUsZxKbZA42iWsZ/gNdhRP+bAHqc8zTOODtfD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w14WpJp7; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w14WpJp7"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3912d2c89ecso6257587f8f.2
        for <linux-sound@vger.kernel.org>; Wed, 16 Apr 2025 04:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744801926; x=1745406726; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DLlUKGtTfL4HvSwbXA+C5XZmqVyJno1V3Yyb6W9bnI8=;
        b=w14WpJp7gkKny6eOYZRSOhAC374e+NirJgQ0tllt6RsDj2CYMhwYZzItd3/2ErH1dm
         Ju8IfmVGYm2TbaY6Jshd2Lf8Srae55DHmUyqaXxKjZFiRt4xdLW0cxxUYB3P3Dbz8G+d
         tiLObnwrpVtxVEhty1DMQfwDj/RB4KXpWJMIWMSYHjGm2MJGnwXC1w5YOwyBfL6nZAVa
         33AsOeV004kaFaNBfc5iRyvgIP9hpcP5G7fJizOJfEQ239aixIXf2wqAPdyy5OXBoNCQ
         OLspmUrEf8uoHzNplRqRle/13q5F4zzt0dtRKvotmnre5lO94eZoEHADMIH8l9uIT12/
         lWJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744801926; x=1745406726;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DLlUKGtTfL4HvSwbXA+C5XZmqVyJno1V3Yyb6W9bnI8=;
        b=b0Oy+IL/gNh/Oy78FfzBKUvgU6F0n+qNHd5Xh8UWPIMUIWA9+PrJxaS/NyF6Gb+geK
         4KrU21m2xw8I2elg9ZoWTGR0WGpinFX0baBvypN03o+iwK4a4mdDQLTFUA7zMTVCX4WN
         6KBjaGhPfSvOq/zPPvlmqgB/jSZSu2xt1NqdoY9e3OnEAGR/N37VZIM5AwMFGa+1uF7Z
         L+0L4V/HuIdvyykrIIftOXuhhak7oF+NWh85PAgPEtyLuZy4F6yAfeNgtu28uQ2xOogW
         6s/Uzgupw3GuvFQ3A7r4jGM71XcWtigKqix98FXq3QFv6+eO6Nm0UAA86O8Dnx8I90qm
         MDlA==
X-Gm-Message-State: AOJu0YxLxHICml0Vtf/ZJJWbOf8DAWWtbJcnPZ6kgeiufxAW9ZWfaJgu
	2NemP9YiGnv5I/z+UkbTUlm0ysMAJ/k6GWZHadoKAPwuFPPZp38GSkZR0FfunQU=
X-Gm-Gg: ASbGncsP/zUG1Mpfam2MYpAoFe8lZ/nsz0/Uj99IHmeG+25G+FTLHVWlsiS135NZnMT
	RRXc8Aw3+bORwZxWGJgQuj9JDAeN5Qa5sWiMw5p8xTZ4YQxNf7Den1ig8simJlfbEe0y4AZ7XxC
	wBn6XbV8W9piXkFeYXQrxc7EplUPxTOttqnyZOTvbh3kF0oatHhYgbOJhbW1p7JGOhcP+PH4GuM
	tf2lI7SIpCDzHC1zOyzWkpvpflhfj99BypgM5BKkpLgVckHr/69W/m6q5Agnh7PuQ6BAL66cFx5
	IZ4O90TfxWiXN/rU2Om0nnXoLod0yIaDYw5TBS8xTtse+g==
X-Google-Smtp-Source: AGHT+IGTAEWTesVR5WHg9QUllzKMb8LX8+ovoxGpKrAjen1UXUgQu0tRkRxxn+n0rmcGJZGqi6QBdw==
X-Received: by 2002:a05:6000:2207:b0:39c:266c:12a5 with SMTP id ffacd0b85a97d-39ee5b18835mr1344218f8f.13.1744801926029;
        Wed, 16 Apr 2025 04:12:06 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39eaf447777sm16594628f8f.100.2025.04.16.04.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 04:12:05 -0700 (PDT)
Date: Wed, 16 Apr 2025 14:12:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: linux-sound@vger.kernel.org
Subject: [bug report] ASoC: tas2764: Apply Apple quirks
Message-ID: <Z_-QghDPBnqE3Y6X@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hello Martin Povišer,

Commit f33b01e0947d ("ASoC: tas2764: Apply Apple quirks") from Apr 6,
2025 (linux-next), leads to the following Smatch static checker
warning:

	sound/soc/codecs/tas2764.c:128 tas2764_update_pwr_ctrl()
	warn: odd binop '0x3f & 0x80'

sound/soc/codecs/tas2764.c
    116 static int tas2764_update_pwr_ctrl(struct tas2764_priv *tas2764)
    117 {
    118         struct snd_soc_component *component = tas2764->component;
    119         unsigned int val;
    120         int ret;
    121 
    122         if (tas2764->dac_powered)
    123                 val = tas2764->unmuted ?
    124                         TAS2764_PWR_CTRL_ACTIVE : TAS2764_PWR_CTRL_MUTE;
    125         else
    126                 val = TAS2764_PWR_CTRL_SHUTDOWN;
    127 
--> 128         if (ENABLED_APPLE_QUIRKS & TAS2764_SHUTDOWN_DANCE)

TAS2764_SHUTDOWN_DANCE isn't an ENABLED_APPLE_QUIRKS and there isn't
a way to enable it without editing the code.

    129                 return tas2764_do_quirky_pwr_ctrl_change(tas2764, val);
    130 
    131         ret = snd_soc_component_update_bits(component, TAS2764_PWR_CTRL,
    132                                             TAS2764_PWR_CTRL_MASK, val);
    133         if (ret < 0)
    134                 return ret;
    135 
    136         return 0;
    137 }

regards,
dan carpenter
