Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F7E3914FD;
	Sun, 31 May 2026 15:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780242362; cv=pass; b=PzJ+tDIiu4CruejukwMkTuHjEt4c6xUmaq03X9isPiDNRzn2CIzYFYxW+QEpTaTolO8hqaUVPve8qIaoAejd7XM/xduC39NPjdFCkdTbRf+gU3ZhYMUvciTjjiwEU7lP3UFfOLbhSHcyLYa8sHUG8KPOQCn+zqu8G74gzYTLhrQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780242362; c=relaxed/simple;
	bh=0Dz5xfVWdLxnQzArdTtBol3yQuVdm0/OvMpT7MVEL/M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mgiF8r4Aa8HMryVNctXiH+ZKvEO4+RolCbRPDHxb5XhS/m/I5u4qw1igS08KRhymkJhFePH+ebvKGIA1RiGphyuGRwSmVqXVUuSgxmNipw63YuSAxnhUGxA3IMhRF2AM4TDR+xY39i23z3m30PvwLF/YgnCCpdstwF2ljUBwWbU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=LFeDBvaS; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="LFeDBvaS"
ARC-Seal: i=1; a=rsa-sha256; t=1780242352; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mJX4AnsUfiBjZtY5hdNbZNTgJaviLXuXMxxxoDoZ/6fJvaxhP16yz/STTfn7Ia9n8yC+jjKodVKgHOfCspKbfljdFeUmoSzo6YJDFE41BH7exqGo06DGjlN3ALXw0u+6a01CeSFj+B9FLy3vfDVch6LmOGClKd005fCqSGQSRRk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1780242352; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=mD7J84PQ1T+xQ+GDzbHYrO1OyEKuzsq/Emq0e/KEyXQ=; 
	b=K2uFZGN5PE8Ol6C7eY8S8MlUB7k+5144775AQzRqAv8AyU4NG7wl91QIgx6AH2gX7+6BWoiJ/ehxYHoMNL3K/o5YgvdSHsn6LgVVuz0ZMMZgSO9Y7e0keUGItJ/G8UCjdZ7moahYCoWbMuEUOffhgolOaF8yJCaDQAM8OU2EvkQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1780242352;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=mD7J84PQ1T+xQ+GDzbHYrO1OyEKuzsq/Emq0e/KEyXQ=;
	b=LFeDBvaSf4jhtzTgimnMURByIw6UxIe/1y2NnEhA0Sk6uM1nnGm0rmqEIDqwBvvs
	RVG4ncSS/Wr9Ln+CYJJOw4SbjQayvUwziDh0VxKv7x5vZTSo1qZ7x4hwzaFatDqJRqc
	JKx6g6xpDAH22tHaQzASXGFPPjylueDVbVbdpIXUZIanRzwjdGVJAYgpL8Lc1VHVrbR
	WYynXStCESBfWFcRLm5QawYxBnZ+WGEcZmrHIFwvXKPJeiwrVb9CK4KaCOBc8d1datd
	KKPPSJaPIrY65S/yevM7dH7EJvq5a5/QIEp2XhZ+US03FrmVDPkO6jUTaBF0soPas1e
	8FJncdyVhQ==
Received: by mx.zohomail.com with SMTPS id 1780242350393799.1667336681013;
	Sun, 31 May 2026 08:45:50 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Sun, 31 May 2026 23:45:21 +0800
Subject: [PATCH v4 2/3] ALSA: usb-audio: Add quirk flag for Sennheiser
 MOMENTUM 3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260531-uac-quirk-get-cur-vol-v4-2-ede643dca151@rong.moe>
References: <20260531-uac-quirk-get-cur-vol-v4-0-ede643dca151@rong.moe>
In-Reply-To: <20260531-uac-quirk-get-cur-vol-v4-0-ede643dca151@rong.moe>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: Takashi Iwai <tiwai@suse.de>, Steve Smith <tarkasteve@gmail.com>, 
 linux-sound@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rong Zhang <i@rong.moe>
X-Mailer: b4 0.16-dev-d5d98
X-ZohoMailClient: External

The Sennheiser MOMENTUM 3 is a wireless around-ear headphones featuring
ANC, which can be connected via Bluetooth or USB-C.

When connecting via USB-C, its UAC mixer works fine and precisely
corresponds to the reported dB range. However, the mixer's volume
GET_CUR method is somehow stubbed and returns a constant value (15dB).
Since commit 86aa1ea1f15c ("ALSA: usb-audio: Do not expose sticky
mixers"), the sticky check considers the mixer to be sticky and
unnecessarily disables the mixer.

Add a quirk table entry matching VID/PID=0x1377/0x6004 and applying
the MIXER_GET_CUR_BROKEN quirk flag, so that the mixer is usable again.

Quirky device sample:

  usb 7-1.4.4.1.1.1: new full-speed USB device number 30 using xhci_hcd
  usb 7-1.4.4.1.1.1: New USB device found, idVendor=1377, idProduct=6004, bcdDevice=38.85
  usb 7-1.4.4.1.1.1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
  usb 7-1.4.4.1.1.1: Product: MOMENTUM 3
  usb 7-1.4.4.1.1.1: Manufacturer: Sennheiser electronic GmbH & Co. KG
  usb 7-1.4.4.1.1.1: SerialNumber: <REDACTED>
  usb 7-1.4.4.1.1.1: Found last interface = 0
  usb 7-1.4.4.1.1.1: 1:1: add audio endpoint 0x3
  usb 7-1.4.4.1.1.1: Creating new data endpoint #3
  usb 7-1.4.4.1.1.1: 1:1 Set sample rate 48000, clock 0
  usb 7-1.4.4.1.1.1: 6:0: sticky mixer values (0/11520/768 => 3840), disabling
  usb 7-1.4.4.1.1.1: [6] FU [PCM Playback Volume] skipped due to invalid volume
  input: Sennheiser electronic GmbH & Co. KG MOMENTUM 3 as /devices/pci0000:00/0000:00:08.3/0000:67:00.4/usb7/7-1/7-1.4/7-1.4.4/7-1.4.4.1/7-1.4.4.1.1/7-1.4.4.1.1.1/7-1.4.4.1.1.1:1.2/0003:1377:6004.002B/input/input208
  input: Sennheiser electronic GmbH & Co. KG MOMENTUM 3 Consumer Control as /devices/pci0000:00/0000:00:08.3/0000:67:00.4/usb7/7-1/7-1.4/7-1.4.4/7-1.4.4.1/7-1.4.4.1.1/7-1.4.4.1.1.1/7-1.4.4.1.1.1:1.2/0003:1377:6004.002B/input/input209
  hid-generic 0003:1377:6004.002B: input,hiddev99,hidraw12: USB HID v1.11 Device [Sennheiser electronic GmbH & Co. KG MOMENTUM 3] on usb-0000:67:00.4-1.4.4.1.1.1/input2

Signed-off-by: Rong Zhang <i@rong.moe>
---
 sound/usb/quirks.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 10c32e633786..3adfda40d7cb 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2357,6 +2357,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_FORCE_IFACE_RESET | QUIRK_FLAG_IFACE_DELAY),
 	DEVICE_FLG(0x1224, 0x2a25, /* Jieli Technology USB PHY 2.0 */
 		   QUIRK_FLAG_GET_SAMPLE_RATE | QUIRK_FLAG_MIC_RES_16),
+	DEVICE_FLG(0x1377, 0x6004, /* Sennheiser MOMENTUM 3 */
+		   QUIRK_FLAG_MIXER_GET_CUR_BROKEN),
 	DEVICE_FLG(0x1395, 0x740a, /* Sennheiser DECT */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	DEVICE_FLG(0x1397, 0x0507, /* Behringer UMC202HD */

-- 
2.53.0

