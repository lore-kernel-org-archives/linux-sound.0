Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793194213;
	b=k9rWym9xr7dVudT59HU0o0hW3cqN7oJGDvWnTR3k4K+UJtY925DJNgCoQAa/KEtu75t/
	 TpNiRSTVBCfewr/Fvu243/5DFEDzKFvsh8bFHOLFSSDKRtLIQRBFYKfaQlX0V2KA36xdf
	 hFRYZMdBDghH+UiVQbLTgQ1BeiEZZt56sXrydUxiWSorZwHfGcyAVY3GCqk2C64WnyoZb
	 Cpp8RB+nKv0HnQoWsFnvEkbYkVxvmVfs5G6Rs/TYxtpAHvOvH6FwwlAxatyIUjL4Mmup7
	 OGUKt9fICRRvYTAXNJmiYgIUXBvYAsO+tX+/qcWrLL0KJN0dppGxMSL9T/Ibyrn7xAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793194213;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6f4Woc3XyMt/SHCxQyb8Mu+ku7o75W8y7G3fAoa1yCU=;
	b=2d+sYzAy6iTiWZcxhnJ9i7pX9Tv/UNFaxHSkkde+oA24uVG9LgBaBviHTPs6CqHEwmwk
	 TbLEWU4JpCYliA59Qeq58+qT0BSHpqeSBQxIMA1hj0N/a4xLj+YiPww4nnD3TOGwlZPIz
	 QEuApWRUmTvpA6s1wQyRuSyiuiZ6+J9us/j2rVFcN3GSsbr6uFdWptnuEskWCkYbckurC
	 D0lBLb9J20YHc6vyDQqhOmNH8o83KhJlpFz3vn2m2FTxXtKqvTMVi48jHo78LBjm7eWw+
	 EjX0dtx7q5SbcZBGWCmaEJWAvMFRdArA/cMT4x7I+8Uq2Qo8td3uuZ+pnTS/pRzKWRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WvxrqJ99;
	arc=none smtp.remote-ip=209.85.208.180
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CE7606A32D
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 13:30:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9CE7606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WvxrqJ99
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3ac8c03cea4so6825011fa.2
        for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 06:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793194211; x=1793799011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6f4Woc3XyMt/SHCxQyb8Mu+ku7o75W8y7G3fAoa1yCU=;
        b=WvxrqJ99zwvaqod4/2gjx2Pk9XxspHhavfGzN8VQcoRla9pZs5tMSXCjSlZ6s8jC+q
         d2UnkRjcL6/i+8RTPyWem1p+4mYqEnsKBxJ/ZfFwKvlJ8UQCnuZhUDeXgZEQnKumnp1G
         oiktPJuJpT6+lEfXOf27+phCY9pPBVCyq5FS2iueRe4UqWZzw/VyxRdzWfrAENWV3ElT
         3rMJ/Cw6BE9hZYu0e7d9pR+1tSl7TyOYnwRMV99Q+2fk4dMq3ueQtw+boVBefFxw97Ic
         u0kDd2pCu6OV41B9kQoLOC8YPO38kpBtCqSmeLES99dAGrl6aW1gruhdaruqRBQSWA+M
         FK4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793194211; x=1793799011;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6f4Woc3XyMt/SHCxQyb8Mu+ku7o75W8y7G3fAoa1yCU=;
        b=Bc5Md90p97HWYyQoWsb72BxJbrZwnt+mP7VKEfkMNAvZ9ZqOFviAyruAnz4TmeiNmV
         Os8i7PtPdHCQjMPCFgcsB/1bLOy3j4yhft1/KpCPZg4WYVlFLmQ++RjhC7TbiAgoWyWx
         dcLSTQQNYos8pn/YUaECCZKGJ5Nvutmiv9pc6wTQ7VNw8MFm80kTclKWJfEr8TEziMV/
         XPQU+FREtCQ9x+7PSxw5zRvqfRpdKdpHChylWfhWU2KOYe1AZRtO9pnILA7CbCCqk4Ye
         Mxrdj59aUnqWCbUX4cL8J9BLVtD7LYWVuFUm6w30TQBlPghvbLBkPI7uMZ6swaOc/Fh4
         vTyg==
X-Forwarded-Encrypted: i=1; AKwUvBzyyX4Le716z/lAeShJrzUPOs7Qy58UUhEJWh8y24MH5hzCh9oEYlWxI1MvuGpgDKzK4bpwExGiJj/McQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYK6YK145qNchSEmHHc1Gaioa5+587wNxZ4+xmmnXCyBisJ/g1xn
	d99ryYi8ojYJKzf7dcFahmZKgptjfXLWqEPq+le03X49RBjxUhF6Soup
X-Gm-Gg: AYBFou18DVnr5vQE+ZHEaPY4rMJpR+HmZNcB4m1T9Lzt2Jp7qAihHi5qQfD9+wEFay3
	+CJbM7zRc1XG9AzCyPzhQEfeNRYw5wa8pBtc9vUSoF52u8T6GjiTgWivxNMHiZNUGsUNiIWIv9C
	FZ6tGnvNyfWO6m3r79Pg+CneVS2bU6NSBS1Vq9dVZD57iDR2WVanOdMGmYkZJsGlG5qYJiislJY
	EqUzv8Iqbi6NsxYxa1a9KgCanY8W2YhCiCYj+mEHXzrLtCY0C63bRsNvISX8UXsHGoLSQoUhW5Z
	GnSKIonoeOL+5XnF4KKwvVJ2SlJBAlsAtjyQMYuvPfgL9/DOpsTg5HhVkAY62VOylmUjmJAxmMW
	aPQ3J08+9w8Q0DshYK84DGI8RDHEHLjd6MaSpKw5pfRIvWTxbg7vxsTywdOAdsq7dJKDTq8PVJ7
	flWNQXr2qMo+lmie0SWdoSe02QfNds/ZeKyFg+Jk7t+CV2Y5kxnNgXTllFH31f1CV5uERrow5OF
	z9zmGl2dThaeWhEtztD8FJPJSTAt3cKpytWuFdaF1OGQ/qioMR6dD3YEeuWVmfDIREmO5TtnsAY
	hPtMICwd+cjKvkIcPtKI73r7E4W7Ysz//48N4xXVgr13GVoB+ir0uloG8ah0lzasw+qDty5c
X-Received: by 2002:a05:651c:54b:b0:3ab:483c:9149 with SMTP id 38308e7fff4ca-3ac9cf56f02mr4952551fa.17.1793194210831;
        Wed, 28 Oct 2026 06:30:10 -0700 (PDT)
Received: from NOT-THE-FBI.miamioh.edu ([134.53.242.65])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac70993a57sm30955841fa.12.2026.10.28.06.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 06:30:10 -0700 (PDT)
From: Benjamin Pryor <programmer2514@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: Andrew Udvare <audvare@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Benjamin Pryor <programmer2514@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Extend ALC1316 fixup to MSI GE76 Raider
Date: Wed, 28 Oct 2026 09:29:51 -0400
Message-ID: <20261028132951.1253841-1-programmer2514@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MSI GE76 Raider drives its speakers using the exact same ALC1316 smart
amplifier as the GE66 Raider, but under a different hardware ID. Thus, the
same speaker dropout fixup should apply to both devices.

This patch extends the fixup that configures this amplifier's silence
detection to apply to the hardware ID of the GE76 as well.

Link: https://github.com/thesofproject/sof/issues/10475
Link: https://lore.kernel.org/all/20260909193104.26508-1-audvare@gmail.com

Signed-off-by: Benjamin J Pryor <programmer2514@gmail.com>

---
 sound/hda/codecs/realtek/alc269.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 23aa175faedd..1d3f60ea9adf 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -8330,8 +8330,8 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x144d, 0xc1cc, "Samsung Galaxy Book3 Ultra (NT960XFH)", ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS),
 	SND_PCI_QUIRK(0x1458, 0x900e, "Gigabyte G5 KF5 (2023)", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1458, 0xfa53, "Gigabyte BXBT-2807", ALC283_FIXUP_HEADSET_MIC),
-	SND_PCI_QUIRK(0x1462, 0x12fb, "MSI GE66 Raider 11UE",
-		      ALC298_FIXUP_MSI_GE66_ALC1316_AMP),
+	SND_PCI_QUIRK(0x1462, 0x12fb, "MSI GE66 Raider 11UE", ALC298_FIXUP_MSI_GE66_ALC1316_AMP),
+	SND_PCI_QUIRK(0x1462, 0x1305, "MSI GE76 Raider 11UG", ALC298_FIXUP_MSI_GE66_ALC1316_AMP),
 	SND_PCI_QUIRK(0x1462, 0xb120, "MSI Cubi MS-B120", ALC283_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1462, 0xb171, "Cubi N 8GL (MS-B171)", ALC283_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x152d, 0x1082, "Quanta NL3", ALC269_FIXUP_LIFEBOOK),
--
2.43.0
