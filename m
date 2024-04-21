Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7A43EA72
	for <linux-sound@vger.kernel.org>; Sun, 21 Apr 2024 20:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713732442; cv=none; b=NQb8PHRu6fuWP99gRoKcmaWDEc4F3hzcUX3zFyrxinXrFQBZGPVOHl2+1QR9R5/FCSD39pUb6ofhNASUlRt8kX2CVOudAq4OXSe0lrlaIGHxkdt/gN6RC8lhivhxsCBraGSAkVVq2Rj7tsTVUs6RcLcaLbX4Dl/n5wn6tKXVQ7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713732442; c=relaxed/simple;
	bh=78Fo3fps6tFZDtZx1H+3hVGIXOii+0x/VVl7hHPcOmM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lF/0D8Gwbx1Lz74joIRp1YGNU7qbTFuGPEVxoUFT2GjzAEdJNvW5aMssoX3DTeL8hs+JjeMTcfQoFahev97ITHOdljNc8bD1yXkIWGOcJ68gp8T+WJjVEoXHFjS8ESFf8jemrrDr0FAL3FXvsCf4Qzpyt+1p9GrXnvZasmYGIJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de header.b=ny+/c0KQ; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de header.b="ny+/c0KQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1713732428; x=1714337228;
	i=oswald.buddenhagen@gmx.de;
	bh=+RUa41z5QJ03GNkAhmdIDdGi/8CIrDQo1L3m3Pqu4G0=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ny+/c0KQaiFUR3nhCa73NsR7PSvXw3vZfuSvfs+10Df3XS6dVbQC+fsR0v5/jczM
	 SOpCe3jjcefGXeLV40ftaZEsYjA3Zbw3DyF3/rwL+yytvuLIImnXi03btRgQ5PTKn
	 8PbViLLJRSfP7YyL2g2PjftrmAGawyzAayWsdBSdK0Q//GHt2r4MgnvW58GmU2KLd
	 Iux4q2tsJXWJYddwh6tfuP9s0hp5MmUbkHJ6PAeRUiGA2ZNaXx7VZRBIvVkSzAQAz
	 I2D0RiyxNnxit2quOq2NOoGcqcgFR5bA2mvvwNS/aa33ePROSog6fwIB1MWKLAU2F
	 /rjfuOp6gceVh01Vkg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.112]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M5QJD-1rxH2n22fV-001OCW; Sun, 21
 Apr 2024 22:47:08 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rye5b-RAg-00; Sun, 21 Apr 2024 22:47:07 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Pietro Caruso <pietrocaruso50@gmail.com>
Subject: [PATCH 05/10] ALSA: emu10k1: fix E-MU dock initialization
Date: Sun, 21 Apr 2024 22:47:02 +0200
Message-ID: <20240421204707.2487686-6-oswald.buddenhagen@gmx.de>
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
X-Provags-ID: V03:K1:f2s1ncojF1wXTPHYRKqZCXEhiITacqRcMgwmLRpDVn4mVpyJuh+
 ZONS61ZRLXM36Pf73DzuE+pSePpHoNGfLcgbfOY492fDPH4am1QlE9bijANqoQUoafxKDi2
 KNBw8zR+8Oz+QgkUL/rO41aygW2bExfmkOUhREf7/qPVyt1MSZqslX/fJjNtbAf2xKb1Ckn
 GH6Y8g8YxJtABfRV9xNZQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:gDgcPifxjjM=;Q3EdkolKjaX0D/nFbKBq5lkyKH0
 LRTx/f3nfM1tHMLsb2exLwuitAIlGpMX+OAnOM7KxG/0qwLi48ozXy1TSVYb3ipEIhXfMge38
 Pels81XEHfx5bNX3sk10crPk8xRYywjzJD4WPayhxgDC04WjHpz0hM2ytmMgioTdROCF9Btsr
 K7PZCkQmv5/HRplQ0ItRRBnQiUMtQEvRO5rmyZdM7KYdfqLcfWksMxaQ1AACKKPRpZg7pEhU+
 h5RaOu4NzCYj0Ep/JVyeLGG+Nd6nC3rSoSTpPI28kBI6ujIf65uE/uuVM//DDot4QGbUDlsrt
 KxArQwzZYBuGNauWFYFG+g62sTNSgBDUAId4qNqD+OtoA6Vxr/pAZnAJYDM76AqDnjCHG8Bjh
 Uy/W72N/0qc8MTh7Gw7aK7iBDdwb0KuTRU3yOcf/xg9q1Sn6JGd4iFVWRVDbz7x1bM/QFzKf3
 pxXoY3Cv1kkq0+euiH2yMY3DwUCMDMjX7LarAhCWztW268jYZ39MvNSCgyPgeR5B63F7ux+ps
 7cokBhpCM+tchZINu/CysJgO5F9wZyXqQqn1XcQ0+L+k7U0EaNvcHdPYRG/jWMFrQKtBPZeDq
 fcerH3/NIeo5hn2GHXPH8DI5uvHY5WfyLcFa0K0S3zmavE1PACniNzvGrrNU2gDJYNq2W4wcM
 8eL9OfP1x9qFOE2wHsI0fdAKwnPGSPWIDozgMSFAhcHWrmspczGqG/gMbhKNedTF/JWZtUCgG
 2Z5NwPWts+uXTPzsCYqje1D96TRq6HDfndANTzPnt1qXrRGN49EDDgDg0C1wMU/icWhhak/I7
 NLtg60Y0pBvnyHw7xxtFocuAuF7lHpYmM1e2u4CE9w7eM=

A side effect of making the dock monitoring interrupt-driven was that
we'd be very quick to program a freshly connected dock. However, for
unclear reasons, the dock does not work when we do that - despite the
FPGA netlist upload going just fine. We work around this by adding a
delay before programming the dock; for safety, the value is several
times as much as was determined empirically.

Note that a badly timed dock hot-plug would have triggered the problem
even before the referenced commit - but now it would happen 100% instead
of about 3% of the time, thus making it impossible to work around by
re-plugging.

Fixes: fbb64eedf5a3 (ALSA: emu10k1: make E-MU dock monitoring interrupt-dri=
ven)
Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D218584
Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/emu10k1_main.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/pci/emu10k1/emu10k1_main.c b/sound/pci/emu10k1/emu10k1_m=
ain.c
index 1a2905e8672b..8ccc0178360c 100644
--- a/sound/pci/emu10k1/emu10k1_main.c
+++ b/sound/pci/emu10k1/emu10k1_main.c
@@ -737,6 +737,12 @@ static void snd_emu1010_load_dock_firmware(struct snd_=
emu10k1 *emu)
 	u32 tmp, tmp2;
 	int err;
=20
+	// The docking events clearly arrive prematurely - while the
+	// Dock's FPGA seems to be successfully programmed, the Dock
+	// fails to initialize subsequently if we don't give it some
+	// time to "warm up" here.
+	msleep(200);
+
 	dev_info(emu->card->dev, "emu1010: Loading Audio Dock Firmware\n");
 	/* Return to Audio Dock programming mode */
 	snd_emu1010_fpga_write(emu, EMU_HANA_FPGA_CONFIG,
--=20
2.44.0.701.g2cf7baacf3.dirty

