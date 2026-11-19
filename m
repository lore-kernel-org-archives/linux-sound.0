Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795104516;
	b=fQoH1BM4C98CQu2jQk8nWDE6QQjro/XxytyX1Uc+ZEespOZSya453ZtOq4V38OZIcIDt
	 1mX15BbQbVKf+mkfbii7QBlONcbFTg7tUf8qm9ZFrFjMpOqGAazTdBjaFw2Htrq0OgSCJ
	 HKhf/205hQBL2IA/dJ4GgdyggR6wcxEHGEvaVgvbrYbJXh1LyMuy/1aZgZlCxuIho3hnM
	 ocMPpHluMV7bhlznb590eUVeaIiXuk2z+xJ8ZZGMpF/ej/704m6Jm+nBIFzfzLooS1fn1
	 55j4vjBbe7wAAMp9U+HS54/S5AurTBW+T5SuqvqXKUP9joXYBg9EqUlCYM2hI7Th3Pg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795104516;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=mK5W2oGDgM7fDDjlsDNABEhJ9lUtf2S8X0bV0OSQQT4=;
	b=NBIT+OJdeeaEm6da1FBG6BK3UUNsHmKNtB07OEqrxDPoQA0bR0QrGnEFluZff9A6UxI+
	 7rI6s24/WDeikYGkO81nYawhgcjnWJl7934zvjGUm0kaM0g/H7HFKjqJMg+t4wSRkqgQH
	 yJ3QTNBUKdvolpMoYGxBjJS1H+TKySAAi6dAAc3Y2ZEOpI74O6R0Qa0BkBpDTjPVohiys
	 5sFyZCLLlExR8XGzfXnTbaU7FmKjLZNMhWn5EnCrmyPJtF6a1zkFApWVGTKulWhnQQKCC
	 STbGtXGOKsSlNJN2RLtLGKBFA789zLCc23zgaDuIj3dZyqsD6OGETpW5OoCjrwulWLA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ON08vqOm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8959C606A325
	for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 16:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ON08vqOm
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795104516;
	b=i/KzwfjtOIDess5QxWAXRRsn6vPbIbr6x63UYaQq/Mdaj+avO8XyoH4H1h4MaaR+VICP
	 cinGk7n46+5GR7LZy5gqLxxMEHEEaF4JUocUVysVFCJCxcRM6ma/nefR3l6m8RZyzICpt
	 WyT98JseCJ+l/xxfKF0MSorwaI5l+lHvlF22gxiTkbVA4FMs2lPFqzTVrvNk1ibI/ldv9
	 QDJ7aiM39FhVZ5UnXUY5vf/IT8pCFcsZ6/3BiS/SkoJV2KuU3AglvzQ0l08V4rTMPOcbr
	 CbbLmwCKCCh4KbQNzlqwQIoCkT5J+txQYmGDyZSS94KhpinP6MF7MW6q4Lm0ZMVp0WA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795104516;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=mK5W2oGDgM7fDDjlsDNABEhJ9lUtf2S8X0bV0OSQQT4=;
	b=QMwVfBT5AGiQ8ifA2ypJF7lYCA9gHD/E72rHllrFc5cEjZinAqxtS0gAITidAnW0rvkl
	 8hiAwxBRbVQB/ZJlUgszojusZPNso8WTl4LbLY8XdCSRGJw8Ct+9eeJAb4vqE/S4QRvv5
	 Vw1x82nVu8dzBNiUkR8AxmVR0jySsM62GKap5SgqMe5f5ee0V6W3s3PhGLlMKClPM4TMP
	 aKdliDm44V7wtcmHEid4zXOAPHYcwPjD6BtqYXlqkvuAwG67iwUpWEJfltTgkOfAlbMb8
	 XumMHxWSvp0CWaXaYFlQhyF+BiWvx6+L6p1j7DHwi/hgsqhX/YJ55THhUzGpOpuhHiw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AEBE41F000C8;
	Thu, 19 Nov 2026 16:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795104516;
	bh=mK5W2oGDgM7fDDjlsDNABEhJ9lUtf2S8X0bV0OSQQT4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ON08vqOmpAoGRCk5pK892EHSHKRJ7BWnMXyq/yfn48L94eLhLH2SdQXHEWt724zNP
	 Wm3T0/RDWKgPc83MeFrqHd9NfHZijcfVBfflBpIPGttMfNhSBYOrWschqCOzce7yXv
	 HBmrliBtVVk+fmpFMV9WpgDsNEhVSgbwwxUbgcc31trGYMnLNB/FpI+5yamQwaeD+R
	 1JTyNuO++4UOWIp5BHwDoCplIDigYDfdfz1gbLd3EUpQcPLVmBKwDfbU7fA5k/W5zr
	 rNXysAZC7XsLYDl17h4YOlYaPMyR0GHzblyHrZCkimTWhA4RxPe/lEdu/BQ5jzKKti
	 xrnvS8pkp5Rjw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 389B44B310;
	Thu, 19 Nov 2026 16:08:35 +0000 (UTC)
From: Brian Harring via B4 Relay <devnull+ferringb.gmail.com@kernel.org>
Date: Thu, 19 Nov 2026 17:08:18 +0100
Subject: [PATCH v2 1/2] ALSA: usb-audio: Use ALC4080 mixer map for ASRock
 X870E Taichi
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261119-alc4082-taichi-v2-1-03ad1352f807@gmail.com>
References: <20261119-alc4082-taichi-v2-0-03ad1352f807@gmail.com>
In-Reply-To: <20261119-alc4082-taichi-v2-0-03ad1352f807@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, Brian Harring <ferringb@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1902; i=ferringb@gmail.com;
 h=from:subject:message-id;
 bh=6SKhBAvpKYBOjZlHIYJz/Kb+Y8fYIv6xgNmQSYwBQ8M=;
 b=owGbwMvMwCW26vPpzMb96zwZT6slMWT9l2daWf5E9bThWZfLAUsOh/2Yo6HC1+qbqPOVq/g3/
 57UiadPdXxkYRDjYpgppsjy4EvOG4X4W99cjS65wMxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkCGjlE8RE6PQSOzuLg0tUg3raDIIS+/JLEkMz+vWC+/IDWvIL1ALy0zrSQjI7+oOBVohF5eaom
 rgZuJmbOrs5GBqZuLo5uZiamxkYuRiYmjo5uxs5OZpYWhk5ujq4klAxenAMw1t3kY/mmZC7qJft
 pbV3Fw5UxW7cVz5u/Tyj/00eX41g2TRd9/7fJhZHj4a5p3wULRTQWyc8/kCOxtN//gwWYz62xOs
 e83h2MfznMBAA==
X-Developer-Key: i=ferringb@gmail.com; a=openpgp;
 fpr=E9C121C8F3E4519A7E8E7E39C5068414B0C044B7
X-Endpoint-Received: by B4 Relay for ferringb@gmail.com/default with
 auth_id=1454
X-Original-From: Brian Harring <ferringb@gmail.com>
Reply-To: ferringb@gmail.com
Content-Transfer-Encoding: 7bit

From: Brian Harring <ferringb@gmail.com>

The ASRock X870E Taichi / Taichi Lite onboard audio (26ce:0a0b, Realtek
ALC4082) has the same problem as the MSI ALC4080 boards already using
this map: all its playback feature units are named "PCM", so the UCM
profile pairs the headphone volume with the rear output's mute. Its
unit IDs match, so use the same map, renamed to alc408x_map now that
it's no longer MSI-only.

Signed-off-by: Brian Harring <ferringb@gmail.com>
---
 sound/usb/mixer_maps.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/sound/usb/mixer_maps.c b/sound/usb/mixer_maps.c
index 9218ca6314ad..a0a93f9832b4 100644
--- a/sound/usb/mixer_maps.c
+++ b/sound/usb/mixer_maps.c
@@ -486,8 +486,8 @@ static const struct usbmix_name_map aorus_master_alc1220vb_map[] = {
 	{}
 };
 
-/* MSI MPG X570S Carbon Max Wifi with ALC4080  */
-static const struct usbmix_name_map msi_mpg_x570s_carbon_max_wifi_alc4080_map[] = {
+/* ALC4080/ALC4082 boards with this playback feature unit layout */
+static const struct usbmix_name_map alc408x_map[] = {
 	{ 29, "Speaker Playback" },
 	{ 30, "Front Headphone Playback" },
 	{ 32, "IEC958 Playback" },
@@ -770,15 +770,19 @@ static const struct usbmix_ctl_map usbmix_ctl_maps[] = {
 	},
 	{	/* MSI MPG X570S Carbon Max Wifi */
 		.id = USB_ID(0x0db0, 0x419c),
-		.map = msi_mpg_x570s_carbon_max_wifi_alc4080_map,
+		.map = alc408x_map,
 	},
 	{	/* MSI MAG X570S Torpedo Max */
 		.id = USB_ID(0x0db0, 0xa073),
-		.map = msi_mpg_x570s_carbon_max_wifi_alc4080_map,
+		.map = alc408x_map,
 	},
 	{	/* MSI MAG B850M MORTAR WIFI */
 		.id = USB_ID(0x0db0, 0xcc78),
-		.map = msi_mpg_x570s_carbon_max_wifi_alc4080_map,
+		.map = alc408x_map,
+	},
+	{	/* ASRock X870E Taichi (Lite) (ALC4082) */
+		.id = USB_ID(0x26ce, 0x0a0b),
+		.map = alc408x_map,
 	},
 	{	/* MSI TRX40 */
 		.id = USB_ID(0x0db0, 0x543d),

-- 
2.56.1


