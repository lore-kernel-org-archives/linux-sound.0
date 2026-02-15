Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002C12744F
	for <linux-sound@vger.kernel.org>; Sun, 15 Feb 2026 04:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771130784; cv=none; b=lgUWGA9250nLcCyqiA1/D9Xg0yOmyBmme7yMX6WknHGV8vGjNFR2MvBld0fGREFt+BZBbFthxOLzMJ4K7pFMTDhIurMYciKLf+iAykQDkdZ7OJ4NXnOU0JD9Geh4Botd03lsmW/e2Yna4/bxQJqd8Pli35ZXSwXBKE9KQbP1SK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771130784; c=relaxed/simple;
	bh=U8FJzQXnn+mKbMliS2ejiLtvU8DU7y/9t5DPoqSLLDo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I462/nEFmyZ9coft9bWH51zfAMCaa7IC2w6HZ5CvvHfMBtdfr6/Dca3M7PL1EtZjsqhgkW506w1HMFfd3+c8GlktsPBCqZSajeHmfDaSzxebNMdIA5dqkBwGKtK0yOj6fgBMklerblTLX8Jeu+4EzMZ9xelaegatiSPSYReFCx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hj9FrWYA; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hj9FrWYA"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c6dcdc955a1so743051a12.2
        for <linux-sound@vger.kernel.org>; Sat, 14 Feb 2026 20:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771130782; x=1771735582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xN4En75Gw3C/gHIPueO24/sGxfKr5v98CYwTcm6sifU=;
        b=hj9FrWYA5VfRLTm5406AX7wMFO/mqOpkNF4vZD21eNVm6hI0nuhCHA5XrtYHvZ1Xoj
         s89vB/mKVima/JPiqVIObpLiTn0fxkRWF9//yONCh0bA6P9cBVXD/njrQ2jsU1mblra5
         hWb9BjYoA7kXU2lzf4/YcH+sKcEz+2RRlim85ukHj+KtsvIUpbIC/lhZmvbqN9TscAqM
         8zn8VKBzd+TcAL7ynCOeI7iDM77qOZ9C1rQrt9QmiHDQQOY7cPCWgHveHKqoHUkoMW7p
         YdcGXtvCbv96nCjlCkDoKkMt1/s4Qs0ks5rQP3mts1zo35WuKgYeNBDEiBu+b9tH/tsD
         87RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771130782; x=1771735582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xN4En75Gw3C/gHIPueO24/sGxfKr5v98CYwTcm6sifU=;
        b=m9J3kLkFOEk9Hg2DzWs6mnE7yhT1+lambdmrtS1azTx7lpK9CXHEsy74lnN1VDEbbe
         thfmtuZI8Kl2gOUVqNX3GMIa6xiyw5H5m4IKiA0zd83Z5luoLmK36TU33Fp5By3tokLm
         IskTURC8yaP28Qh70uejhrSKBfmUaOfl4LR9o+/AMCj7BBq3pAUWlOrnzK+p0d1OQhfu
         bbLa0TQF92629JC9uVWqyN1ct1T/vx7PEk05TMyLKHY/1Z754U1MNbR6n7yxvtGJqPx3
         LVij5y9Sc2eErGGvUuyBR2YavpnT/6gkXGRGX6m38AS6n+M9YqIlPesDoTigAiepD9Az
         3uvQ==
X-Gm-Message-State: AOJu0YwtUIR/jZqZ0y6CY1LreodV2QQ3Fw1t27cPukMuEy+tV9V/tYo4
	aZQj5Fbs9FBzY4P+S+qiUsfJ8OhhYYYbZRUGD0R50RISff/+ttboSS25o5T+Ca44BoAtOA==
X-Gm-Gg: AZuq6aL1cS5VKAh1jqKnYN4zG3wGGVk4qrUTjkrw+ChJUNSnLayEitF5uiSWAfaHzpQ
	fjjI+nvz8wdXkZE4BFHIEfqyfiL80YKVHaxNtBIbbZ5SuFtcsuQxewp8xvqXX2N9ct0611W8f9v
	+xD17yya8T0gUh7gMTtyikEgAstdem1LPARISYnL+8nyIeeFvqeq/m9SzDnsP/j9RnZfBfxPANW
	aPTTcRDUUYc55PcHZ+XvWCGJH6BubNd7qEPahWJQ0J2Uigzv/qNr3MyBL+JRmEqmC+ILu2j1d47
	p2b6wfjb9JgJN599ly8z6sJmh0Usady65HXyWoi7ztleQ7EPKFt13ZQDU2oqke0cT3zYlKw6nY8
	GDRSXBfysXRtBUVU3ZpaXRi/5XrJP3cwo/TUlfZPfXRiFIMqJYEj3geOTN0L5Uh1GIjGX95iqhJ
	tJBJ8d5R/5UcMBZmw3ACkP
X-Received: by 2002:a17:903:298d:b0:298:485d:556e with SMTP id d9443c01a7336-2ab5051a14fmr70874445ad.11.1771130782018;
        Sat, 14 Feb 2026 20:46:22 -0800 (PST)
Received: from arch.lan ([217.216.125.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1aadc729sm30914435ad.64.2026.02.14.20.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Feb 2026 20:46:21 -0800 (PST)
From: Ocean Zhou <zhouoceanhy@gmail.com>
To: linux-sound@vger.kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	Ocean Zhou <zhouoceanhy@gmail.com>
Subject: [PATCH 0/1] ALSA: hda/conexant: fix FEVM FA880 PRO internal mic mux
Date: Sun, 15 Feb 2026 12:46:14 +0800
Message-ID: <20260215044615.337813-1-zhouoceanhy@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a 1-patch series.

On FEVM FA880 PRO with Conexant CX20632, the capture ADC mux on NID 0x14
comes up with conn index 1 (NID 0x1b), which leaves the built-in microphone
muted on cold boot, and it falls back to the same wrong index again after
suspend/resume.

The fix adds an SSID-exact quirk for 2014:8004 and forces
AC_VERB_SET_CONNECT_SEL = 0x03 on NID 0x14 at HDA_FIXUP_ACT_INIT, so the
internal mic path (NID 0x1e) is selected on both boot-time init and resume
re-init.

Tested on real hardware.

Ocean Zhou (1):
  ALSA: hda/conexant: set CX20632 int mic mux on FEVM FA880 PRO

 sound/hda/codecs/conexant.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

-- 
2.53.0
