Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F76937757D
	for <linux-sound@vger.kernel.org>; Thu, 27 Aug 2026 23:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787872931; cv=none; b=LQVmdeM2XmzC288/WH3pToCN0X1avzDjo1dXwqY0JsMj9GXfxKG1pF2dv8G4w++TvpaaXDmrGN2RUdnofMMP1QJf9qY512897lD+MRDEtqBAF1iy9FyVYPUbcwy7jXEbQxQMdj+pzTiz9Rh/1QDl7dlkT8xVNVXNjI8nCFvORlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787872931; c=relaxed/simple;
	bh=pZwz+f8Jrl4t8j4pbfuvXzvgW56/tDJ2sxBemNi0t/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RGFPIFoJ9zdaViiiZNS0tGpptQAsRpnKmYG76yDEEBgVmgDbXKrMHEUSYxPa4dMnw34iFeDAUqDG8ToSZXmBoANJRr48z+IJ6IVXGZ7a0UmLk5pqG/5wkHDA1m+4davoUuQ/04dgmyJjRA2swrMQyKmQ/HLutW+8Wu7k3s/+DKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XQvBKmj8; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XQvBKmj8"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-4864ebb6268so468539b6e.3
        for <linux-sound@vger.kernel.org>; Thu, 27 Aug 2026 16:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787872929; x=1788477729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O+4qeVVVSQESc4ddkEUc5FBIdc2XaWCbbfUsn4FAT3M=;
        b=XQvBKmj8hHLQTBqU9bFP2fKxo8Vo6LRPR+xjOt5fgZARZUhLHlbLdQ6WAxBUgaAnU8
         +ivJT35x0hIJgVkSDKG9vOLVyKelIF9reXXDtJT1YYNS5GrKFY/0AnoOwPkP1TE9QJ/S
         PcoyL76tOf4SrCT2Vq6khUmnhAUcBveFvF4NKAHLDnLo4Khn9W8dgHnnYioytmNLD/Oy
         vfwmVNjtNjYTR+gr1xyG3fhQHlYimgYFWg/NXdodmcMtwNewui1+woFP82KVJ5nk2JBk
         CmUcXfNbTaSY5q3W67P+XXEJtRvfwMmgZq3V0Ojov2//KHDSXoxIKbIZIZRTOqJEmaJB
         SnBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787872929; x=1788477729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O+4qeVVVSQESc4ddkEUc5FBIdc2XaWCbbfUsn4FAT3M=;
        b=V3/DvAR7y7/78G7nl1wt8RTiuT51E0e70K+JXx3nep6Fwi8dm9N11Cw7knzvOmUpYT
         HxRq0PenA7CYgAtD1yQUUBzttsbY4JiN79obU/OidaGIUx4ljxJmjTnzQO+/LwDged9I
         9oGpsFKZQcDSlYc2DMPzq1veCstc6Dpula4gazkp+9frRw9mIB7DinHXL8ecO1fQdx90
         RH8zKYWXMCwDr3EayDhcdpKt9BqakIJAwOPE5dTzLbG2WRojvA9uwOqTux8NLtKJQgma
         SLjYArN0CK3VrjYhHxj99mpYMoPzyay6lcd2x8+8Iymd4mNFHvh7zzzdNSQt1kZsphtN
         DSrg==
X-Forwarded-Encrypted: i=1; AHgh+RqtkVKccE9qfMgOWzMnSchy+oUE7B2+xsh3vfnZuJg+goWq+kaFW6QkkS1R9iKB5/lenDvj2TSLvwCBnA==@vger.kernel.org
X-Gm-Message-State: AFuF++nlOkGdd08tWTkIPsL7pyJ8nCt19jmelb2UablyTzhFOt7HNun2
	NYVo+VOEflSv0Waab6YKIDbRy3Oeiron3j5LvCiDJ7Avs67b26od76Kf
X-Gm-Gg: AR+sD100TALBTsNtbXOMNV5Xs6dRB9rmXv0l/vKfR2jzAGHxxGspwA7WfQ1ITvWVECl
	xTTQBA7mLyquGsoy4l+NrMCAXs/E7yHQVYPnXPvjr5yRnQwLoEGIyOrGELRIampb2RzfJKMgFfg
	lTLJpOZ7oGzCeciyCp831zv+FwpIBHy++1JcEn2vP81XMVHLwNgbGfFUUY5+xsRZZmYdq/OVUpE
	4NcNtK1KUxYec3GhmSQpY4GhfoK+np9O4cgosCTMMBIGpDf6dP0794QhCkspEnTOLLF+VE9b2AG
	IersoMdhvgdpzO3oO4KJxDczVI01wHqQ9yOhspcTz55cwNyeJZfIiRBt226DnDyRjI9rgAH2Ddz
	k8hq1ayqybVOsyu29+3Mr0LEWr50Bl2wJD6VlcLtkm3Ic9osyKL7vMSVRCJnmOj192V8F1Z2J+p
	rBvpQICOSn73eDGT47ZiBA8jwwqdjZqxwJ6VDXVI6LVp4UeCRTAovW0Y/HF2GTIfEVdny0RjTDd
	N4kiQ==
X-Received: by 2002:a05:6808:538e:b0:497:8f1:df07 with SMTP id 5614622812f47-4b398038bdamr3195085b6e.7.1787872925030;
        Thu, 27 Aug 2026 16:22:05 -0700 (PDT)
Received: from localhost.localdomain ([2600:1702:4ff0:baa0:5054:ff:fe3d:4ddb])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b38fbfe089sm1589553b6e.14.2026.08.27.16.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 16:22:03 -0700 (PDT)
From: Will Porter <mrwillporter@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	"Geoffrey D. Bennett" <g@b4.vu>,
	Asahi Lina <lina@asahilina.net>,
	Chris J Arges <chris.j.arges@canonical.com>,
	Nick Kossifidis <mickflemm@gmail.com>,
	Detlef Urban <onkel@paraair.de>,
	Roy Vegard Ovesen <roy.vegard.ovesen@gmail.com>,
	fenugrec <fenugrec@mail.com>,
	Frederic Popp <frederic.l.popp@t-online.de>,
	=?UTF-8?q?C=C3=A1ssio=20Gabriel?= <cassiogabrielcontato@gmail.com>,
	Shipei Qu <qu@darknavy.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Will Porter <mrwillporter@gmail.com>
Subject: [PATCH 6/6] ALSA: usb-audio: Guard FCP protocol transfers
Date: Thu, 27 Aug 2026 18:21:43 -0500
Message-ID: <20260827232143.149197-7-mrwillporter@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260827232143.149197-1-mrwillporter@gmail.com>
References: <20260824230302.27965-1-mrwillporter@gmail.com>
 <20260827232143.149197-1-mrwillporter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

FCP meter and hwdep operations issue control transfers without
preventing runtime suspend or disconnect. Protect the central
request-and-response transport. One reference then covers the command,
acknowledgment wait, and response.

The initial step-zero request bypasses that transport. Hold an outer
reference across the complete initialization sequence so the device stays
active through step zero, notification-URB setup, and both initialization
commands. The central transport keeps its guard for calls outside
initialization; the existing active counter balances the nested calls.

FCP has no private resume callback. Its suspend callback only removes the
notification URB. Taking the initialization and transport guards under the
existing protocol mutex causes no resume-side lock inversion.

Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Will Porter <mrwillporter@gmail.com>
---
 sound/usb/fcp.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/usb/fcp.c b/sound/usb/fcp.c
index 5fc2131b4561..68bb7eabf107 100644
--- a/sound/usb/fcp.c
+++ b/sound/usb/fcp.c
@@ -191,6 +191,10 @@ static int fcp_usb(struct usb_mixer_interface *mixer, u32 opcode,
 	const int max_retries = 5;
 	int err;
 
+	CLASS(snd_usb_lock, pm)(mixer->chip);
+	if (pm.err < 0)
+		return -EIO;
+
 	if (!private->urb)
 		return -ENODEV;
 
@@ -1026,6 +1030,10 @@ static int fcp_init(struct usb_mixer_interface *mixer,
 	struct usb_device *dev = mixer->chip->dev;
 	int err;
 
+	CLASS(snd_usb_lock, pm)(mixer->chip);
+	if (pm.err < 0)
+		return -EIO;
+
 	err = snd_usb_ctl_msg(dev, usb_rcvctrlpipe(dev, 0),
 		FCP_USB_REQ_STEP0,
 		USB_RECIP_INTERFACE | USB_TYPE_CLASS | USB_DIR_IN,
-- 
2.47.3

