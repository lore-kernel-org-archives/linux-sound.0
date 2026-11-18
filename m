Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794996425;
	b=iMo7E8u5rufeU8Aj2JUABz/yLafZ3yFky11Yz5nlKhNLl44RmqkdWQkXXYelOE20tlvL
	 X+er8NpxjKfCAWJlb4Q0cX1uUioiB2xhnBR3pIGGWq8T6txB702vj0ijxxke8n2PzZIEG
	 KxOHMkZrnB/5ADNV8IS+WPwOhW+Q5N+cJIDJcC9+WR761XfTlK2ke4NJWm7dOxkXesEIs
	 qf2GwZQjOtHH2foGFEC7ut+yDkx6VXSYpE/tOVns4mXxnn0C8e5JsjXDw++m6Wom3KhJI
	 lc6c7EHDgxVcyuH/xcDyzvGRwE4HtKuDilnnaj4sURqmHu8+KC67SL1Qua46sJjCoYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794996425;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/kO93nSsjjdF3j4npCojXQ0FzWXWJez2uUSNY9jjjOo=;
	b=PyF+xnwwIcobl56+JnTw/Bou3gtCQ87kjXu996rz/4TUdYubiYg1XRhtPl5R9gqkF1nk
	 gunszP/Au+vChUuLQX8+9I4Wsnarp0eMYliouljoS7hQQvygO77v+ZaWrBPT//9woqWKr
	 lzpfnOe1fy+ja+MkGH8gAHLUelJkIimEk1fxQXliGNEequhy7wahHUdtr9nvukYVyNbce
	 dZP5dW73I/fUzAvcOjaJL3NHcc01COnFaBQgM+REQpQniG17e9z3VmTqVmYiE+XQ/8AkN
	 lLAyqPBqMvVGHs51Nl+gJNNKnJFjEhVcGJUZyZKle8e+s2tknH1OZBvXh4G1TVYNP7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RJvt4+Tk;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4F4606A320
	for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 10:07:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B4F4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RJvt4+Tk
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2eff722a480so4040465ad.0
        for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 02:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794996423; x=1795601223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/kO93nSsjjdF3j4npCojXQ0FzWXWJez2uUSNY9jjjOo=;
        b=RJvt4+TkXdfEoie/3L8Sz6AdW2W2NbhPUqEi5fc/QS3YuAQhoBnhCvWArNfzPj/vr9
         dEUNP6nwq5fDOjbQ3p4I1HjYP/gqpkL9IVRv9WH7OUwpPvi2MBf+A9I9+Kc+EKnx1X7J
         qvRIlEKZKbxJ4/Juho8EzNUFTsp61h3EShUEII3qXovU8AHEL146BbrTo++Oacm0Lmt4
         anDatOVEhuDhPTXo0pjX54GZBSSgTeb4bMrKotsX4mdM8MTFE5oHoOKO4FbVNiej4snF
         z1U8GcE1SukrIq8dm2zdUxRG/J90/JaRP2qA8LbyekmSsBdva8vMTL2PSRGQTL/onmWL
         o9oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794996423; x=1795601223;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/kO93nSsjjdF3j4npCojXQ0FzWXWJez2uUSNY9jjjOo=;
        b=mYuxjiFOKlXYr4GXLK9qpgr9Dc1N/H8zsX3J83eCLMYXoZDN7yG0qTfwJ6c3KzB4+C
         jAliA5B6Rc4/uDOQaMBxJ9Hfcg9S6lasHuM2gQq592dBOO06UEJQmist17V7yj5Qw4VD
         3fZHLK1GJfH4rgdyZjcHVZMIRY1vUEbPNSqI++ZmUx3HF/6fce9VQi/KClqZV2QDIOMg
         Br6K6wI0mqtZzC63Mk1KzJl0ZiFREIAv96IRVLG2ZitYDs8aszzpB17IY0GM91yUdRsU
         c/+OPeRu7Yh00tQlMiXiO7gaN+oSU7NdFvAeeC+i5IqQyKsU3MLEe70n4r4WS2gvJ0Dt
         nwhg==
X-Forwarded-Encrypted: i=1; AL+hErEyxt4wpbKS+GAPNtazta7p9N2v1I/EBX4LPwdFIAYzwV1oWS4bkzxYRK1TLxvnEMgx07ytg8ecsdMJFA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9DPHE8RiSGtp0yRUE2nNbnMGvSOB38JsGP9CRsJr0oNBUsYelE
	ZrTDsO8SCNY5TtLx3ldpu7805g6514azHiVJjYpOaw657s6Zkq5zbZ4t
X-Gm-Gg: AZFdTZfnuc5ZZB8UYetFQ+Ximmqax2aBQewE3PCEjXn1zlsJec8Hz70tnDb52ud3z3c
	+b2JkS0n5zWSr44/1cmod+f974arCDOhDPi2j+fm8eQLNdnAg6QBdFDMAzKHOczc6jd9jDzYi3O
	Ekqc0AKkEYjuV4rBG78TKkVFphfBIieqW83Ao4NAhwsBNr9d2uR4x0Chq/vp8YrCGbKl5gokmmi
	6tTOeBjXcRA/pQPi3YEJhG8nV1FSno7ZhMeA/uUBfHP8CkW56OMR44JEI8/H8D4AHSMiGAsbafI
	/0qnHkFTacWDh80OgE30g9Dg9LyZvDxNaHzLaLsKZqbafzDq2ihgcLQ8cq59hEZOMfZnwXhzFS8
	Q1HfOtXUG5WmAc9qapFCLWlWwvmNLWUNJ4w6BhFu0/ihToKQRp8mawSDJ0JM0hzRItqIib6WqPH
	pFOlljyhSfjKYLLf7WZSh6wFFmSlCVsCWoHhwUi/YoqpjXUk4ArKzeOGN6Z4tZFhGV3NnVAQW5x
	g7xWcRwbxpfEgJTc3BS+J5SraKXHsGbCVbXh/fabXTFSyHJyUHdIz2tMQhm6aZbRniRshvXJBQR
	2vDluL7NXrcA1NoyqGamDVE6LIZgF5vLgClAjFrPX8cmZOWV/urV8Mvi1QX7o3gBOo5ATLLd5ba
	71YMLY6evpRbDh1G7yWdrCeHMwHCQpUkovWhV8XPWciCB
X-Received: by 2002:a17:902:dad2:b0:2ed:520:2641 with SMTP id d9443c01a7336-2efd9bcde77mr39901635ad.31.1794996423492;
        Wed, 18 Nov 2026 02:07:03 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6215025sm10634145ad.46.2026.11.18.02.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:07:03 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	jonathan.downing@nautel.com,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/2] ASoC: fsl: lpc3xxx-i2s: Fix error handling and DMA configuration
Date: Wed, 18 Nov 2026 17:06:29 +0700
Message-ID: <20261118100631.26658-1-phucduc.bui@gmail.com>
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

This series simplifies error handling and fixes incorrect 
DMA depth macro usage.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (2):
  ASoC: fsl: lpc3xxx-i2s: Simplify error handling
  ASoC: fsl: lpc3xxx-i2s: Fix DMA depth configuration

 sound/soc/fsl/lpc3xxx-i2s.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

-- 
2.43.0

