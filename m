Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C76719995E
	for <linux-sound@vger.kernel.org>; Tue,  7 Apr 2026 21:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775596392; cv=none; b=jC0DwD7yLe64omQauXDKgKMC+r7cW4MVk5vbZrjpIgchRiO0uZHBMIiXjsV3DwE6BiMpK/sfnuMhf1uJ1A/WjCRtI859bYpGpkQqZw0FNzUy4kswaYwExNik4b/mU2Qzz6KOdItM8Tyoh8KGEtAmhQ/ncEfA9ptwt/VpEnG3R8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775596392; c=relaxed/simple;
	bh=70wijRNEr6RNy7JbsO1OOuJjrSmCYz5wB1srCvcu+BQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jqFg3AdbsPYhkkwhiUz5oNbsOIZTvC7nx3ZV4HWczlJ7YbKXaeVYFk9h+fmlF4h/zbp3sr6hwZ4zq7jH62apSGuICHbyugVOjPyhr5+hT0EeoaH3GRFoAyWM8OS5Dfc9YBz520wTxhPCJm/pVlSmZMb8U0AU9G/CFiWKdFDBWPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BV87CJaH; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BV87CJaH"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2d18dfa2713so1203677eec.0
        for <linux-sound@vger.kernel.org>; Tue, 07 Apr 2026 14:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775596391; x=1776201191; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jhY/NQLCBOb9rAwhfvdmDuFiyy2ufnzlkKe7ZqdJOxY=;
        b=BV87CJaHy8vSxsh+1up2pgSzgXm3tHvtad0zrZNNlX+6rKXhemm+GnQrncv3ZJgOLt
         HtsPMfTzaBrqwrSk68uEwA1W3tUcQmWPjmA0zNbf2ZaK6o1sDRRv3b+12DkTaSpWJxL8
         uBDIgFFIXxlEGgArtG7kZSYStXQqKjST5cm7PsiqOTQyzvwAM/xe54xheNo1HbwW31lr
         XTwSt1O5o9a9MJhjTC5RXlbCz1np2r7cJR34mhINM9BHBwJfWygY3cstlknUpSyQf7uc
         y2OV6Neh9M5xdr1szoeg6q9/U46CPadxYIINjJgOY8mCXFil+46ItCSBvpXWMZMHvzIk
         ZH5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775596391; x=1776201191;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jhY/NQLCBOb9rAwhfvdmDuFiyy2ufnzlkKe7ZqdJOxY=;
        b=AMjuJQK7Tq0t0plfeuqV5VkotnhloHpaeNu1+bD/ulrvrb4mhOVJXJZeocXLT8/Jqt
         zepkSX8pW2KMZll57TDDc744c+ZlipBB6eWCpSU6O7wrAg9BhcGkTEJrZbOvbrlvtbNd
         b1BRdDFblWhf2Ccz7/hz6zPt+r3aYOKpsUul/ilD0N9/uc2tv5AYLeBaMW5AQxairuyz
         cz3Q4K4gOonTVIDaLnpQdvNBClqq5vmOq6hdYsObinUV4Q8/pMT5l372uT+GgrR/d2C1
         QAjTMSMn9gNq5D4ZdvxpcKezY5/pSrckfqczLxPrqaG38/0uCgr2+S2odrMfcmcf1Nrk
         X1gg==
X-Gm-Message-State: AOJu0YyaiHCZcmXw0rU7U/4ci+RljP8WFnrjqmnRxjRHj3TmL3mnXMay
	7ZJ4Z0hxh220by3PTE4nWW3rua2H6YTd6viTZR1sKJ3KvrI9o5bToHsfafE/zg==
X-Gm-Gg: AeBDietAGxXQqZW37yflUIuGHgGfpUiWcVPxzBZkpi3ShAHizv0yh2IUZGIQox0SWkH
	YPaxBNIxjhS9vC/F/3vNqRdymthW+UDkGOfAckmXetSuwnqx34yReE69xA7DGc1dERXgkDOYKh4
	8TtdUYDDPrsVPI/6H4M+nt9eCLrwQnulz/KlxNM7bMc9hEHMX2YT6HLEMxwyA1JCDgGPhlWmgJT
	dcnTAICMzJGuZ8IVTZ4I4pN7Cu7M4OKULUT6bhI4Xjq6RjLbfV7PHaQUX5MRhgCae2WNczExa3T
	X4Gub1NUBAgS4BZPDG3m73TpvOU96uDN33Iom3/7hbvzo0NF4I+ELQaeFPvD5OfJY/ymbJZ1/S7
	4tMDiHA2xrjGaZZPhPSF0/zMfuXIHecXH22iA62vI4L27nyQD6pA4uCZ4Oagc2YeNxu73IYBIL1
	pCv0WL31y4b4TJGoOoXwKD1lCTAI8wTo6XpJzpDZqCmqDGfj6C8H6l4aTm5DCukKrZbAh0MgQ33
	Jv4
X-Received: by 2002:a05:7300:571e:b0:2c5:3b87:2fe9 with SMTP id 5a478bee46e88-2cbfa4c7f62mr8795174eec.9.1775596390582;
        Tue, 07 Apr 2026 14:13:10 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-167.user3p.v-tal.net.br. [177.4.161.167])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d2cb4a7cdbsm1368043eec.19.2026.04.07.14.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 14:13:10 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Tue, 07 Apr 2026 18:13:06 -0300
Subject: [PATCH] ALSA: i2c: ak4xxx-adda: implement AK4529 reset handling
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260407-ak4529-reset-handling-v1-1-b971c18b1a32@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM3QqCQBDF8VeRuW5gvyy2VwkvTI82FVvsqATiu
 7fl5Q/O+a+kyAKlc7VSxiIqr1RgDxV1tzaNYOmLyRl3NMF4bh+hdpEzFBOXRf+UNHJ0NviTsdF
 joPJ9Zwzy+XcvzW6dr3d00y9G2/YFDKtHunkAAAA=
X-Change-ID: 20260403-ak4529-reset-handling-9214370193ef
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2429;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=70wijRNEr6RNy7JbsO1OOuJjrSmCYz5wB1srCvcu+BQ=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJlXi1MeJa0zZ65Z7r1hUkrdqTVNi02WfN0RGsxevHhV1
 rpQq4nXO0pZGMS4GGTFFFlWJy2y3NP14Gp93AoPmDmsTCBDGLg4BWAirU8Z/sodWDx/zuWKhyZp
 0+zSlH5dunSl59o+8Q1ruaast0zRuyXCyHDsZJUM5+Q76a3Fvu9D2nkEEuXu7V5RHl5wj7+w9+S
 7Xi4A
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

Delta 410 uses snd_akm4xxx_reset() both around DFS changes and from
its PM callbacks, but the AK4529 case in this helper is still left
unimplemented and never drives the codec reset path.

The AK4529 datasheet documents register 09h.RSTN as an internal
timing reset. Clearing RSTN powers down the ADC and DAC blocks, but
does not reinitialize the register map. That matches the existing
ak4xxx helper model, which already keeps the desired codec state in
the software register cache.

Implement AK4529 reset handling by clearing 09h.RSTN on state == 1,
then replaying the cached register image and setting RSTN back to 1
on state == 0.

This restores cached Delta 410 mixer state after resume and gives
the AK4529 DFS-change path a real codec reset sequence.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/i2c/other/ak4xxx-adda.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/sound/i2c/other/ak4xxx-adda.c b/sound/i2c/other/ak4xxx-adda.c
index b24c80410d45..bdeb3cef3640 100644
--- a/sound/i2c/other/ak4xxx-adda.c
+++ b/sound/i2c/other/ak4xxx-adda.c
@@ -53,6 +53,31 @@ static void ak4524_reset(struct snd_akm4xxx *ak, int state)
 	}
 }
 
+/* reset procedure for AK4529 */
+static void ak4529_reset(struct snd_akm4xxx *ak, int state)
+{
+	static const unsigned char regs[] = {
+		0x0a, 0x00, 0x01, 0x02, 0x03, 0x04, 0x05,
+		0x06, 0x07, 0x0b, 0x0c, 0x08,
+	};
+	unsigned int i;
+	unsigned char reg;
+
+	if (state) {
+		snd_akm4xxx_write(ak, 0, 0x09,
+				  snd_akm4xxx_get(ak, 0, 0x09) & ~0x01);
+		return;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(regs); i++) {
+		reg = regs[i];
+		snd_akm4xxx_write(ak, 0, reg,
+				  snd_akm4xxx_get(ak, 0, reg));
+	}
+	snd_akm4xxx_write(ak, 0, 0x09,
+			  snd_akm4xxx_get(ak, 0, 0x09) | 0x01);
+}
+
 /* reset procedure for AK4355 and AK4358 */
 static void ak435X_reset(struct snd_akm4xxx *ak, int state)
 {
@@ -99,7 +124,7 @@ void snd_akm4xxx_reset(struct snd_akm4xxx *ak, int state)
 		ak4524_reset(ak, state);
 		break;
 	case SND_AK4529:
-		/* FIXME: needed for ak4529? */
+		ak4529_reset(ak, state);
 		break;
 	case SND_AK4355:
 		ak435X_reset(ak, state);

---
base-commit: e051f09ba003f8b93dda4a8d55a1bff797235c0b
change-id: 20260403-ak4529-reset-handling-9214370193ef

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

