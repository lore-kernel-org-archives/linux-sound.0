Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D89C278157
	for <linux-sound@vger.kernel.org>; Thu, 14 Aug 2025 07:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755157349; cv=none; b=u9+HzUGw7ZUYC3GYmWbvDaNCQwQi6da6MedgUl1oCeG2TVsdzQt0lazZSsA64bDUTV+4BMndg5QNWzzQ8ARFiGABwCU3gJ3T3Ll/MnB+XGuyQVQMN959E9JK+0f2QQS1TCg0xqTfmUAYBP3z/Y+6bFQ/xFaNMzFSIaaiuzw3/tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755157349; c=relaxed/simple;
	bh=+JHUkLzTeUoCKha+f/XwLk8Y7aly6tRIiS1amdi7l8o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AQDy4JAlTRWmAYBVSPw1+y5rIG4+mUBMAdk6Zh+VO38w3wdr459ti046/4spU7cK8y1pw3BV/amTOPenCx9n1gNFbNSb61/WvUNst+vdMVfYpwXazB1U/riEZWSMzbzxhRNQshrM6QPDg58btPn2iWMr1EM8spj1992Wb9pX28w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vDBDqITl; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vDBDqITl"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3b9e414ef53so482734f8f.2
        for <linux-sound@vger.kernel.org>; Thu, 14 Aug 2025 00:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755157345; x=1755762145; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NrpcM8hcPyzNdJylt1IkdHlsz3zNDqVIDbSxyPY/rAI=;
        b=vDBDqITlymz5lAnWeqvORq11VRi9zLauCmrsjCyaMm5k2qm7lUeaMVWaNVo8m3yXsi
         kXvMOTVFpvIo/+CPtsbwTvcHtAQVzxkq9NAzLDlXbxBJSGtk5GWcg7cZmqecR32p2C2l
         qrpygJdAmzPF7LqTWQ3lErhT6o9/4BfLo1qSeThuNkjGfw+5bbc87HncSbjR3xmreiwN
         1u0judSoQNarsSD/A1E5hZyexGjR6VjWbYZVNEjqnFT2mc/dcu+zg5gL3ntBfKnGoN8Z
         qU4e6HDnCdVhHilvUO3LeRkKAQYqvhjEytCRxkoFYoS5FL9kZMLL1s2y9mRI4iRmet4z
         ydjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755157345; x=1755762145;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NrpcM8hcPyzNdJylt1IkdHlsz3zNDqVIDbSxyPY/rAI=;
        b=RL0E+kp2Ts7y11+XkPuIw5oX7DY1qgQ6GZduH66O2kBuFXNDEESAihidTevgKZi4j7
         JG2czX8ESmKdcwxfN+ZlaPSPjp8zEkD0X6Mypqls4r1/5UuyoC4tvfBAxudp6d/K6FCG
         Mw1wX3JWi/iisUraDqqSWn37C7Dnm4QNAnP7AC8QHqEHyX88alEeh1UvyYy2vy2S0NWX
         s8/+HxCldEpbHk2P0FqkpA8VPy1FRbFggdXhpZdPrTVs8LMOE2qiH3KwlH+h6svCCaas
         9AfOTfTvizyK+n+NWOJMCyRge/Vml66OzHSkn6k7dF99/2p/w43dpfQYGxU20Nb3EX+/
         2ZnQ==
X-Gm-Message-State: AOJu0Yyyc0mCyxafExhFLLo9L2MQs0doiuFQjw9cKcBgLYIdICbE4i4I
	BQOPgd1ynsEetmAYkcakdqfQxab/dWfdDZC+iq11+/N0oUcbNW/e57KkfyMmXzlr7RWUWa9tH/L
	eD5jv
X-Gm-Gg: ASbGncvGp4bkMTdpmD2FBlRyyvKjYHfZo2EUs80n5EWbEumPru58sh9j6o5T59dlRob
	xxCN9UNN1DAbT/y0Xp4MXgvVy3gjUb3Rt7eTy4zZKOwkhfrwQnPzM5Z292EzoU3VozgDJN6NY/G
	thmm4i4rKsS/VaJZF4Mis7usw5/yPQsEIE1zb+f5TI2J9QWiZe7LTPRn95k/cyJCh0qtoBp8ode
	0A6GsQCH+6GZR0ShHg7j9Tcfj8oZM8IRX+oEWPBmBt9GRKSyQfcR5NKD5LwzIlpUxruRxB+y01R
	UbJFhuPWv5lI1A5nuiqbOJilFJUVG0/WlFUME0NUR6KFDYiO9LngDx/QSeweZcvPRekp3FE1Onx
	Tdv/xSy/zI2GkeNTm7iBdFR1nCM8fb6W/OzAGvPFs0/0=
X-Google-Smtp-Source: AGHT+IE9nlRHTWYHS+XT3v0YoMOQHumW4jk+KLmLMDhq4Ya9d/8hg5Ia1Cs9M9eKR4IhHg5gUC2RCw==
X-Received: by 2002:a05:6000:238a:b0:3b3:c4b1:a212 with SMTP id ffacd0b85a97d-3b9e414d534mr1579730f8f.7.1755157345543;
        Thu, 14 Aug 2025 00:42:25 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45a1b1d3f11sm10470585e9.0.2025.08.14.00.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 00:42:25 -0700 (PDT)
Date: Thu, 14 Aug 2025 10:42:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
Subject: [bug report] ALSA: seq: oss/midi: Cleanup with guard and auto-cleanup
Message-ID: <aJ2TXWDWOKGSs1Uq@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Takashi Iwai,

Commit 8b887676dc1f ("ALSA: seq: oss/midi: Cleanup with guard and
auto-cleanup") from Aug 11, 2025 (linux-next), leads to the following
Smatch static checker warning:

	sound/core/seq/oss/seq_oss_midi.c:196 snd_seq_oss_midi_check_new_port()
	warn: dereferencing no_free_ptr: 'mdev'

sound/core/seq/oss/seq_oss_midi.c
    187         if (i >= max_midi_devs) {
    188                 if (max_midi_devs >= SNDRV_SEQ_OSS_MAX_MIDI_DEVS) {
    189                         snd_midi_event_free(mdev->coder);
    190                         kfree(no_free_ptr(mdev));
    191                         return -ENOMEM;
    192                 }
    193                 max_midi_devs++;
    194         }
    195         mdev->seq_device = i;
--> 196         midi_devs[mdev->seq_device] = no_free_ptr(mdev);
                          ^^^^^^^^^^^^^^^^                ^^^^
The no_free_ptr() macro sets mdev to NULL but it's dereferenced on the
left hand side.

    197 
    198         return 0;
    199 }

regards,
dan carpenter
