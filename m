Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E429D3ECBC4
	for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 16:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776185284; cv=none; b=fs0dUKvPVDk06NTI0W9i/L23OKgySO2jChyAU1hBM9ugk3W7MZaAfmca6sh/8CbVd2ks/okWH9xO4+NtzOc9sSxW960T94kD9Zu9JnQOCejvXmzyMJWMBpyifWg06n+lCoLq/wdhNfVUW3U2Zk6ud3i3v2DjV57lJvq+R3FSdLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776185284; c=relaxed/simple;
	bh=BR6lNaL0dpczfNY0DDA2VV9Rl7s6QrNzwi5PGT0ma9A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mgvwF3GeOeEJ8zaTvyXYCfrS0WDG2pesJE4rlJe7hXxZBPvi5dmk0Xd+ziLzMLux7sWwmnUaXMMY07WL1tMbNg4llhQnRcdja4/CebmK+9PK/JzsIF/h8QwPoY3dtcVXyEuPRlBEqvxlW1GyTqaCn+NPUJPFLVIIM/sVM2wB8UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YbR9CDDz; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YbR9CDDz"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2d52c7f92b1so5071830eec.0
        for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 09:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776185282; x=1776790082; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SGxPjE4cek659ARboO+TnX9v39S7D8OJzTJI+xZg2Gg=;
        b=YbR9CDDzLW0gDhSmOoO035qB1OPL0S1BK2JlyRggtsrw3xxosyGfOtcDPCkOH9R8OZ
         nIn1IhRkWLuoCNOdhQLIBF7aVAhjGbgTSvdPTbEZllDpo35ayeoLf/AvDnXMxTbmRwO+
         ds/IqG21vtMuNAu4y34e35qzAsDUC8gr/Yr/wQUNrGoKUQGESKBvBeyDPFzDtJqVdmM2
         /XQHhg53BMWhap5skwIBqmig+stP/23oefrIQ7OsqInKKu51mxC0ZZmdKU1fe/LTScdN
         if7F2H3zmR0EEKC7S/gX/POiDG4b5qoNkAuEwFxQBh1O1rqz1kTyeT5c3v4StyVqZM5s
         Ew6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776185282; x=1776790082;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SGxPjE4cek659ARboO+TnX9v39S7D8OJzTJI+xZg2Gg=;
        b=bM9Sv2E5OjAsu1ueYfLEgxb+yUGpps8bgcSy1+uhKTwKtiqpu5XA/jdtUe8skFTrvU
         fz3njfhuT0AACHu2eTdAIxWPlSkmmU5ihKMvOAaUhpl+VPuJYBIpxbUZIUdbLJB0FolN
         L0KbNty2kzl7Rue3iNiRQmggy7YlzjE7lKPaKPIrGanU21NT3peWuVNlfILec+/TI984
         BYaqV/sWAQpEueruUxi7VKt6I5z49bUzZymfvyx+irI1MrMVoVgXUk6tRNQwUxye2ju+
         LPH1SSzst2dlhrFt/Bvio05t2k5AtkYPcY0lXOHGNdzw7KuGaRm6lU/+WwDfNutMHjgR
         uaTQ==
X-Gm-Message-State: AOJu0YxphfXtCeWYjkL4BmsvuUdpbbjHLT1udgs5byokKZxvBzrU2kJ/
	f8Aq7GhxxfbQpAhDuS47EVmmFpdg/gVFom56SiEb4V2ki5bn7P6q0dOM
X-Gm-Gg: AeBDieuJLC+dzTHGV/5QOvp1On35qXzSDUzrumEvtklykSfuw6tQJxQN1Skofn/3PiB
	nlbjF3NPJi9BZMW+9QSTTZoCqmJpASmnXs6ClgGfd65hicY28HgZobvBtwxoNdrh0Sz0d6OIeWe
	/tezZRkRAmFGy90+C9ovsruqGueXCGtuZ3b2iXNTpIACP3RZs0NvRJJXp8IPTjv7YAIJ7fe4/9F
	ttTZu1KE7RCcD/LhZGtYHha8D33ajebfpH+95hQ2GEaa/c6Sek3nyZK+NSKj0EEt5TIWYv6ovj2
	y9x9N2Z9lv4pq1P69sMv7VqVzvqvp+KjmgAEaKVuOKo47nBnLqlwtubZwe5iCVO6oyY7AgKyoXN
	gq15HqIbgMML1ZGBPTNmwIZaez0jChturp5+Mne0ai+UbaY2ZTQZxs4ZB9VgXdbBeNmEFDP5pmo
	VPJoWvrbYgIYlbC+ffExaPNfBE9B1WgSsu5v3HY7bhE82FPH065s+F/qdaJokHzM3L0OcnJ+8da
	3nr
X-Received: by 2002:a05:7300:d70b:b0:2da:9a3c:8062 with SMTP id 5a478bee46e88-2da9a3c91a3mr4007238eec.17.1776185281993;
        Tue, 14 Apr 2026 09:48:01 -0700 (PDT)
Received: from [192.168.1.18] (177-4-160-195.user3p.v-tal.net.br. [177.4.160.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de130e056dsm558584eec.30.2026.04.14.09.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 09:48:01 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Tue, 14 Apr 2026 13:47:53 -0300
Subject: [PATCH 1/2] ALSA: compress: Use EOPNOTSUPP for missing pointer
 callbacks
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260414-alsa-compress-pointer-avail-errors-v1-1-f5a1a8b1dfba@gmail.com>
References: <20260414-alsa-compress-pointer-avail-errors-v1-0-f5a1a8b1dfba@gmail.com>
In-Reply-To: <20260414-alsa-compress-pointer-avail-errors-v1-0-f5a1a8b1dfba@gmail.com>
To: Takashi Iwai <tiwai@suse.com>, Vinod Koul <vkoul@kernel.org>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=966;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=BR6lNaL0dpczfNY0DDA2VV9Rl7s6QrNzwi5PGT0ma9A=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJn38vd0HeLaZWJgXvOVM91ZTX/SyvMNreHWIZs8duW/T
 N0c5zqvo5SFQYyLQVZMkWV10iLLPV0PrtbHrfCAmcPKBDKEgYtTACZyy5Thn8mF6a95/8+vPbff
 h1Nu9Ux5zhyf5glL/zzKuSr0Ja6j8wUjw4Jug06BcttNL33kWE7kdrx7uXm16Ka6AHvtKvNHN8u
 X8gMA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

snd_compr_update_tstamp() returns a sentinel error when a
compress driver does not implement the pointer() callback.

Use -EOPNOTSUPP for that case instead of -ENOTSUPP. This
keeps the behavior the same while switching to the standard
unsupported-operation errno and avoids the checkpatch warning
about ENOTSUPP not being a SUSv4 error code.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/core/compress_offload.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index fd63d219bf86..e3239c739d34 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -186,7 +186,7 @@ static int snd_compr_update_tstamp(struct snd_compr_stream *stream,
 	int ret;
 
 	if (!stream->ops->pointer)
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 
 	switch (stream->runtime->state) {
 	case SNDRV_PCM_STATE_OPEN:

-- 
2.53.0

