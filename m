Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794386862;
	b=TSlglwuyyox/DQa+Vux53fnM1sT/nTAkQxynj4vZq3Vfy47nBwkY6kUZ535SvsF1Kq4h
	 gGApmhCZvkwhw6OY1Qku6N6AjVQhKv+OsoY+UBa6ACGr7pG/hH43BT3ZT5vOjkCWWNM/W
	 I5f9LaCAL8ggXVR+eZxiJtqS667FUN2Sf7FtlHnFdhO2DYXaJlvoMawATW0ssOGsEDtM+
	 Ln3gL0uXdSI/Ht3KKn89yMdvnydMiG5OwsLyrRPvHhCnqrNf0GYt01KV/uhDOibTIPonL
	 b2M/MQSXYp4F2Z1qWVQCVRlfliqMbF2gHlOQAWNinfSmxFpla1Z8ErQBrQMlKwn61Qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794386862;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tyzui7WgNAPkX8M7hOxfFRpNVvHQe91//Zpxl+mx/Go=;
	b=Mf0i4bzHLJAiVeF6/LbiMO9QIL5hEBuNSo2acNpVpLG+zws3wq+HrU0dvl8joBJgmS+y
	 gAIGIwPDCamTbXM3EcwCIKYYoBEtzEA64OyaIaVW4V4vVEfVSUNCZgUuj5mfm1sXHF9eQ
	 RtuCxQ4R7St18OxbfCN+yH3U0Tc2v1uN/e5bDsv52ogZv94W+Dnh8EuHeIr9ooqFOApE4
	 d5k3zMoisrX6IQeY5rJsaonIr/yk7wRsGDiM/rUyUKu7eZmWz9F1ffNjo9vxK47NJWyzB
	 0QeEVnKWjJC9mcIt36qgs3No+TUfqMR2cYyfBH+n/n+pkNyvpDSssRNnciiv1SPaf3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="xh0HWaz/";
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1972F606A327
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 08:47:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1972F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xh0HWaz/
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-14394530ec6so3768994c88.1
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 00:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794386861; x=1794991661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tyzui7WgNAPkX8M7hOxfFRpNVvHQe91//Zpxl+mx/Go=;
        b=xh0HWaz/ph7y0s/RRIf/FyNZkht8RxojkI4nReRVOsb10WfJ/Vr2pEY156BbqiiYxc
         sI6m4WWV1UZOeQb203bYEu9vMt52AfZWHgBD8NttjrkhONqmrwKRyK8s+YOkGj4SZjK/
         iV9TszaHfTaz5z1gkUuGXJrT3sS3FwvGEzzrleE4P4BoFpwaDQ3UfHPTWs89PkBThXGi
         BE9rF14HnCxnvPU7txrVKQNR9ukWRbelB6Tau2ApwN1RcKglQyh0HqWN40VDTNzKJqZQ
         fujnO6wmG8RuvQdzcik4Y19RsO63gQhPEtG2EHz2THwzLmQN4ZfvL8JnT04HhwLeTHNj
         iu6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794386861; x=1794991661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tyzui7WgNAPkX8M7hOxfFRpNVvHQe91//Zpxl+mx/Go=;
        b=zolyOyEKhUkmH6MLKqo2Uj12CJ7BcSq0nq7Qxhu5+QB0Q6sDHgGFZcusCmbNDlzJSQ
         DPCpYbziTrWa/zmfVFL3WDfsWB9Y4GTJdpzqFzYbACLrmAXWQSNHhLFYmbwV5ZyG+0Kd
         Fv/BazDUsscCMujkvqrpmHt1esDVM0Tt47ut7oL9+WHv8hy147kP0XxXCyJONmSe7nWt
         8fEHVHLnA7d2j4Zl00j12GyqvG/iIztjuFb4lNbBgXHCKtVFlFmvtfRnGuX9cxg3kkii
         NHc8msebRCVc3TCnk9qVGkKVE8s9ma2p/T4occyV0NJBp/EqPtVfQPBkzT91s6G9Tzeu
         8HHw==
X-Forwarded-Encrypted: i=1; AL+hErGu9C2kW6b9yRLITdlxHge31fob3LMjUk6hCQPiUmW+Fj/Xh+lCTBXZSMJFRwBR666F9ItKfUNyTr9thQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+yJ4B+YEJ/K9R6PGCcA20G5k0m+1sxNhxYOad36af4Qy3ucmeO
	bBdjdB4u2GDoVtBaZxKgTIminiW18zjunNXY2Xzt8+VoWELvshdCRwwM
X-Gm-Gg: AYBFou1njjVeE0pj2ndRDnZBtlAf6sq5i3AVCvuR3FVDnd61pDAJWuAE0lJAWyGfgdK
	rgV9TwjZzZuUIkfrSYqHkKa4u7AzES7jkdIrH8YdYnVrkKt3Igc3dOsoCSlfvhlC5bMRV3qTJJo
	eNqw6PF97P4chRIai8fZyU5mFQB7aNOihK9BYRBXEt/DtWOZH2S/gKjnPYIfRrr3aJxREnHYmkO
	DCu2brliotA3htr/yYQiHSUhE0NDz7ozEdr9V3sByuKlx1ukAXQDNkgzreGpMenW+bEuFP10uN7
	5SOy/WW+MSFbFif9nP8BPsljtAhMGDzoLzn66XpBIj0/9wIGCqODjXh2nYAvIc5YbnspRDkeYaR
	4f5z1vQtBevwUlS+dClC3iHZD94gk7Hm2GGmPt7t2LKaICMTeidWJqhrgXeD+XQSzRcCAbxdpCo
	2hLPMyol9rk+zsOtFgQ2aRy3My6cFGQqyNrG6xnM464mCs1I/Iw2WYojnQGpQCzaQlrqkZYhBW/
	2vCULkm7QqLFaftJjmNRyuwuGqWdMAetwURdD0nCBpOexUQIGyD4FWl8m4l8Mwqr2esc3vCu6ij
	XHztYyDQfVczcvzs1mupERgUvUmrQnvQ/eQ7eUITv1UhfqwFG83CSTWsiCJXREZeBtpg46dxEnR
	rl1Be1AlfzhIP0Zncofu7ejuLXkNos7NXgc2XLyyf
X-Received: by 2002:a05:701b:4513:20b0:143:3c9f:10a6 with SMTP id a92af1059eb24-1b3c023deaemr1852664c88.4.1794386860845;
        Wed, 11 Nov 2026 00:47:40 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b4ecccsm11707400c88.13.2026.11.11.00.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:47:40 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: HyeongJun An <sammiee5311@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Alyandra Zahran Nadhir <alyandra5b@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] ALSA: ump: Fix RPN/NRPN handling at MIDI 1.0 CC conversion
Date: Wed, 11 Nov 2026 17:47:34 +0900
Message-ID: <20261111084734.2592346-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <87zevhugi6.wl-tiwai@suse.de>
References: <cover.1794141913.git.sammiee5311@gmail.com> <87zevhugi6.wl-tiwai@suse.de>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello Takashi,

Thanks for picking these up. I may be missing something, but I don't
see the four patches in sound.git for-next yet. Only the selftest is
there (ec925d374015), and without the fixes 11 of its 22 tests fail.

Could you take a look when you have a moment?

Thanks.

Best regards,
HyeongJun An
