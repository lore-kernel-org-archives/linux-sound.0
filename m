Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8710321CC58
	for <linux-sound@vger.kernel.org>; Fri,  1 May 2026 17:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777657528; cv=none; b=AjePGvQssmFqlt8qDN4hmC170xvBVTvvu+HZTLT87ehVPNnkL3/9P7PldJn9ZPprL2+ofiO6Rdo8K/cuaGsnGQmx5su1zfx1XENSA6sqNat0Z1tgVxdh+yXBBZjNFVKAhzvxH7gaaIFLReNXzH3vdZUSq5Af8epNFqUIP+BKgXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777657528; c=relaxed/simple;
	bh=Scl+joqX0tx+AMWQx/QuDw81ijXza+FNxi57JtbsiNA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FgShTVXd6drH5AzhMGZfWDqQe0J1vbvY8MEbPUQiLT5NSBBJg93K/+INR3SoGu10kV3v0ISv+63BWx95SPePkc/pN0BJAtntiXZpL15p60GytNwWNadgxgUGVt+Ess5OGa87vOlXHk/1jM8g4NIP8s/l8nN0JnvAL6UDnEzaf8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N4Djss+Q; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N4Djss+Q"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2ba9c484e5eso2436538eec.1
        for <linux-sound@vger.kernel.org>; Fri, 01 May 2026 10:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777657524; x=1778262324; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qoj42dXFE3hTibbCPqdhNWHZyxchsEumCBYSF8/GZh4=;
        b=N4Djss+QY10bRwL4AOWiS+90eqmyDr2gbv9XrIej2dfud5Twn/IUZeL+eH1xnJnC0s
         9VLbL7IfBEXC0Kv4L8iJHkd2b1XwHFm1fNFKQtC3ITp7TNmREMbHVS+NuKIfOEckAXi/
         GEWpdEsh2v9XcR2mq9x3eAwikfCGMNluBygLt72lN+WZbW7xeDl+/sHCSeAthJblXVyg
         orMUDULNsstsGPlxluzIf0cRSqgV+ygmC2EoS3Fhj7biVjb4J5SAt/zo3rT/HHa/nwQU
         uHQ18n9uePfdCS+l85XpXoyB2DydckpzebEg4sh46CHUooYCP8QnGkK61SclhbkyksGu
         xkvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777657524; x=1778262324;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qoj42dXFE3hTibbCPqdhNWHZyxchsEumCBYSF8/GZh4=;
        b=TKa5z/8e4nWHryn4e7fCFgJMgEH6SuQHINAvc21K9TvS5gRTKvh1tixoMTmI3f6pGk
         U9yknRbKqNM1RfyqxEwEp59wQ3V0eW/yFUBTMZARrZ0u33zCmi7D7xZlgNXwvpLqEsw2
         7BiavchczTxBn7+sFXV0WWcOCN8+5ZUd9AoG+mQChwpsCXtdG6ALgmo08oCjEa50Bsti
         FROVL/+NsgjQX1p11UR6bDrqak7P9+b5lshGsbpZHU+zjHf9WGu+V209bTGk+mVn1tLP
         LWkdqoiJ+xSXw4U0NSEOd1Le/uKMJEePePMFhBoBU4+s4kwhsquoLRsoat12I9wyL777
         cI5Q==
X-Gm-Message-State: AOJu0Yw+klabHaqKyHomkEoUvzoelsrkFp4UFNj5Rf/uH7jAd1hLSnYB
	ZvY6rH/qfI0JMBHIxAy1bhcj9Fl+1Cp8U53wgjhI1QcFk2EWCfjqPYEv
X-Gm-Gg: AeBDieuHfp9d8I3l1FWKoIUeBDz9yWumC+ULymlxyGS3fS4IGLj+DpIyK+yJl3FKqdK
	/HuTgrHgyAG3OhulJPVu568K/gcRIsSbrGtGhvmLJV6CNcj4UrSosxHQ/GVhxFZj5OK1ynV0/uA
	X7/Aa2QCH2IJQio+aCfsGTv1sc9wtGP8fIOpu5AlDdsPxC3AZJayezJVdsgQFgL3mFWwT4tDDyw
	b48d+ZElAIAqwWWUrTG/BjqIRET5uPXSZXw+Dwtqxk9Vvt9DXDpcSgGdt+MtW9NqJMZXL/wS/BY
	vcVijnZhYpV4foFA2xzIpANILeOp95bWoXFX5MQFDbOrMGO8Ygg0E2HhuGQQfeYswxk/ir9lZMV
	6RELalQcNuNoxZrorhu+v0NWZPkBst68bBQsCUM2OR3hqxReriM34zy5m7I5KsYsXeZwXBWuNZ/
	XOIjnXe1XKdHiEzvDG2ezfda15rzl36kslQXVQ1YS7hn07u404W+c3T0x+KMluQYrxTDXazLeP3
	c2YuRPy4nVjw56MZOeCFck=
X-Received: by 2002:a05:7300:550:b0:2ee:be86:7b90 with SMTP id 5a478bee46e88-2efba3a98camr172936eec.29.1777657523728;
        Fri, 01 May 2026 10:45:23 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-87.user3p.v-tal.net.br. [177.4.161.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee38d79eb9sm7254174eec.8.2026.05.01.10.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 10:45:23 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Fri, 01 May 2026 14:45:14 -0300
Subject: [PATCH] ALSA: pcmtest: Return -EFAULT on pattern read copy failure
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260501-alsa-pcmtest-pattern-read-efault-v1-1-53e1e8c11dda@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNSw7CMAwA0atUXmMpKeJ7FdSFmzgQVEJkuwip6
 t0JsHybmQWUJbPCuVtA+JU1P0uD33QQblSujDk2Q+/6vds5jzQpYQ0PYzWsZMZSUJgicqJ5Mjy
 Op+S3nviQIrRMFU75/Vtchr91Hu8c7NuFdf0ADKLGZoQAAAA=
X-Change-ID: 20260501-alsa-pcmtest-pattern-read-efault-8b9f131ae7fd
To: Takashi Iwai <tiwai@suse.com>, Ivan Orlov <ivan.orlov0322@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1273;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=Scl+joqX0tx+AMWQx/QuDw81ijXza+FNxi57JtbsiNA=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJlfnm24vl6l78pLz8+fwhkj0tlfvb79uH6CW5Tfejab4
 nLTlRa/O0pZGMS4GGTFFFlWJy2y3NP14Gp93AoPmDmsTCBDGLg4BWAi8V8Z/il9sjpwWOLOffsi
 i/epX7gXnA5pPOn3kZ+z+prMjj8PXHYy/LO+3niV01K53/aNYPV3o5yAvY035vA4ZSn6VGyYMC3
 0ITsA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

pattern_write() reports -EFAULT when copy_from_user() fails, but
pattern_read() converts copy_to_user() failures into a zero-length read.
That makes a userspace buffer fault look like EOF instead of reporting the
actual error.

Return -EFAULT from pattern_read() when copying the pattern data to
userspace fails, and update the file offset only after a successful copy.

Fixes: 315a3d57c64c ("ALSA: Implement the new Virtual PCM Test Driver")
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/drivers/pcmtest.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/drivers/pcmtest.c b/sound/drivers/pcmtest.c
index 5bfec4c7bf71..7f93557b51ec 100644
--- a/sound/drivers/pcmtest.c
+++ b/sound/drivers/pcmtest.c
@@ -679,9 +679,9 @@ static ssize_t pattern_read(struct file *file, char __user *u_buff, size_t len,
 		return 0;
 
 	if (copy_to_user(u_buff, patt_buf->buf + *off, to_read))
-		to_read = 0;
-	else
-		*off += to_read;
+		return -EFAULT;
+
+	*off += to_read;
 
 	return to_read;
 }

---
base-commit: 9e8d6ddd7ecf2ad42d614243f86e50fcf0183b9e
change-id: 20260501-alsa-pcmtest-pattern-read-efault-8b9f131ae7fd

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

