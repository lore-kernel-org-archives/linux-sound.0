Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44EE6249E4
	for <linux-sound@vger.kernel.org>; Sun, 21 Apr 2024 20:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713732443; cv=none; b=rZjdMo8ecb16A/5e/BKtAeVWTxUoV4vLua0btuCugVF+qtxtgbib4wGa+lmWgZyX2+mzETtWe4zm9/OK1o8shpfv+Q2ijOGBWgqEGgA7an9HCohltpRHCYvkmjuCagLiIZXw838NFm9KcXxXTU3zCws+EbwF9drO/j/N9spn6Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713732443; c=relaxed/simple;
	bh=EQRqDlCxQ5XPdfzGKh932goby9IZfr0XWHHbWqNAbEU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OM+I0niXW+dtvb4LqJu7SLYHMj18sFpj16zqbtCOO1XXy7ZLmkgXNlEKZxx0aE294JApdpvxKsdWXm81GSlQwKgm1atJOlpG8DdBWP8Chq8N+aRVbvRR9BeWJJewMVgymSxor/CgtDojT5PxYTmBN2zsH1BhV+k79MIJJOzaoE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de header.b=lDYEejRw; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de header.b="lDYEejRw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1713732428; x=1714337228;
	i=oswald.buddenhagen@gmx.de;
	bh=UhZF5H2rg6othVx24q0JPaDd7zyQVBKcHLPbZFsPOyA=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=lDYEejRwW5eGe8t79PzTD2qUiD+LZ3ad+pL3CNcqHzLHTadmzdkTORTFoehWz6bU
	 KA1lovJokqS9zbSQhNV7V9k/n8o/PUpS2utfa3HiMAdgTfPAeZnfucMv/5SW0lc0X
	 YbNEiBQ+C3uD18lvRWj6QoATIUxHrx7UxV7cSkp7w7/JrtYyQUw+WR0FWA9bbi70O
	 qRZ4tpi871g//GQvzVIe07xDiybKMn0Zg89TyAMQYgtuFKbIKRxIIAEGXeYDJIEEz
	 dGU5Ff0+2Zr8HqhLK1K2QkugKcUfkYYA/p7aSPY2vNEBW/bRMapEUv4daqYhRwR+N
	 YlFjPgVXbiYeZToUJw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.112]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N95iH-1skEiB283j-016ATN; Sun, 21
 Apr 2024 22:47:08 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rye5b-RAv-00; Sun, 21 Apr 2024 22:47:07 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Pietro Caruso <pietrocaruso50@gmail.com>
Subject: [PATCH 08/10] ALSA: emu10k1: move entering E-MU card FPGA programming mode
Date: Sun, 21 Apr 2024 22:47:05 +0200
Message-ID: <20240421204707.2487686-9-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.44.0.701.g2cf7baacf3.dirty
In-Reply-To: <20240421204707.2487686-1-oswald.buddenhagen@gmx.de>
References: <20240421204707.2487686-1-oswald.buddenhagen@gmx.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qd2tTN/WloAZANcxHlWldpwsmo9IumSryon7OJMNOq6NUKXszeY
 cnmwz+tiDH37qfl1W8TQKJfA8TStrzU3Wqiod6pXupQNeV87JVYkFHzFC9h/lfkCqK6Uieh
 Ttuk7u+G6Zk1S+5jJkO2oON5k1UJ/hx2T8+QY1b+6PB92GxZHOiteXdnNlXr5gd6PqKgQCT
 dXw8v25wNOxiO6SIS+lOg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ik2ZeiP/G3o=;+CKdBEcJs3lB7CZzDN4Wr5rgwEv
 PVSAuz0C6BvtPwCNZa25x1Gu7JnNRUPE8BgCBkow/W5nydSrxwfp8sd1XBJ4RCxGsdQyweFGp
 7onrbCuwynyLINRQp9XW1xK6fAIb4uykLxXGW5uX9iO8anN/N0JdZIxQnEVRc8XDllprFodU5
 XsQ7hCpUDhv1nOy7274Gh3M/skag9TCyrjXhxef1R9oW2svZTsft7izAsLdVhG7EBsCdn+9Sn
 1dYprULTZQQ81Apgky19ydmSvBb6mPF8LBTPvOnFJjF8ASyrEknPSwcuCW9DOeDuYU0QOdGZZ
 bRiJeOQEqrnE/dQ9WDzwdJbeHORcjNMCxxU7jHkzyo6cBVlTWbk1zZ8GQcgTPnI79k110GNr5
 8le/x5Vv1qOlKU/ov1JAuWKx/Cx+lPFGHCn0TuBCqXsfFkw6+E1/wQ3J6eLILz0tKM7wu1xyT
 YNAorGEceNMXmAWymrOwrGQFFHQRerJiZ82MN7UIKa3UeQeic9GGaAlHA/nayXaueFw+fQcta
 91GREH12AdPFPnFyWP1hq09Q8y0YG5vFDXAlN4duPupMA6PKXDnnTomvyox51zT4D3o77kSc5
 TSkZkbxLgoobQ/0ACOp2EM9sXWweZrIucWUFsHZlEX65ZqJuFwXbxl1RoA3yaJwZSjh2spQZF
 2TzuueNGfCUI62iPOga6GzugdW9+94lsjZvjhKm4vtJ6/m9+Ba0fxVOkvs1ogwhJd8k47z7Xu
 FDMJSZ5pzsoua91dxFjf9b0Yymdh+wg7YeOAU98hhLjvAy2znUaZ4FOB7dHqXu9Mskq/X1qGr
 9UnMFcrVYQHB99Mp9nik9RnSuda7RSCzCAcTMLa9KKpsk=

... into snd_emu1010_load_firmware_entry(). This makes it clearer that
these steps belong together tightly, as explained in a prior commit.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/emu10k1_main.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/pci/emu10k1/emu10k1_main.c b/sound/pci/emu10k1/emu10k1_m=
ain.c
index ec010971a220..d0f35d346765 100644
--- a/sound/pci/emu10k1/emu10k1_main.c
+++ b/sound/pci/emu10k1/emu10k1_main.c
@@ -652,14 +652,19 @@ static int snd_emu10k1_cardbus_init(struct snd_emu10k=
1 *emu)
 	return 0;
 }
=20
-static void snd_emu1010_load_firmware_entry(struct snd_emu10k1 *emu,
+static void snd_emu1010_load_firmware_entry(struct snd_emu10k1 *emu, int d=
ock,
 				     const struct firmware *fw_entry)
 {
 	int n, i;
 	u16 reg;
 	u8 value;
 	__always_unused u16 write_post;
=20
+	// If the FPGA is already programmed, return it to programming mode
+	snd_emu1010_fpga_write(emu, EMU_HANA_FPGA_CONFIG,
+			       dock ? EMU_HANA_FPGA_CONFIG_AUDIODOCK :
+				      EMU_HANA_FPGA_CONFIG_HANA);
+
 	/* The FPGA is a Xilinx Spartan IIE XC2S50E */
 	/* On E-MU 0404b it is a Xilinx Spartan III XC3S50 */
 	/* GPIO7 -> FPGA PGMN
@@ -724,7 +729,7 @@ static int snd_emu1010_load_firmware(struct snd_emu10k1=
 *emu, int dock,
 			return err;
 	}
=20
-	snd_emu1010_load_firmware_entry(emu, *fw);
+	snd_emu1010_load_firmware_entry(emu, dock, *fw);
 	return 0;
 }
=20
@@ -740,9 +745,6 @@ static void snd_emu1010_load_dock_firmware(struct snd_e=
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
@@ -861,8 +863,6 @@ static int snd_emu10k1_emu1010_init(struct snd_emu10k1 =
*emu)
 	snd_emu1010_fpga_lock(emu);
=20
 	dev_info(emu->card->dev, "emu1010: Loading Hana Firmware\n");
-	snd_emu1010_fpga_write(emu, EMU_HANA_FPGA_CONFIG,
-			       EMU_HANA_FPGA_CONFIG_HANA);
 	err =3D snd_emu1010_load_firmware(emu, 0, &emu->firmware);
 	if (err < 0) {
 		dev_info(emu->card->dev, "emu1010: Loading Firmware failed\n");
--=20
2.44.0.701.g2cf7baacf3.dirty

