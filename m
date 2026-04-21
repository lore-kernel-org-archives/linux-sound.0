Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352491D5CE0
	for <linux-sound@vger.kernel.org>; Tue, 21 Apr 2026 02:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776738901; cv=none; b=PnbnHQIveCRDi+bt5effmKsNQMmBlxbf/GlMjcSgRrBCNO9LX2BWVO1UqM4Kng2GKFI7c4MNvc4afHtvTfHG0N9a1aaM/lQQKlD/1yeLnjnI6jqYhUIZ84NHGcJeAhd2LjCAfcUPkx79HmwnfJgkkHOsFJJQOGg3NRlffdE0WCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776738901; c=relaxed/simple;
	bh=tnRrfr2UU+dtOGB9OoU98gVRlY63Cu6PMysJODcUEeE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qy0hHpChtOTSZ2aEpZjsVggyORqLhiqoGlEg419LHCW0jlCXiqIYdOZdOeo0gJKJbqli9KsiquC6BvPOdCO9cOxzA0zo3vjdEnsq6o6w9IdIkGSx4mk8WXsMwGpQ22cGemeFpFEu1P5G8l4jfTJZav2l8nfkUcs2CAf3fXPLrZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=hOku2Tg/; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="hOku2Tg/"
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 6A76B3F79C
	for <linux-sound@vger.kernel.org>; Tue, 21 Apr 2026 02:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1776738896;
	bh=iv5UBJzVWBz+Uu5AzBvOCg4c2niBLMfTEitVbyQ8bqI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=hOku2Tg/5GY9ECiXSw+lVp+mzx0lGrPf0jB/2SXHMishysbkqXLc/7bNrcr3as7Bz
	 +jdLIaZBWEU3siqw0iB5sdqqeWrExiuBvc+su0+9ngr12fmn6CAsT/+5p8CayvYOA7
	 yGojjoKosjDpdgup0rfLp9MD4vtnMYDO8YsMyxckzSsSjsvXch0ksVjv9vDoYOLybC
	 sDeapTNXdmoOMHtJXHVcvCw+pX3R8yel34DNeKl4Oh7yYvq8ivjv4BrW255f4rFDfi
	 tFWqLLH1v9ZwYlxLi4Ld6abZPrlKMKiW7T7BUz5Qg3tSj9PAC8pQ2j+PuNlSTnieGW
	 xV4z0c88RpekjoITsganI2vVkVdNyW1FPj+3PoHdoqPWM3B2eenRIvh3kO8j9boJpn
	 3uSGYwvgBtS9P2bBvV4GSnIwnmUE3T5sItLIXtrgVYxnJt9PjrLFK1MUjKKKzlfeYj
	 8SBCykelE/Sn2YAqIFOoOAzVfNgaOyFy6Lt7nDJ/nP1lLAVRZSQl1ZkBJBbm9ACCRc
	 astp5vzlcHVDJCaRS0620kS4o3BbA5JEnicXytCvTqZQG+w7rC6BdH6nUh+j44akZB
	 ig/+0ctrSa7fE3LSfrk34wiT3IV/OM/RBzkPHVIb1kTiQPlAiMvs2nDUV4UlZITTLU
	 21VwWkUBldTI3IwC2h+9btfs=
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8eb52a22e85so355836885a.2
        for <linux-sound@vger.kernel.org>; Mon, 20 Apr 2026 19:34:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776738895; x=1777343695;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iv5UBJzVWBz+Uu5AzBvOCg4c2niBLMfTEitVbyQ8bqI=;
        b=co2SaoUGx+uwKpQ0lpGsRg7n6v/OXCNssyDa7LpiG/rnp1Zi+EYt8CDDHtJZQcyqH2
         r1v5Ics1Vb3H8W6+LIuJJ0uJESVyyD/i6rBTj7ePZarsbH76rEz4wcj6sUBpBGXCB2BA
         3vQAynW6/QduaTssNewT81aamqJWoFsfwaWdo2E8mlOA//lIy97f9wWawp89Cvr2LeHu
         IxOXbuBWQzn3aBgCwRhYCIgQdbCeyW+1wUeft3VVC1zkicZYEFzKKYQ5anLOOW+gCQG6
         gHLM+Bsq5R7U4MmLNZAjKZHdHVw/tzeKaTTUbtbm2XkVCaUx+vWfFyDyFGeuVj5D+W1r
         C0Nw==
X-Gm-Message-State: AOJu0Yz/RH+oWcQSJdIwSoadnwJGmEOlScSMwcsQqmOQHqAGGHy3CkWA
	brXWFSiD9fp/4wTIygyeyC61sJ0JY89xRO8jKGOPdgpQqURpNvGxMOBqAvQPFOfN9n6vWA4Z38T
	N/iejJ8jXA1wX6ooDAfuwYh9kyt1mLfqEnSBj/nETH2bnSYw0iwopVkTFS0XY4so3i9DckfLIiZ
	WehqAv
X-Gm-Gg: AeBDietXOlS6OZ/21B6aVg3gALgDG5bRymkvMrX6Oo7jBE/8ZoIlRsenrlkE0lNY0ik
	+s/IyAOxcNUgpvZbVj+9dUr8sJs2d6I9mroUYE3FwOou+W+u3wQr8ejXcxd9IS92d+QsDt8C8Nl
	Um+V44Q/k4SzOv5BNXOak2bD1ZWcLBpP804AcX8kpnMaRFuLN9Z3mI7Za/4tj0bEruiao7QoX2w
	uGkvE0CoyCY5J73OJZQiwpIRu4O9yy0/ZlPWZOM5LU1xosRlzikzsM9rzSRxMHoO5x9sV/E+Tpo
	YBr2TU/WMQykYiyib0c0gZQsFgSKA6LA4h5y29GF1caHGcotNGWcPgb8Hlklg1EyFTKaCL8mEFh
	oGe/rZTBERan/eXZU+wwGUr52ysnt1PCgy7V6wZXLpK3t+Vjd2Jwf3y5gLilHHBymuI5RNigpZW
	MrlMU7F9668B8t
X-Received: by 2002:a05:620a:c54:b0:8d7:f950:ea4a with SMTP id af79cd13be357-8e78f253d7emr2550151385a.12.1776738895072;
        Mon, 20 Apr 2026 19:34:55 -0700 (PDT)
X-Received: by 2002:a05:620a:c54:b0:8d7:f950:ea4a with SMTP id af79cd13be357-8e78f253d7emr2550149485a.12.1776738894691;
        Mon, 20 Apr 2026 19:34:54 -0700 (PDT)
Received: from localhost.localdomain (211-75-139-218.hinet-ip.hinet.net. [211.75.139.218])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8e7d64cc559sm964746685a.13.2026.04.20.19.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 19:34:54 -0700 (PDT)
From: Chris Chiu <chris.chiu@canonical.com>
To: tiwai@suse.com,
	kailang@realtek.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Chiu <chris.chiu@canonical.com>
Subject: [PATCH] ALSA: hda/realtek: Add LED fixup for HP EliteBook 6 G2a Laptops
Date: Tue, 21 Apr 2026 02:34:28 +0000
Message-ID: <20260421023429.3723154-1-chris.chiu@canonical.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP EliteBook 6 G2a laptops requires specific LED control method
ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF to work.

Signed-off-by: Chris Chiu <chris.chiu@canonical.com>
---
 sound/hda/codecs/realtek/alc269.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 4b6266536ee2..8087eaaf1408 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7226,6 +7226,8 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8f0e, "HP ZBook X G2i 16W", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8f2d, "HP Auster 14", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8f2e, "HP Auster 14", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x103c, 0x8f3c, "HP EliteBook 6 G2a", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
+	SND_PCI_QUIRK(0x103c, 0x8f3d, "HP EliteBook 6 G2a", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x8f40, "HP ZBook 8 G2a 14", ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8f41, "HP ZBook 8 G2a 16", ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8f42, "HP ZBook 8 G2a 14W", ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED),
-- 
2.43.0

