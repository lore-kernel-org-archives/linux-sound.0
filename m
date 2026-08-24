Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F273374E46
	for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 03:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787542929; cv=none; b=SOw8EKtdnhJq3aRmO9Nj87gelfM18qC28qIo5UEXNzMDhgg8xVQkVpU3SpgCH81tQmVA4lQ69xlCHZTC2cCk7EfDlaFu86o5SQ4F14jYHuexATtUbzt3tmFOEZDxqgjywJTMI8mxtSWS69jgbyDFjh8OvsorFTxZb9WRJsKtchA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787542929; c=relaxed/simple;
	bh=Bi+Ox9ef2wQwe+B3fKR3Hh0MAHKmBGfDeUqYNOxKKOo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NqEv8b+WSiHOQ2oEkiyWBft3+os1mUabPwDxvj1jgg+JzXwn+cCkCBsXTOqoOlwVHB4xGtgw0hEsH7C6mvcINWEEmL4FCB28zF+px4nY20BRj2KBtso3IL39qH18cLQjeKV9mQefWM7f2v7xGa5UImJJeJh2gjKgHZ/pJrovuPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=carbonforge.ai; spf=pass smtp.mailfrom=carbonforge.ai; dkim=pass (2048-bit key) header.d=carbonforge.ai header.i=@carbonforge.ai header.b=NxiSjUU0; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=carbonforge.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=carbonforge.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=carbonforge.ai header.i=@carbonforge.ai header.b="NxiSjUU0"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38e3efab7e0so2141606a91.0
        for <linux-sound@vger.kernel.org>; Sun, 23 Aug 2026 20:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=carbonforge.ai; s=google; t=1787542927; x=1788147727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RJq744OREUPzqmKTdnKipIJtTwtRmFDRIV76EXzXeCY=;
        b=NxiSjUU08P4WOBXGfq8qbAgX4gds897x17NOQQH1GyjPffi2bTbWn3A/GIEng2UFDF
         Ewp4+HA64dTbSfd8JEJC9Yl5mIEofXfpnw09dd8iFYdjnYG+fjVGcID22iXXTU6j2Zq7
         O9ZApRZngRL340EJ7aPr537ND8HfBZa1Hqorl3vTt6wPpKvxhoxpevYKM4KdlH9FaS5B
         lArlPt49eJCsURtCXAQCaubnz+AWCHuXJKkSyi5dzDaLM8VS/3xv5kxHLPWhyfm5tobI
         zMPXGAX+TKlPiS42RbBv41al9Ynr8ZzeckxjFbeKkdw3GmvUlHrufHUNjOlYdMFpIghx
         Qtcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787542927; x=1788147727;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RJq744OREUPzqmKTdnKipIJtTwtRmFDRIV76EXzXeCY=;
        b=K5g9lh7Z0LDKYBuGtbCLCt4Pwtg5cgrTJoGyBlP0wzCxx9OF4C4lyTOy0Slmqx84z0
         gE2fsDf+KhvhhsC8ctYQo+csu56MqdwaJJsz4Zp7SHJ1zikzO+f13+tWhvsoz94+nW3e
         kNppCPd6a6X7ptT0+ozMt2VW1cd7vPBYuAt7HmuB1hq5Srjh2rFS3YZReaR+gCKaex8F
         QMSRkcFytEVwJAEiMoabWfw0HVFTRSzwbjXc/Oqg86nCKWXaXLAQQiO9rYRAkKMXD0vh
         l8dYu0czcWRcvwihldsx70r3k8lpBe2ZB+kIKMxtQa1AAF41uOcT15umTXr1xHfxTDcc
         7jdw==
X-Forwarded-Encrypted: i=1; AHgh+RqOv7fdS4UZYl7w/op7yKEKwR2fPPfyHL28r0ptmH43woAVIIQye1bv0eLt/kylgCcaAtQJsKIE69UPjQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kZk37kDQfyiz4evGgWl1m95rtcxf08R370PglXFHe5lthPRlKp
	28yTcKWSIlFg/BQfPBBIWCvmyS1Gy53A41rQvpE5TSBRVLP/4TwYZ1ErIN9srJxLFXxl
X-Gm-Gg: AR+sD11y7Z5261SqnyPP7nbecyQfFG4oeG1kQ/V0X/I4tRfsCiwkS7f5dX6wnkwd6C3
	otPR25FYsMKKMYKZTyiBBKjj3aLsqqoqw9yoPGWjFMuiSnDKPzfxhuq0Zht2BhfQomRLgbYR5bu
	//XuS9KlC/QLqjhGHmlFmDOWW55HrVWZGbkBvOoPxT1eTKSk2Nzr2W5/oxryhw4PsrcWYhNRqPF
	jX2JimawKfjdFWCd5ub1qxGk8T8WnIM7q1ZDF6Rz7htiekf81BPrhe2qBN35C8vz+yd87brRmVb
	b6/geS9irTjDnxrC4ABg3psTp6u9w6PWxybzy28dtj91T+1U02KUy8wed70eCLhO9nvh5w4SX28
	y66ShIYnrnsugzdayk0r7+jD8gR9Y5ikV/DuaygSzqMvgtawwJf6jfSi1Ti9hV3xW+tzWaRubH3
	y6dmlJg8LeSqu0ypAxo9joFDgwKn9IPgN7aZVjhH2UwZZv7MpBU2ImEzZpZGURrJiMQva4f4Tap
	DTYDGOm6amCXlVhe8SJnzRiwQNjLE836ov2BQYjmDzCHBVu0IPvuS2KSq4XfTkzCujg6u6dsz2F
	86fjKwCO6iveYY3GDIZdaO5d2nUUH4O60MD5/IAQ8FloDr903lRFYcYDTZBctFhxGO5dH5qkj08
	HMm6klwvsc2P3xyCTqeEzmgmJdW8TY87eZYNbgdFsf6U=
X-Received: by 2002:a17:90b:4ac8:b0:380:ce69:2669 with SMTP id 98e67ed59e1d1-395a0510f96mr34114570a91.9.1787542927288;
        Sun, 23 Aug 2026 20:42:07 -0700 (PDT)
Received: from jml-HP-OmniBook-X-Flip-Laptop-14-kc0xxx.tail8972ac.ts.net (45-19-222-18.lightspeed.sntcca.sbcglobal.net. [45.19.222.18])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f90e22f8sm19080206eec.13.2026.08.23.20.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 20:42:06 -0700 (PDT)
From: jml <jml@carbonforge.ai>
To: Vijendar.Mukunda@amd.com,
	shenghao-ding@ti.com,
	broonie@kernel.org
Cc: venkataprasad.potturu@amd.com,
	kevin-lu@ti.com,
	baojun.xu@ti.com,
	sen@ti.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	jml <jml@carbonforge.ai>
Subject: [PATCH v2 0/3] ASoC: fix SoundWire audio on HP OmniBook X Flip 14 (ACP7.1 + TAS2783)
Date: Sun, 23 Aug 2026 20:41:50 -0700
Message-ID: <20260824034153.50193-1-jml@carbonforge.ai>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the HP OmniBook X Flip 14-kc0xxx (board 8EA1, ACP PCI 1022:15e2 rev
0x71) no analog audio works: no speakers, no headset jack, no headset
microphone. Only HDMI and the PDM microphone come up.

The machine has two TI TAS2783 SmartAmps on SoundWire link 0 (unique_id
0x9 and 0xC) and a Realtek RT712-VB on link 1. A matching entry already
exists in snd_soc_acpi_amd_acp70_sdw_machines[], and the TAS2783
codec_info entry already carries .component_name, so those parts are
done. Three problems remain.

Patch 1 is board specific: the BIOS never exposes
"acp-audio-config-flag", so the ACP config lookup falls back to
FLAG_AMD_LEGACY_ONLY_DMIC, snd_pci_ps declines to probe and snd_acp_pci
binds instead. SoundWire never comes up at all, so the existing machine
entry is never reached.

Patches 2 and 3 are not board specific:

 - 2 makes the driver find factory calibration data that some OEMs store
   under a different vendor GUID. Affected machines run the amplifiers
   on generic defaults with nothing to indicate anything is wrong; the
   symptom is distortion at higher volumes.

 - 3 fixes silent amplifiers after system sleep for aggregated TAS2783
   pairs.

All three have been running on the affected machine: speakers, headset
jack and microphones work, and audio survives suspend/resume.

To be clear about what was tested where: the changes were developed and
runtime tested against v7.0 (Ubuntu 7.0.0-30), then rebased onto
for-next. The rebased form is checkpatch clean and builds warning-free
(sound/soc/codecs/tas2783-sdw.o and sound/soc/amd/acp-config.o), but the
runtime testing was done with the v7.0 form of the same changes - I have
not booted a for-next kernel on this machine.

Two things I did not turn into patches, because I would rather ask.

First, firmware lookup. tas_generate_fw_name() builds a flat name, so on
this board it asks for "8EA1-0-0x9.bin" and then "8EA1-0-9.bin".
linux-firmware ships these blobs as ti/audio/tas2783/8EXX-X-9.bin and
ti/audio/tas2783/8EXX-X-C.bin, i.e. under a subdirectory and with what
look like wildcard components for the board id and the link. The driver
prepends no path and implements no 8EXX fallback, so the firmware is
never found and playback fails with -EINVAL. Locally I worked around it
with symlinks under /lib/firmware/updates. Should the driver prepend
ti/audio/tas2783/ and fall back to the 8EXX-X- form, or is
linux-firmware expected to ship per-board names?

Second, channel order. tas2783x2_l0u9c_adr[] maps unique_id 0xC to
spk_l_endpoint and 0x9 to spk_r_endpoint. On this unit that appears to
be the wrong way round: with 0x9 as left and 0xC as right, a
left-channel-only tone comes out of the left speaker. I have only one
machine, so I have not sent a patch for it - can anyone with the same
board confirm?

jml (3):
  ASoC: amd: acp-config: override ACP config flag on HP OmniBook X Flip
    14
  ASoC: tas2783: also look for calibration data under the OEM GUID
  ASoC: tas2783: re-initialise amplifiers from .startup after system
    sleep

 sound/soc/amd/acp-config.c     |   7 ++
 sound/soc/codecs/tas2783-sdw.c | 130 ++++++++++++++++++++++++++++-----
 2 files changed, 120 insertions(+), 17 deletions(-)

-- 
2.53.0

jml (3):
  ASoC: amd: acp-config: override ACP config flag on HP OmniBook X Flip
    14
  ASoC: tas2783: also look for calibration data under the OEM GUID
  ASoC: tas2783: re-initialise amplifiers from .startup after system
    sleep

 sound/soc/amd/acp-config.c     |   7 ++
 sound/soc/codecs/tas2783-sdw.c | 130 ++++++++++++++++++++++++++++-----
 2 files changed, 120 insertions(+), 17 deletions(-)

-- 
2.53.0

