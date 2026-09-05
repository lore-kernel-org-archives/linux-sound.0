Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413A73BB13C
	for <linux-sound@vger.kernel.org>; Sat,  5 Sep 2026 22:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788647233; cv=none; b=Ke69HUHnxcRxhSIlAvkbTwVhhOPq/uCyoBA2Ok+ZlZfS8k6he2+a/2uy6EIaT2NLjGLBu9XVJikUq65xTfjZMwEFsIHEVJPrfFVu1Q/T5KgmtXdfpXSFqbiNEulzxR1SLDRT6MS3aIjUsbZ12Pf0d0Zq+npJBWVv6v4SRo39mRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788647233; c=relaxed/simple;
	bh=0vyDvbj1aE6ce+OT40UuheNXEfROtOJ2IbEziGagt1Y=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PyQsCRFQxJb35RUAL5/Wap8LywoAkvWV4WvTsYSOX50VbuLZYQUCLi5TLCDe3u5CU9v40SZzx3HfcqZpFccSGrJieHqNFjx6JB8RNs3LRZ/rV8mVWwL0Y2QUnhpmcRZQb3lb3G3JAhrB/b0cAoAXQzknVMm0VNZNU2hjgNA9YEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kBaYqwfX; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kBaYqwfX"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d9b60c652aso28001575ad.1
        for <linux-sound@vger.kernel.org>; Sat, 05 Sep 2026 15:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788647231; x=1789252031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LKYQ9YXPXC7AQL+wDeglTr7PWmC0dNVqh+gm0Bvig0g=;
        b=kBaYqwfXNYPRbPICWLJxsymewxLUvgJnfV+88sMMUrXvQvWplT7rUEVI48WL/c2a/y
         N5Pk53JnfONHB3Kz6p7/7rm7CxDe4gi7ubQElSwkW4SEqCHi9X4PtozGVy8Scfy5JNuz
         yOUy+ezQHZapQKWiKAwJwy+Qagj154SpJruuvwmQpxSNxgGo8lSg8rHvT1kCYL/94g+v
         fXQvPtxIr4UKoFcOc+lWV0Hi/qdJTJsNLT/Hx6jPu1Bj9TTy0Pil9x2baWtV0wmM9Hoh
         Pq9vrJeQ1XsG73kh5ZkuMsHjDSVwyGx4FZ/8OKPjZDClj+Tlo8oh8OXXKRfvYZXYLJOK
         OBpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788647231; x=1789252031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LKYQ9YXPXC7AQL+wDeglTr7PWmC0dNVqh+gm0Bvig0g=;
        b=S6ni2Wd9AwH5gPCiGFTitKLqEyz+2tUtpmEwSgrJ2PqxoUHKs/KMN8kcyvkaDx5PX/
         OAP9I8CdyEPopoH10djDoCw4Nw52gn6EqEygQ+Hj57YZnDDOjxIjjopN9jS5BC8rtZS5
         Dcz8htcD7SUqvZ4b0egcqwANZaTCV81z6QiRuBN2I0nAkCoxQP06c6brCdY1BXcpLn6o
         6fWqOjuDvbfnCkn+dc0trUbTTGckSaENI+DAk5Jt0csNO5f8wXnfBM3NiXkuOVqqqqeZ
         5lxLiZ7278JHh6l1GKJNaRjeuWJGSCsHzpGkHuSovJ79uk6e2uz6zKdTkX45fDS5wBI+
         L5hw==
X-Forwarded-Encrypted: i=1; AKwUvBx2jVJBZR4ZA9A9PsUD90+EIs4jNs3oPzcHU3lR5yRTVRijBUeEwrjZOS0VUat9gJk7mbWxJHwGxTEwDQ==@vger.kernel.org
X-Gm-Message-State: AFuF++m2XtkFumueOpjrt9CR22a3od1nfkqN7jzJX0TLyjrgUM3oLnZC
	D4G9p7llAzsgXdZsPfJqQHT7TuDBm+0xkkKJc2dRP04GNAKOVgSWpbKl
X-Gm-Gg: AYBFou1AoIqM5bssRpwCZyRT1WbNunrYlSZ0Brsu6nuykAA3G16x5jZEFq+9nx4B77p
	H8plQ50NrnrUHD0J4rYLEpzkv0CoNE4Kft04L56qxBiXI1RFYF5eUpceW7+hdZiJmxZTGrqrl0X
	2ttDmP8V4PoOwFzmncmbiHmFL9I2E+n4Sn9yDw3NrfoBVCl+Ntez+bJliWBGu5jFt4lIfWEpfN7
	CSus6bjLdOQqNQ/U9+KM8GcYfAAlVwI2dSCuycRtYVmVUeo6rrVbYGO9jLtixfdQ6GQwMZAVu6O
	/YnF5BQn2M1OTAmBLib2t5BcaSQQueas+mistoi6TP4RQ3ynWZpP4F0WV3ut85AEM/NT2B/wVKf
	UfKKFLm0SLps9qkElNaewXd9LmykKFN8m9sGD8MHrnPbUwYDntiU1P7DFpj8x/krI+PR7Aq3iBl
	RVdtyWvXeBjksqA0SpI1jU9M7POAjupcfOhxZ01y7WJL8Mpig3WnoAZWWWT32SyH/yY9EUaF1+9
	lvP/QpLJJkOQ/hBF3YSINN7bGUOX6rGSaJBg6dUInDn0+BcHenlNCZ5je6XT3iuA/OQkdId+XFs
	QkR4sl7eTr/yRdoOsAB3Fg==
X-Received: by 2002:a17:903:1983:b0:2cf:8131:75f4 with SMTP id d9443c01a7336-2db127c3903mr253514825ad.11.1788647231100;
        Sat, 05 Sep 2026 15:27:11 -0700 (PDT)
Received: from arch.taild3b82f.ts.net ([2401:4900:ad20:813b:5d6e:82de:195:ca4e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339befe870sm18200019eec.30.2026.09.05.15.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 15:27:10 -0700 (PDT)
From: Krish Gulati <krishgulati7@gmail.com>
To: krishgulati7@gmail.com,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ALSA: hda/realtek: Add quirk for HP Omen 16-wd0xxx mute LED
Date: Sun,  6 Sep 2026 03:56:56 +0530
Message-ID: <20260905222659.10247-1-krishgulati7@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260905084951.9595-1-krishgulati7@gmail.com>
References: <20260905084951.9595-1-krishgulati7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SND_PCI_QUIRK entry for HP Omen 16-wd0xxx (PCI SSID 103c:8ba9)
using ALC245_FIXUP_HP_MUTE_LED_V1_COEFBIT, which controls the mute
LED via a COEF bit write on the ALC245 codec. Without this quirk,
the mute LED does not reflect mute state on this model.

Tested on the affected hardware; mute LED now toggles correctly.

Signed-off-by: Krish Gulati <krishgulati7@gmail.com>

v2:
 - Fixed table ordering: entry moved to sort by PCI device ID
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 95b40a177d2b..f7786e1b0878 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7566,6 +7566,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8b92, "HP", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8b96, "HP", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x8b97, "HP", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
+	SND_PCI_QUIRK(0x103c, 0x8ba9, "HP Omen 16-wd0xxx", ALC245_FIXUP_HP_MUTE_LED_V1_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8bb3, "HP Slim OMEN", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8bb4, "HP Slim OMEN", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8bb6, "HP Laptop 15-fd0039nt", ALC236_FIXUP_HP_15_FD0XXX),
-- 
2.55.0

