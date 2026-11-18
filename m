Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794975102;
	b=KqPKRQCWYgHielwei02cnoSERbYR8n2YyLhdn7kNi8uAkmgW5gLqxFPVlaqoWUoBH/3w
	 ext4P+SKmzXlP22atNeQsXGKsNEb2UbLThImdkB3hP7Rnxa1phmNg0MSDdyfig9Ee5J7w
	 YqHpPNRGkfZeI85SvaM9UT6odU6q3AUNZI8szajBS8T4eKW1u0Mnaece2yBfBLRveCeK7
	 K7pPFhX3KxN0eTKapppsEJM8hvVdzoxqm33BX2af3OBgNNh6A59bYaOKAP/v6Tg4xFkJ6
	 XYoB6qyaOI4xInMF+3yN48AH8d2N+CR6rM3SnP4ztLjuGDc43OFn1K6hDyaCXP1aPgw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794975102;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Content-Type;
	bh=m2nozbNDRZblKhCM8xKSr0zlgP6440W/X06oo8cOr1k=;
	b=MHS79GPtCN68GvdryAEohgHCTmfSLAIpuxHQwOmXFAQle27H83D9ry2LZ0L6Jii9Ddf8
	 0lM2E0KZVzrtU0oPVJgsTKOv34eAo+WIyou6PCIJHU/7jQeI4w12M9fhhmpBwI6QtFDf2
	 m7/ZGVEY7jNpi4udG9Q14RKgMY+uqvYkzLIhANr4ntawHURakaAiGbPUVzmRaktWG6y8k
	 ObQjqbI94VsFljBxdLn2S2TF8RgI2hLdm+jpNn44bS0WMo5VRu+Bsf3NEhhS4TxZ8Jcha
	 AouO2I9hjZaDxf6ktKW+L5Q2rEir/zJztNCLxGxUBHpFDM95bcaQKMvvSQS+InhPGCA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W9XGeHte;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.178
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517A0606A31C
	for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 04:11:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 517A0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W9XGeHte
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5ee1e4e3abcso146795e0c.1
        for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 20:11:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794975101; cv=none;
        d=google.com; s=arc-20260327;
        b=adiG4u5ekPnhpXqbKSFXj3jBOAxtk7HXhANuLCWewFY7Uk4iFn9pMei5/TaIUXYBwO
         A7rikDSzEG50TrLw1BfKAFLFev3bWxhIMC/IhNJYJE6S46MEQUjsPrqkMzsIbugOgeMm
         +jHRYszR3EGluyt2kzzqeo9ahMh30iu+UNs46sC4+Em2evFVY51rceaawq24F4ftITDV
         So9zOZoUbl46/15468L4wz2g1zJYxUXbh+8cmB3FA0TD44B9BMxda/5PQRJAkpcHV+KJ
         TvLyfEGkCX7AqNWvktlD2j18fO8Fp4BnjNu5xQ5SEdTfC3B9UDlezalObriPiNIyyc2E
         IjrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=m2nozbNDRZblKhCM8xKSr0zlgP6440W/X06oo8cOr1k=;
        fh=kpr3ikDI9t/iP00V5GxYhsBExhJhFddqJGY75LSRDmw=;
        b=sYAjLLStU9XUXxqJODFOVidIxjnhhDF5rem3kyG5Z0QusYvNeTcVyMuMB5FgWd3vfo
         RorW72z0gghOdTDIVxGJusQeuR62+TsAgmXEDRSXKzMPkkIywZJa9qw60dNscMkjz1ID
         qpwtMUSD7kqXmdeMSsuMHSeNxndIPTxq/cWQ9L7ANmngAAn2R3OO7tkF79vp/k0+T02J
         d1p18tl2qRT1utEYVjlW/DEfPjxj2R14Tw/xK46AYBh0JSrXmvCAy+BdtXgcg1YkfHAz
         gLCYeNs12XlvjChZMHY0e4OROZO5CcXI5pEcKTzge4CVVM33mpBTtEcRbRLZIjzactcZ
         BUjg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794975101; x=1795579901; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m2nozbNDRZblKhCM8xKSr0zlgP6440W/X06oo8cOr1k=;
        b=W9XGeHteB9vcS+cNoWkebuvrhRGMEYYUsDqdWlE103dGRATfz1B0SF5wCq0/w+cMu3
         NQDQdd9pJ8X6b5ISEY4tG1juDnkvUY9A10ryT3a+g8Gz2cZgoElmMAe1QzPzDrQWeg+I
         UjSNfzHUj0XTOLu62EGHAZfIBLHbtC2SJMangSV7mz98V00Bkx2JO/Tlcs8iY3i+qP46
         Zac4Nf1Bj0eoXJ431gWh6wofUqcttKRa/QTFYpwTJNT/NhIetcVW3wlegzR+eaamnWd3
         WBRu+Iw0ej/eB3lRpOHfVuuiDXOqjuaggr/b97OpoGW8hS65kAhUIa1VcHL5NenKrrUP
         888g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794975101; x=1795579901;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m2nozbNDRZblKhCM8xKSr0zlgP6440W/X06oo8cOr1k=;
        b=PkyI1NCFyqQaAPe7L/J403GB9yxrKRhvYmT2RVg3wVDDOUEVNWVyvsHb9vH3jsLmLX
         QDoaRPdnMpa5gUzZfaL6x2ljzFU2IkMKFSxndED54rnl/89jVgn8Cs442bKz5ewWJhpW
         H6n7tfq8W75bF+VZY+ODyunJNroUFIVZuM23le3XmZnKyO3nFVgmfm8f6rT/0R6V5TZg
         1nrCZ1X/gf6wGT2J8UeSiP21nOsow0wOfB2xV97onwZwqjs2sKG2Ql+fuyuBtGsLLcnq
         OrA9ATZAjBT8zzhPLbPwzTEVsO05deYx4Cq6ZtUnAdtP1LvLS46oTVr9K9FkENmBXgOo
         9p8w==
X-Gm-Message-State: APuU4Z8mMl6rw9Z5ngNGdPrPgOFnb2BAiLKLqOsWKuvqv8YFK0FeafGR
	2A+sxkODR/QOz6Gq4uQdVF7Iq2GUf1SFR1h6cukTZAk7Thhe5KNSVqt9QmKeDoDApRxsQnYF6XD
	yuqTayi/9hNPZh3E6wSqqfWxtar1gJ9k8aQ==
X-Gm-Gg: AYBFou3FNJ2U0OcWv6q+8BcbluRcI2W4nHX/1uVu8jk9kP+49zlsFMHhTl943ehgy5X
	d6QV4UgRYzRjEATLbpvrxbHOt5DSVeJfOxMSc5OkNUqfByMr/ZD+InPfiT/7ZY53JzzEzue4Kvw
	UcYxGr3+pbvdNdrAyXOSUWFhWwQ6nMxoTsLlIE2ALfQKVOUln+9blnSPom9e+lXiS1NYB73+f+v
	KNVRrezgTYt1iGmJqe4CDFw18Lh6v5G5wsHNJoy9ZsUuljUdbkOTY3r0tl+c+0HiNsheXPlCOoj
	nEyo689zQKSb3pI64i+js9htYQHCdtifCiYesZ+NDyqDaNvvMv8FD3PwFIwTwHQ1kUCVo+ssoU0
	kXzs0Bc3x6BcLXAKV20WiieZEBshOVPzrrcvUDHbbukKIvMVcbdci6rQFZznHaHqXX2ntXg==
X-Received: by 2002:a05:6122:8b1a:b0:5ea:91d2:32f8 with SMTP id
 71dfb90a1353d-5ee646ae512mr709711e0c.8.1794975100961; Tue, 17 Nov 2026
 20:11:40 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAPDzCUsFNQPMox2GDKnkhKreByWBo59Zp9Dc3+e0NnQKtBECKg@mail.gmail.com>
In-Reply-To: <CAPDzCUsFNQPMox2GDKnkhKreByWBo59Zp9Dc3+e0NnQKtBECKg@mail.gmail.com>
From: Alan Rockefeller <alanrockefeller@gmail.com>
Date: Tue, 17 Nov 2026 20:11:29 -0800
X-Gm-Features: AclHuK-udGMmVRFVRPysTB4Gn-StwA9ZLR8_KrjS77vCRi_i_H9bSWmryYtc5W8
Message-ID: <CAPDzCUta6FOAVR1rVJjYrsTdqNKvU-OTh=1UnjC1vn4vJu2rXA@mail.gmail.com>
Subject: Fwd: ALSA: usb-audio: Elgato Wave:3 (0fd9:0070) control endpoint dies
 after repeated SET_RES at probe
To: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Linux-Sound!

The Elgato Wave:3 USB microphone (0fd9:0070, bcdDevice 1.02, UAC1,
full speed) is unusable on my laptop with 7.2.15: it enumerates, but
its control endpoint stops answering during snd-usb-audio's mixer
probe, and every control transfer after that times out until the
device is replugged. The same code is still in 7.4-rc3.

Kernel log on plug-in (excerpt), stock driver, no quirks:

usb 1-3: new full-speed USB device number 5 using xhci_hcd
usb 1-3: New USB device found, idVendor=0fd9, idProduct=0070, bcdDevice= 1.02
usb 1-3: Product: Elgato Wave:3
usb 1-3: 5:0: failed to get current value for ch 0 (-110)
usb 1-3: 6:0: failed to get current value for ch 0 (-110)
usb 1-3: 6:0: cannot get min/max values for control 2 (id 6)
usb 1-3: [6] FU [Mic Capture Volume] ch = 1, val = 0/1/1
usb 1-3: 1:1: usb_set_interface failed (-110)

The last line then repeats every 5 seconds for as long as userspace
keeps trying to open the PCMs. WirePlumber sits in D state in
usb_control_msg() while it does, so wpctl hangs as well.

What usbmon shows
-----------------

Control transfers to the device, starting at SET_CONFIGURATION
(status is the URB status; -32 = STALL, -2 = killed after timeout):

t(s) took(s) request wValue wIndex len status data
0.0000 0.0001 SET_CONFIGURATION 0x0001 0x0000 0 0
0.0002 0.0001 SET_INTERFACE 0x0000 0x0001 0 0
0.0003 0.0001 SET_INTERFACE 0x0000 0x0002 0 0
0.0004 0.0001 GET_CUR 0x0100 0x0500 1 0 00
0.0005 0.0001 GET_MAX 0x0200 0x0500 2 0 00 00
0.0006 0.0001 GET_MIN 0x0200 0x0500 2 0 00 c4
0.0007 0.0001 GET_RES 0x0200 0x0500 2 0 80 00
0.0007 0.0002 SET_RES 0x0200 0x0500 2 -32 40 00
0.0009 0.0001 SET_RES 0x0200 0x0500 2 -32 40 00
0.0011 0.0002 SET_RES 0x0200 0x0500 2 -32 40 00
0.0012 5.3463 SET_RES 0x0200 0x0500 2 -2 40 00
5.3475 5.1209 GET_RES 0x0200 0x0500 2 -2
10.4684 5.1190 GET_CUR 0x0200 0x0500 2 -2
15.5875 5.1200 GET_CUR 0x0200 0x0500 2 -2
20.7075 5.1210 SET_CUR 0x0200 0x0500 2 -2 00 c4
25.8285 5.1190 GET_CUR 0x0100 0x0600 1 -2
30.9474 5.1210 SET_CUR 0x0100 0x0600 1 -2 01
36.0685 5.1190 GET_MAX 0x0200 0x0600 2 -2
41.1882 5.1193 GET_DESCRIPTOR 0x0305 0x0409 255 -2
46.3075 5.1201 GET_DESCRIPTOR 0x0305 0x0409 2 -2

(This trace was taken with quirk_flags=0fd9:0070:skip_iface_setup,
which is why the probe-time alt 1 / sample rate setup is missing. The
kernel log is the same with and without that quirk.)

So for the first volume control (feature unit 5, PCM Playback Volume):
GET_RES returns 0x0080, the UAC1 resolution probing in
get_min_max_with_quirks() asks for 0x0040 with SET_RES, and the device
STALLs it. snd_usb_mixer_set_ctl_value() retries (its loop of 10 only
stops early on -ETIMEDOUT), the device STALLs twice more, and the
fourth SET_RES is never completed. From that point ep0 is dead for
everything, including standard GET_DESCRIPTOR requests, although the
firmware is otherwise alive (the LEDs still respond to the dial).
Only a power cycle brings it back, and the next probe kills it again.

The three STALLed GET_DESCRIPTOR(DEVICE_QUALIFIER) requests during
enumeration do no harm, so it seems to be specifically a STALLed
control-OUT with a data stage that the firmware cannot take
repeatedly.

What I tried
------------

- quirk_flags=0fd9:0070:get_sample_rate|ctl_msg_delay|ignore_ctl_error:
same failure with the same timing in the log (no usbmon trace of
that run), so spacing the messages 20 ms apart does not seem to help.
- quirk_flags=0fd9:0070:skip_iface_setup: no change (trace above).
- Two different USB-C ports. Both are root ports of the same xHCI
controller; the mic is connected directly, no hub.
- Not sending SET_RES to this device: fixes it. With the change below
on top of v7.2.15 the device probes with no failed control transfer
other than the device qualifier STALLs, the mixer ranges are read
correctly (Mic Capture Volume 0..10240, PCM Playback Volume
-15360..0), and capture works.

--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -1361,7 +1361,8 @@
(cval->control << 8) | minchn,
&cval->res) < 0) {
cval->res = 1;
- } else if (cval->head.mixer->protocol == UAC_VERSION_1) {
+ } else if (cval->head.mixer->protocol == UAC_VERSION_1 &&
+ cval->head.mixer->chip->usb_id != USB_ID(0x0fd9, 0x0070)) {
int last_valid_res = cval->res;

while (cval->res > 1) {

That is only what I tested, not a proposal for the final form. I do
not know whether you would prefer a quirk flag that skips the SET_RES
probing for this device, or to stop retrying a SET request that was
answered with a STALL (-EPIPE) in snd_usb_mixer_set_ctl_value() in
general, since here the retries are what kills the device.

Other notes
-----------

- An alsa-info from someone else's Wave:3 with the same bcdDevice on
5.13 shows sane mixer ranges with the resolution still at 128, so
SET_RES was presumably rejected there too without killing ep0:
https://www.google.com/url?q=https://answers.launchpad.net/ubuntu/%2Bsource/alsa-driver/%2Bquestion/700762&source=gmail&ust=1795056035295000&sa=E
That mic was behind two hubs and mine is directly on a root port. I
cannot tell whether that is the difference.
- The Elgato Wave XLR (0fd9:007d) is reported to show the same log
signature. I do not have that device:
https://www.google.com/url?q=https://github.com/gleem-gg/crossfade/issues/29&source=gmail&ust=1795056035295000&sa=E

Setup
-----

Kernel: 7.2.15 (Arch-based distro build, 7.2.15-1-omarchy). The
patched module was built from vanilla v7.2.15 sound/usb.
Host: Dell XPS 17 9700, xHCI 8086:06ed (Intel 400 Series PCH)
Device: Elgato Wave:3, 0fd9:0070, bcdDevice 1.02, bcdADC 1.00
FU 5: playback mute + volume (master)
FU 6: mic mute + volume (master)
iface 1 alt 1: playback, S24_3LE, 2 ch, 48000/96000
iface 2 alt 1: capture, S24_3LE, 1 ch, 48000/96000
Session: PipeWire 1.6.9, WirePlumber 0.5.18

I am happy to test patches, and can send the full usbmon captures
(with and without the change) and lsusb -v output.

The debugging was done with the help of an AI coding assistant
(Claude Code w/ Fable 5.2 xhigh).   Opus 5.5 / high gave up and said
it was unfixable. The logs, traces and test results are from my
machine.

Thanks,
Alan Rockefeller
