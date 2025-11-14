Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B998224B14
	for <linux-sound@vger.kernel.org>; Fri, 14 Nov 2025 07:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763105836; cv=none; b=t+Dhhby20wbJpo/cgWrcHiKMccMCJ7aDS3BNjtyAgp5XLgZ5y3TcLVl3f5Vo2Wow8+fsLDsZUgOk0RsIvIgzdMfzkL9Be9veNJOQ3x7muVXcQ2cnwBODJ9cgJsKAmGq/17Bbcsek+QWqeQYsF17AjY8TnJbm2y7J/N78Ir559Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763105836; c=relaxed/simple;
	bh=nLW8hXJbFDbAk+S2a2f4YlzqFIsMONGXazabO52YUxc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MVDkwqllicvZnpFmy0q9jBH9aDkGlP85iqKqAI/JcJ/u4HcCH+iNkYuYw8PSi/W/JHd6GsXxoeM+PpufDadPKkctl76SI/mU4GpD9TgPz7vaYrYjBTGshBlY1u8hCXDjJAnNllIkdDqXs2mzDlyR9c4dWWWuQjGUdzuOLIsP7Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l/oay8gF; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l/oay8gF"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-477632d45c9so12347345e9.2
        for <linux-sound@vger.kernel.org>; Thu, 13 Nov 2025 23:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763105833; x=1763710633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=spGEMZyXb2M9z42+l2X6hK3iU3ffAx/VJVjGK4UPR8Y=;
        b=l/oay8gFO/KDP+oeOZFv5j4sfKVjrhjCXZQ35JL7bpa51W04IDIHeNKU6u26yrU5Zu
         wBEDPhxVE17aFbvcVP5yqk8T29HFoLwtwtUaAxGlFRirUgK3rXBjTXqvpEuQRr/PPCg9
         2uB/ArMW2rHMejlJTh0W+edkAIKHYIj9lLHYxQrBigV/Pln6XnoIi5dKFcZ4h/ORyDnb
         2HXJJaO7r9f+P3SZ2gf8uRGaVeNXUrdDbE3GKMVLCSqhBiS/R948vqBS8ZTKyQO08tOu
         1dtheEZbtThVNhujd7kDtw7X4uuI827gOz62ShPl5LnhAOdypRaFIftGSA5qNZFiOgXz
         4OPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763105833; x=1763710633;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=spGEMZyXb2M9z42+l2X6hK3iU3ffAx/VJVjGK4UPR8Y=;
        b=dftBihdUp9umCe1/Zi1on/FvC0fqkF0HC/wAQyy2oFxMRaOtO6ARKMJYPSJlypF925
         8tUPi11kfDFYjgrSecqX86ljESWW0ZvbR/9rqsYEmt3MdpVk5nJA7BFpY+xF1SZ46kOF
         oCPG4pJFyZFZv6uLURPO8krweXvEdT48Y/t1ANnD1DyibrLH0J98794up2yqReiZ7hVQ
         Xa01th3QNGiE05UE2JYnc3fT3RfFe5RRwJejoBzjOU16drpIbyyhi4uQ6yl2QJvzKsUm
         QwvER2ivYFSR8EAs8uaZRv77rHbPPqv239+89+O9wqyyvep6bo7k3BFHJ9Yiwt0EtfCr
         8jSQ==
X-Gm-Message-State: AOJu0YyaD3mCoExiVy2iQ+7SCx4XSWk/p+FcWu3T/HaoHz0oyYlobk3V
	UONkMfGKGlvWDvlQnp7krIz0yglkpk8F4Bwo49EQXdPr5oL0xSX5DsKb
X-Gm-Gg: ASbGncvNWsu0POjKnIUAwNrXcArmY56lk/FzkSu7POSbuVKNNkV9Np9SxeVytykTgxn
	NVhj1TmZvOtSuq2hoR+r4UIBP+LZwJamw8Eo/ZMTVjU7vajcYOHM5n6WE2tbE2LLH8nPVdC0V3Q
	OaSUp7TIx+165i4PVQxE/3fb4RdMPliUAdjiXpTB5GteM4+V+UHiBIunM8O2V/2ZfXe8/GTWGNO
	nyxgl+3rF2o6A83M8pYayu50rVVQsSvTTQFHPVMWVFwwrwJtGLl+OtMvfvgQkujELA/qnSE22uD
	m/cBzRXqaiS0b+oRPqvO+SjBHifI5fWiTK0DafJfx5272OzbA20q0lOLmnKtkdw3q3YOnuPNyD/
	7pz4z2CFHAzIRATxQyGpoeLG7iBmig2mZ20JmDPkguT9+aBkagPvFIRQKObk84aGRHWMbI5kxRZ
	sUCCtFqWdbQ5EZBcc3asTeyXqS5h7IEKb9Drkirm4RCTPEd7J1GkJWcgHMfEvQVJWPnZBD8QzcA
	VdxTc4KCg2YdOBc
X-Google-Smtp-Source: AGHT+IHfewQs+7a3lfvqTwRdCBtuVmy50gUcb9jxgnl491ywRf0F1Ve9RTaE3/Z1x1yp8j4QOY2Teg==
X-Received: by 2002:a05:600c:3b0c:b0:476:651d:27e6 with SMTP id 5b1f17b1804b1-4778fe9647bmr18114185e9.36.1763105832799;
        Thu, 13 Nov 2025 23:37:12 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4778c88bee1sm95071825e9.11.2025.11.13.23.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 23:37:12 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 0/2] RZ/G2L SSI full duplex fixes
Date: Fri, 14 Nov 2025 07:37:04 +0000
Message-ID: <20251114073709.4376-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The first patch in this series fixes audio channel swap issue because of
half duplex to full duplex switching during the streaming that involves
FIFO reset which drops the word leading to audio channel swap issue. The
second patch fixes sample width value in the hw_params_cache::sample_width

v2->v3:
 * Reduced the indentation by restructuring the tests in rz_ssi_start().
 * Retained the tag as change is trivial.
v1->v2:
 * Split the fixes patches separate.
 * Improved code logic in rz_ssi_start() by using else if
 * Collected tags from Morimoto-san

Biju Das (2):
  ASoC: renesas: rz-ssi: Fix channel swap issue in full duplex mode
  ASoC: renesas: rz-ssi: Fix rz_ssi_priv::hw_params_cache::sample_width

 sound/soc/renesas/rz-ssi.c | 64 ++++++++++++++++++++++++++++----------
 1 file changed, 47 insertions(+), 17 deletions(-)

-- 
2.43.0

