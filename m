Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAA92494F0
	for <linux-sound@vger.kernel.org>; Wed, 29 Oct 2025 14:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761747109; cv=none; b=rEkEa/ENniopZWN0Rbmr/xkI8Nu4L4XnHX1RA8gv0bW1Ovy8amGU/NtYOume9qp4etaC8Ku0IX2Qlihsl5a9LyfvuH8bVYsY4SozfGJLQswoHiEkyTjGHl4i9VF2GHjEfCVQmI/WbFxyQCY0M9+MBumAj16HfUmtAccBfzupe8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761747109; c=relaxed/simple;
	bh=YxKCqDpzLn5hW98Qchc7Gw3CFI1BEe5qc1Eq+8M8wuo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IEnLeuaSIxmmqz9ND1pw0QFFzoGahetujqiIDty2DUYGI3sB4CILn08oSdhQ92iemUNOO0B689oGCAg4FxowtqKKzxbHWezzBzFQe5m1VbKXKMPVQA9hm0aKlp9uPkHKhrt3/ewaUKkhcIkWNNOxkLD+lwOVYtjY+vCf6E6WsfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=FL9ub4xw; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="FL9ub4xw"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-46e6a689bd0so73221725e9.1
        for <linux-sound@vger.kernel.org>; Wed, 29 Oct 2025 07:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1761747106; x=1762351906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wps8Tclr//0cxda7/H585r6cl0r8XAUnNbHG7akvxZ0=;
        b=FL9ub4xw81uT7bxpRXQVouShbiViS6sfkFZcGKhnpHsSUKiaN66nDQtGkF63/W9/oK
         BgIZd/qGpqXTYGLR7LDMWDpzdwi4rhrjVol2T0e940tZ9psNX2KuEVi2UvRESX8fxxEk
         XREfUZ00eh2zaChw8CCEEbdatydCdC2G+zX5DnFFllQqxcNINNf/2o1vpR3gUbwlpQiw
         lzsswkgDphumpqd2ypZXb+12St7CLQJaXXe4kkN8TqHgp620q/FM/MyKWrzLoJJp4QP9
         j2IKwIBgOe+BlbDKwET3UV/qih7mqJHnf5fWE/DS00CBtFhEQg8VaOXZsOnMPcXgtjsU
         OqaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761747106; x=1762351906;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wps8Tclr//0cxda7/H585r6cl0r8XAUnNbHG7akvxZ0=;
        b=jmLyx2bUqMbcSHFxzQSIM15vGro4TJO3Jlcg56tPNymyobl7kad3kCZPK+Qx7xYQx1
         EdVlovSzhMz1V1ndG4egPfxePN+9IjMVf/GV+ZsVGubTw0B7JMga3qLmcqLVQPYGBuPN
         jJHhhEQrOtYwRWAAAs8yXn4n8YZYS9+V1RzWWtJHIB61lhvlDtoTMjiRrQEWRGCwk4ZM
         AhhtM9yymhgZt4p5bRqpMneU36yOl7AAhxrMhCfkQwlanEymPqbsvfmoB4EsBqEskS8u
         o6RBM8s0jkuKHmEEz+t4ezBy9rrmebvCNCXJ7FFOz5NWv6NBb7Vd/B7XhlZKkMY++sCZ
         TgNg==
X-Forwarded-Encrypted: i=1; AJvYcCW5k339xJor1EvavwMvfdLkeEwOkz+BV1JH+um7X2av05IWMOjG2gUEE4d1dlRPf0c+6MeVtS3LQ1QMZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx982COhSaBrMNjkZOB6Vo+49ZoAMe0V7ZN03NbdIkVMcKxi2qa
	KBhghPsFgccbln4B3iKZI65ie5hl8V0FaS/QFdtI/rtR4yOO0ITRYs8plklB7Z0Y6Q0=
X-Gm-Gg: ASbGncs2o1abL2qAIosdf2ZyByP6chGRyVI0pLzXTBqODyWnJYM2y8wlU//5gTDC/2r
	WkAAgVeHXhWOGgQaRsqNe/ib3IwNeU35INfA0cfXunkiZLjKAh/gJuXv5/hcpwwR9D+5eehqh0M
	QOhgC/ijEFejr53hWPFvRi4xGw5v9WIVLeZJ6nSWYR7p4jCUgKtSuHWJdYUvuETGkRBT3UrCOwt
	0F2qV7KxnIX9CdCy+wv+CwhWWMf5ezUVkr/qND5lFxXH46nSqaunVaXlsY6kPUbagy9wG1GW/PM
	DE5S4VQ3PiY1EMZ4XGYSi8VtexmySSobv68M93eNa8JWL7F4IHQJ76rjzr+7LV5dJmaueJpCKjG
	VX0G5hCLytaPRqSGGVqaJJTLaAGRCKvTXQVqf18b5D5z92fvkEqckiEK8WgEGfQm0/bShKHFtCl
	aihhHPCk/hjXcg2PvvGwDKNnXuUMnFEGVQwqaJCsMsrIi+X+iSgi9j7GbUlYrCXYE4hicTINc=
X-Google-Smtp-Source: AGHT+IEzlAZE9hRTmYR0/hE0kh5mGYt4Uwp8142hjLL8F6L5G9iVPPBs/x3dk7Iz3ZYqyRcAHD45KQ==
X-Received: by 2002:a05:600c:828d:b0:475:faaa:8620 with SMTP id 5b1f17b1804b1-4771e1ca0c9mr26073805e9.20.1761747105903;
        Wed, 29 Oct 2025 07:11:45 -0700 (PDT)
Received: from claudiu-TUXEDO-InfinityBook-Pro-AMD-Gen9.. ([2a02:2f04:6302:7900:aafe:5712:6974:4a42])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952db9c6sm27076286f8f.36.2025.10.29.07.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 07:11:45 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: support.opensource@diasemi.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 0/2] ASoC: renesas: Fix clip sounds
Date: Wed, 29 Oct 2025 16:11:32 +0200
Message-ID: <20251029141134.2556926-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

Series fixes clip sounds that are reproduced on suspend/resume, from time
to time, on the Renesas RZ/G3S SMARC Module + Renesas RZ Carrier II board.

Thank you,
Claudiu

Claudiu Beznea (2):
  ASoC: codecs: Use component driver suspend/resume
  ASoC: renesas: rz-ssi: Use proper dma_buffer_pos after resume

 sound/soc/codecs/da7213.c  | 38 +++++++++++++++++++++++++-------------
 sound/soc/renesas/rz-ssi.c | 25 ++++++++++++-------------
 2 files changed, 37 insertions(+), 26 deletions(-)

-- 
2.43.0

