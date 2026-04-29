Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1835437D10F
	for <linux-sound@vger.kernel.org>; Wed, 29 Apr 2026 12:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777464343; cv=none; b=ACPc/1/up9YsBJZzS+rApX3dFiESf3ziBzv8ABoD2589wMAbXsw04s1jM+jqynbBEqB88szMIcszg8WjOkp7DlXB3k/xnjEaAMSR8RXzqc3N2gnxhjXZ3WQ0VJtYTfndYKgfJW+mLvOuR7eqbiwplpopkAcOc+INEy/djFV1GcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777464343; c=relaxed/simple;
	bh=WNKveLwe2SxGX/tGhHqa5ppakcUcqAV/toIgMdutTw4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FPaw116YZ42gZPP5lKg8hkmll7irNKHzx43koMK/6KwcI1vDveh79cg8zvTu/0HpdU02Ag1VS4pxSabfRku/wM24/aesWReU1VFKFVugfurVZiK6k9xek4ormWtJGGIXDGFS8yllfadEhlJvYDy1nc7BU9FTW3SU2l+52NFvcag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bpisHQ3u; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bpisHQ3u"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2bdcf5970cdso745761eec.0
        for <linux-sound@vger.kernel.org>; Wed, 29 Apr 2026 05:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777464341; x=1778069141; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=08a4NydfoQFXH4xmQj1qYBdax1uuuMmZbP5EuXBnZfQ=;
        b=bpisHQ3undGzZYf8AEs3wxEhsA3KyD7YEk5NzcbOVtZVbPG8YnUE+jw7835kPXpl6b
         aMDdGJkpvJbIPFbTXlTp17w3sEKZbwZCh5hdMMBobZFNaYWpGW2mb9p5kCAV6hhvernQ
         lVyK/PZHh+LFtOB5qaDByneL2r6nC1yGNZAPQ+SkLcAdzvA6D7FW7TpKV0Ce34Kw+RZF
         4X1TyoKbQj3ibVT4f73ZafrKXKi9gWL8m7JXTB9fIhVomVs0sLHqO9StH+QzXQRWy6NS
         SFUINmBUj+v+yYy4h8s72kpuBWFt8a+eb78g/PwDYzHc288RvfOQTEU0QOzgfDjVY7w8
         Q8XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777464341; x=1778069141;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=08a4NydfoQFXH4xmQj1qYBdax1uuuMmZbP5EuXBnZfQ=;
        b=UjkIgithA8uXogdiqcdFQXP7Iot91v9KA8NXOGuv3deOXldciaylmVwTCqxc6oTw/7
         DGCx7yoYsWw1QlHezJAjJuIdFwjjsyYj54HOgnUKtumj9rSMUiL+Pk8dGlxx6DHhoERT
         vHHDhbK91mpmvYkb7BwBPyGKuMc2DTSSb+HU6EX6asrZHJcGa1dl+3RFBigqvFqmQn9C
         zFDEmMZU3rtbX5NYlt2/X38BfvBd0ece44Rbd0adFntqbejw/pVDe5Njm3M7s00pTLLP
         4ZmcoqB9y+ND3ZsE4lKpY5vMKpD0oaLjqQA49GAoxbgiHDcQ3rNmmbwVRCuBgGWvK6yP
         gFRA==
X-Gm-Message-State: AOJu0YwVXiv1APZyU2oaP0CLn5fQNfSrY82zLwpX4LFEZl1wKRqQ7B5T
	ldnif4NuF66Av+w0nNFaUkWCL7OLHDMVbtlzU5P0pEWv+ccl9Y1iDm8U
X-Gm-Gg: AeBDieuPRwHRRKj/U8sbvjJshEnkiIPZ0Lhsj9RqAIZOFEm28WLouDWaAELcaRzsjFY
	lwfglv6FN4J7qE6pIIfgfI0ab9q4GE2ZhbcpR7FrZRndJOibTvJW00f0y3suqX3AqgpVTkgQ9jd
	sifeDjnaGnp+e1+lySEPmuop1vvWeFS2JlADoDBsoW/P8lMO5UI+DuZWGWtoWmwBPW2obn92FCq
	dWCdkLtC/AlwWh/bJJaUU9HlgpQiEtL/lmix32Jxp7njB3XOa5lk/hN8PCw7z5YZ8Od2YeUDXnR
	F9XnTmViyITt/BdjMfOuWsNxj1WprCXRSDaCNb/F4oh/Aj846kp35RaqJwN8Z2PUwopumkP7SKV
	WLbGNs/XpNm87LE8R5sXsUthfaeLxapJhvpGNABsbKIbs/tZnwN3MxAZerhoaSqKditKAcZ2qmz
	mhWVl0VucZsm6Qp29rjmKV1RZ8bwWyI1gmHtef/Ux5pbMH8zBJmjojMypbqdOAIupxkz/A6eLDa
	hmj5tE6BL/e
X-Received: by 2002:a05:7300:cd86:b0:2ea:d969:25e0 with SMTP id 5a478bee46e88-2ed1b3e92c1mr1060041eec.5.1777464341053;
        Wed, 29 Apr 2026 05:05:41 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-87.user3p.v-tal.net.br. [177.4.161.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed1bf6d524sm1908745eec.3.2026.04.29.05.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 05:05:40 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Wed, 29 Apr 2026 09:05:31 -0300
Subject: [PATCH] ALSA: ac97: drop stale CMI9738 PCM-volume quirk
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260429-ac97-cmi9738-pcm-volume-v1-1-d3f90cc00604@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBA0auQWTsJVgIdr2JYlOmgYyiQVogJ4
 e4WXL7F/xskiSoJ7sUGUVZNOo0Z10sB/HLjU1B9NpjS1GVlCB1TgxyUmpvFmQOu07AEQUu26yv
 ryHgPuZ6j9Po9z4/277R0b+HPsYN9/wHwV/B7ewAAAA==
X-Change-ID: 20260429-ac97-cmi9738-pcm-volume-898bf48a92dd
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1479;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=WNKveLwe2SxGX/tGhHqa5ppakcUcqAV/toIgMdutTw4=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJkfvwitXvVtgdISJcUMToVr3rvl12k/+llX7vDoSOeqK
 3tfp7Me7ShlYRDjYpAVU2RZnbTIck/Xg6v1cSs8YOawMoEMYeDiFICJuG1kZDg8qfHCpsW+u45x
 7Ze6XOv6K7s6t1rp6pHm1oqkeFZuRxFGho6Fi3tl/No9uD7vf8A99dntyOw//bIvr3FvPDGDc75
 VHQsA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

patch_cm9738() still carries an old comment claiming that CMI9738
has no PCM volume although AC97_PCM reacts, and then forces
AC97_HAS_NO_PCM_VOL.

The CMI9738 datasheet documents register 0x18 as "PCM Out Vol"
with mute and left/right volume fields, so that old assumption is
not justified.

Remove the comment together with the no-PCM-volume override and let
the generic AC97 mixer code probe AC97_PCM normally. It already
checks the mute bit and the register's volume resolution before
exposing controls.

This change is intentionally limited to CMI9738.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/pci/ac97/ac97_patch.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/pci/ac97/ac97_patch.c b/sound/pci/ac97/ac97_patch.c
index 64cc39dd2008..5e9f70c47ed5 100644
--- a/sound/pci/ac97/ac97_patch.c
+++ b/sound/pci/ac97/ac97_patch.c
@@ -3002,9 +3002,6 @@ static const struct snd_ac97_build_ops patch_cm9738_ops = {
 static int patch_cm9738(struct snd_ac97 * ac97)
 {
 	ac97->build_ops = &patch_cm9738_ops;
-	/* FIXME: can anyone confirm below? */
-	/* CM9738 has no PCM volume although the register reacts */
-	ac97->flags |= AC97_HAS_NO_PCM_VOL;
 	snd_ac97_write_cache(ac97, AC97_PCM, 0x8000);
 
 	return 0;

---
base-commit: 116ed8afab5e3217561a6a8bc4ca1c3d5d97830c
change-id: 20260429-ac97-cmi9738-pcm-volume-898bf48a92dd

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

