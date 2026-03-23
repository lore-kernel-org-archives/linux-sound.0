Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D3D3BFE2B
	for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 16:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774283876; cv=none; b=Xtq2vIdTUsoEO9KX4flOTV0TWmAex8pMEMlOkzhOQYfWc05IZ8WfqrIK5GBdN7u8zIW7CPFtfBo5U6GrbUatP3RbD4dLZ6QS6viAsu8BtAogPEy/6j3xthcaZKQgePNCezMT/lx/wgX3K6iC+b51YDxR30blxqi8cZynfHMZiG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774283876; c=relaxed/simple;
	bh=ZVWDT1F9BMlXE98GAzs6tMIsV9z+9ZvlU6sWkzOIMZ0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To; b=sc0xvCSPthvJRSL7yA+0IllrWtcX8ZUmIew+Qz7Fek764UGS9IuJ6fzgBxmgDfZsz096yfEpg/ByJ+KZA88HW6m7tqyMMz8QX0QKLmoqIlAKQEdLlKTCJOHVtKf84T5PlHXTBWneKcY3KiMyS75cKh0RyG89dX90fzW7sxbo6AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h2IwKvFS; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h2IwKvFS"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2aae4816912so19783775ad.2
        for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 09:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774283874; x=1774888674; darn=vger.kernel.org;
        h=to:from:subject:message-id:date:content-transfer-encoding
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yNR12h/B+/JM5QDBZs7J16BFnpVL+pCLRvhJ27tNVCo=;
        b=h2IwKvFS6Wpfk+JrultU2D6f4rNtdPnpi0uOs0cUGOLPhpzG6Z8OAUG3mE7/zCp/2e
         h9NGgmDJJTIO7qVjrWU0cm2j4SCQKqYQgFys5kOMGoC0HknJ5hmgPL9wMqVhDNNk8rFs
         KQlhSe2vyqMB9FN0RWeRbYanjlE7jPgRCKpiqW2jPQE6mKHbarzsRyrNyJCDgGb6uxl7
         SCn1vBjdv9OaUdmF/VUH0m6JZ5dknArgdiUKg1/kO2hPs9WOUbKcSODqGeZUM46MA/3W
         4DevRSXFSc/IgxI8APv97pB/cHTPHqGW5uQLd/ppRzjX89IFBhD3N8OWINp0whicewiM
         dY3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774283874; x=1774888674;
        h=to:from:subject:message-id:date:content-transfer-encoding
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yNR12h/B+/JM5QDBZs7J16BFnpVL+pCLRvhJ27tNVCo=;
        b=AN7y1hbmNLV/OfoS5MVhJCSYrdfhkQabLQl6VXlUIcWdp8LyzpWDchSWSNkCO41ZTu
         kvhfOK2Krd0dlKPDhX5TF7gui5WlLp+E6Y4WDRC+Jwf4bMNQ7hEpmZw+JgtsW7X/ZYji
         yVU8S8PHLp6DhAH9OADMBbdx99lQTec3/f6883zkDO9uI+h8M+mkGTErx6hFylpoFBMD
         mlBDd0jXGlDt6CBQU0AOLFFiYO82Pzro5fzWD5QSNozgaN39QjKNFT5V+Sf3Xo9ojWCR
         58OqEC3v3N0sUzVjxUIjVH5B8Ux6jZkeLzLHVOMo23iAqHeeVv9xHmnO8xYVpsnCU326
         JDqA==
X-Forwarded-Encrypted: i=1; AJvYcCV2YJAObcklm6MvnDioyHR1LikC6DpblSG0PGrIfY1/tHhAtwq89ZG0Hsgpq0r7993O9sDqVHX8/+OWKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPVV5dIuynecrKLty2pbHramjf2IfIHq/wRQy20A2BQFt8csek
	EK2AQ5FcouGrkvDjuy1pbQx0ByDmVK+BouxpDdMwP9FccjPAS/vwU7aZ
X-Gm-Gg: ATEYQzw7lK/qafl9QZ3iSfuko9QofjFmbP7aD7+mK95GIh1tfosXlAMAy0WF1ixT+YW
	PkgumwfSpQfqz+Q21JGxVlsYUhLjPXBetX3wyATRXhCmOx/ab3huEDor4H1nP/rTFZw4tOtDOLo
	gfY27hLKxRXiLcbSl1M8DljNss4Zpoog47TnK7zo7WYsonUPJJG1usdnycsA9D7FGA6KVemrTDh
	uce4ZpY1JulXHYggZun5CtRPaW6boTMLcPAZGCVP0YXUHsGgTXc4nx/EgGr2aLti0wZ+dTJshds
	I/f2YGco9txl/JpHPzxPKyxzA4aXQssI1BJvh/TtsfG8JM2xHoebW2RWedMICJmQcs6tpbF4mil
	SKbrIvT8LumX5J9sjz3PgRWslKNwYGxrO0RkV3obqoxgzV0ykXN4nyP3ZDgWY9UjTYoQoPdYX2m
	EOkrL2O+7G/H2UJXxTPe4sZZM8PRIKkCfTAiO3UuODElDE/ht9x1ffbuasvw==
X-Received: by 2002:a17:903:2c0c:b0:2ae:ce35:2686 with SMTP id d9443c01a7336-2b0826c7487mr124436575ad.5.1774283873891;
        Mon, 23 Mar 2026 09:37:53 -0700 (PDT)
Received: from localhost ([2402:e280:3e1d:59f:5a02:5ff:fecf:aa0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0835604cdsm112510575ad.37.2026.03.23.09.37.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 09:37:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Mar 2026 22:07:50 +0530
Message-Id: <DHAB51ISUM96.2K9SZIABIDEQ0@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: add HP Laptop 15-fd0xxx mute LED quirk
From: "Kshamendra Kumar Mishra" <kshamendrakumarmishra@gmail.com>
To: "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2

HP Laptop 15-fd0xxx with ALC236 codec does not handle the toggling of
the mute LED.
This patch adds a quirk entry for subsystem ID 0x8dd7 using
ALC236_FIXUP_HP_MUTE_LED_COEFBIT2 fixup, enabling correct mute LED
behavior.

Signed-off-by: Kshamendra Kumar Mishra <kshamendrakumarmishra@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/a=
lc269.c
index ab4b22fcb..90dc9fe0a 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7098,6 +7098,7 @@ static const struct hda_quirk alc269_fixup_tbl[] =3D =
{
 	SND_PCI_QUIRK(0x103c, 0x8da7, "HP 14 Enstrom OmniBook X", ALC287_FIXUP_CS=
35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8da8, "HP 16 Piston OmniBook X", ALC287_FIXUP_CS3=
5L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8dd4, "HP EliteStudio 8 AIO", ALC274_FIXUP_HP_AIO=
_BIND_DACS),
+	SND_PCI_QUIRK(0x103c, 0x8dd7, "HP Laptop 15-fd0xxx", ALC236_FIXUP_HP_MUTE=
_LED_COEFBIT2),
 	SND_PCI_QUIRK(0x103c, 0x8de8, "HP Gemtree", ALC245_FIXUP_TAS2781_SPI_2),
 	SND_PCI_QUIRK(0x103c, 0x8de9, "HP Gemtree", ALC245_FIXUP_TAS2781_SPI_2),
 	SND_PCI_QUIRK(0x103c, 0x8dec, "HP EliteBook 640 G12", ALC236_FIXUP_HP_GPI=
O_LED),
--
2.53.0

