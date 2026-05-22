Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0FA1A23A6
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 12:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779454452; cv=none; b=RE9eeYFYu4DyCtb6Mg553cR86LQrB1U07b5fBO5SLRaKqwYsaPy8p3ZPImlLhTzgYSuIbaVK315fAic08KLx3GtmsdibDV+qx4z/uRGxtpw73jotsU0aJ2jKyIjYK8hBrzALaumwFiIxlEBYuPN8uYn9AVGiFv2BMgLIHWnC0AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779454452; c=relaxed/simple;
	bh=reySs6JjPgbvHDTr9CmmkRHsaBwiRvJQu4sU/DeZVpU=;
	h=Content-Type:Message-ID:Date:MIME-Version:From:To:Cc:Subject; b=ipm6vtj/vprlrWOHpTNsCn7HAzLLhApEuw/xNFsXt+8bXwvREMsXogPxhuRo5jsJ38PKfgmYmXfUTyU8YyL969Ex5of8GFDpa1MNit9UHJaY9VOejg7Ji8IXyx+OIJeZ+EKDq7VeRQlBr8ZlEODuAUSdg0Uxqn9dQt0FyZDoCfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NVcOOFoP; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NVcOOFoP"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a742b8b72eso8514689e87.1
        for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 05:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779454449; x=1780059249; darn=vger.kernel.org;
        h=subject:cc:to:content-language:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lEe2ENqBnjbT3nOeGIAOts9GMGqxC7SPAG8ARJNczWc=;
        b=NVcOOFoPUEIlSEzqu86PyOmYN6DEBTh4HaPhx7EJtX4G6PmZm9OkIgORgbDmSyG0Dt
         FDYYkBCBMMOuFmfuOtbwXHrZWO32NsDxUsdHg/5tm9tDd4PaZQztjb+L8Amh1V0lfAcE
         Q7WjRtkVdMVMbtKxmwON8O6YVNH17uxBhkR8kZOb+cK3MT7UzFxF+U2omC3QtafjD6fi
         cXuS+mymLfEO5lANLjyCR11glOnUMaNS0YHwpZ06UDZ4PyekYzyfFQjBFRNGgKWon1Iw
         K2Xo8FQoz7Ev4fNvyuNqy/Lnap9T1FnKVGCkWqEBs9pGc+lAXNCE+sBhkXo6LUpK4xdg
         hn4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779454449; x=1780059249;
        h=subject:cc:to:content-language:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lEe2ENqBnjbT3nOeGIAOts9GMGqxC7SPAG8ARJNczWc=;
        b=aVudXRJ/fdmYEJc/1gs9cbEyuMXsvpiIQrNZzTNipmy8Ho9x8d1f3i9ul+v/M4qy8P
         Zxgz9WANyYT4ypKvII6hEUV4cxch+h3CFejnKumYfItmFg2qgJwcs9BXHRchgQOHDC3x
         8cMxQx9lW7qLT3mmwd8aqcBQmn7a0n8lG1FCmeuIHOXX8ArDmxq0wfDtoHxbFuDHLRcY
         W4P5/T8Nz9C00OY9xOvG9Ok6QeiF8aYgkVwmbaRX00sKsDrm3v7+QJyhZF/8UPBYMgJP
         M9B4LmDSM8u/hnzD3yvq1KIPb2yc8jIk3G51gWSZkIIIorOycw9QBrezJmBxFBQ2mmk2
         tPZw==
X-Forwarded-Encrypted: i=1; AFNElJ8DETPu9enjWHCgWCiNxB0i00Jh9/mdYLonGdTaCIXgaHlUpF6MVGyBxRpwwR4fyobSX5V/7PRwjhWF9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqqDVh2eKRYHOeATRKOhA+IIFOn9Mr/lMp5zGGTT+D8+mbPdRF
	fvnXL8jnoH3iEjh33pUqyxvWB0z0eXuxtXDLJK61G5r0P0OTfV9mfDgs
X-Gm-Gg: Acq92OGtxrK+/tpsdHpUOq4uKxUgI9gHocVABTqVEcw4I/U0X+7PcSLfhLzHJewFWZu
	gD4/GQ32Tm80f9fihIPj6h+aH9zYBbVEk2uX1MC7CAsnjZLLGtktiEh9DGyCA9Pbb0qG5CA964P
	u7NybVwPNNuDEyzS0LKMOVkF0lniQ8x6OJtrVnB5HFJvQ+MH5MRHBb0q/KTtE4BGxU3iizTO6rD
	JIlNjjYVYr0UDR8f65vYs6FlH5wMFWMLtR6rxa96t+8RwHYQHVlgV51wLPXANWyIhD9kIur+TmY
	sw481yi0gSOEedT/tRbWXGS/TaI83d8HuWFtZ/njdMUojvfWGLe2clOUYAvCG02T7nCmK43VBFf
	/nvassw7a9WQf5fjp+KuZLMF3HYw7q5FL9oKl3eDG1n8CreVPwH0u2XOHboUFLjDpVLMBmbwO79
	ZAjW2Pytu8hIRKrhRMHlAGU0OCY2sm1mawAiQFL4DYtkV+JtgC+6GQxsPMYlpoFvw8
X-Received: by 2002:a05:6512:690:b0:5a8:6391:eb9b with SMTP id 2adb3069b0e04-5aa3239ac31mr1113500e87.34.1779454448249;
        Fri, 22 May 2026 05:54:08 -0700 (PDT)
Received: from [192.168.1.149] (host-80-73-162-2.rev.as20985.net. [80.73.162.2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cba261sm406898e87.18.2026.05.22.05.54.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 05:54:07 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------GYPfxEMLY3QW9YLdDXTPIx04"
Message-ID: <7328cdbf-10fb-46a1-a28c-2f7365fd767d@gmail.com>
Date: Fri, 22 May 2026 15:54:06 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Adnrey Golovko <andrey.golovko@gmail.com>
Content-Language: en-US, ru
To: Vijendar.Mukunda@amd.com, superm1@kernel.org
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, broonie@kernel.org, tiwai@suse.de,
 yung-chuan.liao@linux.intel.com
Subject: [BUG] ASoC: amd: ps / soundwire: SDW peripherals unrecoverable after
 s0i3 on Strix Halo (ACP7.0)

This is a multi-part message in MIME format.
--------------GYPfxEMLY3QW9YLdDXTPIx04
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

   SoundWire slaves lose firmware after s2idle on AMD ACP7.0 (Strix Halo) —
   TAS2783 cannot resume

   ## Summary

   On ASUS ProArt PX13 HN7306EAC (AMD Ryzen AI MAX+ 395, Strix Halo) 
with  ACP  PCI
   rev  0x70  (ACP7.0), entering  s2idle  for as little as 3.8 seconds 
causes the
   Realtek RT721 SDCA and TI TAS2783 SoundWire peripherals to enter an
   unrecoverable state. After resume,  Peripheral status = unattached  
and the
   TAS2783 driver reports  error playback without fw download . No 
software-only
   recovery is possible — driver re-bind, PCI hot remove+rescan, and 
module reload
   all fail. Only a full machine reboot restores audio.

   Filed because all available fixes in current upstream/-next are 
already applied
   and do not address the root cause.

   ## Hardware

     DMI:               ASUS HN7306EAC, BIOS HN7306EAC.307 (2026-01-27)
     CPU:               AMD Ryzen AI MAX+ 395 w/ Radeon 8060S (Strix Halo)
     ACP PCI ID:        1022:15e2 rev 0x70  (sysfs: 0000:c4:00.5)
     ACP driver:        snd_pci_ps
     SoundWire link 1:  Realtek RT721 SDCA  (sdw:0:1:025d:0721:01)
                        2× TI TAS2783        (sdw:0:1:0102:0000:01:8, 
...:01:b)
     TAS2783 firmware:  /lib/firmware/1714-1-{8,B}.bin  (extracted from 
Windows
                        driver — ASUS does not ship to linux-firmware as 
of 2026-
   05)
     ACPI path:         \_SB.PCI0.GPPA.ACP.SDWC.SWM1

   ## Kernel

     Linux 7.1.0-rc3 + 3 backports:
       c368dd5cbd61 soundwire: don't program SDW_SCP_BUSCLOCK_SCALE on a 
unattached
   Peripheral
       9a0afdd19a01 soundwire: stream: sdw_stream_remove_slave(): Check 
stream is
   valid
       e09bbf11b53f HID: input: delete hid_battery on disconnect 
(unrelated)

    git log v7.1-rc3..v7.1-rc4 -- sound/soc/amd drivers/soundwire/ is 
empty.
    broonie/sound#for-next  adds  sound/soc/amd/acp7x/  (ACP7.D/E/F, rev 
0x7D-0x7F)
   —
   not applicable to ACP7.0.

   ## DSDT / ACPI properties

   SWM1 (active link) has:

     amd-sdw-power-mode                    = 0x02  (AMD_SDW_POWER_OFF_MODE)
     amd-sdw-enable                        = 1
     amd-sdw-wakeup-enable                 = 1
     mipi-sdw-clock-stop-mode0-supported   = 1
     mipi-sdw-clock-stop-mode1-supported   = 0

   No  _PS0 / _PS3 / _PR0 / _PR3  methods for \_SB.PCI0.GPPA.ACP.SDWC  
or its
    SWM0 / SWM1  children, no  _RST  method.

   With  power_mode_mask = AMD_SDW_POWER_OFF_MODE ,
   drivers/soundwire/amd_manager.c
   correctly takes the full deinit/init path: amd_deinit_sdw_manager()  on
   suspend,
    sdw_clear_slave_status(SDW_UNATTACH_REQUEST_MASTER_RESET) +
   amd_sdw_clk_init_ctrl +
   amd_init_sdw_manager + amd_enable_sdw_manager + 
amd_sdw_set_frameshape  on
   resume.
    snd_acp70_resume()  in  sound/soc/amd/ps/ps-common.c  correctly 
takes the slow
   path ( acp_hw_init  + pad-keeper restore) because  sdw_en_stat  is 
cleared
   during
   suspend by  amd_deinit_sdw_manager . So the driver-level resume code 
paths are
   exercised correctly. The failure is at a lower level.

   ## Reproducer

     # Cold boot, audio works.
     $ aplay -l | grep amdsoundwire
     card 1: amdsoundwire ... SDW1-PIN1-PLAYBACK-SmartAmp multicodec-2 []
     $ speaker-test -D plughw:1,2 -c2  # → works

     # One s2idle cycle:
     $ systemctl suspend
     # (3.8 sec residency in s0i3, /sys/kernel/debug/amd_pmc/s0ix_stats 
confirms)
     # (woken by i2c-ASCF1A03:00 touchpad wake event, but issue 
reproduces with
     #  any wake source including RTC alarm)

     # After resume:
     $ speaker-test -D plughw:1,2 -c2
     Setting of hwparams failed: Invalid argument

   ## Evidence — kernel trace

    /sys/power/suspend_stats :

     last_failed_dev    = sdw:0:1:0102:0000:01:b
     last_failed_step   = resume
     last_hw_sleep      = 3825561   (µs)

    journalctl -k  around suspend/resume:

     PM: suspend entry (s2idle)
     Freezing user space processes completed
     printk: Suspending console(s)
     ACPI: EC: interrupt blocked
     ACPI: EC: interrupt unblocked
     slave-tas2783 sdw:0:1:0102:0000:01:8: PM: dpm_run_callback():
   acpi_subsys_resume returns -110
     slave-tas2783 sdw:0:1:0102:0000:01:8: PM: failed to resume: error -110
     slave-tas2783 sdw:0:1:0102:0000:01:b: PM: dpm_run_callback():
   acpi_subsys_resume returns -110
     slave-tas2783 sdw:0:1:0102:0000:01:b: PM: failed to resume: error -110
     PM: suspend exit
     snd_pci_ps 0000:c4:00.5: AMD-Vi: Event logged [IO_PAGE_FAULT
        domain=0x0018 address=0xfffffffffffffffc flags=0x0030]

   The  0xfffffffffffffffc  IOMMU fault address is the sentinel returned 
when PCI
   config reads return  0xff..ff , i.e., ACP is in an inaccessible state 
at the
   moment of DMA.

   Detailed resume-path trace (excerpts):

     amd_sdw_manager amd_sdw_manager.1: SCP_addrpage ignored for Slave 1
     soundwire sdw-master-0-1: trf on Slave 1 failed:-5 write addr 8089 
count 0
     amd_sdw amd_sdw: ASoC: PRE_PMD: tas2783-2 FU21 event failed: -5
     amd_sdw_manager amd_sdw_manager.1: SCP_addrpage ignored for Slave 2
     soundwire sdw-master-0-1: trf on Slave 2 failed:-5 write addr 8089 
count 0
     rt721-sdca sdw:0:1:025d:0721:01: Initialization not complete, timed 
out
     amd_sdw_manager amd_sdw_manager.1: slave_stat:0x1
     soundwire sdw-master-0-1: PING status: 0x1
     amd_sdw_manager amd_sdw_manager.1: SDW1 clock stop successful
     amd_sdw_manager amd_sdw_manager.1: AMD_SDW_DEVICE_STATE:0xc
     amd_sdw_manager amd_sdw_manager.1: mclk 24000000 max 12000000 row 
50 col 10
   frame_rate:48000
     amd_sdw_manager amd_sdw_manager.1: AMD_SDW_DEVICE_STATE:0x0
     snd_pci_ps 0000:c4:00.5: AMD-Vi: Event logged [IO_PAGE_FAULT ...
   0xfffffffffffffffc ...]
     slave-tas2783 sdw:0:1:0102:0000:01:8: resume: initialization timed out
     soundwire sdw-master-0-1: PING status: 0x1

   Note  PING status: 0x1  — the SoundWire PING-frame status returns the 
same low
   value before and after the manager attempts to re-enumerate. 
Peripherals are
   not responding on the wire even though clock is running.

   Steady-state symptoms after the resume path completes (slave drivers 
loaded,
   codec link tries to prepare PCM):

     slave-tas2783 sdw:0:1:0102:0000:01:8: Peripheral status = unattached
     slave-tas2783 sdw:0:1:0102:0000:01:8: error playback without fw 
download
     slave-tas2783 sdw:0:1:0102:0000:01:8: ASoC error (-22): at
   snd_soc_dai_hw_params()
     soundwire sdw-master-0-1: Program transport params failed: -61
     amd_sdw_manager amd_sdw_manager.1: command is ignored for Slave 2

    command is ignored for Slave N  from  amd_sdw_fill_msg_resp() 
indicates the
   SoundWire bus sees no ACK for any peripheral command — the 
peripherals are not
   responding on the wire.

   The  error playback without fw download  from  tas2783-sdw.c  is the 
giveaway —
   the TAS2783 driver explicitly knows its firmware blob is no longer 
loaded.
   During cold boot the firmware is downloaded after slave attach; after 
s0i3, the
   slave never reaches attached state, so the firmware download path is 
never
   re-entered.

   ## Recovery attempts — ALL FAIL

   Attempt                                │Result
───────────────────────────────────────┼────────────────────────────────────────
   Stop PipeWire,  rmmod snd_soc_tas2783_…│ EBUSY  — kernel ALSA-SOC 
retry loop ho…
    echo 0000:c4:00.5 > /sys/bus/pci/driv…│Probe replays cleanly ( probe 
complete …
   PCIe Function-Level Reset ( /sys/.../r…│File does not exist — ACP 
does not adve…
    echo 1 > /sys/bus/pci/devices/0000:c4…│Same as unbind+bind — slaves 
enumerate …
   pm-utils system-sleep hook running the…│Same
   BIOS update 305 → 307                  │No change

   This is consistent with the underlying SMU behaviour on Strix Halo s0i3:
   the ACP power island is power-gated, peripherals connected to the 
SoundWire
   pads lose state including firmware. There is no software path from 
the OS
   to re-power the slave chips short of a full machine reboot.

   ## What I think the bug is

   Either (a) the AMD SMU should hold the ACP power island powered 
during s0i3
   when SoundWire link is active and peripherals require firmware (BIOS 
or SMU
   firmware change), or (b) the kernel needs an explicit recovery path 
that:

   1. Detects in  snd_acp70_resume()  that ACP was actually power-gated 
(e.g.
   by reading a sentinel register that survives only across non-power-gated
   suspend).
   2. If power-gated, performs a full peripheral-chip reset (some 
platform-specific
   GPIO toggle? secondary bus reset on the ACP's PCIe link?) before the SDW
   manager attempts to re-enumerate.
   3. Triggers each slave driver's firmware-download path on resume.

   I cannot find any GPIO under  \_SB.PCI0.GPPA.ACP  in DSDT that would 
let the
   kernel toggle slave chip power. Is there an SMU command available via
    amd_pmc  that would force a re-power of the ACP island? Or is this a 
BIOS
   deficiency on this specific HN7306EAC firmware?

   ## Workaround currently used

    suspend  is disabled in GNOME.  hibernate  (S4) works because it 
goes through
   a full cold-boot path.

   ## Asks

   1. Is there a known software path to recover SoundWire peripherals after
   ACP power-gate that I missed?
   2. If not — would AMD consider adding either a full ACP island re-power
   sequence in  snd_acp70_resume()  or a peripheral-reset hook that
   slave drivers can call from their resume path?
   3. Should ASUS BIOS be updated to either advertise  _RST  for SDW nodes
   or prevent SMU from power-gating ACP during s0i3 when SDW is active?
   (Happy to file with ASUS Linux team if you can confirm direction.)

   I have full DSDT/SSDT decode, complete dmesg traces, and a reproducer
   environment if more data is helpful. Source tree with all backports at
    https://github.com/...  (will set up on request).

   Tested on  7.1.0-rc3  + backports above. Confirmed same failure on stock
    7.1.0-070100rc3-generic  from kernel.ubuntu.com/mainline/v7.1-rc3/ .

   Thanks,
   Andrey Golovko
--------------GYPfxEMLY3QW9YLdDXTPIx04
Content-Type: text/x-dsl; charset=UTF-8; name="dsdt-sdwc.dsl"
Content-Disposition: attachment; filename="dsdt-sdwc.dsl"
Content-Transfer-Encoding: base64

ICAgICAgICBEZXZpY2UgKFNEV0MpCiAgICAgICAgewogICAgICAgICAgICBOYW1lIChfQURS
LCAweDA1KSAgLy8gX0FEUjogQWRkcmVzcwogICAgICAgICAgICBOYW1lIChfRFNELCBQYWNr
YWdlICgweDA0KSAgLy8gX0RTRDogRGV2aWNlLVNwZWNpZmljIERhdGEKICAgICAgICAgICAg
ewogICAgICAgICAgICAgICAgVG9VVUlEICgiZGFmZmQ4MTQtNmViYS00ZDhjLThhOTEtYmM5
YmJmNGFhMzAxIikgLyogRGV2aWNlIFByb3BlcnRpZXMgZm9yIF9EU0QgKi8sIAogICAgICAg
ICAgICAgICAgUGFja2FnZSAoMHgwMykKICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAg
ICAgICAgICBQYWNrYWdlICgweDAyKQogICAgICAgICAgICAgICAgICAgIHsKICAgICAgICAg
ICAgICAgICAgICAgICAgIm1pcGktc2R3LXN3LWludGVyZmFjZS1yZXZpc2lvbiIsIAogICAg
ICAgICAgICAgICAgICAgICAgICAweDAwMDEwMDAwCiAgICAgICAgICAgICAgICAgICAgfSwg
CgogICAgICAgICAgICAgICAgICAgIFBhY2thZ2UgKDB4MDIpCiAgICAgICAgICAgICAgICAg
ICAgewogICAgICAgICAgICAgICAgICAgICAgICAibWlwaS1zZHctbWFuYWdlci1saXN0Iiwg
CiAgICAgICAgICAgICAgICAgICAgICAgIDB4MDMKICAgICAgICAgICAgICAgICAgICB9LCAK
CiAgICAgICAgICAgICAgICAgICAgUGFja2FnZSAoMHgwMikKICAgICAgICAgICAgICAgICAg
ICB7CiAgICAgICAgICAgICAgICAgICAgICAgICJhbWQtc2R3LWFnZ3JlZ2F0aW9uLW1hc3Rl
ci1pZCIsIAogICAgICAgICAgICAgICAgICAgICAgICAweEZGRkYKICAgICAgICAgICAgICAg
ICAgICB9CiAgICAgICAgICAgICAgICB9LCAKCiAgICAgICAgICAgICAgICBUb1VVSUQgKCJk
YmI4ZTNlNi01ODg2LTRiYTYtODc5NS0xMzE5ZjUyYTk2NmIiKSAvKiBIaWVyYXJjaGljYWwg
RGF0YSBFeHRlbnNpb24gKi8sIAogICAgICAgICAgICAgICAgUGFja2FnZSAoMHgwMikKICAg
ICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAgICBQYWNrYWdlICgweDAyKQogICAg
ICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAgICAgICAgIm1pcGktc2R3LWxp
bmstMC1zdWJwcm9wZXJ0aWVzIiwgCiAgICAgICAgICAgICAgICAgICAgICAgICJTV00wIgog
ICAgICAgICAgICAgICAgICAgIH0sIAoKICAgICAgICAgICAgICAgICAgICBQYWNrYWdlICgw
eDAyKQogICAgICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAgICAgICAgIm1p
cGktc2R3LWxpbmstMS1zdWJwcm9wZXJ0aWVzIiwgCiAgICAgICAgICAgICAgICAgICAgICAg
ICJTV00xIgogICAgICAgICAgICAgICAgICAgIH0KICAgICAgICAgICAgICAgIH0KICAgICAg
ICAgICAgfSkKICAgICAgICAgICAgTmFtZSAoU1dNMCwgUGFja2FnZSAoMHgwMikKICAgICAg
ICAgICAgewogICAgICAgICAgICAgICAgVG9VVUlEICgiZGFmZmQ4MTQtNmViYS00ZDhjLThh
OTEtYmM5YmJmNGFhMzAxIikgLyogRGV2aWNlIFByb3BlcnRpZXMgZm9yIF9EU0QgKi8sIAog
ICAgICAgICAgICAgICAgUGFja2FnZSAoMHgwRSkKICAgICAgICAgICAgICAgIHsKICAgICAg
ICAgICAgICAgICAgICBQYWNrYWdlICgweDAyKQogICAgICAgICAgICAgICAgICAgIHsKCi0t
LSBTV00xIHByb3BlcnRpZXMgKGFjdGl2ZSBsaW5rIHdpdGggUlQ3MjEgKyAyw5cgVEFTMjc4
MykgLS0tCiAgICAgICAgICAgIE5hbWUgKFNXTTEsIFBhY2thZ2UgKDB4MDIpCiAgICAgICAg
ICAgIHsKICAgICAgICAgICAgICAgIFRvVVVJRCAoImRhZmZkODE0LTZlYmEtNGQ4Yy04YTkx
LWJjOWJiZjRhYTMwMSIpIC8qIERldmljZSBQcm9wZXJ0aWVzIGZvciBfRFNEICovLCAKICAg
ICAgICAgICAgICAgIFBhY2thZ2UgKDB4MEUpCiAgICAgICAgICAgICAgICB7CiAgICAgICAg
ICAgICAgICAgICAgUGFja2FnZSAoMHgwMikKICAgICAgICAgICAgICAgICAgICB7CiAgICAg
ICAgICAgICAgICAgICAgICAgICJtaXBpLXNkdy1zdy1pbnRlcmZhY2UtcmV2aXNpb24iLCAK
ICAgICAgICAgICAgICAgICAgICAgICAgMHgwMDAxMDAwMAogICAgICAgICAgICAgICAgICAg
IH0sIAoKICAgICAgICAgICAgICAgICAgICBQYWNrYWdlICgweDAyKQogICAgICAgICAgICAg
ICAgICAgIHsKICAgICAgICAgICAgICAgICAgICAgICAgIm1pcGktc2R3LWNsb2NrLXN0b3At
bW9kZTAtc3VwcG9ydGVkIiwgCiAgICAgICAgICAgICAgICAgICAgICAgIE9uZQogICAgICAg
ICAgICAgICAgICAgIH0sIAoKICAgICAgICAgICAgICAgICAgICBQYWNrYWdlICgweDAyKQog
ICAgICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAgICAgICAgIm1pcGktc2R3
LWNsb2NrLXN0b3AtbW9kZTEtc3VwcG9ydGVkIiwgCiAgICAgICAgICAgICAgICAgICAgICAg
IFplcm8KICAgICAgICAgICAgICAgICAgICB9LCAKCiAgICAgICAgICAgICAgICAgICAgUGFj
a2FnZSAoMHgwMikKICAgICAgICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAg
ICAgICJtaXBpLXNkdy1tYXgtY2xvY2stZnJlcXVlbmN5IiwgCiAgICAgICAgICAgICAgICAg
ICAgICAgIDB4MDBCNzFCMDAKICAgICAgICAgICAgICAgICAgICB9LCAKCiAgICAgICAgICAg
ICAgICAgICAgUGFja2FnZSAoMHgwMikKICAgICAgICAgICAgICAgICAgICB7CiAgICAgICAg
ICAgICAgICAgICAgICAgICJtaXBpLXNkdy1zdXBwb3J0ZWQtY2xvY2stc2NhbGVzIiwgCiAg
ICAgICAgICAgICAgICAgICAgICAgIFplcm8KICAgICAgICAgICAgICAgICAgICB9LCAKCiAg
ICAgICAgICAgICAgICAgICAgUGFja2FnZSAoMHgwMikKICAgICAgICAgICAgICAgICAgICB7
CiAgICAgICAgICAgICAgICAgICAgICAgICJtaXBpLXNkdy1kZWZhdWx0LWZyYW1lLXJhdGUi
LCAKICAgICAgICAgICAgICAgICAgICAgICAgMHhCQjgwCiAgICAgICAgICAgICAgICAgICAg
fSwgCgogICAgICAgICAgICAgICAgICAgIFBhY2thZ2UgKDB4MDIpCiAgICAgICAgICAgICAg
ICAgICAgewogICAgICAgICAgICAgICAgICAgICAgICAibWlwaS1zZHctZGVmYXVsdC1mcmFt
ZS1yb3ctc2l6ZSIsIAogICAgICAgICAgICAgICAgICAgICAgICAweDMyCiAgICAgICAgICAg
ICAgICAgICAgfSwgCgogICAgICAgICAgICAgICAgICAgIFBhY2thZ2UgKDB4MDIpCiAgICAg
ICAgICAgICAgICAgICAgewogICAgICAgICAgICAgICAgICAgICAgICAibWlwaS1zZHctZGVm
YXVsdC1mcmFtZS1jb2wtc2l6ZSIsIAogICAgICAgICAgICAgICAgICAgICAgICAweDBBCiAg
ICAgICAgICAgICAgICAgICAgfSwgCgogICAgICAgICAgICAgICAgICAgIFBhY2thZ2UgKDB4
MDIpCiAgICAgICAgICAgICAgICAgICAgewogICAgICAgICAgICAgICAgICAgICAgICAibWlw
aS1zZHctZHluYW1pYy1mcmFtZS1zaGFwZSIsIAogICAgICAgICAgICAgICAgICAgICAgICBa
ZXJvCiAgICAgICAgICAgICAgICAgICAgfSwgCgogICAgICAgICAgICAgICAgICAgIFBhY2th
Z2UgKDB4MDIpCiAgICAgICAgICAgICAgICAgICAgewogICAgICAgICAgICAgICAgICAgICAg
ICAibWlwaS1zZHctY29tbWFuZC1lcnJvci10aHJlc2hvbGQiLCAKICAgICAgICAgICAgICAg
ICAgICAgICAgWmVybwogICAgICAgICAgICAgICAgICAgIH0sIAoKICAgICAgICAgICAgICAg
ICAgICBQYWNrYWdlICgweDAyKQogICAgICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAg
ICAgICAgICAgICAgImFtZC1zZHctZW5hYmxlIiwgCiAgICAgICAgICAgICAgICAgICAgICAg
IE9uZQogICAgICAgICAgICAgICAgICAgIH0sIAoKICAgICAgICAgICAgICAgICAgICBQYWNr
YWdlICgweDAyKQogICAgICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAgICAg
ICAgImFtZC1zZHctd2FrZXVwLWVuYWJsZSIsIAogICAgICAgICAgICAgICAgICAgICAgICBP
bmUKICAgICAgICAgICAgICAgICAgICB9LCAKCiAgICAgICAgICAgICAgICAgICAgUGFja2Fn
ZSAoMHgwMikKICAgICAgICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAgICAg
ICJhbWQtc2R3LXBvd2VyLW1vZGUiLCAKICAgICAgICAgICAgICAgICAgICAgICAgMHgwMgog
ICAgICAgICAgICAgICAgICAgIH0sIAoKICAgICAgICAgICAgICAgICAgICBQYWNrYWdlICgw
eDAyKQogICAgICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAgICAgICAgImFt
ZC1zZHctbXVsdGktbGFuZS1lbmFibGUiLCAKICAgICAgICAgICAgICAgICAgICAgICAgT25l
CiAgICAgICAgICAgICAgICAgICAgfQogICAgICAgICAgICAgICAgfQogICAgICAgICAgICB9
KQo=
--------------GYPfxEMLY3QW9YLdDXTPIx04
Content-Type: text/plain; charset=UTF-8; name="sysinfo.txt"
Content-Disposition: attachment; filename="sysinfo.txt"
Content-Transfer-Encoding: base64

IyBTeXN0ZW0gaW5mbwoKIyMgRE1JCkFTVVMKUHJvQXJ0IFBYMTMgSE43MzA2RUFDClByb0Fy
dCBQWDEzCkJJT1M6IEFtZXJpY2FuIE1lZ2F0cmVuZHMgSW50ZXJuYXRpb25hbCwgTExDLiBI
TjczMDZFQUMuMzA3IDAxLzI3LzIwMjYKCiMjIENQVQptb2RlbCBuYW1lCTogQU1EIFJZWkVO
IEFJIE1BWCsgMzk1IHcvIFJhZGVvbiA4MDYwUwoKIyMgS2VybmVsCkxpbnV4IGFzdXMtcHgg
Ny4xLjAtcmMzLXB4MTNmaXggIzIgU01QIFBSRUVNUFRfRFlOQU1JQyBUaHUgTWF5IDE0IDIw
OjM4OjU3IE1TSyAyMDI2IHg4Nl82NCBHTlUvTGludXgKCiMjIEFDUCBQQ0kKYzQ6MDAuNSBN
dWx0aW1lZGlhIGNvbnRyb2xsZXIgWzA0ODBdOiBBZHZhbmNlZCBNaWNybyBEZXZpY2VzLCBJ
bmMuIFtBTURdIEF1ZGlvIENvcHJvY2Vzc29yIFsxMDIyOjE1ZTJdIChyZXYgNzApCnJldjog
MHgweDcwCmRyaXZlcjogc25kX3BjaV9wcwoKIyMgU291bmRXaXJlIGRldmljZXMKc2R3LW1h
c3Rlci0wLTAKc2R3LW1hc3Rlci0wLTEKc2R3OjA6MTowMTAyOjAwMDA6MDE6OApzZHc6MDox
OjAxMDI6MDAwMDowMTpiCnNkdzowOjE6MDI1ZDowNzIxOjAxCg==
--------------GYPfxEMLY3QW9YLdDXTPIx04
Content-Type: text/plain; charset=UTF-8; name="trace-summary.txt"
Content-Disposition: attachment; filename="trace-summary.txt"
Content-Transfer-Encoding: base64

IyBUcmFjZSBvZiBvbmUgZmFpbGluZyBzMmlkbGUgY3ljbGUgKGNhcHR1cmVkIDIwMjYtMDUt
MjIpCgojIyBQTSBldmVudHMKTWF5IDIyIDE1OjEwOjQzIGFzdXMtcHgga2VybmVsOiBQTTog
c3VzcGVuZCBlbnRyeSAoczJpZGxlKQpNYXkgMjIgMTU6MTE6MDUgYXN1cy1weCBrZXJuZWw6
IEZyZWV6aW5nIHVzZXIgc3BhY2UgcHJvY2Vzc2VzCk1heSAyMiAxNToxMTowNSBhc3VzLXB4
IGtlcm5lbDogRnJlZXppbmcgdXNlciBzcGFjZSBwcm9jZXNzZXMgY29tcGxldGVkIChlbGFw
c2VkIDAuMDAxIHNlY29uZHMpCk1heSAyMiAxNToxMTowNSBhc3VzLXB4IGtlcm5lbDogRnJl
ZXppbmcgcmVtYWluaW5nIGZyZWV6YWJsZSB0YXNrcwpNYXkgMjIgMTU6MTE6MDUgYXN1cy1w
eCBrZXJuZWw6IEZyZWV6aW5nIHJlbWFpbmluZyBmcmVlemFibGUgdGFza3MgY29tcGxldGVk
IChlbGFwc2VkIDAuMDAwIHNlY29uZHMpCk1heSAyMiAxNToxMTowNSBhc3VzLXB4IGtlcm5l
bDogcHJpbnRrOiBTdXNwZW5kaW5nIGNvbnNvbGUocykgKHVzZSBub19jb25zb2xlX3N1c3Bl
bmQgdG8gZGVidWcpCk1heSAyMiAxNToxMTowNSBhc3VzLXB4IGtlcm5lbDogQUNQSTogRUM6
IGludGVycnVwdCBibG9ja2VkCk1heSAyMiAxNToxMTowNSBhc3VzLXB4IGtlcm5lbDogQUNQ
STogRUM6IGludGVycnVwdCB1bmJsb2NrZWQKTWF5IDIyIDE1OjExOjA1IGFzdXMtcHgga2Vy
bmVsOiBzbmRfcGNpX3BzIDAwMDA6YzQ6MDAuNTogQU1ELVZpOiBFdmVudCBsb2dnZWQgW0lP
X1BBR0VfRkFVTFQgZG9tYWluPTB4MDAxOCBhZGRyZXNzPTB4ZmZmZmZmZmZmZmZmZmZmYyBm
bGFncz0weDAwMzBdCk1heSAyMiAxNToxMTowNSBhc3VzLXB4IGtlcm5lbDogc2xhdmUtdGFz
Mjc4MyBzZHc6MDoxOjAxMDI6MDAwMDowMTo4OiBQTTogZHBtX3J1bl9jYWxsYmFjaygpOiBh
Y3BpX3N1YnN5c19yZXN1bWUgcmV0dXJucyAtMTEwCk1heSAyMiAxNToxMTowNSBhc3VzLXB4
IGtlcm5lbDogc2xhdmUtdGFzMjc4MyBzZHc6MDoxOjAxMDI6MDAwMDowMTo4OiBQTTogZmFp
bGVkIHRvIHJlc3VtZTogZXJyb3IgLTExMApNYXkgMjIgMTU6MTE6MDUgYXN1cy1weCBrZXJu
ZWw6IHNsYXZlLXRhczI3ODMgc2R3OjA6MTowMTAyOjAwMDA6MDE6YjogUE06IGRwbV9ydW5f
Y2FsbGJhY2soKTogYWNwaV9zdWJzeXNfcmVzdW1lIHJldHVybnMgLTExMApNYXkgMjIgMTU6
MTE6MDUgYXN1cy1weCBrZXJuZWw6IHNsYXZlLXRhczI3ODMgc2R3OjA6MTowMTAyOjAwMDA6
MDE6YjogUE06IGZhaWxlZCB0byByZXN1bWU6IGVycm9yIC0xMTAKTWF5IDIyIDE1OjExOjA1
IGFzdXMtcHgga2VybmVsOiBQTTogc3VzcGVuZCBleGl0CgojIyBTdGVhZHktc3RhdGUgc3lt
cHRvbXMgYWZ0ZXIgcmVzdW1lIChmaXJzdCAyMCBsaW5lcykKTWF5IDIyIDE1OjExOjA1IGFz
dXMtcHgga2VybmVsOiBhbWRfc2R3X21hbmFnZXIgYW1kX3Nkd19tYW5hZ2VyLjE6IFNDUF9h
ZGRycGFnZSBpZ25vcmVkIGZvciBTbGF2ZSAxCk1heSAyMiAxNToxMTowNSBhc3VzLXB4IGtl
cm5lbDogc291bmR3aXJlIHNkdy1tYXN0ZXItMC0xOiB0cmYgb24gU2xhdmUgMSBmYWlsZWQ6
LTUgd3JpdGUgYWRkciA4MDg5IGNvdW50IDAKTWF5IDIyIDE1OjExOjA1IGFzdXMtcHgga2Vy
bmVsOiBhbWRfc2R3IGFtZF9zZHc6IEFTb0M6IFBSRV9QTUQ6IHRhczI3ODMtMiBGVTIxIGV2
ZW50IGZhaWxlZDogLTUKTWF5IDIyIDE1OjExOjA1IGFzdXMtcHgga2VybmVsOiBhbWRfc2R3
X21hbmFnZXIgYW1kX3Nkd19tYW5hZ2VyLjE6IFNDUF9hZGRycGFnZSBpZ25vcmVkIGZvciBT
bGF2ZSAxCk1heSAyMiAxNToxMTowNSBhc3VzLXB4IGtlcm5lbDogc291bmR3aXJlIHNkdy1t
YXN0ZXItMC0xOiB0cmYgb24gU2xhdmUgMSBmYWlsZWQ6LTUgd3JpdGUgYWRkciA4MTA5IGNv
dW50IDAKTWF5IDIyIDE1OjExOjA1IGFzdXMtcHgga2VybmVsOiBhbWRfc2R3IGFtZF9zZHc6
IEFTb0M6IFBSRV9QTUQ6IHRhczI3ODMtMiBGVTIzIGV2ZW50IGZhaWxlZDogLTUKTWF5IDIy
IDE1OjExOjA1IGFzdXMtcHgga2VybmVsOiBhbWRfc2R3X21hbmFnZXIgYW1kX3Nkd19tYW5h
Z2VyLjE6IFNDUF9hZGRycGFnZSBpZ25vcmVkIGZvciBTbGF2ZSAyCk1heSAyMiAxNToxMTow
NSBhc3VzLXB4IGtlcm5lbDogc291bmR3aXJlIHNkdy1tYXN0ZXItMC0xOiB0cmYgb24gU2xh
dmUgMiBmYWlsZWQ6LTUgd3JpdGUgYWRkciA4MDg5IGNvdW50IDAKTWF5IDIyIDE1OjExOjA1
IGFzdXMtcHgga2VybmVsOiBhbWRfc2R3IGFtZF9zZHc6IEFTb0M6IFBSRV9QTUQ6IHRhczI3
ODMtMSBGVTIxIGV2ZW50IGZhaWxlZDogLTUKTWF5IDIyIDE1OjExOjA1IGFzdXMtcHgga2Vy
bmVsOiBhbWRfc2R3X21hbmFnZXIgYW1kX3Nkd19tYW5hZ2VyLjE6IFNDUF9hZGRycGFnZSBp
Z25vcmVkIGZvciBTbGF2ZSAyCk1heSAyMiAxNToxMTowNSBhc3VzLXB4IGtlcm5lbDogc291
bmR3aXJlIHNkdy1tYXN0ZXItMC0xOiB0cmYgb24gU2xhdmUgMiBmYWlsZWQ6LTUgd3JpdGUg
YWRkciA4MTA5IGNvdW50IDAKTWF5IDIyIDE1OjExOjA1IGFzdXMtcHgga2VybmVsOiBhbWRf
c2R3IGFtZF9zZHc6IEFTb0M6IFBSRV9QTUQ6IHRhczI3ODMtMSBGVTIzIGV2ZW50IGZhaWxl
ZDogLTUKTWF5IDIyIDE1OjExOjA1IGFzdXMtcHgga2VybmVsOiBydDcyMS1zZGNhIHNkdzow
OjE6MDI1ZDowNzIxOjAxOiBJbml0aWFsaXphdGlvbiBub3QgY29tcGxldGUsIHRpbWVkIG91
dApNYXkgMjIgMTU6MTE6MDUgYXN1cy1weCBrZXJuZWw6IGFtZF9zZHdfbWFuYWdlciBhbWRf
c2R3X21hbmFnZXIuMTogc2xhdmVfc3RhdDoweDEKTWF5IDIyIDE1OjExOjA1IGFzdXMtcHgg
a2VybmVsOiBzb3VuZHdpcmUgc2R3LW1hc3Rlci0wLTE6IFBJTkcgc3RhdHVzOiAweDEKTWF5
IDIyIDE1OjExOjA1IGFzdXMtcHgga2VybmVsOiBhbWRfc2R3X21hbmFnZXIgYW1kX3Nkd19t
YW5hZ2VyLjE6IFNEVzEgY2xvY2sgc3RvcCBzdWNjZXNzZnVsCk1heSAyMiAxNToxMTowNSBh
c3VzLXB4IGtlcm5lbDogYW1kX3Nkd19tYW5hZ2VyIGFtZF9zZHdfbWFuYWdlci4xOiBBTURf
U0RXX0RFVklDRV9TVEFURToweGMKTWF5IDIyIDE1OjExOjA1IGFzdXMtcHgga2VybmVsOiBh
bWRfc2R3X21hbmFnZXIgYW1kX3Nkd19tYW5hZ2VyLjE6IG1jbGsgMjQwMDAwMDAgbWF4IDEy
MDAwMDAwIHJvdyA1MCBjb2wgMTAgZnJhbWVfcmF0ZTo0ODAwMApNYXkgMjIgMTU6MTE6MDUg
YXN1cy1weCBrZXJuZWw6IGFtZF9zZHdfbWFuYWdlciBhbWRfc2R3X21hbmFnZXIuMTogQU1E
X1NEV19ERVZJQ0VfU1RBVEU6MHgwCk1heSAyMiAxNToxMTowNSBhc3VzLXB4IGtlcm5lbDog
c25kX3BjaV9wcyAwMDAwOmM0OjAwLjU6IEFNRC1WaTogRXZlbnQgbG9nZ2VkIFtJT19QQUdF
X0ZBVUxUIGRvbWFpbj0weDAwMTggYWRkcmVzcz0weGZmZmZmZmZmZmZmZmZmZmMgZmxhZ3M9
MHgwMDMwXQpNYXkgMjIgMTU6MTE6MDUgYXN1cy1weCBrZXJuZWw6IHNsYXZlLXRhczI3ODMg
c2R3OjA6MTowMTAyOjAwMDA6MDE6ODogcmVzdW1lOiBpbml0aWFsaXphdGlvbiB0aW1lZCBv
dXQKTWF5IDIyIDE1OjExOjA1IGFzdXMtcHgga2VybmVsOiBhbWRfc2R3X21hbmFnZXIgYW1k
X3Nkd19tYW5hZ2VyLjE6IHNsYXZlX3N0YXQ6MHgxCk1heSAyMiAxNToxMTowNSBhc3VzLXB4
IGtlcm5lbDogc291bmR3aXJlIHNkdy1tYXN0ZXItMC0xOiBQSU5HIHN0YXR1czogMHgxCk1h
eSAyMiAxNToxMTowNSBhc3VzLXB4IGtlcm5lbDogc2xhdmUtdGFzMjc4MyBzZHc6MDoxOjAx
MDI6MDAwMDowMTo4OiBQTTogZHBtX3J1bl9jYWxsYmFjaygpOiBhY3BpX3N1YnN5c19yZXN1
bWUgcmV0dXJucyAtMTEwCk1heSAyMiAxNToxMTowNSBhc3VzLXB4IGtlcm5lbDogc2xhdmUt
dGFzMjc4MyBzZHc6MDoxOjAxMDI6MDAwMDowMTo4OiBQTTogZmFpbGVkIHRvIHJlc3VtZTog
ZXJyb3IgLTExMAoKIyMgc3VzcGVuZF9zdGF0cyBhZnRlciBmYWlsdXJlCmxhc3RfZmFpbGVk
X2RldjogIHNkdzowOjE6MDEwMjowMDAwOjAxOmIKbGFzdF9mYWlsZWRfc3RlcDogcmVzdW1l
CihjYXB0dXJlZCAyMDI2LTA1LTIyKQo=

--------------GYPfxEMLY3QW9YLdDXTPIx04--
