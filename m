Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0EA221272
	for <linux-sound@vger.kernel.org>; Wed, 16 Apr 2025 11:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744801843; cv=none; b=BqAfQVvUdmiLCGLbNfgojGoanzR8IE8uerzPpRX1iHqdMFWsOISt/1yMtkqzK1a2n+qUFPcxdCaarOVou04DYvZv5a/64pkqzMI6kMQdFTgknEekjD4pbFSpuXZGhTi+BJR9n5i+RvG+g0uK3MrxNwqN0Ii/3R2TETGiFqz4eN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744801843; c=relaxed/simple;
	bh=aIHTdtXrovcQwqqIHpPrWRuVUu+VYl3tEmr74h/OJDQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qjkmOrNgG+rOypc7UWut/TSKUHdP/mZX+sgbeZMbXIuYBZWlmHZH4OzZv4Ruz4016uqSDTQeF0UXiNXQ1vqYzk/IG0IhKRCrnC9Ecud6dc3GEHc90zWrmOKt7uOCbM5IfWrzLfj2qg9K6yMmFJ3WPt4W7LiWfBFrM7nALkpRx94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TdtVb3i2; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TdtVb3i2"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5499659e669so7862525e87.3
        for <linux-sound@vger.kernel.org>; Wed, 16 Apr 2025 04:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744801840; x=1745406640; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ekNF6eeVab4Uo0LrcCIVuatvZVAJ2+LsoOg7fzFPhHA=;
        b=TdtVb3i2kezEQWYm72XkS0pnKxjHHukzDgnNE3yAzEHlefjZ/yxRqpbw1KBWggS8KR
         77ooKGfnEMwy7p+4aAEOObGr7ID+SRsNV+k+OmfrpqWs28mh3O7R9YpT7QBAZsCd7nd2
         PNmuG+7asaXaZxDZ+77jNm9laLuL3H9Y0eCB+wTWkdukGc8XhlbxmfBR1TxVVfqlYjBB
         m3uVsl+M4BKmycoHtEqNaEWLyQ2snCvedBlTWRdJuFSgM696ILxQeBQ2b1/h3EbBj3/g
         QYoRFMgebgNsS3/vGJwFq5kP3nEykWVONlHTqT0fIYJK64Wy+58Zpq1aQ/Ja4LNuaemb
         A6DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744801840; x=1745406640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ekNF6eeVab4Uo0LrcCIVuatvZVAJ2+LsoOg7fzFPhHA=;
        b=Q7/YTxI+NVhYdQVarSvOmrf4DSuYM2R1H6jjAh5NKyq3zlJ/zvMzMACehxIOHIb0Hx
         MKZhybzGHY0ww2si+71qn0rqeLtBL8dyGB62MruvPW0xo5B5jofWp8aIQmBL1z9r40HH
         0Yv6LxyFJmYNSESc23TtnhqeZgoKZ1qFPIFhA7GetQILVjWQVxyizijmmbdQxw9cSq+N
         vf8ud4dFBwUN+QVQFNxXJ2AQExsxUUKmmeXseOaAfCuj0Kh1AZD2Y+AMhumi9sgzK3EK
         lB9NNZeRqd9/Hh4L69rtDqelXbIf7v3pqWN3rIKy/DAl53/Hky0bOrqhKtypqJCFQCaX
         6KZA==
X-Forwarded-Encrypted: i=1; AJvYcCWSoM+5XrthPHE0i8TLlWArwBBirST40PqHg7A5pt8ZVMibUXERs3y5qVTfgvenfrTUeSgSonMxKzXQaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjl++bJrbXnw8GWpvUrO5ezOfFxofheXP2ghZtK4qi6WWtnRbC
	RgkLqcjYbjvI9KLEq4H/CMZyq+Kz2rdurkqodJrM+6WkNmK738qHFSZlY1zgYOLAvbnxS9VUm3T
	y642FK0YTo4xFONxdpnDjdsTVAcF0tnhaxFXVVw==
X-Gm-Gg: ASbGncuH4vU/tCJeewya632DZa+JJ4ym7zXBOwWQYO2T0Sqsn/btn++e/glxgtfWo8s
	1iOc1nN1QZT8lOYHEW7Aed7JWJEPmGifoMDbZ3gMVPmIvEE6GXDLPSu4M/x3seztxqvPafatDk5
	Z8nK1cbKH8abE0K103SsoZYg==
X-Google-Smtp-Source: AGHT+IFJxSGtlbphu0zzm/tLIgAsfjlfNPskCyQgArKiIETLbKMVULJO8nK1Awrz+YF4keJ5Rt5CFlu2O1VWaiFfeZ0=
X-Received: by 2002:a05:6512:3b10:b0:549:8cbb:5443 with SMTP id
 2adb3069b0e04-54d64af1131mr475421e87.47.1744801839803; Wed, 16 Apr 2025
 04:10:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408-asoc-gpio-v1-0-c0db9d3fd6e9@nxp.com> <20250408-asoc-gpio-v1-2-c0db9d3fd6e9@nxp.com>
 <5004055.31r3eYUQgx@steina-w>
In-Reply-To: <5004055.31r3eYUQgx@steina-w>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Apr 2025 13:10:28 +0200
X-Gm-Features: ATxdqUGTg2yfx-ZdJ4mEnvtRKlUs-ZPmnmkn-6jlvjsqFPdpAqa_pDHyEOa8HsI
Message-ID: <CACRpkdYvEsxaP=iqXurBz43M_GPKkYRpOp0pOHQqAWx6UPEEiA@mail.gmail.com>
Subject: Re: [PATCH 2/7] ASoC: codec: tlv320aic32x4: Convert to GPIO descriptors
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Peter Ujfalusi <peter.ujfalusi@gmail.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, patches@opensource.cirrus.com, 
	Peng Fan <peng.fan@nxp.com>, Markus Niebel <Markus.Niebel@ew.tq-group.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 3:53=E2=80=AFPM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:

> > +     /* Assert reset using GPIOD_OUT_HIGH, because reset is GPIO_ACTIV=
E_LOW */
>
> As stated above this comment shouldn't be necessary, it might be even
> confusing if there is some external inverter to the GPIO.

I have added comments like this to many patches due to spurious comments
from developers who were not aware that gpiolib handles polarity inversion
and are confused when we set the value to "1" to reset an active low reset
line.

At some point I wanted to define something like

#define GPIO_ASSERTED 1
#define GPIO_UNASSERTED 0

And use these defines to make it absolutely clear what is going on...
But I didn't get around to.

Yours,
Linus Walleij
