Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58123C37AF
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 11:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786102967; cv=none; b=MOtExlbT7q0MIlRcW5igAv6tcsTCp3GV9Bsv/zHd/NJnmSZGILK1YlaRkI0Lnx2yyCP99j8sjAbkF4TQHlYMfVAMF97M6LSfVfdgrOE0slwxZVy1/ucme6Mghj37PRuFQ13H8NkLmBSTNmaAqOC8X7/aBhPTnajuua9loojyh1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786102967; c=relaxed/simple;
	bh=ztgsF4xlC+/UgNtfKPXec9lw/Y0/M4oYUL4+7ifjbZU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XO3Ag6f5kDU1ksScL/bg65imdHgoQiGXbeOquCb5IUR00CHMtZoHwIvRTATo7ofjyApwP3HrUDrydYxo8WXKZkF77tvu6Wp7KLIFH9tz7XxtSbPdqy0WoRnkA2/kI6I32EEncd23/geblr4hAn7hWJKf9oggAztWPwnnHp4BK+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DcTY/WU9; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DcTY/WU9"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cc97653887so38118495ad.1
        for <linux-sound@vger.kernel.org>; Fri, 07 Aug 2026 04:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786102953; x=1786707753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XFU29Mt+4RJ+9zZZmPn+2wKzh7skI+zFObgTR2DLrqc=;
        b=DcTY/WU9FUkk66U0jvqwGrtXduGttJAAQa/egpEVYRAeuLU4YEnxHzAFRkPFma2ygf
         b06cJpXjqLuMtb6QBg4RJJJADxwgKohTL1RKW1BzimL+vPryBCQMw3GtpguJqDvwi9Lk
         aActrR6lYy8vIWlQYacj6tSy7vTO+HVnwNYvFhh1FpjY9nVQc6vZkTs9sjdJRSFB4lLa
         SAZij0knLzE/0cIeFon1ES8zJbYI9xPVdFY4Rjdx4JmadvKSj5GtYD6uS+HlaHqq/mmW
         FQd6jDR1jzJRAlQsaOR8Fvq8sXvXH6CNs/dj8vkd89QhOabFGnQPQcm2vcqhGZCzNUrI
         e0SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786102953; x=1786707753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XFU29Mt+4RJ+9zZZmPn+2wKzh7skI+zFObgTR2DLrqc=;
        b=l0h5DnLRaI4coXq0eXqJEbF9ohFqXZ6vOr7y8OzI8sDzu0WvcTP86B3VHwj9S2rtiS
         CDacMD2TL09SFlT0/5eAOypSTH6vbWgrg8/qXoLfS0L/sBWvHlafD41EPyFgyXqRK5FC
         ejhmlgRLEQosOTxVzKxOQsj/lhjwqHtwv0wEc3KqKKXQLY1ng+mQ3g+p/ZPe5liVcmgX
         r+3s4Oi9JfCL1qRI785SuWhWHra/CM1XrKEPQ8z01UH27czi7vxp8Uyi8EoWrgTsOUb2
         f/a53dcwhwCdmKLwGLSgE0f9zfdrPJwfui8asBE2b7xFib/XUdoAdm0Y27/uvQdpkOH1
         Z4oA==
X-Forwarded-Encrypted: i=1; AHgh+RqPP7zkfqd0DUMT3cm6qsDB37N2oq38aP2VScaldZQTZ7BNraiaChwHTEjwFeJy+PsPVodAGTCa09Uh9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKCLqJjx1Ca79daq0JmLVO/Z4gzFYHrRsHnCLHE/hGDhI2pJw+
	ry7rcS/oNlpAgAKGDwYxtrBWg3ipgc74BAbcnI5nkW3qHFw8crEPxhVt
X-Gm-Gg: AR+sD115Mx39kg238n7m6479h2PkBKxj8LuMdoKJ1NngOoiHM4bfEY1mWbTOchUBjLy
	fzC73B3RA34hYv49kdF4+cy+4/lR8lPjPDXgzVNY5RUeocYK/VCcIg+AkcJiGl41hXFCrAags1g
	+oObXJvKCa2VRDfmBD8dItUhU7uSsalKYZA2f0P9dM/5tVTSyMV9fqDcV9/FkGCZHOcGJkwT7XF
	20dL/c2AhoJT0sMawEvPHV5ZUfCQzCRMKlNdEzOqb5nDvxEToMVqMKThApyDmrG5h7qnkNhqEbU
	QOk6rEFBjlGg3QYkRM5IdLpbvDHNSDdwNA5bwWZEu9bbat8P5BZf1Gsls2zrYjFotxGo0xPIW9Z
	xOE6gA0NFqdxTcMRXV+pBFm3aOlKx5xCgZ9zheMW5L2pg7cWlu9Ld2PXruAYDktovTyuErDkVGI
	vIpTnoHxRtTz6Du/cwQzpXsHB93cmrQFcfHBiBEpgTor/klaV8JpcqfOly+ggdbKAPSAeLzGUyk
	EZERvchm1M=
X-Received: by 2002:a17:902:cccf:b0:2d0:cc92:f7b8 with SMTP id d9443c01a7336-2d0cc9302a7mr259995675ad.2.1786102953464;
        Fri, 07 Aug 2026 04:42:33 -0700 (PDT)
Received: from localhost.localdomain ([72.255.58.127])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be86d3fcsm6930508eec.4.2026.08.07.04.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 04:42:33 -0700 (PDT)
From: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: Kees Cook <kees@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
Subject: [PATCH 6/7] ALSA: hiface: replace strlcat() with scnprintf()
Date: Fri,  7 Aug 2026 11:41:38 +0000
Message-ID: <20260807114139.1661-7-mahad.ibrahim.dev@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260807114139.1661-1-mahad.ibrahim.dev@gmail.com>
References: <20260807114139.1661-1-mahad.ibrahim.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

card->longname was built with two strlcat() calls, one copying
card->shortname and one appending " at ". The return value of the
second gave the offset that usb_make_path() writes at.

card->longname is empty here. snd_card_new() allocates struct
snd_card with kzalloc() and nothing writes longname before this
point, so the first strlcat() is really a copy and the two calls
collapse into one scnprintf().

len now counts the characters actually written rather than the
characters requested, so the bounds check below it is always true and
usb_make_path() is reached even when the name was truncated. In that
case it is given a size of one and writes only the NUL terminator
that scnprintf() already placed there, so longname does not change.
Truncation cannot happen in practice anyway: shortname is 32 bytes
and longname is 80.

Signed-off-by: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
---
 sound/usb/hiface/chip.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/usb/hiface/chip.c b/sound/usb/hiface/chip.c
index bce28f683666..d217fe64eabd 100644
--- a/sound/usb/hiface/chip.c
+++ b/sound/usb/hiface/chip.c
@@ -70,8 +70,8 @@ static int hiface_chip_create(struct usb_interface *intf,
 	else
 		strscpy(card->shortname, "M2Tech generic audio", sizeof(card->shortname));
 
-	strlcat(card->longname, card->shortname, sizeof(card->longname));
-	len = strlcat(card->longname, " at ", sizeof(card->longname));
+	len = scnprintf(card->longname, sizeof(card->longname), "%s at ",
+			card->shortname);
 	if (len < sizeof(card->longname))
 		usb_make_path(device, card->longname + len,
 			      sizeof(card->longname) - len);
-- 
2.54.0

