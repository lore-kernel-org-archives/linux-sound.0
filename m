Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E45630EF77;
	Sat, 30 May 2026 20:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780174630; cv=pass; b=b4nSNwHcxwYBPcMqZBUCWURJt9eOIwvvQvTg1dKLMR3Or37DbRfchYKwGJhatv0gxK4VgRYcFt7Z1+sGCoIaN35XcU/BZTi65zNID0VI4Aocu7qSD4AI9fDRAeyZbp+8o+nfa3z+w/1BFooNEf+qzcSH2SLRysDKVtsY9q8Uv6g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780174630; c=relaxed/simple;
	bh=s0sqvBMhZEKdfrHA9gwYy10ry2QnIOEtupJBt1Hpeik=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q7HPKAwBCHClhfKtWpPugLuV10byZ5NhFUxb5h+QxybYhr6FJOAPxoHPW9h2vANBT3YWvOAgkYJvX7joHpAHjq8HFrP3QVWemivleJETvutAvhQeh2gFrkDcpWb/8yAXj9+nhkHS97Kbw60d0LP2X5kUgomzawTeGjCEjr6RU8I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=QtkmiJRO; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="QtkmiJRO"
ARC-Seal: i=1; a=rsa-sha256; t=1780174624; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aQq4VuM6cKexvG6yJc7hjymSc6wjIoqk08vIo/CHVI7UuHqxevINndIPqiOVKbyG15gDomcRVS8YTZkFKvgvo5n8JidkUlZ0+1200ddi7S4zqxLSDTOll3QjLzEIkbnv5VD0cAnfEhZMg9vFxyFxgOsvncPe/hcPtMfSijA1KMY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1780174624; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=n094JIXlX4/FR7OxEyKRKKtoFMGNu8witLe5lTgoznU=; 
	b=auPHnsEjiHixNaQsylGWMY+33SdlSG/5CMSwZ6Zb85qIyj4ZXCGZD2h3YUo6UYIIPHW3BUzBGMHxsFb6BbMiYfQnNkFjaDsRSxMFktjt6xtxdOmfGoVzUis0EYAKacYTUGeHDLsqBAW/b8X6AsMTCN+ZkVNM46VyLxm5yJfhLvE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1780174624;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=n094JIXlX4/FR7OxEyKRKKtoFMGNu8witLe5lTgoznU=;
	b=QtkmiJRO6PyhARh+EPhTKh5oLIuA6naqLCmGt4hLNx8M7f+w7GB4Mo0tEaY9gWnq
	cx5YVe8qG3X6q7LrS7oH6PqvVKRYZjzaTR3xYtlflIlULHDARN9BbI/P1YT0ANjThdi
	N5tu43ObrK38/VqwYpY8B9mFyygRf+JJX396/7bOPXJ/xcG/l384LhC6b2q+wAq88WP
	g0KWWpkjtsVNvSnuD/TiZSieBo9e/zO/b8pSmAl+UNIyeCrWgVTUMmlo4+60uVFBBoZ
	KzRsESlKWdDK1N8/u3EsC/QLhc/BOXNWxlMvHrOMFp+qPExIpT6UO5l6zUYC6C+Dvce
	RAvo0OW0rg==
Received: by mx.zohomail.com with SMTPS id 178017462238667.7389004829646;
	Sat, 30 May 2026 13:57:02 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Sun, 31 May 2026 04:56:43 +0800
Subject: [PATCH 1/2] ALSA: usb-audio: Add quirk flag for Edifier MF200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260531-uac-edifier-mf200-v1-1-be69657c3f87@rong.moe>
References: <20260531-uac-edifier-mf200-v1-0-be69657c3f87@rong.moe>
In-Reply-To: <20260531-uac-edifier-mf200-v1-0-be69657c3f87@rong.moe>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Takashi Iwai <tiwai@suse.de>, Steve Smith <tarkasteve@gmail.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Rong Zhang <i@rong.moe>
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
index 149f2009df12..22f9e099bf4e 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2475,6 +2475,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
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

