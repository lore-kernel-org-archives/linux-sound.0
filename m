Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8332594A2;
	Wed,  8 Jan 2025 14:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736345470; cv=none; b=C/QKuiOBaHsrn2e+2qolaBpl+XOuJK9tDOtQ/W1nJDiPD+ypMPqckf0wPNHd/Yd4k2/7epGdT6LJIFb360j0rJ0syk3oqnFn5dV9CPtFHazHFglS07jluBg0awhugIBibnTl7yznFrZsN20U4n+W9Hvb23LevB9BAGhYEuWIKTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736345470; c=relaxed/simple;
	bh=IgLhVj3cqBQv1CESm2HlhmaNYR0nVa0tCj/gbKMX/u0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bL3k2yEB+q/QzfHFm7uLlJ24vi9ux9gwbPq0WO+s+ZXpHi0MO4L4hK2hfIh9mviAMtMMOzDFaMRXy8MvoCPgDr/abcf65yeHBmX7MuIRAkJ3m6Sjmwk/uRfcgc/L8CVudlYKhvFJ5Nva8N7B8A1brVDfFWqg8OGFuHx7DpT5MtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=buLcz9oh; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="buLcz9oh"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5086KKpC022021;
	Wed, 8 Jan 2025 08:11:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=s2V4Gb9Hf+DJ6YeD
	tch9gqrndwHWhAIGW3/96SE/MYU=; b=buLcz9oh1LJ9spY/ftxTJEh5fX0RQACg
	Vffv4Y/ubjJAmCJWngwpKdLK9RG0aJMp0adEYho7Sxo3He9MKsltyiWrMGs0/Ihz
	STKVdUp0lxfI0lu5fH9k5HMa+Mnx5QNNmEjM4OWzKCHPATUipHkXXXkFvs8Nf6vt
	Zu1C9rGWxMdRZquEZcE4MayUXjNYO/4VEPEp6WEqq3LxUwhTjrmlqPWd3+dyfiyx
	g8SQdttFgSD0FwZpzEMk2Zr7d13Ni2IFVzk/wrStH8ZWPbzqXKRv23ptCmYZeRX6
	VtqbJPCODXaHcLxHbVcFST82HBi2JXDlkqjhsQR7QIXykGS7sOT4ug==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 43y29kcr7m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 08:11:00 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Wed, 8 Jan
 2025 14:10:58 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Wed, 8 Jan 2025 14:10:58 +0000
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com [198.61.68.170])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 1E424820248;
	Wed,  8 Jan 2025 14:10:58 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-sound@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Richard
 Fitzgerald" <rf@opensource.cirrus.com>
Subject: [PATCH] ALSA: doc: cs35l56: Add information about Cirrus Logic CS35L54/56/57
Date: Wed, 8 Jan 2025 14:10:45 +0000
Message-ID: <20250108141045.1032-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: NgpUBka5JF7MNLd3mCCikSwtc5RArBDu
X-Proofpoint-GUID: NgpUBka5JF7MNLd3mCCikSwtc5RArBDu
X-Proofpoint-Spam-Reason: safe

Add documentation for the Cirrus Logic CS35L54/56/57 amps, which are
all managed by the cs35l56 drivers.

The aim and scope of this documentation is to provide troubleshooting
information for end-users.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 Documentation/sound/codecs/cs35l56.rst | 292 +++++++++++++++++++++++++
 Documentation/sound/codecs/index.rst   |   9 +
 MAINTAINERS                            |   1 +
 3 files changed, 302 insertions(+)
 create mode 100644 Documentation/sound/codecs/cs35l56.rst
 create mode 100644 Documentation/sound/codecs/index.rst

diff --git a/Documentation/sound/codecs/cs35l56.rst b/Documentation/sound/codecs/cs35l56.rst
new file mode 100644
index 000000000000..98c6f6c74394
--- /dev/null
+++ b/Documentation/sound/codecs/cs35l56.rst
@@ -0,0 +1,292 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+=====================================================================
+Audio drivers for Cirrus Logic CS35L54/56/57 Boosted Smart Amplifiers
+=====================================================================
+:Copyright: 2025 Cirrus Logic, Inc. and
+                 Cirrus Logic International Semiconductor Ltd.
+
+Contact: patches@opensource.cirrus.com
+
+Summary
+=======
+
+The high-level summary of this document is:
+
+**If you have a laptop that uses CS35L54/56/57 amplifiers but audio is not
+working, DO NOT ATTEMPT TO USE FIRMWARE AND SETTINGS FROM ANOTHER LAPTOP,
+EVEN IF THAT LAPTOP SEEMS SIMILAR.**
+
+The CS35L54/56/57 amplifiers must be correctly configured for the power
+supply voltage, speaker impedance, maximum speaker voltage/current, and
+other external hardware connections.
+
+The amplifiers feature advanced boost technology that increases the voltage
+used to drive the speakers, while proprietary speaker protection algorithms
+allow these boosted amplifiers to push the limits of the speakers without
+causing damage. These **must** be configured correctly.
+
+Supported Cirrus Logic amplifiers
+---------------------------------
+
+The cs35l56 drivers support:
+
+* CS35L54
+* CS35L56
+* CS35L57
+
+There are two drivers in the kernel
+
+*For systems using SoundWire*: sound/soc/codecs/cs35l56.c and associated files
+
+*For systems using HDA*: sound/pci/hda/cs35l56_hda.c
+
+Firmware
+========
+
+The amplifier is controlled and managed by firmware running on the internal
+DSP. Firmware files are essential to enable the full capabilities of the
+amplifier.
+
+Firmware is distributed in the linux-firmware repository:
+https://gitlab.com/kernel-firmware/linux-firmware.git
+
+On most SoundWire systems the amplifier has a default minimum capability to
+produce audio. However this will be
+
+* at low volume, to protect the speakers, since the speaker specifications
+  and power supply voltages are unknown.
+* a mono mix of left and right channels.
+
+On some SoundWire systems that have both CS42L43 and CS35L56/57 the CS35L56/57
+receive their audio from the CS42L43 instead of directly from the host
+SoundWire interface. These systems can be identified by the CS42L43 showing
+in dmesg as a SoundWire device, but the CS35L56/57 as SPI. On these systems
+the firmware is *mandatory* to enable receiving the audio from the CS42L43.
+
+On HDA systems the firmware is *mandatory* to enable HDA bridge mode. There
+will not be any audio from the amplifiers without firmware.
+
+Cirrus Logic firmware files
+---------------------------
+
+Each amplifier requires two firmware files. One file has a .wmfw suffix, the
+other has a .bin suffix.
+
+The firmware is customized by the OEM to match the hardware of each laptop,
+and the firmware is specific to that laptop. Because of this, there are many
+firmware files in linux-firmware for these amplifiers. Firmware files are
+**not interchangeable between laptops**.
+
+Cirrus Logic submits files for known laptops to the upstream linux-firmware
+repository. Providing Cirrus Logic is aware of a particular laptop and has
+permission from the manufacturer to publish the firmware, it will be pushed
+to linux-firmware. You may need to upgrade to a newer release of
+linux-firmware to obtain the firmware for your laptop.
+
+**Important:** the Makefile for linux-firmware creates symlinks that are listed
+in the WHENCE file. These symlinks are required for the CS35L56 driver to be
+able to load the firmware.
+
+How do I know which firmware file I should have?
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+All firmware file names are qualified with a unique "system ID". On normal
+x86 PCs with PCI audio this is the Vendor Subsystem ID (SSID) of the host
+PCI audio interface.
+
+The SSID can be viewed using the lspci tool::
+
+  lspci -v -nn | grep -A2 -i audio
+  0000:00:1f.3 Audio device [0403]: Intel Corporation Meteor Lake-P HD Audio Controller [8086:7e28]
+  Subsystem: Dell Meteor Lake-P HD Audio Controller [1028:0c63]
+
+In this example the SSID is 10280c63.
+
+The format of the firmware file names is:
+
+    cs35lxx-b0-dsp1-misc-SSID[-spkidX]-ampN
+
+Where:
+
+  * cs35lxx-b0 is the amplifier model and silicon revision. This information
+    is logged by the driver during initialization.
+  * SSID is the 8-digit hexadecimal SSID value.
+  * ampN is the amplifier number (for example amp1). This is the same as
+    the prefix on the ALSA control names except that it is always lower-case
+    in the file name.
+  * spkidX is an optional part, used for laptops that have firmware
+    configurations for different makes and models of internal speakers.
+
+Sound Open Firmware and ALSA topology files
+-------------------------------------------
+
+All SoundWire systems will require a Sound Open Firmware (SOF) for the
+host CPU audio DSP, together with an ALSA topology file (.tplg).
+
+The SOF firmware will usually be provided by the manufacturer of the host
+CPU (i.e. Intel or AMD). The .tplg file is normally part of the SOF firmware
+release.
+
+SOF binary builds are available from: https://github.com/thesofproject/sof-bin/releases
+
+The main SOF source is here: https://github.com/thesofproject
+
+ALSA-ucm configurations
+-----------------------
+Typically an appropriate ALSA-ucm configuration file is needed for
+use-case managers and audio servers such as PipeWire.
+
+Configuration files are available from the alsa-ucm-conf repository:
+https://git.alsa-project.org/?p=alsa-ucm-conf.git
+
+Kernel log messages
+===================
+
+SoundWire
+---------
+A successful initialization will look like this (this will be repeated for
+each amplifier)::
+
+  [ 7.568374] cs35l56 sdw:0:0:01fa:3556:01:0: supply VDD_P not found, using dummy regulator
+  [ 7.605208] cs35l56 sdw:0:0:01fa:3556:01:0: supply VDD_IO not found, using dummy regulator
+  [ 7.605313] cs35l56 sdw:0:0:01fa:3556:01:0: supply VDD_A not found, using dummy regulator
+  [ 7.939279] cs35l56 sdw:0:0:01fa:3556:01:0: Cirrus Logic CS35L56 Rev B0 OTP3 fw:3.4.4 (patched=0)
+  [ 7.947844] cs35l56 sdw:0:0:01fa:3556:01:0: Slave 4 state check1: UNATTACHED, status was 1
+  [ 8.740280] cs35l56 sdw:0:0:01fa:3556:01:0: supply VDD_B not found, using dummy regulator
+  [ 8.740552] cs35l56 sdw:0:0:01fa:3556:01:0: supply VDD_AMP not found, using dummy regulator
+  [ 9.242164] cs35l56 sdw:0:0:01fa:3556:01:0: DSP1: cirrus/cs35l56-b0-dsp1-misc-xxxxxxxx.wmfw: format 3 timestamp 0x66b2b872
+  [ 9.242173] cs35l56 sdw:0:0:01fa:3556:01:0: DSP1: cirrus/cs35l56-b0-dsp1-misc-xxxxxxxx.wmfw: Tue 05 Dec 2023 21:37:21 GMT Standard Time
+  [ 9.991709] cs35l56 sdw:0:0:01fa:3556:01:0: DSP1: Firmware: 1a00d6 vendor: 0x2 v3.11.23, 41 algorithms
+  [10.039098] cs35l56 sdw:0:0:01fa:3556:01:0: DSP1: cirrus/cs35l56-b0-dsp1-misc-xxxxxxxx-amp1.bin: v3.11.23
+  [10.879235] cs35l56 sdw:0:0:01fa:3556:01:0: Slave 4 state check1: UNATTACHED, status was 1
+  [11.401536] cs35l56 sdw:0:0:01fa:3556:01:0: Calibration applied
+
+HDA
+---
+A successful initialization will look like this (this will be repeated for
+each amplifier)::
+
+  [ 6.306475] cs35l56-hda i2c-CSC3556:00-cs35l56-hda.0: Cirrus Logic CS35L56 Rev B0 OTP3 fw:3.4.4 (patched=0)
+  [ 6.613892] cs35l56-hda i2c-CSC3556:00-cs35l56-hda.0: DSP system name: 'xxxxxxxx', amp name: 'AMP1'
+  [ 8.266660] snd_hda_codec_cs8409 ehdaudio0D0: bound i2c-CSC3556:00-cs35l56-hda.0 (ops cs35l56_hda_comp_ops [snd_hda_scodec_cs35l56])
+  [ 8.287525] cs35l56-hda i2c-CSC3556:00-cs35l56-hda.0: DSP1: cirrus/cs35l56-b0-dsp1-misc-xxxxxxxx.wmfw: format 3 timestamp 0x66b2b872
+  [ 8.287528] cs35l56-hda i2c-CSC3556:00-cs35l56-hda.0: DSP1: cirrus/cs35l56-b0-dsp1-misc-xxxxxxxx.wmfw: Tue 05 Dec 2023 21:37:21 GMT Standard Time
+  [ 9.984335] cs35l56-hda i2c-CSC3556:00-cs35l56-hda.0: DSP1: Firmware: 1a00d6 vendor: 0x2 v3.11.23, 41 algorithms
+  [10.085797] cs35l56-hda i2c-CSC3556:00-cs35l56-hda.0: DSP1: cirrus/cs35l56-b0-dsp1-misc-xxxxxxxx-amp1.bin: v3.11.23
+  [10.655237] cs35l56-hda i2c-CSC3556:00-cs35l56-hda.0: Calibration applied
+
+Important messages
+~~~~~~~~~~~~~~~~~~
+Cirrus Logic CS35L56 Rev B0 OTP3 fw:3.4.4 (patched=0)
+  Shows that the driver has been able to read device ID registers from the
+  amplifier.
+
+    * The actual amplifier type and silicon revision (CS35L56 B0 in this
+      example) is shown, as read from the amplifier identification registers.
+    * (patched=0) is normal, and indicates that the amplifier has been hard
+      reset and is running default ROM firmware.
+    * (patched=1) means that something has previously downloaded firmware
+      to the amplifier and the driver does not have control of the RESET
+      signal to be able to replace this preloaded firmware. This is normal
+      for systems where the BIOS downloads firmware to the amplifiers
+      before OS boot.
+      This status can also be seen if the cs35l56 kernel module is unloaded
+      and reloaded on a system where the driver does not have control of
+      RESET. SoundWire systems typically do not give the driver control of
+      RESET and only a BIOS (re)boot can reset the amplifiers.
+
+DSP1: cirrus/cs35l56-b0-dsp1-misc-xxxxxxxx.wmfw
+  Shows that a .wmfw firmware file was found and downloaded.
+
+DSP1: cirrus/cs35l56-b0-dsp1-misc-xxxxxxxx-amp1.bin
+  Shows that a .bin firmware file was found and downloaded.
+
+Calibration applied
+  Factory calibration data in EFI was written to the amplifier.
+
+Error messages
+==============
+This section explains some of the error messages that the driver can log.
+
+Algorithm coefficient version %d.%d.%d but expected %d.%d.%d
+  The version of the .bin file content does not match the loaded firmware.
+  Caused by mismatched .wmfw and .bin file, or .bin file was found but
+  .wmfw was not.
+
+No %s for algorithm %x
+  The version of the .bin file content does not match the loaded firmware.
+  Caused by mismatched .wmfw and .bin file, or .bin file was found but
+  .wmfw was not.
+
+.bin file required but not found
+  HDA driver did not find a .bin file that matches this hardware.
+
+Calibration disabled due to missing firmware controls
+  Driver was not able to write EFI calibration data to firmware registers.
+  This typically means that either:
+
+    * The driver did not find a suitable wmfw for this hardware, or
+    * The amplifier has already been patched with firmware by something
+      previously, and the driver does not have control of a hard RESET line
+      to be able to reset the amplifier and download the firmware files it
+      found. This situation is indicated by the device identification
+      string in the kernel log shows "(patched=1)"
+
+Failed to write calibration
+  Same meaning and cause as "Calibration disabled due to missing firmware
+  controls"
+
+Failed to read calibration data from EFI
+  Factory calibration data in EFI is missing, empty or corrupt.
+  This is most likely to be cause by accidentally deleting the file from
+  the EFI filesystem.
+
+No calibration for silicon ID
+  The factory calibration data in EFI does not match this hardware.
+  The most likely cause is that an amplifier has been replaced on the
+  motherboard without going through manufacturer calibration process to
+  generate calibration data for the new amplifier.
+
+Did not find any buses for CSCxxxx
+  Only on HDA systems. The HDA codec driver found an ACPI entry for
+  Cirrus Logic companion amps, but could not enumerate the ACPI entries for
+  the I2C/SPI buses. The most likely cause of this is that:
+
+    * The relevant bus driver (I2C or SPI) is not part of the kernel.
+    * The HDA codec driver was built-in to the kernel but the I2C/SPI
+      bus driver is a module and so the HDA codec driver cannot call the
+      bus driver functions.
+
+init_completion timed out
+  The SoundWire bus controller (host end) did not enumerate the amplifier.
+  In other words, the ACPI says there is an amplifier but for some reason
+  it was not detected on the bus.
+
+No AF01 node
+  Indicates an error in ACPI. A SoundWire system should have a Device()
+  node named "AF01" but it was not found.
+
+Failed to get spk-id-gpios
+  ACPI says that the driver should request a GPIO but the driver was not
+  able to get that GPIO. The most likely cause is that the kernel does not
+  include the correct GPIO or PINCTRL driver for this system.
+
+Failed to read spk-id
+  ACPI says that the driver should request a GPIO but the driver was not
+  able to read that GPIO.
+
+Unexpected spk-id element count
+  AF01 contains more speaker ID GPIO entries than the driver supports
+
+Overtemp error
+  Amplifier overheat protection was triggered and the amplifier shut down
+  to protect itself.
+
+Amp short error
+  Amplifier detected a short-circuit on the speaker output pins and shut
+  down for protection. This would normally indicate a damaged speaker.
+
+Hibernate wake failed
+  The driver tried to wake the amplifier from its power-saving state but
+  did not see the expected responses from the amplifier. This can be caused
+  by using firmware that does not match the hardware.
diff --git a/Documentation/sound/codecs/index.rst b/Documentation/sound/codecs/index.rst
new file mode 100644
index 000000000000..2cb95d87bbef
--- /dev/null
+++ b/Documentation/sound/codecs/index.rst
@@ -0,0 +1,9 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Codec-Specific Information
+==========================
+
+.. toctree::
+   :maxdepth: 2
+
+   cs35l56
diff --git a/MAINTAINERS b/MAINTAINERS
index 91bcdf21e7ba..6ec01891e83e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5469,6 +5469,7 @@ L:	linux-sound@vger.kernel.org
 L:	patches@opensource.cirrus.com
 S:	Maintained
 F:	Documentation/devicetree/bindings/sound/cirrus,cs*
+F:	Documentation/sound/codecs/cs*
 F:	drivers/mfd/cs42l43*
 F:	drivers/pinctrl/cirrus/pinctrl-cs42l43*
 F:	drivers/spi/spi-cs42l43*
-- 
2.43.0

