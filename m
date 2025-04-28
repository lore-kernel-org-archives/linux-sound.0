Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9B91917F4
	for <linux-sound@vger.kernel.org>; Mon, 28 Apr 2025 05:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745818691; cv=none; b=nRDE6RnbpYmVNzdakBRUnb0RoZ/HSB+q5WXX+f5VO08jvx0RtbXX2eWtkmKQW8GGhkAGxJTaybywQ8yPi7X6UKJCJqVsdM3nRTzno+24ZbT/HHHRbPK6PN3PN+X1F7uIiaHpqR+gZRh8oB44+9UHUlFMdA9r9unmDHPLzpKX880=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745818691; c=relaxed/simple;
	bh=xCWRbNuSxWiOFbAg++Llo7vK92KCt2k/NusBqYd+C58=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M/hbTpKZ0eQgnVdaqb5fgsMy3WJ4mHKJMAI00T1HSL4+GjK5aX6puiTeSmKVkfww1k9ERDpuV9nqbhv0JfbjE1bErtzSHpwMkat7tP6P51M3x7BVAgsqWOI2EAAG03f6EQw51DH7kIW3nZku6SDsJ7Wqk4+eB/tOSMzCSi3dH80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=joachim.priesner@web.de header.b=XvWO4Ibu; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=joachim.priesner@web.de header.b="XvWO4Ibu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1745818681; x=1746423481; i=joachim.priesner@web.de;
	bh=Nca6U+xuy3JG+19E4HT21jmV/sPG6WjVGy0B1MENzco=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=XvWO4IbuFUroLRrxsRerGWUJBllCDyYj5ZwxhV8SzwEKzdiHGCrwobsVSwGvE02Z
	 E2ieT4PIQfk6Yky4cmRE1jnhyu2+n76kinqUufk4aY+VdWiNY5pYH3iOxXFjwyZiN
	 QkAeAL4yljbueuNr5huW4dDxFMy2I94qLR7OSuNFrj0i+6pJMae1hxoC6Q5COcJdI
	 uaFe5aipsJJMz+ujsrcav+oeD0AXoR01LQWqsIk5uZ7agzj4Mib4/dAkFx4psXgUD
	 fqkXpS+gobJCeKefMg/H2X0J0bCbGXYg9AuyMMk6yrfj0uCIinL2HYg0ygagV3J54
	 EKJnsXBwJLgVFnFP5w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gazelle.localdomain ([77.12.158.244]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M28SL-1u6oLY0z0L-00CN7B; Mon, 28
 Apr 2025 07:38:01 +0200
From: Joachim Priesner <joachim.priesner@web.de>
To: linux-sound@vger.kernel.org
Cc: Joachim Priesner <joachim.priesner@web.de>
Subject: [PATCH] ALSA: usb-audio: Add second USB ID for Jabra Evolve 65 headset
Date: Mon, 28 Apr 2025 07:36:06 +0200
Message-ID: <20250428053606.9237-1-joachim.priesner@web.de>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:gaDyZ6f8RBTZluJm3hGaBGIKKKNbdHsowhgYNGNgZyqa7FkCiOZ
 xzFeE3yYd6DQdjzEhiAF/g14HQSqPFpsPMjhm0y2G+CkgVqdW5wFrxqr0Jq87dALlbT7x45
 fqEzYhqEksAiY49dF9qbpvLoEhVpBr8TGEg1x1P9Ld2Dfw980CLE3isP8V5/Mbsfk0Wl/eE
 5ZyVaugC/LMKTcc7MiT2A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:QnAOaoEP2U0=;ayMRheUO3pq4mHW1LH72LdrW8cV
 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

There seem to be multiple USB device IDs used for these;
the one I have reports as 0b0e:030c when powered on.
(When powered off, it reports as 0b0e:0311.)

Signed-off-by: Joachim Priesner <joachim.priesner@web.de>
=2D--
 sound/usb/format.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/usb/format.c b/sound/usb/format.c
index 9d32b21a5fbb..0ba4641a0eb1 100644
=2D-- a/sound/usb/format.c
+++ b/sound/usb/format.c
@@ -260,7 +260,8 @@ static int parse_audio_format_rates_v1(struct snd_usb_=
audio *chip, struct audiof
 	}
=20
 	/* Jabra Evolve 65 headset */
-	if (chip->usb_id =3D=3D USB_ID(0x0b0e, 0x030b)) {
+	if (chip->usb_id =3D=3D USB_ID(0x0b0e, 0x030b) ||
+	    chip->usb_id =3D=3D USB_ID(0x0b0e, 0x030c)) {
 		/* only 48kHz for playback while keeping 16kHz for capture */
 		if (fp->nr_rates !=3D 1)
 			return set_fixed_rate(fp, 48000, SNDRV_PCM_RATE_48000);
=2D-=20
2.49.0

