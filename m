Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793543908;
	b=30VkTLntW5znZP0wmYXCW0K2stMTXCYKQaxmivNf7R7SzIFNYpHKRlXpOZSqrSJyk7XW
	 F9RFNnKw8poWvfryiDu6vU1tS6o76NL2/qCpbiw4xN2dy/WM6WnlRncw3N5BUpWvbyIwS
	 1WussNgoZzpL1KQTSTW2qoEW8gBO/wh6ujlfdOrC+0TlbZDHUfugfEaTKsmmEdZZBmPpK
	 FLyND+uNa3h3mKW3cFWzDRR2ytFogrVoGmfw8y3wxHQQmSDU3YWJsQci47wjXAeXd3/pe
	 NSwE5W92xn+s3+V5wBvdKtuEkUhXvaU5rg+7kgiCXb74mBDnN6BNf0raumRitB8XwkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793543908;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Yj7uHm+i6moRPp1T/k/KtCZpjWPn8bcWSFuA0A8wuVI=;
	b=td+5qqkjfgn8f5PyYiYzjtxqr7HkjJ3F8YT1yPJQg7hWqeV5Vs+Dxd0/fsUVxnZj3xe/
	 4LiwmWHmsPtJj6Pzgl9c3vGtu7hVY+0v3l+twEn6m3vAQQPxMe+qP4kPKBrNgLUoiIBQn
	 T7VWPsjxYHH+RyMpSef0YomKXSC2x8ru1mhWpW8hDLbwG9i20Q6eyMMOaTIB6BgDFYZWU
	 V2P5K8WX1UkdgRi92WZaWXmqInCt08Zfuplx3U3BmIUx/8qslH3QQ3fmud6YFhBTUkeSm
	 Fg1dklAPxxdmBXIh+tG3C0mHHMAQz/EL4UlTdYOg+YSmUrCb5UrjzgQia0vf77M6BYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YZm2TLGX;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2145606A324
	for <linux-sound@vger.kernel.org>; Sun,  1 Nov 2026 14:38:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2145606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YZm2TLGX
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-35829219da8so3843009eec.0
        for <linux-sound@vger.kernel.org>; Sun, 01 Nov 2026 06:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793543907; x=1794148707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yj7uHm+i6moRPp1T/k/KtCZpjWPn8bcWSFuA0A8wuVI=;
        b=YZm2TLGXk3iUa5GS57Vn23sf5WFeg0RVJUwNmU+aOqDVWLnV3F5iGB1X0JV1SZMfdY
         nhxUfU3zqQ+pC9wytFmv1h0tpGp8sf62VCVfM1xpBTUGIBG1xbW1I78DpUwYMC/McE9Z
         XlHErLLDloDrcD9zaAcz6466PMCxwGaz6NL6Fy7nnmC6LT0AiPrIHxfU7WMgV/V3LPYD
         wLoCIOX9PNJDxXSI9v9iRSxk58SbR3E3k95xJB91w+tBzszD0KIehBG3zBxOgy7C5piC
         IzdiTycmxGZesXLKN88R3su+C804/WXUkDpZ/GvXAquEmIaKgSotWtdSTCsaI0ltiHVC
         vk/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793543907; x=1794148707;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yj7uHm+i6moRPp1T/k/KtCZpjWPn8bcWSFuA0A8wuVI=;
        b=rsjH3nAL/4QkKoFJoGBCUbdxWY4JQuOT/xHKTrvQWEp4uhPsK8LJJFHKfh8xGPe0Wi
         zk6PY87z7hdk/+P6NlAKZm6AaaBFN+aImubJC0oFP61TeXdQm1Zc/2N/gCT6PZ7CVN8u
         X2jgnjZnGH0syKveXSlzs7P9NvdFENBwealdCgbu5jlQ+R0Zb3NoaUT8x1jI9AiWKprA
         wioI49Z3dzs3V2wjtgHiFiUZ1TjvDItZ+XKyiqymmeDWJdLepJvdeyAcSbLg7EqORiSj
         7iaff6Ll9eWZE1h4TNxiVIc+GaEEBx/vj/t2oYtm3q3d6ZYYnDXPy0zKw5AQo+ZyUdev
         3VfQ==
X-Gm-Message-State: AFq9FYKQ87coHcQ6bfwM4r1xfwgQ2ppBpy/k81Kqxyz7qzmaW3tPliUY
	nWb7lMMJtYuyy+cf8gasEojUM6iXzvfMHQzKkEaYGAY4OPhW9ySsY9kGDCaU0wdE
X-Gm-Gg: AYBFou1sB5fsAP70awwmVToZnaz081ClDPSLr+PUHq0484LKIchjdJynerQjR+36s2W
	ussTU4MYzlcUWjkmVipsJp/4R3/jsHj99muVFA/BUb/Fv0IoSNT2T2fbpS6oAWC9004YGKAFHKR
	GAGwqRT/lmqkVj4Y5+7LZ2wCdOu9jdL5c3TMC/SPAlpqsyFNYKs6nIgeKpiXfToIvR0bmHJQVp4
	RwGtSYdirJ2c7/aaU/JjLKcd1Cpk3/4LCEiMSgU+h/O0dstdYaMbzvztekJcM9lwCyeJWLW49iG
	UyQzXSlaytaTUVWk2kf8YQ/Fr1BzVw3sf28DGU8HKWuOPxPecXp+sI8tHtydSpxdk/MGPzZyao1
	V9i9k3xHcn+g6nQmjkr1UNYCzJYLoTVAojmEZBaUf1+jIwaD9K5Mt0E5fcgyoMXaldeg5MEvcPl
	EImhOzbJINPggosCIJKo59WB0VfHq1YZ0QzLL0pk0XAtHQMuLOjEoys56iyVZqVPFY/g21dEZp8
	9N3ZRAtSTFJWO+OLJV/Q+gryN+rnZvJW9aT61Unnk+NIcuwUc1j0eL+LvN92rFXGKWeCB8UN4T2
	kBB5leo2r1QQmEXhdqyLGGGJWWO46i9tihgMJlfYCpRk1xnIA1cwbeihpOBzdd+PwHkAACRsYHV
	uSvRYfImMP9sHsv6iYk07VEBppzq6M7H8
X-Received: by 2002:a05:7023:a4b:10b0:159:f192:5290 with SMTP id a92af1059eb24-1a9496c2a81mr14598214c88.13.1793543906838;
        Sun, 01 Nov 2026 06:38:26 -0800 (PST)
Received: from puter ([49.207.217.88])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1a136537sm24898966c88.18.2026.11.01.06.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 06:38:26 -0800 (PST)
From: Shivam Madlani <shivammadlani5@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shivam Madlani <shivammadlani5@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Fix mute and mic-mute LEDs for HP OmniBook 7
Date: Sun,  1 Nov 2026 20:08:18 +0530
Message-ID: <20261101143818.17714-1-shivammadlani5@gmail.com>
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

The HP OmniBook 7 Laptop 14-fr0xxx (PCI SSID 103c:8e3b) uses an ALC245
codec with CS35L41 amplifiers. The existing quirk
ALC287_FIXUP_CS35L41_I2C_2 does not configure the speaker mute or
mic-mute LEDs, leaving them non-functional.

Switch to ALC245_FIXUP_CS35L41_I2C_2_MUTE_MICMUTE_LED, which controls
the speaker mute LED via COEF index 0x0b, the mic-mute LED via GPIO
0x04, and chains to the CS35L41 amplifier setup. Also update the model
name from the internal board codename ("HP Agusta") to the retail
product name.

Signed-off-by: Shivam Madlani <shivammadlani5@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 23329d5887a5..b040cea9c268 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -8067,7 +8067,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8e36, "HP 14 Enstrom OmniBook X", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8e37, "HP 16 Piston OmniBook X", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8e3a, "HP Agusta", ALC287_FIXUP_CS35L41_I2C_2),
-	SND_PCI_QUIRK(0x103c, 0x8e3b, "HP Agusta", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x103c, 0x8e3b, "HP OmniBook 7", ALC245_FIXUP_CS35L41_I2C_2_MUTE_MICMUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8e43, "HP Laptop 15-fd2xxx", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO),
 	HDA_CODEC_QUIRK(0x103c, 0x84ee, "HP Pavilion AiO 24", ALC225_FIXUP_HP_AIO_SPK),
 	SND_PCI_QUIRK(0x103c, 0x8e60, "HP OmniBook 7 Laptop 16-bh0xxx", ALC245_FIXUP_CS35L41_I2C_2_MUTE_LED),
-- 
2.56.0

