Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262A8125A0
	for <linux-sound@vger.kernel.org>; Sun,  8 Feb 2026 17:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770573007; cv=none; b=oOTNlIGI7t1t2eyTudDT9Dqe8+5bXExtJ+cRtRnC0vAlMS5hgIWz+Mrbkh3q9nKWpJbCkYJunvPzHl4l3+fu7S+Cp6zcrkhDbaIUe5qkQCficbI655gzpyF2+qjw/b0IGCp+c14p/mZAkA+1MqfgoX9bbvWIV2QRM0x9Fb8eFu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770573007; c=relaxed/simple;
	bh=EctLHP7Y9FGNtVzwxuoveT0LSGOKnwsFl8zEY/JziV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mIKE0ncSI2aYKtWdZMBakoYH57rnhX6NyKsiKxM0EfQzbTHPSuZzNM6zdpwttp4f/x93bKF4IDgeClDW9UVs2sqxMixDwCY0M2adov0cd5I1dBBZCqnJisWEhYzhf0FG8S9W4/wK4zcOa16nVArsw/rFFBec5sz/OgxpFR3I73I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NtO+KJGQ; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NtO+KJGQ"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-65939428896so5403470a12.1
        for <linux-sound@vger.kernel.org>; Sun, 08 Feb 2026 09:50:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770573005; x=1771177805; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ndpDCLkU/wJ38wOkAkZivN3FDBLnPBeqYcC14atBdZQ=;
        b=NtO+KJGQWnpprkWabaWSH4gOoRhcwoyp63R97OQCAEqb9KRX7lrkvslgJr52pIXnhq
         RjZoRsAuQrbIul5MTuszwtwZQKEiqc7pproMdjMbGQWNPYW1iKR5hPt2uOuNkpnuQyjg
         6/BB3v4vFNJRGbbdlZzwqDeC+YBVRjCPMYniTgZTf1v2y2Dvav2A587BBkdwjEWNfBuV
         +k3EYlWCesOPBC9UHFkXSBumfX/Nxi5UaZoz3DjZ7cHeJV0IOwuCQKh7HnHBG+2yAZeL
         GBOMNxWLmyPQfP/HCB8qtA+AnL0WOesqhVfALE9/Y9ppTkCopPG7l2qQ/sKVzxzwzcFG
         SQwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770573005; x=1771177805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ndpDCLkU/wJ38wOkAkZivN3FDBLnPBeqYcC14atBdZQ=;
        b=p7qy2gY1oTgIS49gk21+AL8LBC8ECopsz8k2N/ASBdVSyo66Wi/u7qPNdUUlZA1DZ6
         RiT65s2XaLG/TZTbNSS9kx68ziotikH8i/U9oaHhi3F13DGtjMwoLeeW8zH7n4xcM6UD
         Dxmm4oqfrSUGmVqkFUkkID+dQpzguAoSl66oZ4EsjR2ZH+C6bcyYJzNt5deH0G4UvkkJ
         yBPAyGpU2730qQ2B/ctYutIZTrWKUvKI5C6PlJrn66/pOxrLcgKYUOYHkECKnbXGbKH/
         wAQEPspiKKoLdySKKh1uR/jG8MpwMY72aw3VBnMCXVxRKi9Z5+Vf+FiLKjffec2TYEUF
         2xZA==
X-Forwarded-Encrypted: i=1; AJvYcCWVRSmyATQ/Y6GwXeQ3Gjr7I91cHovaWm0lqLHariqYb5Qf2amqyhyNwWyrUlrDcbsVPujqYAaD9KRe2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVgNSSWe9pWbCVxKnn8X5QhJESNXU7gUpQ0e251gMRrIuAoWUi
	uDL5Rbv943hZKQxR8/EE8gHstg4WW1jPJhwe3R3mK8giZN8irk4I8+7zQWfHAw==
X-Gm-Gg: AZuq6aJDQZN5DmeN9XFwrGbaXTUnGRkQzynDoweoWAGsK0ID3SmP8s1I1gwOyJ67oyG
	VmS32m3nIyPTWa2aRhgHaNCfBcTfeIDYsPDjvFEiItxqouIDoArXcbKbOIU51c0hCmjTkpNWnW+
	WIbJqfzSRtkC9pJA7ZZ7YRSiHL6RDUjOq3Wo2bGxCr/zmx7e6ZEZUziJQ2oNJ6agbLOIyz6IzVX
	/aJG77Q/3L48r15eHQxXOS+zb7lBPrZnR6CZ2qKwy7TAEb29YIQu6BHX8M3CaqWWFW6h3t3S2cW
	l7/sJenbz+O0W58fp0p5KiUXMC5tPAUwnKr2rR65G+kSRR1aBchf4JdVK2xuWhUwUqyeJH7eXww
	fGmXPZ5pnU5dNcEL51FqE0lKyrQtOf+LazKeur8vNh2wxrDv1ztVnT6t6aPKLyncAwzaxuPtzlW
	njPplJ7ffYYQ0TXn6VWXw68CyVWkIwkM8Rydho
X-Received: by 2002:a05:6402:2350:b0:658:bc1d:a5c3 with SMTP id 4fb4d7f45d1cf-659841346bdmr4522708a12.11.1770573004974;
        Sun, 08 Feb 2026 09:50:04 -0800 (PST)
Received: from Andrzej.rolna3517.home (d176-77.icpnet.pl. [109.173.176.77])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65983eb67e2sm2031976a12.13.2026.02.08.09.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 09:50:04 -0800 (PST)
From: Daniel Kamil Kozar <dkk089@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Stefan Binding <sbinding@opensource.cirrus.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH RFC] Fix speaker/mic mute LEDs on HP OmniBook 7 AI 14-fr0220nw
Date: Sun,  8 Feb 2026 18:50:00 +0100
Message-ID: <20260208175003.384530-1-dkk089@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <87wm0n7i0b.wl-tiwai@suse.de>
References: <87wm0n7i0b.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Here's the output from alsa-info.

!!################################
!!ALSA Information Script v 0.5.3
!!################################

!!Script ran on: Sun Feb  8 17:35:50 UTC 2026


!!Linux Distribution
!!------------------

NAME="Arch Linux" PRETTY_NAME="Arch Linux" ID=arch HOME_URL="https://archlinux.org/" DOCUMENTATION_URL="https://wiki.archlinux.org/" SUPPORT_URL="https://bbs.archlinux.org/" BUG_REPORT_URL="https://gitlab.archlinux.org/groups/archlinux/-/issues" PRIVACY_POLICY_URL="https://terms.archlinux.org/docs/privacy-policy/" LOGO=archlinux-logo


!!DMI Information
!!---------------

Manufacturer:      HP
Product Name:      HP OmniBook 7 Laptop 14-fr0xxx
Product Version:   
Firmware Version:  F.10
System SKU:        C1LS5EA#AKD
Board Vendor:      HP
Board Name:        8E3B


!!ACPI Device Status Information
!!---------------

/sys/bus/acpi/devices/ACPI0003:00/status 	 15
/sys/bus/acpi/devices/ACPI000C:00/status 	 15
/sys/bus/acpi/devices/ACPI000E:00/status 	 15
/sys/bus/acpi/devices/CSC3551:00/status 	 15
/sys/bus/acpi/devices/HPIC0003:00/status 	 15
/sys/bus/acpi/devices/HPQ8001:00/status 	 15
/sys/bus/acpi/devices/INT33A1:00/status 	 15
/sys/bus/acpi/devices/INT340E:00/status 	 15
/sys/bus/acpi/devices/INTC1042:00/status 	 15
/sys/bus/acpi/devices/INTC105E:00/status 	 15
/sys/bus/acpi/devices/INTC1062:00/status 	 15
/sys/bus/acpi/devices/INTC109F:00/status 	 15
/sys/bus/acpi/devices/LNXPOWER:07/status 	 1
/sys/bus/acpi/devices/LNXPOWER:08/status 	 1
/sys/bus/acpi/devices/LNXPOWER:0a/status 	 1
/sys/bus/acpi/devices/LNXPOWER:0b/status 	 1
/sys/bus/acpi/devices/LNXPOWER:0d/status 	 1
/sys/bus/acpi/devices/MSFT0101:00/status 	 15
/sys/bus/acpi/devices/PNP0103:00/status 	 15
/sys/bus/acpi/devices/PNP0A05:00/status 	 15
/sys/bus/acpi/devices/PNP0C02:01/status 	 8
/sys/bus/acpi/devices/PNP0C02:02/status 	 8
/sys/bus/acpi/devices/PNP0C02:04/status 	 8
/sys/bus/acpi/devices/PNP0C02:06/status 	 3
/sys/bus/acpi/devices/PNP0C02:07/status 	 3
/sys/bus/acpi/devices/PNP0C02:08/status 	 3
/sys/bus/acpi/devices/PNP0C09:00/status 	 15
/sys/bus/acpi/devices/PNP0C0A:00/status 	 31
/sys/bus/acpi/devices/PNP0C0B:00/status 	 15
/sys/bus/acpi/devices/PNP0C0C:00/status 	 15
/sys/bus/acpi/devices/PNP0C0F:00/status 	 9
/sys/bus/acpi/devices/PNP0C0F:01/status 	 9
/sys/bus/acpi/devices/PNP0C0F:02/status 	 9
/sys/bus/acpi/devices/PNP0C0F:03/status 	 9
/sys/bus/acpi/devices/PNP0C0F:04/status 	 9
/sys/bus/acpi/devices/PNP0C0F:05/status 	 9
/sys/bus/acpi/devices/PNP0C0F:06/status 	 9
/sys/bus/acpi/devices/PNP0C0F:07/status 	 9
/sys/bus/acpi/devices/PRP00001:00/status 	 15
/sys/bus/acpi/devices/PRP00001:01/status 	 11
/sys/bus/acpi/devices/SYNA3514:00/status 	 15
/sys/bus/acpi/devices/USBC000:00/status 	 15
/sys/bus/acpi/devices/device:2b/status 	 15
/sys/bus/acpi/devices/device:39/status 	 15
/sys/bus/acpi/devices/device:3a/status 	 15
/sys/bus/acpi/devices/device:49/status 	 15
/sys/bus/acpi/devices/device:65/status 	 15
/sys/bus/acpi/devices/device:66/status 	 15
/sys/bus/acpi/devices/device:67/status 	 15
/sys/bus/acpi/devices/device:69/status 	 15
/sys/bus/acpi/devices/device:6a/status 	 15
/sys/bus/acpi/devices/device:6b/status 	 15
/sys/bus/acpi/devices/device:6c/status 	 15
/sys/bus/acpi/devices/device:73/status 	 15
/sys/bus/acpi/devices/device:77/status 	 15


!!ACPI SoundWire Device Status Information
!!---------------

Realtek 0x000232025d131601
Realtek 0x000330025d071401


!!Kernel Information
!!------------------

Kernel release:    #1 SMP PREEMPT_DYNAMIC Sat, 24 Jan 2026 00:47:39 +0000
Operating System:  GNU/Linux
Architecture:      x86_64
Processor:         unknown
SMP Enabled:       Yes


!!ALSA Version
!!------------

Driver version:     k6.18.7-arch1-1
Library version:    1.2.15.3
Utilities version:  1.2.15.2


!!Loaded ALSA modules
!!-------------------

snd_soc_skl_hda_dsp (card 0)


!!Sound Servers on this system
!!----------------------------

PipeWire:
      Installed - Yes (/usr/bin/pipewire)
      Running - Yes

Jack:
      Installed - Yes (/usr/bin/jackd)
      Running - No


!!Soundcards recognised by ALSA
!!-----------------------------

 0 [sofhdadsp      ]: sof-hda-dsp - sof-hda-dsp
                      HP-HPOmniBook7Laptop14_fr0xxx--8E3B


!!PCI Soundcards installed in the system
!!--------------------------------------

00:1f.3 Multimedia audio controller [0401]: Intel Corporation Arrow Lake cAVS [8086:7728]
	Subsystem: Hewlett-Packard Company Device [103c:8e3b]


!!Loaded sound module options
!!---------------------------

!!Module: snd_soc_skl_hda_dsp
	* : 


!!Sysfs card info
!!---------------

!!Card: /sys/class/sound/card0
Driver: /sys/bus/platform/drivers/skl_hda_dsp_generic
Tree:
	/sys/class/sound/card0
	|-- controlC0
	|   |-- dev
	|   |-- device -> ../../card0
	|   |-- led-mic -> ../../../../../../virtual/sound/ctl-led/mic/card0
	|   |-- led-speaker -> ../../../../../../virtual/sound/ctl-led/speaker/card0
	|   |-- power
	|   |-- subsystem -> ../../../../../../../class/sound
	|   `-- uevent
	|-- device -> ../../../skl_hda_dsp_generic
	|-- hwC0D0
	|   |-- afg
	|   |-- chip_name
	|   |-- clear
	|   |-- dev
	|   |-- device -> ../../card0
	|   |-- driver_pin_configs
	|   |-- hints
	|   |-- init_pin_configs
	|   |-- init_verbs
	|   |-- mfg
	|   |-- modelname
	|   |-- power
	|   |-- power_off_acct
	|   |-- power_on_acct
	|   |-- reconfig
	|   |-- revision_id
	|   |-- subsystem -> ../../../../../../../class/sound
	|   |-- subsystem_id
	|   |-- uevent
	|   |-- user_pin_configs
	|   |-- vendor_id
	|   `-- vendor_name
	|-- hwC0D2
	|   |-- afg
	|   |-- chip_name
	|   |-- clear
	|   |-- dev
	|   |-- device -> ../../card0
	|   |-- driver_pin_configs
	|   |-- hints
	|   |-- init_pin_configs
	|   |-- init_verbs
	|   |-- mfg
	|   |-- modelname
	|   |-- power
	|   |-- power_off_acct
	|   |-- power_on_acct
	|   |-- reconfig
	|   |-- revision_id
	|   |-- subsystem -> ../../../../../../../class/sound
	|   |-- subsystem_id
	|   |-- uevent
	|   |-- user_pin_configs
	|   |-- vendor_id
	|   `-- vendor_name
	|-- id
	|-- input13
	|   |-- capabilities
	|   |-- device -> ../../card0
	|   |-- event9
	|   |-- id
	|   |-- inhibited
	|   |-- modalias
	|   |-- name
	|   |-- phys
	|   |-- power
	|   |-- properties
	|   |-- subsystem -> ../../../../../../../class/input
	|   |-- uevent
	|   `-- uniq
	|-- input14
	|   |-- capabilities
	|   |-- device -> ../../card0
	|   |-- event10
	|   |-- id
	|   |-- inhibited
	|   |-- modalias
	|   |-- name
	|   |-- phys
	|   |-- power
	|   |-- properties
	|   |-- subsystem -> ../../../../../../../class/input
	|   |-- uevent
	|   `-- uniq
	|-- input15
	|   |-- capabilities
	|   |-- device -> ../../card0
	|   |-- event11
	|   |-- id
	|   |-- inhibited
	|   |-- modalias
	|   |-- name
	|   |-- phys
	|   |-- power
	|   |-- properties
	|   |-- subsystem -> ../../../../../../../class/input
	|   |-- uevent
	|   `-- uniq
	|-- input16
	|   |-- capabilities
	|   |-- device -> ../../card0
	|   |-- event12
	|   |-- id
	|   |-- inhibited
	|   |-- modalias
	|   |-- name
	|   |-- phys
	|   |-- power
	|   |-- properties
	|   |-- subsystem -> ../../../../../../../class/input
	|   |-- uevent
	|   `-- uniq
	|-- input17
	|   |-- capabilities
	|   |-- device -> ../../card0
	|   |-- event13
	|   |-- id
	|   |-- inhibited
	|   |-- modalias
	|   |-- name
	|   |-- phys
	|   |-- power
	|   |-- properties
	|   |-- subsystem -> ../../../../../../../class/input
	|   |-- uevent
	|   `-- uniq
	|-- number
	|-- pcmC0D0c
	|   |-- dev
	|   |-- device -> ../../card0
	|   |-- pcm_class
	|   |-- power
	|   |-- subsystem -> ../../../../../../../class/sound
	|   `-- uevent
	|-- pcmC0D0p
	|   |-- dev
	|   |-- device -> ../../card0
	|   |-- pcm_class
	|   |-- power
	|   |-- subsystem -> ../../../../../../../class/sound
	|   `-- uevent
	|-- pcmC0D31p
	|   |-- dev
	|   |-- device -> ../../card0
	|   |-- pcm_class
	|   |-- power
	|   |-- subsystem -> ../../../../../../../class/sound
	|   `-- uevent
	|-- pcmC0D3p
	|   |-- dev
	|   |-- device -> ../../card0
	|   |-- pcm_class
	|   |-- power
	|   |-- subsystem -> ../../../../../../../class/sound
	|   `-- uevent
	|-- pcmC0D4p
	|   |-- dev
	|   |-- device -> ../../card0
	|   |-- pcm_class
	|   |-- power
	|   |-- subsystem -> ../../../../../../../class/sound
	|   `-- uevent
	|-- pcmC0D5p
	|   |-- dev
	|   |-- device -> ../../card0
	|   |-- pcm_class
	|   |-- power
	|   |-- subsystem -> ../../../../../../../class/sound
	|   `-- uevent
	|-- pcmC0D6c
	|   |-- dev
	|   |-- device -> ../../card0
	|   |-- pcm_class
	|   |-- power
	|   |-- subsystem -> ../../../../../../../class/sound
	|   `-- uevent
	|-- power
	|   |-- autosuspend_delay_ms
	|   |-- control
	|   |-- runtime_active_time
	|   |-- runtime_status
	|   `-- runtime_suspended_time
	|-- subsystem -> ../../../../../../class/sound
	`-- uevent


!!Sysfs ctl-led info
!!---------------

!!CTL-LED: /sys/class/sound/ctl-led/mic/card0
List: 49

!!CTL-LED: /sys/class/sound/ctl-led/speaker/card0
List: 

!!HDA-Intel Codec information
!!---------------------------
--startcollapse--

Codec: Realtek ALC245
Address: 0
AFG Function Id: 0x1 (unsol 1)
Vendor Id: 0x10ec0245
Subsystem Id: 0x103c8e3b
Revision Id: 0x100001
No Modem Function Group found
Default PCM:
    rates [0x560]: 44100 48000 96000 192000
    bits [0xe]: 16 20 24
    formats [0x1]: PCM
Default Amp-In caps: N/A
Default Amp-Out caps: N/A
State of AFG node 0x01:
  Power states:  D0 D1 D2 D3 D3cold CLKSTOP EPSS
  Power: setting=D0, actual=D0
GPIO: io=3, o=0, i=0, unsolicited=1, wake=0
  IO[0]: enable=0, dir=0, wake=0, sticky=0, data=0, unsol=0
  IO[1]: enable=0, dir=0, wake=0, sticky=0, data=0, unsol=0
  IO[2]: enable=0, dir=0, wake=0, sticky=0, data=0, unsol=0
Node 0x02 [Audio Output] wcaps 0x41d: Stereo Amp-Out
  Control: name="Headphone Playback Volume", index=0, device=0
    ControlAmp: chs=3, dir=Out, idx=0, ofs=0
  Amp-Out caps: ofs=0x57, nsteps=0x57, stepsize=0x02, mute=0
  Amp-Out vals:  [0x2e 0x2e]
  Converter: stream=0, channel=0
  PCM:
    rates [0x40]: 48000
    bits [0xe]: 16 20 24
    formats [0x1]: PCM
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
Node 0x03 [Audio Output] wcaps 0x41d: Stereo Amp-Out
  Control: name="Speaker Playback Volume", index=0, device=0
    ControlAmp: chs=3, dir=Out, idx=0, ofs=0
  Amp-Out caps: ofs=0x57, nsteps=0x57, stepsize=0x02, mute=0
  Amp-Out vals:  [0x4f 0x4f]
  Converter: stream=0, channel=0
  PCM:
    rates [0x40]: 48000
    bits [0xe]: 16 20 24
    formats [0x1]: PCM
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
Node 0x04 [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x05 [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x06 [Audio Output] wcaps 0x411: Stereo
  Converter: stream=0, channel=0
  PCM:
    rates [0x40]: 48000
    bits [0xe]: 16 20 24
    formats [0x1]: PCM
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
Node 0x07 [Audio Input] wcaps 0x10051b: Stereo Amp-In
  Amp-In caps: ofs=0x17, nsteps=0x3f, stepsize=0x02, mute=1
  Amp-In vals:  [0x97 0x97]
  Converter: stream=0, channel=0
  SDI-Select: 0
  PCM:
    rates [0x40]: 48000
    bits [0xe]: 16 20 24
    formats [0x1]: PCM
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
  Connection: 1
     0x24
Node 0x08 [Audio Input] wcaps 0x10051b: Stereo Amp-In
  Control: name="Capture Volume", index=0, device=0
    ControlAmp: chs=3, dir=In, idx=0, ofs=0
  Control: name="Capture Switch", index=0, device=0
    ControlAmp: chs=3, dir=In, idx=0, ofs=0
  Amp-In caps: ofs=0x17, nsteps=0x3f, stepsize=0x02, mute=1
  Amp-In vals:  [0x34 0x34]
  Converter: stream=0, channel=0
  SDI-Select: 0
  PCM:
    rates [0x560]: 44100 48000 96000 192000
    bits [0xe]: 16 20 24
    formats [0x1]: PCM
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
  Connection: 1
     0x23
Node 0x09 [Audio Input] wcaps 0x10051b: Stereo Amp-In
  Amp-In caps: ofs=0x17, nsteps=0x3f, stepsize=0x02, mute=1
  Amp-In vals:  [0x97 0x97]
  Converter: stream=0, channel=0
  SDI-Select: 0
  PCM:
    rates [0x560]: 44100 48000 96000 192000
    bits [0xe]: 16 20 24
    formats [0x1]: PCM
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
  Connection: 1
     0x22
Node 0x0a [Audio Input] wcaps 0x10051b: Stereo Amp-In
  Amp-In caps: ofs=0x17, nsteps=0x3f, stepsize=0x02, mute=1
  Amp-In vals:  [0x97 0x97]
  Converter: stream=0, channel=0
  SDI-Select: 0
  PCM:
    rates [0x40]: 48000
    bits [0xe]: 16 20 24
    formats [0x1]: PCM
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
  Connection: 1
     0x25
Node 0x0b [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x0c [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x0d [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x0e [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x0f [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x10 [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x11 [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x12 [Pin Complex] wcaps 0x40040b: Stereo Amp-In
  Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
  Amp-In vals:  [0x00 0x00]
  Pincap 0x00000020: IN
  Pin Default 0x411111f0: [N/A] Speaker at Ext Rear
    Conn = 1/8, Color = Black
    DefAssociation = 0xf, Sequence = 0x0
    Misc = NO_PRESENCE
  Pin-ctls: 0x00:
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
Node 0x13 [Pin Complex] wcaps 0x40040b: Stereo Amp-In
  Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
  Amp-In vals:  [0x00 0x00]
  Pincap 0x00000020: IN
  Pin Default 0x40000000: [N/A] Line Out at Ext N/A
    Conn = Unknown, Color = Unknown
    DefAssociation = 0x0, Sequence = 0x0
  Pin-ctls: 0x00:
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
Node 0x14 [Pin Complex] wcaps 0x40058d: Stereo Amp-Out
  Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-Out vals:  [0x80 0x80]
  Pincap 0x00010014: OUT EAPD Detect
  EAPD 0x2: EAPD
  Pin Default 0x411111f0: [N/A] Speaker at Ext Rear
    Conn = 1/8, Color = Black
    DefAssociation = 0xf, Sequence = 0x0
    Misc = NO_PRESENCE
  Pin-ctls: 0x00:
  Unsolicited: tag=00, enabled=0
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
  Connection: 1
     0x02
Node 0x15 [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x16 [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x17 [Pin Complex] wcaps 0x40058d: Stereo Amp-Out
  Control: name="Speaker Playback Switch", index=0, device=0
    ControlAmp: chs=3, dir=Out, idx=0, ofs=0
  Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-Out vals:  [0x00 0x00]
  Pincap 0x0000001c: OUT HP Detect
  Pin Default 0x90170110: [Fixed] Speaker at Int N/A
    Conn = Analog, Color = Unknown
    DefAssociation = 0x1, Sequence = 0x0
    Misc = NO_PRESENCE
  Pin-ctls: 0x40: OUT
  Unsolicited: tag=00, enabled=0
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
  Connection: 4
     0x02 0x03* 0x06 0x08
Node 0x18 [Pin Complex] wcaps 0x40048b: Stereo Amp-In
  Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
  Amp-In vals:  [0x00 0x00]
  Pincap 0x00000024: IN Detect
  Pin Default 0x411111f0: [N/A] Speaker at Ext Rear
    Conn = 1/8, Color = Black
    DefAssociation = 0xf, Sequence = 0x0
    Misc = NO_PRESENCE
  Pin-ctls: 0x00:
  Unsolicited: tag=00, enabled=0
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
Node 0x19 [Pin Complex] wcaps 0x40048b: Stereo Amp-In
  Control: name="Mic Boost Volume", index=0, device=0
    ControlAmp: chs=3, dir=In, idx=0, ofs=0
  Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
  Amp-In vals:  [0x00 0x00]
  Pincap 0x00003724: IN Detect
    Vref caps: HIZ 50 GRD 80 100
  Pin Default 0x03a11040: [Jack] Mic at Ext Left
    Conn = 1/8, Color = Black
    DefAssociation = 0x4, Sequence = 0x0
  Pin-ctls: 0x24: IN VREF_80
  Unsolicited: tag=02, enabled=1
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
Node 0x1a [Pin Complex] wcaps 0x40048b: Stereo Amp-In
  Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
  Amp-In vals:  [0x00 0x00]
  Pincap 0x00003724: IN Detect
    Vref caps: HIZ 50 GRD 80 100
  Pin Default 0x411111f0: [N/A] Speaker at Ext Rear
    Conn = 1/8, Color = Black
    DefAssociation = 0xf, Sequence = 0x0
    Misc = NO_PRESENCE
  Pin-ctls: 0x00: VREF_HIZ
  Unsolicited: tag=00, enabled=0
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
Node 0x1b [Pin Complex] wcaps 0x40058f: Stereo Amp-In Amp-Out
  Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
  Amp-In vals:  [0x00 0x00]
  Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-Out vals:  [0x80 0x80]
  Pincap 0x00013734: IN OUT EAPD Detect
    Vref caps: HIZ 50 GRD 80 100
  EAPD 0x2: EAPD
  Pin Default 0x411111f0: [N/A] Speaker at Ext Rear
    Conn = 1/8, Color = Black
    DefAssociation = 0xf, Sequence = 0x0
    Misc = NO_PRESENCE
  Pin-ctls: 0x00: VREF_HIZ
  Unsolicited: tag=00, enabled=0
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
  Connection: 2
     0x02* 0x03
Node 0x1c [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x1d [Pin Complex] wcaps 0x400400: Mono
  Pincap 0x00000020: IN
  Pin Default 0x40600001: [N/A] Modem Line at Ext N/A
    Conn = Unknown, Color = Unknown
    DefAssociation = 0x0, Sequence = 0x1
  Pin-ctls: 0x20: IN
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
Node 0x1e [Pin Complex] wcaps 0x400501: Stereo
  Pincap 0x00000010: OUT
  Pin Default 0x411111f0: [N/A] Speaker at Ext Rear
    Conn = 1/8, Color = Black
    DefAssociation = 0xf, Sequence = 0x0
    Misc = NO_PRESENCE
  Pin-ctls: 0x40: OUT
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
  Connection: 1
     0x06
Node 0x1f [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x20 [Vendor Defined Widget] wcaps 0xf00040: Mono
  Processing caps: benign=0, ncoeff=142
Node 0x21 [Pin Complex] wcaps 0x40058d: Stereo Amp-Out
  Control: name="Headphone Playback Switch", index=0, device=0
    ControlAmp: chs=3, dir=Out, idx=0, ofs=0
  Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-Out vals:  [0x80 0x80]
  Pincap 0x0001001c: OUT HP EAPD Detect
  EAPD 0x2: EAPD
  Pin Default 0x03211020: [Jack] HP Out at Ext Left
    Conn = 1/8, Color = Black
    DefAssociation = 0x2, Sequence = 0x0
  Pin-ctls: 0xc0: OUT HP
  Unsolicited: tag=01, enabled=1
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
  Connection: 2
     0x02* 0x03
Node 0x22 [Audio Mixer] wcaps 0x20010b: Stereo Amp-In
  Amp-In caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-In vals:  [0x80 0x80] [0x80 0x80] [0x80 0x80] [0x80 0x80] [0x80 0x80]
  Connection: 5
     0x19 0x1a 0x1b 0x1d 0x13
Node 0x23 [Audio Mixer] wcaps 0x20010b: Stereo Amp-In
  Amp-In caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-In vals:  [0x00 0x00] [0x80 0x80] [0x80 0x80] [0x80 0x80] [0x80 0x80]
  Connection: 5
     0x19 0x1a 0x1b 0x1d 0x12
Node 0x24 [Audio Selector] wcaps 0x300101: Stereo
  Connection: 3
     0x12* 0x13 0x18
Node 0x25 [Audio Selector] wcaps 0x300101: Stereo
  Connection: 2
     0x12* 0x13
Codec: Intel Meteor Lake HDMI
Address: 2
AFG Function Id: 0x1 (unsol 0)
Vendor Id: 0x8086281d
Subsystem Id: 0x80860101
Revision Id: 0x100000
No Modem Function Group found
Default PCM:
    rates [0x0]:
    bits [0x0]:
    formats [0x0]:
Default Amp-In caps: N/A
Default Amp-Out caps: N/A
State of AFG node 0x01:
  Power states:  D0 D3 CLKSTOP EPSS
  Power: setting=D0, actual=D0, Clock-stop-OK
GPIO: io=0, o=0, i=0, unsolicited=0, wake=0
Node 0x03 [Audio Output] wcaps 0x6611: 8-Channels Digital
  Converter: stream=0, channel=0
  Digital: Enabled
  Digital category: 0x0
  IEC Coding Type: 0x0
  PCM:
    rates [0x7f0]: 32000 44100 48000 88200 96000 176400 192000
    bits [0x1a]: 16 24 32
    formats [0x5]: PCM AC3
  Power states:  D0 D3 EPSS
  Power: setting=D0, actual=D0
Node 0x04 [Pin Complex] wcaps 0x40778d: 8-Channels Digital Amp-Out CP
  Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-Out vals:  [0x00 0x00]
  Pincap 0x09000094: OUT Detect HBR HDMI DP
  Pin Default 0x18560010: [Jack] Digital Out at Int HDMI
    Conn = Digital, Color = Unknown
    DefAssociation = 0x1, Sequence = 0x0
  Pin-ctls: 0x00:
  Unsolicited: tag=00, enabled=0
  Power states:  D0 D3 EPSS
  Power: setting=D0, actual=D0
  Devices: 0
  Connection: 0
Node 0x05 [Audio Output] wcaps 0x6611: 8-Channels Digital
  Converter: stream=0, channel=0
  Digital: Enabled
  Digital category: 0x0
  IEC Coding Type: 0x0
  PCM:
    rates [0x7f0]: 32000 44100 48000 88200 96000 176400 192000
    bits [0x1a]: 16 24 32
    formats [0x5]: PCM AC3
  Power states:  D0 D3 EPSS
  Power: setting=D0, actual=D0
Node 0x06 [Pin Complex] wcaps 0x40778d: 8-Channels Digital Amp-Out CP
  Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-Out vals:  [0x00 0x00]
  Pincap 0x09000094: OUT Detect HBR HDMI DP
  Pin Default 0x18560010: [Jack] Digital Out at Int HDMI
    Conn = Digital, Color = Unknown
    DefAssociation = 0x1, Sequence = 0x0
  Pin-ctls: 0x00:
  Unsolicited: tag=00, enabled=0
  Power states:  D0 D3 EPSS
  Power: setting=D0, actual=D0
  Devices: 0
  Connection: 0
Node 0x07 [Audio Output] wcaps 0x6611: 8-Channels Digital
  Converter: stream=0, channel=0
  Digital: Enabled
  Digital category: 0x0
  IEC Coding Type: 0x0
  PCM:
    rates [0x7f0]: 32000 44100 48000 88200 96000 176400 192000
    bits [0x1a]: 16 24 32
    formats [0x5]: PCM AC3
  Power states:  D0 D3 EPSS
  Power: setting=D0, actual=D0
Node 0x08 [Pin Complex] wcaps 0x40778d: 8-Channels Digital Amp-Out CP
  Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-Out vals:  [0x00 0x00]
  Pincap 0x09000094: OUT Detect HBR HDMI DP
  Pin Default 0x18560010: [Jack] Digital Out at Int HDMI
    Conn = Digital, Color = Unknown
    DefAssociation = 0x1, Sequence = 0x0
  Pin-ctls: 0x00:
  Unsolicited: tag=00, enabled=0
  Power states:  D0 D3 EPSS
  Power: setting=D0, actual=D0
  Devices: 0
  Connection: 0
Node 0x09 [Audio Output] wcaps 0x6611: 8-Channels Digital
  Converter: stream=0, channel=0
  Digital: Enabled
  Digital category: 0x0
  IEC Coding Type: 0x0
  PCM:
    rates [0x7f0]: 32000 44100 48000 88200 96000 176400 192000
    bits [0x1a]: 16 24 32
    formats [0x5]: PCM AC3
  Power states:  D0 D3 EPSS
  Power: setting=D0, actual=D0
Node 0x0a [Pin Complex] wcaps 0x40778d: 8-Channels Digital Amp-Out CP
  Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-Out vals:  [0x00 0x00]
  Pincap 0x09000094: OUT Detect HBR HDMI DP
  Pin Default 0x18560010: [Jack] Digital Out at Int HDMI
    Conn = Digital, Color = Unknown
    DefAssociation = 0x1, Sequence = 0x0
  Pin-ctls: 0x00:
  Unsolicited: tag=00, enabled=0
  Power states:  D0 D3 EPSS
  Power: setting=D0, actual=D0
  Devices: 0
  Connection: 0
Node 0x0b [Pin Complex] wcaps 0x40778d: 8-Channels Digital Amp-Out CP
  Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-Out vals:  [0x00 0x00]
  Pincap 0x09000094: OUT Detect HBR HDMI DP
  Pin Default 0x18560010: [Jack] Digital Out at Int HDMI
    Conn = Digital, Color = Unknown
    DefAssociation = 0x1, Sequence = 0x0
  Pin-ctls: 0x00:
  Unsolicited: tag=00, enabled=0
  Power states:  D0 D3 EPSS
  Power: setting=D0, actual=D0
  Devices: 0
  Connection: 0
Node 0x0c [Pin Complex] wcaps 0x40778d: 8-Channels Digital Amp-Out CP
  Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-Out vals:  [0x00 0x00]
  Pincap 0x09000094: OUT Detect HBR HDMI DP
  Pin Default 0x18560010: [Jack] Digital Out at Int HDMI
    Conn = Digital, Color = Unknown
    DefAssociation = 0x1, Sequence = 0x0
  Pin-ctls: 0x00:
  Unsolicited: tag=00, enabled=0
  Power states:  D0 D3 EPSS
  Power: setting=D0, actual=D0
  Devices: 0
  Connection: 0
Node 0x0d [Pin Complex] wcaps 0x40778d: 8-Channels Digital Amp-Out CP
  Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-Out vals:  [0x00 0x00]
  Pincap 0x09000094: OUT Detect HBR HDMI DP
  Pin Default 0x18560010: [Jack] Digital Out at Int HDMI
    Conn = Digital, Color = Unknown
    DefAssociation = 0x1, Sequence = 0x0
  Pin-ctls: 0x00:
  Unsolicited: tag=00, enabled=0
  Power states:  D0 D3 EPSS
  Power: setting=D0, actual=D0
  Devices: 0
  Connection: 0
Node 0x0e [Pin Complex] wcaps 0x40778d: 8-Channels Digital Amp-Out CP
  Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-Out vals:  [0x00 0x00]
  Pincap 0x09000094: OUT Detect HBR HDMI DP
  Pin Default 0x18560010: [Jack] Digital Out at Int HDMI
    Conn = Digital, Color = Unknown
    DefAssociation = 0x1, Sequence = 0x0
  Pin-ctls: 0x00:
  Unsolicited: tag=00, enabled=0
  Power states:  D0 D3 EPSS
  Power: setting=D0, actual=D0
  Devices: 0
  Connection: 0
Node 0x0f [Pin Complex] wcaps 0x40778d: 8-Channels Digital Amp-Out CP
  Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-Out vals:  [0x00 0x00]
  Pincap 0x09000094: OUT Detect HBR HDMI DP
  Pin Default 0x18560010: [Jack] Digital Out at Int HDMI
    Conn = Digital, Color = Unknown
    DefAssociation = 0x1, Sequence = 0x0
  Pin-ctls: 0x00:
  Unsolicited: tag=00, enabled=0
  Power states:  D0 D3 EPSS
  Power: setting=D0, actual=D0
  Devices: 0
  Connection: 0
--endcollapse--


!!ALSA Device nodes
!!-----------------

crw-rw----+ 1 root audio 116, 11 Feb  8 18:35 /dev/snd/controlC0
crw-rw----+ 1 root audio 116, 10 Feb  8 18:35 /dev/snd/hwC0D0
crw-rw----+ 1 root audio 116,  9 Feb  8 18:35 /dev/snd/hwC0D2
crw-rw----+ 1 root audio 116,  3 Feb  8 18:35 /dev/snd/pcmC0D0c
crw-rw----+ 1 root audio 116,  2 Feb  8 18:35 /dev/snd/pcmC0D0p
crw-rw----+ 1 root audio 116,  4 Feb  8 18:35 /dev/snd/pcmC0D31p
crw-rw----+ 1 root audio 116,  6 Feb  8 18:35 /dev/snd/pcmC0D3p
crw-rw----+ 1 root audio 116,  7 Feb  8 18:35 /dev/snd/pcmC0D4p
crw-rw----+ 1 root audio 116,  8 Feb  8 18:35 /dev/snd/pcmC0D5p
crw-rw----+ 1 root audio 116,  5 Feb  8 18:35 /dev/snd/pcmC0D6c
crw-rw----+ 1 root audio 116,  1 Feb  8 18:35 /dev/snd/seq
crw-rw----+ 1 root audio 116, 33 Feb  8 18:35 /dev/snd/timer

/dev/snd/by-path:
total 0
drwxr-xr-x 2 root root  60 Feb  8 18:35 .
drwxr-xr-x 3 root root 300 Feb  8 18:35 ..
lrwxrwxrwx 1 root root  12 Feb  8 18:35 pci-0000:00:1f.3-platform-skl_hda_dsp_generic -> ../controlC0


!!Aplay/Arecord output
!!--------------------

APLAY

**** List of PLAYBACK Hardware Devices ****
card 0: sofhdadsp [sof-hda-dsp], device 0: HDA Analog (*) []
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 0: sofhdadsp [sof-hda-dsp], device 3: HDMI1 (*) []
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 0: sofhdadsp [sof-hda-dsp], device 4: HDMI2 (*) []
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 0: sofhdadsp [sof-hda-dsp], device 5: HDMI3 (*) []
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 0: sofhdadsp [sof-hda-dsp], device 31: Deepbuffer HDA Analog (*) []
  Subdevices: 1/1
  Subdevice #0: subdevice #0

ARECORD

**** List of CAPTURE Hardware Devices ****
card 0: sofhdadsp [sof-hda-dsp], device 0: HDA Analog (*) []
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 0: sofhdadsp [sof-hda-dsp], device 6: DMIC Raw (*) []
  Subdevices: 1/1
  Subdevice #0: subdevice #0

!!Amixer output
!!-------------

!!-------Mixer controls for card sofhdadsp

Card sysdefault:0 'sofhdadsp'/'HP-HPOmniBook7Laptop14_fr0xxx--8E3B'
  Mixer name	: 'Realtek ALC245'
  Components	: 'HDA:8086281d,80860101,00100000 HDA:10ec0245,103c8e3b,00100001 cfg-dmics:2 iec61937-pcm:5,4,3'
  Controls      : 50
  Simple ctrls  : 17
Simple mixer control 'Master',0
  Capabilities: pvolume pvolume-joined pswitch pswitch-joined
  Playback channels: Mono
  Limits: Playback 0 - 87
  Mono: Playback 87 [100%] [0.00dB] [on]
Simple mixer control 'Headphone',0
  Capabilities: pvolume pswitch
  Playback channels: Front Left - Front Right
  Limits: Playback 0 - 87
  Mono:
  Front Left: Playback 46 [53%] [-30.75dB] [off]
  Front Right: Playback 46 [53%] [-30.75dB] [off]
Simple mixer control 'Speaker',0
  Capabilities: pvolume pswitch
  Playback channels: Front Left - Front Right
  Limits: Playback 0 - 87
  Mono:
  Front Left: Playback 79 [91%] [-6.00dB] [on]
  Front Right: Playback 79 [91%] [-6.00dB] [on]
Simple mixer control 'Mic Boost',0
  Capabilities: volume
  Playback channels: Front Left - Front Right
  Capture channels: Front Left - Front Right
  Limits: 0 - 3
  Front Left: 0 [0%] [0.00dB]
  Front Right: 0 [0%] [0.00dB]
Simple mixer control 'IEC958',0
  Capabilities: pswitch pswitch-joined
  Playback channels: Mono
  Mono: Playback [off]
Simple mixer control 'IEC958',1
  Capabilities: pswitch pswitch-joined
  Playback channels: Mono
  Mono: Playback [off]
Simple mixer control 'IEC958',2
  Capabilities: pswitch pswitch-joined
  Playback channels: Mono
  Mono: Playback [off]
Simple mixer control 'Capture',0
  Capabilities: cvolume cswitch
  Capture channels: Front Left - Front Right
  Limits: Capture 0 - 63
  Front Left: Capture 52 [83%] [21.75dB] [on]
  Front Right: Capture 52 [83%] [21.75dB] [on]
Simple mixer control 'Auto-Mute Mode',0
  Capabilities: enum
  Items: 'Disabled' 'Enabled'
  Item0: 'Disabled'
Simple mixer control 'Dmic0',0
  Capabilities: cvolume cswitch
  Capture channels: Front Left - Front Right - Rear Left - Rear Right
  Limits: Capture 0 - 45
  Front Left: Capture 45 [100%] [0.00dB] [off]
  Front Right: Capture 45 [100%] [0.00dB] [off]
  Rear Left: Capture 45 [100%] [0.00dB] [off]
  Rear Right: Capture 45 [100%] [0.00dB] [off]
Simple mixer control 'Dmic0 Capture DRC switch',0
  Capabilities: pswitch pswitch-joined
  Playback channels: Mono
  Mono: Playback [on]
Simple mixer control 'Dmic0 Capture TDFB angle set enum',0
  Capabilities: enum
  Items: '-90' '-75' '-60' '-45' '-30' '-15' '0' '15' '30' '45' '60' '75' '90'
  Item0: '0'
Simple mixer control 'Dmic0 Capture TDFB beam switch',0
  Capabilities: pswitch pswitch-joined
  Playback channels: Mono
  Mono: Playback [on]
Simple mixer control 'Post Mixer Analog',0
  Capabilities: pvolume
  Playback channels: Front Left - Front Right
  Limits: Playback 0 - 45
  Mono:
  Front Left: Playback 45 [100%] [0.00dB]
  Front Right: Playback 45 [100%] [0.00dB]
Simple mixer control 'Post Mixer Analog Playback DRC switch',0
  Capabilities: pswitch pswitch-joined
  Playback channels: Mono
  Mono: Playback [on]
Simple mixer control 'Pre Mixer Analog',0
  Capabilities: pvolume
  Playback channels: Front Left - Front Right
  Limits: Playback 0 - 45
  Mono:
  Front Left: Playback 45 [100%] [0.00dB]
  Front Right: Playback 45 [100%] [0.00dB]
Simple mixer control 'Pre Mixer Deepbuffer HDA Analog',0
  Capabilities: volume
  Playback channels: Front Left - Front Right
  Capture channels: Front Left - Front Right
  Limits: 0 - 45
  Front Left: 45 [100%] [0.00dB]
  Front Right: 45 [100%] [0.00dB]


!!Alsactl output
!!--------------

--startcollapse--
state.sofhdadsp {
	control.1 {
		iface MIXER
		name 'Headphone Playback Volume'
		value.0 46
		value.1 46
		comment {
			access 'read write'
			type INTEGER
			count 2
			range '0 - 87'
			dbmin -6525
			dbmax 0
			dbvalue.0 -3075
			dbvalue.1 -3075
		}
	}
	control.2 {
		iface MIXER
		name 'Headphone Playback Switch'
		value.0 false
		value.1 false
		comment {
			access 'read write'
			type BOOLEAN
			count 2
		}
	}
	control.3 {
		iface MIXER
		name 'Speaker Playback Volume'
		value.0 79
		value.1 79
		comment {
			access 'read write'
			type INTEGER
			count 2
			range '0 - 87'
			dbmin -6525
			dbmax 0
			dbvalue.0 -600
			dbvalue.1 -600
		}
	}
	control.4 {
		iface MIXER
		name 'Speaker Playback Switch'
		value.0 true
		value.1 true
		comment {
			access 'read write'
			type BOOLEAN
			count 2
		}
	}
	control.5 {
		iface MIXER
		name 'Auto-Mute Mode'
		value Disabled
		comment {
			access 'read write'
			type ENUMERATED
			count 1
			item.0 Disabled
			item.1 Enabled
		}
	}
	control.6 {
		iface MIXER
		name 'Capture Volume'
		value.0 52
		value.1 52
		comment {
			access 'read write'
			type INTEGER
			count 2
			range '0 - 63'
			dbmin -1725
			dbmax 3000
			dbvalue.0 2175
			dbvalue.1 2175
		}
	}
	control.7 {
		iface MIXER
		name 'Capture Switch'
		value.0 true
		value.1 true
		comment {
			access 'read write'
			type BOOLEAN
			count 2
		}
	}
	control.8 {
		iface MIXER
		name 'Mic Boost Volume'
		value.0 0
		value.1 0
		comment {
			access 'read write'
			type INTEGER
			count 2
			range '0 - 3'
			dbmin 0
			dbmax 3000
			dbvalue.0 0
			dbvalue.1 0
		}
	}
	control.9 {
		iface MIXER
		name 'Master Playback Volume'
		value 87
		comment {
			access 'read write'
			type INTEGER
			count 1
			range '0 - 87'
			dbmin -6525
			dbmax 0
			dbvalue.0 0
		}
	}
	control.10 {
		iface MIXER
		name 'Master Playback Switch'
		value true
		comment {
			access 'read write'
			type BOOLEAN
			count 1
		}
	}
	control.11 {
		iface CARD
		name 'Mic Jack'
		value false
		comment {
			access read
			type BOOLEAN
			count 1
		}
	}
	control.12 {
		iface CARD
		name 'Headphone Jack'
		value false
		comment {
			access read
			type BOOLEAN
			count 1
		}
	}
	control.13 {
		iface CARD
		name 'Speaker Phantom Jack'
		value true
		comment {
			access read
			type BOOLEAN
			count 1
		}
	}
	control.14 {
		iface CARD
		name 'HDMI/DP,pcm=3 Jack'
		value false
		comment {
			access read
			type BOOLEAN
			count 1
		}
	}
	control.15 {
		iface MIXER
		name 'IEC958 Playback Con Mask'
		value '0fff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'
		comment {
			access read
			type IEC958
			count 1
		}
	}
	control.16 {
		iface MIXER
		name 'IEC958 Playback Pro Mask'
		value '0f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'
		comment {
			access read
			type IEC958
			count 1
		}
	}
	control.17 {
		iface MIXER
		name 'IEC958 Playback Default'
		value '0400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'
		comment {
			access 'read write'
			type IEC958
			count 1
		}
	}
	control.18 {
		iface MIXER
		name 'IEC958 Playback Switch'
		value false
		comment {
			access 'read write'
			type BOOLEAN
			count 1
		}
	}
	control.19 {
		iface PCM
		device 3
		name ELD
		value ''
		comment {
			access 'read volatile'
			type BYTES
			count 0
		}
	}
	control.20 {
		iface CARD
		name 'HDMI/DP,pcm=4 Jack'
		value false
		comment {
			access read
			type BOOLEAN
			count 1
		}
	}
	control.21 {
		iface MIXER
		name 'IEC958 Playback Con Mask'
		index 1
		value '0fff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'
		comment {
			access read
			type IEC958
			count 1
		}
	}
	control.22 {
		iface MIXER
		name 'IEC958 Playback Pro Mask'
		index 1
		value '0f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'
		comment {
			access read
			type IEC958
			count 1
		}
	}
	control.23 {
		iface MIXER
		name 'IEC958 Playback Default'
		index 1
		value '0400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'
		comment {
			access 'read write'
			type IEC958
			count 1
		}
	}
	control.24 {
		iface MIXER
		name 'IEC958 Playback Switch'
		index 1
		value false
		comment {
			access 'read write'
			type BOOLEAN
			count 1
		}
	}
	control.25 {
		iface PCM
		device 4
		name ELD
		value ''
		comment {
			access 'read volatile'
			type BYTES
			count 0
		}
	}
	control.26 {
		iface CARD
		name 'HDMI/DP,pcm=5 Jack'
		value false
		comment {
			access read
			type BOOLEAN
			count 1
		}
	}
	control.27 {
		iface MIXER
		name 'IEC958 Playback Con Mask'
		index 2
		value '0fff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'
		comment {
			access read
			type IEC958
			count 1
		}
	}
	control.28 {
		iface MIXER
		name 'IEC958 Playback Pro Mask'
		index 2
		value '0f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'
		comment {
			access read
			type IEC958
			count 1
		}
	}
	control.29 {
		iface MIXER
		name 'IEC958 Playback Default'
		index 2
		value '0400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'
		comment {
			access 'read write'
			type IEC958
			count 1
		}
	}
	control.30 {
		iface MIXER
		name 'IEC958 Playback Switch'
		index 2
		value false
		comment {
			access 'read write'
			type BOOLEAN
			count 1
		}
	}
	control.31 {
		iface PCM
		device 5
		name ELD
		value ''
		comment {
			access 'read volatile'
			type BYTES
			count 0
		}
	}
	control.32 {
		iface PCM
		device 3
		name 'Playback Channel Map'
		value.0 0
		value.1 0
		value.2 0
		value.3 0
		value.4 0
		value.5 0
		value.6 0
		value.7 0
		comment {
			access 'read write volatile'
			type INTEGER
			count 8
			range '0 - 36'
		}
	}
	control.33 {
		iface PCM
		device 4
		name 'Playback Channel Map'
		value.0 0
		value.1 0
		value.2 0
		value.3 0
		value.4 0
		value.5 0
		value.6 0
		value.7 0
		comment {
			access 'read write volatile'
			type INTEGER
			count 8
			range '0 - 36'
		}
	}
	control.34 {
		iface PCM
		device 5
		name 'Playback Channel Map'
		value.0 0
		value.1 0
		value.2 0
		value.3 0
		value.4 0
		value.5 0
		value.6 0
		value.7 0
		comment {
			access 'read write volatile'
			type INTEGER
			count 8
			range '0 - 36'
		}
	}
	control.35 {
		iface MIXER
		name 'Pre Mixer Analog Playback Volume'
		value.0 45
		value.1 45
		comment {
			access 'read write'
			type INTEGER
			count 2
			range '0 - 45'
			dbmin -9999999
			dbmax 0
			dbvalue.0 0
			dbvalue.1 0
		}
	}
	control.36 {
		iface MIXER
		name 'Post Mixer Analog Playback Volume'
		value.0 45
		value.1 45
		comment {
			access 'read write'
			type INTEGER
			count 2
			range '0 - 45'
			dbmin -9999999
			dbmax 0
			dbvalue.0 0
			dbvalue.1 0
		}
	}
	control.40 {
		iface MIXER
		name 'Post Mixer Analog Playback DRC switch'
		value true
		comment {
			access 'read write'
			type BOOLEAN
			count 1
		}
	}
	control.43 {
		iface MIXER
		name 'Dmic0 Capture TDFB beam switch'
		value true
		comment {
			access 'read write'
			type BOOLEAN
			count 1
		}
	}
	control.44 {
		iface MIXER
		name 'Dmic0 Capture TDFB angle set enum'
		value '0'
		comment {
			access 'read write'
			type ENUMERATED
			count 1
			item.0 '-90'
			item.1 '-75'
			item.2 '-60'
			item.3 '-45'
			item.4 '-30'
			item.5 '-15'
			item.6 '0'
			item.7 '15'
			item.8 '30'
			item.9 '45'
			item.10 '60'
			item.11 '75'
			item.12 '90'
		}
	}
	control.46 {
		iface MIXER
		name 'Dmic0 Capture DRC switch'
		value true
		comment {
			access 'read write'
			type BOOLEAN
			count 1
		}
	}
	control.48 {
		iface MIXER
		name 'Dmic0 Capture Volume'
		value.0 45
		value.1 45
		comment {
			access 'read write'
			type INTEGER
			count 2
			range '0 - 45'
			dbmin -9999999
			dbmax 0
			dbvalue.0 0
			dbvalue.1 0
		}
	}
	control.49 {
		iface MIXER
		name 'Dmic0 Capture Switch'
		value.0 false
		value.1 false
		value.2 false
		value.3 false
		comment {
			access 'read write'
			type BOOLEAN
			count 4
		}
	}
	control.50 {
		iface MIXER
		name 'Pre Mixer Deepbuffer HDA Analog Volume'
		value.0 45
		value.1 45
		comment {
			access 'read write'
			type INTEGER
			count 2
			range '0 - 45'
			dbmin -9999999
			dbmax 0
			dbvalue.0 0
			dbvalue.1 0
		}
	}
}
--endcollapse--


!!All Loaded Modules
!!------------------

ac97_bus
acpi_pad
acpi_tad
acpi_thermal_rel
aesni_intel
af_alg
algif_hash
algif_skcipher
asn1_encoder
bluetooth
bnep
btbcm
btintel
btmtk
btrtl
btusb
ccm
cec
cfg80211
cmac
coretemp
crc8
crypto_user
cs_dsp
dm_crypt
dm_mod
drm_buddy
drm_display_helper
drm_exec
drm_gpusvm_helper
drm_gpuvm
drm_suballoc_helper
drm_ttm_helper
encrypted_keys
fat
ghash_clmulni_intel
gpu_sched
hid_multitouch
hid_sensor_hub
hid_sensor_iio_common
hid_sensor_prox
hid_sensor_trigger
hkdf
hp_wmi
i2c_algo_bit
i2c_dev
i2c_hid
i2c_hid_acpi
i2c_i801
i2c_mux
i2c_smbus
i915
iTCO_vendor_support
iTCO_wdt
idma64
igen6_edac
industrialio
industrialio_triggered_buffer
int3400_thermal
int3403_thermal
int340x_thermal_zone
intel_cstate
intel_gtt
intel_lpss
intel_lpss_pci
intel_pmc_bxt
intel_pmc_core
intel_pmc_ssram_telemetry
intel_powerclamp
intel_rapl_common
intel_rapl_msr
intel_uncore
intel_vpu
intel_vsec
irqbypass
iwlmvm
iwlwifi
joydev
kfifo_buf
kvm
kvm_intel
libarc4
mac80211
mac_hid
mc
mei
mei_gsc_proxy
mei_me
mousedev
mtd
nfnetlink
nls_iso8859_1
ntsync
nvme
nvme_auth
nvme_core
nvme_keyring
pcspkr
pinctrl_meteorlake
platform_profile
platform_temperature_control
pmt_class
pmt_discovery
pmt_telemetry
polyval_clmulni
pps_core
processor_thermal_device
processor_thermal_device_pci
processor_thermal_mbox
processor_thermal_power_floor
processor_thermal_rapl
processor_thermal_rfim
processor_thermal_soc_slider
processor_thermal_wt_hint
processor_thermal_wt_req
ptp
rapl
rfcomm
rfkill
roles
serial_multi_instantiate
serio_raw
sg
snd
snd_compress
snd_ctl_led
snd_hda_codec
snd_hda_codec_alc269
snd_hda_codec_generic
snd_hda_codec_hdmi
snd_hda_codec_intelhdmi
snd_hda_codec_realtek_lib
snd_hda_core
snd_hda_ext_core
snd_hda_intel
snd_hda_scodec_component
snd_hda_scodec_cs35l41
snd_hda_scodec_cs35l41_i2c
snd_hda_scodec_cs35l41_spi
snd_hrtimer
snd_hwdep
snd_intel_dspcfg
snd_intel_sdw_acpi
snd_pcm
snd_pcm_dmaengine
snd_seq
snd_seq_device
snd_seq_dummy
snd_soc_acpi
snd_soc_acpi_intel_match
snd_soc_acpi_intel_sdca_quirks
snd_soc_core
snd_soc_cs35l41_lib
snd_soc_cs_amp_lib
snd_soc_dmic
snd_soc_hdac_hda
snd_soc_intel_hda_dsp_common
snd_soc_intel_sof_board_helpers
snd_soc_sdca
snd_soc_skl_hda_dsp
snd_sof
snd_sof_intel_hda
snd_sof_intel_hda_common
snd_sof_intel_hda_generic
snd_sof_intel_hda_mlink
snd_sof_intel_hda_sdw_bpt
snd_sof_pci
snd_sof_pci_intel_mtl
snd_sof_probes
snd_sof_utils
snd_sof_xtensa_dsp
snd_timer
soundcore
soundwire_bus
soundwire_cadence
soundwire_generic_allocation
soundwire_intel
sparse_keymap
spi_intel
spi_intel_pci
spi_nor
tee
thunderbolt
trusted
ttm
typec
typec_ucsi
ucsi_acpi
uvc
uvcvideo
vfat
video
videobuf2_common
videobuf2_memops
videobuf2_v4l2
videobuf2_vmalloc
videodev
wmi
wmi_bmof
x86_pkg_temp_thermal
xe


!!Sysfs Files
!!-----------

/sys/class/sound/hwC0D0/init_pin_configs:
0x12 0x411111f0
0x13 0x40000000
0x14 0x411111f0
0x17 0x90170110
0x18 0x411111f0
0x19 0x03a11040
0x1a 0x411111f0
0x1b 0x411111f0
0x1d 0x40600001
0x1e 0x411111f0
0x21 0x03211020

/sys/class/sound/hwC0D0/driver_pin_configs:

/sys/class/sound/hwC0D0/user_pin_configs:

/sys/class/sound/hwC0D0/init_verbs:

/sys/class/sound/hwC0D0/hints:

/sys/class/sound/hwC0D2/init_pin_configs:
0x04 0x18560010
0x06 0x18560010
0x08 0x18560010
0x0a 0x18560010
0x0b 0x18560010
0x0c 0x18560010
0x0d 0x18560010
0x0e 0x18560010
0x0f 0x18560010

/sys/class/sound/hwC0D2/driver_pin_configs:

/sys/class/sound/hwC0D2/user_pin_configs:

/sys/class/sound/hwC0D2/init_verbs:

/sys/class/sound/hwC0D2/hints:


!!ALSA/HDA dmesg
!!--------------

[   11.957368] EXT4-fs (nvme0n1p4): mounted filesystem 0e89751b-3866-45eb-997f-120c066168d2 r/w with ordered data mode. Quota mode: none.
[   11.983318] sof-audio-pci-intel-mtl 0000:00:1f.3: Digital mics found on Skylake+ platform, using SOF driver
[   11.983334] sof-audio-pci-intel-mtl 0000:00:1f.3: enabling device (0000 -> 0002)
[   11.983597] sof-audio-pci-intel-mtl 0000:00:1f.3: DSP detected with PCI class/subclass/prog-if 0x040100
[   11.983665] sof-audio-pci-intel-mtl 0000:00:1f.3: bound 0000:00:02.0 (ops intel_audio_component_bind_ops [i915])
[   11.990469] sof-audio-pci-intel-mtl 0000:00:1f.3: use msi interrupt mode
[   12.041312] sof-audio-pci-intel-mtl 0000:00:1f.3: hda codecs found, mask 5
[   12.041321] sof-audio-pci-intel-mtl 0000:00:1f.3: using HDA machine driver skl_hda_dsp_generic now
[   12.041325] sof-audio-pci-intel-mtl 0000:00:1f.3: NHLT device BT(0) detected, ssp_mask 0x4
[   12.041328] sof-audio-pci-intel-mtl 0000:00:1f.3: BT link detected in NHLT tables: 0x4
[   12.041331] sof-audio-pci-intel-mtl 0000:00:1f.3: DMICs detected in NHLT tables: 2
[   12.047673] sof-audio-pci-intel-mtl 0000:00:1f.3: Firmware paths/files for ipc type 1:
[   12.047681] sof-audio-pci-intel-mtl 0000:00:1f.3:  Firmware file:     intel/sof-ipc4/arl/sof-arl.ri
[   12.047683] sof-audio-pci-intel-mtl 0000:00:1f.3:  Firmware lib path: intel/sof-ipc4-lib/arl
[   12.047685] sof-audio-pci-intel-mtl 0000:00:1f.3:  Topology file:     intel/sof-ace-tplg/sof-hda-generic-2ch.tplg
[   12.049097] sof-audio-pci-intel-mtl 0000:00:1f.3: Loaded firmware library: ADSPFW, version: 2.14.1.1
[   12.170976] iwlwifi 0000:00:14.3: Detected RF GF, rfid=0x2010d000
[   12.171578] iwlwifi 0000:00:14.3: RFIm is deactivated, reason = 4
[   12.195753] sof-audio-pci-intel-mtl 0000:00:1f.3: Booted firmware version: 2.14.1.1
[   12.217891] sof-audio-pci-intel-mtl 0000:00:1f.3: Topology: ABI 3:29:1 Kernel ABI 3:23:1
[   12.218176] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Parent card not yet available, widget card binding deferred
[   12.244186] snd_hda_codec_alc269 ehdaudio0D0: ALC245: picked fixup  for PCI SSID 103c:8e3b
[   12.244699] snd_hda_codec_alc269 ehdaudio0D0: autoconfig for ALC245: line_outs=1 (0x17/0x0/0x0/0x0/0x0) type:speaker
[   12.244707] snd_hda_codec_alc269 ehdaudio0D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
[   12.244710] snd_hda_codec_alc269 ehdaudio0D0:    hp_outs=1 (0x21/0x0/0x0/0x0/0x0)
[   12.244713] snd_hda_codec_alc269 ehdaudio0D0:    mono: mono_out=0x0
[   12.244715] snd_hda_codec_alc269 ehdaudio0D0:    inputs:
[   12.244717] snd_hda_codec_alc269 ehdaudio0D0:      Mic=0x19
[   12.252140] iwlwifi 0000:00:14.3: base HW address: fc:6d:77:13:ed:6d
--
[   12.254192] Bluetooth: BNEP socket layer initialized
[   12.282355] skl_hda_dsp_generic skl_hda_dsp_generic: hda_dsp_hdmi_build_controls: no PCM in topology for HDMI converter 3
[   12.298912] input: sof-hda-dsp Mic as /devices/pci0000:00/0000:00:1f.3/skl_hda_dsp_generic/sound/card0/input13
[   12.299012] input: sof-hda-dsp Headphone as /devices/pci0000:00/0000:00:1f.3/skl_hda_dsp_generic/sound/card0/input14
[   12.299124] input: sof-hda-dsp HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:1f.3/skl_hda_dsp_generic/sound/card0/input15
[   12.299204] input: sof-hda-dsp HDMI/DP,pcm=4 as /devices/pci0000:00/0000:00:1f.3/skl_hda_dsp_generic/sound/card0/input16
[   12.299271] input: sof-hda-dsp HDMI/DP,pcm=5 as /devices/pci0000:00/0000:00:1f.3/skl_hda_dsp_generic/sound/card0/input17
[   12.325267] iwlwifi 0000:00:14.3 wlo1: renamed from wlan0


