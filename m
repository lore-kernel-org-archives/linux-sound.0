Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10075450909
	for <linux-sound@vger.kernel.org>; Mon,  5 Oct 2026 09:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791193490; cv=none; b=WjDzMN1aT2EcdHNdY8bW0VQFnf7F3C1S0Ciy664F3QfdfYihhz4Is3cTxYLzHVwNunFgagexs6KED7X2NMiz1BKrFBoEUHlOYsj8vWcCydAfeQ7YqXRvdLwOPbQkmIdXRj9Bac65o9QWWzpzum1OYg/ccdFm43sXZN3txReF4Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791193490; c=relaxed/simple;
	bh=0Qcor3sqOr9uJ8ydyT0qrqzK2or+90fq7DPE7GJRv+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K/XImI8rMLu2CFBI1q1eN/BjZXnqwB3z4ip3Z6XB7smztgGp73E5XEGM4iN74HUsqK8KD8Zop9xhCspOD0ECYGqJxBrX38BkfVgUkNJw/DHWX6xwMtG49fAsTfXhgfejov7E/39NeEB3aeFMXjqWi6XQlk607ErTJImANWTGmjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=onsFzcGk; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="onsFzcGk"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48af5ae31d8so1162562f8f.2
        for <linux-sound@vger.kernel.org>; Mon, 05 Oct 2026 02:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791193481; x=1791798281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bOz7f867lNtkOwbm24DCoDsxQhi/O2ENqajABr+QpcM=;
        b=onsFzcGkTu2veDmYOyrtQw6VEjRm0b5nRtu14NBPIQrDqd/qu17xLZm3WWxLR0ToQB
         hYqJB2MWkWIHug9fD9iLyUp/d7Ap+MziLynA8e/Rz2AoBFRlAL7XI2zpmPTXbdourAvy
         +4fDtqzaaLrQvlDsiu09CyBdJ7OqhflPWyc2dap+REbdzcBOdzATsIqDoWi6f3XyrHSJ
         dxtRvRdQcvy81tGPg3KhD8pPi12M6SUZIKNNIpoUhNLpeOMFpryfLVNCcvlgA3bDVKGz
         6lWy7zpkyRNLBdpg3w09f6ycwACPaZpz8eW5WJp6NCbKWHabyEBLC6T3DhAtDks1qHZe
         CSzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791193481; x=1791798281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bOz7f867lNtkOwbm24DCoDsxQhi/O2ENqajABr+QpcM=;
        b=pROMpP53rJPwEHI9NPq21lT6Vo5stlOlMtVcZqXCdvZ9VOgcSgeFSVNhCGW0px2NR/
         MfP7F75q4USKwQJyfP/GHjgTeri8s4JRueqC+tzAXgOGq/9LerL3e8g5VLPCnfl0HYKK
         R+bqY580rysR/ewV/YdyFn1rAnMXPLKEey/QoQ7Bo1qRpIU9N13xlWmzeyzzCouMwi1x
         idxB2aytLm5S1oOAXk+8rqL7LXFobJrJ3tqsocqy1Ruz90vZxNUty8HJsDG1956bHcsy
         HIxNuCcVj+AGZmrCGuEbOq9z2gd5xNzhpWq6hJCEMwd021LsOLKoXIRPOMa2mBSQ8Ijw
         GY3A==
X-Forwarded-Encrypted: i=1; AKwUvByUmXReezsLlwfQ6hVkWA3NURE3rxyNS9tWTdhsRhJQk3meNUkshEEMSTttFgvHA0fOBYy4Pr9sGiiSyQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIhlFaMnkPYhsUStLMOXXOOWDDvjSm1SgneynMQXYmWeiUycBGt
	L9Br1rLEAhDHaUn33+PNajAd7c4a12YIoFfg2sL2CCOywRc7iyKo3z4b
X-Gm-Gg: AYBFou3QQuvtm2vz/wqBV96tSZ2160+JahRuJZfqQymbeM7W0hgtG0/Rw9+alojoFCj
	3c07oJr6aY2BWXCuSDVQhh+1Ihe2uuyFt24qeHbXNWpsW9lpQotJ43qTGZZFflgz0L505I8Gwqi
	/CPEsoJa6XlCZqkheDLhcQbxO7A0AS2Inc5W5nx11LzCIpWJjmPTqyrO/4qAwsqw94jyTsn3sAG
	0xT6dnM/uT9YS+GKnyrzYip9xOQTpwFUWhvjKhM2x6Phj5d9q3nSOOGEHUZHE9UhnkTMYnmK5KM
	ErFZwBWMmGMt85xP4qJ0g1a6IjDzz44KRkokVa/Illvxz6w9u1ev0JNoEaWbsLs3ICLGcH3FS1v
	y0Mksxy+rPbeKsF8dIfOASJQLA42ehJG+BSteL9L6k9j4V2YjxbzuY35GHERl4nQS61cIPshnth
	WmbJ4fABbuvZBZZ+NpkB3uMqB71NF2EpFOJfYFzwwdkUSh8fdKjLks+xQkCeDuPVkjkBizgnweN
	kVuOWkIeouTmQBAH5W2
X-Received: by 2002:a05:6000:4208:b0:48a:fcd6:f351 with SMTP id ffacd0b85a97d-48b1270afebmr17341683f8f.20.1791193480510;
        Mon, 05 Oct 2026 02:44:40 -0700 (PDT)
Received: from vadym-MACH-WX9.taild8603c.ts.net ([45.84.184.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c62100facsm2880962f8f.0.2026.10.05.02.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 02:44:39 -0700 (PDT)
From: Vadym S <0xsheff@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	Vadym S <0xsheff@gmail.com>
Subject: [PATCH] ALSA: usb-audio: Add quirk for Shanling UP4
Date: Mon,  5 Oct 2026 12:44:32 +0300
Message-ID: <20261005094433.32960-1-0xsheff@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAPHAwzdUNRbZjBQuYKLf18EK_QGq0gR6Vx3YMZ=ffYKBogUtLA@mail.gmail.com>
References: <CAPHAwzdUNRbZjBQuYKLf18EK_QGq0gR6Vx3YMZ=ffYKBogUtLA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Shanling UP4 (0a12:1244, CSR-based, UAC1, full speed) sets the
MaxPacketsOnly bit in its AS isochronous endpoint descriptor. With
UAC_EP_CS_ATTR_FILL_MAX set, the driver fills every 1 ms packet up to
wMaxPacketSize, i.e. 48 frames, regardless of the sample rate. At
44.1 kHz the device expects 44/45 frames per packet and outputs only
silence. 48 kHz works because both packet sizes are the same there.

Measured with aplay on hw:UP4,0, 4 s of S16_LE stereo:

  before: 44.1 kHz consumed at ~48030 frames/s, done in 3.68 s, silent
  after:  44.1 kHz consumed at ~44220 frames/s, done in 4.00 s, audible

48 kHz plays fine both before and after the change. Regular music
playback at 44.1 kHz through PipeWire sounds fine as well.

Clear the attribute for this device, as is already done for the MOTU
MicroBook IIc. Since the packet sizes are equal at 48 kHz, this does
not change anything for other devices that may share this CSR USB ID
and only use 48 kHz.

Link: https://lore.kernel.org/all/CAPHAwzdUNRbZjBQuYKLf18EK_QGq0gR6Vx3YMZ=ffYKBogUtLA@mail.gmail.com/
Signed-off-by: Vadym S <0xsheff@gmail.com>
---
 sound/usb/quirks.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 38d78b834..3fdf03ce9 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2366,6 +2366,14 @@ void snd_usb_audioformat_attributes_quirk(struct snd_usb_audio *chip,
 		 */
 		fp->attributes &= ~UAC_EP_CS_ATTR_FILL_MAX;
 		break;
+	case USB_ID(0x0a12, 0x1244):  /* Shanling UP4 */
+		/*
+		 * MaxPacketsOnly is set, but the device expects nominal-size
+		 * packets. Filling 48 frames per packet at 44.1 kHz results
+		 * in silence. No effect at 48 kHz, where both sizes match.
+		 */
+		fp->attributes &= ~UAC_EP_CS_ATTR_FILL_MAX;
+		break;
 	case USB_ID(0x1224, 0x2a25):  /* Jieli Technology USB PHY 2.0 */
 		/* mic works only when ep packet size is set to wMaxPacketSize */
 		fp->attributes |= UAC_EP_CS_ATTR_FILL_MAX;
-- 
2.53.0

