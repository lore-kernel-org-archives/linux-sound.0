Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD447235045
	for <linux-sound@vger.kernel.org>; Tue,  9 Dec 2025 12:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765283965; cv=none; b=b5bJbfTE8BTA9+GTmAGos8oIdJSQ3FOaEoQuofH4s0qSbgStfp9IHfvJkX2rx3AnmcKuAgWQwA30c9+PaAYGUfPdldu9WQyjrFxchpSGQhTe9nvjC2YcBaTObq4f3/Hva7914KAxmsm+poly5CRdeJ1/wnyLhMJXm1H7lYalfPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765283965; c=relaxed/simple;
	bh=rzXfDIwf04JC9WRQdF764eFfzm+GPW8y2L6B4lwJNlA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DP063ssWCGp5rRpchpcL96abs1o9pWrPScHVxOf/rmMpjngbjdBbxdoqjh6feY2FjvTtPfourxWiqULmcfzO3o6UmEWvhDUdXXsgJGuQCAQ6Ue1jbWKMDbh83eMTCokg0+WnBcUrdX0dTycAioIu6VpyJ5H8cBScbei/19WxT78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=RvtHTKNx; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="RvtHTKNx"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b73a9592fb8so141842266b.1
        for <linux-sound@vger.kernel.org>; Tue, 09 Dec 2025 04:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765283961; x=1765888761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wm1Ne5e4rQCx0QN0aDMKY1hPKkGIUPHS+P5LK+o5mDE=;
        b=RvtHTKNxZP0M442uiNzWbq2QdCJyal3HM3EXHW/KB4jeDQvf8m/qygRDamkgKl8L+2
         CqE+aiXgwyWXlHDOAe/Y1IjFktNxOokLp8BRh1MwSV/1inRFKYRdzgmqIyRwiCg/RgSp
         HYwhUbxqKY2IJVJFR+nbO2STppzishFa8LFZ9loCP/XKHHQYuLlaCSzQoOKRZB00DlOy
         amH1cnfQI+DKjxqmAJdEJynz3nTrkFmK6cYp4YoxRyw69SDThUqrDynOyYNnB6AMnJ1z
         EtGt0gJp5Hl6om+lD1l7qPC/C1RR3d3uT8r+g7Xl1Tkp4xyo0mepWyQnUGgdXCWfrFU9
         q3lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765283961; x=1765888761;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wm1Ne5e4rQCx0QN0aDMKY1hPKkGIUPHS+P5LK+o5mDE=;
        b=st/53d8iIYjdCD0m1W2+PoPgQsqGPd5bwxaDt2CXzbiV+Iji25KaY8hsRwyT5z3hly
         WwfGSIVkBHpMBo/1fo2FHTbfSFswBIq8NKF/fk/wolCpNtVP0AdVAkbp4ToOhKLron9D
         tvePamZfzU3GTARytGVIMQ69EYHvqDqraz66lxoyAUPt7I8XWgq3icedZDzgcRCVTsDF
         ZZSGbUCcnkmmtpbFRO0A5eOjCDdQrw0L6/O+gWmEMlCLRmbxZ73hA4GgvdAqpz59Ru7Q
         cQfPlmkugHVJNpMZOQFEjdP6lu6hBs4EvS+rOlAX0Jnu4cLth6ic9UiNTT5m3gKLF05C
         PIKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqGdmGilXop0pjaKtYbd/yWu20hsLPafJ3Jy3lFOw0Bw7UV6AqoTwOJB2PlKCVLtETwr7cCN82OZ53sg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzcZLjB2+AvCY8fmKRZwAaB42PDxa3LesJ6UBKzBeo+4HpK7iQK
	O41B2QjFsb1EYX2+lEN3SOrl2P9szy1MoHWS2loYsEPqKApHJ7fAtQlT4EW0Z8EwmcQ=
X-Gm-Gg: ASbGncs4JAVGrWw4LlclHG6Koafj6djWqjfUD+Qhe//V3btNdZR8lh3AluDLWuXxKCO
	+pJC2pDq5gNIpr3NmkQiS9UKWFgxMzH5CuAdX4CHK1jl5lFo2qtfObS4HoaWDG4e2zn1Q3o8mf1
	V3XZJCpOxmngU69OhZ3yWk8pvTQX/hD2w9znwhFqHB8v8y/P5YE1wnkkBr4HFYGhj8SfLrdKXdZ
	i9WkAkGYUj15eLprswHurijFHJTx4oI+nSI/ijHB/IUJXC0Fp21Jj0TMzerxhsmFib9y280DetS
	YFawCXtHxqcG1S0l6WN1ol/pOV/xvVhznwYfEoLUV7yjgKU8QKEs7lIZ60UckjVh01StlsmmD1r
	I9Trp1vE83M1rf2m8ejWvapqtDnsbAPbrq98PuUT0cVx/hE0t7cxbZAaWkwfJRUH3vFEwbbf5R9
	N+h94bcSV1lttDW4H3stfnitwHa9QabFkE7I+4twM8LhkcYvDSa8ZRei+xiH7GMFW4fpIcd4esp
	TU=
X-Google-Smtp-Source: AGHT+IH5JIvRZdM1BmtUxwezCV40W6mSYG8hdgs4bYZLX9q/OOD/Qy8fEJukFD8Xy4Mw5w0AFjMHXw==
X-Received: by 2002:a17:907:6ea3:b0:b76:d4fb:c30b with SMTP id a640c23a62f3a-b7a6eb35b55mr140253466b.27.1765283960835;
        Tue, 09 Dec 2025 04:39:20 -0800 (PST)
Received: from localhost (p200300f65f00660846b2ba6e435ad603.dip0.t-ipconnect.de. [2003:f6:5f00:6608:46b2:ba6e:435a:d603])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b79f49a7951sm1405990966b.49.2025.12.09.04.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 04:39:20 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-sound@vger.kernel.org,
	Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH v2 0/9] ALSA: seq: Use bus specific probe and remove
Date: Tue,  9 Dec 2025 13:38:42 +0100
Message-ID: <cover.1765283601.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1612; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=rzXfDIwf04JC9WRQdF764eFfzm+GPW8y2L6B4lwJNlA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpOBhVHJqedKI/WG8APTXLd8d66fffQQl7VHG0+ 0y9wjscwCSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaTgYVQAKCRCPgPtYfRL+ Tv11B/45l+rXMhkryk8XjJJTbFeRWUwkrO66n5OgD1iMkLaDjmhYS/M65I89XpUH4L3Hekt2ZxX ilhQvzUTYyjsrDE5PDgIg68r7TtXKGUsv7tlZwNTecJaqyFnfiMPRHnWRDap3VgnIn8jnxvLgmn ow6VAWdWvYM5/nKgIMrPjPPXwAY/Cmp1s55XK08vvZQxXZiQ6X+E6TYKN7xtuAF4+3WouvEkOJz 6Xeie1Miwmhn4eAR4vnxljVT4p3ig7HA5azpQMQDe93J5Og0Lh4jwVmN8blNvKO1BvEQOEMKiHF e0tZnQfxSpRBA4KqDAixH0et/Eu1a9hyavg0sFbyEvfPU2TG
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

here comes a v2 for my series previously posted at
https://lore.kernel.org/all/cover.1764677854.git.u.kleine-koenig@baylibre.com
.

The only change is fixing a build problem I introduced in the opl4
driver (and that I didn't notice because I usually compile test for
ARCH=arm64 where this driver isn't built).

Best regards
Uwe

Uwe Kleine-König (9):
  ALSA: seq: Use bus specific probe and remove
  ALSA: seq: midi: Convert to snd_seq bus probe mechanism
  ALSA: seq: ump: Convert to snd_seq bus probe mechanism
  ALSA: opl3: Convert to snd_seq bus probe mechanism
  ALSA: opl4: Convert to snd_seq bus probe mechanism
  ALSA: sb: Convert to snd_seq bus probe mechanism
  ALSA: emu10k1: Convert to snd_seq bus probe mechanism
  ALSA: seq: oss: Convert to snd_seq bus probe mechanism
  ALSA: seq: Refuse to probe seq drivers with non-bus probe or remove

 include/sound/seq_device.h         |  2 ++
 sound/core/seq/oss/seq_oss.c       |  4 ++--
 sound/core/seq/oss/seq_oss_synth.c | 12 ++++--------
 sound/core/seq/oss/seq_oss_synth.h |  4 ++--
 sound/core/seq/seq_midi.c          | 15 ++++++---------
 sound/core/seq/seq_ump_client.c    | 11 ++++-------
 sound/core/seq_device.c            | 26 +++++++++++++++++++++++++-
 sound/drivers/opl3/opl3_seq.c      | 13 +++++--------
 sound/drivers/opl4/opl4_seq.c      | 13 +++++--------
 sound/isa/sb/emu8000_synth.c       | 13 +++++--------
 sound/pci/emu10k1/emu10k1_synth.c  | 13 +++++--------
 11 files changed, 65 insertions(+), 61 deletions(-)


base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
-- 
2.47.3

