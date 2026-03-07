Received: from sender4-of-o54.zoho.com (sender4-of-o54.zoho.com [136.143.188.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EEC77081F;
	Sat,  7 Mar 2026 01:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772846904; cv=pass; b=WVy/v5ZSdtPYMc3DPdk3XRuHp3V3IZjNdsnKONGZavnHmw39b+YPNcnCla6YTKe+2R3oO5s3PHtC5shMx3lXohqjdXkjPvY8a0XZGJjXHaRknWPawYHQvPghaJzIl6sGsrLv6uTBEkbI1sJPWeRWjkgW5Alltty7jdwqi2AINxM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772846904; c=relaxed/simple;
	bh=joziPWiE3PN09cE7Z7ea6ybTiB8yhHZT7NiXD9Z05q8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oCPIRlNibs/mq02bbVTJYQvOkgZ6aHreKQ9dqUDzasVgz2BM+uMnUutSAcSDdOMTUFgTkJj8G2aLAkgdcwxBbm2Tbr0uZSWrlj2I1BQGvZsM4csO3XzS/mQc0HKFSRGt5i7ZhfdUISZZAobxX4XpBlDO19kIDfVtf3SMYC9UC3Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=uzair.is-a.dev; spf=pass smtp.mailfrom=uzair.is-a.dev; dkim=pass (1024-bit key) header.d=uzair.is-a.dev header.i=contact@uzair.is-a.dev header.b=AyYiO84s; arc=pass smtp.client-ip=136.143.188.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=uzair.is-a.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uzair.is-a.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uzair.is-a.dev header.i=contact@uzair.is-a.dev header.b="AyYiO84s"
ARC-Seal: i=1; a=rsa-sha256; t=1772846883; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=daKyuPZHuDehoM5yZsp8c64YTkrfHlTFIWIgFe70wBI/re/YjUVx3Nca3245uTjAC2rA9HrhoNK9IBoJMSZn3AZBj5QcTQT2PhXytQZGd0bXrRt/b7wcwSNe8YUAUkccMTRPUAUOeo5S7WyKiA5fyVzeeNDEHxRrY68G9cz7RnE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772846883; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=2nMpKzN0PvbS5x1/emJdoYxSvhyxtrsfhSj4Ds2COjs=; 
	b=lRlHdDL9JS7cqmaDZ2oo0Rez7PVuUxozYzLBPkUUXJFFj2aGANPf0gzk4WYUYK5u6IbNcGDNKHP2qntImp9Bi3x/Aw5V3iLsLvuzH+IYBmuh7jyOaMGbj4Uc6uFXh5ZuPCdb8iyayhem2/iBEbUmzleBlfpkA+P3m6lDPweK6fI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=uzair.is-a.dev;
	spf=pass  smtp.mailfrom=contact@uzair.is-a.dev;
	dmarc=pass header.from=<contact@uzair.is-a.dev>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772846883;
	s=zmail; d=uzair.is-a.dev; i=contact@uzair.is-a.dev;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=2nMpKzN0PvbS5x1/emJdoYxSvhyxtrsfhSj4Ds2COjs=;
	b=AyYiO84sQbk0lt91Tagj1OHhpQQ5R3ut3t2Ti7KRCGhhfy4P2BLjnZ4GV+jz2f1l
	S5dtXQY4C2alGlc3tfTwc2P9VILLW8IbLpwpVBIoAmmXEcL7GJc+69J6ynLOep+Rime
	BNGQZXaGoIXtjxtQtzrdtU2ul1I4YTvvSmFWHxlM=
Received: by mx.zohomail.com with SMTPS id 1772846881830608.3768348870922;
	Fri, 6 Mar 2026 17:28:01 -0800 (PST)
From: Uzair Mughal <contact@uzair.is-a.dev>
To: tiwai@suse.de
Cc: perex@perex.cz,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Uzair Mughal <contact@uzair.is-a.dev>
Subject: [PATCH] ALSA: hda/realtek: Add headset jack quirk for Thinkpad X390
Date: Sat,  7 Mar 2026 06:29:06 +0500
Message-ID: <20260307012906.20093-1-contact@uzair.is-a.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The Lenovo ThinkPad X390 (ALC257 codec, subsystem ID 0x17aa2288)
does not report headset button press events. Headphone insertion is
detected (SW_HEADPHONE_INSERT), but pressing the inline microphone
button on a headset produces no input events.

Add a SND_PCI_QUIRK entry that maps this subsystem ID to
ALC285_FIXUP_THINKPAD_NO_BASS_SPK_HEADSET_JACK, which enables
headset jack button detection through alc_fixup_headset_jack()
and ThinkPad ACPI integration. This is the same fixup used by
similar ThinkPad models (P1 Gen 3, X1 Extreme Gen 3).

Signed-off-by: Uzair Mughal <contact@uzair.is-a.dev>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index XXXXXXX..XXXXXXX 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -6998,6 +6998,7 @@
 	SND_PCI_QUIRK(0x17aa, 0x224d, "Thinkpad", ALC298_FIXUP_TPT470_DOCK),
 	SND_PCI_QUIRK(0x17aa, 0x225d, "Thinkpad T480", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
+	SND_PCI_QUIRK(0x17aa, 0x2288, "Thinkpad X390", ALC285_FIXUP_THINKPAD_NO_BASS_SPK_HEADSET_JACK),
 	SND_PCI_QUIRK(0x17aa, 0x2292, "Thinkpad X1 Carbon 7th", ALC285_FIXUP_THINKPAD_HEADSET_JACK),
 	SND_PCI_QUIRK(0x17aa, 0x22be, "Thinkpad X1 Carbon 8th", ALC285_FIXUP_THINKPAD_HEADSET_JACK),
-- 
2.43.0
