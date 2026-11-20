Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=141.14.17.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795176211;
	b=a4bmcGEVTBScYQlv/Y9Hqzd++wMdP4lkpVWEubehDKQ+vfjlTBPVSH0L1Kf/q+5HQpUP
	 5gWi/SkPDqnN0YP3Ft8s7KYYWADP4S+zFSG9MdkQWbC1MJi6lAu8TLEwcB6RYgYow9l0F
	 dkHGtTEGxAyRwTOcYL3lJOz7nnJ9wqzS/3/1DkCTqmbcgHCR+FyKNYzf675emDKmNPfc6
	 6PfWgq/4yZtvWRSLERXWjA4AAjunFNU+t6rGkWs9z81ZDSOjmTJV+OHeb4paU/JyfWaaN
	 iEBeMmjzN6BrKEZ6VZPWnepmx2m9AIBDzh++s5DyrZ3Egzcx8H4hIablHVEmK1Nv0wA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795176211;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:DKIM-Signature;
	bh=NWt4zqOMFdyJigG9DzG25I+Ygh8+spedVIRbfLrr1Y0=;
	b=NW/GNMRu+lA2Aa5Acw65Fp2FfHl3UxOQZ6zAiuAyfmzq13jBev/p3rogolDrTLaI1yMQ
	 oOKTsNmH1euzl7F7tMkdcSbtVGbOB7xL6rGxk25vslAMJV8J07hhyV6zlGR8A3a9ykUSh
	 KRcttofKDJG0bUx08XFMUVwQtsn+CM0sNC1WFhVKLlnKr7FeghU3Dfuung4lKKZADhHeh
	 pdt2YbDThCSwYL9h87s4zOdzB5o8meRkDANfecjnZUsD3u+LCI7ezte3Q55ePW+YtSpik
	 LvxwOsemaS1XGmgh05biMA3250J4FKp8tNXvP4rIntrlFuOTWxRKMYJh5KqBGmj+sUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=molgen.mpg.de;
	spf=pass smtp.mailfrom=molgen.mpg.de;
	dkim=pass header.d=molgen.mpg.de header.i=@molgen.mpg.de header.a=rsa-sha256 header.s=20260906 header.b=V32SkBC9;
	arc=none smtp.remote-ip=141.14.17.11
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86374606A325;
	Fri, 20 Nov 2026 12:03:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86374606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=molgen.mpg.de header.i=@molgen.mpg.de header.a=rsa-sha256 header.s=20260906 header.b=V32SkBC9
Received: from abreu.molgen.mpg.de (g42.guest.molgen.mpg.de [141.14.220.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 303A44C2C90B4C;
	Fri, 20 Nov 2026 13:03:16 +0100 (CET)
From: Paul Menzel <pmenzel@molgen.mpg.de>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: pcsp: Only autoload if the pcspkr input driver is disabled
Date: Fri, 20 Nov 2026 13:03:04 +0100
Message-ID: <20261120120307.629996-1-pmenzel@molgen.mpg.de>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=molgen.mpg.de; s=20260906; 
	t=1795176196; 
	h=from:from:subject:date:message-id:mime-version:content-type:content-transfer-encoding; 
	bh=NWt4zqOMFdyJigG9DzG25I+Ygh8+spedVIRbfLrr1Y0=; 
	b=V32SkBC9eEBEuewlqR/H95XJTB2VBlzCIxOLySqA4xqGrN8BnunvlIq9h+8spt7jq+awywEk9CJs
	4JGU5ZYAK9wAqfpAQC1KwOt+mbco2mZ5NFSIbDYQkxmzT6I3PvWI7HdtaDxhgF9/sHLoYQa8y+S/zj
	UmjV4G7uUfNKA//7GM0i5N9FUTfRwbjI+Dxs8vOVehFMWqRTtH6/MYMcintlwePNxMty3urO+1yP6x
	igvEm2tbxOm+zxu7mss/qzrcwjknN4CJAURH0MFfucG0BLj8nkuLnyE//3jaXEljDICYrFR4wM1Qu0
	ho5kCIRr7Ju24cO/2L7bD4XhdbsFCitw==

The input driver pcspkr and snd-pcsp both register a platform driver
named "pcspkr" for the platform device of the same name, and both
declare the module alias platform:pcspkr. With both built as modules,
as distribution configurations do, udev loads both for the device, and
the second one fails to register its driver on every boot. On a Dell
XPS 13 9310 with Linux 7.4-rc1 and the Debian configuration:

    [    0.793761] input: PC Speaker as /devices/platform/pcspkr/input/input7
    [    0.813617] Error: Driver 'pcspkr' is already registered, aborting...

Which driver ends up handling the beeps depends on the module load
order. The help text of SND_PCSP already says that the driver is not
needed for beeps, and that it may become the default sound card. Debian
therefore removes the alias since 2014 [1], and Ubuntu blacklists
snd_pcsp. With pcspkr built in, snd-pcsp cannot register its driver at
all, so the alias is useless there, too.

Only declare the alias if INPUT_PCSPKR is disabled. Then snd-pcsp is
loaded automatically and takes over the beeps as before. Otherwise only
pcspkr is loaded automatically, and users wanting PCM sound from the PC
speaker keep pcspkr from loading and load snd-pcsp explicitly, which is
already needed today for a deterministic result. Document it in the
Kconfig help text.

Tested on the Dell XPS 13 9310 with Linux 7.4-rc1 and the Debian
configuration (INPUT_PCSPKR=m, SND_PCSP=m), with snd-pcsp not
blacklisted: without this change, the error above is logged; with it,
only pcspkr is loaded and provides the PC Speaker input device, and after
`rmmod pcspkr`, `modprobe snd-pcsp` binds snd-pcsp and creates its sound
card. In QEMU with x86_64_defconfig, kvm_guest.config and SND_PCSP=m,
with systemd-udevd loading the modules, the same holds for
INPUT_PCSPKR=m, and with INPUT_PCSPKR=n, snd-pcsp is still loaded
automatically, binds the device, and creates its sound card and PC
Speaker input device.

[1]: https://bugs.debian.org/697709

Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
---

Notes:
    Tool use: Claude Code (claude-opus-5-5) analysed the conflict, wrote the patch
    and the commit message, and ran the build, modinfo, QEMU and hardware
    tests; the author reviewed it.
    
    QEMU 11.1.2 test: the guest boots the host’s root file system read-only
    over 9p, with the test kernel’s modules bind-mounted over
    /usr/lib/modules from the second (writable) share. The init script
    starts systemd-udevd, runs `udevadm trigger` and `udevadm settle`, and
    records the loaded modules, the driver bound to the pcspkr platform
    device, the PC Speaker input devices and /proc/asound/cards; with
    pcspkr loaded, again after `rmmod pcspkr; modprobe snd-pcsp`. No audio
    backend is configured, so this checks loading and binding, not sound.
    
        qemu-system-x86_64 -enable-kvm -cpu host -smp 2 -m 1G \
            -machine q35 -display none -no-reboot -nic none \
            -serial file:$OUT/console \
            -kernel $OUT/kernel/boot/vmlinuz-7.4.0-rc2-pcsp-fix-n \
            -append "console=ttyS0,115200 root=root rootfstype=9p rootflags=trans=virtio,version=9p2000.L,cache=none ro init=$GUEST_INIT" \
            -fsdev local,id=root,path=/,security_model=none,readonly=on,multidevs=remap \
            -device virtio-9p-pci,fsdev=root,mount_tag=root \
            -fsdev local,id=out,path=$OUT,security_model=none,multidevs=remap \
            -device virtio-9p-pci,fsdev=out,mount_tag=out

 sound/drivers/Kconfig     | 5 ++++-
 sound/drivers/pcsp/pcsp.c | 7 +++++++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/sound/drivers/Kconfig b/sound/drivers/Kconfig
index 6debd8e95cb7a..4d875d0f5a17b 100644
--- a/sound/drivers/Kconfig
+++ b/sound/drivers/Kconfig
@@ -55,7 +55,10 @@ config SND_PCSP
 	  If you don't have a sound card in your computer, you can include a
 	  driver for the PC speaker which allows it to act like a primitive
 	  sound card.
-	  This driver also replaces the pcspkr driver for beeps.
+	  This driver also replaces the pcspkr driver for beeps. If the
+	  pcspkr driver (INPUT_PCSPKR) is enabled too, only pcspkr is loaded
+	  automatically. To use this driver instead, prevent pcspkr from
+	  loading, and load this driver explicitly.
 
 	  You can compile this as a module which will be called snd-pcsp.
 
diff --git a/sound/drivers/pcsp/pcsp.c b/sound/drivers/pcsp/pcsp.c
index ff6bb375c9001..d7d28ec2250b6 100644
--- a/sound/drivers/pcsp/pcsp.c
+++ b/sound/drivers/pcsp/pcsp.c
@@ -22,7 +22,14 @@
 MODULE_AUTHOR("Stas Sergeev <stsp@users.sourceforge.net>");
 MODULE_DESCRIPTION("PC-Speaker driver");
 MODULE_LICENSE("GPL");
+/*
+ * The input driver pcspkr binds to the same platform device and has the same
+ * driver name, so only one of the two can be loaded. If pcspkr is available,
+ * let it handle the beeps, and leave loading this driver to the user.
+ */
+#if !IS_ENABLED(CONFIG_INPUT_PCSPKR)
 MODULE_ALIAS("platform:pcspkr");
+#endif
 
 static int index = SNDRV_DEFAULT_IDX1;	/* Index 0-MAX */
 static char *id = SNDRV_DEFAULT_STR1;	/* ID for this card */
-- 
2.54.0

