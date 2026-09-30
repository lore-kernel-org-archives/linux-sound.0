Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7700511E9C
	for <linux-sound@vger.kernel.org>; Wed, 30 Sep 2026 14:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790780339; cv=none; b=CfgXheTz4W5vWfVyyORiepHczju6bka3/QFy2LFHfccHeNx5GR21JyxHnlFf7FSaVsJ52Q7uBCkN7Sf1l/+9kIhXfm78AsN5RNIiXXYNxtJVGIPxFPbnpI6RN+Nwdsmr6RkXX9G2ZVut4/Tm9BnJWLmKoe9bEPhfacXJBRkOHDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790780339; c=relaxed/simple;
	bh=2qdW7qPc33fgDVeHmWXq/lgAc7O3FAMhsbwbxQk6sSU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dxr2NeXgIyFOV8zEUiwU9W8wUviS6MW6qiSIdBkDhLwPzOur+hrq09pebeXvxmhIbgB1tER5HDn2jEWJkYSm1/np/YwTn6GcdvWY0EnBnwJ6D4WSxZz+NFqeHP/+9z4SnJJNIfVVvFhxhy7IQvhD8FF4rXjpQ+mvwQINjSjBwmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QZ0ZAEeA; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QZ0ZAEeA"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48af4663da5so1549355f8f.3
        for <linux-sound@vger.kernel.org>; Wed, 30 Sep 2026 07:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790780324; x=1791385124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ul4pen9AeiIUu90Z55hg1G+SFMqGb/rwLYXQ+Sr+HfU=;
        b=QZ0ZAEeAVGIoNgbYxkqO4amtVBbjKHraGACOKhRK55OWYGE5LhG87HuJEU1gFSmO7z
         EovFa+ts/lxINGQGzD1sHGjnWVe/NSfCyU3xgip8tQTE+vr2/B4rcimmuvkGQqMgm+n2
         E1RJeludAergDPXW+FcTXP02GTAohI7my7ACFTPO6xGdCULGb7XmQo9Mc4u+YT8dT1fT
         SCjZvzzwixLTKYsrBy/YSJ3tq5FidZZ7P7QrtbUww/c5T2uv7BXl/tSKGdiDtY8ZqSmP
         V+DT971+ux0PlGbZjuDr9kS78tPOaO+kNKf5BLFNc6FdtwM0mALlS+k7Hh7sG2IxPesC
         EGhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790780324; x=1791385124;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ul4pen9AeiIUu90Z55hg1G+SFMqGb/rwLYXQ+Sr+HfU=;
        b=xy0E4iUHQmHRd0ryLIxjN9lng4wUNC9ZeI01C0WMXdiL38JHkaWK17SOMP7yua/q8D
         0ZddnAEbiZJbqKXWH+ebTVVXV6s9ZIHXkFl74vOcUzhPN0edMmMr1iScB/oJgdSKlNUB
         1J6NXP1784g4VbidM5CyxVxwnm9cNWS9zVNIVi1FMhHpBFmdVx9sr1nRt2mckBB/+T2o
         obNmmbgvYg2Ldhz1Ln1BthpjqFNMXmJwWlNYjTUuyucOWbKemnCw7SMeqWVkf9VODjD6
         flD/7qg/6HP2lP3wte1YUQjOvIZUM5YCWKSuuYBMHzkOAcDHj01l9kuFbnLTCoh1shUj
         pMvg==
X-Gm-Message-State: AFq9FYLWakne+ImEXYjNBQR64Og1T6/e9EFf5NKmI4BNTaLRV4QiryCo
	MwAa/gwgd97EAFISTBXVVm2c+Ng6vhqnOsvmrfq0X88GxIvFybf/pdMC
X-Gm-Gg: AYBFou2LwGweu/pcpNoBdZ/mRHYGdxUm8YaBkbWnlzeiWNVvEB3NZNOdwRxWSrV8dzU
	KMax1DYqs9XBkHiot1kbcY0Ta3Nwo3XZwLEa2ASGtTbXzG/rXuuasMFcBKoBIitAjVgWyB1hZs+
	HuJXPKJm+4LtnVep0p5nYHFtMeKUBch+OXvydm+0lYuzwRypTp6Q4YqKvRRNTVENO9PTJ59bGd0
	FXeR8X5orRCe/fXzcMnYVF7UoiZ2eGNKFCHwhwfFcJC6VrqbOhaG7Z+jxvNzmTjZvRqxbeAQFJM
	c9p0MnUl981Udfuj7CSSU6RYqkQTmzRE4QkkVaWmscn+SmbWcvFyG8ke6CjJJWLz6mdidF38Mn3
	p36+eeRewmdf77rj/4psch+gvrDHxQmFngTMom08sM0ohsKZ+xbkvq9OmGh/29zziS4f/NV1obM
	eMBW0kOHnpYtTQ+df04j9p4iML9WGkSXkJujiiS1NKZKvjFgVWUJvonEq1ReDNWak+B348oVlXj
	dE2
X-Received: by 2002:a05:6000:4026:b0:487:c3f:5750 with SMTP id ffacd0b85a97d-48b02528ea5mr3207236f8f.40.1790780323426;
        Wed, 30 Sep 2026 07:58:43 -0700 (PDT)
Received: from archlinux ([2a02:a31d:a2c4:f100:d7a2:6e0f:6daf:6f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b029bf85dsm4430576f8f.13.2026.09.30.07.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 07:58:43 -0700 (PDT)
From: Jakub Gawlik <jakubgawlik13@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jakub Gawlik <jakubgawlik13@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: Add micmute LED quirk for Acer Swift SFG16-72
Date: Wed, 30 Sep 2026 16:58:39 +0200
Message-ID: <20260930145839.374762-1-jakubgawlik13@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Acer Swift SFG16-72 (1025:173b) uses the ALC245 codec, but its
mic-mute LED is not enabled by default. Apply the existing
ALC245_FIXUP_ACER_MICMUTE_LED quirk to enable the mic-mute LED.

Assisted-by: LLM
Cc: stable@vger.kernel.org
Signed-off-by: Jakub Gawlik <jakubgawlik13@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 5127a111c59c..fbfa515a6b57 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7198,6 +7198,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1025, 0x171e, "Acer Nitro ANV15-51", ALC245_FIXUP_ACER_MICMUTE_LED),
 	SND_PCI_QUIRK(0x1025, 0x1731, "Acer Predator PHN16-72", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x173a, "Acer Swift SFG14-73", ALC245_FIXUP_ACER_MICMUTE_LED),
+	SND_PCI_QUIRK(0x1025, 0x173b, "Acer Swift SFG16-72", ALC245_FIXUP_ACER_MICMUTE_LED),
 	SND_PCI_QUIRK(0x1025, 0x1758, "Acer Nitro ANV15-41", ALC245_FIXUP_ACER_MICMUTE_LED),
 	SND_PCI_QUIRK(0x1025, 0x1826, "Acer Helios ZPC", ALC287_FIXUP_PREDATOR_SPK_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x1025, 0x182c, "Acer Helios ZPD", ALC287_FIXUP_PREDATOR_SPK_CS35L41_I2C_2),
-- 
2.55.0

