Received: from mx.brightberry.eu (mx.brightberry.eu [185.229.55.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738E41EFFA1
	for <linux-sound@vger.kernel.org>; Sat,  2 May 2026 23:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.229.55.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777764672; cv=none; b=S95YbKDCIY4ErW7jd/chm6S3q+ykVYkpaWpp/Rk3Oi5vS+Hq/oU3dP4Qm/yqMHhUiymrLbVmgI2zMasSI6qOc6Wc4s0kxN3eAssHizGYpDyJwl/tz23quttXN1MD5gosntimieUsdb7Mfxskb30innN3iC0HEutKA10yNnPl6Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777764672; c=relaxed/simple;
	bh=AJSiv4rlM1Y72yTCDwIkevBY2jyeOE4AJNNWaG9HSkA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Ly2dNws3Lbj3344J5Bev19Xpbb2/SSstkL/Aaz2aKwD35f0mo22hYgfwg8dH9XosJ7b3bLDCZaVH1qBk/2VyB5WiRUNwXU2rhbUse5a3BkZ2DEtYSZ5xqsB2oTnye6ffJngKNQDvs7Va98pxQSPBnH9IKsQoJlKAHi+AxQBILWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vanraaij.eu; spf=pass smtp.mailfrom=vanraaij.eu; arc=none smtp.client-ip=185.229.55.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vanraaij.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vanraaij.eu
Received: from mx.brightberry.eu (localhost [127.0.0.1])
	by mx.brightberry.eu (Proxmox) with ESMTP id 601232A01;
	Sun, 03 May 2026 01:31:03 +0200 (CEST)
Received: from d3cold-bug-report.eml (YST00841.fritz.box [192.168.178.64])
	by mx.brightberry.eu (Proxmox) with ESMTP id 40E62100F;
	Sun, 03 May 2026 01:31:03 +0200 (CEST)
From: =?UTF-8?q?R=C3=A1mon_van_Raaij?= <ramon@vanraaij.eu>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>, Shenghao Ding <shenghao-ding@ti.com>
Subject: [BUG] snd_hda_scodec_tas2781_i2c: parent I2C controller enters D3cold during idle, erasing amp register state
Date: Sun, 03 May 2026 01:30:50 +0200
Message-Id: <20260502230243.bug2-ramon@vanraaij.eu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Machine:  Lenovo Yoga Pro 9 16IMH9 (board name 83DN)
Kernel:   7.0.3-zen1-1-zen (linux-zen)
Amps:     2x TI TAS2781, ACPI HID TIAS2781, I2C bus i2c-4
          (I2C controller: PCI 0000:00:15.2, Intel DesignWare / Meteor Lake)
Related:  <20260501175633.bug1-ramon@vanraaij.eu>
          (DSP firmware fails at cold boot - separate issue, same hardware)

PROBLEM
-------
After approximately 5 minutes of audio inactivity the built-in speakers
drop to ~10-15% of normal volume. No dmesg message is emitted and no
driver error is reported. Audio continues to function at the low volume;
the issue is not a complete failure. The drop is not tied to display
power-off; it occurs during I2C bus inactivity regardless of display state.

ROOT CAUSE
----------
The TAS2781 amplifiers sit on a Synopsys DesignWare I2C bus whose parent
PCI device (0000:00:15.2) defaults to power/control=auto. During deep
idle the kernel runtime-suspends this controller. When the controller
enters D3cold (which ACPI can gate the power rail for), the entire I2C
bus loses power and all TAS2781 register state is erased.

This is distinct from the TAS2781 I2C device's own runtime-PM: pinning
the I2C device to power/control=on does not help because the power loss
comes from the parent PCI controller, not from the I2C device itself.

Confirmed by checking power state before and after idle:

  # Before idle (volume normal):
  $ cat /sys/bus/pci/devices/0000:00:15.2/power/runtime_status
  active
  $ cat /sys/bus/pci/devices/0000:00:15.2/power/control
  auto

  # After ~5 min audio inactivity (volume dropped to ~10-15%):
  $ cat /sys/bus/pci/devices/0000:00:15.2/power/runtime_status
  suspended

The timing (~5 min) corresponds to the system entering a deep idle
state during I2C bus inactivity, which allows the PCI controller to
runtime-suspend.

WORKAROUND
----------
Pinning the PCI controller to always-on prevents the volume drop:

  echo on > /sys/bus/pci/devices/0000:00:15.2/power/control

Persistent via udev (ACTION=="add" alone is insufficient: i2c_designware
resets power/control back to auto after driver binding, so ACTION=="bind"
is also required):

  ACTION=="add|bind", SUBSYSTEM=="pci", ENV{PCI_SLOT_NAME}=="0000:00:15.2", \
      ATTR{power/control}="on"

This is a blunt workaround that prevents any runtime PM on the entire I2C
controller, which affects all devices on that bus.

SUGGESTED FIX
-------------
snd_hda_scodec_tas2781_i2c should hold a PM runtime reference on the
parent PCI device of its I2C controller during probe, preventing D3cold
for as long as the driver is bound. Something along the lines of:

  /* In probe: */
  pci_dev = to_pci_dev(client->adapter->dev.parent->parent);
  pm_runtime_get_sync(&pci_dev->dev);

  /* In remove: */
  pm_runtime_put(&pci_dev->dev);

Alternatively a PCI quirk could set ACPI_COMPANION power flags to prevent
D3cold for PCI 8086:7e7a (the Meteor Lake DesignWare controller) on
platforms where TAS2781 amps are present.

Signed-off-by: Ramon van Raaij <ramon@vanraaij.eu>


