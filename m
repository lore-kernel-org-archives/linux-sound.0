Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794566270;
	b=AWF1w/FEI+M0mRwE3BmcpYCzkoTA9MS6Co8OWjAUOyOSnu1yCydrH26fvW6YcT2aibqA
	 9KLQD1Ck60qTIlwZ/xzFugN2B4WP3E0ptqnPe87Rm0x2i4PX4hlwaYNprXlFg/D/zzOCs
	 iU+MJa7IbKEbQwkvaBDfXgyJV9NybJmhg38v4gg6zDPf1AN5ak4drV3tcj1n3UY55+1P7
	 D5nRhTbldd/UcCa4lLgGXvBEeoJIPXy6zu8p9QB7TjgzV57dzqfFv3UFCD04SL0kTFkGf
	 +y1emj67lzmBWTF/6N8D50pbk1ThjeglcTk9UnD1/7U9LW0OiJSSv8f4og7PUAcB1QA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794566270;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GxRULr6L2s7oj4WrEQj1sjF+5Owee4KxswausHCyuXQ=;
	b=Ix4x+ECWxSnXphI1Z9yqwNmzHhxJr35Mcg/8SFkk7qPUAdfm0wOzmzHCV4Wi5Q892bsL
	 YQquujXxnWsyr4yoK/JJK5PFxbAkji63FjjyuEEfrgrVPXJkeRxsUC0EA3Ci8jDZeGdit
	 gin/vPQq0m7ARvoZgKYa7KTbKuFuWPkJbaTu4OtXCcrC+UPJOejAaBJBPjboMgqeRyrzu
	 h8Q+piJ9R+tLUdDH6+DHJhw9JY63O/vhQpL5RgG0vR1VBJjYCdg3xT3YcRb535CdXCiAX
	 NFo5XCixjVAB0/KdPKQRUglUiO+e4RxzjDt7DZsMY5FYUCzqUiEILMV2rUTSnFcpYYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0Lphmjvs;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929A6606A321
	for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 10:37:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 929A6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0Lphmjvs
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a39e5161c1so1466336b3a.3
        for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 02:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794566270; x=1795171070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GxRULr6L2s7oj4WrEQj1sjF+5Owee4KxswausHCyuXQ=;
        b=0Lphmjvsr9loP6mt8/CKzEGO52ITAc3bPbxQxcD9q9O/gIDzxKpfjnERU5rU5JOPAy
         K3PYeIrfxUkO+02I5bceCf0m23iw4YQ+d6BxOCQqvfL3wVD/6Iii0bEX/Wj+BFTKW61r
         LHAhfT/lRTMtd0UXuzp4gXTs8WvGTIF76/ILkrzul72UZGyPR7hM63BPtC+XDca15chD
         Q90adJw+XTlaxPDUkwbnzovHtv/7Xnmb7DqWWHJiUtdh0PGu1ukisxVFEsgrSSWh2ghg
         bdmo3W2sY9coGJHS4xCnJS9SB0Ej8wqcWfTmzynzRLgFkg0AYqsRwP2f+knELwB3G42J
         aGoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794566270; x=1795171070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GxRULr6L2s7oj4WrEQj1sjF+5Owee4KxswausHCyuXQ=;
        b=TcCw+Brmd19JncsSevZH8G0YjP1Hjg8Y5yzIIEHdE5/wZZPqmUX1dgRRvcXJUBRthG
         5VJBFLoz0OF+g8oT+MfrR7eUzqFeAwhfZ2lzmuFXRv6B5joDQsoOx2pec26l1ta14VJW
         dwi6JuDoGIx+Cg9Xy5Ynl0JgM48Vbtc548Bi4kNT60iMOH8EDubSDOZufAx/jq/1Tpbk
         RIRzCcW7IamL+qp5UXK7GgmOPSukwiqhdUemsSgCIdSn8aBGGnAOA9Cnab92SldFtPOp
         ySfV/Qs+qSk4XvSxJ/5X6WjQjkNjsW7SxnTDFCHTGwb7zYr7VNSn+41zWM/mH3LhliAQ
         3QLw==
X-Forwarded-Encrypted: i=1; AL+hErFLIFRUd8MiXdh8Zph7oeKBL0lhHmoQqw8UUqbNkQNJ1g4qEZQyLv+ZlLY4H7jBwZK+xD4Jgtg/5HT6aQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8PO8717vDzwPUKWWmJvci0+lxaQh1zNJuFnfrBbBRBi81/1agP
	MXN2yOhD96c9fqYMM1oMfT50LyVaR1Krk1dcFtrhCSMGXkvywOfbTuXO
X-Gm-Gg: AYBFou3wOjRdNzH0jrBJF8DqTlTLV2kTO8ofniZTMunKk1N5BkqI8BUTVYRs+Pd5zSL
	VWHpK/6BJR7mKOU59wti85Cm08fUfgpXaiIFrEUolV4qYzFQzdZsy5nbA4fBN+gsx6fqn5GtfdE
	pL/emHLLZCHULckZR9rBNIr6fuGM2c56bE4QwA34mmGQmWJqVGHQiqI9izZIPIHiT6YkKXUXBqt
	HqWZWkb9wT6bc4GfBC0n7CciMbWecrytnNDuQ9Tp55NjjagW2y6zjI9Orsyvv7DWriLNmqSySRX
	0CV2TeZxIKR5qZcdaLX3H6RsJkr9QDJhP+DZuuEBEcUcfcAtGCeecNCOL9dlisHatwaVHMEGKno
	PoT+d+SAwXYxiL3Uxn8Xwi/yNPjxl9nNHDtmI+TQ6lRbW1TsmF0/zJbeWtuumN4SPrsknX7YpPY
	lLMksKmeoLGYw3H3v1O0sENyrtNWGyI4pm3FOiz0OO1JovW6qrcY14yOi/j2Tb/pPMl8/mUxqrD
	LZGgxwPe2IdIeOJ9zHhBpr/BGHtKjoIX650WbuTFpvhoG54ddI5IsBhjztoywF8mQ42HNXFxw/a
	HDYGgJ4FAkM7d2ZiqpcndNtD8Jozrv0VQC4rBUFEfA/K+hWz1D6Y/yhy2Js8oNlZoOc6Uwudsvh
	Czqjktk0V9/9S8cndutPmBk33fJgjRY6oI/wc6kKw7QNL6w==
X-Received: by 2002:a05:6a00:929c:b0:89f:1b32:29a5 with SMTP id d2e1a72fcca58-8beb20cec32mr2220289b3a.7.1794566269836;
        Fri, 13 Nov 2026 02:37:49 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a8682sm890955b3a.10.2026.11.13.02.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:37:48 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/2] ASoC: atmel-classd: Improve clock and probe handling
Date: Fri, 13 Nov 2026 17:37:25 +0700
Message-ID: <20261113103727.30449-1-phucduc.bui@gmail.com>
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

This series simplifies probe error handling and fixes the 
peripheral clock lifecycle management in the Atmel CLASSD driver.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (2):
  ASoC: atmel-classd: Simplify probe error handling
  ASoC: atmel-classd: Enable pclk during probe

 sound/soc/atmel/atmel-classd.c | 42 ++++++++++------------------------
 1 file changed, 12 insertions(+), 30 deletions(-)

-- 
2.43.0

