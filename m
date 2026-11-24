Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.166
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795547144;
	b=jNbx01UBC+knu83CPJnpiP8RaLnohw7EoC1IZBFltmazkV/o4qNUoj2dVY6kKPPRoRUK
	 oEPzolfwKHBX1GmCcQPh4aCBdyJSMP590qBnI4Pa/cbxRlip2ccmJGBzpDyQ5Qwf4OTTa
	 VhXahsqR7w9Ctl6L/zkZYlm/V09stCCI3MDCAiyWeqzfv80z4dqymaQ/e4qyzRE6d4SsZ
	 BStKbQnbCwcDoUTcV8aDCbBADGPUh9YN/eIRkr2txLtSC3bo167DLKiNFq7t9z3LYzsfs
	 f/ekYYMEw5kLlCeXEO2FE93nBOsa7fZKN+R+PmCK0eRUYUlLzVeW4i18iD/4+ZemYXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795547144;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=RFfea+IHGVmzKdkFnPPS3Pp9oLSpOcYuIHFZgjqa3bI=;
	b=zOYKxuaeFCQpr+fxuvmUyUUHfP67Gb6LUW0StNY8ebtJowxi8MxFPAia4wJlt2WDD6N0
	 j6DNLZVREHU9nD3Q++F4ytcIb8eEz8Bq1f3e/enyL74Rb8Ibt2GnXfoDxVnDS2BNcWzAg
	 pk7hHO+MOO7lJRLZLrfhE7oOw2mL0q/kGAZUXWU0FrEhG6UI5y0UfTK1esi+J0lMQNLXk
	 Vf7ZULryL/wy6psHF8V/3vYt4PqKLAnIFft6OLCFHl3gHrSzDTgwYI+dsnriPQecxmSyL
	 iv9mo5ytNgDVuLy2CPM0r6G0dnV3+foQccHP6BPImM8WjVtBG1TJ0j5udZCXpeyygUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=fIdLUlBk;
	arc=none smtp.remote-ip=185.70.43.166
Received: from mail-43166.protonmail.ch (mail-43166.protonmail.ch [185.70.43.166])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039C2606A330
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 19:05:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 039C2606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=fIdLUlBk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1795547139; x=1795806339;
	bh=RFfea+IHGVmzKdkFnPPS3Pp9oLSpOcYuIHFZgjqa3bI=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=fIdLUlBkWCPKkushIT6gzCMGEN65WaDgFKeKeQYz585wnr2Q+vIx2S/fphVZYAbna
	 kncIC8tOpUqOdMX34a/ECYI/lxyv6QD2E2pBYAHAvGfVvf4Q1UlBA12/4+QDzH9Jt4
	 X9vcSdhEtSuX6IXSNuaLTh8VrIDWIzYImNNvrNnIgkvZwZpm1/aM+KdZ255dNNi+YA
	 XAWhR4Yp2sN+9ncwxJ6q26n9VWL9r9arzRDW+Dh7upwAHar8+Iq8HJoo9Jlh9u3T9m
	 q6/aaV4YgM2UWHufrrVtTsYZjPSsZ9/6oRrJ6crlg7rk7Mhy7djw0MtU3nfr3mj/Ql
	 Wh05rKKSg8kTw==
Date: Tue, 24 Nov 2026 19:05:34 +0000
To: "shenghao-ding@ti.com" <shenghao-ding@ti.com>, "tiwai@suse.com" <tiwai@suse.com>
From: arjensk <arjensk@proton.me>
Cc: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, "baojun.xu@ti.com" <baojun.xu@ti.com>
Subject: [BUG] ALSA: hda/tas2781: ASUS Vivobook 16 Flip TP3607SA (1043:3e30) speakers ~40 dB quieter than Windows with DSP firmware loaded
Message-ID: <CqGQP7-3MsVQ0sJpakR2j3WRZviAbn9-QdEPbhfQMXfiTduxL7hLeh7BluQGHQibUEtga9PGrCh-u1WP4mT22wZKh9Ug5O37pMCYZGelf0s=@proton.me>
Feedback-ID: 237200016:user:proton
X-Pm-Message-ID: c34216f2b2c6c01a49439c4e818b525310446105
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

On the ASUS Vivobook 16 Flip TP3607SA (PCI SSID 1043:3e30, ALC294 +
2x TAS2781 on i2c-TIAS2781:00) the internal speakers work with the
TAS2781 DSP firmware loaded, but the output is roughly 40 dB quieter
than on Windows on the same machine. Recordings with a phone at the
same distance and 100% system volume gave about -17.5 LUFS on Windows
and about -57 LUFS on Linux.

System
------
- Kernel: 7.0.0-30-generic (Ubuntu 26.04 LTS)
- linux-firmware: 20260319.git217ca6e4 (Ubuntu package)
- BIOS: TP3607SA.307 (12/18/2025), Secure Boot enabled
- Audio: Intel Lunar Lake-M HDA [8086:a828], SOF 2.14.1.1,
  topology sof-hda-generic-2ch.tplg
- Codec: Realtek ALC294, subsystem 0x10433e30
- Quirk in use: SND_PCI_QUIRK(0x1043, 0x3e30, "ASUS TP3607SA",
  ALC287_FIXUP_TAS2781_I2C)

Issue 1: firmware file name (no speaker id)
-------------------------------------------
The speaker id GPIO is not available:

  tas2781-hda i2c-TIAS2781:00: Get speaker id gpio failed -2.
  tas2781-hda i2c-TIAS2781:00: Direct firmware load for TAS2XXX3E30.bin fai=
led with error -2
  tas2781-hda i2c-TIAS2781:00: tasdevice_dsp_parser: load TAS2XXX3E30.bin e=
rror
  tas2781-hda i2c-TIAS2781:00: tasdevice_prmg_load: Firmware is NULL

linux-firmware only ships TAS2XXX3E300.bin and TAS2XXX3E301.bin. Without
firmware the speakers are completely silent. After adding a symlink
TAS2XXX3E30.bin -> TAS2XXX3E300.bin the DSP firmware loads (the
"Speaker Program Id" / "Speaker Config Id" controls appear) and sound
works. Both files contain the same tuning name
"TP3607_sterero_241225_beta21_ISLR100" with a single configuration
"Tuning Mode_48 KHz". 3E300 and 3E301 sound equally loud.

Issue 2: output ~40 dB too low with DSP firmware loaded
-------------------------------------------------------
Everything I can check on the Linux side is at maximum:

- ALSA: Master/Line Out/Pre+Post Mixer Analog at 0 dB,
  "Speaker Analog Volume" =3D 20/20
- Changing "Speaker Profile Id" (0..2) or "Speaker Config Id" (0..1)
  makes no measurable difference (within 0.5 dB, measured with the
  internal DMIC and a 1 kHz tone)

TAS2781 registers read with i2cget during playback (book 0):

  amp 0x38: p0 02=3D0x00 03=3D0x28 08=3D0x09 09=3D0x02 0a=3D0x1a 0b=3D0x28 =
0c=3D0x10
            0d=3D0xf3 0e=3D0x02 0f=3D0x00 16=3D0x40 1a=3D0x00 5c=3D0xd9 60=
=3D0x21
            p1 17=3D0xc8   p4 30..33 =3D 00 00 00 01
            p8 18..1b =3D 00 00 00 00   p8 28..2b =3D 40 00 00 00
            pA 48..4b =3D 00 00 00 00   pA 58..5b =3D 40 00 00 00
  amp 0x3d: same, except 0a=3D0x2a 0d=3D0x93 16=3D0x44

So the amplifier level is at 21 dBV, the digital volume at 0 dB and the
volume coefficient at unity. The attenuation therefore seems to come
from the DSP program/tuning itself or from how the calibration data is
applied.

Factory calibration exists in UEFI (88 bytes after the attribute word):
  CALI_DATA-1f52d2a1-bb3a-457d-bc09-43a3f4310a92
No calibration error is logged. "wrong sinegaini" (from the low-volume
workaround for low calibrated impedance) is not logged either.

I could not enable dynamic debug for the driver because of kernel
lockdown (Secure Boot).

For reference: a community workaround for this model that resets the
amps over I2C and runs them without the DSP is reported to play at full
volume:
https://gist.github.com/rraks/4edddb99b50b94fe6298adbf3c9f43eb
I have not applied it because it bypasses speaker protection.

Questions
---------
1. Is TAS2XXX3E300.bin/3E301.bin the right tuning for this machine, and
   which one should be used when the speaker id GPIO is missing?
2. Could the calibration data or the tuning cause this level of
   attenuation? Is there something I can test, or a hexdump of the
   CALI_DATA variable you would like to see?

I am happy to test patches.

Thanks,
Arjen

