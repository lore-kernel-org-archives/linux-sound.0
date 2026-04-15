Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966BC3B5318
	for <linux-sound@vger.kernel.org>; Wed, 15 Apr 2026 13:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776260046; cv=pass; b=CYImhll3YcDejcXFmcfnBwTQttLeMiT8iy4sFoI5FccB90S4HmSS+zlKOigE0V2kchjzvirwrgfErWY4yuwEzNkP1tHCE2ghrGc4w1twZv5a/cbwi7Lkm8He/8n8bVEYI1+a+jSFesM2h9naDb4PXI+l4q79R0FXsmWzJvC0jP0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776260046; c=relaxed/simple;
	bh=CRe1pOyBNU0w2vW+hGrY69z9fniveUauJrN3jxfcVTc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=TFfGFyaNS5/o+qerFAia1ru+SLdMTsXoPvwnewBBfzUZWIbEAAZvPHI5qckIFXiq6SPdwyQ9mytI2u8CjJUK1vHdQTBCzNhI9/UH1TLtXjiAn1D4XRDLdKmyC4PCWAzp3dtfqDnGeKnj8HBAiuOBG7tc/FB7lxC3McKB9kK+DQs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=chduQM0I; arc=pass smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="chduQM0I"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38e8292423fso25802261fa.0
        for <linux-sound@vger.kernel.org>; Wed, 15 Apr 2026 06:34:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776260042; cv=none;
        d=google.com; s=arc-20240605;
        b=eabD0+KYNwRys+TRSW77CKw4+FRVbk9twhQYYjzYs1sEXvBq+HUNM09pBHuaqRYDta
         0jDpeNRElDV5HZ0OE7ieaqOQisETUxelWbGLEyT9Yqz2ctjIZwjSlwQbXVouKJq0MT7a
         xyhieKYE43Tt+fxAIzjCfQuitlefP/3d4HzQOytEzW6/Z6Y4dsSGA8Jp12x4ozAhN9kx
         A6QJ5P+0may2eL/IK2M5ZiDnv3sXhmeR5mg4E2fuuJath4XEi5x3jfnkRMFwQRmgOGXB
         OmIktgqVn1gSOeMmRARz9urAZgGTWqajbfxjriXlnIyl0U5x+3bFAZbrzGcoKTih8Zpg
         W7Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=tChFfORfQP0f2qkiGIIB5OwwM3WfTf2mRkHeaSRwwSQ=;
        fh=aAjySkCCJ0w505SsLN5frkjdB4MN2noKaJ5lPmOKroY=;
        b=S9ytMPZxiD/rhnMESu0HfBZ5+SrBvUHovpANXGY6TZXcUobOi8VY4K9J+GUbmHChlG
         tpq4G59irJw1wcf9tG5OBtKH3SXun3a4n6gq7tDyNGiNFEY7aUbZ7BfBNbTdyJXcN1n3
         x7VXJX7nWS0bAVBRm16HsAqPcCzLA5erWOlFSCKecSZIqmXa+zqMT4y5z6dvPbf4sw5k
         r8dBCwI1GUbDHfFU178cQbKeKI5BI1aCa8mGMQzRE8UESUpcq2W6hf/f7ycDWAIW5PMr
         AtbE98IYi8PJYoy6zkj/GLRPbsc33A4Ou9eXoVFejWa93Dkb6tIxEC6A0FDlVy8COYcK
         M9iA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776260042; x=1776864842; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tChFfORfQP0f2qkiGIIB5OwwM3WfTf2mRkHeaSRwwSQ=;
        b=chduQM0IPTL2cMr1+7dslZT/id2Wps5ylqQCGbbgvFvzWuzcQqH6/+XS5KX6NIn8fA
         M4DPGAgwh4Ob/1p9ZR1Ea/wSrHa1EuA7jaaK6n4C5PIw5bBblUThTLs3BIfhEOvy/LKL
         XEn+kBAEhcLANpwg00hFLsog+ABooc4vamrwGiOeltXj7viQCb27wThJs+EM26mmQ97N
         6+EyN/GLxqL6+GBTmLc+CBn3A17diCRQDWG2YIcqTGc5gK6nk6T0nY4SYS1kVF9IMXMs
         Q/ISRVDApmR6pgBLK15yQPi4EkesM5GqYZAfIgALAeJwG09lw1k1bO8xCcfaamZwnHZ6
         PpUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776260042; x=1776864842;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tChFfORfQP0f2qkiGIIB5OwwM3WfTf2mRkHeaSRwwSQ=;
        b=FcCKbtJksyHPzS9cI7C57c6w7uCh0Ihh78nn/5/Of1CX5b6nAFc+gGbH0cHciZ6F1D
         SUwJvI0wyteR6YMFInpc93e1Nk7gdmHlkkyYG9rEWvsMqP2i7LMB1E6djMQSNv7OTQYy
         fRUAlnuCpTEkXx9vmTfmV2drcEVX6g3tX6ZQxcOxs+5TlW4CD/aqqvCDOnyQ+qqOeZYy
         J1BD2+vpKjLoScLFAY9jfmJwE3O8RX9oETLHHYevdgyxvKYz6uFRr/ZDJe5YQ/LchN5v
         VQzLY5yklYGKVwP3oqkGgjMj2MDiwtjuGyVDF0ole5zTZhIvs0W1BQF276kwxaFysvav
         grUw==
X-Gm-Message-State: AOJu0YxccfLKrUtWJ16Pt5fgQCs+6uxdOclQXkhOpGK3tsf9fNkojA/T
	8YP9UGsDkj+yfwIzAGqemj3RErlMVK3McwHlxFLjsgN2pclepEaBfFNb8fwH7KmNnA/VU82tqYR
	UN5j/NzhXS8NupEXycTec5XT4mA7p3WzmoxbESkk=
X-Gm-Gg: AeBDieuvL7vDkPQ7HU5eEBbj29WHwiQqlx94SMK+42wk8SG8SnSXyvD54dRoc+zZDYL
	XRS+jyoGI576kgjd1YDKDHWrHXppg63rVXOfrNrHh7utdUNfj8magP1TZW7vlBKVlBTjcoUIT1j
	3opp17rCEw93Q/lwQqLwAKols5TVhW5QbhFolEJMvPfOz0e1Zzm+Oc9CENXQ7RFtboQomWIPyhP
	8Bq3tPeXjRj3eQr1Fp8lNbkoU7LDxhOSZthtN0sOznEgB7WA+UewRhb+dlIYx2uJVcv3GRIi9KZ
	TCVZzGvUr45qRiDzwfgY09ADbVSgsHwy79nsuaG06+BsR5RV/L5g
X-Received: by 2002:a05:6512:3a88:b0:5a3:e7df:2396 with SMTP id
 2adb3069b0e04-5a3efb41ab8mr7927783e87.13.1776260041872; Wed, 15 Apr 2026
 06:34:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Juan Pablo Fuentealba <jpfuentealbabizama@gmail.com>
Date: Wed, 15 Apr 2026 09:33:49 -0400
X-Gm-Features: AQROBzDpDIPTGacixyswCI1JEg0z7ewuxMS9fgUzPzaEA5cl7_mWBdVT7u_TOkU
Message-ID: <CALB_=sh1ONfaueYQ_rzMbzz9xXGTSQaA_km8qEiUfhgLLCq2Qw@mail.gmail.com>
Subject: [PATCH] ALSA: usb-audio: Add quirk for SmartlinkTechnology M01
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de
Content-Type: text/plain; charset="UTF-8"

From 7a57eecb5a332da652a0bb3c006fb4ce5316fa17 Mon Sep 17 00:00:00 2001
From: Juan Pablo Fuentealba Bizama <jpfuentealbabizama@gmail.com>
Date: Wed, 15 Apr 2026 09:16:47 -0400
Subject: [PATCH] ALSA: usb-audio: Add quirk for SmartlinkTechnology M01

Add quirk entry for SmartlinkTechnology M01 USB microphone
to enable the standard mixer interface.

Signed-off-by: Juan Pablo Fuentealba Bizama <jpfuentealbabizama@gmail.com>
---
 sound/usb/quirks-table.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index 803e03d4d77b..9edfafb7d274 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -3772,6 +3772,21 @@ YAMAHA_DEVICE(0x7010, "UB99"),
                }
        }
 },
+{
+       /*
+        * SmartlinkTechnology M01
+        * USB audio device that needs standard mixer quirk
+        */
+       USB_DEVICE(0x301a, 0x159b),
+       QUIRK_DRIVER_INFO {
+               .vendor_name = "SmartlinkTechnology",
+               .product_name = "M01",
+               QUIRK_DATA_COMPOSITE {
+                       QUIRK_DATA_STANDARD_MIXER(QUIRK_ANY_INTERFACE),
+                       QUIRK_COMPOSITE_END
+               }
+       }
+},
 #define QUIRK_RME_DIGIFACE(pid) \
 { \
        /* Only claim interface 0 */ \
-- 
2.53.0

-- 
Saluda Atte.
Juan Pablo Fuentealba
jpfuentealbabizama@gmail.com
