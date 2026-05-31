Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBAC3914E9;
	Sun, 31 May 2026 15:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780242371; cv=pass; b=RlwR+5j8yKx3sFNT0uTq5oCpIgBZthI0tsMdaREtYjuPUwBy7HWGwIQHP5ycI75XcXM8Oi0Vmj0Ut9rPr76wvLIk5kwtfRihVtaOTKKj7TIOjYl82KNFT4R0pJ8pANZ3eYc9qHcLe7kliy+bKqPqXw4lZNQzSVTeFpLI7yDOpk0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780242371; c=relaxed/simple;
	bh=qz4f7k7XXMvf7t8sSnt0JM3ozYhq80WEw4SCcFPambk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qobX3EYazFXFbgR771+cgTaF1lRhRdZiyDru7/pBZolKlUsJkDjXDyTsVnnRUxlW8mau8+WlEP3HRjanD3gXQiYFD9EckxYaennC54y1JJYmKiZY/8LsEEkdkNyq53uEylkTXWXjOUcSDzqhTu8593OfBSGr0Fsj4gymBAfGZdU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=ozJFX6g3; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="ozJFX6g3"
ARC-Seal: i=1; a=rsa-sha256; t=1780242362; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KLyyh//VsZCQnroaSdHpGeq/7nwnm8b+1RwH2at9PT2d70aXtjvjP3EAgsJDzSUS4rnMERFnyX/2t+zWJQr+/AXmzo7HnrtB1ymiMlzdV4DQERoKP6Kv1P+E5Kf0awKE2IQMrncD2LgWmTQQlbn0YOYZa7PxffUtiquM0Qymy44=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1780242362; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=lt/+vOYXr8OB6WxWNVs2uD5rLVt5hK9HgzWwsdwpXEY=; 
	b=jB709RhuSHTSogNCCHJJwKLhYl2KpYd2knkOH5JFSs5cNfVXAtIOqTslKHc/i2AoMZGOaSGMydwwU84u2ErLhTRO2QPwdeQ4hDEf3Lv+3oK+HLhTf+qDl+5k+3Ga0s9B7fNkshvqw+0GykjmNFwwNXNWzrQZfEfF37mrdyv0Vh8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1780242362;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=lt/+vOYXr8OB6WxWNVs2uD5rLVt5hK9HgzWwsdwpXEY=;
	b=ozJFX6g3F19hO8ac8c6eaWTO0CcHHJ3u0F52Z+CHvEx+u9EV1VRCPY3OfhgMbLkb
	xmNYPwlxWD+G7BGAYB175UMpX4S6yi+XPzwRaho9gn5neB6/J2uUV1RvbIymA+xihHD
	dLuRviGfVOg7p5jFv5MmYJAJkX0ellJb1N53tTazWvRhQkf/IdyKFXNlBolIQeYaqsD
	1QcG9O/0Bm9dpr984jnAIkkJR08QbU1MQkGnUVFNlDfPUwzCLK6dMvzVlQw60vBajhn
	HPUbodPfesAFjq1V41B3IolSuYpKyoGvIdSo4/cLQvsQes8IeWhOgnaxoXRua411YRJ
	RxEpME957w==
Received: by mx.zohomail.com with SMTPS id 1780242359500424.20636790121137;
	Sun, 31 May 2026 08:45:59 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Sun, 31 May 2026 23:45:22 +0800
Subject: [PATCH v4 3/3] ALSA: usb-audio: Add quirk flag for Edifier MF200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260531-uac-quirk-get-cur-vol-v4-3-ede643dca151@rong.moe>
References: <20260531-uac-quirk-get-cur-vol-v4-0-ede643dca151@rong.moe>
In-Reply-To: <20260531-uac-quirk-get-cur-vol-v4-0-ede643dca151@rong.moe>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: Takashi Iwai <tiwai@suse.de>, Steve Smith <tarkasteve@gmail.com>, 
 linux-sound@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rong Zhang <i@rong.moe>
X-Mailer: b4 0.16-dev-d5d98
X-ZohoMailClient: External

The UAC mixer of Edifier MF200 works fine except that its volume GET_CUR
method is somehow stubbed and returns a constant value. Since commit
86aa1ea1f15c ("ALSA: usb-audio: Do not expose sticky mixers"), the
sticky check considers the mixer to be sticky and unnecessarily disables
the mixer.

Add a quirk table entry matching VID/PID=0x2d99/0xa024 and applying
the MIXER_SKIP_GET_CUR_VOL quirk flag, so that the mixer is usable
again.

Quirky device sample:

  usb 1-3.2: new full-speed USB device number 7 using xhci_hcd
  usb 1-3.2: New USB device found, idVendor=2d99, idProduct=a024, bcdDevice= 0.00
  usb 1-3.2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
  usb 1-3.2: Product: EDIFIER MF200
  usb 1-3.2: Manufacturer: EDIFIER
  usb 1-3.2: SerialNumber: EDI00000X06
  input: EDIFIER EDIFIER MF200 Consumer Control as /devices/pci0000:00/0000:00:02.1/0000:05:00.0/0000:06:0c.0/0000:0e:00.0/usb1/1-3/1-3.2/1-3.2:1.0/0003:2D99:A024.0003/input/input8
  input: EDIFIER EDIFIER MF200 Mouse as /devices/pci0000:00/0000:00:02.1/0000:05:00.0/0000:06:0c.0/0000:0e:00.0/usb1/1-3/1-3.2/1-3.2:1.0/0003:2D99:A024.0003/input/input9
  input: EDIFIER EDIFIER MF200 Keyboard as /devices/pci0000:00/0000:00:02.1/0000:05:00.0/0000:06:0c.0/0000:0e:00.0/usb1/1-3/1-3.2/1-3.2:1.0/0003:2D99:A024.0003/input/input10
  input: EDIFIER EDIFIER MF200 as /devices/pci0000:00/0000:00:02.1/0000:05:00.0/0000:06:0c.0/0000:0e:00.0/usb1/1-3/1-3.2/1-3.2:1.0/0003:2D99:A024.0003/input/input11
  input: EDIFIER EDIFIER MF200 as /devices/pci0000:00/0000:00:02.1/0000:05:00.0/0000:06:0c.0/0000:0e:00.0/usb1/1-3/1-3.2/1-3.2:1.0/0003:2D99:A024.0003/input/input12
  hid-generic 0003:2D99:A024.0003: input,hiddev1,hidraw2: USB HID v1.10 Mouse [EDIFIER EDIFIER MF200] on usb-0000:0e:00.0-3.2/input0
  usb 1-3.2: 9:1: sticky mixer values (-32768/-32513/1 => -32702), disabling

Reported-by: Steve Smith <tarkasteve@gmail.com>
Closes: https://lore.kernel.org/r/CAHLWS5FJCx66GQ-O10pu+nEudEo_QgQAM9vt76T7vT0zGPPC1g@mail.gmail.com
Tested-by: Steve Smith <tarkasteve@gmail.com>
Signed-off-by: Rong Zhang <i@rong.moe>
---
 sound/usb/quirks.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 3adfda40d7cb..27fd8621e8f5 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2477,6 +2477,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_CTL_MSG_DELAY_1M),
 	DEVICE_FLG(0x2d99, 0x0026, /* HECATE G2 GAMING HEADSET */
 		   QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
+	DEVICE_FLG(0x2d99, 0xa024, /* Edifier MF200 */
+		   QUIRK_FLAG_MIXER_GET_CUR_BROKEN),
 	DEVICE_FLG(0x2fc6, 0xf06b, /* MOONDROP Moonriver2 Ti */
 		   QUIRK_FLAG_CTL_MSG_DELAY),
 	DEVICE_FLG(0x2fc6, 0xf0b7, /* iBasso DC07 Pro */

-- 
2.53.0

