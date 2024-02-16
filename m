Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E669512F39F
	for <linux-sound@vger.kernel.org>; Fri, 16 Feb 2024 15:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708095956; cv=none; b=REdA183Y1xkTn6H5NH8w9ZAi4z7m0HbLBCylaCZ29GG2l4wVWlJV/s9KbU71HCCbKcHRUn+QKDHMzwcmxr9gSi0mBKZV1txVDi56QrX4cNpAncRyOTUdMF3Wx1JDpF1FjPdL7qdVTWTPtPir3WbAoCXQGnXhCI7vJN3Cwd5zl04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708095956; c=relaxed/simple;
	bh=8Vogl89Enj8gkW9kBpiditF38IsYc462P0LNtDM7Tfw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=UOW1zAVQp5NeEiBbRJWonr+ryjOnAW/XkBhhj0upaoiBVA4efofJBzBJ2J1Eckdnr4+lNwirs7l0alQjYOlLrwX6JWO0ZDcaKcyt05gXk1U0hBjKwnka5mBf5RyIF8Kuwte9V1Hgo58PHmUakqPEix939kzwqxQ2xsv9kbCl5Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j9Kn8M0i; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j9Kn8M0i"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-511ac32fe38so3146882e87.1
        for <linux-sound@vger.kernel.org>; Fri, 16 Feb 2024 07:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708095953; x=1708700753; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wS5vy3aTcgJ+XPpXyGdETBteMacsnTkqt+SfTTGx5PA=;
        b=j9Kn8M0ioh5pEEWRRg21FgLHi5V81ZvcDR/pcx/UJhN6iPf7u7OV/osqiYGlN1PNpd
         nxAkKqC1AZk8J4INeRV+jLGP93VDs2Zgn+f9pJjDp5mppd0oSUMwx7Mo6+YsNHG5AqSc
         8B4Hpxq5ioCmgvK5voC/YmzcwnsKDpxQzfjliCqzOiZnZipe99NCCS75ZVAZeeE8h7sv
         hc7Pe4rWbiIrTowueL5T012RX0JQSMV/atmhpX5ZABvUofA7gGhoYLeSGDJFNs4iHKxr
         yAqS+J5zFeMaqncURoDOhnXsApGs5KwRv19Mq6mKEcsh39NMWVmwgiMlPLSCE8UgLMq2
         skZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708095953; x=1708700753;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wS5vy3aTcgJ+XPpXyGdETBteMacsnTkqt+SfTTGx5PA=;
        b=Ux3VCbt03hAUe+83uzsUR+32UgP85j/a1Y3+OHRqMxK3o8ekzoCND7mz0bGQkiUOm1
         D/4KeOLYc47ZXEmGv6fHuMN/V+Da6Vt9qXksOjJzmj6qx+u0LWLiDMWNbnXYlJCPjTR7
         /md3W8Tas4AsV2jQMqjf6XLVhnw83mdOxjM7o2vxOOfAh+1gboD2T9TemwCu0Oa3108s
         yhvR3P7LDMFYVvNgUtiOnpxr3X8OeX7AVlRHH9Im0hGZh3UmgrvNrBN3X5ZVlQEvbTGK
         B3LdUHCjKUAx393fF6DcdUaeGP2ESKc2fwaCWYcg1c9g8TFv+KUEQMv6kDfk+bDErqXL
         si2Q==
X-Gm-Message-State: AOJu0YwQYEjPFsoLC5+eNkCOMOOiJCDgv0bcZvKw+wpxnHcm7Z0WpN+T
	SIaDxx1YVxuUfnpnEkJLTtZBnFeCglPLMvHrFmzrWcGPZdliTM8mtQBmmBklPMdXUGBFsU+rIM7
	mIbddPXU9iM0lqbgJhrwG/3sl37s=
X-Google-Smtp-Source: AGHT+IHnDJZi/zJ37TRzflmf1gg1J3XYNSYmYkwLHAWI+53kh+gXPSQi4G8IqpzQEDgLqNCImgfQMPLxr2iDq4X+VGQ=
X-Received: by 2002:ac2:4ecd:0:b0:512:99c2:dfa with SMTP id
 p13-20020ac24ecd000000b0051299c20dfamr706091lfr.42.1708095952567; Fri, 16 Feb
 2024 07:05:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?B?S2VpZ2ggUmltLCDsnoTqsr3rr7w=?= <keigh.rim@gmail.com>
Date: Fri, 16 Feb 2024 10:05:15 -0500
Message-ID: <CABRAKeKJg8H0s88yGH96S1d=vZmGjYa3g34XEkR0PmEjhVLA2A@mail.gmail.com>
Subject: [PATCH] soc/amd/yc: DMI quirk for LENOVO 83BS to fix malfunctioning mic
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

This patch fixes the built-in microphone in Lenovo 83BS
(US model: Yoga 7 16" Gen 8 16ARP8),
another recent AMD SoC laptop that needs a quirk mark-up.

Signed-off-by: Keigh Rim <keigh.rim@gmail.com>

---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 23d44a50d815..fe1760213ca2 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -248,6 +248,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
                        DMI_MATCH(DMI_PRODUCT_NAME, "82YM"),
                }
        },
+       {
+               .driver_data = &acp6x_card,
+               .matches = {
+                       DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+                       DMI_MATCH(DMI_PRODUCT_NAME, "83BS"),
+               }
+       },
        {
                .driver_data = &acp6x_card,
                .matches = {
--
2.43.2
