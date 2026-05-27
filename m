Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A2037AA7F
	for <linux-sound@vger.kernel.org>; Wed, 27 May 2026 14:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779891725; cv=pass; b=gRdl1O4eHaQnKSn+wKt7evk0hGUbkzR+5oQk+FjPN/ZX9MBaOZWKoeCHFf62C1jvTm/DFSGT3kHvH0AFeohvnSsIzGl5rI1kWiRRgms8Aw60+iaGtKlYeZfV8ZJRoP00w9dKX8hR5KYIKaZ4q7yPwgnTggATNqLx5+m2CJEdL1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779891725; c=relaxed/simple;
	bh=WcTlXfqRK5RW6BJC/bAhY3JoNVwWC/yTt3liQYXXDDc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=CuHc9DKhNu92uAj5MgZCETrpXGh2IuBQH+9TqUBsLnHCr7Zh6FsSkhzVzPyNAztll+7c/225OaZIEpoPJUIOHkpnX9uKB0wmj140OcswaeORI0jk2g89ep7g/jyPn7UANzwG8iBuvP0FuyF4CwZNMkWbKRNyDfAJeKjiph11vpI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l96sxyZj; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l96sxyZj"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-bd21ffaca79so2167986266b.0
        for <linux-sound@vger.kernel.org>; Wed, 27 May 2026 07:22:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779891722; cv=none;
        d=google.com; s=arc-20240605;
        b=TKRhQawGa3vWVKnWDqL/sDDBB5+WLZ9+4W8zgpkKr+jBQdZhP/IOukzLWdxfl0rb/B
         KiBmq4mPo7qCtceM3u99iMdZhapD3ZBurX9vTRQDFN3xi1s0okqQvEn3JRMgVpR5HOVB
         Z/O7jf5OMvfkRIC2wJdC/Ltv5MuA+Ywob9w+qWMD6kkkjPNn2QMEsLnXuMlCD1cZJds5
         QSbMHXEPmeMHPUIGbnhzmUmOBE4cSR6P9d+HmscfGbKDRVea9Lb702LmrNsdsCl8+uH1
         yTG/8SNq6JXIgKNUprKQEIRhbIvaWu2xnQQ0GirjRNXbbUizFAk41ymOh+MdqMNAEOZD
         Y+uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=9CzZZCAsqPbmn/gI5Pp7Effwu8mfteaHKh9x+3bqRV8=;
        fh=EVxjERQWoU1haNjN0BOI/bF25yMhU7gxIlmBm3G6pYo=;
        b=YaYyv2JouRCO0pVND/anf+I0oZ5XD4j+hVL0njSzMhTvubJUOdJna01JVUKk8pUUTz
         5kfYGHcuNokY5Zb2yGnFXCTiPi3Vo4Zv4bZLXJrt5zv0TeCVtJVTjH7JtKSgLSAYqN9F
         EMW0aNq/PXpz65gKYG9OXuPL4HZhKXpWLuiChpzlCeb6NzvpG73+1mio9BkKGWiiFmyG
         KdsDm2jeGf4l10q6bMFmWRU5l0ItOmZ9Qg5iolhJsRd+/BH5GMkRnuQK4VN0jjXyNBBd
         m14u0hmObdYnE2vDgzQHgN52BnJIRsrplVoKcZW+ej/gcuIRDCRbJSaCaXI8+IOcy9sU
         JI4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779891722; x=1780496522; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9CzZZCAsqPbmn/gI5Pp7Effwu8mfteaHKh9x+3bqRV8=;
        b=l96sxyZjGaHLoMmbiOZGBiynnFdj8dK2t5t9X/nn6HH+SfKew/Cxm0WfXdyvKCmBrk
         H8EijgZ3qkh8PqfuS+7WOTcUv47sXIvIrG3UcAOOLnLpkZ74w7mvP1ginZhlpyI4t0lV
         /TN+a2YVmmNKlpntCbpGpTQjd/DZ5+pvVHN0vVelFVHxkm8g74cU39gFDaymsViCbMxm
         GIJ7INZrxXDPg64a6JjiK0hN7hf9oXk0fcF3yHHV0LcLTXNsDHspX82RNuVDBvZ7EQnM
         zHlpBGYBzXug2sScK0SgVi98SJS1eyb/3SaSNkHxnVxOkyvpwAKzGkGfuWE4SbhZtUgb
         d1ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779891722; x=1780496522;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9CzZZCAsqPbmn/gI5Pp7Effwu8mfteaHKh9x+3bqRV8=;
        b=U3xlgP6bqA+1HLfw6dQrhzNGafHaeF/7X8nJqVqzOfGSilJteVZHEcjTOuxy8G1Adj
         U3RMilrgJQZRogxehiRP9MFHE0VybbEybpMq8+GBZbaWdSVwX507hrMlFB9qATSw7CRu
         HUC53VrDoTaKWi8LZD1WOnZBI2JyFrMER8vH4VU3/smdrvPeOPehIqbdNcyQrbSFUNsv
         C/AMjXcg0vQrZOcm1kqoa/BCWBTB1fFJIuh2s9PDoiN3ToO2ECDsgLBXQdkWbzisFOk+
         aCZDOC/T/YpO9SwPI4Z5xFCwDpEDKA47YA+6On0tkjkXcGRRgDS8UVNTWe4+3Ta7v8ZK
         f/tA==
X-Forwarded-Encrypted: i=1; AFNElJ8sN8ufpBuI8WDUfCOY0Zrr7afmOr+yZAmUTKgDjRzVmTlOHRvtPr5oidGUhKn3e1CPyHZB8bWQIJnqoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YybI9rFaXLT0hf1qLhE7r9an2ElhKFA1h1bL90vTH+39XmdjEjC
	RAZC3s46HKxCR9cAqZquAn8yQoDCI3pi9BJ+fthcwLd5z/XAAJXmQUltao1CaOYdrsOq6zC7+JH
	9H1z95UJC1prVxhdRYEjIX86J1u4Cw1aYLUgAEU8+ie8Q
X-Gm-Gg: Acq92OEQZdZuW+ytHtHB7ZXVNHd5xv5AWoCuGbY5FKhBLovZ20mFSI0rgC09lJ75RmY
	jKdvxTiJfC2pMMXtifbONP982WjJR7ch3AVKmvVnB/E1aS1lnaNxh4BcGfsmJmiyqWae0xmVjJI
	0TLmmw8E8c5rTlf721RKmOzwxtqZ6iEYNZXN9lJEumvbycDLoZGvp66LVQ5fXwlKowQMGZpHFx7
	lJxM2QvXargLnzLaTj1jwQqKu0UX8YpI2IhQUZopA5qFr5B3vNsoMxvS553exnLJXqB5N/rAUJX
	Irs1D3d2XvKSl2/GUJtet6sJMvwgkYRDjJgsuXLhkElu4mezx0lf2jg0DHecnVnTWbSEDu2Zgm6
	P1D2HtqbYzQ6BoKYM6wH/nivouvMUrD9jUqJHv2kjo8TfZA==
X-Received: by 2002:a17:907:96a2:b0:be3:dfa6:3117 with SMTP id
 a640c23a62f3a-be3dfa63318mr287280866b.3.1779891722268; Wed, 27 May 2026
 07:22:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Mike Karcic <michael.karcic@gmail.com>
Date: Wed, 27 May 2026 10:21:51 -0400
X-Gm-Features: AVHnY4JMU58f0tW3VUtvrfWsoB9CpFh_PJZlZqsSlBulZc4gOKinzyQTx0qz0Pw
Message-ID: <CABfQdu8QYU8ox2LRCc+Q7sBUWFAZtSom7V93wsNhU1N2BJNXXQ@mail.gmail.com>
Subject: [REGRESSION] Speaker pop/chirp on Meteor Lake ALC287 (17aa:231e) --
 6.12.73 to 6.12.85
To: stable@vger.kernel.org
Cc: regressions@lists.linux.dev, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, tiwai@suse.de, sean@starlabs.systems
Content-Type: text/plain; charset="UTF-8"

Speaker pop/chirp regression on a Lenovo ThinkPad with Meteor Lake and
Realtek ALC287 (subsystem ID 17aa:231e). The chirp occurs on speaker
power state transitions when audio starts or stops. It is not present
on kernel 6.12.73 and is present on 6.12.85. A desktop with ALC897
(subsystem ID 1f660202) on kernel 6.19.14 is unaffected, so this is
codec/fixup-specific.

Tested on the same LMDE (Debian 13) installation with multiple kernels
selectable from GRUB. All userspace, firmware, and configuration are
identical between tests. Cold boot between kernel switches is required,
as warm reboot can carry codec register state forward. The kernel is
not tainted on any tested version.

Bisection results (Debian package versions):
  6.12.48  -- no chirp
  6.12.73  -- no chirp
  6.12.85  -- chirp present
  6.12.86  -- chirp present
  6.12.90  -- chirp present

Also broken: 6.19.14-101.fc44.x86_64 (Fedora/Aurora 44)

The regression window (6.12.73 to 6.12.85) includes two commits
targeting speaker pop on the Star Labs StarFighter (ALC233, SSID
7017:2014) that touch patch_realtek.c:

  1cb3c20688fc ("ALSA: hda/realtek: Fix speaker pop on Star Labs StarFighter")
  Fixes commit ("ALSA: hda/realtek: Sequence GPIO2 on Star Labs StarFighter")

These are quirk-gated to SSID 7017:2014 and should not run on
17aa:231e, but they are the most prominent sound changes in the
regression window. The actual culprit may be a different commit
in the 6.12.74-6.12.85 range. I was unable to narrow further as
Debian does not publish intermediate point-release packages.

I can build and test vanilla kernels for a proper bisection if
guided, and I can test proposed fixes.

Hardware:
  Lenovo ThinkPad, Meteor Lake
  Codec: Realtek ALC287
  Subsystem ID: 17aa:231e
  PCI: 0000:00:1f.3
  Machine driver: skl_hda_dsp_generic
  Codec fixup: "ALC287: picked fixup for PCI SSID 17aa:231e"

Unaffected hardware (same 6.19.14 kernel, no chirp):
  Desktop, Realtek ALC897, Subsystem ID: 1f660202

Controlled variables (identical across all tested 6.12 kernels):
  SOF firmware: 2.12.0.1 (firmware-sof-signed 2025.01-1)
  Topology: intel/sof-ace-tplg/sof-hda-generic-2ch.tplg
  Topology ABI: 3:29:1 (Kernel ABI: 3:23:1 on all tested)
  ALSA UCM: alsa-ucm-conf 1.2.14-1
  PipeWire: 1.4.2, WirePlumber: 0.5.8
  power_save: 10, hda_model: (null)
  Desktop: KDE Plasma 6 (Wayland)

Eliminated causes:
  - Topology files in sof-ipc4-tplg/ and sof-ace-tplg/ are
    byte-identical (confirmed via binary diff). Path irrelevant.
  - SOF firmware version (same 2.12.0.1 on all tested kernels).
  - Topology ABI mismatch (3:29:1 vs 3:23:1 present on working
    kernel too).
  - power_save (10 on all kernels).
  - PipeWire/WirePlumber (identical versions on all kernels).
  - Desktop environment (KDE on all; a KDE install triggered a
    kernel update which was the actual cause of the regression
    appearing).

dmesg (6.12.48, working):
  sof-audio-pci-intel-mtl 0000:00:1f.3: Firmware paths/files for ipc type 1:
  sof-audio-pci-intel-mtl 0000:00:1f.3:  Firmware file:
intel/sof-ipc4/mtl/sof-mtl.ri
  sof-audio-pci-intel-mtl 0000:00:1f.3:  Firmware lib path:
intel/sof-ipc4-lib/mtl
  sof-audio-pci-intel-mtl 0000:00:1f.3:  Topology file:
intel/sof-ace-tplg/sof-hda-generic-2ch.tplg
  sof-audio-pci-intel-mtl 0000:00:1f.3: Booted firmware version: 2.12.0.1
  sof-audio-pci-intel-mtl 0000:00:1f.3: Topology: ABI 3:29:1 Kernel ABI 3:23:1
  snd_hda_codec_alc269 ehdaudio0D0: ALC287: picked fixup for PCI SSID 17aa:231e
  snd_hda_codec_alc269 ehdaudio0D0: autoconfig for ALC287: line_outs=1
(0x17/0x0/0x0/0x0/0x0) type:speaker

dmesg (6.19.14, affected):
  sof-audio-pci-intel-mtl 0000:00:1f.3: Digital mics found on Skylake+
platform, using SOF driver
  sof-audio-pci-intel-mtl 0000:00:1f.3: DSP detected with PCI
class/subclass/prog-if 0x040380
  sof-audio-pci-intel-mtl 0000:00:1f.3: hda codecs found, mask 5
  sof-audio-pci-intel-mtl 0000:00:1f.3: using HDA machine driver
skl_hda_dsp_generic now
  sof-audio-pci-intel-mtl 0000:00:1f.3: Firmware paths/files for ipc type 1:
  sof-audio-pci-intel-mtl 0000:00:1f.3:  Firmware file:
intel/sof-ipc4/mtl/sof-mtl.ri
  sof-audio-pci-intel-mtl 0000:00:1f.3:  Firmware lib path:
intel/sof-ipc4-lib/mtl
  sof-audio-pci-intel-mtl 0000:00:1f.3:  Topology file:
intel/sof-ipc4-tplg/sof-hda-generic-2ch.tplg
  sof-audio-pci-intel-mtl 0000:00:1f.3: Booted firmware version: 2.14.1.1
  sof-audio-pci-intel-mtl 0000:00:1f.3: Topology: ABI 3:29:1 Kernel ABI 3:23:1
  snd_hda_codec_alc269 ehdaudio0D0: ALC287: picked fixup for PCI SSID 17aa:231e
  snd_hda_codec_alc269 ehdaudio0D0: autoconfig for ALC287: line_outs=1
(0x17/0x0/0x0/0x0/0x0) type:speaker

Note: The kernel is not tainted on any tested version.

-- 
Mike
