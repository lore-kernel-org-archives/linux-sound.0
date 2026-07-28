Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57EF64483A1
	for <linux-sound@vger.kernel.org>; Tue, 28 Jul 2026 14:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785247444; cv=none; b=Vdyu5HPcPl1n5va8yhm/5oXDk+5wtLAI0GD+LSDH3Vu/I9vS+D13mubvH4EXdQqaxE+pHbX7Zb3bW4aM+W5K9n0Cmtb0HBlir8dGLzoKA3HDQPFyx6u8WWDy0UZILg3PpIQtRo1oHafwkK5uM2hBG0SSvDn39JRgSLmeG4E77is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785247444; c=relaxed/simple;
	bh=NA5NXbY3siw7i/UH+cMLKmK2yNWPous/UUTYCs9PG3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OQ7VY5rknSBMsiDZav7H5+L36sAbU/bi/wYYwMN7Eg6kas1eSUmEeNu47Sn8yUxUEOTftzARzP2fjdeWrvNAhDIwxdgiMSEOx8HJldkN2PL56zXZam7dUwpuS1PYiFABHhYX7k0r6VD2GyhCI18OvH3ezB1lDeYq/TGjIFxoe7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HDTBkHOt; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HDTBkHOt"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c1f7666a90bso88835166b.3
        for <linux-sound@vger.kernel.org>; Tue, 28 Jul 2026 07:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785247441; x=1785852241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PobPjNTNwzrZWoFQ1BEg9UORfn+Hk1hO5/CYuza5enw=;
        b=HDTBkHOtsp1azYUPKa2bW58ud9kVMSc3kE3EnL9YhS79o0GYqSP6he5UrE6JgokpNb
         /ssC4LzfNEfhOYkFBxqJwlF9nX30ZS5JwuEATTjd88NyDbh7M4RZJhtsiR/i7lNLX4NO
         365+TtJf5UEipmMhP+Y4KjvpdHr8dqMRE8KcnbKlzFDdbbL1T+Sq4PwEImcHnNCLK1QO
         fypUEDRq7k39girGm0AwxpVIplYJ4mSPLiAgPvz5Mgck1DGIkBP0lX/0pLVtHh9p+sjf
         EjM+TrmA5sFrUB09Kj/mzNNgR1ql//xONRbsic+itLbzX9KkhAouzFziak7MIjz+ssQ1
         mrNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785247441; x=1785852241;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PobPjNTNwzrZWoFQ1BEg9UORfn+Hk1hO5/CYuza5enw=;
        b=EeQ5nhzwTsHtppA3AQ0J/1bQQ25ha5/CxA+bF65OO/RUvmKfqoEwX/o9RaT8A0maHq
         J+oLIJw2diNzo7Mr9Q0dTSAXMRTLAnx5Z8rmpS84cjIPYWsBpX/JPSLTEMDvvgiyxgos
         Z2WUYF+ZaCPU4RYDTV2ef4TJ+S0uEhPs33FzTUb1lElmZrwyU1QlkoYJOyvjH630De1h
         ko7of0C3PMSeBL5raPVekTVN7MUPT3p0mmccSMAo3/i1OzYmXeWOCCBINL+2K5KfaYWr
         cghw3vysz2GVpUnZEV6kNBub1O/p3v27QsEaBY2BvlKz0ByR8b57vcYVczAtIk+BEWVi
         j7zA==
X-Gm-Message-State: AOJu0YwNfyzqQ7IeqVcdDIynza71twhu8uiv/PRiT6gHzs7zDdfl6hbg
	IDQ2sI60xc/2odCc4tdsrRz+iC95euq1R+KKByBd3joOeaITnC58MhDWVZeijA==
X-Gm-Gg: AR+sD10z23PNyUyB8kg2w0gu3/OahlS51SWp9xBEHkg6eYxpAOSdluaN2TzUM6rdT/E
	YZjo9QIeVnadH7t7hzSXpWMxQ1KBlcr+NR28hBA68FpuxToyS12cwqVGTSHx/isBmXDb2+CSlA/
	wSb9jyaIiamjKSmTGwIWA3MTvZ0lybNpHYZpWkEndVWZqsCunZurxahpwSnq51sLV1SaOmgx4pf
	99FDUwbrB4UXbGXInGXQLrQQW2KbGwgfMAGmPAI2ru7iPN+HLzl1Tra8AY9yZAr0SM5vLOodzev
	On+n8FhHtJGmYBqb7r86vxYktv1FUc1OGxqRPwgA0r0wN6OXuQobDGeEnYo11AM2qC7noneIYqI
	IO6dKYVNU8Aedzej7bQXLEDrGiu3zudGplAIDIyathO0EMSFjMUKhtyG7aiBUja+z7q+jTdSBZC
	Je5Ouh
X-Received: by 2002:a17:907:c08d:b0:c1f:59e3:5147 with SMTP id a640c23a62f3a-c1f7246bf2dmr122817466b.45.1785247441145;
        Tue, 28 Jul 2026 07:04:01 -0700 (PDT)
Received: from fedora ([41.123.113.32])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ac936dsm798908866b.22.2026.07.28.07.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 07:04:00 -0700 (PDT)
From: Robert Abrahamse <denobyte2@gmail.com>
To: linux-sound@vger.kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	Robert Abrahamse <denobyte2@gmail.com>
Subject: [PATCH] ALSA: usb-audio: Add quirk for Corsair Virtuoso (later revision)
Date: Tue, 28 Jul 2026 16:03:14 +0200
Message-ID: <20260728140314.11601-1-denobyte2@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add USB mixer mapping quirk for later revisions of the Corsair Virtuoso
headset with USB IDs 0x1b1c:0x0a43 (wired) and 0x1b1c:0x0a44
(wireless). These devices exhibit the same mixer label collision as
earlier Virtuoso variants: all controls are labelled "Headset", causing
applications like PulseAudio to move the sidetone control instead of
the main playback volume.

Signed-off-by: Robert Abrahamse <denobyte2@gmail.com>
---
 sound/usb/mixer_maps.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/usb/mixer_maps.c b/sound/usb/mixer_maps.c
index faac7df1fbcf..200b4840b7e5 100644
--- a/sound/usb/mixer_maps.c
+++ b/sound/usb/mixer_maps.c
@@ -628,6 +628,16 @@ static const struct usbmix_ctl_map usbmix_ctl_maps[] = {
 		.id = USB_ID(0x1b1c, 0x0a42),
 		.map = corsair_virtuoso_map,
 	},
+	{
+		/* Corsair Virtuoso (wired mode, later revision) */
+		.id = USB_ID(0x1b1c, 0x0a43),
+		.map = corsair_virtuoso_map,
+	},
+	{
+		/* Corsair Virtuoso (wireless mode, later revision) */
+		.id = USB_ID(0x1b1c, 0x0a44),
+		.map = corsair_virtuoso_map,
+	},
 	{
 		/* Corsair HS80 RGB Wireless (wired mode) */
 		.id = USB_ID(0x1b1c, 0x0a6a),
-- 
2.55.0

