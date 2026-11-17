Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794884030;
	b=1PprNwMA1q0ucPfWIjdDzDsnrtgJeuGdQRG/INBDvdrNfc7jEaq+IbLD+I2nuvCCr/Zl
	 /szXX8Cjkj8E142JKuBI30/2gxK/k/MD/o1ESY0RWjZ+EMw9ME0Yg2mDDqcIahoCcN/9d
	 RsKaRd5RLtaVPhyJY9StWOYVkMCitCkKHBWcCyb27NK7gyPOduNKNPcqNBhZfHxEyoVJ+
	 6OMyG9UstPi8Vagr2gK8nZEGYEN+uAinuawnA54crxbYtXJr1/H1uoj1kjpwMlhHcEM7D
	 buFE3MyIvvDjkXpTdcb6yEudRv2hnyRNZ7kUanxq5Xy6oX89pjoIj9CnOOUUTauH0/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794884030;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uQmEnBy41LOTn8RxJD1AEVDSOb95B4r7foDkgo1mAGA=;
	b=BSLbkeoUbc3MfuF6owtY2Vn2KrRM7bX05P4illtlMh0GeHKMOzt+YsZ5zj87VRDT1rmg
	 0S60fw/qas9cSyK5dBCrL3Fghw2EMvcuTF0pKHkOLbWYcBq5AshORSNG5IoiYZxjVu0QT
	 xBlFi0WxNNfhjmnqRYjeClA2ktzLNHV80VDtAJ4ix2w97i9fA7iO5yBIAKCVNngmUdETS
	 mrCKysYs/YVEKjHC82QI6lDv/O0HYjhKjRcEDpm6ho3FafyF4k0cG2Thed3+24UpWgJZx
	 493COCY+hxXUA/IGCOz1CmZa7/QLDN4TmCP5H6WudYNGaqHseC7721+oHCiJq7NenRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mGlCNLOg;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C53606A329
	for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 02:53:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1C53606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mGlCNLOg
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36f8cdd30beso6893478eec.1
        for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 18:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794884029; x=1795488829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uQmEnBy41LOTn8RxJD1AEVDSOb95B4r7foDkgo1mAGA=;
        b=mGlCNLOgSxEgkGHl6RW7klQzxte23/3WOBSsw+gEXg7D7nW0JhRUyUlRX5sAD/kVvb
         958wYPd9B2Ru0KzHvrxZAhbIcuFXsY7XSqqgHV+Cap1fWKupxlc4GDe5Dx0n8h4WhVco
         L1TVyqYen75PGN7s3OSrUrebX5zkYwNm1EeZBcJDjQnIONIyJUhAH4J2WO4SY8q4RZt+
         lZmzjsQYrAWBZIS5tnuMNTLcSfHE/2Iq29eh2PWVnMAEZhk12zAt+AOmHw82nSytalio
         B+k/CPLVB5xP6duZGbLsZlzNCd7JM8RYd4gCVMGor8PJWnhTgVF0DWRcPVZSIPoAXR4l
         S27Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794884029; x=1795488829;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uQmEnBy41LOTn8RxJD1AEVDSOb95B4r7foDkgo1mAGA=;
        b=OfgyHynyAm1HTvypFrMCb5DDbnobWncZf3zj5ab0pvyFY5zeS/cEUNz7xAQZhOspZM
         5Q9YbEg6yd7kI48liysnCV9DWXsrLv60hZfesYikYRu9uv2Hk9nUbmH5UD3PV+emlDVg
         iU4fi6TLjiL20ZA0Q4OiRY6yAR9yNNz6YOENNO4ngqQuE1Be7g+pcLhs6B8LmqEWGLpa
         ESPLBUMvZvBmNXRkKTqLfS5weGlTLotrD8hHTM+34GCT+qtU55zhaMZ/GY0gaL3tEFU8
         PKoWsbIZAAZANJW9lFqSk/6BFmVshym6pYzNBB8lsBmmvxeWxbW8pzdI7wssxeE4kDVG
         7cxg==
X-Forwarded-Encrypted: i=1; AL+hErFIi/bdiF82lYr22IC1rAmiftaJI0M0f8vomWm1CwvdcAYiJXPWOg0ns/ewdkTwtCfymtUjppB7GzyVKw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9sKdxuYgKCIfeTFFJvV3mOQSpHV/fauTnq6lXgDmdVWI5fE7Gu
	ZRSoz8UeaET1r0PhVmmP3B4Bvg0wZxvJXCSl+LlaeOlzHJFluzzVr3Mg
X-Gm-Gg: AZFdTZfGy7RxvdB9zhkpPrDPwzTmUV9dJB0F4k65Y9f4Bc8PDrCyYcNxWouL1ya0CFK
	L2QnBsPSudpCR/DQIHVVvQbDMCHU8Xh4PaqWIN3lRQGIR41p1mtRKJ/jTokZmDZDvx8hQVyssjX
	kv+vyqrSvpyqGLIKJy9QXWC7ityd5DuayxKvo9jEbmi4J+oRO4FPSb4o0ASi30KV03fdG0xsFWD
	PNC01HCEaxgCaEzH2rlwsX+gatyPJ875zmpe4qa5VX2rZlw3UrVQRSuZ/TSLx3/TnnAnL8PkFE0
	iC4Ht5LvNl8Yrgy9RjLVhwYwVyQykX6Zc5yhxSuPCgMCbqWIRJg/zgiXfFl/dp+1pdzFdkHau0M
	y3y8H/cVPGQDWVfDEVoMhyy4oG7hvRXD8HyjFRo8RzAP4Lu7nJoyuwETHdptqC0/qP8TehaHmHd
	mzR4glJ8IesCR70bXTgE/sbXJ0Z2QBw/3fRUQF992UogCe1Jy6Bx63AV+dpeCY21WHwu8yVZLW3
	syThnrlMb2TFAqqb1eAECET+1Rw+rctErv2LlFAaDtBwf8uYpAbvIT4Cl/ySjnNg4s7iwxQL1YY
	QjWD8avz9LDGhKe64swSZg8mfR9N4VXnrRrq0/tCseJNHdBn4zE4kDjWyr5hb/S6uC+qXmhGYwB
	LiQRF5o+M16oydKbyMz1dYwnIB+wKUD7EmykmGGXcR6Pd
X-Received: by 2002:a05:7300:6148:b0:36a:7bb7:4609 with SMTP id 5a478bee46e88-37967dd7e1dmr19122519eec.34.1794884028527;
        Mon, 16 Nov 2026 18:53:48 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955e0d966sm39357368eec.15.2026.11.16.18.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 18:53:47 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kees Cook <kees+treewide@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/2] ASoC: adi: Use devm_clk_get_enabled()
Date: Tue, 17 Nov 2026 09:53:33 +0700
Message-ID: <20261117025335.7455-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series uses devm_clk_get_enabled() to simplify clock management
in the ADI AXI I2S and SPDIF drivers, removing the need for manual
clock enable/disable handling.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (2):
  ASoC: adi: axi-i2s: Use devm_clk_get_enabled()
  ASoC: adi: axi-spdif: Use devm_clk_get_enabled()

 sound/soc/adi/axi-i2s.c   | 22 +++-------------------
 sound/soc/adi/axi-spdif.c | 22 +++-------------------
 2 files changed, 6 insertions(+), 38 deletions(-)

-- 
2.43.0

