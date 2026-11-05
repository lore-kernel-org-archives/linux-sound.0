Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793883875;
	b=g/KmV+3bN3iBUYDHJkUaK0KYNGxY4VJ5vUr7EaPudb1dKbLco+VnzI5R+cnJD3Q3EFBc
	 sDSvLoV/1JpCnaFmTsZE9dE7yqDwI47WYyNE2XEccYDO6c6t2bVol/7BFelqFSN2BRHZ9
	 YOKrTMjebzcBkBJViWkfexiZudXZpbX4TSNSeeNsfs+olIoxPwcZCuU4tVF1qbLiS5aAo
	 uspbmFx680ad9z0iMkXj+KnX3WJWk8b+/XyONHW/lntse/rqBHV5GaF9WTRk8+cgyd8O+
	 r8SNg3wv47A/rHlvc85e9sL4SPa58Z0Pw8KOLFnjreV89gVptXSz5gvjEWdMRfZwSlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793883875;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=C5uJloTcQYPi9T0asaKzKiE7s1zjiE7yBLbSpX65ozo=;
	b=nojn/pJyJcIgFxnI6uBvBideGaL1iPYx9kSBkHpxq1M+GmSEVY2aYK7TnH7zK5B4iVIc
	 Wu8hiry6zIgD2ubz7xgIA2MnzsZmnIV3oyuNGounXipf0Nb+8M+sJltX8nU2XK//dpHq8
	 3JO71/waJJEWPxOemN3ceNY2uT1V3d2zupcjNEKKjiSNqptpgpRrXRAMGpktDE66Iu+zP
	 K+hvzIWHdG1SFh6S4+ysXSjx/S96Vq34GEawNtlqAg3ds9L9TyVI3QQEunYRCN99kqc6+
	 lTvRvmIeT9A3g4ujtIDANGJPNQxwdpVAEwmyjJLZwJEc8A7cxQDah0eaBmhs3RTGTiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="b/b1x5kW";
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C66C606A32F
	for <linux-sound@vger.kernel.org>; Thu,  5 Nov 2026 13:04:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C66C606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b/b1x5kW
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8a070755c8cso1017620b3a.0
        for <linux-sound@vger.kernel.org>; Thu, 05 Nov 2026 05:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793883874; x=1794488674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C5uJloTcQYPi9T0asaKzKiE7s1zjiE7yBLbSpX65ozo=;
        b=b/b1x5kWVN3NDzvl/0GcyQAaOV/TVos3n1N6oVmtPhMaX/DGQ135b4OI9OPNAOa+kB
         UssFDiBUDrlJX0hd5i9Aht8dCrP4AmTbfFCLeyt1vMbAHpJ3OQapHZWlZNvwlJTJ0PM+
         ABuZciAY7kfkXXOJQxlHhZl9v4Ht3RlAinWkCaLgEbdaM+xmNNcwk+82ESxTZPiKNXAl
         w07zhDI7EPmcEwFAccWFf1G5HS2lyVGzCiS/mSY0akepsFZO9QHw+N17WhpG13FevaEm
         cDENHLXyLuHJXpcnL0qWqyiSQ62tk7HW44XZbeor0c8wqeF/fZRzAeWfXJ3l6nzNJVje
         QJUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793883874; x=1794488674;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C5uJloTcQYPi9T0asaKzKiE7s1zjiE7yBLbSpX65ozo=;
        b=rTg5aca7uFxdDlAGlZJN0SokixwVTYZThphmlwHF1CNaYZTZ9DrG4oV4hvGK4fk9jQ
         nmcW8zOEy8HgDEg5BJzLYL1OQr/z8UPRy+uB5fAW04pgQmXiOwurDUkmuEUHpul1J8+0
         Sv+8QcraTu7qP3f8LcOqTcCCLhwZzhImkIGBTPQq9Iy3AvF5YnGWidZ65WQ1qc5DO9b3
         Q2nUMeFHtJ8rNpDL5lkA0W8aGAAP8f7o73XR1ZOlzdG1uYM7otBmjWmlTRf4XMtv1AUX
         T8bcT6cRNdAlEn96i8GPI2L5NJZRtcALkTcybjqHn8/1s0wBtYa1luPO2upMwYxMS0s5
         7dsA==
X-Forwarded-Encrypted: i=1; AKwUvByIuIejxDBrzUjnFVy9NdDJhppGArCY0zMdGj81ND0foStQucCqKyCKPtmkTpFFOYx7F6sdIZ15lHpZjQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8FEx/NruGPAh2ReyL9kFQ4N8u1NSykMa+zqywA1nAD2aVApw1d
	ob6Z+amrK3sFsVv1/ipzLlcGf5QAqaqGuU+OqO5OFzC20sI64OCCYm85
X-Gm-Gg: AYBFou0r3pUaoZcBYARSQjxlKoUlTAR6j5Y55aABi+CkvPDKvWLpEaHBwD22AaZUsFc
	tZSWudrAXAQigilp3ZT8YLGCwqH4aPav5ogJaaev75cGUOY0ao5h3PYu7Fd0HJd3EYiRKfyDtoP
	HyVWU5mcIMvfI3m0lQeL2d8mT0imwcqzqPdd6Nlur0c75oRX7EwYntNz5dHFr+Y3Hr3cxir990e
	Cdg5CoZ4Uv10UiZl9IEvhTpItzFYCPjv42Oa87T4g72dK/yjZzNGvbwjiXVO3BW8UEkDFO0zs86
	afiZrOrFR+Kn/c4Yhu8/2rDIZqKWT/HYtcsmFG1+Tej11akRDIHR62PDpI6fZyJIKZIML0YWBpx
	loMInOkq+s4BOx/bXj9fe/JMBcRmfYt3H+98Zof3yCi6afjnk3vGFEt1qKXDv/g4JxX0HWaWPJ9
	8PHWVSovU02AUnj0JSCyVogvgKGGjtbKQ20UKUhUgulnjl7iFkpLvDA5OhGaspbcfpub9T2ogB3
	td95s2buunH+7G7CYfQnTEPT8VIHPPxtwJFYHg6TlF1C8Ekp2vFdGyh/mdaGCE1k3/LN7OycjTZ
	/gUsYiFqwjhZqXwjKMZvUH2vIZ0=
X-Received: by 2002:a05:6a20:b603:b0:3e2:1218:3ea8 with SMTP id adf61e73a8af0-3e928c8b835mr16920915637.14.1793883874384;
        Thu, 05 Nov 2026 05:04:34 -0800 (PST)
Received: from isthelight ([2a09:bac5:d46c:15f::23:490])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09a7cc082sm1950840b3a.12.2026.11.05.05.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:04:33 -0800 (PST)
From: Nguyen Thanh Nhat <nguyenthanhnhat397@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: Kailang Yang <kailang@realtek.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nguyen Thanh Nhat <nguyenthanhnhat397@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add quirk for Acer Predator PHN16-71
Date: Thu,  5 Nov 2026 20:03:30 +0700
Message-ID: <20261105130330.6797-1-nguyenthanhnhat397@gmail.com>
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

The Acer Predator PHN16-71 (subsystem ID 1025:170f) with a Realtek
ALC245 codec does not detect external headset microphone on the 3.5mm
combo jack because 0x19 pin is marked as unconnected (0x411111f0). Add a
quirk using ALC2XX_FIXUP_HEADSET_MIC.

Signed-off-by: Nguyen Thanh Nhat <nguyenthanhnhat397@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 873eb3d5ddbe..a756e0076021 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7550,6 +7550,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1025, 0x166c, "Acer Predator PH16-71", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x1679, "Acer Nitro 16 AN16-41", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x169a, "Acer Swift SFG16", ALC256_FIXUP_ACER_SFG16_MICMUTE_LED),
+	SND_PCI_QUIRK(0x1025, 0x170f, "Acer Predator PHN16-71", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x171e, "Acer Nitro ANV15-51", ALC245_FIXUP_ACER_MICMUTE_LED),
 	SND_PCI_QUIRK(0x1025, 0x172c, "Acer Nitro ANV16-41", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x1731, "Acer Predator PHN16-72", ALC2XX_FIXUP_HEADSET_MIC),
-- 
2.56.0

