Received: from mx.brightberry.eu (mx.brightberry.eu [185.229.55.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3733621ADC7
	for <linux-sound@vger.kernel.org>; Fri,  1 May 2026 17:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.229.55.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777658211; cv=none; b=TYjadMAhYuVHqiE1AnMjAtYH2iw5eo9R2LusqtZAaZoC0A70XWW/nLdL2qfyKSE8v7wQQ1O+Ql5fIQPLoIIPF/7KkKVbDfxJcwFP1VrlcvxBImUOB8EeStASKBwWMXWIBSzkC836blBWULvXoGl61VV5DZXXcrIpwWr3Qq+xPjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777658211; c=relaxed/simple;
	bh=QWBXXwbuDrwOrSYq7WJWVSKkBCHPaQ9kqB9p6dp8hZE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=iUkpznwj5Tbj46NIEZZNiqvTbH0F6yPOx0xk+nJ/f/l0ZDWOEOLfHu1ARKrFRpQMR0nT2FLBykjWF4MJtqmHny4QzxPzT8hTz0n8y1gOfUhNrHk7pSGXFdBy0u9ezJlJOgfJumWpbj9qd6BlEpISrVWFgTrqipPVD0gXjoKvlko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vanraaij.eu; spf=pass smtp.mailfrom=vanraaij.eu; arc=none smtp.client-ip=185.229.55.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vanraaij.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vanraaij.eu
Received: from mx.brightberry.eu (localhost [127.0.0.1])
	by mx.brightberry.eu (Proxmox) with ESMTP id 01DBC594A;
	Fri, 01 May 2026 19:56:47 +0200 (CEST)
Received: from bug-report.eml (YST00841.fritz.box [192.168.178.64])
	by mx.brightberry.eu (Proxmox) with ESMTP id D5A3712D1;
	Fri, 01 May 2026 19:56:46 +0200 (CEST)
From: =?UTF-8?q?R=C3=A1mon_van_Raaij?= <ramon@vanraaij.eu>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>, Shenghao Ding <shenghao-ding@ti.com>
Subject: [BUG] ALSA: hda: snd_hda_scodec_tas2781_i2c: DSP firmware silently fails to load at cold boot (Lenovo Yoga Pro 9 16IMH9)
Date: Fri, 01 May 2026 19:56:33 +0200
Message-Id: <20260501175633.bug1-ramon@vanraaij.eu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Machine:  Lenovo Yoga Pro 9 16IMH9 (board SSID 83DN)
Kernel:   7.0.3-zen1-1-zen (linux-zen)
Codec:    Realtek ALC287, subsystem ID 17aa:38d6
Amps:     4x TI TAS2781, ACPI HID TIAS2781, I2C bus i2c-4
          (I2C controller: PCI 0000:00:15.2, Intel Designware)
Fixup:    ALC287_FIXUP_TAS2781_I2C (applied correctly via HDA_CODEC_QUIRK 17aa:38d6)

PROBLEM
-------
At cold boot the built-in speakers produce ~10-15% of normal volume.
The TAS2781 amplifiers are powered and the HDA component bind succeeds:

  snd_hda_codec_alc269 ehdaudio0D0: bound i2c-TIAS2781:00
      (ops tas2781_hda_comp_ops [snd_hda_scodec_tas2781_i2c])

However, the DSP firmware (TAS2XXX38D6.bin) is not loaded. The ALSA
control "Speaker Force Firmware Load" -- which is only registered after
a successful firmware load inside tas2781_hda_comp_bind() -- is absent:

  $ amixer -c sofhdadsp cget name="Speaker Force Firmware Load"
  amixer: Cannot find the given element from control sysdefault:0

No error is logged to dmesg. The driver continues without DSP calibration
data, leaving the amplifiers at uncalibrated default gain.

The issue does NOT occur after S3 suspend/resume. After resume, a
modprobe -r / modprobe cycle restores full speaker volume.

ROOT CAUSE
----------
The BIOS initialises the TAS2781 amps during POST and leaves them in a
hardware state incompatible with the kernel firmware load sequence. The
request_firmware_nowait() call in the bind path silently fails when called
against hardware in this BIOS-initialised state.

Critical observation: a PCI-level power cycle of the I2C controller
(0000:00:15.2) reliably resolves the issue:

  echo 1 > /sys/bus/pci/devices/0000:00:15.2/remove
  sleep 2
  echo 1 > /sys/bus/pci/rescan

After this sequence ACPI gates the I2C controller power rail (D3cold),
resetting the TAS2781 amps to factory state. On rescan, i2c_designware
and snd_hda_scodec_tas2781_i2c re-probe, DSP firmware loads, and
"Speaker Force Firmware Load" appears in amixer.

A plain modprobe -r / modprobe cycle WITHOUT the PCI power cycle does
NOT fix the issue, confirming this is a hardware state problem, not a
module loading or firmware subsystem timing race.

WORKAROUND
----------
The following systemd service (After=sound.target,
Before=display-manager.service) reliably restores correct volume on
every boot. It must run before PipeWire opens the device; hot-removing
the PCI device while WirePlumber has an active ALSA handle causes a
SIGSEGV in snd_hctl_elem_get_interface (libasound).

  [Service]
  Type=oneshot
  ExecStartPre=/bin/sleep 2
  ExecStart=/bin/bash -c 'echo 1 > /sys/bus/pci/devices/0000:00:15.2/remove'
  ExecStart=/bin/sleep 2
  ExecStart=/bin/bash -c 'echo 1 > /sys/bus/pci/rescan'
  ExecStart=/bin/bash -c 'modprobe snd_hda_scodec_tas2781_i2c || true'
  ExecStart=/bin/sleep 5
  RemainAfterExit=yes

SUGGESTED FIX
-------------
The driver should detect a failed firmware load in tas2781_hda_comp_bind()
and either:

  a) Perform a hardware reset sequence on the TAS2781 amps (e.g. via an
     ACPI power state transition on the I2C controller) before retrying, or

  b) Schedule a deferred retry after the firmware subsystem has fully
     settled, with a fallback hardware reset if the retry also fails.

The fix should live in tas2781_hda_comp_bind() or the
request_firmware_nowait() completion callback in
snd_hda_scodec_tas2781_i2c.

Signed-off-by: Rámon van Raaij <ramon@vanraaij.eu>


