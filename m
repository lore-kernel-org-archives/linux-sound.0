Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7BE1531E8
	for <linux-sound@vger.kernel.org>; Mon, 10 Aug 2026 05:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786341455; cv=none; b=YwIZP7YaJEPU+V3OYsRNP3st/6ERw0pjDBrMnu8pLS0xIgfcwf65Vq5kEijtF7YAQKR8XPlhtCChUBMHtmBhOqYnebEw2u0oz0eCBNgcH2tF96pVy23H1vrAgEe8qOfNjixYkuyumC41ITGxYGRx8vuoJNUYNmdCkVLXdgLApdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786341455; c=relaxed/simple;
	bh=yQGidt4pmHSscqeRrnyQ+tvHXxIdvWfAR3XNmGIutIE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=LYAiP9urU5ruz4Lu3DzbQYaXV9cCmtD/XwZhTlNOlaTJY+LTbpWPyvEd3XrA583nEjtSqoqHciF/XSv3M7Sv90u6uDFnVrkv0laoeknFMEoiqUT1NMJdMYGO7q7OSi94l5MEK6rQoLebJFySBMCBQ3ecqjl2SQ0G4aCj1R8dTTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qcS3NDl0; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qcS3NDl0"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4954aff6088so12998175e9.3
        for <linux-sound@vger.kernel.org>; Sun, 09 Aug 2026 22:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786341452; x=1786946252; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7NK9slaUcp7pt1m4E6R7eQ5WHy7YplLrKlJA3Ixna6Q=;
        b=qcS3NDl0BAIWsgTHtdjH+cQ54LzhHrv5y1lB2aeqOn+9UyKaopXk19tq2uQwaW6flD
         GAHispRmnvDZ48Gs2nuPw7ZSFHUUmjOOBm7txsZrAY5plHXJZh860HpsStSOJjjIjUFv
         MKZcZ8iKc9dDO9JYuyBzrhauqR1FRPzaRgLoqucRMhDuvsNucpU0vrY7sTFVdJMrK80V
         r5AtO7m4Vy9sHflBzQ2n9K03Ym2cXMcqzV9zO19mD0dYMZ/R6HgPO34AA0v/fzLMI6kv
         JPYRsU6ugcOYaqhsw1Jz5/C/LqVv+fNT0yzBA78uM5+G5WO7e5AgjTpDjgNs/7lQtk1X
         5gpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786341452; x=1786946252;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7NK9slaUcp7pt1m4E6R7eQ5WHy7YplLrKlJA3Ixna6Q=;
        b=WnQAT9f1i7Z8WH7vL6jMjksN+BHZ4c8bwKXzJsVFkfUWd00p+ZT5Nc6o0gbZsq8pH+
         nsSYkaXi0C/Oux/NqHEvDTS2NIW8e/4Tp8PeD4R6+n12VxAd+W8qcp+Q8OhRmDLLTUuF
         pYhZ0XHXqoAbovtg4IBEiRxtn8bdGlF+eMC4i6qz2NZhe94Hx26UQcGL13f6hOP1JHdd
         VanczjdVAvWqyeipJQaB0Rj6SzcR6v7//7TKp6+4dAmRP9BG18f9GbumfuVMieRrH3Iu
         tuf7vOrAMjOwwCr+45yb59qh4LBb3GX0aODvvAUzsNKAq2iZyeZLk/atTnZZ9UBs/aRX
         JZIA==
X-Gm-Message-State: AOJu0YyPBSCxv+4LZDb5aeqcSVF4dQ9hrv0Rnt3K1oeQBwqy2FSlGCF7
	63cXnjTfSQVJvWTZoWVqmqcbNTP55smorjdqkBnxL/EuSkbETFumBRog
X-Gm-Gg: AR+sD138+/YBknDLwXGXNLW5d8H6E5wo7dxRlarfIpIV/7hfUmmytvS+pnqPdbqcMBC
	8R3jsaBO5IOKigXGSYfKqqv5y0Yxa+E1sfifUIBUwAT3jvcaVAG9guDcRzCriVOm0Ou2pTbuIM/
	yJi9BvGrkpDKVliYt6XH5iEJ6ag/omgulFXc6Tn7dS6of0pB7IPFuxtqrVck3PwdkzYQYPdSCQY
	3LawM5Iiuq7u728EltjMhR4LwLE24m1TwngsK9PMxCTUSnXjdrOBl/YNOPXOlV8NjntGL8f/QbX
	VsKE9p6lrn8rHDYn+2AVSXLNtpOqpYiy7W1tKlgrZehBaIjIfrkZX+zOketMNGbEEAJQw7ofxuE
	TEardwyd1fUGMfJc9dSvoLR+qR+B5NihJ5xLdteZfrvmuASoqLi/224KRV9LuvEiDzD6IAh3peU
	e5m8YP2dYcnPAEKCzQWVyiG0AMbGVL54olQlvzwYJ3vcRuCpD0ol7NdCfd398Z7HGrPUxr+B6L
X-Received: by 2002:a05:600c:c8c:b0:496:c18c:f9a3 with SMTP id 5b1f17b1804b1-4994e79dc76mr487622485e9.5.1786341452120;
        Sun, 09 Aug 2026 22:57:32 -0700 (PDT)
Received: from foxbook (bgt135.neoplus.adsl.tpnet.pl. [83.28.83.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995c69c777sm276712085e9.2.2026.08.09.22.57.31
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 09 Aug 2026 22:57:31 -0700 (PDT)
Date: Mon, 10 Aug 2026 07:57:28 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: usx2y: Stop clearing urb->hcpriv before submission
Message-ID: <20260810075728.483c827e.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

This is managed by USB core and drivers aren't expected to touch it.

It should only be not NULL on a submitted URB, in which case clearing
defeats the "submitted while active" sanity check in usb_submit_urb()
and may crash the HCD handling the URB and panic the kernel.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 sound/usb/usx2y/usbusx2yaudio.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/usb/usx2y/usbusx2yaudio.c b/sound/usb/usx2y/usbusx2yaudio.c
index 3808df54727d..a3a0bc13632b 100644
--- a/sound/usb/usx2y/usbusx2yaudio.c
+++ b/sound/usb/usx2y/usbusx2yaudio.c
@@ -167,7 +167,6 @@ static int usx2y_urb_submit(struct snd_usx2y_substream *subs, struct urb *urb, i
 	if (!urb)
 		return -ENODEV;
 	urb->start_frame = frame + NRURBS * nr_of_packs();  // let hcd do rollover sanity checks
-	urb->hcpriv = NULL;
 	urb->dev = subs->usx2y->dev; /* we need to set this at each time */
 	err = usb_submit_urb(urb, GFP_ATOMIC);
 	if (err < 0) {
-- 
2.48.1
