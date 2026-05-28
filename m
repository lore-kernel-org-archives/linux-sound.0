Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9136C41C308;
	Thu, 28 May 2026 18:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779993553; cv=pass; b=bTibKwP7IbvPylBdSbX+ZZ4Z84cBXzLoV32o6mq93O2v/3T63h2AINnGR+GStJ2r/byokWoD1eA0i+wp1rfuZ5/z1B32Ftz28R62xAjnRctPmQUSu3zzvljy8inqqwQ9FxMv+sRNrZ5RxahrMRJceqMnnDsT6PyEioJVGL0S5fM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779993553; c=relaxed/simple;
	bh=dPsqvFMUthronaDNPsO9Nf2AfzZZGos2VFwXOO1haoQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CBKA0G694QHGkNiZOuLwWkOorHvwzFLwLDCRDpoe/84Tlwh5kC8qsfkT55V/zCZJKtPLhb9la8JwDw6wM7FC5tlyop1+AcoO8B56KLFEJxXm6tHBCdZQA1tiHYKFS3x9OrEcakgvHEzSwYiQctS2HgWDJe+a633mVre1Hh2ND4g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=mm7wiFpK; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="mm7wiFpK"
ARC-Seal: i=1; a=rsa-sha256; t=1779993548; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NiwS1tX5SPU6QAD1sWcau8ryA0rUVkruGWwrcY+bQRXkzN1qpYRZ+FoCNlgwP5oR+SnkcS9d8Vo4X6+8/Vl/0GJd7rP2F5//8109RRjJx+S6jXOO4diiZBaWTOJnsUaFJSq05RCz534oUNzZHUiqmH/WeAAcU18+XvLvEcGbEKU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779993548; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=1BN6G/rgB9O80LfDMRyXKYCm7YGnt9QXu63DWzyvDnA=; 
	b=gsPK4hJfVIbFf907QbVPrdYnBMA6PTmSGweNnHBQS8jR/3Ka25X7BCTkuvCMDPtFO1+q/crjftoncfjtx02FDOZQuuNs2jZyMAKB8ki93NWbV1auTM9O/HViWrdLpaEKwyZ1wQuxfmIV4IIJms0fgcyWDxKYWjemKn131UfRSY8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779993548;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=1BN6G/rgB9O80LfDMRyXKYCm7YGnt9QXu63DWzyvDnA=;
	b=mm7wiFpKeewwaioEPbFQF7Ua6SrD4FD8LTRLdBnG9uRgXDR0c8uKbohbH///1H27
	jOAgtZAIkjVU2FDavyWpU8oY/7THc/i9JjevxojVn+DS8EUubOGNvEspkRK0VLkxuKR
	dXXiUorHFnkU21HGfDhylRGAy6WI9H5BU9qqa6OnE15j8pnIb9s/5SXNWos+lla/fG5
	E5QBDG7gvtPHVIISv6j+55ApWdXUpySqFWBKDy545xHhPF/GliHnO8jyhtHx8aI1aAz
	tHkMaA4U+zmTzYrq+j6ml5wpRmO6rroYbqwKbsSRWEWWA93+0OvsZgGf5kacWK7Kh38
	9+EB90oJHg==
Received: by mx.zohomail.com with SMTPS id 1779993546036502.82666565770455;
	Thu, 28 May 2026 11:39:06 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Fri, 29 May 2026 02:38:56 +0800
Subject: [PATCH v3 2/2] ALSA: usb-audio: Add quirk flag for Sennheiser
 MOMENTUM 3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-uac-quirk-get-cur-vol-v3-2-bde363188ca4@rong.moe>
References: <20260529-uac-quirk-get-cur-vol-v3-0-bde363188ca4@rong.moe>
In-Reply-To: <20260529-uac-quirk-get-cur-vol-v3-0-bde363188ca4@rong.moe>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-sound@vger.kernel.org, linux-doc@vger.kernel.org, 
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
index ac2f0f6039be..149f2009df12 100644
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

