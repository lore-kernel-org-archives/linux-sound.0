Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794363227;
	b=IMTSfhAjlUs/us7Tdmjq9k2+zMpjY8cCn2LjYDkggknK3DpCV6Bwsg5Ym36vkd3QyLE8
	 ENI8RouqqnEmdLmVog9VYUtF+7R2tnNf4zKenPTMLv1b7N60LD801HKm6AX48I6ojzQm2
	 X1l2gakzGvEi85eKA6xZn2oE7BtDfnkz2OVxxkMfkRyvrsU9OVUybJhNjlxXoyXhsmxNf
	 24NQdCNakrRMw8d2Hm5RANulCJENidGuGTfPpjMZnZM+SJMbQrMHap/VmM/OK1tI4yhkZ
	 pEUNqpPcXJrA7rjv1nK++51eOhKNIwnG/OLuMCKzNrBSD8GjGANND2FBTn599XFZkZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794363227;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=m9zGu7JWDnb8MFoKmM2zKF064vMXeNDalsytkgheG9s=;
	b=ZxLDnFDU7CkX1tA1mjUaAeVOtp8/VoDVQLJyRGA4fa0X0kco9uWkRn6vBs9Ho5DfXnzM
	 M3rHbH5X4+8gItircbWxLpZWG+VW2vkEkHVGm8YvN3yzGZJ+i79rIMlzl3XTwoH5Oa5Mo
	 ti2xdisMH5HL3+VZEymEDOZYg4qI3IDtcXmUR3hGfIcSFpxXf8D8TnJIsaYJFHOQCGcY+
	 p3jrqkOTiNCX/vXKwD9mzkvp/XlBWibCXpnx0YKYeKITNWvmt7vTtGL3w/W9Gc8Uw67vp
	 MUv6aWhyqiLLwjFpQ3LHbDqt1A5BV9UqHVltcleN/xKIGuD8cgW/MFK1AKvYw2+wdQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WyDxZ0uH;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7911E606A320
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 02:13:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7911E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WyDxZ0uH
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1931ff67a29so3653947c88.1
        for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 18:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794363225; x=1794968025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m9zGu7JWDnb8MFoKmM2zKF064vMXeNDalsytkgheG9s=;
        b=WyDxZ0uHg9iFXnk7VHIstHah8vmEOxvhVFf2+4Lh/EtpCt+qce6EHKFRNezI0KctR/
         HIOxS90EQzMXJ4/92o2qtdr8mP9HllyrrlreiBx7PKUtwPVOCrH1qiXmn5ew3y6UR7Ce
         YKEewN8FBr5HSNUOLuZhWYQmHr/Mu8CNKtJOD+6ts9WdWUvTcvBfyjYjQqtgPs1PhZkc
         0d0mtMiKvWYwxXXg/4a/t1swJPlrGAtWSgeQ59NxOMgwsRSxLONZjcqTYYeaVi3MiB/x
         uzgcEbh1BGPDs1MLPFEcBlJt2at3vjTymcGNJUwVr5ox+vaxuBTgEBhJIMQtEKu1MK04
         ARtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794363225; x=1794968025;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m9zGu7JWDnb8MFoKmM2zKF064vMXeNDalsytkgheG9s=;
        b=B+qw4TGyL3aZw5P/S36pAqndKId1oVnHLR+4+uAh/RW9/Qb0H4uMqqC5yoOZlLEd8G
         BsvUQglIaGSIbecL+akRLjlOGsgmkKD4xUPCN2xKfnLI9xNcclGXjZafAezDNdjmmylB
         fIUsSGlojHxWnkBRmXloxCXv7cIxRjD88u0KsOFFv4vL4CzRveKhdqd7ZSX94jeAywm5
         67VRDsidBdlpNzKI2+pkCr5TmflbjYV5ojOqzIIUrmI1sY+IFJvC1K8Ai+Af+qOcqZLs
         jVfnpCtKzKjXhEAGku5GLAxxj5LpuYwP5gfjcWNxLRwF6PJshnK+m8sWWy1ZtnmKd9X3
         TsFg==
X-Gm-Message-State: APuU4Z83qMqD0hLA0mepNvJy2kM5qI8+/nyLDEZK8kk1owqrueEdD3Fi
	/VotpGRC2hhFHWtTYvzXPhc6UkContM2G0tFF3AIjrHuxk3bVR8t3y3+
X-Gm-Gg: AYBFou1t204wOgQIeehSoDkk+fkCLEfGpaUjj0ldusNAHwFpyCgKqhi2XHQFdLRfmt2
	2NY7Ha5UKmSi2GIzkBLadWxZuAgncnu8yEaxcduRkOwHohWmgGN1Ng8MdP1Sb11KKJJeARKt4na
	hibyTtybsNol6fwkQzaNX5rQCyJMDq4Jm79A44qdh0H0CdNuQEeNo5zin+CWC11CaZaMH86Yv59
	lPv7VUHURoNBRJFhuFbOSFhUT43bJpP2W7sFtvliHaU9rXIdfvuXaPjVZwDCqmI2BOHfX4KB23/
	XLT+io/PyysPxdQSZQK2ljKlVHd7mqoEJ947h/leDv9hC9eTbIu75jHj+TNqJ/VPj1HXo+e8TcY
	oBvD3zgCwtrsiRv3YscBNwXvL4jgzoF5bYSuocS0OXK8T9fh3L4kuVzMDAw1qr6PeHjRqr97EWw
	Hk1SI4E03Ut5hzThF2miv7RgjD31L9z5m9Ib06pmEWsmtoIH1j7zqQ8uCwzMkIOfr3knfV7Gydw
	dDCForCjQPML9xSmp7GNO26/Ck3Th4HuWgiHHX7jMPMq5rI0XuYx9V6IizuLutiju1tHLLmedqH
	9kPPsBM7p9F2iq49HsK/HQBv9rUmqO73BSqhkShba9e2si1fL8oi
X-Received: by 2002:a05:7023:a42:b0:190:8f72:445e with SMTP id a92af1059eb24-1b3c02f3a2amr1110207c88.11.1794363225322;
        Tue, 10 Nov 2026 18:13:45 -0800 (PST)
Received: from cacher.tail88f0b9.ts.net ([103.36.14.70])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060899asm10708398eec.11.2026.11.10.18.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 18:13:44 -0800 (PST)
From: Fa-Iz Faadhillah Ibrahim <faiz.faadhillah@gmail.com>
To: tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fa-Iz Faadhillah Ibrahim <faiz.faadhillah@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: add micmute LED quirk for Acer Predator PHN16-72
Date: Wed, 11 Nov 2026 09:13:28 +0700
Message-ID: <20261111021328.16153-1-faiz.faadhillah@gmail.com>
X-Mailer: git-send-email 2.56.0
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

fix micmute LED for Acer Predator PHN16-72.

Signed-off-by: Fa-Iz Faadhillah Ibrahim <faiz.faadhillah@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index a756e0076021..fa78a36bba5f 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7553,6 +7553,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1025, 0x170f, "Acer Predator PHN16-71", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x171e, "Acer Nitro ANV15-51", ALC245_FIXUP_ACER_MICMUTE_LED),
 	SND_PCI_QUIRK(0x1025, 0x172c, "Acer Nitro ANV16-41", ALC2XX_FIXUP_HEADSET_MIC),
+	SND_PCI_QUIRK(0x1025, 0x1731, "Acer Predator PHN16-72", ALC245_FIXUP_ACER_MICMUTE_LED),
 	SND_PCI_QUIRK(0x1025, 0x1731, "Acer Predator PHN16-72", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x173a, "Acer Swift SFG14-73", ALC245_FIXUP_ACER_MICMUTE_LED),
 	SND_PCI_QUIRK(0x1025, 0x173b, "Acer Swift SFG16-72", ALC245_FIXUP_ACER_MICMUTE_LED),
-- 
2.56.0

