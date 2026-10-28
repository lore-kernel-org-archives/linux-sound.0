Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793153179;
	b=knKTdwBwT3NFSBNGuHtsH0H34pb58O2U85K9boRPQNbe0gLubgatd25xpxb0Dn8y6wfh
	 jTNaXiuscXJ3e/2p8Sp5UuYV59yri8LEhzolxzuc3IzyRJwU8mmEQYAA7XfvFJJgrry1Y
	 +vv7nLhsmmFktrz4sUDt7w0nV+y+Ol1IyYG38Is7ElG6FudD3yl0VO/MhsUjIPUqXljEn
	 vyMQv6bEH/Xrx1vvmVNuxOsE19n1JqZFWBqk/jwpPukncuNjgpK/PtWwrnN7gxe7ou58N
	 /s2fYx3aHjh7SkmwPSolPRUAgQx2ZwEXeKxX6tIOe4A52gJPawGirN1/8Z1Q+JNIB3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793153179;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=bnwsK8Kn6F3iOCSc/mljhgpSwHsGPEGgWgLFmwlJdyo=;
	b=pakXKp1DHHom+M3MO3i5JAdh9IeN4eSe1nUSyDuYklhS19XikMQrPyottpguHwTDP9bJ
	 RdMDkR9mfCx22kJ9rrLDmAy7DgGg9HKshd9DjNvhPPn61YcOY2oWCb3vcTNWdDgGe4Af2
	 Kh/pyrZL3TvSHn560ZEjT5b4p8I3pw9qf21K6/fC+VFjDRXX9Buczh2Z/L4ck2vbZFSl1
	 8jIe7tmkUJI5uQ/E6TpCw/3lFrG1eaADfZrHpdogCR2XUg1w6Bcv0x0YpwtoqF1XzY6V/
	 Fl2sMwxLviIKYESIQPEmHErw6tOfPRW9QwlAYtNAVIkJg71BiuNxkb00UOO3iBQnGdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aIs6ooGz;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78CD606A31D
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 02:06:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B78CD606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aIs6ooGz
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-846566246e8so435285a34.1
        for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 19:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793153178; x=1793757978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bnwsK8Kn6F3iOCSc/mljhgpSwHsGPEGgWgLFmwlJdyo=;
        b=aIs6ooGzEzoSAoUKkaa2niLZLX/qFSYfOBYRLj8nXuwYAUA5vnOltneM8VhCNwZsbs
         Re1hL23zXPn5tZQWzCOFutk0kFeZiV4bmigz7gCIoAiwB7aAKPYITJ7OGFMSxotN543k
         aP6+UgKXDIyBkpDQ6fnjpUIY/1G1hujwWj5TbJKS0kfh3t3oTb8j2w+/EzN1gBtxPHXo
         xwpDgj8bJwIz6U87VhbUPI/anfMSxadebQuVUxenLDiD24nrWkbZAfbZ4+T8Ar3Wipq+
         hnX/fr27t9bWCv05HY2kMjpY+yBTSM70gy6PLBkVPSodzlQ0O1LIDo+uxBK3aSo2xG5m
         dJag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793153178; x=1793757978;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bnwsK8Kn6F3iOCSc/mljhgpSwHsGPEGgWgLFmwlJdyo=;
        b=F6ep0Aakt0TqTzL2F+fkg1hUzaY3dlPlgao3LBHx/2t6jw5Wvq+Lj9zrpEOVH1hxyz
         g7zyet6kGA251aNNN9VB3WeQpnv5R/87H4j1YqP+xeFhsKXZBpBhcQEXvwPWxr70X5aX
         zuprb6jv23th+nM6zyHO1TVhE13gfkMl3zJQEX6ueJuf9cpogTPNd6kaZLtZWG1PGE7V
         ruwwQPeXcWrxlL/Fs0iPKSle/MDMr7h1ldKhJoh3wgRU2DXNrdx9qhsF9/sPLtTRskwi
         bgW1UXrFe3oOPV4Z+RHD4i2U4O0Q+ttzrIw1oMTQ9VfiHsOgn0ZARYEIuRK0Foi3fPF4
         v1RA==
X-Gm-Message-State: AFq9FYJ6ioze7sOaS9YcRZ4UydnYgSQdci9rJ5aaB8OJJIXmZ9tqs/t0
	pZWNVdvltc8W4vcuG4mp49pAezzev3BAchjgPinyz97OxPCTqunmclZz
X-Gm-Gg: AYBFou33nlDOarSbX/jpcyeN3NOCtq83wKd67kXJTCHKuD04qcylIZQ/RA4TCTFqulo
	L53BLaCIO/hpDaT2dwE1Akvq3I8p+appRY6lhZHnQ6LEqi7fA1U5mX8qmjrM/5FMazuKrVgYJmm
	jS33p0wr0vOU6EWSkFOcMk4xlcHfjPcKf04JDBsoBOWEzLKbx9EjUYkkXIeO2Xnpn+VIyLgDHmb
	nIht8LprN8InG+RhcxgwjxgDs1Ac04IGU22qc5qa/VnsD404QUOF8S6q/rad071MAW+4xnRLIXP
	iXjOicfww6bk7GPNcS7to8FnMMVKMUYSvgFIk48u/91DyItgEk/EbolnFHeOuBpZ2hzBgpbwJIK
	OTScWHoG/nWwh0eEff537FikBpBDqeKMnmmwzz1tzl8vuEhOMJ61n9t2zLtqws7CIg5Ux6pktov
	tqA5iJokrriBIVg2Zdr6j0Q/wuXKJJPiMVUwOhSZOb8tK2F2h8HlGGEphC6QsddJzrFboHQ7Ejx
	pNsnIiaJcMUi2YivEc8eksmuQNBO4He8Ih+yF4ZdgU3L0EihQckM9hKX/G6eD+zizOBbBpEIgX3
	H0iWo+QCXoxvEcm3OTjCLofcSaKJ5VFjckB6KG2ftWiH9mtX6y+dBBN1EKi8sN2CPnXxBSRBuy6
	/WtojBbgKk80zdWvRo4uXzw==
X-Received: by 2002:a05:6830:2b0f:b0:84c:58b:417f with SMTP id 46e09a7af769-85b2021c3a0mr176838a34.5.1793153177676;
        Tue, 27 Oct 2026 19:06:17 -0700 (PDT)
Received: from localhost.localdomain (162-233-222-157.lightspeed.livnmi.sbcglobal.net. [162.233.222.157])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85b1d363390sm355217a34.1.2026.10.27.19.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 19:06:17 -0700 (PDT)
From: Corey Smith <corsmith@gmail.com>
To: corsmith@gmail.com,
	Vijendar.Mukunda@amd.com,
	venkataprasad.potturu@amd.com
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 0/11] ASoC/soundwire: AMD ACP6x (Rembrandt) SoundWire speaker support
Date: Tue, 27 Oct 2026 22:05:41 -0400
Message-ID: <20261028020552.35278-1-corsmith@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP Dragonfly Pro ONE (AMD Rembrandt, ACP PCI revision 0x60) has no
working internal speakers under Linux.  Its speakers are two Realtek
RT1316 SDCA amplifiers on SoundWire link 0 of the ACP SoundWire
controller:

  \_SB.PCI0.GP17.ACP.SDWC.SLV0.AF04  (_ADR 0x000030025D131601)
  \_SB.PCI0.GP17.ACP.SDWC.SLV1.AF04  (_ADR 0x000031025D131601)

  -> manufacturer 0x025D (Realtek), part 0x1316 (RT1316)
  -> link 0, unique id 0/1, aggregated as one stereo "Speaker" endpoint

None of the in-tree AMD ACP drivers can drive these amplifiers:

  * snd_pci_acp6x (sound/soc/amd/yc) is the only driver that accepts the
    ACP6x revision (0x60).  It implements the PDM/DMIC path only, so the
    machine results in a capture-only card (pcmC1D0c) and the speakers
    never appear.
  * snd-pci-ps (sound/soc/amd/ps, ACP6.3/7.x) has the SoundWire manager,
    SDW DMA and machine plumbing, but rejects revision 0x60.
  * drivers/soundwire/amd_manager.c only knows the ACP6.3 and ACP7.x
    register maps.
  * sound/soc/amd/acp/amd-sdw-acpi.c only reads the modern
    "mipi-sdw-manager-list" property; Rembrandt firmware uses the legacy
    "mipi-sdw-master-list" name.

This series makes the ACP6x SoundWire path usable and routes this board
through it:

  1-2   accept the ACP6x PCI revisions in the SoundWire manager driver
  3-4   accept them in the Pink Sardine (ps) platform header and SDW DMA
  5     add an ACP6x RT1316 machine table
  6     add a FLAG_AMD_LEGACY_SDW DMI entry for board 8A7F so that
        snd_pci_acp6x releases the device to snd-pci-ps
  7     teach snd-pci-ps to probe the ACP6x SoundWire (and integrated PDM)
        hardware
  8     teach the generic amd_sdw machine driver about ACP6x
  9     accept the legacy "mipi-sdw-master-list" property
  10    harden the ACP interrupt path (fixes a boot panic found in
        testing: the IRQ handler runs before the platform devices exist)
  11    restore the legacy bus clock defaults when firmware omits the
        MIPI DisCo clock properties (fixes a -22 SDW probe failure found
        in testing)

Assumptions that need hardware validation by the reporter:

  * The ACP6x SoundWire manager and SDW DMA register blocks are register
    compatible with ACP6.3 (the series reuses the ACP6.3 register maps and
    stream/IRQ associations).  AMD shares the ACP_SW_* register
    definitions between ACP6.3 and ACP7.0, which makes this plausible, but
    it is not verified against a Rembrandt datasheet.
  * The ACP6x SDW controller child is the device at _ADR 0x02 under the
    ACP, and Rembrandt firmware does not describe the PDM controller
    (DMIC) in ACPI, so the PDM path is enabled unconditionally for ACP6x.

The series has been built and booted on the target machine; the ACP6x
SoundWire controller is now probed.  The register-map assumptions above
still need to be confirmed by actually playing audio.

Corey Smith (11):
  soundwire: amd: add ACP6x PCI revision ids
  soundwire: amd: support ACP6x SoundWire managers
  ASoC: amd: ps: add ACP6x PCI revision ids
  ASoC: amd: ps: support ACP6x in the SoundWire DMA driver
  ASoC: amd: acp: add ACP6x (Rembrandt) SoundWire machine table
  ASoC: amd: acp-config: route HP Dragonfly Pro ONE through the ACP6x
    SDW stack
  ASoC: amd: ps: probe the ACP6x SoundWire stack
  ASoC: amd: acp: add ACP6x SoundWire quirks and machine support
  soundwire: amd: accept the legacy mipi-sdw-master-list property
  ASoC: amd: ps: harden the ACP interrupt path for ACP6x
  soundwire: amd: provide defaults for the bus clock properties

 drivers/soundwire/amd_manager.c         |  33 +++++++
 include/linux/soundwire/sdw_amd.h       |   2 +
 sound/soc/amd/acp-config.c              |  19 +++++
 sound/soc/amd/acp/Makefile              |   2 +-
 sound/soc/amd/acp/acp-sdw-legacy-mach.c |  20 +++++
 sound/soc/amd/acp/amd-rmb-acpi-match.c  |  63 ++++++++++++++++
 sound/soc/amd/acp/amd-sdw-acpi.c        |  15 +++-
 sound/soc/amd/acp/soc_amd_sdw_common.h  |   2 +
 sound/soc/amd/mach-config.h             |   7 ++
 sound/soc/amd/ps/acp63.h                |   5 ++
 sound/soc/amd/ps/pci-ps.c               | 129 ++++++++++++++++++++++++--------
 sound/soc/amd/ps/ps-sdw-dma.c           |  12 ++-
 12 files changed, 273 insertions(+), 36 deletions(-)
 create mode 100644 sound/soc/amd/acp/amd-rmb-acpi-match.c
