Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46EF93921FA
	for <linux-sound@vger.kernel.org>; Sun, 23 Aug 2026 15:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787498868; cv=none; b=Uj6H5snA8nZXzKa98R/xShUmsK2iWNsYHZQhLyl07HKCadkNX8Ig0NMczFwEwXyENO/c1b95g4TaQg2xZZYA2RJuhkdwNmuR4glZuH55Yy/z6eIyHiD/wg24Kji9MYZaYL8gi6SyBdLSiKmoQsb7q9cRguBVN/uCRK7yaEJUQzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787498868; c=relaxed/simple;
	bh=guHXgb9DgUAuMfuYO8vyWkqWnK64NtzZ5dFFT8x2Dd4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=su36AmcHElh6/2R32hiokPRD/O8A/k8L+8UBCf1xbfQOLkgCJqg3x8wVm2+4xPteW1hk1MQRiWm85qQibgcJuKjDhTzFYkfR2kjhT1m9fvujgXdMQlZgdRAHSlv1NHxsNq0eoj0u3lee5103k8kAPTqYhfJfjzm2b/RrhSDq5UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=frba.utn.edu.ar; spf=pass smtp.mailfrom=frba.utn.edu.ar; dkim=pass (2048-bit key) header.d=frba.utn.edu.ar header.i=@frba.utn.edu.ar header.b=cAljtyk9; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=frba.utn.edu.ar
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=frba.utn.edu.ar
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=frba.utn.edu.ar header.i=@frba.utn.edu.ar header.b="cAljtyk9"
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-754ac74c495so775759137.0
        for <linux-sound@vger.kernel.org>; Sun, 23 Aug 2026 08:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=frba.utn.edu.ar; s=google; t=1787498865; x=1788103665; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gROnjE6TVM17sAg7OSc5s6lR61HMOIDfT4CBGxGo8VM=;
        b=cAljtyk9u9MDkCyF9Ln0NSS2B/2TWrEHHSnMB114ZjgIyuM5DXprNGkoQR3UuGYQyf
         4735ieswTB09VDFgNHbknvgAfmZsrRF/HkePR6Har3dKzXgGd9D+56scDfYVVrSZhlbQ
         aW+A02tluYK6opWaovRENZJl0NkvnBXahS4oRwPC4e2rM5fp+GWNoGTlWpnSqBcjaz9W
         /wSm7/ZCdGwmzQO+6AKAFd/MmDtPVbiXkYJzO4TFZVPNW3iZ/R9Q8qHnxcYaoBDCJZSC
         SBqtP8q3WDUbftgdROZ3f+qTJ65E32pniIXWvtfnd8IVl7KUiP0OVdKJHdRc2gglwxjt
         +cQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787498865; x=1788103665;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gROnjE6TVM17sAg7OSc5s6lR61HMOIDfT4CBGxGo8VM=;
        b=nAB+J7Db+KDAUbkpAusw/YRkCY5Qsov5KQwS2T2j/iaB3FgZIbYeh5Geq9FGMhbBxj
         JHP2ob7r2esUL//+u1U6jUEHczGKUAURbdcwFO2ii02J1/PqmVIkQG1ccvaMv0BuPgTC
         iPIDsrejSOVZGvMFB8McwrASxeE4O5O77xBh8KZZZ+oqzNpeA6FGKCh8WCXdaP8BUbSw
         8O2Hw7GzzGvjYTXN9NkY47nW5xBWgErwRWDawyucS0hB6S7FLAfQ3HX3QqTp2FT78oKv
         m4Td286M4YjBItt9MpZzZVvA6Ri22EXwZHRrLuJnxK3dz7l8wAFRyJz/3ao4KhbO2Ag5
         Sl7g==
X-Gm-Message-State: AFuF++mMvreTBJ3mbRhuDhJccNVM95UWdTiRzq6LJpFU2IFf3ThxTUkk
	7f8N0cmxHbK9eFrh+rwRavPBBNI2OPTJs1DUxO9DWH4CjMXDXO1EdY63qzHt2mgNQ3/Rr+bYvbi
	C3tJn2U5PFw==
X-Gm-Gg: AR+sD12dKDRCKm4FODoJQ4uw67P+RmahQGhJWmAyFK94IrWpAIJOWTX1s3dH2w/P1qt
	7r9m91zaJc6VDECfDsu8gV1ra3UAAZjRh5d9HzNMEEdchA+Y8+iVXklZSryGsaJc2gyYX6gydjy
	gzwgrM7lZ8KAKS/mjuHoGhS/dzlaTsGOpJ9phgVxFZ5e9CLPHxOhhPsXWxTvYejA+s8lOwkXlyv
	T8wDNF4DFKd4lgsLPzF0myzPxJI6uFJ/Zxi0IXRbx3Y2HwRZi1IpDzWFhcpHpGbvqb9xZlPheZj
	5O6J8+MTEEv/r7ctYoqLF1HlCRhibhGKUG+M6+NiV+8eE+ooUPkE3b+G6WCfGJzqS+avWbrOwUT
	GV+PIgkAM+LqLEdk8LCvyBpbNGYJyNpPoCfsIiOt1SsTEdhrQYn1Yaq6daPAtdIGFNz37cBnxOV
	KztRet3SzbRIxfMBL/XKCoyRWGH1CZk5E8UAidqsoidJEAsDqojAr3PS+saRLKj9f27pVQYVjf6
	XVqF0K1MzMCL+QbSSh1cIfgFw==
X-Received: by 2002:a05:6102:2912:b0:778:71e5:45d3 with SMTP id ada2fe7eead31-77a6434e104mr6026076137.9.1787498865229;
        Sun, 23 Aug 2026 08:27:45 -0700 (PDT)
Received: from localhost ([190.192.192.134])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97c836fb2d8sm5032841241.10.2026.08.23.08.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 08:27:44 -0700 (PDT)
From: =?UTF-8?q?Federico=20Valent=C3=ADn=20Andrade?= <fandrade@frba.utn.edu.ar>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	kuba@kernel.org,
	alexander.deucher@amd.com,
	=?UTF-8?q?Federico=20Valent=C3=ADn=20Andrade?= <fandrade@frba.utn.edu.ar>,
	=?UTF-8?q?Federico=20Valent=C3=ADn=20Andrade?= <ristarfede@gmail.com>
Subject: [PATCH v2 2/2] ALSA: usb-audio: Skip mixer creation on M-Audio Venom
Date: Sun, 23 Aug 2026 12:27:33 -0300
Message-ID: <20260823152733.740731-3-fandrade@frba.utn.edu.ar>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260822043033.529424-1-fandrade@frba.utn.edu.ar>
References: <20260822043033.529424-1-fandrade@frba.utn.edu.ar>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The M-Audio Venom (0763:2084) does not answer any GET_CUR request
of its feature units, hanging up the USB microcontroller and
"responding" with timeouts. So the mixer building lasts around 47
seconds, and the device does not stream at all.

The same GET_CUR requests issued through libusb (with no kernel
driver bound) complete correctly and blazingly fast. So it seems
to only happen during the initial probe.

I defined an explicit composite quirk to bypass the mixer creation,
as it is not needed (the synth already comes with volume controls).

With both this and the device flag applied, the synth works
flawlessly.

Signed-off-by: Federico Valentín Andrade <fandrade@frba.utn.edu.ar>
Signed-off-by: Federico Valentín Andrade <ristarfede@gmail.com>
Signed-off-by: Federico Valentín Andrade <fandrade@frba.utn.edu.ar>
---
 sound/usb/quirks-table.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index 0a3d39b838..dd02c6294e 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -1814,6 +1814,28 @@ YAMAHA_DEVICE(0x7010, "UB99"),
 		}
 	}
 },
+{
+	/*
+	 * M-Audio Venom
+	 *
+	 * The AudioControl interface times out on every GET_CUR request,
+	 * which adds around 47 seconds to the card registration and
+	 * freezes the device, blocking streaming.
+	 * Using an explicit composite quirk to skip the mixer entirely.
+	 */
+	USB_DEVICE_VENDOR_SPEC(0x0763, 0x2084),
+	QUIRK_DRIVER_INFO {
+		.vendor_name = "M-Audio",
+		.product_name = "Venom",
+		QUIRK_DATA_COMPOSITE {
+			{ QUIRK_DATA_IGNORE(0) },
+			{ QUIRK_DATA_STANDARD_AUDIO(1) },
+			{ QUIRK_DATA_STANDARD_AUDIO(2) },
+			{ QUIRK_DATA_STANDARD_MIDI(3) },
+			QUIRK_COMPOSITE_END
+		}
+	}
+},
 
 /* Casio devices */
 {
-- 
2.55.0

