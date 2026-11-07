Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794052206;
	b=vxd0yQ8FV9TVgBCs9U8WXURpTJdlQ5wllKWbmsxvKim7KRCPKSYEQhyUfM+dMTAEVqJs
	 aksadxx3abxbXulN+6M5UnG1nTgWHpFda5pvBekopDrXu5QzynppbjJexQeznIf9kUflC
	 2hYVjsr7xfevvC+kQl2+vhFBHe88nti4lwP9TP5vsvudA9YFzBmjYco9VOtdu3sZ1pAoq
	 PgE3fUyX8VvRKqB+E29NP16me+Uruuud1Iqv4UyVKEfrWKX57ThQ8ZwU6W2b21vMWJEKm
	 XZB6/oMskzGvA/NkcByh1/9yWOO0lkGG+LBCWj3/48JK9hmZ3LvD3jRqziH8y9oXdCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794052206;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=r+uxcIgFL9/D/VViRhZ0+VIGzs8vtNNeMXk697RQJm8=;
	b=Tm5ln8xibloTmXQnV2XlBQCBe0O+TNGNxRcf32RZqYyOm1cq8r0inXe5gz49ynWojN3x
	 mA2D1Ubxah5IONVvj3aVBfVN/HCoi5sRQyXSDiCnZ4LySR7q9uZ83nMC7SdbT74vDiDgc
	 4dzayPCqW0xgZonuqj1KKpmloAH6rXLOK5LoIPpwUGFUl1Nmps0XJzLqzbpyXr+uWAzYl
	 XL2D4tHsfBo8yrmea/gYkEaVqZnzIiYrpGNDrOU+bqifaKnpvjc6Rvtuq1vC3c3v8etxd
	 cDPNACSAJD9v+VeaOy8lbUgSIqMlmTVWubVm/NOnFzfbokXlZf+FzWG5fjM6rQTX5Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a4AcB77f;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203A4606A32D
	for <linux-sound@vger.kernel.org>; Sat,  7 Nov 2026 11:50:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 203A4606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a4AcB77f
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4918c2d727fso767523f8f.3
        for <linux-sound@vger.kernel.org>; Sat, 07 Nov 2026 03:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794052204; x=1794657004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r+uxcIgFL9/D/VViRhZ0+VIGzs8vtNNeMXk697RQJm8=;
        b=a4AcB77fpaD8qLovRBx5p8vg4Z+2vacfqjKtPj3S/46vC0aGLM04yTBK2zR4DbZxr1
         XoZCDNij8TFgATut412g09ZFB4LwqmOK5U4/ssLZvnvZmyW7bZhXMuajGtt9tQ+iu//5
         y3pnU8+NQ7CHhRvPBfWgOmtGY3lD9ZLn3qVUe8dIGfMkGblwrAR9NzDbIG0YYmfEUK2a
         APqYOAT1TqMZJ/hhS9QQ2EUYVyg1uISgOFN/P532rw3Q0EH77DV3GGA8J+fEPhZb5/hN
         gEu1iPAG2pTxPKrVf48fUE+Yc4VM4N7XhYtAvU3vX/AD49qcolvwYrV8k+dKQS6t77fH
         tdHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794052204; x=1794657004;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r+uxcIgFL9/D/VViRhZ0+VIGzs8vtNNeMXk697RQJm8=;
        b=IY7OdD/RzZfgFDyg5BmMiDkLDm4P/fV/HzkeSXgURetvEYa2sC4arvfhBwpO65vf+n
         RCSlka2sv2ahgXEE0ux/PQxzSKQxjyPLuA9Z7JDOioY/kvGqvixVrdJgDtbUtW1YhA7F
         kMAs5O2emwNa8TBE7VUuEy6kSMz9H+k4oau/6XuT0bpUVVf0/rADE1mRUhUgHrvy/d4o
         Yr3D6PiAb4scRfnDpHlo+iAofGJG1a8otbDe6cFGgOVOwdkYeOhv3YKWSCbqR6dj/LVQ
         LkH78AHlrbBALFlgeXZ/bSHXi8wInNOV2kFHQvFn8xkXU8QV2tqGa69vBXRNw1z/69u8
         rB7A==
X-Forwarded-Encrypted: i=1; AL+hErEjQC4w1jxxQ/wbtJ5UwsKjV3RW5QsYv5J+/KwVbTwTjWrJnXnEk5zAtvZDFySYf36/T0lXL7M/MZa33w==@vger.kernel.org
X-Gm-Message-State: APuU4Z+Vh5zHURVYfLhmfv+R6tUdCL+a9BE/rQomD7w1V7McCwb6IDEh
	emnWijFVVCxKgybSksmUbDT4cx49j2LrULqGTrtq8AOi79ZuHFYpA5fvbaI2I7Zz
X-Gm-Gg: AYBFou3ludKPj3EoK2I/ksxneInn7aUuHtdjVHLC3QXJIDKy8Yj4qwyKUIuuC+IIqzz
	SdaSYYE+D2BrNM+EemarsPhs5s6/u03WEqeMimGR5iLWFZKbZTURGw8kZl327spzd6/ltFUcNLp
	rqlaZsc7oZa4UD1a5ollv/Go/dkRjLs/pJ2w09oO5ZdLQIix/9J+6QzuoxHD9D2BC3by5GOUxKI
	WCDRxU8M74MhMe5ufaumSauohEFhBTATr9dYYeScTEyOVDsHM7MpT6HPXsTqQg0CqERJaKB2waC
	XfRaEbA3fFiDU1Y97pk85YPc0jzVIhpDGchwdZgmy9yL2uteMPipVpgla6bxeaLevO7zdJdmj7E
	xZcE1xbYPvE3bGQLOFLTv1QcyiQOQtND7sU4lWRew9HYyBuMVRzU6+JOsazPkiI0PBCvL1G64M3
	aG1SEPygiQ8w4ixrjHzGXceblxJd3ulKuxuRrn9jA5gLdskcfALJG2LTyeLzNfebyvdBo/SPFOV
	VV0xny1SXvHPCWsUO0sv/e4MFSkKC+5pOP3UKOvL/rYDNRmf48DqDqxqdvXY+ego8qIYtTOMWGE
	YTJdJYcH30etHVOt2u+UD2/yYGRbib32DgfObR1Yy3c02TrbqdlbzhM=
X-Received: by 2002:a05:6000:4302:b0:48e:5d8a:d1fc with SMTP id ffacd0b85a97d-49275a26704mr8848073f8f.31.1794052204280;
        Sat, 07 Nov 2026 03:50:04 -0800 (PST)
Received: from kreach.multipass ([77.37.5.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d6d6382dsm8318347f8f.19.2026.11.07.03.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 03:50:03 -0800 (PST)
From: Jude Gyimah <jude.gyimah87@gmail.com>
To: lgirdwood@gmail.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	daniel.baluta@nxp.com,
	kai.vehmanen@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	Vijendar.Mukunda@amd.com
Cc: broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	arnd@arndb.de,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] ASoC: SOF: ipc4-topology: vmlinux link failure when SND_INTEL_DSP_CONFIG=m
Date: Sat,  7 Nov 2026 12:49:44 +0100
Message-ID: <20261107114944.561731-1-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Greetings,

sound/soc/sof/ipc4-topology.c can be built into vmlinux while the Intel NHLT
code it calls is in a module, which breaks the link:

  ipc4-topology.c:(.text+0x22bc): undefined reference to `intel_nhlt_get_endpoint_blob'
  aarch64-linux-gnu-ld: ipc4-topology.c:(.text+0x2424): undefined reference to `intel_nhlt_ssp_device_type'
  aarch64-linux-gnu-ld: ipc4-topology.c:(.text+0x2458): undefined reference to `intel_nhlt_get_endpoint_blob'

arm64, v7.3, full .config attached.  The relevant settings are:

  CONFIG_ACPI=y
  CONFIG_SND_SOC_SOF_IMX_COMMON=y
  CONFIG_SND_SOC_SOF=y
  CONFIG_SND_SOC_SOF_INTEL_COMMON=m
  CONFIG_SND_INTEL_DSP_CONFIG=m
  CONFIG_SND_INTEL_NHLT=y

This is the same shape as the sof-pci-dev failure Arnd reported in 2021,
fixed in 8a3fea95fab1 ("ASoC: SOF: SND_INTEL_DSP_CONFIG dependency") and then
properly in 194fe0fc3422 ("ASoC: SOF: pci: move DSP_CONFIG use to
platform-specific drivers").  The NHLT calls in ipc4-topology.c look like the
part that move left behind.

The route in

  SND_SOC_SOF_IMX_COMMON=y selects SND_SOC_SOF, so snd-sof including
  ipc4-topology.o is built into vmlinux.

  SND_SOC_SOF_INTEL_COMMON=m selects SND_INTEL_DSP_CONFIG, so it is m, and
  intel-nhlt.o goes into snd-intel-dspcfg.ko:

    sound/hda/core/Makefile:18: snd-intel-dspcfg-$(CONFIG_SND_INTEL_NHLT) += intel-nhlt.o

  SND_INTEL_DSP_CONFIG then does "select SND_INTEL_NHLT if ACPI".
  SND_INTEL_NHLT is a bool, so a select from an m-valued symbol sets it to y.

  ipc4-topology.c:1793 guards the calls with

    #if IS_ENABLED(CONFIG_ACPI) && IS_ENABLED(CONFIG_SND_INTEL_NHLT)

  which is now true, so the calls are compiled into vmlinux while their
  definitions are in a module.

Why the guard cannot help:

Simply because the guard tests SND_INTEL_NHLT, but the code is shipped by
SND_INTEL_DSP_CONFIG, and SND_INTEL_NHLT is y whenever SND_INTEL_DSP_CONFIG
is y *or* m.  So the condition distinguishes only "NHLT support is present
somewhere" from "absent" i.e., it cannot distinguish built-in from modular, for
any value of SND_INTEL_DSP_CONFIG.  The static inline fallbacks in
include/sound/intel-nhlt.h are keyed on the same condition, so they are
unreachable here too.

The smallest fix imo

Change the condition at ipc4-topology.c:1793 to test reachability of the
option that actually ships the code:

  -#if IS_ENABLED(CONFIG_ACPI) && IS_ENABLED(CONFIG_SND_INTEL_NHLT)
  +#if IS_ENABLED(CONFIG_ACPI) && IS_REACHABLE(CONFIG_SND_INTEL_DSP_CONFIG)

IS_REACHABLE is true when the provider is built in, and when the provider is
a module and the caller is also a module too, this seems to be exactly the condition under
which these calls can link.  However, no header change is needed. The file's own #else
branch at line 1972 already stubs snd_sof_get_nhlt_endpoint_data() to return
0, and where IS_REACHABLE is true with ACPI=y, SND_INTEL_NHLT is y as well,
so the real declarations are in scope.  This is the same one-line remedy
8a3fea95fab1 applied for snd_intel_dsp_driver_probe, named as a temporary fix
pending the restructuring.

The complete fix, if you would rather do it once

Move the NHLT calls to the Intel side, as 194fe0fc3422 did for the PCI probe.
Two things suggest that is where they belong: (i) ipc4_data->nhlt is declared
void * in sound/soc/sof/ipc4-priv.h, and (ii) the only code that ever sets it is
sound/soc/sof/intel/hda-dai.c:764 via intel_nhlt_init().  So, the generic core
holds an opaque pointer that only Intel fills, and then calls Intel accessors
on it.  Outside the header and sound/hda/core/intel-nhlt.c itself,
ipc4-topology.c is the only caller of either function.

A third option would be "depends on SND_INTEL_DSP_CONFIG || !SND_INTEL_DSP_CONFIG"
on config SND_SOC_SOF, but that puts an Intel constraint on the generic core.
An i.MX, MediaTek or AMD user with SND_INTEL_DSP_CONFIG=m for unrelated
reasons could no longer build SOF in.  I have mentioned it only to rule it out.

I am happy to send a patch for whichever of the first two you prefer.

Fixes: aa84ffb72158 ("ASoC: SOF: ipc4-topology: Add support for SSP/DMIC DAI's")

Found this with kreach, a static checker that compares what Kconfig allows against
the symbols the compiled objects actually reference:
https://github.com/JGyimah/kreach

Thanks,
Jude Gyimah
