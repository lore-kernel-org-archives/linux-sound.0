Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101182;
	b=lG1tIUhi0uCtQ9z/oyv4feFHrJUKW8OlSgzhkkA+b3xjHRFpLdw4sfOWz5XHEYhGXiZ+
	 YHYp0zSD9upY82tEA64tlHi1+U7VGUWGH2pVyT6119ZUBVtGpCYsRbyPUKw05KVps1Wxf
	 zmLIyX59N425xETVlzUTozqZAdUHqzqFex2TR4ToUoszw1qtqee60aiKtWlCI41pDzTx7
	 tuaCSKvz9yalSdwWcTkmvJxXEQCbnkA48Sor4aFRFSIC6/eTHoE/3sWFgthbbP6wduAtu
	 zjw9QVEBeoagPWBfO3fMIf5+3BdtnJMotGGEK1dPZ7d3vkB84bZOQhe9XDaGzR5G1YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101182;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=oV46N3CfdHC5MLPkBRfLAChH7RVI3AL9U6J+h7PJVDA=;
	b=4MaVVSthF2oohsFnXbLk2O6mjQ46jnr3SdjF49Ug6v6ta7zdFas9msHEkdqGsG1+c9VG
	 xrIxm9u7gP5Z7/2yQMmnDIXaSeXyXRoHPBvcu53+L2F+j25KBbV+TIXNCxq37vurqQZ1Y
	 pX0cJudrWSVGjVp28mtpnDa9sdp604BVmsPLgKDxootzuCnV8+owKLXkTOOyRskY+SbCZ
	 N/0A52ujT6BI8+WHfonyB3Ez09Suct2YoCVviORkX4YpuGooRr/4FSMpKCAcmykBQ87uo
	 3qy4f5RuNYkBUwEm2gqIAeN8Xcv84NexcQvLCtfnBmJ7CygD2dOv8kwuQ6pHtYP2IZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KeXDCfsO;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFE4606B5D2
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 11:39:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAFE4606B5D2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KeXDCfsO
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c247f6687dcso610093466b.2
        for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 04:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793101180; x=1793705980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oV46N3CfdHC5MLPkBRfLAChH7RVI3AL9U6J+h7PJVDA=;
        b=KeXDCfsOQB9V3BjhrzMps0ArP1yx5y2Gwbra/ohxrTzGZVBk9+IOZtOhxJN0QsF+pl
         tv4C5hi3H8oWQR3Qk8mIYsPb8LG9rIAqkAHSEQrAvXOjajJMb56/eAESaZtn50H5Ijso
         9i27AoP5HthaMttzeUSWS114zz94yqQfOxho2CIFCJOwtfIsn6VIa3R9knGr9/F9QqNB
         X7jfOKXTfWZA2ls8667pfS/7hOIpz1U0BV1e2f+qiArju5M2D7kvWtT8dpt+Fn7l7LU2
         CNxG/x1AxLx8ymg86ZYHC3dyC4o4FuknMlYJNw4/h73JwdWXZJGnKcxyx/cYNihtpKC8
         tAYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101180; x=1793705980;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oV46N3CfdHC5MLPkBRfLAChH7RVI3AL9U6J+h7PJVDA=;
        b=0AoK0OUu+mCzgb3xqCJp4O9tZyDLK1wPM/prtiMqQFHhKefhJkHffpbmgfoOAey4sF
         TRU616gWOXQAo71GeKNfPpmHHbvhgxcuduECTCRFmtEFsXZne+VN/y9Rm975L3OxfwWW
         44BcnWIlYXLPabi16wFoFGRUn4TZwpCXtvoBNBiwY3X8eQsCANTRnEcCVrYkWk8fPgTU
         OzglEwkIcQioqQ8iMelqoxNRQIZ4BnW3Fngn4fkBq6elZTAH9G1RgT52QylCbfOpQEXy
         TJFAnHlcGzitvIKJ9n/QioSgtbTNqSlOUr0fqTP71ExPYH943DiiAkVzo2cdQP9PdrUv
         1WQw==
X-Gm-Message-State: AFq9FYI4FrjcdZEm7ZUVZJFFfPSbMass2508znz6OAJUxJPdjnZjlbRn
	QHMlVxKea4t7xPaO0SJWgjJPZGQGSDtlToB2nxxSp4jsyiU96vytTiJk
X-Gm-Gg: AYBFou2TgHpNHEvC2Vr1hjcY+uQi/K/Hfkq5WNikDsouwsToCMAjnS/tGkJCFVFFfHa
	LOjwUslJx708QUpCZviwJCf6Hmn0ilZrFfm/kbTCmhl5pmQyD7cll2u45ouaO9G80T0Q2YTaboq
	tJo48ltWvwLQ/iCTQojHRg2L+22qe281GkDLUDM2iLoVxkgvX5sIMkc+9gu9yFmf9tFi7FlSNOM
	nW7WoTrrUXF1Zj6nLN2GHuotWiyUR3I6cqgPOGjxpeknvW1h42/Y2yK+v6IwJ2GyEFeZF1UcfWk
	Z5Hnsqh0ShKlItgfXJtnQpxldzx18yKYR0vb9TgdNkKCl0SPqXGJurLgnP8l0XX6IYgFiVpzKNW
	V4Csr76Xe/8KMAhz0g2mpHTlLRJ+SpwxEcNQHSYA8LPpbdETYJHLoz/+3mpFyunuLhyqt+qVfJu
	zMYi5LDQM90bh8PgnaJH5XBCQCMzkB1hLw9fmyISoT54zOPrWS4XNPeOv6ELXS19ReaNMxJnaSx
	3HDH4qaqAZ3+IehpAvShVVFuDy2P1ntNgD4PmdtB1e2h18TVlCr9oCEGhg1LdoHOQuen3c1S6+k
	W1n5Eq17hA8ZDbH4pDXzp5M=
X-Received: by 2002:a17:907:720f:b0:c31:91f9:60b7 with SMTP id a640c23a62f3a-c46bdde4566mr1027757166b.34.1793101180078;
        Tue, 27 Oct 2026 04:39:40 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd7abf6asm430272466b.81.2026.10.27.04.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:39:39 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] ASoC: codecs: Add support for Fortemedia FM34NE DSP
Date: Tue, 27 Oct 2026 13:39:26 +0200
Message-ID: <20261027113929.65102-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The Fortemedia FM34NE is digital sound processing chip used for
active noise suppression mainly on ASUS Transformers.

---
Changes in v2:
- remove ports from schema
- schema moved to dsp
- add return value check in fm34ne_dsp_set_config()
- dropped unused headers

Changes in v3:
- fix port reference
- request reset gpio asserted
- incorporate fm34ne_dsp_reset() into fm34ne_dsp_enable_hw()
- add reset asserting to fm34ne_dsp_disable_hw()
- moved bypass gpio deassertion before return in fm34ne_dsp_set_config()
---

Svyatoslav Ryhel (2):
  ASoC: dt-bindings: Document FM34NE DSP
  ASoC: codecs: Add support for Fortemedia FM34NE DSP

 .../bindings/dsp/asus,tf201-dsp.yaml          |   74 ++
 sound/soc/codecs/Kconfig                      |   12 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/fm34ne-dsp.c                 |  386 ++++++
 sound/soc/codecs/fm34ne-dsp.h                 | 1030 +++++++++++++++++
 5 files changed, 1504 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dsp/asus,tf201-dsp.yaml
 create mode 100644 sound/soc/codecs/fm34ne-dsp.c
 create mode 100644 sound/soc/codecs/fm34ne-dsp.h

-- 
2.53.0

