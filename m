Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8659418C01
	for <linux-sound@vger.kernel.org>; Wed, 24 Jan 2024 10:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706091526; cv=none; b=jcTjkO03FUNI9TcbOrVCtSu4WLQIYCAL0+zIVd/Ezu6vQH2DFf/pJly4rvSMxcvYB5gedA5pPdT8VrWAMiwYTn7BIb3oExMIoRnZPVYiE1P1A3S8QsJ/G9ad033+nXhcQk+chErH7XTd9E6BNP+TaRmKiOQdQuvvv2ALZ45RQMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706091526; c=relaxed/simple;
	bh=UGplCZmun1yoI+gXdft13mDaaOZE4pn5q5hiv/4NS4I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NRZ6NidWqhCgXaQpVwfHYM/oAsE7sJ6g9RuZEm31/khixWK1Ha8FwgNc6UhWGwtaPAvp08b4dO8w41Du9n492q7A4QFp7Msm+IvMLP2P1TiTStsd+2ci6DroV7GU5VbEZCxuU7GeWUpJzPnE1DQK8bAWWpxOez5jPJWdLfMANPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=teenage.engineering; spf=pass smtp.mailfrom=teenage.engineering; dkim=pass (1024-bit key) header.d=teenage.engineering header.i=@teenage.engineering header.b=PjQtrNCp; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=teenage.engineering
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=teenage.engineering
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=teenage.engineering header.i=@teenage.engineering header.b="PjQtrNCp"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-50e5a9bcec9so5968122e87.3
        for <linux-sound@vger.kernel.org>; Wed, 24 Jan 2024 02:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teenage.engineering; s=google; t=1706091522; x=1706696322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RoEmXBdTZowDbdI28xrCKiMvC2E5+awFrQdOda2WkJM=;
        b=PjQtrNCpTttTa7az0Y+SoJ9HRyY6Ej+H4FEilwYfDXvhFVknQMUQfuXlTBoKwS2Oxa
         6DcbgAO+iHE47F4ESb2/+GX7t6YU6pLDiztxYshOQiclXjwWs4R7z5+WqYk21AmNeRvk
         tD4/EZBNqXAjg1XutTF/EAJPdcJ5uT1reoygo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706091522; x=1706696322;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RoEmXBdTZowDbdI28xrCKiMvC2E5+awFrQdOda2WkJM=;
        b=T2KlkRKjGwMZ3CTXrKCzxQBRz5WOQuhF9T21BxZ3NI2xCuZ3HvFBypqD1JZQ1kN8Wc
         5IAyfF99AF9LRBB5fC3iIJIFrFLwqDhrPWEjqpcfZAGLiMxZGmXA5k9cevz0skywjC7B
         OmWleT1yaU/f7D+IbUymP+XXmti92VQCh53JGs1VbDO1HjgS33tDC2kdyWqfNCQtTUcI
         kNW/+HJ3KgLLlU35ZHrh9fM0s4gLfFqnoe/YfyWmhrqsBTkZEIUnewpd2MwifJ/mhRDf
         s0GmH1mzD9WfEb9XazuRVdx9jWMs/poPjXRJZM0r4+pilSMoS+PqtCobY1KsiXmKjqK2
         DfMA==
X-Gm-Message-State: AOJu0YzSS65SdciqJACIXMsH4Wxwwx7sYlhLG8WPQPwOGDb74NN7RHmh
	61nlt/dUA0bwqv4tnzaHBIXVXItQSFhhQmlRPnxiIj0shw0dKYJ8TSU+bnRcv3nJ7AMX06WRXZM
	=
X-Google-Smtp-Source: AGHT+IF9l2TJ1pFfVnfHCJn6wBUKEr5Y6SGpDK5M+4uq4IAO+H69qWPMUUzyfAVYklzWzbo5TRcuOg==
X-Received: by 2002:a05:6512:b29:b0:50e:75ee:ec4c with SMTP id w41-20020a0565120b2900b0050e75eeec4cmr4672548lfu.11.1706091522467;
        Wed, 24 Jan 2024 02:18:42 -0800 (PST)
Received: from localhost.localdomain (c83-190-78-129.bredband.tele2.se. [83.190.78.129])
        by smtp.gmail.com with ESMTPSA id i9-20020ac25d29000000b0050e6cd42830sm2530246lfb.181.2024.01.24.02.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 02:18:42 -0800 (PST)
From: Jacob Siverskog <jacob@teenage.engineering>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	Jacob Siverskog <jacob@teenage.engineering>
Subject: [PATCH] ALSA: usb-audio: fix typo
Date: Wed, 24 Jan 2024 11:18:24 +0100
Message-ID: <20240124101827.35433-1-jacob@teenage.engineering>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix typo in midi fallback log.

Signed-off-by: Jacob Siverskog <jacob@teenage.engineering>
---
 sound/usb/midi2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/midi2.c b/sound/usb/midi2.c
index 1ec177fe284e..820d3e4b672a 100644
--- a/sound/usb/midi2.c
+++ b/sound/usb/midi2.c
@@ -1085,7 +1085,7 @@ int snd_usb_midi_v2_create(struct snd_usb_audio *chip,
 	}
 	if ((quirk && quirk->type != QUIRK_MIDI_STANDARD_INTERFACE) ||
 	    iface->num_altsetting < 2) {
-		usb_audio_info(chip, "Quirk or no altest; falling back to MIDI 1.0\n");
+		usb_audio_info(chip, "Quirk or no altset; falling back to MIDI 1.0\n");
 		goto fallback_to_midi1;
 	}
 	hostif = &iface->altsetting[1];
-- 
2.43.0

