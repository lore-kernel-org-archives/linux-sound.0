Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2ADD20A5FF
	for <linux-sound@vger.kernel.org>; Tue,  8 Oct 2024 17:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728409353; cv=none; b=COP0P/lvcDSdNrMA5liBSvoTxN+U2xUw3o38D0Utx+/viVssZN/j9lfcs/IieIVubCPj67atwMD708i8zJW/OOftIszwh9RDDBrxgu9af6QKhDX6x7O9Vy1el8gjX5C/WapJ0LTlKsrT6Opn395WM0kduDB7oPJKdZ8DFOlAx+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728409353; c=relaxed/simple;
	bh=nT4KIH53aTZyRAzIGhljOBBqba1mX47mVRjQ/Y1ohBg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eTz+IslD7hVXWM06S6lX1NhC9Szfm0v8Ed8KwWqLhkdIals75MbDs7NISqlhuncsaYtTQDXHNkToDIV1yBjw55asnr6AFw5EmT0uCY8uuoYr4FwPYxlJrwDjJEwkIMWGCWtjZPqciLakYZYl+BvUAUNpQstj+eaCBT1itsozrBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everestkc.com.np; spf=none smtp.mailfrom=everestkc.com.np; dkim=fail (2048-bit key) header.d=everestkc.com.np header.i=@everestkc.com.np header.b=H4hHv94/ reason="signature verification failed"; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=everestkc.com.np header.i=@everestkc.com.np header.b="H4hHv94/"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3e039666812so3201242b6e.1
        for <linux-sound@vger.kernel.org>; Tue, 08 Oct 2024 10:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everestkc.com.np; s=everest; t=1728409350; x=1729014150; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VN7nq27/Zc23ABcQ/rS/ZQA8gDRSyDCq3NgiP8/pXfg=;
        b=H4hHv94/2XCim882rEr6k58p8KBaJ5uBCSloNy4vPXa0BSEtliDsXChFK/wm9cIkR6
         LyV9Pw+eQX0eJ3ES1lGZAHRynGLYcFm02Q1I0eYjIuKruIsEcuPpdhqNsLh8syo0Hazf
         9Z0vpFFUw09jv5atveCeAPo+vZf6NbqmrIre4PPclLGsRkSeRZFJEfl9WY6l+X6lgyB6
         dJApqOaGLs6rCEn0PMhlpWX0B5kmsNCvZqUe3NHm/617dBQ+2eIz2R8PPWpp3wja+v2U
         sQgC+6PqnksSym6+8/MVJtWyNpSDWhEECh0SZqcTSwybK6/N3EaaFYQsx9UsMMDlx3qj
         R+4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728409350; x=1729014150;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VN7nq27/Zc23ABcQ/rS/ZQA8gDRSyDCq3NgiP8/pXfg=;
        b=KUa6NDN7y6AslcmRyaOEEghwlfXfeMnfL7e+8jhpurOrr2h0ATIzvVyVMhJK3sGERP
         BhA9xLgysXJHZ5lIu81vFhXbdzZNfat22bNCV/gb7DrBPj0PnkoM12tb41Sfb8aI/qJC
         06W84nk/yNDiihkSuTsAktGqd4cMvHHwJ6RWkTZ8w3W1e5VDCRB17P0ZL97sVuvagX/6
         iBBr5ngNLKw798sIomkfc0TJRRbJQXJDPxXJIz0VlQMnfXNHjQQr9ijTsz06Gq6fJ/d4
         gqw+nCuzANym6q9v8d3/FzkNFXTKc206I5ywaeoPD+99mjpxLyprCwBp5d4Z6BdGu5jS
         7wEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWS8K2HBQ0Ms83bsq0cOE0kZl3DkeIjmgjsyJn5+UyzqzN3CA5r93VWKOQmfosEUy2Vnsn38TkfOsPDwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5DnN7f71cMoZT1ixVtOEOceSfOYgHEwlg0GxEWqs8MH13Qf26
	z5Ql1zcUrHwoyf8LCwGOH7qupWdLp4d3teB5SX0y+uan258hdaXFWuzK/FM8+dk=
X-Google-Smtp-Source: AGHT+IHUKizUM0XF28YwJfMVg0EB/GPiE3Ua/dfgDBCYQd/B33n6P3+z/RmZ8Ak3CsjiAirh8QorjA==
X-Received: by 2002:a05:6808:22ac:b0:3e0:4aab:f5b2 with SMTP id 5614622812f47-3e3c1337d46mr16697655b6e.25.1728409349897;
        Tue, 08 Oct 2024 10:42:29 -0700 (PDT)
Received: from localhost.localdomain ([132.178.238.28])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-7e9f6833e45sm7069867a12.54.2024.10.08.10.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 10:42:29 -0700 (PDT)
From: "Everest K.C." <everestkc@everestkc.com.np>
To: oder_chiou@realtek.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: "Everest K.C." <everestkc@everestkc.com.np>,
	skhan@linuxfoundation.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: rt721-sdca: Clean logically deadcode in rt721-sdca.c
Date: Tue,  8 Oct 2024 11:41:20 -0600
Message-ID: <20241008174122.4696-1-everestkc@everestkc.com.np>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As the same condition was checked in inner and outer if
statements. The code never reaches the inner else statement.

Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
---
 sound/soc/codecs/rt721-sdca.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/rt721-sdca.c b/sound/soc/codecs/rt721-sdca.c
index 36056cb7a3ca..4fd26e490610 100644
--- a/sound/soc/codecs/rt721-sdca.c
+++ b/sound/soc/codecs/rt721-sdca.c
@@ -611,13 +611,9 @@ static int rt721_sdca_dmic_set_gain_get(struct snd_kcontrol *kcontrol,
 
 		if (!adc_vol_flag) /* boost gain */
 			ctl = regvalue / boost_step;
-		else { /* ADC gain */
-			if (adc_vol_flag)
-				ctl = p->max - (((vol_max - regvalue) & 0xffff) / interval_offset);
-			else
-				ctl = p->max - (((0 - regvalue) & 0xffff) / interval_offset);
-		}
-
+		else /* ADC gain */
+			ctl = p->max - (((vol_max - regvalue) & 0xffff) / interval_offset);
+
 		ucontrol->value.integer.value[i] = ctl;
 	}
 
-- 
2.43.0

