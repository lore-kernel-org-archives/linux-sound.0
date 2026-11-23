Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795428384;
	b=VauqIKVeXI1kWPYeOKEURkOPExH3uPk0Mly+Iszv9o5zOyvDowSdyF0ZZ/hrBtNMQpxH
	 JY0x1TxAliosZj3G3OkK6Vqas/hFbDXA2823oOTfHzU+c5hja8Ew3yV+YJvjeAhdXRcRK
	 AsHCjJ5zvRbq/0zdvM6S1ayG3mn0g8Rs1FT4RP05scAVfVcVKGKUS5bQbaq8H8rCnrZ3m
	 5Yk0moYOAycqW1zE3s/4LomyyWwbUxwmtgim2QsNearEZZNFNy5Xi/6/t6S1UwJQjuS+f
	 6QJ8W1jpw7cuydMNHFMC2LioBPbJkrul7IPjxWfGo0ZapPzB0/7vFNlwPox64Cgp6+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795428384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Qb/A1/BMTIlaDj0IlRnc07XWwEZCqGHcxjA0/m3yjJo=;
	b=dlJ/zgCVVmLYfW4JN9VUb8eMAqsZU+cpSjGop5BtjRreBpHwx6Wv26jy8FZbACE7+WcF
	 VMR3lO2QvQIQ4PIR6NEfTg+LEQlTivGCEQNtSFyqakckT4qjPUeZybAP+h2PIg4zqayTV
	 e+foainti8/rREFpLn348w0queOUhRsfuU9ALXqWx+H+0H9yrEe1ziDSdV5vXY6wIyQZS
	 LHjDc/L/I+PkzgJyY7EJylZXlpDYqb+FO2MSXF/9X3NwiL5GksZA9yocb93Nnc8CwNV1J
	 6WjtlXE/JI/Hrvzzwwkun2r3RgCOrmWrXciLqYJaXTJ1IKnxAW5u23tWO2URofwlpOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Kl02Oyz/";
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4B4606A31A
	for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 10:06:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C4B4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kl02Oyz/
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-386b8f2f671so140906eec.1
        for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 02:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795428383; x=1796033183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qb/A1/BMTIlaDj0IlRnc07XWwEZCqGHcxjA0/m3yjJo=;
        b=Kl02Oyz/tOz3/lYmGLFclT4PQJtcIO7vfdI/lCFYgd0ZDiZRMS+qmNZ3VDCJA4TYNG
         WdmPbfAGA9Oz22cmUhOQjvmvLeApqaBUJGtVUj7srTVi6xstDMePu6zpyji2ztOHy/WR
         al+/hCMJbCJMsrJyfjstNuLJvM7tx/bIRhXe1dyw/Pu/x6B1YNdu4OV+VN65fSjuZfhq
         2Q87zzBWRNPTdxjXAyFviDIgfX/hjlwCbIhBYlIVT1+XZjajY/sbHq+EQJEt6g5krGf3
         qunL7OuobmTN0pGHcYFmrWQn2oswyNQA9njpDP5weonBKRedl+nsiJVwXcpFNFZ9R17s
         2oxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795428383; x=1796033183;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qb/A1/BMTIlaDj0IlRnc07XWwEZCqGHcxjA0/m3yjJo=;
        b=Rdh6ICCtGPSv+BUbWwooMIAP098QzZKmlR3WkPAqf67uCXdJF9PGVaowY5BTubwpX4
         Nc66FWH+FdrGp/PCpLkF1SfajwMsLKSQc0gL8+GEe0OCRPg0ucwQSjG5PDgqtppK2HCF
         warIQMd5tsqVkzrybhdt/r9/6I8PjpRhGY/to86oMLvHB53I65NcOgJc5ZXAJ0bHJnBJ
         PS8BTvZHKLpgJr69taJ0R/vK5r019XSeGmwJDpb8+jy6fCDWXla6jlyLCc7mEyel9ANp
         9JPFXDN4rTJzkoUnpMh85+KW+8Cy+K8ZTbOK7eQO+opI4Y0RgUb+C49JIvanmgC/IPXA
         EkaQ==
X-Forwarded-Encrypted: i=1; AL+hErEaBsk3nSpy3dmPxGy2Cde4LkphoYI175dVIjkJ486Uyu5TvQqyA3f4XCyii+ZBn0ANm2LCRflfCx9A4g==@vger.kernel.org
X-Gm-Message-State: APuU4Z8lGIulXUiqmthFV1fdke77xf/PbIppACf+gNFe9whutVeC9gYL
	y88sBAbhkDdBCn5EFcOD6+yigr+3Nqvlg3c8tQZTsnYqpidES5Sf2aiA
X-Gm-Gg: AZFdTZd72NRzSOERSnsykM7sROf9bfkwiTMOuHTIjErEZYebTTKYpELd1zKd9rUgbq7
	CWyKFHbmlVIMhaKFxSlcNWZo+XjJ+ALPvyH6qnIX5LIlCowc3o9tVZms5rNvUG+il8IDBgI1hqQ
	jTQ7pDzsNrQpmlkjNQOFNHHrgx3e4AqTr4c98r+Fqp8SFiIDMOnLWctf6YguWeiGVMW7dyG1cxw
	05YTaJQJTUjS/lgavBxK+d5SA32oSASayTeX/giwOtlCf48N6LA+t5alCggfAJgJdtRamprRDfD
	LkfHiiyG0idlCUjAkIG3XG5yY5bLOWit9MTIyJ0V11/Q5KvIRW8WfEbSGBSnyScMV/L/dhzICi7
	gme5lxgo9j0ZQzdivOYeq/G5pBnXvYUJGHh0aFtDEQAmGi1+mqc4xnhcWWElaqPHREbGUW9/vqi
	TmTVHsrNKpCI7x1K7SNaAmniQI7Yr7rSA0DMo8+q1iRGc+WZQ8RES6K2T9YEU2kJMUciNGiJlOw
	iIo3JWv+W82mNxaSBB9mznb3Jl8MfYVU0qkgc2gOmjgxkqcCU1ls2eLZp0TxDF69Ah9+XVF6xO/
	SEwLnboHOUyutO2bwtwHdjHHFvvKaXhfdmcOCXEbLkSTEItRvEk=
X-Received: by 2002:a05:693c:6390:10b0:386:ac97:f670 with SMTP id 5a478bee46e88-386ac97f867mr3232917eec.12.1795428383429;
        Mon, 23 Nov 2026 02:06:23 -0800 (PST)
Received: from localhost.localdomain ([103.179.231.88])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd4efesm35968437eec.12.2026.11.23.02.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:06:22 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: perex@perex.cz,
	tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH] sound: core: Check return value of device_create()
Date: Mon, 23 Nov 2026 10:05:35 +0000
Message-ID: <20261123100535.3025-1-sreekuttan2156239@gmail.com>
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

The sound_insert_unit() function ignores the return value of
device_create(). If device creation fails, the function still
returns the allocated minor number as if registration succeeded.

Add a helper function, sound_device_create(), to create the sound
device and check the return value using PTR_ERR_OR_ZERO().

If device creation fails, remove the allocated sound unit from
the sound loader list, unregister the character device when
preclaim_oss is disabled, and free the allocated memory.

Return the original error code to the caller instead of reporting
successful registration.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 sound/sound_core.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/sound/sound_core.c b/sound/sound_core.c
index 10db8c699630..90d59b14245d 100644
--- a/sound/sound_core.c
+++ b/sound/sound_core.c
@@ -231,6 +231,21 @@ static struct sound_unit *__sound_remove_unit(struct sound_unit **list, int unit
 
 static DEFINE_SPINLOCK(sound_loader_lock);
 
+/*
+ * Create the sound device and return an error if device creation fails.
+ */
+
+static int sound_device_create(struct sound_unit *s, struct device *dev)
+{
+	struct device *device;
+
+	device = device_create(&sound_class, dev,
+			       MKDEV(SOUND_MAJOR, s->unit_minor),
+			       NULL, "%s", s->name + 6);
+
+	return PTR_ERR_OR_ZERO(device);
+}
+
 /*
  *	Allocate the controlling structure and add it to the sound driver
  *	list. Acquires locks as needed
@@ -277,10 +292,20 @@ static int sound_insert_unit(struct sound_unit **list, const struct file_operati
 		}
 	}
 
-	device_create(&sound_class, dev, MKDEV(SOUND_MAJOR, s->unit_minor),
-		      NULL, "%s", s->name+6);
+	r = sound_device_create(s, dev);
+	if (r)
+		goto err_remove_unit;
+
 	return s->unit_minor;
 
+err_remove_unit:
+	if (!preclaim_oss)
+		__unregister_chrdev(SOUND_MAJOR, s->unit_minor, 1, s->name);
+
+	spin_lock(&sound_loader_lock);
+	__sound_remove_unit(list, s->unit_minor);
+	spin_unlock(&sound_loader_lock);
+
 fail:
 	kfree(s);
 	return r;
-- 
2.55.0

