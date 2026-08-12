Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1D2336881
	for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 12:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786537277; cv=none; b=ICnW0ovX5o3JmDdr8+jKWV7XrjkITSBWiy+BYpy+7EMGRtHoD2DBX1xSXqpgnYEnKur7tJ2cVX/YoFakJLm3P0G1y92Ae0PPiwWrfr/4pMFglpzmBBDs9gIQuge2PyiLGqdEMKV4pV09AJLV6u0ju/CN2zMtwXXl9SW53l6fwOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786537277; c=relaxed/simple;
	bh=w8oRx3CuP9kppKnyAHLYp1cAmDqkE2jrimWAZaVlFvw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QpJSptEYm2O/DZebptvDVVXIUKGMx5cobDDwrMEWJYPzZ++jXhYH6Vpi7ymrbWpSWppWRKiwaLc0Rp08k0gFVP6NAQi9obKRCZB2MT3NOxLY7cq8lSIR5zRIL4lD8bu16EAnbsrGr9JQPa7cj5PoRaK0rjdh2NG2xiVLNs3OvEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TAHv3A0E; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TAHv3A0E"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4954aff6088so5711225e9.3
        for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 05:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786537274; x=1787142074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=B9iDB+DHG0XoHYqqt9xRe7BroQ0Mc1hhck29SNEgnCc=;
        b=TAHv3A0EK599wYsPOabHScUmKXH8nDFhsonVVHNN98peX2mXtSJsKqmPZ4q3GHds1V
         A55U7k0uvm4oYNLY1hwTEXfvZ2BQ01w31UYYaNk7HFPn2+NJ7x2/etvM3tyzqVxljOFR
         dxMGeEfdxaZSXzoGnw0ky/t+EN8NNxecnYwEppzXUMy76bwHWe25fTvwjnRI6Xfh9F1K
         HDZEl34sWeYtBFR6wl9gd/1rzpXFczW9fYr9vuiaFmqqaVKYSwH2zkYs3HfqxfPnIlrj
         2vEaxnP52w7/roccjpNNao+tEmnEVcrz1TAtt8rAdLXfulEvwod+H54SW7lGZPbMbyxT
         D6Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786537274; x=1787142074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B9iDB+DHG0XoHYqqt9xRe7BroQ0Mc1hhck29SNEgnCc=;
        b=r3HapQG0segI7ZKQhp8FEDoTs9MYU5sgbAlz/+WsGH5htmFWAVJgHMlRsdJihhgvJ/
         jkDRzutRKnNiVOwMmE2THegLSJBv0D6plK7zebJv5hGpxR40ugnCizicEk7gscrTBqQ7
         T+30RDQ5aD6fppOVaWvh7BZKwHGZ/CZZ8p3du1KL9KAPlm2d2WdLZ2Ze57oqGgyi1peT
         y6JzU5HDArbTe7OL0pxJz2GK6izt1AR4xuZNeBwWdsGY5Mixu0whxTztumbvRlqEdh4O
         4UDC2TO4/WWTBzdoFIG0Y9g0SIbhYnOd6AVYnVIehXHWmy0kwpNOM1idLTz/mfbErC/F
         blLw==
X-Gm-Message-State: AOJu0YzRDNe+VIeiej2VcR4jbKjuWctMwMg2BGJtEiZVpFkVI1nB1gba
	g6QNmHH+FpLJEb2nmXosruByWTBFTbixguB+dGltLszWWafAyOHx/9Of2VZBefqITiI=
X-Gm-Gg: AR+sD127A6gwsWtE7kxZS8s7roksCRfI/PT9+KDPGDnkPf+jKDK2FXM+dGiaBH+bCvP
	Xea701lqCXqpkJxQs3hcp8L54EPuycV2jLgCeEcMERjQ001ncPOLv3XapAEp/v9bOXpSpdwkzbq
	FzDZv8S5+xPpwLDMdYOrGIIYNKG9UTAW9QgBETtUm0egoQJkakItzcUj6BIo/Wxclpvg494Lxcj
	bGFbrw/6QyfZfqVoRbvAqiOifzwVTZMe1DVp6Cq6TlzUhMiexMm8cX1B6zPtF8MEHTm0mjKAyKc
	2KbmCAYmCE5hmcp299vzVe21afvxblShiRpLi9KDSLDMuiyeY7RSlN17thuFUFmZYi0MqS5GLMs
	4RETbUqF+J/U8N2i6ws1Tlh8k38fyklDXIP/+q6O6Dc3OGtXGlIOpZhgQeC/u8AjMcYXhFR2cpJ
	MyAVQmc+2WwSEB+l2mOzD+P18VQ5blIxdqLbyNjgIF86i5Uq1cZg+Jbp2jZsLNmebcf1ergA/iP
	Q==
X-Received: by 2002:a05:600c:198d:b0:499:491e:4b0d with SMTP id 5b1f17b1804b1-4997c172e1amr48296535e9.19.1786537274254;
        Wed, 12 Aug 2026 05:21:14 -0700 (PDT)
Received: from localhost.localdomain ([146.120.191.55])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997abeba23sm64888245e9.11.2026.08.12.05.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 05:21:13 -0700 (PDT)
From: Dmytro Moroziuk <dmorozyk1@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	Dmytro Moroziuk <dmorozyk1@gmail.com>
Subject: [PATCH] ALSA: hda/conexant: Add mute LED quirk for HP ProBook 440 G5
Date: Wed, 12 Aug 2026 15:18:56 +0300
Message-ID: <20260812121856.30353-1-dmorozyk1@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP ProBook 440 G5 requires the CXT_FIXUP_MUTE_LED_GPIO quirk to
properly toggle the physical mute and mic-mute LEDs via the CX8200 codec.
Without this quirk, the LEDs remain permanently dark.

Signed-off-by: Dmytro Moroziuk <dmorozyk1@gmail.com>
---
 sound/hda/codecs/conexant.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/conexant.c b/sound/hda/codecs/conexant.c
index 40da2832ba66..4bd68b07c784 100644
--- a/sound/hda/codecs/conexant.c
+++ b/sound/hda/codecs/conexant.c
@@ -1097,6 +1097,7 @@ static const struct hda_quirk cxt5066_fixups[] = {
 	SND_PCI_QUIRK(0x103c, 0x829a, "HP 800 G3 DM", CXT_FIXUP_HP_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x103c, 0x82b4, "HP ProDesk 600 G3", CXT_FIXUP_HP_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x103c, 0x836e, "HP ProBook 455 G5", CXT_FIXUP_MUTE_LED_GPIO),
+	SND_PCI_QUIRK(0x103c, 0x837b, "HP ProBook 440 G5", CXT_FIXUP_MUTE_LED_GPIO),
 	SND_PCI_QUIRK(0x103c, 0x837f, "HP ProBook 470 G5", CXT_FIXUP_MUTE_LED_GPIO),
 	SND_PCI_QUIRK(0x103c, 0x83b2, "HP EliteBook 840 G5", CXT_FIXUP_HP_DOCK),
 	SND_PCI_QUIRK(0x103c, 0x83b3, "HP EliteBook 830 G5", CXT_FIXUP_HP_DOCK),
-- 
2.54.0

