Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5693C2787
	for <linux-sound@vger.kernel.org>; Fri,  1 May 2026 14:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777646460; cv=none; b=qTXJW3tmWjLCWGpnldUxWoJGbukYfz3qDFBpb4ePKx1NULsNtbCYkDPy/8XNj8JGFo/7hyd/7+aMpCNDbhgmYMlzcEOCnYDiO9dopl5DMhE9kDaD/X0msGMeVa9xautt12OD6PIMSdGpE+nBm41mTlFNDAKE8evnjHozIP2RVTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777646460; c=relaxed/simple;
	bh=axhZE7iq4V4NfKtkFtOnf9unIcr5Q6pw8mBt6qvrky4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p6g9rlXbTKiSmloOpgS67NN3BkYWoUAFtVr/YVq8JRGmxL9BAAen+Ay2yI7Oddqm3cmpPgpl8ievZ1loj7eORDmM01bZwUSB5cYQSsrq8Bc9HDZSQiDbUG00W9CIkIDqyng0NPJfc/Geuwz5/W175xbNrO/NaHzzqWjW6y8QISg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RQrgPpYN; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RQrgPpYN"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8b59772d441so4906886d6.0
        for <linux-sound@vger.kernel.org>; Fri, 01 May 2026 07:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777646457; x=1778251257; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=axhZE7iq4V4NfKtkFtOnf9unIcr5Q6pw8mBt6qvrky4=;
        b=RQrgPpYNGtyAbT/hwsUN3smG0TtRk0ER4qeekKs0D+bIj7LZeSm0DlKbbwBr8eRLX3
         +UO1uCxCSRwlW3+dylrKI9R85XtCJuQb8I5y6/nu8AJyQuAQ40txrLggKxFARwqYwhVS
         GJRgalO40GCtI1NYOm2xRoLH6/bU3D5d5fPPWpohoAFloWGHQZRehhw8m2dQGK6pju+e
         3WI5N+2CB/CnXhXDo8xwtkcvELyNCoJgv8bR2SM/fg7A7wxMHjs4Z5LtoQYaBSwA64Kg
         UiwCpcpUQP3T5haqHUQjRkNNB4GoO0yIRfPyJUGSI5ZnlB7vx38Agy7rz8Tx46WVlwTD
         rd9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777646457; x=1778251257;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=axhZE7iq4V4NfKtkFtOnf9unIcr5Q6pw8mBt6qvrky4=;
        b=gSb2zjGTX3oLd7VX4rn0tkfEx58Wiy8vZi6UmK8GU2BXyucUEM0xDfIBjbO0gbtgVs
         9YC+vM86xMijsYYQRJVsGNU/agJIDjCNxkRa5kIYKLt47ksTTCeeDY7WbTnp2rLvbVST
         yxA6uw0lQx+mBEOsV1ebsz5hRL7TofRubMOA9igaZSjP1htNfUGg1Ee696dwtot3trLU
         EO6M587OUFHvCZXtPGocspjHrDCrJKd72A81JkzRRgQiLj1O3fOOhHZirJWWvvHB2FVK
         lUY5TO3LCObT0CoavlhalbMSYxh22my6vbPjc0lEFWjw/MeHYqFcK2ie+6fkJ3FIwUec
         Sz0g==
X-Forwarded-Encrypted: i=1; AFNElJ9Vu0zX0t9adJlRKTY9GgKm371d5ISWJzy8QXnlJLb7h1c0nNhnEyPi2+r7/f6gQWy71Jleh8+HYJhzbg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyE515Z467dkfAwUJyrWvVhQTQgcxVh6YKYRbp5lSLKZ6ZA+PbS
	PyNmo3ybd9BdkYGlxFGc5CrsHT3H+qqOqQk65GhvFMToPf6lFBJTSSSZ
X-Gm-Gg: AeBDieud5K5AxkghG70Hz4WdT/InfHRhbkKoGkQRAlhYIKBXbR0WrtgjwlSb45GO1Yf
	14gtNO8BrO/IBEHTSULv74LxWYJBGYp905GxPkPpv2Gfw2ZIuBO9RNgMEA7++2hXAxFQV3sivJT
	8lrjmCg+3VEXA92rVLK5eL0gAlNiA1Ql2N224VN9zoZ2z//3+dHoo+4KPXmJtOE1aNjxHXyYQHg
	UNxQH3v37jzMaf0ehyU9sW40QDBAthGMMgfd2y5lT1M9xYp9aSKMBIHX74a7GHFNYU3hmhPxT0B
	mQILlp4iNamVQ4b5iKEaIAHuj3OqE3ic8VkKXfViSfoymKfbJk9Tg6lhDSY4MSf5qId2l8nl2on
	edihChqU5EHW1/h2KuQMo1UfZOEcz9CEbSguXKl1I51dvsmW2MHy5iGMns4CdzUTDTVPUCfEWHs
	dcsAGyoRceAIFQvO3rOJIQNWEYldXe4bk1x2Ek4YfiZheWsCTd3kfRIL6Tp5Cvygc/K0gWaP1Va
	UzISFCtZfgxy6z746lTsQGWVxsG7MKAdiKH
X-Received: by 2002:a05:6214:3012:b0:8a1:3ba4:9832 with SMTP id 6a1803df08f44-8b3fe766b5cmr104223706d6.16.1777646457024;
        Fri, 01 May 2026 07:40:57 -0700 (PDT)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b5395c5b4csm26439146d6.16.2026.05.01.07.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 07:40:56 -0700 (PDT)
Date: Fri, 1 May 2026 10:41:49 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Richard Acayan <mailingradian@gmail.com>,
	Kees Cook <kees@kernel.org>, Joris Verhaegen <verhaegen@google.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: ASoC q6asm race condition when stopping and preparing the stream
Message-ID: <afS7rTHdc9TyIeLx@rdacayan>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

There seems to be a race condition in q6asm when stopping the stream
(with uncompressed PCM). When receiving SNDRV_PCM_TRIGGER_STOP, the
driver sets the state to Q6ASM_STREAM_STOPPED and sends CMD_EOS to the
ADSP. If userspace decides to prepare the stream again in
q6asm_dai_prepare before receiving ASM_CLIENT_EVENT_CMD_EOS_DONE, the
memory-mapped region appears to still be in use and fails to map again.

I believe this race was observed since commit 81c53b52de21 ("ASoC: qcom:
qdsp6: q6asm-dai: set 10 ms period and buffer alignment."), but would
need to verify. On sdm670, we are coping downstream by keeping the state
as Q6ASM_STREAM_RUNNING until receiving CMD_EOS_DONE.

Can the ADSP emit DATA_WRITE_DONE or DATA_READ_DONE before CMD_EOS_DONE?
We might need an extra stopping state between CMD_EOS and CMD_EOS_DONE
so the driver doesn't request more data transfers.
