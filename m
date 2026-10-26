Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013736;
	b=nbJaodIffQTGFMfTMjUjWVwXUcqSRHHgoA5oRMZkNcsv3JdPEk5XMRyqgP7wMhmV2efd
	 8gOFCLiuLckSpG1qkaHuN9zfEeNifSasn1jX/nRWwYmIx+2OKeba7IOngDitg8wRDotdc
	 NFIUgxn4kKSkWvZFF7Yukfojeohm4VFgef0CkUXG5j26O1MFpSAxZWGbB+Lwl+/HvD17Q
	 Z+N4TjpqZiiMsxxGaQrAIhNdSYsU4wUB5URuHlEhRWeR2fnLH5v0Hn6Ao50Uxv3td33ep
	 hn09wno7Pvt9JrNQdVIJKSUN606FbexIq9UGfOmunSq2oEyhI3g2VVhhV7dygEi8yyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013736;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CwUajG6zOxtmKYKaBabWQ/RQ7YEOVECEPn4qU0GhKJI=;
	b=jEZOxC4yO/0C4UJiB4NGDRsU+wnizD35uNeeuXd2AVSWA24BrO8ojrX9ZvqeE93jabpW
	 IrShSGleikRqCl7IgZWHs/4ZaRcr0oBEqNQJGlpevBcVo3PBn4D5fHaAx1DaXWBka9pDT
	 nNqlvw5VUyipFT/udY+um8OV6XeUbTCCnLJKGT0kDamk0Hh8kK87Xrf4UaimX7L3LXKFJ
	 Bq7Hv0azapXCAinE6S0m8/ceuM4Q5UmwNVs5oxvrXunp95WRb27XNN+I0g4D0tQINiB0A
	 0LfntqBM8O5IxR53YJE89naSuUZL0xQsVsArj9bglvgR3ptXphYFxvpNzj/cV85WYYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="A/GaxXPF";
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D86E60A260D
	for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 11:22:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D86E60A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=A/GaxXPF
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a215e64962so20553175e9.1
        for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 04:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793013734; x=1793618534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CwUajG6zOxtmKYKaBabWQ/RQ7YEOVECEPn4qU0GhKJI=;
        b=A/GaxXPFgozeZ7aLS9ssmDZFGeG8eQ01zyFtmvsEFEjHgN0ZpShGubPQPT4c6ak1P4
         dwJQljiF8o8ydDBGa6DWNlST6KmndsguhxZoSXBAF3cFAr2VLIcvGww58U1l7TFXyNr8
         u0Q4hMX8JyTzhJVfOXgZ3SVw+3ig1+XWrfnCsemzqNe0ZHHPfQhwrnXOFn88YwOD0KHK
         fFH17KsZHJiZ5b4vfG3iNjUBmmh1/cUqLR1CARwXyQ0+Nz1Wocn3dwCeQvYHYg1Hx4mt
         FGAGya+o5DgR2lQ5bxC6kUC9MmXpRGjhBQCx9E6zappKoh4FpNHs2/Ap46JX+RZIs0UM
         e+8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013734; x=1793618534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CwUajG6zOxtmKYKaBabWQ/RQ7YEOVECEPn4qU0GhKJI=;
        b=20iIU8QpQJzOrdTLz11vin8SYFSXbG1xSR6NnCasHpgijDb3OJs/lr0hz/b7RafIwq
         UeeTYFQVowaqZy2U51Hlr5e9lY0shuNxiv2cNFYnUFkitpakXH0sulm9d7a5osiQpdJ5
         64L5a3XaVnSUD/qiC0wjWDuHPFGIy0itjwpCzXVIOu6EduhgiMRJmgygjPu51Lze3CnY
         UKxr+m+IR3zuhGgkMsrwEdkx6WpWyx0HpJN4K3hpHUt4ebrFP8UsdOuqI5cdTxYjvGfr
         yHZqF9U4cp+LGyFjXDBfAgPQB+WUznpNg2XbVYLu2rJMYVEfYcJO267tMGP2lSWJgOmj
         pa6Q==
X-Forwarded-Encrypted: i=1; AKwUvBwltqHUYYB/RCZaQa6cdKPodLFosSBCYr9ZKgCvuRSazXya3G0Llf0+NbhN8J2jW9xAjNOWzcTRjAaQEg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJXLhd3olVgkVe+MhnyDWpeCMxCAPoUtiFaUtt3vhQF9atiR5L4
	bBI+fxefV/Qumm0EpQ7MWqAdVQqF1umLhM/x/xBDIMZy4ZvB91Wcvk8=
X-Gm-Gg: AYBFou2wbAGfCflsmj4HH/KXz5k7JbiTQ7s7mjYXLgQ/Z3qZ8F7cTbqC7hAvkiXiovu
	p/TyTz1AjBR+TUh7fPtyLNEhkCuG2Jt7uuSNcca686fFyaDC3chXZVyBaono9QBWi/NAjx6vHqo
	sCJTJK3UTzxhZb705Xo2sWHElGdmqrVo38WWc6c4GqRM2vrJoFl1W2FLSAR+efno62bY8BpIwvT
	GBItnGMuErBNiClALLIHIebzyopYTOKH9dHV6YxAj8m0A9lLYQkZprNVNrV3dY8iRQpp7H2sWXp
	Q5lqPCI/wSeZcImuyXbIa41FVPr63Wa6PcqgQEGdKRECRaqcc+taiV4+pN3jW2WL4Xlr8mRxpJO
	Ukeqp0uk1Q0c+y7Lv7NV7/lGgAsx+No4+ZtYBjUT4OJmSLRW1HK3iJd8IyUBy0r0tNSgNMJwBY2
	oM7Ar2sw/+MbdYEgAAkCkOL3D/jVFyQoW9slZ5ANiaYaBtYjQW2EUXJ6WRmwkTzcVN4+WGjfDpd
	RnGaaC8IjOdiAyVd8BOyIVT2g==
X-Received: by 2002:a05:600c:3ba9:b0:4a2:d7e:5ccb with SMTP id 5b1f17b1804b1-4a35ac99bbemr117137165e9.15.1793013734410;
        Mon, 26 Oct 2026 04:22:14 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359f59750sm129141265e9.0.2026.10.26.04.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:22:13 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>
Cc: Oder Chiou <oder_chiou@realtek.com>,
	Bard Liao <bardliao@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Jorge Eduardo Candelaria <jorge.candelaria@ti.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH 0/4] ASoC: cancel pending delayed works on component remove
Date: Mon, 26 Oct 2026 11:22:08 +0000
Message-ID: <20261026112212.2519775-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
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

From: Tristan Madani <tristan@talencesecurity.com>

Four ASoC codec drivers initialise delayed works that are not
cancelled during component removal.  If the card is unbound while
these works are pending, callbacks fire after DAPM widgets are freed.

rt5668 and rt5659 share the same pattern: the IRQ handler reschedules
work after the codec is reset.  Track IRQ acquisition so that
disable_irq() only quiesces a line the driver owns, then drain all
delayed works before resetting the hardware.

twl6040 frees the plug-detect IRQ but does not drain the work that the
handler schedules.

wm8994 frees IRQs and firmware but does not cancel any of the four
delayed works that IRQ handlers and DAPM events schedule.

Tristan Madani (4):
  ASoC: rt5668: cancel pending delayed works on component remove
  ASoC: rt5659: cancel jack_detect_work on component remove
  ASoC: twl6040: cancel headset jack work on component remove
  ASoC: wm8994: drain all delayed works on component remove

 sound/soc/codecs/rt5659.c  | 17 ++++++++++++++++-
 sound/soc/codecs/rt5659.h  |  2 ++
 sound/soc/codecs/rt5668.c  | 20 +++++++++++++++++++-
 sound/soc/codecs/twl6040.c |  1 +
 sound/soc/codecs/wm8994.c  |  4 ++++
 5 files changed, 42 insertions(+), 2 deletions(-)

-- 
2.47.3

