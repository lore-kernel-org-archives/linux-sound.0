Received: from smtp186.sjtu.edu.cn (smtp186.sjtu.edu.cn [202.120.2.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AAD5331237
	for <linux-sound@vger.kernel.org>; Sun, 24 May 2026 14:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.120.2.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779631824; cv=none; b=Vq5i7PnazUf2P4xU1VtDCECJvXy9/WZW8rwM9IeBTdMKqhkqHTSO81H1tJ5rbOyGVVO8eiPBGCR4xCGXvD+i8/bI/Hq7+8BWWDT32eMo/0RcBHnNCbfqvPG//10WoJ0OT4hGyIfEP5H7Qz8BRTwNGihzWVqzMnzFggp6LqsQoTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779631824; c=relaxed/simple;
	bh=bwH33GYAmQW3eewC5uw6HevA6mfA2pykmJLnr7q7qj8=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=IkP3iyXGdvuFTWSS7hM+yq6Lc/aW9EJ+2eUyagWWruKZhwY7gxonel1KmCvoZ/a6kMMdeYlCwxBVbALiCTLT1MvCUf8DB67RRu4nWDTrKqEHT4D9u7WWc1R9FRagvmY2qASRK6JKnFFZ+GNr0JHlxSz2pTUQBr+1B9ku6awvUaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sjtu.edu.cn; spf=pass smtp.mailfrom=sjtu.edu.cn; dkim=pass (2048-bit key) header.d=sjtu.edu.cn header.i=@sjtu.edu.cn header.b=PC+UPVTp; arc=none smtp.client-ip=202.120.2.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sjtu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sjtu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sjtu.edu.cn header.i=@sjtu.edu.cn header.b="PC+UPVTp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sjtu.edu.cn;
	s=default; t=1779631250;
	bh=bwH33GYAmQW3eewC5uw6HevA6mfA2pykmJLnr7q7qj8=;
	h=Date:To:From:Subject;
	b=PC+UPVTpFsWbHHqj8eePYB5Gv9DQKP2c3PEZkdTzRwEIKKjlaMwDAPvuMfU+ljk91
	 2WHkaizSyRSQAGCga6rt3uzsHSHUi2hfIOCsy5GJduxj+KSPCeMXTUyrsHmkcauprD
	 0jlG3lYEhXPBG2A5tYe7OqfYNu5J7LGzZTidgf894YTiEFMMLYJD9fjqzRukjeto+M
	 FmzOwVgrt55E5IcDxauL+XowyhEz5ehWOEPfdQbbRA4OgMoEP+kbwE175t1nbM1TUP
	 IO+YOWjr45MtPBJlHVGxgIOQ8xedL9yLGRG0sJ1nQAN9uLNsvCWNYD5hkCml95jZBn
	 owPOMizgBzu4w==
Received: from proxy188.sjtu.edu.cn (smtp188.sjtu.edu.cn [202.120.2.188])
	by smtp186.sjtu.edu.cn (Postfix) with ESMTPS id 5EE512FEE32
	for <linux-sound@vger.kernel.org>; Sun, 24 May 2026 14:00:50 +0000 (UTC)
Received: from [192.168.1.169] (unknown [202.120.39.3])
	by proxy188.sjtu.edu.cn (Postfix) with ESMTPSA id 9B91537C8C7
	for <linux-sound@vger.kernel.org>; Sun, 24 May 2026 22:00:49 +0800 (CST)
Message-ID: <144695d1-1140-4bb7-9461-2b94c1915c1e@sjtu.edu.cn>
Date: Sun, 24 May 2026 22:00:18 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-sound@vger.kernel.org
From: Xiaozhi Zhu <zhuxiaozhi@sjtu.edu.cn>
Subject: ALSA: MECHREVO WUJIE Series internal speakers do not work under Linux
 (Lunar Lake / ALC233 / possible RT1308 amp path issue)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

I'm reporting an internal speaker issue on a MECHREVO WUJIE Series laptop
running Arch Linux. The built-in speakers are silent under Linux, while
headphones work and the built-in speakers work under Windows.

This does not look like a PipeWire routing or mixer issue. The current 
evidence
points more toward a machine-specific kernel / ACPI / board-support issue in
the built-in speaker amplifier path.

Hardware / system:
   Laptop:   MECHREVO WUJIE Series
   Board:    WUJIE Series-Lark4-LNL
   BIOS:     EM_LNL326_V1.0.19 (2026-03-14)
   CPU/SoC:  Intel Lunar Lake
   Kernel:   7.0.9-arch1-1 currently running
   Distro:   Arch Linux
   PipeWire: 1.6.5
   WirePlumber: 0.5.14
   Firmware: linux-firmware 20260519-1, sof-firmware 2025.12.2-1

Audio devices:
   HDA controller:
     00:1f.3 Audio device [0403]: Intel Corporation Lunar Lake-M HD 
Audio Controller [8086:a828]
     Kernel driver in use: snd_hda_intel
   HDA codec:
     Realtek ALC233
     Vendor ID: 0x10ec0235
     Subsystem ID: 0x1d05c011
   Suspected speaker amp:
     ACPI device: 10EC1308:00
     HID:         10EC1308
     Path:        \\_SB_.PC00.I2C0.HDC1
     status:      0

What I verified:
   - PipeWire / pipewire-pulse / wireplumber are running normally.
   - Default sink is Built-in Audio Analog Stereo, active port is
     analog-output-speaker.
   - ALSA playback device 0,0 (ALC233 Analog) is present and can be opened.
   - Speaker mixer is not muted, and Auto-Mute is disabled.
   - dmesg detects the ALC233 codec:
       autoconfig for ALC233: line_outs=1 (0x14...) type:speaker
       speaker_outs=0
       hp_outs=1 (0x21...)
   - /proc/asound/card0/codec#0 shows speaker pin 0x14 and headphone pin 
0x21.
   - Standard HDA verb tests on pin/EAPD/GPIO did not restore speaker 
output.
   - 10EC1308:00 has no bound driver, and I do not see a corresponding I2C
     device node for it.
   - The installed 7.0.9-arch2-1 kernel modules include snd_soc_rt1308, 
with alias:
       acpi*:10EC1308:*

I also decompiled the DSDT. The _STA method for 10EC1308:00 is:

   If (((I2SC == 0x02) && (CDIS != One))) {
       Return (0x0F)
   }
   Return (Zero)

I2SC and I2SB are GNVS fields. In this DSDT, I2SC is at GNVS offset 
0x47A and
I2SB is at GNVS offset 0x47F. The exposed ACPI path is under I2C0, 
matching the
I2SB == 0 branch, but 10EC1308:00 still has status 0. A sibling device,
INT34C2:00 under \\_SB_.PC00.I2C0.HDC2, also has status 0.

My current interpretation is that the front part of the audio chain up 
to the
ALC233 codec looks healthy, while the built-in speaker amplifier path is not
being enabled. I do not know whether this is a firmware/BIOS policy, an
OS-detection issue, or missing Linux machine/board support for this 
platform.

Questions:
   1. Does this look like something that should be handled by an HDA Realtek
      quirk/fixup for subsystem 0x1d05c011, or should this platform use an
      Intel SOF / ASoC machine-driver path for the RT1308 speaker amp?
   2. Given that the RT1308 ACPI node is present but its _STA returns 0 
because
      the I2SC == 0x02 condition is not satisfied, is there anything 
Linux is
      expected to select/enable here, or should this be treated as a 
firmware /
      BIOS issue?

I can provide full logs if needed, including:
   - full journalctl -b / dmesg
   - full /proc/asound/card0/codec#0
   - alsa-info output
   - lspci -nnk
   - amixer -c 0 scontents
   - ACPI tables if you want me to capture them as root

Best regards,

Xiaozhi Zhu

