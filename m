Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805A64A13AA
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 16:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784046905; cv=none; b=dezK8o5Qk5Ne6k4ddcKzu3QSrYV+2STiodOlSdpgdQkGSx1fD+WK+64CFDc9JdkdYoICQGr82AM+DdDaXKzovXPMD5ES77cDLKKqhZBd/K80PzTCwd3vkQnxXihCjkuwYHq6RScItZh6tqyqSVrybyRPtKjaE3oEMrap//xpnAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784046905; c=relaxed/simple;
	bh=KSbjRr456blZzse+yMVlwf0N6zw34OqPD9RMQG5WAO0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HOKvwZGa5SH7l+5/vKf4wtEYtme7Mh6fqUzfE4GYqzTrqN6zLsO99mj+F4oDHKNe3kPt27MMd1GSw8QOvi/gLA1gt6VHevXZArO8+KxxVZ4FDRcs7Ziz/QWnuHlQkp4HdGRqK4VKa27tjwqp2e9qgoXqD1jQkqTBT9pFzDn/0nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ULfrO9oC; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ULfrO9oC"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47c6e9a694bso2512463f8f.1
        for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 09:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784046902; x=1784651702; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uf0gaGl0whSy4I1zhkPo1jGCzqq1JMGLNHicB43ROvw=;
        b=ULfrO9oC/KR7AELASC9gmTB/wvHt3G41u8FKDvhzKDBnMTU1ZyAOHcXXgOalmwH25J
         vqCRRcRO6roUlpdF38IzYP5MrbIZkqjv0Iu8hK1pqJoLWVD5T2ef0XfZ53oE0F9S3JJL
         WYoiuKkBthC3h4oOGrMS1DK+6lJMU6tua1xj1Yv5OxpC410HQMCvVXs9RZNxOowun5kI
         CTBooyCH1xOx+HnYKl8ozsA70fj/6iHuv285RXV5XRAqUbq4boGiXDMQ3GCQ8z1OAHAv
         C894GCDKDTPozwqkzdYHWW6y3z+6e5+kdglUwl1vCp8P0hBdunRDwTKhMl+GMfjC6uY0
         7+5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784046902; x=1784651702;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uf0gaGl0whSy4I1zhkPo1jGCzqq1JMGLNHicB43ROvw=;
        b=C92sprYN7gTVkQV3XFKkd/jIWN4A7Bfsie2bVz9XaB4LbLwD0dvO2okJPriHqvoiex
         rGuOdrskwlNEQkcSjmDrEMoeKESAoGsIFj/8zkah3z3eZ6oXUT/j+fNtm9TxT3bbhQC9
         b9F3xN93e7f/hJqHhNd/Pn81Xh16HnNI/xD8HnXxWajNqAqWmc/BfnnlU6tLCeGOjd0W
         5b1+Y3MwQGptyJBHjZGd2PKU+TLjBeXEFsyP3cTZjn4Q4Hp6XiRZ4GO8mVrPcE42P79N
         dJgbGEpE5FatewtrcvOg7e9r4oVWEN07n2GLbnBTXvYc7pH1lAYBdlkVfiHPbzNScbZA
         2tKQ==
X-Forwarded-Encrypted: i=1; AHgh+RrAsjsyQpSm0OGwBYPc89CLvJUCNYggqahnEHe52/C2NgUWhBt5Oz7Hu/qTo2EVN61uHmWLjSt2vtNzRw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6kRL2N+t4reMX1RRUY/vzFeHN/8/qVnuwXv9h/+LNHhkSUUSv
	EJ+El81KMANR/AIAJBJafj9yhVfU/QHuZJZjAnIFPOayPbU3E/Rs8qrZ
X-Gm-Gg: AfdE7cmoUc6LDhSY0ZIAu60LPN245yAELgDIwD8PhI7v+CqnDBvet9yQIV9OzO6SsXN
	l0mMvcWSB2MZZ4Dyok1zcfBYeQyB5+cnesQeLbTB3dJFXEg2I1Ei9geHitggIG5y4YFSjtYMLEj
	LtRMCNNmj6M2sbkOjuId4RFR9dF3LxQHN2Tr7tj/LAJUA6uaEwnEz2nk/y8fPF3cKdBm++sR4TX
	yYZHypyA/TwgLKxXga0QNUZdCuPcm25NvBCTiP8W7WNsXWFWILh/UTe/nYiIRwFqcyGr+OiO4pS
	11siyvDDd+TtcTjAMHMajyWHnYElzqOo0z/SvYGRewQuzi1Yr0uXJFaYpBySqe3ehNtA/xKyzFt
	tRIBbu7tjXQ60cEP28bs/UhdEgAhnffMaZoTGQysmW9LtWPxfHDcezg0wdqajB6wMSJ1k660quq
	g1AKjOOiwJ/oXuOg/m12xsqQ==
X-Received: by 2002:a5d:6f02:0:b0:47f:4c5a:dc76 with SMTP id ffacd0b85a97d-47f4c5adc92mr2090012f8f.56.1784046901581;
        Tue, 14 Jul 2026 09:35:01 -0700 (PDT)
Received: from localhost ([5.83.201.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464c89e5sm9262117f8f.34.2026.07.14.09.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 09:35:01 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] ALSA: aloop: make read-only array texts static const
Date: Tue, 14 Jul 2026 17:33:16 +0100
Message-ID: <20260714163316.183165-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Don't populate the read-only const array texts on the stack at run time,
instead make it static.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 sound/drivers/aloop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/drivers/aloop.c b/sound/drivers/aloop.c
index 236f49a7fb8b..7ebe8e5c9303 100644
--- a/sound/drivers/aloop.c
+++ b/sound/drivers/aloop.c
@@ -1668,7 +1668,7 @@ static int loopback_channels_get(struct snd_kcontrol *kcontrol,
 static int loopback_access_info(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_info *uinfo)
 {
-	const char * const texts[] = {"Interleaved", "Non-interleaved"};
+	static const char * const texts[] = {"Interleaved", "Non-interleaved"};
 
 	return snd_ctl_enum_info(uinfo, 1, ARRAY_SIZE(texts), texts);
 }
-- 
2.53.0

