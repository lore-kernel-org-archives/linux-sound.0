Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823FD31BC80
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 07:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762847027; cv=none; b=Mz+OoZqDuogQJ4jKXqpIyuDcsz/aNw7cJCVPhwg/M5xl36xy4GeEPuHhgsufUj9QWkz6SyqrCzP5trDN5PgVK8xKA4r1FWG/em74L5+7J+11wQsZ66XGXBDdZyjvSXPwARm+/lVY8wC7cO96ugFkkqjujgJrTsoTgCj3MRUoerI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762847027; c=relaxed/simple;
	bh=hGu+GzN+iPOCwdycByBZkRXiL6hZVXSrjCx1H7RoOJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NpSsWeu8A9oBnQaYppvLfYZNcBbkjk2x+VU3iqhtOtaL/zRi3ncLmL9Lr5wjQviloV5HKtkkwB11KpQjM4kll7U/G2U96b7H1YslqoTLKKADxw7dAe3Lhq6FHWemDRd1fmkpdwh8DwCoKkmJv4VtTjydu0ls4s9ZxqbGdHRSXiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C8o45t4R; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C8o45t4R"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-782e93932ffso3304304b3a.3
        for <linux-sound@vger.kernel.org>; Mon, 10 Nov 2025 23:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762847024; x=1763451824; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wCLsaMhIhuFhIpbv/6Ugxb6YPVSoVgU518WhOc0TN0M=;
        b=C8o45t4R8X/j3JVDvFIsTsCerU3/X997xy1pjZXWPfu+qhbjyoi+uYFGbY5J2BMDMi
         ydanYgqPchkwRp1O9b6Oc5Q95NlgIImmZ567NsxU7Rgd1EmkFAmmeFCsqSjWwhufL1nn
         d7XGKhyQKljcU5eOF2fF5Tyai8GdlAntFDX3pGXuoNK5OcRYY7dzHAO8AcERH+GX9Gfq
         1tD9gt7kZgFwNlEak+sI8dEllto5hVBCrU5r7opAwJl3y2Uh4N5zQxRSWZNbumNFQwRn
         UyAltlOn5LSrzwJbFh9totjIJSZkWhnogK4dkMeROSt0EMc8cSA3dvSZImz0KgFhfyBA
         QRiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762847024; x=1763451824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wCLsaMhIhuFhIpbv/6Ugxb6YPVSoVgU518WhOc0TN0M=;
        b=CW5Uhr5qLcbnIA8rc9P3cI4uKru1/8OCjI1Cos9xuXHU5MaVD2F29YYjJD1HkmfXLL
         9NnUo48sQmwd6xgJZ/gE3BXHi2dsSFr/pFqDBm9KK5QRDphrqRYHwShQklSK4uLwY7xr
         +do+HYaHcqMv7dsqCbev/mwo406hl5LOUkx2G6DVAtpfZUUy1AUWEoXSePgWTlONeQ64
         Tinz57ruieM2qBuq1XE2s8e7VsCN7J3eWIc2HltO2olnELbNIo4zE6QHsgQKswltPqF3
         2iU2nZGoE2TdcNacWwv7Xp40FMtxFyLXd9TRu8zkFFWZQ9iWsKtcdjBp1/2U2O2kaUBo
         qDaw==
X-Forwarded-Encrypted: i=1; AJvYcCXC0vnxJh89QOjUtfqi3f+3pcVA0pa6YalfolG4tzn0fnv1WGo+g/ryU04r3lKE2bz97Z22rdEX5y013g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxdXWOUldEX4FP1+XgEJINMC+fG5SUWlKAvxtWYuYn8FmnN3li
	677VzirHvqDWyO8wrPvJvAapJcQrQtWEdog45XD1a+UuJ4wEaT5sE3vg
X-Gm-Gg: ASbGncsEbU0MBh2sOr0bLz4vdoX+LYj2ISgMnHWQIji2m/s1n9Al/LavGx3M6su/aya
	QLTJdCUKQ9laRqR6Vnx+SH/1EA/oB8L9WYcdbsXR3GkB8fIlyTW1fPieELuUgumk+6+Bml2zniK
	g09rhVelum2gZP34aQvku7fY/YXihTinO7ZN4SdmbzzxQe16P/h91/orFTnmf1+gbelGKhk+uif
	XUgFiXqDBAN/Qf46ebCzUTFPoL2qRETbsI8Pk5+NnSMfGvffjdRUpGWxw41OiA7QP6vMQioEkcA
	l7yJLamHX3EMPnC7flI2gh7Ko+C2Y4Aak9YvgoMsbfgPWdMtTYI9S5v0ao6GFSCuOa/DK0WyCtZ
	91JmIiCu7O0mKWfWbjkOLtnYR69rT8VMKBESkIT3kRyVo4DKNoEdoJlOyiOTWmQbEfTNKN3Ktjj
	Ua0iYbO7fB8RsquIBARnOA2q1DaYDbxiYMWZhT7RMn6KY=
X-Google-Smtp-Source: AGHT+IHnUqWbN87MfdnfCGZe3Siga0PrKlesE1NEYJJvVLUvhC1pGxgwxVLeIsjtogtg1QbMwZPCCg==
X-Received: by 2002:a17:90b:2709:b0:340:be4d:8980 with SMTP id 98e67ed59e1d1-3436cb89ab8mr12431413a91.14.1762847023674;
        Mon, 10 Nov 2025 23:43:43 -0800 (PST)
Received: from lugathe ([2804:13c:46ac:1000:f491:d00a:e2fb:e67c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3434c31d86esm13779436a91.8.2025.11.10.23.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 23:43:43 -0800 (PST)
From: =?UTF-8?q?Rodrigo=20Lugathe=20da=20Concei=C3=A7=C3=A3o=20Alves?= <lugathe2@gmail.com>
To: linuxhid@cosmicgizmosystems.com
Cc: bentiss@kernel.org,
	dmitry.torokhov@gmail.com,
	jikos@kernel.org,
	linux-input@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linuxsound@cosmicgizmosystems.com,
	lugathe2@gmail.com,
	michal.pecio@gmail.com,
	stern@rowland.harvard.edu
Subject: [PATCH] The Edifier QR30 USB speaker, identified as: Jieli Technology EDIFIER Hal0 2.0 SE 2d99:a101, reports a HID interface that needs HID_QUIRK_ALWAYS_POLL to ensure it does not crash when changing the RGB brightness with the physical knob.
Date: Tue, 11 Nov 2025 04:42:05 -0300
Message-ID: <20251111074205.1533558-1-lugathe2@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <c6d506f7-f13b-4d57-a522-a2ccd09e7a1f@cosmicgizmosystems.com>
References: <c6d506f7-f13b-4d57-a522-a2ccd09e7a1f@cosmicgizmosystems.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a new vendor and product ID entry in hid-ids.h and register
the corresponding device in hid-quirks.c with the required quirk.

Signed-off-by: Rodrigo Lugathe da Conceição Alves <lugathe2@gmail.com>
---
 drivers/hid/hid-ids.h    | 3 +++
 drivers/hid/hid-quirks.c | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 0723b4b1c9ec..ece1bea0faa5 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -734,6 +734,9 @@
 #define USB_VENDOR_ID_JESS2		0x0f30
 #define USB_DEVICE_ID_JESS2_COLOR_RUMBLE_PAD 0x0111
 
+#define USB_VENDOR_ID_JIELI_TECHNOLOGY		0x2d99
+#define USB_DEVICE_ID_EDIFIER_QR30	0xa101	/* EDIFIER Hal0 2.0 SE */
+
 #define USB_VENDOR_ID_KBGEAR		0x084e
 #define USB_DEVICE_ID_KBGEAR_JAMSTUDIO	0x1001
 
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index bcd4bccf1a7c..d104f4829d93 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -110,6 +110,7 @@ static const struct hid_device_id hid_quirks[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_HP, USB_PRODUCT_ID_HP_PIXART_OEM_USB_OPTICAL_MOUSE_1f4a), HID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_IDEACOM, USB_DEVICE_ID_IDEACOM_IDC6680), HID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_INNOMEDIA, USB_DEVICE_ID_INNEX_GENESIS_ATARI), HID_QUIRK_MULTI_INPUT },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_JIELI_TECHNOLOGY, USB_DEVICE_ID_EDIFIER_QR30), HID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE, USB_DEVICE_ID_PIXART_USB_OPTICAL_MOUSE_ID2), HID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE, USB_DEVICE_ID_KYE_EASYPEN_M406), HID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE, USB_DEVICE_ID_KYE_EASYPEN_M506), HID_QUIRK_MULTI_INPUT },
-- 
2.51.2

