Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D533C9EEE
	for <linux-sound@vger.kernel.org>; Thu,  4 Jun 2026 20:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780605407; cv=none; b=YHcInujYp6wIDCcSfJswh2p6WwBUvc+9SE0fg1la98RAdUDbta1Q95vtr/00gBE/DYAMka1gyADAT92ZK7JXIowH4FI/Csrsl1IK0DsaubUz5sRYaTPKZeUEE4Zy3ScmkcTYFYE2uY+m5M4yZQQIeReTX1tqpu5bnbqrmSaWyJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780605407; c=relaxed/simple;
	bh=6x/ojXkuF8nllztqjsDMjtFT/Fgf5pdxmmz0LydfmG0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RXBwGus5mFI9LEWQIhMTbnUOUI9hxIC5Ads3DYlic1u3bhH+lhHtCITaDWRtAEhNCW/R63WdYo1YQoMzZihy2XuaZA6CpMzeeUMgsOnMeUCGz1n+PiPL6f7FbksBXJ15WXkgQBlhsLQ9Y9+etAbKeG5HfCgTjlp3kUUy6ziplkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O5IyRpbs; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O5IyRpbs"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8423efad617so642414b3a.0
        for <linux-sound@vger.kernel.org>; Thu, 04 Jun 2026 13:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780605406; x=1781210206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iJnZuwuMHvW8L98BhZe5fgrtMJB4sNolVVw/sf9vpDk=;
        b=O5IyRpbsjuuszKvps2WHRsl01S4PqhUzh4kIKPFdVmUzs4AeHF6Q+nV8ab7Je8JpbI
         J4pT2fB58HY0ZORYBRQaGYFu5bbGmrKRC8Ui9xAcCihi/cD238JkN2rKFwznJ5wt31Xv
         uIhf0yPwyesIiAd+JW1aqzpVJiN8wuGa/Sk+o5Dy0PPS8YjzZO/PDz1dnt444VlzJrzU
         JsqibM8utZicVlsaCw+mvuW6u63O6uqVbd7o03zta0RR9txSX6DmS8P28bl2XlYAN3Pa
         rKHXQdqz7fPJ0ZiGeapcXfhC++rGZXP7XHwuBthxqiv4FOfQa8Scf1LSYfZXk/0ZXnUY
         05kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780605406; x=1781210206;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iJnZuwuMHvW8L98BhZe5fgrtMJB4sNolVVw/sf9vpDk=;
        b=huES/cMATM/f9yY7BhZ5JIiUq8lsCwZuoqafHbVo1VfGiT4gAa9LDSgKo+Uqtcxmmk
         Q6BmRlT1xplGdI7vMe7QVHfQQxQwCx9Zazephv9vlIbkGK5VeB/KSmwWoVxIRIOUxvIk
         SsZo8A0Oblx0vcmDCs8CjTSHAd0VP3pYc1vOjBB1W4nniRRp4ditDcT6NdfhHnbzxl20
         q59FKX2XzDEoZNCAk2E+G9EJznIWoLT7gQjy2X3AU7PWSUzDGhOUd4JWQB+k3yGqaqu0
         zJa7efGvMlBqyryhpsyn1xrTfIWs4KS98bDf7xV0kfxIqkJDVjxavEV8iUdpb9a3zSuS
         XcoA==
X-Gm-Message-State: AOJu0YwxwDv7GPBkrcQZPm8J/2ladeJyDeHrxxKbBwYJXcMQ6Rb4ROvI
	fqjyS+IxR5fT9fJCnm5qdXIuEV6JZfzdAC3fPrqvxXRsuVtK+AJnEE9tog9j79IzRdA=
X-Gm-Gg: Acq92OH//e3lWnuF7rY5wSgz8Eljw4861vaHfKa3a5ndf7hz+XNC0W823h2b2w0yuNG
	STVGoeFioql6xWF67o2BY+ufKckquusJeCeVoXnn4Upqt3ieTw4mOnxEdlb6MOGEGUH0CZPbDNp
	g5BL0dEA+UtdX/RU9CDcBnrrV13wK7wMemW/9y8ZOmtqD6FdTBsckqw9RF/70KLHmaBuexYkK+y
	GLC+QIajrOi+nI2nfPwocl1oAw53j3HyGByLgXmj7nDIVe8ww/sCk0pWP78tKQET3m4bFceI+jV
	tr7H0S9P2qD0XVLZjoej4u08DZD9VXb1Szd8a+sSdok7doT82DgzSpvDuxmF223AJMvy5J7LS/D
	EyFYB0avS8ICkGxEL631WL9bj40/0RuT7R8wRMAyaQS86wPuKlRTrKF7+jbO+FX76TjjOkbwTTG
	qbJ14sa+dPxqWti+0Kze8JhdtCHkH0vwbFg/bwaGNS6tJLggyLQtFY6Wd1HkqZ3PMGs84QIrEfN
	hEj
X-Received: by 2002:a05:6a00:4216:b0:82c:24d5:63e6 with SMTP id d2e1a72fcca58-842b0e619camr323397b3a.15.1780605405545;
        Thu, 04 Jun 2026 13:36:45 -0700 (PDT)
Received: from Ubuntu.. ([49.37.171.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828fe634sm7118257b3a.52.2026.06.04.13.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 13:36:45 -0700 (PDT)
From: Manish Baing <manishbaing2789@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev
Cc: linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	manishbaing2789@gmail.com
Subject: [RFC PATCH 0/2] ASoC: atmel: ac97c: Fix IRQ handling sequences
Date: Thu,  4 Jun 2026 20:36:21 +0000
Message-ID: <20260604203623.162640-1-manishbaing2789@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series addresses two hardware initialization and teardown issues in 
the atmel_ac97c driver flagged by the Sashiko AI bot.
The original report can be found here:
https://sashiko.dev/#/patchset/20260530052812.115994-1-manishbaing2789@gmail.com?part=1

- Patch 1 moves request_irq() to the end of probe to prevent a null pointer
  dereference if an interrupt fires early.
- Patch 2 reorders the teardown sequence to free the IRQ before disabling
  clocks and unmapping memory, preventing a use-after-free.

I am submitting this as an RFC because I do not have the physical hardware
to test these changes, However, my manual analysis indicates these are 
valid bugs, and the series compiles cleanly with W=1.

Manish Baing (2):
  ASoC: sound: atmel_ac97c: Fix IRQ handler null pointer dereference
  ASoC: atmel: ac97c: Fix use-after-free on driver teardown

 sound/atmel/ac97c.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

-- 
2.43.0

