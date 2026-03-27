Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F8538757D
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 12:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774613029; cv=none; b=iHDrhOJJWLINziPIreowlqEn3pUDcN1M16ARqSFJnZhO9h5onTInkBnYGO3b7TYFnCwwYorNrfH3Nc1peHUa+5qvSbydjuXjaRoJL72cXcHLgmUSLmh565OzZHsM+56W1LLRLZ1NOXas1r00+X+ZNXNOphYqiWQB5uwlhZuUo6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774613029; c=relaxed/simple;
	bh=CkHDELe4J50i8dXIKMiT+Z+kOVrRvo46dLALSgDFRVc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OQFy3n6uKEy4FZe3OgOhYeNDcB+w8Mpx8cVYhawHAWVdmPVCBNHLPA4f7bLo5VmOl83sTkyaw/x5yI01TMoAWgjLHxyN42lbG/yxZ5eol6aFg1sfxlJ887OQY/UqX4GhZv/PLYBE2Zazdb3y/sXLAu/MBcoFrZWYeh2GV1wk4R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IJ9ABmnv; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IJ9ABmnv"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2adff872068so8425005ad.1
        for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 05:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774613026; x=1775217826; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9mHVhf8Q6uq8fezIA7XyRNQMSU52ljWmuoh597f5xe8=;
        b=IJ9ABmnv8ZQrcgzScItvRa3FVd4DyBa33ruXy9LlTuXs7rMkfSx5FFITEFF4/8cufQ
         mze//TUm00tadzUGkbno/3mkgOlBMMML4ULcP7psAwqVO47HBG8AvMveJlNemI7dr8oa
         dlt097E52eM5T/+oDCkzKdJdHXpBYGjgl5JgqJxyzyg5dj89RQeSgHHhjBkUfREYjXfs
         xvkaX/XgpqrezwWGs6q0GnhXWlEhcmO1fJNmDnY2qEvvTDZRjzZh8c7TxBaoEaBG4wNk
         Eq5feXsDl6hK1O5Ff6vapkHghV87pYVWy9vWcgMW+R9KbUw++1g5TLcPnnqWstBhp9bQ
         TAag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774613026; x=1775217826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9mHVhf8Q6uq8fezIA7XyRNQMSU52ljWmuoh597f5xe8=;
        b=SSoyB6zLrBZQ9F1jh2XrVeGFHSABqMDsU32DdWJHk0RKfwXj71DFd4PxAMA08Onmbx
         dmbax5Jqep0X5DAOs8GfuNAq4v3mhkr16xaXgQQ/2SejYujGYOajgk3ttUFl/6WRPqMP
         vebRwXTwJaV9maCTeuc6nPTC1woziTIk9FxFOC2pvFw50opsNNPiY5iABEaxLQTakdXw
         xkFM9ShI8nBcUjwEOIGc+93ZVd/59k1cco5tgLx51vL5EZRr53GFHMMtqnBC7uIV0wwN
         zPW67Sbgew9bXgZsPzIlOL18waIW2RZwBoJbHFGgJyNRdK0m7qR6S9jF9hSMQbRBrgmu
         inNw==
X-Gm-Message-State: AOJu0YxRQmEvB171J60Rk6Rcb2RfdMnIefwDSD6KZVpdDl6b/LZpzTyE
	RTUY3HZO9ZY4ujQXzKqLoGTc5Njlqmzwscu0h6C4xbpzhHJMDec31cyn
X-Gm-Gg: ATEYQzwNwKZt0IO7w19NtEKyXT7CQIjOIksbwX6nXt6PwL3/8ofMiFueIwAxul4uhHJ
	8MdNzpRtYHYoFG9F1JpYE54S+u9qxOK9RP03KAZmnM6oYQQhx0f5k+jT4momJAEYXfmROIM+Oce
	9KMLgsSm90BcLMEkclJNYnHCdCNUrpjpMpZoL9CzBSj/XDks118MclE91pgM1+MBVn7kzm02nnd
	PR96UpmN1vpqQvLKu2LpT33BXJr4zNPJpqS7+F1l9X/VGUcY+KqaNU88sfpwtEaEe0IgFhaWpEF
	7GFPCtssRwoMcBEn4xKJolQRN3RkIyhQp/qpBiLnPad98nTv4QL3od6m76Kge8FUlaGfpVvScDU
	K3zsO1mhLp5GSkyMaephO4TTOWjMcyKINL7qbJUcMV4aiSYh7rVXhHdBvNQk9LuzMhwAmXDgqOx
	nlW41deqLcvBU1TN6jrjP9K4zhivxTOw0IShRgCe/yoTs=
X-Received: by 2002:a17:903:988:b0:2ae:4445:f39a with SMTP id d9443c01a7336-2b0cdbf7367mr23642195ad.7.1774613026220;
        Fri, 27 Mar 2026 05:03:46 -0700 (PDT)
Received: from localhost.localdomain ([2409:40e2:15f:f2b5:1d1:fbe1:fe33:137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc8f3b98sm55003615ad.70.2026.03.27.05.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 05:03:45 -0700 (PDT)
From: Sourav Nayak <nonameblank007@gmail.com>
To: tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	nonameblank007@gmail.com,
	stable@vger.kernel.org,
	tiwai@suse.com
Subject: [PATCH 1/1] ALSA: hda/realtek: add quirk for HP Victus 15-fb0xxx
Date: Fri, 27 Mar 2026 17:31:49 +0530
Message-ID: <20260327120149.18076-1-nonameblank007@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <877bqxsin3.wl-tiwai@suse.de>
References: <877bqxsin3.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: NonameBlank007 <nonameblank007@gmail.com>

This adds a mute led quirck for HP Victus 15-fb0xxx (103c:8a3d) model

- As it used 0x8(full bright)/0x7f(little dim) for mute led on and other values as 0ff (0x0, 0x4, ...)

- So, use ALC245_FIXUP_HP_MUTE_LED_V2_COEFBIT insted for safer approach

Cc: <stable@vger.kernel.org>
Signed-off-by: Sourav Nayak <nonameblank007@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index ab4b22fcb..7f3e88999 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -6954,6 +6954,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8a30, "HP Envy 17", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8a31, "HP Envy 15", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8a34, "HP Pavilion x360 2-in-1 Laptop 14-ek0xxx", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
+	SND_PCI_QUIRK(0x103c, 0x8a3d, "HP Victus 15-fb0xxx (MB 8A3D)", ALC245_FIXUP_HP_MUTE_LED_V2_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8a4f, "HP Victus 15-fa0xxx (MB 8A4F)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8a6e, "HP EDNA 360", ALC287_FIXUP_CS35L41_I2C_4),
 	SND_PCI_QUIRK(0x103c, 0x8a74, "HP ProBook 440 G8 Notebook PC", ALC236_FIXUP_HP_GPIO_LED),
-- 
2.53.0

