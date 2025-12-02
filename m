Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122BB2FF652
	for <linux-sound@vger.kernel.org>; Tue,  2 Dec 2025 12:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764678993; cv=none; b=tl61bl9sRSUq2bByfq0z4DIjzQNAAKhUPoUXEWsuwgj7K7EUFwhIOatQw9joRcodvn2t6ptvXyswJGXmi/6ptQaChz/s/lB66Oo/AlkBqfEahcX4n7B9mZkyTWAZcNiTNqoMt4XnYE31DO/HKe3aKFRlCa0BQlWestUDxpBmprY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764678993; c=relaxed/simple;
	bh=KlFP20+jcaikf3BJwcMvshKQ8lMk1k7mDbM9wEuTN54=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oAmxdQvfx8I0OQfzFYVX+fWgd/0vdr+JGZryrFQJcHotX2bHevuE3mQwYOm9qEpuPsafdbvYJyKWNy4/vEPpqBeJeE3W0TlHxVfI8ExndkvtuEjqvNd2btgAuzNQtl+5mSVvarqG8IUNi9PlhNeN1YBK9309x5+hf7QImXN/uvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=TCXHyexU; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="TCXHyexU"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-644f90587e5so8467216a12.0
        for <linux-sound@vger.kernel.org>; Tue, 02 Dec 2025 04:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1764678989; x=1765283789; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xCTo4//AjXdaYBk7ZS15sCHrzYs1cUB5MJDGYdro+NU=;
        b=TCXHyexUC0qpirFSSpC2xYWHYw0G6oQIRB4d3+sPRcwr6P3pKEK1QeQfBPJlsvCRdb
         iTrzPbnKngYo4pGZ1RxvUo2n4V+smMIVW/Ir1Bl6D/+032E2Pb1l2/EV6n715mrQhO7l
         xRBt+z1tAuHpmw0T11cJ5Q3YWQyOYw4Ozuh290S+N/Y3NAeTsxqAiJbOMwQmmspGKV55
         h8kpsUN217X6AOqzqKJ9p3YLLlkW2JrGxQ8I28SrCjciSGovpaXOorAAlU9pJOGYWAzS
         Wd7hGbLFyIDkbx8uoqezrBmeP6WcpuJOXbOUf6rn+AJ95+NuIOEWMoVRFHEzmWqcXurX
         VoQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764678989; x=1765283789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xCTo4//AjXdaYBk7ZS15sCHrzYs1cUB5MJDGYdro+NU=;
        b=pJ+7ivFZaK6BfjgBeN0hhKZhXgx35jwkvwpXH6dDE1PVs7TRtd8sfkKbq1mLwgj1Wa
         CCErgPj8GAEAPHl5mJBu+GyA+OJIgUTAvel8fXpTytvX/cOaGQgwtHDlsTAi2EY9y/Se
         RvVxzrhwMpYf43BD6yhbk2Y/J1YxKN4huoUaJEATz+x5I04BSdoMOJmIro0SRMJ+KQyt
         WPNE8bP//NIPrfqKABqH56lc0WXremWPk0VGPkSPDMg895mNg772QZiTQEF7ct1+PfJV
         DvjNqBxf0jVbY2qK2oyFxLb1D6W9DM3uSHPudDzJeE3/kC34a19qocd9ny9qhPUUYluy
         UO9w==
X-Forwarded-Encrypted: i=1; AJvYcCWfXzR/HtYb7TCnIxzhAc/Vqa3zCME+js03Rmov1jDuORMrUUIkw+UaNiDdmr7S16FPOdvtQUVm90LTfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDksRxYKyOITtxSjqH5FkFJu+hUT17P9swjKxQHNdgBJBmi58K
	Z1VrJHb1lPgbtOZ9KBt9HPxMtbgEKf2fN5qSu/YXcsvYiXu7H1fJtesvztBJZzYE9l0=
X-Gm-Gg: ASbGncuhEJdmowOWIc4N1VtlvOqKpk0PEqgfltJ2JixVcDvo0NspVKE8LuYkF4XhsH9
	27OS/xHqOMSL/bE2IVlLClqjrilEOp8sUCqZUwSPDOyxcfcPWt3GuHkdU/KtLkHYvz5na7O0Kcl
	As6nv8zQHnRp48NkY1S9c8ulUZ8A+BWZMoERDxjG2I/42jtF3eWzrjy9vLsQK3ndCnEh8pTGOff
	ZDnfKYEElsGrNifzSGMxTffsh83jbZPgyepTlcT5s6GrXrhn1tFVvL0Yip1Q+GRFyVi5nXGdv2V
	/XO23GG5R/pFp86qDK7DLB+IPatSUFMSzf+INFCKyJUiinpMVYGyGklOPQrE3Nqddn7juz5BjDq
	qKbMzAzvOyObWY6brg97aVi1Vbig3qVQtSFerFgYwaSZ+1R7UxS5zYQjvmdjE6nVF+5NRz0I6Xh
	UDWv3/kk62gOmsj7kk5GV7AQ0PPVR3rMQmHMUIM65/6Bw4xBgxjCvPxUd7E9/zPnE2xFsVZzEkO
	8c=
X-Google-Smtp-Source: AGHT+IHs2pCq4GvhkQpIvd8NhluEXGmlC3Ri5Z7e+XnvMkVl2CFOrgvMbf1A3X7qBJrTAsK68VGrFA==
X-Received: by 2002:a17:907:3d90:b0:b0e:d477:4972 with SMTP id a640c23a62f3a-b76c54090f0mr3128343166b.25.1764678989338;
        Tue, 02 Dec 2025 04:36:29 -0800 (PST)
Received: from localhost (p200300f65f006608c90d1d7fe637464b.dip0.t-ipconnect.de. [2003:f6:5f00:6608:c90d:1d7f:e637:464b])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b76f5a4a652sm1533495566b.65.2025.12.02.04.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 04:36:28 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Clemens Ladisch <clemens@ladisch.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-sound@vger.kernel.org
Subject: [PATCH 5/9] ALSA: opl4: Convert to snd_seq bus probe mechanism
Date: Tue,  2 Dec 2025 13:35:54 +0100
Message-ID:  <24b2d122830599b96f69fc20386f5830c758e840.1764677854.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1764677854.git.u.kleine-koenig@baylibre.com>
References: <cover.1764677854.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1658; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=KlFP20+jcaikf3BJwcMvshKQ8lMk1k7mDbM9wEuTN54=; b=kA0DAAoBj4D7WH0S/k4ByyZiAGku3TOj1urSKA6801GmT4oO50Tn4/WXpXwnyi/9fTfISo/DJ YkBMwQAAQoAHRYhBD+BrGk6eh5Zia3+04+A+1h9Ev5OBQJpLt0zAAoJEI+A+1h9Ev5OdbYIAIpq svpRXWGmRPmdeqb1qOgBj+Yd73t76Me3r57KHkc8dKG3Dn9+2HNE2m4CvWEiFQUIBDWMf9fNbrV 0bUgqL6PjBh7IU1PhOESzwxuf3m+IyEBabyciseYDgEvy2ffsKtZQUKFEmGkj6G7NlBRIdxcz4x DS0IQz/cHZWPvPfddsJHnH0Od2IaC8qgFyAF3gtzxYrUHbQ9tbE08K0GMurNXXrndQqkn2/VGge ImB08Hvz54P88QBetL1YRafKZdta00yLFtVuRLv0JpkScCGurndH1DGZuS+ZSx9aW6F8KZiKOFL EcCESslqzfGF1DzZouPr9S2kqsnsC0kzA+2LHEw=
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The snd_seq bus got a dedicated probe function. Make use of that. This
fixes a runtime warning about the driver needing to be converted to the
bus probe method.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 sound/drivers/opl4/opl4_seq.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/drivers/opl4/opl4_seq.c b/sound/drivers/opl4/opl4_seq.c
index 7bb22089a093..043c537be293 100644
--- a/sound/drivers/opl4/opl4_seq.c
+++ b/sound/drivers/opl4/opl4_seq.c
@@ -118,9 +118,8 @@ static void snd_opl4_seq_free_port(void *private_data)
 	snd_midi_channel_free_set(opl4->chset);
 }
 
-static int snd_opl4_seq_probe(struct device *_dev)
+static int snd_opl4_seq_probe(struct snd_seq_device *dev)
 {
-	struct snd_seq_device *dev = to_seq_dev(_dev);
 	struct snd_opl4 *opl4;
 	int client;
 	struct snd_seq_port_callback pcallbacks;
@@ -175,9 +174,8 @@ static int snd_opl4_seq_probe(struct device *_dev)
 	return 0;
 }
 
-static int snd_opl4_seq_remove(struct device *_dev)
+static int snd_opl4_seq_remove(struct snd_seq_device *dev)
 {
-	struct snd_seq_device *dev = to_seq_dev(_dev);
 	struct snd_opl4 *opl4;
 
 	opl4 = *(struct snd_opl4 **)SNDRV_SEQ_DEVICE_ARGPTR(dev);
@@ -192,10 +190,10 @@ static int snd_opl4_seq_remove(struct device *_dev)
 }
 
 static struct snd_seq_driver opl4_seq_driver = {
+	.probe = snd_opl4_seq_probe,
+	.remove = snd_opl4_seq_remove,
 	.driver = {
 		.name = KBUILD_MODNAME,
-		.probe = snd_opl4_seq_probe,
-		.remove = snd_opl4_seq_remove,
 	},
 	.id = SNDRV_SEQ_DEV_ID_OPL4,
 	.argsize = sizeof(struct snd_opl4 *),
-- 
2.47.3

