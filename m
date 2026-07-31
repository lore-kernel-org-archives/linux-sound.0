Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2342264CA;
	Fri, 31 Jul 2026 13:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785505525; cv=pass; b=N/FsaUQkohrwv3Cb3fjJ7oj4KR94SXwNHy2hF3nAGV/KG3rAqlIJ7/o6ElGWFDqmuEZv/wapgGHrkUWEWJA9BZ+iL5GtaV2EelBW3ILKT2dENuWv1SeM6xU7NkN+Nkdu5Xd46hTQAq6crqWmc0pkKEruE3WBBecWGn9QB/Vwlk8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785505525; c=relaxed/simple;
	bh=sRLNxxxMjwfQwDGzfaPluNo0IfuAb3eyLvydzLhGE5U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UjP8TcK/G1BLteemwzsMqKtFslDrjWO3HJIANoue1EVR5TQp2WmMMVEJvdso8agBFRlkyMYVSjdSulLZwhhBUItvd6Xu6XS/AHUJbsloL15dWFQ+XbIMbU1DGqIM5F2tiGTT8Pdilmhhs1tZOKoYJi9gFvQgfDWYs7Ay5DrpvWw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=m9D2SUrg; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="m9D2SUrg"
ARC-Seal: i=1; a=rsa-sha256; t=1785505515; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Y+tiqrS/2oMho9WMe/vvZ2K17/+mt8jdcw4ytEZNwG+BUFoD00TnLpOGAbEqngzSQYci2zVIB2+4oDseFQgI1dgF2b4fHW1jBY7ClMEDQpgeAd1obDXOaoFA/nHuthkUOOt5YCeYeWMjRF0EKiIVFwl3U6OVC2f2oTPhzXqmDDA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785505515; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=in8tXtqEhBoicPZqGBA8Zr8oBK3FElu5JeHR8BIydM4=; 
	b=YJYhOcRLEYLf370e4aWaZVw1GtkxsUdrziugQ18HyoeEPfjUwiyK8+si/DUDmcqMg0eNAAcm9salGFMKjCCqef1nTb7vvlnk3r9smAf39zNWMfwaWt5iVtIHrVrSHQkdnW+u9giAL5C84XMRi2ErgJ3mQA5wdN16I8mYrlAIci4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785505513;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Cc:Cc:Reply-To;
	bh=in8tXtqEhBoicPZqGBA8Zr8oBK3FElu5JeHR8BIydM4=;
	b=m9D2SUrgm3tf19ibkNeOuV9gXlASGcC1LZVeSYzvn6uSur9cjCFiT6625DsKRy3X
	ppWe/KGb6JDA+bb4BoT9nVHQR0ke0QROunb9VaUUmtnifLQBshRPDmRDWq4KkrU5wf2
	8wJQmJSP2QnaVyTWxKrsC7QaPXFn61chQKZlVfX9wunaOYdnIxn56bI3zPKMggcpxAR
	ndutBdELksif1gFzaBzFLsT4RdP1v8VUJQpdTEkCeeYfLzvrLTQJ+E+K9fYixTZt8nr
	CAvGIUGjf4YbK+dG9HfYgnBRFpS0KN1PaTR4RSAwdwOhPgZ1TnMz8Dc4lb7pAHHsxt1
	jYPq4/+Sjg==
Received: by mx.zohomail.com with SMTPS id 1785505510910833.2149652510371;
	Fri, 31 Jul 2026 06:45:10 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Fri, 31 Jul 2026 21:45:05 +0800
Subject: [PATCH] ALSA: usb-audio: Add QUIRK_FLAG_MIXER_GET_CUR_BROKEN for
 Logitech PRO X 2 LIGHTSPEED
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-uac-lg-pro-x-2-ls-v1-1-268eaefe66ab@rong.moe>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBBA0avIrE1SVISriEXVYESQjopE3F2xf
 Iv/LxByTAJVdIGjg4XXJSCJI7CjWQZC7oJBJ0rprMzQG4vzgJtb8cQUZ0GTt0Z3RVHmqYLQbY5
 6Pr9n3fwW305k93cE9/0ATJaEnnUAAAA=
X-Change-ID: 41004393-uac-lg-pro-x-2-ls-a5ba4d779520
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian van den Berg <faxuser@proton.me>, Rong Zhang <i@rong.moe>
X-Mailer: b4 0.16-dev-2f6f2
X-ZohoMailClient: External

The UAC mixer of the Logitech PRO X 2 LIGHTSPEED has broken mixer
GET_CUR behavior but otherwise works fine.

Add a quirk table entry matching VID/PID=0x046d/0x0af7 and apply the
MIXER_GET_CUR_BROKEN quirk flag to make the mixer usable again.

Quirky device sample (after applying the quirk flag):

  usb 3-2.1: New USB device found, idVendor=046d, idProduct=0af7, bcdDevice= 1.00
  usb 3-2.1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
  usb 3-2.1: Product: PRO X 2 LIGHTSPEED
  usb 3-2.1: Manufacturer: Logitech
  usb 3-2.1: SerialNumber: 0000000000000000
  usb 3-2.1: 2:0: broken mixer GET_CUR (-18944/0/256 => -2662)
  usb 3-2.1: 6:0: broken mixer GET_CUR (-18944/0/256 => 0)

Suggested-by: Brian van den Berg <faxuser@proton.me>
Reported-by: Brian van den Berg <faxuser@proton.me>
Link: https://lore.kernel.org/all/370007e6-b73b-4bfc-8410-a860781c7ad7@proton.me/
Signed-off-by: Rong Zhang <i@rong.moe>
---
 sound/usb/quirks.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 0de7c9d94259..3bd66094863d 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2251,6 +2251,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 	DEVICE_FLG(0x046d, 0x0a8f, /* Logitech H390 headset */
 		   QUIRK_FLAG_CTL_MSG_DELAY_1M |
 		   QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
+	DEVICE_FLG(0x046d, 0x0af7, /* Logitech PRO X 2 LIGHTSPEED */
+		   QUIRK_FLAG_MIXER_GET_CUR_BROKEN),
 	DEVICE_FLG(0x0499, 0x1506, /* Yamaha THR5 */
 		   QUIRK_FLAG_GENERIC_IMPLICIT_FB),
 	DEVICE_FLG(0x0499, 0x1509, /* Steinberg UR22 */

---
base-commit: 8ba098e6b6ff0db8edf28528d1552be261af30d4
change-id: 41004393-uac-lg-pro-x-2-ls-a5ba4d779520

Thanks,
Rong

