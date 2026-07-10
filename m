Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D48734AB03
	for <linux-sound@vger.kernel.org>; Fri, 10 Jul 2026 21:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783717795; cv=none; b=kGmrdpRjqym780cUFoNAMa81X1B9FhwGf9EdRsBQ5OaXG8Uoop/fIpdK2pGDQIpjYE5Cl14d2gP4l0GAhZ5s+iAbx2q1y3/ARNd/K6d+bgXz4dqGmj9jc2MWtgHG/JiY5fl5p3hqFlZu89cP+n0VpmvpWmkL9XbzTimDphkjDxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783717795; c=relaxed/simple;
	bh=su4eVRqd91qk7OtvutfH5sLq2VmfyLE2Qn1mHmMHJ5I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=c4FgCeL9VPU0RPdH+epeEsdlp32iF4WoSq00sm1zo1aOvMrUN8ONNaXkO6rbj/FHgGm7diLuWLwSNeKznfbih+kuYTZFAUQCGrxT1fMhU1HFfAFYMX+OEVurvQV0DyLLvW4py0H8rBr+sc8h2Hn4xmg7wUdYtGjt/NFuOROFErw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=RYA3Gl6X; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="RYA3Gl6X"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47de008b020so688002f8f.1
        for <linux-sound@vger.kernel.org>; Fri, 10 Jul 2026 14:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783717792; x=1784322592; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZM1sYc8Mcx33JxG91xPslSMUoyWjkZwKm16jd+wS4wg=;
        b=RYA3Gl6X8HZM5ZcDzdyu7MT8DFrF1eRxWFi50e2vvyvMHbv8oX4pM9rqzFhzJnUfg7
         59bgPeNZioqeQ38VuRNi1O/MDth8e4wRWwb9QB24tgUxBbDrscyFFKqJwKiV5W5RzY27
         7jHQ0u/V15B8CFDzfUpv73XV7ISTWh/KpyFmtids3Gf150ruQhwYITj+u2RyZkYDHCYh
         L4MBj8sXqVvjpqNKCQbkjlW9R35++pKiNFJUl9wtiE3U2RKxgDZ3ex2n0MzDu45rySuu
         1tj057BJWm742mYfRte4etdhY5c6n5p7o3IIk9EE/3TYEJLM21fiNUNNqhjRGolZxo0P
         SFkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783717792; x=1784322592;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZM1sYc8Mcx33JxG91xPslSMUoyWjkZwKm16jd+wS4wg=;
        b=dvLqpEdg0bew6uzIUjkc1FlU69xN/se5ouIc/NG29hXW+cL9rwIo3yDu+jaodO53Qr
         YTfRM1myCwY03Yeb30Epd2GmBhXmgzpwiKTFTpJknV/BdntakNxkryV61VMWx8+qRs8h
         wtB8kYlWVVYHDAlGwZ/l2p3o9SeEOI4qjLSaM1Ycv1EuPQZIpYzNq5iEGO3IefxYXvL+
         MnxL7VP7fmfgX35BWdANbbtNYx66fFo8+OkJG2A31rJQQ4Y2FLQJyviQtvSkTt/t0ZW7
         /G5RrY7Ael9OVfyeZ9+/G5ED+/jInfckRfrIuZZTO5qY77uVGKNWJV8AM1Yq+0otY0gQ
         h6eQ==
X-Gm-Message-State: AOJu0Yx4LQXoyiKBbJbkabS9qxZ6NwwEzOWvI42AZa5Mg+f9JZcUgm6F
	1xBZnL25IJgrZ43EmcSVDBPlmuGTq8WyjOhnN9oEbLts5Z058y+bYmMvnsxpcVYah7c=
X-Gm-Gg: AfdE7cnoET4ZsL5ly/OK4RWIidyDh/gh5Kdzjx/WhgUeY2C+iGpPwJNRpz8snKivayG
	fhEUnx8F0JueZY6yTXPR6IeNFv9fgmukPauzzRqsqVtIKoyZA+yaDpBfAqKrOYshs70CyOoOtg4
	RqcS3XOjFiNPTN/j56hbNq+huDPb+dprFbcy22rTitfYJl5YBMQqgKwC9K5khN4Rbi0cgP+syen
	lzUOniUbW8Gt/tfrbwwez1up4oPFo4FD53NfjtwxfVnR7xVlQF0FPA1GTU09ZD/ctC8e5stn3DK
	NkCeJhYpFhpO7uE3moHiVvq46+tWhrzZ8I7bklkC5ovXrjs8i1waHx2AepTLbBSHMQfbvevgrAs
	bSaNt9t7Oe5ORe7ojii0MVFEV9rU3bWhpZeIlSyUhn+puWx0Evgm9QOIvg0vwXoKvbbn1u95yi9
	mW3sxPuzEw8A==
X-Received: by 2002:a05:6000:4b07:b0:460:d18:865c with SMTP id ffacd0b85a97d-47eee0f3afcmr5999929f8f.1.1783717791925;
        Fri, 10 Jul 2026 14:09:51 -0700 (PDT)
Received: from [127.0.1.1] ([151.41.178.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039b0cesm64274135f8f.22.2026.07.10.14.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 14:09:51 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Subject: [PATCH 0/3] ASoC: meson: aiu-encoder-i2s: improve hw constraints
 checks
Date: Fri, 10 Jul 2026 23:09:48 +0200
Message-Id: <20260710-aiu-improve-quirk-check-v1-0-2fdd1b6f8896@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJxfUWoC/yXMSw6DMAwA0asgr2spDj+1V6m6gNSAQQXqEISEu
 DtpWb7FzA6eVdjDI9lBeRUv0xhBtwRcV40to7yjwRpbmNKUWElA+cw6rYzfIDqg69gNaOvc5ER
 0TzOCWM/KjWz/8/N12Ye6Z7f8dnAcJzF29Z17AAAA
X-Change-ID: 20260707-aiu-improve-quirk-check-2b5051119341
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2602; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=su4eVRqd91qk7OtvutfH5sLq2VmfyLE2Qn1mHmMHJ5I=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFmB8fP4MtYdNvoupb1/37q7FVWTNUtuvc1sWdbh16XZt
 mDBvEm1HaUsDGJcDLJiiiws0+/9LihVe2iccLIAZg4rE8gQBi5OAZjIsd0M/2OC/0y6sVxkc+vd
 Tf++PWQ7ZnlqwsSCwAVrlfmkKwR3L+li+CvTk3Hs550sb63/X53iXv6etJ31nVriRLbIM03az/5
 snM8IAA==
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

This is a follow-up to the recently merged series reshaping the AIU
driver following the same design as AXG [1]. During the review,
Jerome pointed out that failing in hw_params() when two streams have
incompatible requirements is too late from userspace's point of view [2].

This series addresses that comment:

- Patch 1 fixes the existing bclk quirk check first: it only rejected
  one direction of the mismatch, and its interface-wide flag was
  cleared too late, making a legal reconfiguration of a single stream
  fail. This is a standalone fix and it's preparing for patch 2.

- Patch 2 is the actual answer to the review comment: the quirk
  incompatibility is expressed as hw rules on channels and sample
  bits, refined against the committed configuration of the opposite
  stream, so it becomes visible during parameter refinement. The
  hw_params() check is kept as the last backstop in case of concurrent
  refinement.

- Patch 3 applies the same philosophy to the interface-wide rate
  symmetry. Instead of manually reimplementing the check, take advantage of
  the core's 'symmetric_rate' handling.

Jerome's comment also mentioned the error returned when 'bs' is not a
multiple of 2. That one intentionally remains a hw_params() time
error: bs depends on the mclk rate, which the DAI only learns via
set_sysclk() from the machine driver's hw_params(), after parameter
refinement has already run. I don't think that can easily be expressed as
a constraint.

Final note. [1] has not been mainlined yet and it's only present in
'broonie/sound.git#for-7.3'. Therefore this series depends on commit
c7852d2dcf66 ("ASoC: meson: aiu: align I2S design to the AXG one").

[1] https://lore.kernel.org/linux-sound/20260610-reshape-aiu-as-axg-v2-0-cac3663a8b51@baylibre.com/
[2] https://lore.kernel.org/linux-sound/1jik7pebk7.fsf@starbuckisacylon.baylibre.com/

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
Valerio Setti (3):
      ASoC: meson: aiu-encoder-i2s: fix bs quirk incompatibility check
      ASoC: meson: aiu-encoder-i2s: reflect bs quirk in hw constraints
      ASoC: meson: aiu-encoder-i2s: use the core symmetric_rate handling

 sound/soc/meson/aiu-encoder-i2s.c | 154 +++++++++++++++++++++++++++-----------
 sound/soc/meson/aiu.c             |   1 +
 sound/soc/meson/gx-interface.h    |   6 --
 3 files changed, 113 insertions(+), 48 deletions(-)
---
base-commit: 8e5a6599a38e5515cd2b5f34fe8a8ac476f8b127
change-id: 20260707-aiu-improve-quirk-check-2b5051119341

Best regards,
--  
Valerio Setti <vsetti@baylibre.com>

