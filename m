Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15A4345ED1
	for <linux-sound@vger.kernel.org>; Mon, 10 Aug 2026 15:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786374906; cv=none; b=ouGnE+qfh8KmvNWPqM98jp1/1MpDRHmNonVjV26G+x+mpa09auSCM0B0j3PdpDx7GMpeEfNq4QsrTVkn8XAJnxEG+Us2psKkIeJeSpqn2iXP8Nn54LItl2ixFGeUFJn4Gvw91/zF6oWsMstxJxWdg8J6hOGTFUenOZ9vPPWyFFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786374906; c=relaxed/simple;
	bh=dYwpDRDFH4n8uZjOFwtMCROsjSYUm1YwtTQJtnYVbBY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D0vCmI4esGJPCJ2jesc46Kh6lhSMxePngy0fwPtGjRsIxsPw/fVT3InVmAyzGTT9wrS9EMvAFAyO76zKe3TYC201fFXKnBNP/L/8ka3ChrmjizsKLUip5oh6qqMeuTQRW332/vfm+u5g/bFX1cVjtFLUWdua+oVCYjQYzF3ZUXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lDdcWzhz; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lDdcWzhz"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c15ca7a7ca9so190975666b.0
        for <linux-sound@vger.kernel.org>; Mon, 10 Aug 2026 08:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786374903; x=1786979703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fPBANNW5+RwZZdfYhz17gZuHdbRy4Yr63PkNIMIILa4=;
        b=lDdcWzhzIuF3hW22hr3pVTUjuq2TvyzU88H92Ydf/PMmChqXHg0QzRlPxJfgo0ipSh
         qQCn3KRb4lMSDveQ4Ls8aFR9TTzeazPs+aCPAnM7JY18mWF7l6kyxFSjEKf9I9uzpOb4
         8HeNbUp1sAFm4/d1syQYAwJPtue9J787IaX/Jq+gCy8hFLszxR07Z1Nxto5lkGkoL4t2
         Ymqj5tFD6ReSm4wruux7U1DsmpqIYC+5MXvVrt7m/GK9TglBUOThJNXIQr3nic7NWN0o
         XRpiD3e3VfsGnrH0KgHwiU+umihpU07VlCa6Gq12HlyuS/QJAHzJQ9IPafMnuZqLDE9G
         ZLEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786374903; x=1786979703;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fPBANNW5+RwZZdfYhz17gZuHdbRy4Yr63PkNIMIILa4=;
        b=apv46P3f9o1ruNz23xfuTlKlcrJFyyzBUI5rJzRtT6jk9f0wm76Gvtqr9oETuPO3op
         tI1lvEWQ6ZaGBp+0H4MUW7DzpXIxRCZO1HYYBBBRFyBzACWKxKs7IlRHxnUAnrNL3ld2
         VDJk34KhXRgsYbbQl/SfRI9oWnLaLap0maSAcpVCnQobh4gWU8NqUaFrza4IrpDWbxCB
         CZPViJ/3QKtCSyXrPzNfdiOK+MKEUIfgaxPq0Uao+8ZmsK+9KfGYNZNtLo1969e1VPEc
         9OUp1wwuKbuAGxIdCwoCNmJ8YwvfFgTBRoQnSKfTVuHsSf+o1ElkoctqYc06hOi+PmI1
         4PuQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro90wxaDkfrcx27Z8SUd/GXV8ZB3ZxjuwVC13nj1T4ebluAyQuSs8HDKQVfJMrQdG4fKgOQTnmX+ZQwRw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfTzbjsuHeSPmB/HxufwyCiTGyvnvipHoyAAqd7w4zEdXCEr/i
	+eoREViXUT9ysYxbWKoZWMfRf839Mn5S7teSa8iNv4GpAeWPDg3rNlxu
X-Gm-Gg: AR+sD11szFOV8QRwJeKAFhNQVNI/Fo3/Mb1z3KfR93c3rZcIHQQXMgLBzX/96cgP3CT
	Gpn6KPjjJ17/mqa2isgtc6Ahx5WBj3XUMPMTcPHa9JazfNrHWbEuyNY65RYonmXZNkdUwIJYhU8
	G8/IvdME5vaMMc8Agf7Px4N7fXvW4ze6VG8yLocTAY8cXGkaHaqr4MVVsy9cxhOZwzcI61EBE5R
	8J+xcsTIVRZ5cZTsS7fjGQTjTgxlr35gxheIaWwT4JSYNHT98S3Srw3o68RfhltaE+Efqnp60oN
	TieoDQhxP4XUhARIbFaiHvgifZJXtu7x4kmj4A4x3rjpNCkmRwtSRP6FnUr8zjr2iz+/zveYPjE
	2ar2UCYfvs8KMV7lKBLB3do8eAN+YeP73nf95/oRqgRa0wz57bB9XzSfq5a1AK9hOpoq5Ju7Aa6
	atk2fHSBs6wsGQM5oWxi3qUrWfGzu3rYIokMidMHnyWhwvqjgXxZlHlDpKPWYnYulb5pgW4qLlM
	vfG5w8HQz8e0dJJzgAy7OOTvULUcHHMslg=
X-Received: by 2002:a17:907:7b86:b0:c20:1c9d:8d4b with SMTP id a640c23a62f3a-c20871a8ccfmr1162646566b.2.1786374902694;
        Mon, 10 Aug 2026 08:15:02 -0700 (PDT)
Received: from localhost (polaris.rmrf.org. [70.34.242.93])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2080cf75c2sm398078466b.59.2026.08.10.08.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 08:15:02 -0700 (PDT)
From: Denis Batishchev <ii343hbka@gmail.com>
To: tiwai@suse.com
Cc: perex@perex.cz,
	ii343hbka@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v3] ALSA: hda/realtek: Enable micmute LED on HP EliteBook 6 G1a p/n: AD3Q9ET#UUG
Date: Mon, 10 Aug 2026 17:14:41 +0200
Message-ID: <20260810151440.2306217-2-ii343hbka@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP EliteBook 6 G1a (SSID 103c:8e0d) uses a Realtek ALC236 codec.
Without a quirk no fixup is selected and the mic-mute LED stays off.
It needs the same ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF quirk as the
already-supported 14" variant (SSID 103c:8dfb), so add it.

Signed-off-by: Denis Batishchev <ii343hbka@gmail.com>
Cc: <stable@vger.kernel.org>
---
v2: fix indentation (per Takashi Iwai <tiwai@suse.de>)
v3: fix indentation, 2nd trial (per Takashi Iwai <tiwai@suse.de>)
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 6b36c730c..bcbdafb42 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7544,6 +7544,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8dfb, "HP EliteBook 6 G1a 14", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x8dfc, "HP EliteBook 645 G12", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8dfd, "HP EliteBook 6 G1a 16", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
+	SND_PCI_QUIRK(0x103c, 0x8e0d, "HP EliteBook 6 G1a 14 (AD3Q9ET#UUG)", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x8dfe, "HP EliteBook 665 G12", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8e11, "HP Trekker", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8e12, "HP Trekker", ALC287_FIXUP_CS35L41_I2C_2),
-- 
2.53.0

