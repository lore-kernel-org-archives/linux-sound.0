Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6F855E44
	for <linux-sound@vger.kernel.org>; Sun, 28 Apr 2024 09:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714297050; cv=none; b=d/RpiJ++AqV9T/hHNySeSDMMXFn7PxfpHjHDYEXJhKQg9pEGUXg7QNnxibgn9eI+sgVFCgvdwuUKU5Rxp7VCL/6LlMyO4yksz7S2EVFYaayHfmvXUPFxA7h/hGYoAgmujiCzrvG5fIGAxUIX8NvlAAIT19jU2L2YpB5mj+g1G6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714297050; c=relaxed/simple;
	bh=U67Nsm4It4LOqwHUkQxaRtYNhNGmVaYa7ybYir9aa34=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EbyAwHIvmFAGZftliWvFtpjidem7SiPgu12rV/LySGTc28W13Zdx7ifCcNMaj+ytM9o94lTnmccSmDex4+jq9WqnZjjT8jX+gz0qmKuPVjmfkcEPDmW5YyzFAtjRMDBEZ8QvKooipsL7vJnrQ5kqwCxAc+qXi901+cjUWKioK/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de header.b=OUxGyfJW; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de header.b="OUxGyfJW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1714297038; x=1714901838;
	i=oswald.buddenhagen@gmx.de;
	bh=UI4+vg2KILDd+22vYE6+H4glg6FLDNGnaxRL4oHvIoE=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=OUxGyfJWrrHtuHUL2iz/KH9voReklsONuLYAzdVwUJ/51gfpN+LZfIP/z4j/YM1P
	 lbkuUbEttUYPqmpNV3EMfB85GM4+Z9roa8byDyYqsvwTkIQd8691epLDK4tUt/Cjw
	 RogvuwvWdPK7FpG3T5yXERb9/NCi/mrGLGlzH0nqbLgDMsCZajAn7QSeGN7ytxwq/
	 PcdSodE3I//SXIBbVPQEVM8yvSk4EhkuyPpwDP/QNWq6nbhGAdAvkPJAW8rXhDJmI
	 /FcjnpkzyWXGuM6JorV6aDWRY0fBoZQPJbQtO37qqvHKxj2TCNh/WHD2s0PgLGhqu
	 9I9TXx5Z7U6SKPApHQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.124]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mnpru-1sTD7s1fH0-00pPk4; Sun, 28
 Apr 2024 11:37:18 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1s10yD-Q95-00; Sun, 28 Apr 2024 11:37:17 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Pietro Caruso <pietrocaruso50@gmail.com>
Subject: [PATCH v2 4/4] ALSA: emu10k1: move code for entering E-MU card FPGA programming mode
Date: Sun, 28 Apr 2024 11:37:17 +0200
Message-ID: <20240428093717.3198716-5-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.44.0.701.g2cf7baacf3.dirty
In-Reply-To: <20240428093717.3198716-1-oswald.buddenhagen@gmx.de>
References: <20240428093717.3198716-1-oswald.buddenhagen@gmx.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Hg1hQXxXRCneuifK+9vD8a1M0ZLVLttFzD2ppwXu7GuKSSFbjVH
 p1fPv5A3dzerl3FzU0f7GQZBQEkr+rbFyZybxRyW2ftS7f3IiasMYKsVTz0Or4Ait8sRp7S
 JAT2AE6bilZyVLEn5kUKsn/CznGNgEsBftsi3F7au6PY24TJqdIslnD+zoW5C03Vp3YLt94
 NDakjk8Q4QLFXqaRDZCnw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:c3Q78/2NwMo=;04VpsxYklG+Hc6LIxmBjT7nD8QK
 TF3MsrSi9hUKyDfZD3Ah//a3RC69MbYRgmgns9SKSKi/evv/OAogZD00vycP4LfPJfssw+VuJ
 9V7hHhapNNzr+s3ZKOKnpZYpjTbJ5QgPumXBDd/aDO8JuINiQ3Z8eiFi+OPpiEan1/GFNrX92
 Eg5OQ/Zv53m6RhgD7qvOX2RT7J4s6fRCH2ejyioU8QXSU8pzJCKJJ9tFWlW23HQCxM0X2+nkw
 xJ8rrmn9P5wqF216YWzHUKc3lYYDfXHbdTxuIYcQweQFnyLPaYLkYaf4I2brHx9/u4VfZK8NX
 AWKe/gyrQo3O+BDD6736lRZsGOlJ1cYioAzEwPeumy3p0TlsGx6ZZ5lr7fJrgB2wpWIWPU8k+
 /JyKpuUp4xBdxEHVeYz0GXiWQ5C8YfEDcDK3l5nIYJ/jvVnkz1IBTkSwHy6BPjQAneAP8r3n0
 /WW0HAvsWiJECFglKJuPIYwq5+zDRntLwk9cnvRSr26n2Bb7dWunbvauF6m31/SBpdI1YbMEG
 uL+HhOXH+/y7G34gh0XDmfDYiGCPs5L55kb266xrcktofUPo3+I2ADMqmhM20nlINgn6Aq55r
 hLaUwZCT1MA/LBdfbO6F7lchJ6Rf6M9R+E6u5y4KUQOjLmE0hNGqSUTfatezSu+wdOzK/SnZK
 0ZmmbYlRvmYnwtFgINkx0hm9OThpSG1GiaaZkUtNVV4xTITfIHCgiZHPJIGiDYfH4NP4BPu0A
 QcAhXYr6F8DlPc8PfNfCG1cwov1S89IrsrEBxnvD2s0a8k9nDRxLRcpTeesWokaxQnVqUKYgI
 f5w54jQuoZpNUeUBcX/HzESvSx6chF7A/0aaJkrd88blg=

... into snd_emu1010_load_firmware_entry(). This makes it clearer that
these steps belong together tightly, as implied by prior commits.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 include/sound/emu10k1.h          | 2 +-
 sound/pci/emu10k1/emu10k1_main.c | 7 +------
 sound/pci/emu10k1/io.c           | 7 ++++++-
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/sound/emu10k1.h b/include/sound/emu10k1.h
index 2856f4717c93..b83862259eec 100644
--- a/include/sound/emu10k1.h
+++ b/include/sound/emu10k1.h
@@ -1843,7 +1843,7 @@ void snd_emu1010_fpga_link_dst_src_write(struct snd_e=
mu10k1 *emu, u32 dst, u32 s
 u32 snd_emu1010_fpga_link_dst_src_read(struct snd_emu10k1 *emu, u32 dst);
 int snd_emu1010_get_raw_rate(struct snd_emu10k1 *emu, u8 src);
 void snd_emu1010_update_clock(struct snd_emu10k1 *emu);
-void snd_emu1010_load_firmware_entry(struct snd_emu10k1 *emu, const struct=
 firmware *fw_entry);
+void snd_emu1010_load_firmware_entry(struct snd_emu10k1 *emu, int dock, co=
nst struct firmware *fw_entry);
 unsigned int snd_emu10k1_efx_read(struct snd_emu10k1 *emu, unsigned int pc=
);
 void snd_emu10k1_intr_enable(struct snd_emu10k1 *emu, unsigned int intrenb=
);
 void snd_emu10k1_intr_disable(struct snd_emu10k1 *emu, unsigned int intren=
b);
diff --git a/sound/pci/emu10k1/emu10k1_main.c b/sound/pci/emu10k1/emu10k1_m=
ain.c
index c8aa4143ac4f..5b8a5ba825bd 100644
--- a/sound/pci/emu10k1/emu10k1_main.c
+++ b/sound/pci/emu10k1/emu10k1_main.c
@@ -683,7 +683,7 @@ static int snd_emu1010_load_firmware(struct snd_emu10k1=
 *emu, int dock,
 			return err;
 	}
=20
-	snd_emu1010_load_firmware_entry(emu, *fw);
+	snd_emu1010_load_firmware_entry(emu, dock, *fw);
 	return 0;
 }
=20
@@ -699,9 +699,6 @@ static void snd_emu1010_load_dock_firmware(struct snd_e=
mu10k1 *emu)
 	msleep(200);
=20
 	dev_info(emu->card->dev, "emu1010: Loading Audio Dock Firmware\n");
-	/* Return to Audio Dock programming mode */
-	snd_emu1010_fpga_write(emu, EMU_HANA_FPGA_CONFIG,
-			       EMU_HANA_FPGA_CONFIG_AUDIODOCK);
 	err =3D snd_emu1010_load_firmware(emu, 1, &emu->dock_fw);
 	if (err < 0)
 		return;
@@ -820,8 +817,6 @@ static int snd_emu10k1_emu1010_init(struct snd_emu10k1 =
*emu)
 	snd_emu1010_fpga_lock(emu);
=20
 	dev_info(emu->card->dev, "emu1010: Loading Hana Firmware\n");
-	snd_emu1010_fpga_write(emu, EMU_HANA_FPGA_CONFIG,
-			       EMU_HANA_FPGA_CONFIG_HANA);
 	err =3D snd_emu1010_load_firmware(emu, 0, &emu->firmware);
 	if (err < 0) {
 		dev_info(emu->card->dev, "emu1010: Loading Firmware failed\n");
diff --git a/sound/pci/emu10k1/io.c b/sound/pci/emu10k1/io.c
index fafa299efa5c..b60ab5671e00 100644
--- a/sound/pci/emu10k1/io.c
+++ b/sound/pci/emu10k1/io.c
@@ -422,7 +422,7 @@ void snd_emu1010_update_clock(struct snd_emu10k1 *emu)
 	snd_emu1010_fpga_write(emu, EMU_HANA_DOCK_LEDS_2, leds);
 }
=20
-void snd_emu1010_load_firmware_entry(struct snd_emu10k1 *emu,
+void snd_emu1010_load_firmware_entry(struct snd_emu10k1 *emu, int dock,
 				     const struct firmware *fw_entry)
 {
 	__always_unused u16 write_post;
@@ -440,6 +440,11 @@ void snd_emu1010_load_firmware_entry(struct snd_emu10k=
1 *emu,
 	// GPO6 -> FPGA CCLK & FPGA input
 	// GPO5 -> FPGA DIN (dual function)
=20
+	// If the FPGA is already programmed, return it to programming mode
+	snd_emu1010_fpga_write(emu, EMU_HANA_FPGA_CONFIG,
+			       dock ? EMU_HANA_FPGA_CONFIG_AUDIODOCK :
+				      EMU_HANA_FPGA_CONFIG_HANA);
+
 	// Assert reset line for 100uS
 	outw(0x00, emu->port + A_GPIO);
 	write_post =3D inw(emu->port + A_GPIO);
--=20
2.44.0.701.g2cf7baacf3.dirty

