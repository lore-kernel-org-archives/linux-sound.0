Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F89B35A3AD;
	Mon,  4 May 2026 11:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777894742; cv=pass; b=Q9xGg7/2nXxXkaL/PE7QAXVt8nY3nph7F+/A+0RbPMOKN/wgvAkS2pUId9K3dT3Yvfx4DQcNPqoydJ0lEmrWVMXPM8rDs118dsDqeCppESvRlh87nQzX9dH1iNpGtrbsSyqWdDzHL8N1NKoyn6tMlgWtK+NodsKLhV30p8vcixI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777894742; c=relaxed/simple;
	bh=1KM6bSbKQmVr7ws4NZhO9j4iKY0DtiiPShk2NmShw7E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hvDHpAW/hvhPRvQICqsM7FkrFg9/KCAySiTQHyUQXJrmjdqz1xfBiAtTI4riknvTBznKAxa+1Tjwc98Fak4sB109ogqU/xvzY+iuHK+RUx744+exQAQpkGUPechJ4hYlSgF4cv4HVIf0eiV2cPK2Xo12PRB3iPgZxeu9amuGC5g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=O7LLvqpC; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="O7LLvqpC"
ARC-Seal: i=1; a=rsa-sha256; t=1777894726; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UlJaQ0GPs2fFd4jrh4vR9dOJaqjR/r1sTNu9rGCm1hRBDZIM+WByWpKltnv5sCY/L2PH8vrkMlujT8OlZPQ78vtfjwTJ1ImHvSxpyBAKG4qLjjZLkuZOydC8c6FDxEwY4qf3kDOYRH1rFF6sSlSN3x+tjax6toPxGVmJ3FcTzw0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1777894726; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=NXbLAAo9trVGVR5bttMGHAI1QfndQ1IHx7Y9sM/y180=; 
	b=ilH/Sj+6KG+qliF7vtfwClEmgobKUBysmk496fcVnGysZxtaNRBE2tF3KC6phEECATNCx+Dz5Jr7YIUOnhpklMFSxHH5EbyScPFjZ4p+tinC0h5JbFS8oyHDwBQPS5xp8BQSt/J3uEZM21MZfFQo33Ov+TjijR7BSHZSfVlvphY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1777894726;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Cc:Cc:Reply-To;
	bh=NXbLAAo9trVGVR5bttMGHAI1QfndQ1IHx7Y9sM/y180=;
	b=O7LLvqpC4V6zEq5iOAd4+10cH8YTODZHvyFGkG5jJT+R7LjUJpHebloYQ50HRyBs
	ojHH/z8TNS6OzKYGK/VmefE/LevejPowBSEl2a58+qUI3mErUeki5SGUQwvt0GUkSwj
	UlJvbLlvDHnpAe9owWiHCdfSe9+jjt6cVqCuDWK6WPJtlW7FhJl6+SsSVUiyVpVcjnz
	+GYuiHQQI6Z+1mPtqNy3q7ZPJxjpZRn8s2RqVdbteb1z/N4tNt1FCM1QS5BcK1/U+Xt
	JjRYjiuvnB9sIDXs9GINkhwTYNd0sruUfLfvGbpL3mBTcDi3nnttxBLVJTaGOrr68rN
	jFaTX6PwmQ==
Received: by mx.zohomail.com with SMTPS id 1777894724429561.8846944103783;
	Mon, 4 May 2026 04:38:44 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Mon, 04 May 2026 19:38:05 +0800
Subject: [PATCH] ALSA: usb-audio: Add quirk flags for JBL Pebbles
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-uac-jbl-pebbles-v1-1-c888d592a286@rong.moe>
X-B4-Tracking: v=1; b=H4sIAByF+GkC/yXMQQqEMAxA0atI1gZa0SpzFXHR1qgRUWlUhOLd7
 cws3+L/CEKBSeCTRQh0sfC2Jug8Az/ZdSTkPhkKVRhVqRJP63F2C+7k3EKCda8bU2tjbakhVXu
 gge/fse3+ltPN5I/vBp7nBcmZweJzAAAA
X-Change-ID: 20260504-uac-jbl-pebbles-7d186716aa41
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Rong Zhang <i@rong.moe>
X-Mailer: b4 0.16-dev-7777e
X-ZohoMailClient: External

JBL Pebbles is a pair of desktop speakers with UAC interface. Its
Playback and Capture mixers use linear volume with val = 0/999/1 and
0/3996/4. Meanwhile, the reported sample rates are truncated to
multiples of 0x100 (i.e., 44100 => 44032), resulting in noisy kmsg, as a
warning message is printed each time a stream is opened.

Add a quirk table entry matching VID/PID=0x05fc/0x0231 and applying
linear volume and sample rate quirk flags, so that it can work properly.

Also note that the volume control knob on device is an incremental
encoder. It does nothing but sends KEY_VOLUMEUP and KEY_VOLUMEDOWN per
rotation, controlling the UAC Playback volume mixer indirectly. Hence,
the linear volume quirk flags also enable the volume control knob to
function properly.

Quirky device sample:

  usb 5-1.1: new full-speed USB device number 12 using xhci_hcd
  usb 5-1.1: New USB device found, idVendor=05fc, idProduct=0231, bcdDevice= 1.00
  usb 5-1.1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
  usb 5-1.1: Product: JBL Pebbles
  usb 5-1.1: Manufacturer: Harman International Industries
  usb 5-1.1: SerialNumber: 1.0.0
  usb-storage 5-1.1:1.0: USB Mass Storage device detected
  scsi host0: usb-storage 5-1.1:1.0
  usb 5-1.1: Found last interface = 1
  usb 5-1.1: 2:1: add audio endpoint 0x5
  usb 5-1.1: Creating new data endpoint #5
  usb 5-1.1: 2:1 Set sample rate 44100, clock 0
  usb 5-1.1: current rate 44032 is different from the runtime rate 44100
  usb 5-1.1: 3:1: add audio endpoint 0x84
  usb 5-1.1: Creating new data endpoint #84
  usb 5-1.1: 3:1 Set sample rate 44100, clock 0
  usb 5-1.1: current rate 44032 is different from the runtime rate 44100
  usb 5-1.1: [2] FU [PCM Playback Switch] ch = 1, val = 0/1/1
  usb 5-1.1: Warning! Unlikely big volume step count (=999), linear volume or wrong cval->res?
  usb 5-1.1: [2] FU [PCM Playback Volume] ch = 2, val = 0/999/1
  usb 5-1.1: [5] FU [Mic Capture Switch] ch = 1, val = 0/1/1
  usb 5-1.1: Warning! Unlikely big volume step count (=999), linear volume or wrong cval->res?
  usb 5-1.1: [5] FU [Mic Capture Volume] ch = 2, val = 0/3996/4
  input: Harman International Industries JBL Pebbles as /devices/pci0000:00/0000:00:08.3/0000:67:00.3/usb5/5-1/5-1.1/5-1.1:1.4/0003:05FC:0231.0018/input/input55
  hid-generic 0003:05FC:0231.0018: input,hidraw2: USB HID v2.01 Device [Harman International Industries JBL Pebbles] on usb-0000:67:00.3-1.1/input4

Signed-off-by: Rong Zhang <i@rong.moe>
---
 sound/usb/quirks.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 0b4ecc2c6bcc..3a4caec3f8ff 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2277,6 +2277,9 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_ALIGN_TRANSFER),
 	DEVICE_FLG(0x05e1, 0x0480, /* Hauppauge Woodbury */
 		   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
+	DEVICE_FLG(0x05fc, 0x0231, /* JBL Pebbles */
+		   QUIRK_FLAG_MIXER_PLAYBACK_LINEAR_VOL | QUIRK_FLAG_MIXER_CAPTURE_LINEAR_VOL |
+		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	DEVICE_FLG(0x0624, 0x3d3f, /* AB13X USB Audio */
 		   QUIRK_FLAG_FORCE_IFACE_RESET | QUIRK_FLAG_IFACE_DELAY),
 	DEVICE_FLG(0x0644, 0x8043, /* TEAC UD-501/UD-501V2/UD-503/NT-503 */

---
base-commit: 6d35786de28116ecf78797a62b84e6bf3c45aa5a
change-id: 20260504-uac-jbl-pebbles-7d186716aa41

Thanks,
Rong

