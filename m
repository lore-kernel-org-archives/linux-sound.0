Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CAF2F0680
	for <linux-sound@vger.kernel.org>; Fri,  8 May 2026 03:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778211562; cv=none; b=rQbJqiC0tumCb3ZVTJfytiMOIie0LPoogKRzoYPJBN3euxhmq9+1RsFY9XLp7W0hOYU6o5YuOhchY5NKF5UkqHHkVGbdoSYfuxGaY82EvWbIMVjP6azdyJ+IU0DKYrrd94DD7bqvTjedcqsschHoSiXaY9+kSc0BZye5qbmNrQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778211562; c=relaxed/simple;
	bh=vzSxG6Onrc8/yaWLl4CTnv1mXqAZK6Owe5CxDryLrIU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WvHf1WMo2Hu+6faqgBZBYKQMH8S6ADpOL56O8qAFulTBugzHWCd3Dkga1GYb1ItPA4lZ4qfOnnwgLfD0C32GRVzfyx0F8YDPrwTznqQftwhBTQ6+ct5tIknLMhP7k3z+eF+2YE8uAzYKlcfCTqV+Uhlg3In2/a0yqz3S5K0j/jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hSaraYEE; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hSaraYEE"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-83975e992e1so753303b3a.2
        for <linux-sound@vger.kernel.org>; Thu, 07 May 2026 20:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778211560; x=1778816360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q2vfbSINB9Jq0JdlahOlh/WjU5V7KN7fzt5ytJCyJiY=;
        b=hSaraYEEFtElfLT4OFjOnGwcGu572lZLX+2geFlnNok5PTbqdMdvAxv1G/jE6Ewbui
         kLvlWt35qz6ucWnt1Ob7k1Xyg47pMcEE1PV2b4MruEHJ+PSoRolvkjLmgBnccRVkxFyo
         6xV6VVDqFqoNtybgUmlfqvULCH2Gd6yVDQG5x59ZhPginWd78dLCbKQkR5VW3pFrU4qG
         wcY+sYVj0bVrZPePOrf6vH9icX+B6flxSJDeNjDjX6nTxk57uqH6gqlAm91HXDmXokjC
         cCPYEgEfyGc+sTZbmu1ud8jtxpaJEYbUjZbWRWabbZ/xdbhmoGtgzfsH7ZvWDAqqWpTp
         freQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778211560; x=1778816360;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q2vfbSINB9Jq0JdlahOlh/WjU5V7KN7fzt5ytJCyJiY=;
        b=HhkE6spKgewPaTcUtDYQolRx2bUvDLutOu9yGkzPrrqu/JJc0NYXTxmG1sE8j3HAAl
         ZqsAMwyt9hFkolsMHBzW+CWqhIFgcM8hbCER+IfeBa8ZXUjJHas18xJe3tODwPzhc/l9
         iH7CgvimjOYM3WwwlbJzVmg9HNuiQckNkAOqTMBljiXbnTFd0g7UhHBRa6EmSrb8ChA/
         OgeymOxqujzqda+mmnpLrmLs15qkVDoRg3XZ3SzYIux6KHh1pe1qmPcEyVeRIMqeJ+ea
         QLMC9qteohRc4vxP2lA5/92hmz5Bo54Doq2PqoAAxGtJ7LE5jty0prQVZks6fdjBbFVR
         Iw3g==
X-Gm-Message-State: AOJu0Yxa7bwjk0cVvCDJCUSNMCojevyEulkz4e3+TV9hrysikKjckFdn
	gIbKc0D6I1jGIP+mtCJb/pmH8ueteR1uJyzp18fZQt8+XypiVLfs6i0S
X-Gm-Gg: AeBDiev0VO5NgI5dR7Zi0rRkRO00zEoJvwC8xZ6YKo+o5YFBAQvRS1qOGBlOgHwT+1R
	+mE4jFFqBTF/h2S8sNYMiBZvDFKv2Z1hAqA7Vqi+YF79x1ZQF8B6UrlbRlX9RQJ+8OIfjVIrQqa
	0nzOSebywFVBLce+44il6CtMx+XiDMRcgvpE/ngVeONOyDvVeMrc4Uhcbrmvf9eiIx6T8t3S7vg
	xrdU+78A8tbhtiv4ito88W1PyaYyRZWA/eXRvrfNP70XCb0mw/kIqai4hw88DCzWW/GmkBvhy7E
	+IZdHN2PYEcdRvqu62jL3K/5n0PJIgkRTsQ8+SQvJy1w2x+JJCQuzX7n6ExJD8CrxiuZZtU0Z7f
	K8zIg+CdTpPaH3ZIBRFNfrnwK+qsQMwMk8PGwJPOcDwNsww+szataqHpabHC6la9okqV6jG/TIE
	iSKzDAW2WipyZUwEA+xQvd+njp7w==
X-Received: by 2002:a05:6a00:4516:b0:82f:559d:ece3 with SMTP id d2e1a72fcca58-83a5b9d47ddmr9840609b3a.15.1778211560488;
        Thu, 07 May 2026 20:39:20 -0700 (PDT)
Received: from soyboi ([2402:8780:1073:993:9321:304a:9347:5e0e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965646254sm10905574b3a.10.2026.05.07.20.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 20:39:20 -0700 (PDT)
From: Robertus Diawan Chris <robertusdchris@gmail.com>
To: g@b4.vu,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com
Subject: [PATCH RFT] ALSA: scarlett2: Add missing error check when initialise Autogain Status
Date: Fri,  8 May 2026 10:39:14 +0700
Message-ID: <20260508033914.111596-1-robertusdchris@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When initialise new control with scarlett2_add_new_ctl() function for
Autogain Status, scarlett2_add_new_ctl() might throw an error. So, add
error check after initialise new control for Autogain Status.

This is reported by Coverity Scan with CID 1598781 as UNUSED_VALUE.

Fixes: 0a995e38dc44 ("ALSA: scarlett2: Add support for software-controllable input gain")
Signed-off-by: Robertus Diawan Chris <robertusdchris@gmail.com>
---
I don't have the device myself, so I can't test this change. Thank you.

 sound/usb/mixer_scarlett2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 8eaa96222759..0f83f8981213 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -6707,6 +6707,8 @@ static int scarlett2_add_line_in_ctls(struct usb_mixer_interface *mixer)
 		err = scarlett2_add_new_ctl(
 			mixer, &scarlett2_autogain_status_ctl,
 			i, 1, s, &private->autogain_status_ctls[i]);
+		if (err < 0)
+			return err;
 	}
 
 	/* Add autogain target controls */

base-commit: 7fd2df204f342fc17d1a0bfcd474b24232fb0f32
-- 
2.54.0

