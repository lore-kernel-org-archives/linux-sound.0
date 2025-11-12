Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B470A289E13
	for <linux-sound@vger.kernel.org>; Wed, 12 Nov 2025 01:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762912463; cv=none; b=UNTWKHzBVWlidxvod/NpRUdKiG7PznWM7tel7C1pEvdKlJTcMJVHA0GzqgukOl4EPKGiSwoRA6VUSTlHy6Ga0ywMPS2UMu93e1w9Mf+IfM1LoDj0NXDGJn9uD+vDo4ddEHyWjA+EslITKwToK/2jN3uzyNiq7Jsx8a1EqjuE1Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762912463; c=relaxed/simple;
	bh=V+NLqMYPtbXGUxK8gaZ/4ZH91OoRNhD7Ixnn+V2Fgf0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q4SN5NZqFbyk+re6xGOZ+ApzRzCAC5NOmIRZiHOiGTNksrhWCv/NQkdr1ZAxPEnGUIcdmM6aMpoRL/oZG+ga2jhVftD9MUSiE/FOHZnNJmang+nga3gr+cXHkLjSuZo41WSP4Nxn1FoNuuSLxa4jXMtmcDnMOw+ReVX3dC26D8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rct3LXnn; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rct3LXnn"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-297d4a56f97so2891885ad.1
        for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 17:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762912461; x=1763517261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rAa0jaAUx7OJIZvkSAwlza4QkLZm6Uf91ra/ugzjRqY=;
        b=Rct3LXnnY0+be+blUrxiVerK8hJQWRuRzsIY98LmSKSHBPzOSQQDl9cdym54PGoe4H
         HwvzdUf5O0n0JQjxgZUPb6xIs3A0MSki0ceiZ3eIRa5yzslMSY3wDbDaVgyUBsdKKveQ
         wcMoAsISvn2ABmTAg32DE4UINqv5qnY4XvEZ2i5DFBzAjWAatlm5Jxi5OHY6w/EwI6G8
         PT25g+9+l0ameZp2qChUgD76bIzwKB06dZP+ACLta+GEFsjjtMBEGBpbCuIkPdQKMgdA
         VPOe/bUZJtMVfc5G1ZUn4e/HszyeNW8PFhJsthMeHgvQLbLEQJdutu+gKCVozL+A0YX8
         IMqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762912461; x=1763517261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rAa0jaAUx7OJIZvkSAwlza4QkLZm6Uf91ra/ugzjRqY=;
        b=AI6+FZRIs+wUSZeBy3WwP7ERKPIh7CCI9d/ExK0E5hTMIACRUFqAeBqnQ+/MyUPtY7
         9ucvx61xE/WX/M+Cpyaf0jdzL+Wbx3Z2Nu3Q/grGoqVPkFaO2pvDKVYNgB5DU+Lj3Mno
         SiwpgYhWr5XNl2o2DhzkZ8Pz1uIan+sxHajzHeD9jmiuan2ewptYW+w4LGRNxeVyvnpc
         3zVMo7xAxLKeyn4B1hVPGa257hvIsOvc2m/vfHct1FARnsilgKR1aIMBKa3r+3ai7zwO
         d6QN55UFdViaFDMpOZsYWQjY312Oc+FcvvTECv7t5VpbyckjAh6lxjmnVVJsi2mHznop
         Aemg==
X-Forwarded-Encrypted: i=1; AJvYcCUu+3Amh7ZcxEZveSO+0rY4eCIdwYpIbcDHUXtzeLjTh9BXkkdIROcftLCch5IbIRasOLKD3onnyBbwdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZhr6je3+QHvMFgy/68uOy2II0F1etB3KxcYTW1/N4Ks/Bp1LX
	fFR5h5VydvECCoJneisOxRDJ5eu/G7ZogTqpVP1UPHWA+pbInN+1EDVb
X-Gm-Gg: ASbGncvz+xWDhuuiIGvOi5cFNPYixBulMLpSfdCwzdWbFTyfBnsZ0GpHzzUZ5ZCYGbo
	yoWiwRfi1CBDFGUQrkPeBuepdlmc9txTTqbUWo0BbqxQ4B9HKR2UxWnbwI5cPhtuhuiJBXI2qc7
	jsHDJzci9WrjO9CeNak7QZkgheHUa8qh4eQnx4e/31luibJ8gbFw8Uma5OQbQa3zX3/Lg/X+MBd
	REC7Efma4xXEVCyIpVrtwsnfMDf66BV3WL3HR5kyoKQxUNmbg3ey0WJcATXaHEwwZahwmf6LB8o
	5AMm1WGzZfnpIZy49v/SW5Rf02km4UmLwRupIOoure5FfB709Zf/a3Nn0s/FynGzxjnfglGF4cy
	khBCnJIT2cSnKEUTT1/bgHuVhgdx7ZxsS/fJs6BTlPepW471IXfSaGfTq+KPUgUTTjiA5dnZ+IB
	tVoSw5Vh09sJWqC8rjbX6tbqbqweJMUriG+Hzu6LAwVQE=
X-Google-Smtp-Source: AGHT+IFZt9kcYAzpd3HLic3Y5F+9yHyu+euFnDG9WwszKanIAdJLYfUAuWLotX0l9/nM4ymC5UH6MQ==
X-Received: by 2002:a17:902:e546:b0:295:1277:7920 with SMTP id d9443c01a7336-2984edac559mr16453895ad.28.1762912460905;
        Tue, 11 Nov 2025 17:54:20 -0800 (PST)
Received: from lugathe ([2804:13c:46ac:1000:f491:d00a:e2fb:e67c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dc9f8f1sm10886435ad.54.2025.11.11.17.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 17:54:20 -0800 (PST)
From: =?UTF-8?q?Rodrigo=20Lugathe=20da=20Concei=C3=A7=C3=A3o=20Alves?= <lugathe2@gmail.com>
To: michal.pecio@gmail.com
Cc: bentiss@kernel.org,
	dmitry.torokhov@gmail.com,
	jikos@kernel.org,
	linux-input@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linuxhid@cosmicgizmosystems.com,
	linuxsound@cosmicgizmosystems.com,
	lugathe2@gmail.com,
	stern@rowland.harvard.edu
Subject: [PATCH v2] Apply the quirk HID_QUIRK_ALWAYS_POLL to the Edifier QR30 (2d99:a101).
Date: Tue, 11 Nov 2025 22:53:56 -0300
Message-ID: <20251112015356.1919586-1-lugathe2@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251111203350.3c9a669e.michal.pecio@gmail.com>
References: <20251111203350.3c9a669e.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The USB speaker has a bug that causes it to reboot when changing the
brightness using the physical knob.

Add a new vendor and product ID entry in hid-ids.h, and register
the corresponding device in hid-quirks.c with the required quirk.

---
v2:
 - Fixed title
 - Simplified commit message

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

