Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795677774;
	b=S0GAZgBvTIy/AWyf9U5aEoeid0smWjzDIodOZL3A/txqPXBDBejzSUr2k4dbJjl2LPOW
	 cqbVzyev9lRYA7eqOskz7c8vtxG5meTPzKYk7EvMZxNHzgWtR1d1+JEXqFYGddt71KgGG
	 smPXzr2p6t9RZdwnJVtKPmWK0OSVXWomI84QMWptl/UJFH7B3nKK6asYy+ZtBkobUonN5
	 YQ1yKhOiST3YFrjKdpWGxwFNGGTh0kQY9w5SchlLwUk9vTLBsz8Wnv4HOqPM5Mk431aZS
	 Y5azyVVTrozy2sttelgZ8QZ2R4TeYxQMaFUAhXwTMHIwyRr8RkX5BYprJ4YjIR6B+9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795677774;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tyDcKx9CSg/sf/Q8nvmg2kdcVjW3+Ux75hmWCkkVGgY=;
	b=fwEYhZZIzOmWulodw5EccWA7IovWgLrkmjQ7RM0ZC4lraUov6n+mTFPtIFYRydNNOzeL
	 htWq3umWQf1kLfsoOn+QYVuAFQ5D0b9VMspuCr3h8jn48zv6mg7v3DeNa8J0MaBZ3Xlol
	 KzVyrfGvJreaZdgciepOWB6FY8LfSKk+YoQco6yXr+9KtzXaQEobenooFinjUZe4swpcz
	 mla4wgLikb8cRBCt6TGIySVTQ04bQVbHv0JLKx66ObJgwNDyj+7UT/h5Wk8euP2gNxnPC
	 6tL6ODVbFpcCzgs6doR5bffWZTnSjL7zlrevljUFXNQTscEY1mquwyZAvdrtmzg/tjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zFSxe0tK;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE31606A323
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 07:22:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AE31606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zFSxe0tK
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b244fb7fffso7073369c88.1
        for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 23:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795677772; x=1796282572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tyDcKx9CSg/sf/Q8nvmg2kdcVjW3+Ux75hmWCkkVGgY=;
        b=zFSxe0tKCFqn8MxIMSdTCjZ9UDplsJ4eIz93lwm3oztmDyLdglyn7ek/tGsuMComAb
         VkCPLPWJ4jJrIZXmRUsfOZQOdVEpevIRHfOGCRIYt8hAxadjdH8caxLLbe/o7Bg9ItXD
         dR+1txKolmO5CHnbxPohxEEa/EECJPNnJT6qhxz2TSJsNL2ZZmFg00ouoUbeElwAJ5wB
         QCPe48AYiAf8MnI1K2eN4X2RISOVwuveasiaOURpl4bpABxHGTTYOqtXT37WRyuqFcZa
         Bv7JCo6M5jSZbbkiR1VS/VobJzzG4tPW+y8IoYgqut8R4uumr4FGFglHhvLmwNZbNYSY
         I0Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795677772; x=1796282572;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tyDcKx9CSg/sf/Q8nvmg2kdcVjW3+Ux75hmWCkkVGgY=;
        b=f+qlzrk0mGQEtF+ABwrP/AmqKu7CkyJjaaT7zq8XuZShPOG8QSubmD2HZ/e8lfX+gu
         ZAoj9VsSytFUa0VpuW16i3ZsZWQb7GPIZC04pdVJRAb/Lv+oJJHLh3w+UnoSjTvCExDa
         KG4OOoa/dO7YEKUVnRFLbTfYfH1in7I5DAd/Hq4NSOy0V2rZaek1NikhP+X05BBsyxNb
         FLq5tdhi5DFErKtHEsWvuDshMZMqQulSMsQg07Tj40di94neTgvPyy2N8Ayw0l5tcPr3
         SBcSTw6hfMvvKKqsxOnL041tA/AoDimzBEBuwxtMvjNGuW4ZtDlzXU6xhZ0KN4qpc2hC
         HpKw==
X-Forwarded-Encrypted: i=1; AL+hErEUI6fcApxKsAUR+M0M9oualXDiXKTHS4tsgbbAc89ZLjQMmNRIOiv99jiVLiQxfCJc0fGPL949j++6ig==@vger.kernel.org
X-Gm-Message-State: APuU4Z/hN6jkxytTckgi1+NAVbRhUG4VZHn1dXsIQeGT2D3uxgHOWHkI
	pxCAXMVMV6G2vqzq8k0+wCimmO+fjO5bHTpdH1d/fxI8WD8RayVw+mSs
X-Gm-Gg: AZFdTZcPJQpPlSekVj82StZbSoR+dNZw28S79uwfRNWLlrOwwwnQyUpsmnDlUElfFwl
	GWhA+YU1Vm8i9RHg1IgbCvymMxC9eSYBluNufzbnMyfG465SCEd3G0JMZgu3dGtwM7Luc4etorF
	R03VB3BSGoB9X9b1TgELsNpFGmVKJ7mQwEYR/SlchDzxifa/RxOQdhhDPRukrgIU7TGQESd8d0C
	jldhwIXGrA7UiHPrpDpnrjUC0yEeMWmNYTPac8lTvaph+hKUJJTDDLVgYllt3ZC/dRaFy1EgbtY
	9v67iAZ3HccieiBhD9HOVDOoowT6QLxC9KNYpLdBW7pLINwrOQCdtgUqfQauwlkRfeXsvV4lE0z
	NNkc0rmvCSqjsnAEZJtJGD2uf2gaEOZTlSm+DDcvcl6LAk2Br3dx1TwyFo8+0fN2YqeuCzZLsod
	UUbvaKntui7eU1dFwfLSlsI72SVGkKsC1zNLaR5pBymck7YKtmkQnUqLJnLVpHc7QsyLWESdXoH
	xkEU8/H7UVIrxc5yteTMMwg8ylLH6MOIYBwk+iB/jFTPBLsyKAFjgBn8PbgM6EM4R1z0wX1pmPE
	MIi/MOe1j1sasBLUzVyL3P6DulXNDzQP9vQ6q07dIZVb1THfZFdJ3uxnIHiuZH+sl1Oeor1G
X-Received: by 2002:a05:693c:8843:b0:386:b429:fe0 with SMTP id 5a478bee46e88-386b429175cmr10099537eec.16.1795677772417;
        Wed, 25 Nov 2026 23:22:52 -0800 (PST)
Received: from localhost.localdomain ([103.179.230.77])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567ea2cc5sm55674215eec.29.2026.11.25.23.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 23:22:51 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: perex@perex.cz,
	tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH] ALSA: vmaster: Retry follower initialization on failure
Date: Thu, 26 Nov 2026 07:22:20 +0000
Message-ID: <20261126072220.4496-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reset the follower count when the initial follower update
fails.

This allows follower initialization to be retried on the
next access.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 sound/core/vmaster.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/core/vmaster.c b/sound/core/vmaster.c
index f43144ba2797..d97d7bb33e16 100644
--- a/sound/core/vmaster.c
+++ b/sound/core/vmaster.c
@@ -102,7 +102,14 @@ static int follower_init(struct link_follower *follower)
 	follower->info.min_val = uinfo->value.integer.min;
 	follower->info.max_val = uinfo->value.integer.max;
 
-	return follower_update(follower);
+	err = follower_update(follower);
+	if (err < 0) {
+		/* allow initialization to be retried */
+		follower->info.count = 0;
+		return err;
+	}
+
+	return 0;
 }
 
 /* initialize master volume */
-- 
2.55.0

