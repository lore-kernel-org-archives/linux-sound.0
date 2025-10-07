Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501351922F6
	for <linux-sound@vger.kernel.org>; Tue,  7 Oct 2025 12:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759838566; cv=none; b=bHu/bzmPPomYFFqxp65AZNO0Xgn7Hp16gQHcx0ou0Qk+89s2PKnP85sUXdF/6y7Ccu58endhgTrwJJQaOlOrzc3pt/CJEw8QjGyKg8LPn3B/XFBZPqSk+BnYJpDqdF3QJQIWB8IdVDO8Sora61WFNUJ/jedMs1Q+v1HqzRJ0uF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759838566; c=relaxed/simple;
	bh=Uwp3nwYdT5m3y+GC1rhzb2llx5N1PSDN35+YggAT3wU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=be+AVoraIsjS1drdivfPgV+o/OasNnqK/vGDKptXsmG9QGLToNU+zibxBp8fYKf8e5du+SWphTlS5CWIoHjGVYOo4zbPhipV3tLs3qMsMIaaiT+FjR5+E+lOhW6WrjTjiERhcIpETHVKKmTFvnXuPnUZXkQC3ABON+ukXec0YMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jWkV1kks; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jWkV1kks"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-27c369f8986so60616605ad.3
        for <linux-sound@vger.kernel.org>; Tue, 07 Oct 2025 05:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759838564; x=1760443364; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JgNr+tNHQ+i3V3EeAoz19ucV8GtWzNyxdtEJ6ZWd2ac=;
        b=jWkV1kksfGeHm99Z9icR7b9wxeAxETa2pYlIBFW1g4GgGu/uGHikJKBHhLTUdZHkuy
         0qI/DBQ5I/emuAw05ft0OrE9FG60tCPFyaQtSXW+rWgxETRw9p6TmLJZ+jmIrtjyERJG
         UM0F6hio/uLNm7+5PljO8aKBdhcIsGm9FgULUfi2P+8G+x4x5S35kXqou1nT7nYmQQtc
         IDNROkmIfOz4BKrgWYXx18e4NhKOtouTPycwXf819pK1h64e+t/rUnVbjcj0vDgyzJuA
         CzY0+Q6H3NseKvwaP1KOGNKi6c99CYTgBoXMTgjYSf3rmkmn/4TV594FfN1QqzTMNTCB
         7CEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759838564; x=1760443364;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JgNr+tNHQ+i3V3EeAoz19ucV8GtWzNyxdtEJ6ZWd2ac=;
        b=X2BIcbbtbUWZyjtREk0PYFxRnXU1vmKJ0Qxv3D2BII7BDOMJVPFgNF0RqKI6p8tb/M
         kXJfmZVWZDJQTB2PnhmF3McuvCj1CYCQ9Hyc4vWvhO3hZ+uSsbpfNj0/DckX0LffZm5Y
         uio3/S+/QKfR+h6V9zQbJj0tWqU7LKmbO53cv3iccvsfLm3N1VPAAzDXFkw/dzih02OG
         hyQNoQNRO5UbhqpdTMbKExY6lNyS9z6pyfkGIQ1Hkf1pdryZTMKB3x+QS/DsDH8W/Poz
         LyR2T/8F5E00wJnAUK2X9Ffr5qsVE0holmp+z4vI+5BhUsFmX2jkFPaPRBOcKIkOW6Sd
         dxxg==
X-Gm-Message-State: AOJu0YwA8QsrZ5O0KnlwkYo4egmcatngiXrAFsj5XRc0zfWid2myCvZy
	dRdk0B9vrzAPDj06ObEOcP1DWdO7vlft5APCTq+SIA14BcjKjHJd2Wrw
X-Gm-Gg: ASbGncuE5e+ytr+6xl1iw1xuAYEHtz1vfQmlJHire7q8xTR1XeScixrQ4dSuChRJ8Vm
	pia8k+hA5iiaxhLukTnq5xsLXtVuklD7OpyhySJ8KDhexN5/XdprmhPlDj8T0Amx0FEjghd6Zoo
	8si4bhxG0EjEx2NXCw2ovCxcZG0hjwnPmrXkxzrg+Ajom5NYqN+B+mBDyM33IKbnxWKVqMHxpIm
	WLeJycJIRO9caSslvtdfiGZzxIbMUznmwAczl2bApQcsgQn9GETWZv2cbEF99mCTgmJoaFl8/7O
	kTnfJEid0Bpyb61ghGAp4CUQmUGU3Bh2l1vWKwUUzUg4SrVwneQOcDLieXKp156lIRg1WWq/ApI
	hpxrKvcXY3oCnlKIolNT9SCqb0Y9CZOKsCn5v45XfD3qwUnOYML/dyHqTuqv9J4+NIRXCicOOy5
	di4V1m9ABwKA==
X-Google-Smtp-Source: AGHT+IEH0lwuWZr6GCDo27FSqSdbMpk6OfccoJ01s3tCPMDu0jm17zp/Dvn0v63vGajLxGA+vGAGDw==
X-Received: by 2002:a17:902:f792:b0:28d:1939:f9c8 with SMTP id d9443c01a7336-28e9a5bf4c4mr200401165ad.26.1759838563859;
        Tue, 07 Oct 2025 05:02:43 -0700 (PDT)
Received: from weg-ThinkPad-P16v-Gen-2.. ([2804:30c:166c:ce00:71cf:b339:3993:4f8a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339a701c061sm19510269a91.22.2025.10.07.05.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 05:02:43 -0700 (PDT)
From: Pedro Demarchi Gomes <pedrodemargomes@gmail.com>
To: "Geoffrey D . Bennett" <g@b4.vu>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pedro Demarchi Gomes <pedrodemargomes@gmail.com>
Subject: [PATCH] ALSA: usb: fpc: replace kmalloc_array followed by copy_from_user with memdup_array_user
Date: Tue,  7 Oct 2025 09:00:57 -0300
Message-ID: <20251007120057.21918-1-pedrodemargomes@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace kmalloc_array() followed by copy_from_user() with
memdup_array_user() to improve and simplify fcp_ioctl_set_meter_map().

No functional changes intended.

Signed-off-by: Pedro Demarchi Gomes <pedrodemargomes@gmail.com>
---
 sound/usb/fcp.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/usb/fcp.c b/sound/usb/fcp.c
index 5ee8d8b66058..11e9a96b46ff 100644
--- a/sound/usb/fcp.c
+++ b/sound/usb/fcp.c
@@ -641,12 +641,9 @@ static int fcp_ioctl_set_meter_map(struct usb_mixer_interface *mixer,
 		return -EINVAL;
 
 	/* Allocate and copy the map data */
-	tmp_map = kmalloc_array(map.map_size, sizeof(s16), GFP_KERNEL);
-	if (!tmp_map)
-		return -ENOMEM;
-
-	if (copy_from_user(tmp_map, arg->map, map.map_size * sizeof(s16)))
-		return -EFAULT;
+	tmp_map = memdup_array_user(arg->map, map.map_size, sizeof(s16));
+	if (IS_ERR(tmp_map))
+		return PTR_ERR(tmp_map);
 
 	err = validate_meter_map(tmp_map, map.map_size, map.meter_slots);
 	if (err < 0)
-- 
2.43.0

