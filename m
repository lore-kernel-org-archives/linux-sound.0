Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8041C425CE4;
	Tue, 26 May 2026 17:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779817817; cv=pass; b=EEfUihs+rFkXB6jIOKiX7T1oVW7UEE4FbVmg1MpMwYpm8EOYhUvfjuNzyVG0ncXWv9NEqrx8/rE8IgcsE8YgaxNzyb/oPRNEnFBpNRHPPphBqxaGMOggrrqA8alFOxVZUqDnza720/h4XRUdMWSQk6KeWJJ9drOVjRSKOlnfy20=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779817817; c=relaxed/simple;
	bh=b0ROzcQ3VtB84YwbZKZ0qw1/xRJ/6XotqF+vu11oUNE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rcgJHEgpxArmRARPysmFTpwbstKw69Vpo5RN1c33mzp3eSWMnGmhd7pvUsupC4knJTYu2LSbr4FXycVMdW8gnMBsye4qgWiecqTX9UxkiMgHw3+v/XO/IgJa2BQEiSKl1Nyc49mDPuYaC+Z+Jopsa+rHmxXqrZGkZu9di1IXFVQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=neZR3L+W; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="neZR3L+W"
ARC-Seal: i=1; a=rsa-sha256; t=1779817805; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=e76DZK7ACQpnAkeA5Aa86xEVJN4a1kWA+sdlqEBq3ShvNtbBbDl0loVxBVGX5teIzKAOvw527+0NUzNob6TPzAnH+2rlKN+o0CgjPRl3JL7cir7UQ/O9lQ5+Y7d3x34Nv6i9ERmit1KHYVLSYshbtHN7KQ0h8n/umcQ7MKvivvA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779817805; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=bFayXMYaHzimwR7I9/ByGMntQhbFul3MJ5lxZl5T1mE=; 
	b=bY1H4bxyCPHFXpcqTQ3oPiSDPy6UHsbhBQTx6UR1b9MuVtvDZ5uz+c8XAMAmgthebZ9aHhl90t4sYBeYFKxf/UU5pb/ktMKJjt0D3Fh0LaNng/Z3FG4NTs1Ct614ZUAGH2zs9bjmzv4Z/1IPxqzk2jbbyLPCB7iWGN0j4DpYBtc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779817805;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=bFayXMYaHzimwR7I9/ByGMntQhbFul3MJ5lxZl5T1mE=;
	b=neZR3L+WkFytTCHzefFYqdqghV0daIV0a0V9xPGcauMQVi0H324/dZzHFXEjiXRP
	nod0U+ax4xse2j1U5SSOMF4jrjR8eyUYDSEW6UIvpPQxWn1M9eq37W/ToCnpcN5Lb96
	qQedUqMQ1iyVT00/1UEK3HSSvYHYNgzmEwKy1gum1HShrkN6qeG2rNfsK8AlLMulpUk
	pfxdi4do/QdPd3lJv7GU7p2J7bgGrD//VcGMOe9e+eCyghQthU0V9P0dE9hLH1QW/Ja
	7aKN487S5B15g0kCWa827XAIQqWqzQGLZ383RyoxpVk6VGRNBeXuzmbSS3AxOSknXz3
	hDAOakIUkA==
Received: by mx.zohomail.com with SMTPS id 177981780307178.66511303424306;
	Tue, 26 May 2026 10:50:03 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Wed, 27 May 2026 01:49:25 +0800
Subject: [PATCH 3/3] ALSA: usb-audio: Add quirk flag for Sennheiser
 MOMENTUM 3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-uac-quirk-get-cur-vol-v1-3-e9362b712e5e@rong.moe>
References: <20260527-uac-quirk-get-cur-vol-v1-0-e9362b712e5e@rong.moe>
In-Reply-To: <20260527-uac-quirk-get-cur-vol-v1-0-e9362b712e5e@rong.moe>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: Gordon Chen <chengordon326@gmail.com>, linux-sound@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Rong Zhang <i@rong.moe>
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
the MIXER_SKIP_GET_CUR_VOL quirk flag, so that the mixer is usable
again.

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
index fbd44baace68..8cd8f475ec1f 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2357,6 +2357,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_FORCE_IFACE_RESET | QUIRK_FLAG_IFACE_DELAY),
 	DEVICE_FLG(0x1224, 0x2a25, /* Jieli Technology USB PHY 2.0 */
 		   QUIRK_FLAG_GET_SAMPLE_RATE | QUIRK_FLAG_MIC_RES_16),
+	DEVICE_FLG(0x1377, 0x6004, /* Sennheiser MOMENTUM 3 */
+		   QUIRK_FLAG_MIXER_SKIP_GET_CUR_VOL),
 	DEVICE_FLG(0x1395, 0x740a, /* Sennheiser DECT */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	DEVICE_FLG(0x1397, 0x0507, /* Behringer UMC202HD */

-- 
2.53.0

