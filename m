Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7FC38399C
	for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 15:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784561584; cv=none; b=hdr/4vmCtc07cIshKV0zKQN/oehR8MjrxQAdPVSv3IiiUQKKytaPMS7eetEe1SkmrVRbxvN+fRg+TbhcdioG103WZTLi40AqrPmRYlqVVKqC3xw9iGirYR62RaFnAH9xTryCvMFwU10Tm37o5UtfwMzvAzsMeo3G4O+lPBj09ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784561584; c=relaxed/simple;
	bh=uhzdhc61xZd8Kx1IIyNSCCZJXdPKH9LXQf3d3/pDCTQ=;
	h=Message-ID:Date:MIME-Version:To:Cc:Subject:From:Content-Type; b=a7SEAVtv9IOIkGprrRI2/YITA88E69LXPKzKoTbkXzM1QC1P+e0pmN5j5liQgO5BAvxo0kc6yRp2mW52HcoOLCf8ltY6E7FRz2kpNqFUVoU4BPbI7Jitmv328WAG4HLOlIYzAF/L3kvrKNcPhvZIp9YD2Zo0uYwmc4Q+uFh7uQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=montane.tech; spf=pass smtp.mailfrom=montane.tech; dkim=pass (2048-bit key) header.d=montane-tech.20251104.gappssmtp.com header.i=@montane-tech.20251104.gappssmtp.com header.b=gLW53BGE; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=montane.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=montane.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=montane-tech.20251104.gappssmtp.com header.i=@montane-tech.20251104.gappssmtp.com header.b="gLW53BGE"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-474560436c3so5197921f8f.0
        for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 08:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=montane-tech.20251104.gappssmtp.com; s=20251104; t=1784561578; x=1785166378; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=D5OOOe6nNPQjGlxncxW8iUqr846rQEmjKm05v/1uXrc=;
        b=gLW53BGEgmTBgg4ext/mAVsKB+/J5+tVSPvZvyvdyLKKC+n9rAp48xfyIT3X+tRnd2
         +dm7pi6Sm+3Qf2sb9nYDPMbNHxT6oJG1KbnfllxS+BPsgLlq/gVCPDUw7gbZQZQBxCv3
         8u73ITych/SrGQYgEISEKUJHF1ESryMBwMKNy2z+8sIDRbBAeWyoC2DnivM7KYAaWE6H
         tWcW6NbguN6BFyNrob+KDZBoBJG6RFFv/Nyl6EVvHizrPc5Yr8iNWF3722G11E1uvFZf
         w7oitCLEpaSkW/VCdf/eq/A3N6qaJ2N7m/eTg4uZ/xdDcroYtvxPQOcBfAKoLRL25g30
         5l0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784561578; x=1785166378;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D5OOOe6nNPQjGlxncxW8iUqr846rQEmjKm05v/1uXrc=;
        b=HUkjhzOJbbcjpe8k0n95Xx5Gw9E3u4H+Qc3/dWuMbu5IxR0q5Adp/tmpTm9xifuzFD
         6EVWSdwK0W41kKaupWbMT8xItEmCe7TokybtfkAlFU6l8Z0Co1t0GTh9kg1Su16mjHU5
         RSqGy73IQOzwhgm42bNj3wRQJtz0oKo844e4VK4vLkvn6z/cCU2AXScojFtcYBmQlb6u
         zQ3NAwz75vqPKgfP8JnWQu6Zc+xK2L/VyssHdEli982JUrAn79KX+u4dM7kafbPgRSgD
         Df+nSgSGSM3HjvAIfSu9uTamswVvdmziXSWfTsZaKdQttlBMh5cS+iDbz5hfmoS1Y3i3
         3cOw==
X-Gm-Message-State: AOJu0YwTy9z9nNGk7IDPrUs0JVeMN9ABhNPu5w12S2NH2WcG+quT4Npv
	oUUqt2HEH2AnDjnKIJJ2oGmnSzRx7NgkQ1fyU7zi37gQwn9PxbXG4vH6uc9otqTIpg2+T0OdB8I
	gyFaHhUCvJg==
X-Gm-Gg: AR+sD11T10Sg6B7Ic2v7B3IdAAYweNgIbX8q0w1wNOMaVRX+WjQNUV6QK8rv9gn/MWV
	cMqF7wgG9OPTgSCdUszutvMZA3yrvYG94Lqa2fZDCkiQkXIGTf4eSWiGpNPYFIGEdAgmDipoYfp
	JsiCY4AQuGexqcw7zgKbI8fnJsfavfEx7J/r1z9YoQXZeOGxlehhtIp1RU02RN6T4PjVAvypqna
	p5ZqSUJ9rc3OxJrFnE/tmkREHdinkH2yRkaIf9fov1xH3I0rOxLf9v0DdpLn17YsA+p+yQuqk8W
	zKX4HW3FjiPCo0qa4TV1mifW+oADCtym1G+OYFFwdwF/D7/FPoAW1dTaczGL/SO+4Mic8cEj0CC
	2DVCdNMYNJcBeA83yNtGevmECbxPlXn10M/rG2enkIMBzfjeUwJe72A7FY5TDzkkVQr5jYnoJ96
	vfhG25eukYVeTCo+szgAMYKcBgkNu6w180sYN7rqDIlI3OtjddGEL33w==
X-Received: by 2002:a05:6000:40c7:b0:47d:fc45:8587 with SMTP id ffacd0b85a97d-47f622c6242mr16916578f8f.0.1784561577916;
        Mon, 20 Jul 2026 08:32:57 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f07:9aa0:48d:8f1d:3ade:9bb? ([2a01:e0a:f07:9aa0:48d:8f1d:3ade:9bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f6fa848fcsm20907474f8f.0.2026.07.20.08.32.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 08:32:57 -0700 (PDT)
Message-ID: <466a905d-8203-46d2-bfe4-a3b3f9b5d68b@montane.tech>
Date: Mon, 20 Jul 2026 17:32:56 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-sound@vger.kernel.org
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Vinod Koul
 <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Shenghao Ding <shenghao-ding@ti.com>, linux-kernel@vger.kernel.org
Subject: SoundWire: amd: all peripherals stay UNATTACHED after s2idle resume
 (AMD ACP70, ASUS ProArt PX13 HN7306)
Content-Language: en-US
From: Antoine Monnet <antoine@montane.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On an ASUS ProArt PX13 (HN7306, Ryzen AI Max / "Strix Halo", ACP rev 
0x70), all
SoundWire peripherals on link 1 fail to re-attach after a single s2idle
suspend/resume cycle. Audio works after a cold boot and is permanently 
broken
after the first resume; only a reboot recovers it. No amount of driver-level
re-initialisation from userspace helps (details below).

Environment
-----------
Machine : ASUS ProArt PX13, HN7306 (Ryzen AI Max, "Strix Halo")
Distro : Debian 13 (trixie)
Kernel : 7.0.13+deb13-amd64 (Debian 7.0.13-1~bpo13+1) -- fails
7.1.4+deb14-amd64 (Debian 7.1.4-1, sid) -- fails identically
ACP : 0000:c4:00.5 Audio Coprocessor [1022:15e2] rev 0x70,
subsystem ASUSTeK [1043:1714], driver snd_pci_ps
Link 1 : 2x TAS2783 smart-amps (slaves 0x8 / 0xB) + rt721-sdca jack codec
sdw:0:1:0102:0000:01:8, sdw:0:1:0102:0000:01:b,
sdw:0:1:025d:0721:01
Card : 1 [amdsoundwire]: amd-soundwire -
ASUSTeKCOMPUTERINC.-ProArtPX13HN7306EAC-1.0-HN7306EAC

Symptom
-------
After "PM: suspend entry (s2idle)" / "PM: suspend exit":

rt721-sdca sdw:0:1:025d:0721:01: Initialization not complete, timed out
slave-tas2783 sdw:0:1:0102:0000:01:8: resume: initialization timed out
slave-tas2783 sdw:0:1:0102:0000:01:8: PM: dpm_run_callback():
acpi_subsys_resume returns -110
slave-tas2783 sdw:0:1:0102:0000:01:8: PM: failed to resume: error -110
slave-tas2783 sdw:0:1:0102:0000:01:b: resume: initialization timed out
slave-tas2783 sdw:0:1:0102:0000:01:b: PM: failed to resume: error -110

and subsequently, on any playback attempt:

rt721-sdca sdw:0:1:025d:0721:01: SDW_SCP_BUSCLOCK_SCALE register write 
failed
soundwire sdw-master-0-1: Program params failed: -61
SDW1-PIN1-PLAYBACK-SmartAmp: ASoC error (-61): at snd_soc_link_prepare()

All three peripherals report UNATTACHED indefinitely:

# for d in /sys/bus/soundwire/devices/sdw:*; do \
echo "$(basename $d) $(cat $d/status)"; done
sdw:0:1:0102:0000:01:8 UNATTACHED
sdw:0:1:0102:0000:01:b UNATTACHED
sdw:0:1:025d:0721:01 UNATTACHED

Why this is not a codec bug
---------------------------
Three *different* codec drivers (TI tas2783-sdw on two devices, and
rt721-sdca) fail identically, all timing out on
wait_for_completion_timeout(&slave->initialization_complete). The subsequent
bus-level register writes fail with -ENODATA, i.e. the peripherals are not
responding on the bus at all. This is below the codec drivers.

A full ACP re-probe does not recover it
---------------------------------------
Unbinding and re-binding the ACP PCI device forces a complete teardown and
fresh probe of the SoundWire managers:

# echo 0000:c4:00.5 > /sys/bus/pci/drivers/snd_pci_ps/unbind
# echo 0000:c4:00.5 > /sys/bus/pci/drivers/snd_pci_ps/bind

After this, amd_sdw_manager.0/.1 are re-bound (so 
amd_sdw_manager_probe() has
re-run amd_init_sdw_manager() / amd_enable_sdw_interrupts() /
amd_enable_sdw_manager() / amd_sdw_set_frameshape()), yet all three 
peripherals
remain UNATTACHED. Driver-level unbind/rebind of the individual codec 
devices
and a full codec module reload are equally ineffective. Only a cold reboot
restores audio.

Since a from-scratch probe performs a strict superset of what
amd_resume_runtime() does, no additional re-initialisation in the manager's
resume path can fix this — the peripherals appear to be left unpowered 
or held
in reset across s2idle, and nothing the kernel does re-powers them.

ACPI configuration (verified)
-----------------------------
 From this machine's ACPI tables (SSDT, mipi-sdw-link-1-subproperties / 
"SWM1",
the link the codecs are on):

amd-sdw-enable 1
amd-sdw-wakeup-enable 1 -> wake_en_mask = 1
amd-sdw-power-mode 2 -> AMD_SDW_POWER_OFF_MODE
amd-sdw-multi-lane-enable 1
mipi-sdw-clock-stop-mode0-supported 1
mipi-sdw-clock-stop-mode1-supported 0

So power_mode_mask = AMD_SDW_POWER_OFF_MODE, i.e. amd_suspend() runs
amd_sdw_clock_stop() + amd_deinit_sdw_manager() + D3, and 
amd_resume_runtime()
(also the system-resume callback via SET_SYSTEM_SLEEP_PM_OPS) takes the
POWER_OFF_MODE branch and does the full re-initialisation:
sdw_clear_slave_status(SDW_UNATTACH_REQUEST_MASTER_RESET),
amd_init_sdw_manager(), amd_enable_sdw_interrupts(), 
amd_enable_sdw_manager(),
amd_sdw_set_frameshape(), D0.

That re-init demonstrably runs and the peripherals still never attach, 
which is
consistent with the ACP unbind/rebind result above.

Still present in 7.1.4; unchanged in 7.2-rc3
--------------------------------------------
I retested on Debian's 7.1.4 (7.1.4+deb14-amd64). The failure is 
identical: all
three peripherals UNATTACHED after one s2idle cycle, rt721-sdca reporting
"Initialization not complete, timed out" and "PM: failed to resume: 
error -110".
(The TAS2783 devices are silent in the log there only because Debian 
does not
set CONFIG_SND_SOC_TAS2783_SDW, so no codec driver is bound to them; 
their bus
status is UNATTACHED all the same.)

Note this rules out one plausible candidate: 7.1 added 
amd_sdw_clk_init_ctrl()
(commit 2a267a841084, "soundwire: amd: add clock init control 
function"), which
programs ACP_SW_CLK_FREQUENCY_CTRL and is called from the POWER_OFF_MODE 
resume
branch — a register the 7.0.x driver never writes at all. That reprogramming
does not help here.

drivers/soundwire/amd_manager.c is byte-identical between v7.1.4 and 
v7.2-rc3,
so I have not test-booted 7.2.

One further detail looks suspicious, though I have not confirmed it is the
cause: in the POWER_OFF_MODE branch of amd_resume_runtime(), the clock 
resume
handshake is conditional —

val = readl(amd_manager->mmio + ACP_SW_CLK_RESUME_CTRL);
if (val) {
val |= AMD_SDW_CLK_RESUME_REQ;
...poll for AMD_SDW_CLK_RESUME_DONE...
if (val & AMD_SDW_CLK_RESUME_DONE) {
writel(0, ...);
amd_manager->clk_stopped = false;
}
}

After amd_deinit_sdw_manager() and a D3 transition the register block 
may well
read back as 0, in which case AMD_SDW_CLK_RESUME_REQ is never issued and
amd_manager->clk_stopped stays true from suspend. Whether the peripherals
require that clock-resume handshake before they will re-attach is a 
question for
someone with the ACP70 programming documentation.

I am not sure whether the correct fix belongs in the manager driver, in ACP
platform power handling, or in this board's firmware; guidance welcome.

Reproduce
---------
1. Cold boot; confirm internal speakers play.
2. systemctl suspend (s2idle); wake.
3. All link-1 peripherals are UNATTACHED; playback fails with -61.
4. ACP unbind/bind, codec rebind, and codec module reload do not recover;
only a reboot does.

Happy to test patches, add debug prints, or dump registers on this hardware.

Thanks,

Antoine

