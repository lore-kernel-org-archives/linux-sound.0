Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F6A54BFD
	for <linux-sound@vger.kernel.org>; Sun, 28 Apr 2024 09:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714297048; cv=none; b=K7eNoYJwwwBkbVvYeBAtdtePgl98MrmbOb2ziOryX1W1CLwxKiPJ7WblLi7GlSUSNFKwZ60TUO7w2JoPII8MlKpvTvL4V/tQt1rkY+nKPmCBQylSKsBgXCEPxlsx0eyFo2mlIK/6jTAdW483waV3v61Mpjky0GogSOErHzxI5kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714297048; c=relaxed/simple;
	bh=sfDQbY6VCB3N7eo24ujXH2nq8aM3/YOx0Cj5g6lF7Mw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bSoxhsRO9wYD/OYWKjT3TOrg4CjIjpA32SWWrcX8qbwIA6bsglKb0vk6GCJjkn9Pjg8KXpOmYnH+WDob+4Pxgtr2P0Vql0D5yaVFEdond2JhjOxsubNk1lZOFcyugP88zwNNDg2jAOMUzczYR+RWEWc8sqGfssSKfCqmmg70Nec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de header.b=r3PeMX0I; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de header.b="r3PeMX0I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1714297037; x=1714901837;
	i=oswald.buddenhagen@gmx.de;
	bh=z6fsEp7F209GNonUXHk4ngmpHbXVhgOgbIpkS5X8kYQ=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=r3PeMX0IFqwUXZ44xDcibjSeI7EvgFU+Jtw4MgahpxousT/Rs3san53NnfYMiBMd
	 VEqYvZLlnX8apGnHHOa01BHeWrZ4+VPbb3W9diPp0c3REKCbZniw0PPbbERpIqOIZ
	 w0277DmrKTS2EPnv+YLdWwaoR6VPsZKyOBp59ea2Wp8zfZTisAxDhWSMHz8m+A+pP
	 6SSZndvjHLg1IUSrjCfm3aczMBq3MR+N71xwlhPTQilf2GYtj4TkbmfuCygohaktJ
	 Rz33NOCRMt/dckvWAw3xzHKEfqCh5/tB0x6wD1AWeQjbcj/Bc/3tyg6diqTYJEZuh
	 IfMReNei1LXfzZ33kA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.124]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mn2WF-1sQDW60cfX-00k5Qv; Sun, 28
 Apr 2024 11:37:17 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1s10yC-Q87-00; Sun, 28 Apr 2024 11:37:16 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Pietro Caruso <pietrocaruso50@gmail.com>
Subject: [PATCH v2 6/6] ALSA: emu10k1: make E-MU FPGA writes potentially more reliable
Date: Sun, 28 Apr 2024 11:37:16 +0200
Message-ID: <20240428093716.3198666-7-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.44.0.701.g2cf7baacf3.dirty
In-Reply-To: <20240428093716.3198666-1-oswald.buddenhagen@gmx.de>
References: <20240428093716.3198666-1-oswald.buddenhagen@gmx.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:B/I12cegK16dgzZXvHO8K1Pl9Grb1a+LqIE9+biHqZzmZzD4hzj
 Hi778mbWpam/vzz99QnRfI83XQxZcwll8Y9sXjbt4gmUgSGfKT2QJ6SX2MLgcyE0ApfBhrR
 HUJYDIJiFLxm9JSs3ARwN/adcuBoGlswDIK2IFSfwGtA7402Hx4FUBKd8HJUBNW8ZNcBvD3
 5EfStkUXVp8paar78LWxQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:t+h+LXpqGaE=;gYncK7BDRm9lLZnRsUGZ8zdx8ow
 X8Dy6053RgnKTMuq3IftCvvSuoSQ3KNFzTL609x8x7dwpYLTsFouC1FSxmbcXf0HfZUxN1I3a
 k6mU+6dvsAbu/EegdYBOjOauUIfXGm9Gr69sFCKb5WHRTEroDKZh2NvwM+esu+9DqOu85mIhK
 UiUSI386EZDRf9IcGvPZH/Dsp86kPieX63Fkul6c2q62CqKIDcqoARQDVeNyi58MPwGkgD93J
 tOsijF2kplzDNM9KTArGkaoiZbpFAqPUnog42RXO7zitYsKiDLNHsksYYTsXfVUS4KhS0S6FS
 XY3qHdggzFeh4IP6CmJ2UVwLs/wGi2ecHAGizRgJ5sVhbJddTQbtDC0/bR1zBOv2rgpLyujbn
 BWpOzsduNNxYFiSX6WhPCDV+ABzMEhrqXARdOuGenA4p/NkTpYuwB1K3ProkwYOwISrdziAx5
 4Fwrl1vaD1+diJs4sLmmPJWJOyiN4h2gx+Btg2mRT8Y7eDrWpB6zWXZN+LU4ulqt67JaUbuS2
 LO76AC7mnsyXKsNlu3ldWC34JhHa8UHhtXzaG8/g5wSvvUgLpkPctDEHhaStp+Tud2egAGrc1
 mC5QI+WTY6P65jIOR5K1JX1Duu/i7BJuDDuP1tSy87LO+ZWqz1/k3Nn90TGEEfeOAfUidU6MO
 AkhSYBF+eYtaD6WS5vaNmuMMaXDscs8ZUgKhVFLO63UOmyGUqiPxViefC7n6TxgA/uGzp2n+o
 2M0vXkr5iIT5dh7xBo5E1G7/z4hnvx5v8fvp8eh+mY7ckPI2pxLxzQv1U5huVst9BVvydfsKF
 A4KWguT6hS5KtSsvtJKE5e/ijStiPi4Asmo/Br2S5lPAw=

We did not delay after the second strobe signal, so another immediately
following access could potentially corrupt the written value.

This is a purely speculative fix with no supporting evidence, but after
taking out the spinlocks around the writes, it seems plausible that a
modern processor could be actually too fast. Also, it's just cleaner to
be consistent.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/io.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/emu10k1/io.c b/sound/pci/emu10k1/io.c
index f3260a81e47b..f4a1c2d4b078 100644
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

