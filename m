Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82A4383BD
	for <linux-sound@vger.kernel.org>; Sun, 21 Apr 2024 21:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713734041; cv=none; b=jGr657D8MJjpp4y2Gk7FDo7r28VzyQfl8Kjz0xhxc1tsIQdxAIpf6Gkbo1b+RP6r2G4Pp8uE4JlxRmbGDFJlVG1/x33ftl3OlLAnjL0Xcofkk8OX9hhtgnJUbZQNokQuqaHXqyBbS0sGBtp5J2GGl+vXQvzgIKiucYcRBsVm1J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713734041; c=relaxed/simple;
	bh=F105mw880ou8WKiy5NvsZCUx1gHLmtNI0orNl9em4IM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sQtwBkkGtb0FpQT1e9TcNd+bVG894Y3JDPXKmTEu6Hl2M4GRBNswiw0gYSJF0GjR0ilcIn1RFO0MvpUKVfdVtseLyxfXsPj7umrbU6dqO+AT6dli4/zOUpXdIUb4mpXKFHWPKCKnOpQk0nIbTDdenMR9aKsvVhlfOvbUHA7ilfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de header.b=KH6NCCa6; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de header.b="KH6NCCa6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1713734032; x=1714338832;
	i=oswald.buddenhagen@gmx.de;
	bh=m/WuiDcKf/6MlTX1l2uolQPTYDYtyq4mW5INjw2TlHg=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=KH6NCCa6uQMQxpnbHkNWxZciO++CX9/3y8Rn7+4KLS73Q7LYgCHKURRpbcJVgb4k
	 WyEi5ks16czPeNvZrtfitVC3UGiWlfKurD+cPL+E8S5r2JjVmhlhtX9UrKgc6Bbju
	 GekZIS0e8wv07D0hDkqPhk0rnHTAnsi86f44DQmO+t0nwwY3n8w4ap54Bphjpxmp2
	 zRVme/C5OYBAr3nmtmInKl/+DBVahUPpruSEfNcA1HfsrKWczXKXKfkqODe5cUaqS
	 HzJ03qKFs47DRY2U+YUmxlP7FkOk+j9PO06G5jmwbUZ9NKpQznUVamtZMj8wGwgsw
	 vgqgIhjXO47CQuGldQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.112]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M4JqV-1ryNOL3DOL-000I5H; Sun, 21
 Apr 2024 23:13:52 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rye5c-RB5-00; Sun, 21 Apr 2024 22:47:08 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Pietro Caruso <pietrocaruso50@gmail.com>
Subject: [PATCH 10/10] ALSA: emu10k1: make E-MU FPGA writes potentially more reliable
Date: Sun, 21 Apr 2024 22:47:07 +0200
Message-ID: <20240421204707.2487686-11-oswald.buddenhagen@gmx.de>
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
X-Provags-ID: V03:K1:AdoOZH5ECZIRaqvv9HB5ZKu1KI7U2XVe7wHrzOX1tR1bP93+3K+
 r2msnbwoA5IqaGgkPTttzsLxcAlfsrsMxtxMaSnmZbqGOD/2IkkLu9uE81/8+0tEkCx5GWZ
 4zzCTmovyx2lEehZ6mgiu0Pvj+h9XZKaL1Lh2jJ+soUyYc77JcMtGr+3tvLe1gTxQWnG0vp
 OSRlQx4vz8w7AL7RUkGtg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:rmSPnCxIYuo=;R3wTnoyu7TFz88qs9TeGEm0bAxv
 zSGMH4de6RvQc49pC0AHJm2iIA5gYE0pE9vKC60sYjfusi1YDOENJalx8C/FEEfmsQwxLwmgS
 PQu5M5ibajrAsQ6TzZujMdT9SC20KKswHRPMtfU/E1RffCVwt0JFH2wO0TJ/tf95yNu0ZVAAH
 ncL/N3EyPTBeisPw2VDqkUBuF7nIhxn6WeI7N8Ak9SkwrKM1+P2akoU8mdT4s56CAB63CS3CI
 UwjdxTDgnEys9NkjGTwWmc1niMrS7ZSONElc/g6dgmhFhKZD5TsSIrAGaKkTO2nEUcBwRtfXR
 64UtTnShbTi26w/2XQmy7wa3zgyiDkCaFAYp9pGY4bK0YraiOc3wjG/QdoQrdM78jOYPV6wrE
 DbOJrnEy/wzzIociAYhIEXOnxsBC5YzGTHsIqOIUi8gDhhtZA2XYBRJSocyvQCTFG6QR05bdB
 6ZQ1q2/GLptoeXmDeSmkzMZzgUZ3ErbSLPZ1rzYPmNjKM3wZkn9oYNoL4tM7c19ojVrlkjcfw
 uzWEYNNjFBykMcMdepHZA3Of4UnA2x6GNb9I1iFJ4yvpSd85W2hPQ7wdpqT9eBmRRbT5RAQDT
 R4t0l7fpM0fgP/G9FLknXmUSZzxrBsi/3Zf1vCkhcJxZtcLPyOAy1sdH5k67qAtSicuoeLQSM
 Hft1I36MGkZl59zWU5Zi0m7w9TJlO2zlTTVvqGH8BC436iMkXtC/Eg/hAUPlUKLRoHXdUHkde
 ES8z5uXZvAZGUlsAk68xRDp7cnaeun7tTBcJXY+dTumSzas6yPW/0Zd5zr802UbmP4Da4yDK6
 8tul5hbdYtmUJkkzbwKiUZ3iL7mGoKWCkDgYgn/vaYF8E=

We did not delay after the second strobe signal, so another immediately
following access could potentially corrupt the written value.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/io.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/emu10k1/io.c b/sound/pci/emu10k1/io.c
index 9b1b25d5ba74..b60ab5671e00 100644
--- a/sound/pci/emu10k1/io.c
+++ b/sound/pci/emu10k1/io.c
@@ -285,6 +285,7 @@ static void snd_emu1010_fpga_write_locked(struct snd_em=
u10k1 *emu, u32 reg, u32
 	outw(value, emu->port + A_GPIO);
 	udelay(10);
 	outw(value | 0x80 , emu->port + A_GPIO);  /* High bit clocks the value in=
to the fpga. */
+	udelay(10);
 }
=20
 void snd_emu1010_fpga_write(struct snd_emu10k1 *emu, u32 reg, u32 value)
--=20
2.44.0.701.g2cf7baacf3.dirty

