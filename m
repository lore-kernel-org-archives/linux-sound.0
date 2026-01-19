Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F9B2DCF58
	for <linux-sound@vger.kernel.org>; Mon, 19 Jan 2026 19:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768852398; cv=none; b=TajtPgSxqNlpgOWCPXp7eDZ6di5NRE9rY/sWWMKV0P7caTR3IbSDItkAfUIGXSyc557TxiAE9FkU3yKIahR9A0nu57BTlnKaqoz3KuT2zGzHI8qEWzELSBuEgT34dkOSei3ecvPz+fq9pJAby6tumguljYX8Q/vV4Q5rHlxaOw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768852398; c=relaxed/simple;
	bh=Snxh1hWiJUkWobs14saFJw6n6BxULznOgNBMqPgvlxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h2keGIHKRCZB8psPntXATWb3o5MjRjhFL4ZLrHzeHSQE6NXVzW8txS5pWC46E5RbgXDdWdnBk6EKVdkixAVwOYm2+zha3XQpibrozi7Ur2p4oCKGOj9VyeO7NfjZaLcOUh8Zn3RsWdJTynHHBpIiOsknspKdAt1gGcreZne++ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=QgR28dfC; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="QgR28dfC"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-64d0d41404cso8210325a12.0
        for <linux-sound@vger.kernel.org>; Mon, 19 Jan 2026 11:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768852393; x=1769457193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p/yDyZcj8ePhaL/yIl3vTy9lauZCAE87dk0c2WvASW8=;
        b=QgR28dfCOE0HruI7ZSu4R+yrnWEfD8Wq9VwBNM8/P49h8N2aWZXhhafkKEKBmPeEO3
         WZUzyKrnSBnbg7XS2OStqkFFJ9TkD5TBCg1/3JDQ5jQ0G78UxBYHtq9EufUkhIEbYG+i
         niIlPQjkEWcGZs4sfsfNgRBR3f28bTRhc77lh27iPcAY56dvtBz5q5jz6+EbcpFBRwEI
         DlqWaoZHgLvHLgJd7o6L9MXMNgL4tZ7XaHeTx6Jw1s+AsrlzyRIP8kKX4BhjC0lkwnvx
         67OzLZGwrLR07645ty+w1HAIFSf9p5IZoiobZfvBzoZygJuatbtygWuyVJS9gyj94BO0
         Aqkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768852393; x=1769457193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p/yDyZcj8ePhaL/yIl3vTy9lauZCAE87dk0c2WvASW8=;
        b=XCwuyGkIXWcT8aZMXsit+/a1fsI6fw3oPrxxuYhf9l1rQAgVCCIyy16bpa1D4KfuR4
         lWJQmzZePsK2zXKQV8atzFaRVQ8a4oG4o8gqI9Im36ucPMT9wMuDcSIc/4s3PFGP4Zkl
         QS8qOHfuy6Bt5BJv5gl78UdKUrNgZbxbmSTvYM4JYbdPdLhXATer3ofQvlwAX51Wltd/
         qFOY6Qr8q69yaSCHc0Hwf2OP1ok8XhIaeJIkLNuWZfgun+NzVlVKl2ifaHTjUj+rOJPM
         PNS61kP9EQ157xVBNx/nZgW9wfgZFCVNRxL0Qa7vTF/K35U1JgVuunXlwtAh9nI64iXr
         3weA==
X-Forwarded-Encrypted: i=1; AJvYcCWlNfcSHMWRaGm5e04Wyl0rFdbRhxeilmLn17Kp35sHh3ptTJYjhoAifn1GA9XKWgwbHsoNWtmUdsBslg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzeKxNn8stfsXyhvrwQTzVrZpN8eaL+x2+1rso9iGzIXjb1bv/o
	/lZfjshdD8t3r6EKF/MZ5swhOtpLjNjLNVphYcUxh5dlJdeH12xqzz9ZQIGkKXvZrnk=
X-Gm-Gg: AY/fxX4ylZ4SJyCSCjxhFetoRQ9VkVb5RZdPgc/ODDi/i3WoXP+gMwPfH4TpliGK3Yu
	Guq+6lnQkVk5oq7lVEZFk0krDTLupS3quRtIkJaNK3AyZ1Tu/WrQWy7ajLT0Kz3Pmyblg5/QlKw
	egVUApdwm+EnQvXSUfTIcb/ZtaOj/1vqoQ1XqiIWn3gpsjzy7NuOVcPmH4QXIgGS5hdahgbiZO2
	gdPBzRmwwDsyJDPohs5iAHC0GcwwFtCBj8/8QCu6R/bJGWrYb/fq5p3hAwq2qK6iWWLtFiKQrH1
	nUdGMhZv1YIh2bCku5J9gguKrteMJQKq6CSi6+STmKiiLbH9aHkf3mkEDyrqQVU86GfjFez6NGq
	sZ4xlAsTRXbnMTdbvb749tqk3+3EDPhHfKYoPuDIXf/B4fg8UzmVYI97taKeEYtHi8TrDof4C1M
	xERvOK4IT3PkOgJ2uqXIdV+1jUzj2OwRIG8IVZBsc=
X-Received: by 2002:a17:907:2d13:b0:b73:210a:44e with SMTP id a640c23a62f3a-b8792f79a90mr1044358866b.30.1768852392504;
        Mon, 19 Jan 2026 11:53:12 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959fbb38sm1167248266b.52.2026.01.19.11.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 11:53:12 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: claudiu.beznea@tuxon.dev,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 2/4] ASoC: renesas: rz-ssi: Drop unnecessary if condition
Date: Mon, 19 Jan 2026 21:52:50 +0200
Message-ID: <20260119195252.3362486-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119195252.3362486-1-claudiu.beznea.uj@bp.renesas.com>
References: <20260119195252.3362486-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The is_stopped variable can be initialized directly at declaration,
removing the need for an extra if condition. Drop the if condition and
initialize is_stopped at declaration.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 sound/soc/renesas/rz-ssi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 35239ed7f916..694b32214109 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -604,7 +604,8 @@ static irqreturn_t rz_ssi_interrupt(int irq, void *data)
 		return IRQ_HANDLED; /* Left over TX/RX interrupt */
 
 	if (irq == ssi->irq_int) { /* error or idle */
-		bool is_stopped = false;
+		bool is_stopped = !!(ssisr & (SSISR_RUIRQ | SSISR_ROIRQ |
+					      SSISR_TUIRQ | SSISR_TOIRQ));
 		int i, count;
 
 		if (rz_ssi_is_dma_enabled(ssi))
@@ -612,9 +613,6 @@ static irqreturn_t rz_ssi_interrupt(int irq, void *data)
 		else
 			count = 1;
 
-		if (ssisr & (SSISR_RUIRQ | SSISR_ROIRQ | SSISR_TUIRQ | SSISR_TOIRQ))
-			is_stopped = true;
-
 		if (ssi->capture.substream && is_stopped) {
 			if (ssisr & SSISR_RUIRQ)
 				strm_capture->uerr_num++;
-- 
2.43.0

