Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F49B13B7A3
	for <linux-sound@vger.kernel.org>; Sun, 26 Jul 2026 05:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785042974; cv=none; b=XljQcTPk3nIVsCyw1BF2Et5FNE0nmyDLWLU1QiFcku+u0TnXE4XgDy39qww/HengY8ZUH4syi5CbEMOAH7w2VvJpZQABBUQhr3jsjwNXhRLa+Day8z3c66TCyLl1u9YuP99pBUE8qf9lRki7TgOLMTmEXxR7lMDsUDOjefuC9+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785042974; c=relaxed/simple;
	bh=FSsKpjSjDS1jjsCPMaaxnqzvzutlum7BEe2Cs6H2UFs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mRPM2qkykZMXVJcX65QzVoBpVstxJICscg9xd9R3MftkKJc8KHIXelo3qPNnfZSSgU8Xl50pTqHWK/jQhcA3/I+g1md6kIhEX8Ly4WUjpmfCb2iYhmeqs6xtRN5XStb6JIZqfhBC9/0C5s9yhDc+R//H4HciuZW83wuslFiHtOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xbow.com; spf=pass smtp.mailfrom=xbow.com; dkim=pass (2048-bit key) header.d=xbow.com header.i=@xbow.com header.b=WCT93ixt; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xbow.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xbow.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xbow.com header.i=@xbow.com header.b="WCT93ixt"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso2372441a91.1
        for <linux-sound@vger.kernel.org>; Sat, 25 Jul 2026 22:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=xbow.com; s=google; t=1785042972; x=1785647772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MR44RvrBLwtM26YzEUTXBxK1nPlOeDDDz3ordz0nwuw=;
        b=WCT93ixtmTdhq4iTP4gJvvbRMq40E4W+s+iaVMmQRJ+QQVX1pKI7kKhvlQDouke7va
         z/RPpTZiMURfcXhc8J6rQ0TMvR7zZpfzBDUzymXbYWcQ1NHnufSPseQowX7RIIYu7y8h
         WNMRw64j3yXoWXjS6FnDITGaod94179/iZFwG8CHX5KHc/bkXYIpUOr2OxV5Xz8fa8vT
         5iXJ2fiu80R0pJZzg7mH59MZAdOzk1p8m16TfpFcg++lE1xxx8Oh+q8u0QhrcDZ8/F92
         f8fn9fvxqMxxzpbG2vvcuHuNwd3F4Dsdc0PXHei11l2YK/e7HZrArsvMsGvI7aLpl6hg
         g1Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785042972; x=1785647772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MR44RvrBLwtM26YzEUTXBxK1nPlOeDDDz3ordz0nwuw=;
        b=XSVJaCtnfQknptWWMPEaWW1hF4aPDCP3NVPcsrTaynFa1SC0Rnz8GDnESNMNe8vzEL
         bJ+1tkMGAO9raNI1Uqc6uth6ThF2S6at+bknbLjsLkAz9AxZ/I8TCueDBziTAXFKFIg2
         iwpPB+2K20217qiG4GK3J6sweb14qWKnLmfbD2JsGTBH3AjZoGwiqC18e8OfO/SvZxA6
         OMl+PVTTc27qaa/piL/4t6uIM+5lVuybM2v1piKvg1K7I4Aech6cyMSidMJY2JQVJoDN
         BEChco+str0McoqqGWO76dRGsMCyNakAs/jyS0KlKj0f897N1MiHe2g3f2wnxx1JKQic
         5Z8A==
X-Gm-Message-State: AOJu0Yx+ALCyAu+swU3KCD5BbfCWzgZu8vKZy3fFDPocSo85GgGAleZp
	Sh/tWPKje6FsbEKTuxuL/4Gc8W83P1RCGQ9iflRlpo2Tpyu1zKOq2qol9C+h8gb0ilPzED4a7jU
	X798Y8D8=
X-Gm-Gg: AR+sD13GmCBazW7i5A+RhTy3F/WiW/2boVowgJ1fxDoDybU0gBnueY7kC/26SHS62cD
	gkabr9DO8zTGJ+oDXRAPOw1S+WnIkWLBXwFLVTlxnYyAEfnkzeoobtmvn32sLk4J4AgOGwAOhaH
	MAYBblrhUseoRCRjljZbMPk+y7Hj2XBkAv+ZbCimeoEXeTKJxDi7h6AdlWpaloQUaFt6bIN/Wn1
	mYKyPVS+uBfyJUE2iAIO3QUB/rr3z4dhTvQeMUtJaUpbm3AFXlfbg2wyr9cxKURPwID5+sCMw9C
	aoKL9K86uP7Z2WkzRlwcE92JtzoNm2dvPMwQc3AzRWkziNpSdDcp/DLdWqoUjsZNYuPL0hcFnKo
	yfm5YMmuKQO6k43qi+06l3mOI6C5FxMWyBZnhFpQehrT0ErvJt/KHdFCKGNeOPf0Njfs52h7fFw
	Pc8EGbBDWNxKcxOZ52rZus1mLkjb4Vty8A8SBLAXqW1BhfTQnw8GC/aJg+gU+c
X-Received: by 2002:a17:90b:258e:b0:37f:9ce1:cda4 with SMTP id 98e67ed59e1d1-38f29641b23mr3989545a91.26.1785042972540;
        Sat, 25 Jul 2026 22:16:12 -0700 (PDT)
Received: from localhost.localdomain ([125.128.148.126])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f21759950sm1366693a91.0.2026.07.25.22.16.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 25 Jul 2026 22:16:11 -0700 (PDT)
From: Baul Lee <baul.lee@xbow.com>
To: linux-sound@vger.kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	federico.kirschbaum@xbow.com,
	Baul Lee <baul.lee@xbow.com>,
	stable@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: fix use-after-free in ump_to_endpoint()
Date: Sun, 26 Jul 2026 14:13:37 +0900
Message-ID: <20260726051337.41124-1-baul.lee@xbow.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

create_midi2_ump() registers a card-owned snd_ump_endpoint and stores a
back-pointer to its per-interface snd_usb_midi2_ump object in
ump->private_data, but it never installs an ump->private_free hook and
never clears that pointer.

If a later step of snd_usb_midi_v2_create() fails, its error path calls
free_all_midi2_umps(), which kfree()s the snd_usb_midi2_ump object while
the already-registered endpoint keeps pointing at it.  The created
/dev/snd/umpC*D* node stays exposed, so the first operation of any UMP
open, ump_to_endpoint(), dereferences the dangling ump->private_data and
reads rmidi->eps[dir] out of freed memory.

A malicious USB MIDI 2.0 device that makes creation fail after the
endpoint is registered can thus trigger a slab use-after-free read on a
subsequent open of the UMP node.

Clear the endpoint's back-pointer before freeing the object, and let
ump_to_endpoint() tolerate a NULL private_data so the open/close/trigger
callbacks fail cleanly (their callers already handle a NULL endpoint)
instead of dereferencing a stale pointer.

Discovered by XBOW, triaged by Baul Lee <baul.lee@xbow.com>

Fixes: ff49d1df79ae ("ALSA: usb-audio: USB MIDI 2.0 UMP support")
Reported-by: Federico Kirschbaum <federico.kirschbaum@xbow.com>
Reported-by: Baul Lee <baul.lee@xbow.com>
Cc: stable@vger.kernel.org
Signed-off-by: Baul Lee <baul.lee@xbow.com>
---
 sound/usb/midi2.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/usb/midi2.c b/sound/usb/midi2.c
index 3ec633291772..83980fb83ac8 100644
--- a/sound/usb/midi2.c
+++ b/sound/usb/midi2.c
@@ -329,7 +329,7 @@ ump_to_endpoint(struct snd_ump_endpoint *ump, int dir)
 {
 	struct snd_usb_midi2_ump *rmidi = ump->private_data;
 
-	return rmidi->eps[dir];
+	return rmidi ? rmidi->eps[dir] : NULL;
 }
 
 /* ump open callback */
@@ -685,6 +685,8 @@ static void free_all_midi2_umps(struct snd_usb_midi2_interface *umidi)
 		rmidi = list_first_entry(&umidi->rawmidi_list,
 					 struct snd_usb_midi2_ump, list);
 		list_del(&rmidi->list);
+		if (rmidi->ump)
+			rmidi->ump->private_data = NULL;
 		kfree(rmidi);
 	}
 }
-- 
2.50.1 (Apple Git-155)

