Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0F526B2AD
	for <linux-sound@vger.kernel.org>; Sun, 10 May 2026 10:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778408276; cv=pass; b=EiGU8EXI4Q9ND8JsQZNsgN/RePnd3vPtLC4wGudHfdLuDW8/rQjigq0D4jne6s4MsnSnmzf8qNQeXQRMfgHYMWDEMUC0c5BkHzRn2xniH5KcYAcQnOsIcLDk96ExTBSKf6TYur0ZCkR1f8cdG8dhb/KIDP4YauHVqcEUaLQ39Qg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778408276; c=relaxed/simple;
	bh=CwJM8J5MlJHUdzVrL5BxrJ+HJATc4hzLrVNKt3C0cZw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=FdwLl5zQ36JdpSvCJO6cCteW1mBdz4HtHc2z2+yrwKXBbsTLhD2AwlyM3ert0VF1JUxNvsl2oaeJzFMZW37X16MsHLAegqUcD5apl4q2lQgKMlEwJEh5WnyRsXDmFFSZnVuMnBZBkOjNeGjHhfRtySoQIJELnkLeO41pa6I592E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NL+HYAof; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NL+HYAof"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-bcceb394417so81951466b.0
        for <linux-sound@vger.kernel.org>; Sun, 10 May 2026 03:17:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778408274; cv=none;
        d=google.com; s=arc-20240605;
        b=U2wCR5xEQIYRfEy3GamcTq6QY5utfSK0JMxntdlm5NubdtDAzEv8Oc9eY05ojrDAyV
         hUi4WzSeSvmc8DhWccwbn5PswGL1STY0CtvIpE6Ca/QGF0NHbp/tYhD5M3PFkv7i/zjL
         aEleWpHYnfM5H7OehTzwIEMjwE88/RtSCYsvCT5ODiyViI+2l923Q200nuergELqKDYI
         dXUpP3vB12BryUjWprzo2FLsG9Ke6jlLEFUXXzV/GKXGJ64cbNjdLK/uXVa80Y4AiF/r
         3SrLMqDd9qnBAhrZDHdZBPjw8mv8ZNzavpXClG0AM5jr1dJ8u4geuRbxLouE08KNu3Lu
         uLyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=tsiGNF9fTaMmjfOGmnpR1Wdcd0vUxa6B6BGm8sQku0s=;
        fh=dRmD4AXe4m7pxReHRmOQHqoUuCUGHuxsR8yDHond48c=;
        b=bZ4jAqJLusq5SEFShqCf2xH50bVHEP3XksTCugzyr5w3slyRplsYoqhSeJQ38yzM2v
         Fn6qgRgeZyhY2eLOkkYYBpqURxbGPcnBCLpTKJzGvmFfQJjgZhCFn7KdjgVDJobR5Yye
         0ltVxj1Gqr7Wp4SMfHtWrHKBYhAapEZSRTXRREL0R6zpCY3u56X/kqXpoLNoKCf8irkG
         ja3EFLpFIHa7N3TgQ6l7wwTW5H9tdawX8ifWBm9N2E6FdoXguxYlcwluE7iE6nplA83S
         bkxqG1g1CBc1utXyjXtT+V/B/EKl/Fv0I8XUgYKKp5AdJPoYKWIqchvshogUJIF8Va5B
         Ukog==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778408274; x=1779013074; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tsiGNF9fTaMmjfOGmnpR1Wdcd0vUxa6B6BGm8sQku0s=;
        b=NL+HYAofhfMZXuhKsxGKUrNv1sZwvR8sx5GfqcI5wh7RuGZsDQaa6ih7AUiEx0U66v
         AmrciaRk9jCAv2URIfMoH4sOl2arO1eeJ1CK3ciewZVU8z6el7l7POTY8CBYpXJ04sMi
         Oz+slhSLCD6j99qUU0+qxfmDwKq5n2dMHvSOdcjR2B4HvbFUsF0XPwOtgdYOTu7Wk56J
         kBz0bnzgMgoHGvPMN+nHb2+sD81Ey7ividMfnOSbNiPgXpT0kE3XmecYj24zm+5/skjx
         dEkS/JbZ4CRRUIiPIrUkekW47+tXfSHRmZpRX0lA3tQ0FUVzb/rzJQuIkvi1mc7SiNhI
         RjeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778408274; x=1779013074;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tsiGNF9fTaMmjfOGmnpR1Wdcd0vUxa6B6BGm8sQku0s=;
        b=o6qOt6J96OtpynRJ/34TdfR58dndsqpHiPh2iEkIle+nlw01g+yTqRpODnN/q2jOws
         +7gM0q38a3gE9nIw4dzqHNCI9K32k0djNUsa1SW7noPz8r5ttvTd85wtPGkReTTrfLSS
         LVNtocS3Li1jjoBQEHDw2hOfK4x90VLgQi89Wy9h00gbxeUnOYtCLft+SDqMQwFyJtqO
         CO8ckpKBp0RpTYJmunJj7CX1AR/xjNxoScM+RTSyshTOX3e5ywsdBUHynyFRIDLQH7+y
         gNPuT5ZQLWgBleV5ez7sWj9tzJwjPsspUQVs+lvs2gUf/7kj3KOWDicl8PcjhrHmO+6w
         BOug==
X-Gm-Message-State: AOJu0Yw4snscVuYnYwEldc7E6rpbdGcWjWNFMTCa3OXdmrqnCxY+UQrY
	sa/iCJAApO2QxITP9sV0So2hRJ8JWKoD14Mb3k16yq2LjPQ++LuwikqrHGmyHqOa+bByGL1B9m5
	lId4WbVleOv6lOwf1WHEDG+tiVyhmVPIySpdCM+jXPw==
X-Gm-Gg: Acq92OFDnj5l9zQp1v9Tbx8ZilnYDRj4RKqP32bp6Dx0tH+WHqKufNtc0hPiWKCXos0
	ZluBW9FMEdjAbA2mYGfd0ivFLO8Mlg2h456+Sdm9KHkvfS/efPmrclGMycBLqSxmtHHCKNyF1Je
	AYtd+/Fb14WqgEsduLPaumjUjvRp1z9dR2Na4Tr0W3S/vYkibm5TE7qfF+lgHukE86ge8Zg0pPq
	ir5Lnb+NaCfeUGTbdw6Vs4RKftJITyRWl+TEqNjLf5XLL2zmDyi5n12DjwAD6GZh1a9tnwxL4J9
	Pqj0kGwV2uMiH8a0UDUHWg04rBTCkFccE3UlPu6TsTJ8WnutsJlb3tdEq0YHkxGnxD4IbPGmptf
	E8XvnTJL1Mpxedl/PHeQuV0gvi2kWlesyQ9wsGqyIv6Q6LkUXEWb2SayRTEI2uH8+E93t
X-Received: by 2002:a17:906:8d89:b0:bcf:2a98:56c9 with SMTP id
 a640c23a62f3a-bcf2a9859eemr46752666b.25.1778408273366; Sun, 10 May 2026
 03:17:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Aryan Kushwaha <aryankushwaha3101@gmail.com>
Date: Sun, 10 May 2026 15:47:41 +0530
X-Gm-Features: AVHnY4LdJKtmIpQ5ZNv8QeQYzT-Bfr5Tos0oAh96z_INDRco6--ygRvKmLN0CZ0
Message-ID: <CAFUwA8W-C2SXyVQRiH_H5=Cj-RmYuSo4OkVJyUV_2vMAvPNnbA@mail.gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add mute LED quirk for HP Pavilion Plus 14
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Aryan Kushwaha <aryankushwaha3101@gmail.com>
Date: Sun, 10 Apr 2026 15:47:43 +0530
Subject: [PATCH] ALSA: hda/realtek: Add mute LED quirk for HP Pavilion Plus 14

The HP Pavilion Plus 14-eh0xxx with subsystem ID 103c:8a36 needs the
ALC245 COEF bit mute LED quirk for the mute LED to follow the audio mute
state.

Add the missing quirk entry.

Signed-off-by: Aryan Kushwaha <aryankushwaha3101@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c
b/sound/hda/codecs/realtek/alc269.c
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7018,6 +7018,7 @@
  SND_PCI_QUIRK(0x103c, 0x8a30, "HP Envy 17", ALC287_FIXUP_CS35L41_I2C_2),
  SND_PCI_QUIRK(0x103c, 0x8a31, "HP Envy 15", ALC287_FIXUP_CS35L41_I2C_2),
  SND_PCI_QUIRK(0x103c, 0x8a34, "HP Pavilion x360 2-in-1 Laptop
14-ek0xxx", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
+ SND_PCI_QUIRK(0x103c, 0x8a36, "HP Pavilion Plus 14-eh0xxx",
ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
  SND_PCI_QUIRK(0x103c, 0x8a3d, "HP Victus 15-fb0xxx (MB 8A3D)",
ALC245_FIXUP_HP_MUTE_LED_V2_COEFBIT),
  SND_PCI_QUIRK(0x103c, 0x8a4f, "HP Victus 15-fa0xxx (MB 8A4F)",
ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
  SND_PCI_QUIRK(0x103c, 0x8a6e, "HP EDNA 360", ALC287_FIXUP_CS35L41_I2C_4),
--
2.54.0
