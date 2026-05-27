Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EAD389473
	for <linux-sound@vger.kernel.org>; Wed, 27 May 2026 19:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779911049; cv=pass; b=fq7ErWJwoPQ4aH0HY2OdVY1J7WkXCmwU5dpST9Pm4IyPHythfSXbeVjXLOdFJwXgi3M64maI0hfvSBIxpJXyaPcZChhakPDDlV31zbZh0XrQPTYCppoeeod0RGuoZFFA4RykaVXBYDn9ulURNNTcp3xiMOfJH2s8B7eJaaZMfHc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779911049; c=relaxed/simple;
	bh=14VuuczbbbJJzvas9wgl1DbntX0aiuRCU3bNBOwDiiE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V2F407HIRbNzJjqBHpzJ3gD2kzqNBhN8XX2pyRxdRVPHus4xyMKsUHcQ3kFUf5PCVWHraK1iejnyKTSM2uElZklfPBE8Ns1BV1A3Xxyc6lGM8idSGLUKzpXLMYgDKhOghN8ITv+z6rWnfz9dTd6Ady1B7MEuTDXm4/k0wu9h7/8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=JjH+3Pdc; arc=pass smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="JjH+3Pdc"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-7d1bcb92072so71767597b3.1
        for <linux-sound@vger.kernel.org>; Wed, 27 May 2026 12:44:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779911046; cv=none;
        d=google.com; s=arc-20240605;
        b=GTVWc1wU5JOcMxvxKbVczxGuomUiEBpZylq1hVj1lfTclY3bQsEJJpq1qid7iPdHJA
         wKk7meq5PTnaIjlqZFMPcg6Edjj8OdVVt8P8Iwap7A7tAhhUxr+DGcN8yngltz3l+uzZ
         FPO8FXP2yjuOJkK+9zlb4arBhFmYr+vXfXlGVemjWStS84Cp3Au3nRbV1IXnfAz4CSN9
         D5kPDnSscsazJBo8uk6O31wY0OPGHcClNlz5doVb6AoMqZ4dAIxRmO1FO8n0rTdW+RK4
         7pBYyDe25wVzqr1xILC1cOUObfhKSAUyF3ZyqNzoFx2a+CHTasLACftkHAMhGEWZ20mk
         Vb7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FX5Hf9gPxUMFpP1qebZLUIn5OeRCY5lA9+CMYbnXhBs=;
        fh=mN7/6Ynb3Q354HD5/yqPAfNkW0cVxTQg0rciJsseDY0=;
        b=SJzyW3uOE3jYyLI8lhtW0z7MG36T1MZB6yK7sNmiNq2RrDdejANOrqCvM7MZJbgozW
         Pj6vnxLfDVaTvwZ714M1PIO2CX43Pz8syLWvX0LqEI7MtvvkwAN+hzzBeouqpdpcvDh1
         XWO3P4AvHPP5WlgK+lx2gF9AP/sDJkFmbcaj1bxW8G5roBo5MedZzJq6S6k5ZTVrhMDH
         UAlglZxnN2gxjbvtMTanhaSqGwku9mwOfKiPdR3mApScdQcf+OSPHHlmyd1l1xpTy79u
         4sdsma1MBiObmRmMpU6MXKzKZW0K1lVEG+OKTm/jXI2ZNTuMzLiC9bt9x9fB4JsCet80
         jmoQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1779911046; x=1780515846; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FX5Hf9gPxUMFpP1qebZLUIn5OeRCY5lA9+CMYbnXhBs=;
        b=JjH+3PdczhqNq+4D6+roi5vz2xZf4XRLw8jxJa4Ntaj5nq2p3HcRjU5dxC6cz2Z9Xo
         C6wxLaggFNgzfpVa4WuolEKrw1Or0lpwXkO4fRzQI+r7+ka+XwVBakoC+eKoJA5a8cdf
         GUhbx/CZkmqKXASowWnJn5znSxsmX9fBXKRIrfdNy/X6/99y3zfpdXJNZURe39yHmeUe
         BXeAFcNProum98blgHKD6AR1EiX1hEXNMWthcOluYKSAOg32k9x/+svhVIX4L08vWbKf
         rHNKYfQW8+Gb9KjZOZNk8I+CXDb+Ci2o/olbYFG27N9dr1rU8PRxT4HHvrlMnMQS6Vuv
         9kQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779911046; x=1780515846;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FX5Hf9gPxUMFpP1qebZLUIn5OeRCY5lA9+CMYbnXhBs=;
        b=kEY1Zic+0djBDazTZf3PqqkyWOQhNy7roXs/chj59ZQJKFzgCu1rrSjSujCJRAJrQ1
         2Q8yWIOyEGe4A9SDHtz205agst3WiTknPiQ+Mcq2C2O2Bb3t3ymqu8orVivnETXVOCbv
         kinGSCAhp0ADaSPMdpRmdZiYneGaogKmublz6T11W+Hm33slll5J4ohUJ+811v9FiIGM
         Bj2zyAatBjcv9/rkMNQ4Tr1Bjue6aRxM2955LuUEagCKBFZHOc9rYw0jpaaqBPV1QDQr
         FkqpbHRC7RjYShrO4+0zPNGmUGEjni2I860EoVjc9+AWNfmaflyb4i/DSlluWssl9DEw
         v1QA==
X-Forwarded-Encrypted: i=1; AFNElJ/DcSIpyA+ISdEkFhrh8YjBFcDTHOSKehQdPSuPlfB85k+u4nxcx4D7DQmYO4G+JkLRVRhA77+BWr5YWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSb/skVMylSrFCSRnDbTsxqfIQFnBrwOx77FWG3LW8DDATTqf9
	yf3cdzp/E0pQvIXOzdq1VP8QlNuiOLTtAiPh8MyKglSNXmmFAn3rzZLrPwitUeVYVX0+AOtIZFn
	uNO0ofdOl2wz1DqGd4eX4v2nL2Je+v92jO1sSJYSA
X-Gm-Gg: Acq92OGbc9MLG1kcTyWuOzXLmyz4F5qWT2RX+u6rJvi0nFMx5vs1Z9+/a/WMsfb32hW
	wj2hfXreX4ghsN51/Qx7McwHhA723LRFERn/tyDQBTsegtCft7WeLop/1Of25qeDZXs71tTnXfS
	YnfVduHe3GIRDrxS8UFhUyVy60rZKOKR96nR0ZWOc7RfMnCNYDfLBHct40WuXuViUO/s0CrVyUz
	EvuNOy1I4JZatfusuW4cvcLNbMV9ELMs8NUWZFascCeg4+ME0rNjdCd/p6V5Nha4PG2PDDDju6F
	c7b39NxP1fcvz7qzgggG4fr0S/SPH5AQI+2C3DuVyLdbQiZ+
X-Received: by 2002:a05:690c:67c5:b0:7db:f1b4:15e5 with SMTP id
 00721157ae682-7dbf1b41890mr21136197b3.4.1779911045555; Wed, 27 May 2026
 12:44:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <O6pYAi7yf23du9ivLsL0QqrnTmodj2lDTL7Wviv7I_nhjVtvllO7Y5Ban0TeTqrastb1RWhJtlkqrM3quLMWSriai-YjjGy312MTcEhxyWs=@protonmail.com>
In-Reply-To: <O6pYAi7yf23du9ivLsL0QqrnTmodj2lDTL7Wviv7I_nhjVtvllO7Y5Ban0TeTqrastb1RWhJtlkqrM3quLMWSriai-YjjGy312MTcEhxyWs=@protonmail.com>
From: Sean Rhodes <sean@starlabs.systems>
Date: Wed, 27 May 2026 20:43:54 +0100
X-Gm-Features: AVHnY4KcMXIIodDKjDBrd3BWymN4LQ43bArzZMANNcnK7-IF5wv-P0tsligTKF0
Message-ID: <CABtds-3GOyBr1H=c5aFV1uzfkhO3d1NHMPuon_cWDq0V=pFwUA@mail.gmail.com>
Subject: Re: [REGRESSION] Speaker pop/chirp on Meteor Lake ALC287 (17aa:231e)
 -- 6.12.73 to 6.12.85
To: Mike Karcic <mikekarcic@protonmail.com>
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, 
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "tiwai@suse.de" <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"

What about 630fbc6e870e? If so, 46c862f5419e looks relevant.

On Wed, 27 May 2026 at 15:25, Mike Karcic <mikekarcic@protonmail.com> wrote:
>
> Speaker pop/chirp regression on a Lenovo ThinkPad with Meteor Lake and
> Realtek ALC287 (subsystem ID 17aa:231e). The chirp occurs on speaker
> power state transitions when audio starts or stops. It is not present
> on kernel 6.12.73 and is present on 6.12.85. A desktop with ALC897
> (subsystem ID 1f660202) on kernel 6.19.14 is unaffected, so this is
> codec/fixup-specific.
>
> Tested on the same LMDE (Debian 13) installation with multiple kernels
> selectable from GRUB. All userspace, firmware, and configuration are
> identical between tests. Cold boot between kernel switches is required,
> as warm reboot can carry codec register state forward. The kernel is
> not tainted on any tested version.
>
> Bisection results (Debian package versions):
>   6.12.48  -- no chirp
>   6.12.73  -- no chirp
>   6.12.85  -- chirp present
>   6.12.86  -- chirp present
>   6.12.90  -- chirp present
>
> Also broken: 6.19.14-101.fc44.x86_64 (Fedora/Aurora 44)
>
> The regression window (6.12.73 to 6.12.85) includes two commits
> targeting speaker pop on the Star Labs StarFighter (ALC233, SSID
> 7017:2014) that touch patch_realtek.c:
>
>   1cb3c20688fc ("ALSA: hda/realtek: Fix speaker pop on Star Labs StarFighter")
>   Fixes commit ("ALSA: hda/realtek: Sequence GPIO2 on Star Labs StarFighter")
>
> These are quirk-gated to SSID 7017:2014 and should not run on
> 17aa:231e, but they are the most prominent sound changes in the
> regression window. The actual culprit may be a different commit
> in the 6.12.74-6.12.85 range. I was unable to narrow further as
> Debian does not publish intermediate point-release packages.
>
> I can build and test vanilla kernels for a proper bisection if
> guided, and I can test proposed fixes.
>
> Hardware:
>   Lenovo ThinkPad, Meteor Lake
>   Codec: Realtek ALC287
>   Subsystem ID: 17aa:231e
>   PCI: 0000:00:1f.3
>   Machine driver: skl_hda_dsp_generic
>   Codec fixup: "ALC287: picked fixup for PCI SSID 17aa:231e"
>
> Unaffected hardware (same 6.19.14 kernel, no chirp):
>   Desktop, Realtek ALC897, Subsystem ID: 1f660202
>
> Controlled variables (identical across all tested 6.12 kernels):
>   SOF firmware: 2.12.0.1 (firmware-sof-signed 2025.01-1)
>   Topology: intel/sof-ace-tplg/sof-hda-generic-2ch.tplg
>   Topology ABI: 3:29:1 (Kernel ABI: 3:23:1 on all tested)
>   ALSA UCM: alsa-ucm-conf 1.2.14-1
>   PipeWire: 1.4.2, WirePlumber: 0.5.8
>   power_save: 10, hda_model: (null)
>   Desktop: KDE Plasma 6 (Wayland)
>
> Eliminated causes:
>   - Topology files in sof-ipc4-tplg/ and sof-ace-tplg/ are
>     byte-identical (confirmed via binary diff). Path irrelevant.
>   - SOF firmware version (same 2.12.0.1 on all tested kernels).
>   - Topology ABI mismatch (3:29:1 vs 3:23:1 present on working
>     kernel too).
>   - power_save (10 on all kernels).
>   - PipeWire/WirePlumber (identical versions on all kernels).
>   - Desktop environment (KDE on all; a KDE install triggered a
>     kernel update which was the actual cause of the regression
>     appearing).
>
> dmesg (6.12.48, working):
>   sof-audio-pci-intel-mtl 0000:00:1f.3: Firmware paths/files for ipc type 1:
>   sof-audio-pci-intel-mtl 0000:00:1f.3:  Firmware file:     intel/sof-ipc4/mtl/sof-mtl.ri
>   sof-audio-pci-intel-mtl 0000:00:1f.3:  Firmware lib path: intel/sof-ipc4-lib/mtl
>   sof-audio-pci-intel-mtl 0000:00:1f.3:  Topology file:     intel/sof-ace-tplg/sof-hda-generic-2ch.tplg
>   sof-audio-pci-intel-mtl 0000:00:1f.3: Booted firmware version: 2.12.0.1
>   sof-audio-pci-intel-mtl 0000:00:1f.3: Topology: ABI 3:29:1 Kernel ABI 3:23:1
>   snd_hda_codec_alc269 ehdaudio0D0: ALC287: picked fixup for PCI SSID 17aa:231e
>   snd_hda_codec_alc269 ehdaudio0D0: autoconfig for ALC287: line_outs=1 (0x17/0x0/0x0/0x0/0x0) type:speaker
>
> dmesg (6.19.14, affected):
>   sof-audio-pci-intel-mtl 0000:00:1f.3: Digital mics found on Skylake+ platform, using SOF driver
>   sof-audio-pci-intel-mtl 0000:00:1f.3: DSP detected with PCI class/subclass/prog-if 0x040380
>   sof-audio-pci-intel-mtl 0000:00:1f.3: hda codecs found, mask 5
>   sof-audio-pci-intel-mtl 0000:00:1f.3: using HDA machine driver skl_hda_dsp_generic now
>   sof-audio-pci-intel-mtl 0000:00:1f.3: Firmware paths/files for ipc type 1:
>   sof-audio-pci-intel-mtl 0000:00:1f.3:  Firmware file:     intel/sof-ipc4/mtl/sof-mtl.ri
>   sof-audio-pci-intel-mtl 0000:00:1f.3:  Firmware lib path: intel/sof-ipc4-lib/mtl
>   sof-audio-pci-intel-mtl 0000:00:1f.3:  Topology file:     intel/sof-ipc4-tplg/sof-hda-generic-2ch.tplg
>   sof-audio-pci-intel-mtl 0000:00:1f.3: Booted firmware version: 2.14.1.1
>   sof-audio-pci-intel-mtl 0000:00:1f.3: Topology: ABI 3:29:1 Kernel ABI 3:23:1
>   snd_hda_codec_alc269 ehdaudio0D0: ALC287: picked fixup for PCI SSID 17aa:231e
>   snd_hda_codec_alc269 ehdaudio0D0: autoconfig for ALC287: line_outs=1 (0x17/0x0/0x0/0x0/0x0) type:speaker
>
> Note: The kernel is not tainted on any tested version.
