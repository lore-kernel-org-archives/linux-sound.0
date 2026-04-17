Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAED2C326D
	for <linux-sound@vger.kernel.org>; Fri, 17 Apr 2026 20:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776457829; cv=none; b=pK34cznPfreNoD196UGx8En0Cw6kUgh5iOkCYIW1KH/gqnirPm7DxzNJf+Cs/JAwgFf2JjCzJ34m8OTOJp2yUTM4K38UevQXvVU+ciP5IN4W3TC6popsiiwQci94AJ53J5aJEl9CgtbBLNdtcW0i8N1e1r+ZrCsip7bUyvOLNJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776457829; c=relaxed/simple;
	bh=5sTObtWVavIsLnoazVn7kvfECAUQqVeFO0fIJkuv+e8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=B/KF947DUiu+TQXqqhJUIeG2vG2K53IhTRNSpDrHjCWAL91nIvYs89oeTgJ9u4553auoHABlqj0OsJv4fFze0FllW4clP+ENGoq9mZkHTeY6FGqHQYVTgZBqswDyloGKGZQzHPjYRYHkhtO36PlKoGDujvbduQ29S72VqBJSG6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FFeprpc6; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FFeprpc6"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2c156c4a9efso1408867eec.1
        for <linux-sound@vger.kernel.org>; Fri, 17 Apr 2026 13:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776457827; x=1777062627; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BQajjHfEzxE/WYi+VB0RvtKv49hMc9n/E/8YFXOSDFo=;
        b=FFeprpc6sz0J7d0UrvsZELpq/rJqIag61PiIYBzwDy1EwXpc5ZijSEkCqiR6DqhANl
         Y3955a0VL30LU//iwOCscv8nU9Wt1RYWw5oIXCXG0r7g+Zf5QOWh7fxEcQ/LSVnL+0S4
         2y7xXC/QmUOfMnqv7geoqH5fdMxo+SEzzVV25QeoNNOZXr06+9k22Bl4W+WJ5oEBbKaL
         Q5DaA8f+FXIXnRdfEpZVTMjQcyfLixdk61c4LsP77D9Up8HcYGqBSPHxffmGDwZVJA2h
         AntGXk1iRcZeGkMLSfKpdJQVwcj/W1iiZREVbsD+kpuAkA29fi/IjWexaJmnKOvmbziF
         LMWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776457827; x=1777062627;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BQajjHfEzxE/WYi+VB0RvtKv49hMc9n/E/8YFXOSDFo=;
        b=sXleRhVwMP4isx5DfDdh8hbEj+2Ebq5wNajmFtEUVsu6r341jMDZ/sVcPv4vik+QES
         UooWVnmA7RUsJnMBx04hXQPFLDPGGfSzMmz0RhuFLGndzGmbI9rRa3gnrL2D3NfIlrcM
         5l4VeIN35/+OUGmz+B47cGNm6Ff9wLUWpit4yKZLZR3NHSPUrkAzi8mMbdJWsPqnCi0B
         jxKJrQa3yl9sy3knIkI6qTlyaF1cfMrra1XAjRIgj5M2xlX0KgyGFJTf571oCfLgjzNm
         2S2oHSaKNptOJJMVLaGfWsC3iGUaF9VT7ZYvq1M66vNEdmrxWLT8stcUHsv9N6QKUIFe
         GvMA==
X-Gm-Message-State: AOJu0YznzrmB6UeOpkVnN+RkU3CgXZ8p+S8PJ+/vjq0fcmNlrUP4OI3x
	tlARog2WQlXO4nB07pO46VmTRBUf8XnRzJJ70ff9Wt12dyRAGCkH43McdoGxsSS0
X-Gm-Gg: AeBDieukOa6IxAOacKczyACLkcqofyLbC5sUywh8th5W7xIlw/l5pJrMEQLH1WG8SXr
	J0oR3JfE1zDCiGoAeUojGCLOJRat0OYK5WIVgCx/Z1dDaenwa9J+MuG1m/JIkCEuLXyM2b2kTJB
	CaHICXlnvwPpqD8eb+pSDhEBu69XoIndjsvTVqdq4Ix8EG55CD1YDkLFPHSr5xxWz8StoMMLYkG
	Fvy1g7cV8NFY5OCJcavmiu6mb/MoFvQeMNWc9HZo2xBB2KiIfZg5iXQieWbWN7im5Q+s67c0lYt
	VrMB+VfmJU7WgTA+kIZSWd7X1L+8r8xyYdmqUKSV5oPzHyAyvzb1DfkQH1wP2j/zG7lLkli12Eo
	7uz3Hugk6Gt7/0MCa7IDRR7iHErj0QyqorSqf1ktj1ON98K+djQ9R74Oz87PEEbxdqBOlo7Q/Sg
	fvzgw7mwoAX89lhR9oltR05nEfC3YcntAl7RfDzLgHBMeqwqWCHXsxDyXFwLYdDSzj+XtC7YyWx
	VLMlj2hPph+gyeakNnDy6i0/A==
X-Received: by 2002:a05:693c:3108:b0:2d8:df01:d9f6 with SMTP id 5a478bee46e88-2e478c20551mr2158027eec.23.1776457826554;
        Fri, 17 Apr 2026 13:30:26 -0700 (PDT)
Received: from [192.168.1.18] (177-4-160-195.user3p.v-tal.net.br. [177.4.160.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d9b0b64sm3603666eec.30.2026.04.17.13.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 13:30:25 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Fri, 17 Apr 2026 17:30:18 -0300
Subject: [PATCH] ALSA: als4000: Fix capture trigger chip->mode race
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260417-als4000-capture-trigger-race-v1-1-daeffc2feb67@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQrCMAwA0F8ZORvo6hjir4iHNEtrROZIOhHG/
 t2qx3d5G7iYisO528Dkpa7PuaE/dMA3mougTs0QQxzD0I9IDx9CCMi01NUEq2kpYmjEgsynFFO
 ejpwJWrGYZH3/+sv1b1/TXbh+T9j3D533mMyAAAAA
X-Change-ID: 20260416-als4000-capture-trigger-race-cc8b2bfd3cfa
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3094;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=5sTObtWVavIsLnoazVn7kvfECAUQqVeFO0fIJkuv+e8=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJmPZsTP2u4X5VLONs/4andxd1HhI4879227K+IsAhrY9
 /3f+s23o5SFQYyLQVZMkWV10iLLPV0PrtbHrfCAmcPKBDKEgYtTACYycyEjw/c1AuYJbe43bRO4
 us5ujdunvl/MZuYbpXmTqlaqSnLO+Mrwm3VJ2OUEwffhe9s5GPx/Rs3iu5Txb8NiholWp0XETfb
 k8QEA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

snd_als4000_capture_trigger() updates chip->mode under mixer_lock,
while snd_als4000_set_rate() and snd_als4000_playback_trigger()
serialize the same rate-lock state with reg_lock.

The PCM core serializes callbacks only per acted-on substream, or for an
explicitly linked group, so unlinked playback and capture streams can
run concurrently.

That leaves two races on ALS4000 rate-lock state:
- playback and capture trigger callbacks can concurrently update
  chip->mode and lose one of the SB_RATE_LOCK bits
- snd_als4000_set_rate() can observe chip->mode without the capture
  lock bit set and reprogram the shared sample rate while capture is
  being started

Fix this by taking reg_lock as the outer lock in
snd_als4000_capture_trigger() and nesting mixer_lock only for the CR1E
write. This keeps chip->mode serialized with the rest of the ALS4000
rate-lock users while preserving the existing CR1E programming
sequence.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/pci/als4000.c | 44 ++++++++++++++++++++------------------------
 1 file changed, 20 insertions(+), 24 deletions(-)

diff --git a/sound/pci/als4000.c b/sound/pci/als4000.c
index 33034e07b3d6..636f309c9424 100644
--- a/sound/pci/als4000.c
+++ b/sound/pci/als4000.c
@@ -421,30 +421,26 @@ static int snd_als4000_capture_trigger(struct snd_pcm_substream *substream, int
 {
 	struct snd_sb *chip = snd_pcm_substream_chip(substream);
 	int result = 0;
-	
-	/* FIXME race condition in here!!!
-	   chip->mode non-atomic update gets consistently protected
-	   by reg_lock always, _except_ for this place!!
-	   Probably need to take reg_lock as outer (or inner??) lock, too.
-	   (or serialize both lock operations? probably not, though... - racy?)
-	*/
-	guard(spinlock)(&chip->mixer_lock);
-	switch (cmd) {
-	case SNDRV_PCM_TRIGGER_START:
-	case SNDRV_PCM_TRIGGER_RESUME:
-		chip->mode |= SB_RATE_LOCK_CAPTURE;
-		snd_als4_cr_write(chip, ALS4K_CR1E_FIFO2_CONTROL,
-							 capture_cmd(chip));
-		break;
-	case SNDRV_PCM_TRIGGER_STOP:
-	case SNDRV_PCM_TRIGGER_SUSPEND:
-		chip->mode &= ~SB_RATE_LOCK_CAPTURE;
-		snd_als4_cr_write(chip, ALS4K_CR1E_FIFO2_CONTROL,
-							 capture_cmd(chip));
-		break;
-	default:
-		result = -EINVAL;
-		break;
+
+	guard(spinlock)(&chip->reg_lock);
+	scoped_guard(spinlock, &chip->mixer_lock) {
+		switch (cmd) {
+		case SNDRV_PCM_TRIGGER_START:
+		case SNDRV_PCM_TRIGGER_RESUME:
+			chip->mode |= SB_RATE_LOCK_CAPTURE;
+			snd_als4_cr_write(chip, ALS4K_CR1E_FIFO2_CONTROL,
+					  capture_cmd(chip));
+			break;
+		case SNDRV_PCM_TRIGGER_STOP:
+		case SNDRV_PCM_TRIGGER_SUSPEND:
+			chip->mode &= ~SB_RATE_LOCK_CAPTURE;
+			snd_als4_cr_write(chip, ALS4K_CR1E_FIFO2_CONTROL,
+					  capture_cmd(chip));
+			break;
+		default:
+			result = -EINVAL;
+			break;
+		}
 	}
 	return result;
 }

---
base-commit: 99c71f13f9841f8c67fa7595bf0834d3045f5d24
change-id: 20260416-als4000-capture-trigger-race-cc8b2bfd3cfa

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

