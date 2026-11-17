Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794889283;
	b=SXeKFoLtGctHFS5ScDnhm22vJ6JyoNbKbZed58NkZQ6f5KqcUXRrvJPSIV6paN0IGqWz
	 kKFVe4Vw9U8du79wDmvjNsxiHQ98LkEezwuQpPBiAoGHiHoF0m31D3sS9Xvgsgq9W8TLt
	 bqCH5gl8X8fJFrkVY9nEInhlz0+Vh5951ISj4z3Hc/c4W0Uy8RCjRPyKTUV/LtQzCb7YS
	 Y94MXfZ/x1N7xbr5ngNCA4mMQb64Jt0Xn3o8PgSyLC8u32JUCCzn/Ve0KUPfygBSupC9c
	 FGQWoH5WSAhb5hBGhzBqqpbIo2x1penmfpsFRDLnAZDOxZcNEfCC2VsibbqTnMAGvug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794889283;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FfAlSCi1fzt8taYG0X/OqxFQ54Yq2ZMFl0MaJLw7avM=;
	b=kLpZS4RIVzryMexkHvb6p9UPnEguPMS3ZklwrC2rLqDeXAl9lQphlvjmelhdM7sEHjQi
	 vtLYRRM84IS9eh2TfscpYTGW1hwjpFD3vMzjtrwe5dHMb4CtvBq20vue7SKlKV1nbqB3K
	 7pLOkJea+vCNKJo9ruFUu4VxacBqO/6WUUV469bIiTaRHkjiBdNl5h6As/lvV2h5vmBhM
	 ZoNgwpLcEWbtd4Ju7pliW2oEj2BcJxsiYs5sdzwBqm/shnYREG/lxxZhp0zweC8OnXzye
	 KD6tygB8opVXRcspSMiA/1mABRoE1cYO4Gbq0OXJEIUK1F2CL1xNAba/y1oqJXKjStA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z7d1ffnU;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023BB606A329
	for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 04:21:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 023BB606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z7d1ffnU
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-886e61fa30fso1779228b3a.1
        for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 20:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794889282; x=1795494082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FfAlSCi1fzt8taYG0X/OqxFQ54Yq2ZMFl0MaJLw7avM=;
        b=z7d1ffnUuFsxXWxBDp48Jla0wEzcjgq0VyJh00gBTAWvG58dKZZacvjrf8VPCKjbZM
         sB30vQrNqLF5k+rWNioIDDdPKIItQ4Qph0I8aYxJHPYURwu5WyEA4S/4wQvhJqPiReLi
         +gT9/5AMYqSOxKo6SR3OLMB+xZW0pjhalhnpc1EffOPIHgosYu5nDxn7jl7SSh6tzdY5
         fFsx8PRN6IKm9l8AV5PIG/Gd6feEsJeQyBOEAftsx750ULOHV5yXtrTpgLaqqBR1tdHb
         pKGzdOAHnZsfwRxyHFQcrtWjGd59UkbsrhIVO/rkqCrwpOgXryaVyCZul0HUqtbc1OgC
         tE5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794889282; x=1795494082;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FfAlSCi1fzt8taYG0X/OqxFQ54Yq2ZMFl0MaJLw7avM=;
        b=bfu/vzo70QHD/lla3b9+j5OybrBkVSOEVLinC1QDJ49e7JJT5Ler3wi4gGfOCdPEwd
         7Hk77i4/C/6I8YUk2Yg/EG3sfMkUUbGefw0CzJKUoEfGzu094zamLt1zgVLbrimUOSe7
         j0QrxSQwrRNUxCM7JL/BfGYZFfywUuSf89nplMHfucbohmOrVxOuMf0D4G0ovQFf7Gd5
         nckQ44+uDeKmsC+igOUU8pHsKddEtGZQoEbUKulqu3/9e19EbGpZ4AeVSBJ70hKmXJWh
         jUU/WmTKGxpFAcSh3lOB+uOEn+pucztw+Un63JlpQT8JJ3h0Id2tvLpkF8qBTKzU75ia
         11xA==
X-Forwarded-Encrypted: i=1; AL+hErGBdQmkhugOR8Ewo8igMnI7vjhITGxnnghfQeK5jtWk8l8kD5TwibAus/1xPXNbJNXjOkX9I0WPBlR67g==@vger.kernel.org
X-Gm-Message-State: APuU4Z9cVs10vMTz4HklYnN3yrUueOSmDJxFrLH3Q5/EJRt5a+4lLLDV
	PYFc2qFkyCtWdW9z457IHDWv9cuoiBtqtafeqvDZ6OlXMHUSIbEenT6x
X-Gm-Gg: AYBFou11ZgPzYzHI6mbBtqd1MpTiubyly2hC0TnNxdiNvBVId4p1Jj856Inu2r0oQ/p
	Q6oOR3Qk2zo/3LC/tbi/cLHhZM4kONyFs0Xh05ymEoYjOK4r36h37RIAiaCZ/HE6lVFTytJCiRh
	SZFLvxgkCa1b4VggRAvMXGlP4pAkCjhb75YsNBT13S4iR8Xee63ixJrMOEBMUhE2scGTEStWCly
	D6uBoiWnqVAevSiKDrHXDrIIjRKu987Jdl19+UyFw3nkfMBHgMthckqcOVIhIkVcEZuat9ev6xV
	GYYKejrRGNmzJ53YdZTgyIKFv35wKj6pcLK3bo8N1aslXvvS2P7m4/ZPh8rTSQ6WpO5VVo6m3C3
	56//g+xYZUNAyfwz6lNdNnWWD6/9TSxCxMUmOtVUIJw3ACsfda3yrXOyqkjCc6M3ZQQ4y1kopFe
	5UJwhNRHkdnpe7HjeYNNDFSAYBXVfrCC7QH0mFYYRYDEZZJFRvW+dKa7yqiij21AH6Jz5rCDy5I
	uS6Kae80G7LE7Yfls2lRCPSAyOute5s401dZudSb+nxAh3bfZQkVXjyUwiEY1t5TMBpGIH9FhsM
	bD1pwZZIDyQPUh+sDguQkXGG//aOjsUdWHCLBSmMiLbob+VWA/cG5MXea1L/qA2rRydnm8Gl36V
	cEga8DonvhLV1Cy9vLmP19yCxduTiFsw+zKaZS8RZ49GE6BmlA4WPmWoszO/OzR+EuQ==
X-Received: by 2002:a17:902:ef0b:b0:2ed:1e82:ab81 with SMTP id d9443c01a7336-2ee0dc97d44mr111989845ad.57.1794889282274;
        Mon, 16 Nov 2026 20:21:22 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efe41c8df5sm412385ad.70.2026.11.16.20.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 20:21:21 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kees Cook <kees+treewide@kernel.org>,
	Jihed Chaibi <jihed.chaibi.dev@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/2] ASoC: cirrus: ep93xx-i2s: Clean up resource management
Date: Tue, 17 Nov 2026 11:21:00 +0700
Message-ID: <20261117042102.12442-1-phucduc.bui@gmail.com>
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

This series simplifies IRQ error checking and clock resource
management in the ep93xx-i2s driver.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (2):
  ASoC: cirrus: ep93xx-i2s: Simplify platform_get_irq() error check
  ASoC: cirrus: ep93xx-i2s: Use devm_clk_get()

 sound/soc/cirrus/ep93xx-i2s.c | 51 +++++++++--------------------------
 1 file changed, 13 insertions(+), 38 deletions(-)

-- 
2.43.0

