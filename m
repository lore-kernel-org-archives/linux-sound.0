Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42295302CA2
	for <linux-sound@vger.kernel.org>; Wed, 15 Oct 2025 05:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760505419; cv=none; b=C/PWp/NIIk66NW82JwEaZQ1/utyMraZ34znqMkgoC0cZZLTDKDqF4gfoWAnu/eksdQ2eGeiPZAo/RfXv5hKCPdRty7IgsaxZjXfEm7hlRG07sA8KF3iLRRRKR6RPJrtre2BheINf8SO6/yx9iwuFY4GdHEbW0mgrMQaiy3MCwEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760505419; c=relaxed/simple;
	bh=+C4H+zroDethd7br3mfINtGxJHy7JmMXn0wIBxbB1Qs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ljftIae4FDibfk4jKDbgRqdv9KXWeOE7TMWSq1NG5VPzjma8q4WAB1HLlnOBvQljPy1dRUYcaHArZN00agDj/9Nw775WEzPdmqYSDaTEtMnfnvaTcn2wg2dRX6JOlFsPkFHspxWlXteBwYO+/WTRK+QAOe3CZw76tUhs4vso8QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kF4nzEMc; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kF4nzEMc"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-79af647cef2so2839671b3a.3
        for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 22:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760505417; x=1761110217; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nJNUOJGibzoLiszJdXC8Yo14nanYYKcUy9zsuhUUDYc=;
        b=kF4nzEMcgf8hvFxIFautPip1iQI594McodQIMfWs/LrDd6rC2bG5v6rXNwovbfurQm
         Keh9KVi/O10yyd8KU3tj9bkv77UaOwF6IS+HuuU84lx/98nNTPRm8+d0BWs6VPxpSZ73
         v+HNq5A03+QSDPcTT4Xb4Gcl7P8qyd+fsV/WpWLfxlglvafSfYVha2lhaBcLBU3BNbZP
         sPL8e2s2G1JvHkp2hdfFrxEDhILbPm67znd5VSw1j6TbpzAozLitYI6ThAgZ1++ShDzM
         eA74NyBrb7UW8c9tSSPpx+kHfGNb4bepP4o1sJrhcJfqsfvQFIuIpTHc9x3KcEu3E8mc
         Si2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760505417; x=1761110217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nJNUOJGibzoLiszJdXC8Yo14nanYYKcUy9zsuhUUDYc=;
        b=F0mPTIk/1znqn+G8KAiv7ez/aLkh0cO5Y4EudKR/JY9uP9CGzvk9OjrClhzuxx6ziB
         nGl4sFp72XXmnK5qtdnZvrQPqv+RHi6lhMrzmqCV3ckBb06FHiCWX6ewZo2dALo9sbat
         /+1HxIp5cWta3yUwjOxraa6460WbsxZRnPYsWpUAGAPhLrHMmJTkJ/wncW43bcL2/N9v
         ChivqIM/SuZFIEpDq0JfIOHCB6uxulIzgJKyq9SI8Fxc4oSo3sVkXSUX2QnDhTNgeFc1
         DrpVZt/uGItPyeyQmBsxUvavmyMiacnuvM4YBXPf8Ld31Aw+S3Y7rOB/sQXpp0S3MrPf
         Kg1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUCZzBIDqkgjVjYaeG6v4iQA/U+W7PiMHElbjdYGEklYHJJ64OjFldnAsVLZJo3T5vROW5hecxKrmQUhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YySwlFfeOmqtCp2u5YJvzF9DKMwo/CGxi/AWdu2Vs8dqFVUIfrv
	SkPgN7dVmyq+0YhlPkZZzf8dtahi/Gbci7DOHgsxEzcb/1Xfs/D/IsK1
X-Gm-Gg: ASbGnctR5pq3pTlB4eYRIRAqtZVneC87d5b32zAgr7YyJ2NW73h9HXR/S1SDTwQhuLd
	9Axk8kr8AeRbHmLiMKLCYeJP1qgBLAaio1QqNe9CrdMWeFFYb+HZcAiNsdMkNGG8FRo1jodo3d2
	qSvmDsyKe+MQXK/EMP075qKUDHOwcxGUlnH1lp9ofhGz1ONuNij3/shvL0UM1bl86tWJWwpgLNJ
	7dUUq3gaVk2Zuk4/l4PuYiGnGtQr5efl+hVx7fh1CnfRJifAEeZBQap10Yg9Qnso8IAlgoQUOLb
	m8dzKxkRRHu4B1Y6QFbcdp6jHRFJdjT2n9jvPzPg4CqOZkK0svqkIP+7GaDQvPDRGIdKdvkJGPm
	pHcYXfMGJuEbUBlcko1NSX1W9cx306BwLk7+563/dI1XDZSx9Qjrq
X-Google-Smtp-Source: AGHT+IGaYSaDctN1UDXrQ/b1IBYPl2mNpwc/vOVwXDn/8RGkSFgqDvehEDR5ZrCFJsldV8ETtDC8WA==
X-Received: by 2002:a05:6300:218e:b0:32b:810c:2ba5 with SMTP id adf61e73a8af0-32da84ed640mr38525100637.59.1760505417000;
        Tue, 14 Oct 2025 22:16:57 -0700 (PDT)
Received: from ustb520lab-MS-7E07.. ([115.25.44.221])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b060a38sm17320137b3a.5.2025.10.14.22.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 22:16:56 -0700 (PDT)
From: Jiaming Zhang <r772577952@gmail.com>
To: tiwai@suse.de,
	gregkh@linuxfoundation.org
Cc: broonie@kernel.org,
	cryolitia@uniontech.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	pierre-louis.bossart@linux.dev,
	quic_wcheng@quicinc.com,
	r772577952@gmail.com,
	syzkaller@googlegroups.com,
	tiwai@suse.com
Subject: [PATCH v2 1/1] ALSA: usb-audio: Fix NULL pointer deference in try_to_register_card
Date: Wed, 15 Oct 2025 13:16:45 +0800
Message-Id: <20251015051645.519470-2-r772577952@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251015051645.519470-1-r772577952@gmail.com>
References: <877bwy81wi.wl-tiwai@suse.de>
 <20251015051645.519470-1-r772577952@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In try_to_register_card(), the return value of usb_ifnum_to_if() is
passed directly to usb_interface_claimed() without a NULL check, which
will lead to a NULL pointer dereference when creating an invalid
USB audio device. Fix this by adding a check to ensure the interface
pointer is valid before passing it to usb_interface_claimed().

Fixes: 39efc9c ("ALSA: usb-audio: Fix last interface check for registration")
Closes: https://lore.kernel.org/all/CANypQFYtQxHL5ghREs-BujZG413RPJGnO5TH=xjFBKpPts33tA@mail.gmail.com/
Signed-off-by: Jiaming Zhang <r772577952@gmail.com>
---
 sound/usb/card.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index 1d5a65eac933..270dad84d825 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -891,10 +891,16 @@ get_alias_quirk(struct usb_device *dev, unsigned int id)
  */
 static int try_to_register_card(struct snd_usb_audio *chip, int ifnum)
 {
+	struct usb_interface *iface;
+
 	if (check_delayed_register_option(chip) == ifnum ||
-	    chip->last_iface == ifnum ||
-	    usb_interface_claimed(usb_ifnum_to_if(chip->dev, chip->last_iface)))
+	    chip->last_iface == ifnum)
+		return snd_card_register(chip->card);
+
+	iface = usb_ifnum_to_if(chip->dev, chip->last_iface);
+	if (iface && usb_interface_claimed(iface))
 		return snd_card_register(chip->card);
+
 	return 0;
 }
 
-- 
2.34.1

