Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794211766;
	b=CQq+4NoOPbHmosNlASbwcPtl9jeCfKLPTCqHHadgsYSyO00KvqIbewRoN9s3Wf9twTxj
	 vOruCd1DEKgB9N+/t8iBjpwamEFXq9PNFzHmrqKe8eNDyg2mCkLRlwY9ZVE7TQDOKc1/T
	 OEodXDKUCT6nZbiWOLKImNU4cbK4mFmGKAo80l8AZ17o5qebmhwrHAYEPrFC7oNdFL2ls
	 lwXci+db5itPDu4xk9G4xSocczvziMB05alirbdYaMBdAb+nvIYcgilE1gSDYq0lXN36W
	 gh+i6QZ/dwFbV6jrHe5eyl9+lcOuFTQkWtfOiANnql8v9tZwX9u4Yknl0PPk5QqZF4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794211766;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ckQaOyaCkThttSpAbhrh/L1t7ISpYeASQa0m7BYrxNo=;
	b=ANwyWs9E8ZlU4375nzbfxxaClFPd89nrJ5nY2ugE5vCO4DyIlXArg0stgUpkL8iTSTcf
	 Ggz/zjNcmJ4usqGkCJAWQGkox5sn648UM2yEdN9fsN1Dn4P/aiDWlTdnTTGNRuzIAa4Wn
	 FcvN6j1ETZ4gSyDIxbi3PW5QWG5t9nZEROeBzn/P00ufL0nIYM5wb+sw6NDp5jImrjcWW
	 Mgphcv0Wv4ArFGGrkn7C+hImvcolheSHjWA3pb1P6FGpd8YCNiplPA9EXCAzR82eA69Gs
	 nhti2xGWXvWIBhgs4LSQJghRDlHMN3j7Cn2ycDXO/sOwVj7KKaEXXwCIWWRsn7EyWvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=agO8SIMp;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E9F606A323
	for <linux-sound@vger.kernel.org>; Mon,  9 Nov 2026 08:09:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94E9F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=agO8SIMp
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36ff9c9da34so1042808eec.1
        for <linux-sound@vger.kernel.org>; Mon, 09 Nov 2026 00:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794211765; x=1794816565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ckQaOyaCkThttSpAbhrh/L1t7ISpYeASQa0m7BYrxNo=;
        b=agO8SIMpW2YXN0EgVurcxkCzz0SYtqGqhJfc4R4NXhMKDG5mZ9h9OyheomHfhSuhpQ
         C6Zq2nIyxi+Ks9PKmzau9NeeebXxL2OvodoMPsqlkFfvuln82I/xHG/7HawCG6kBdoJu
         rNjSGwuo8A731+PHa9tnd2gUPx3tEfTI0zVPo8uodkDkEWM+vpAil9Cjo7ySzXDRWPCu
         fCv7K0jjTLBtDniUOZcQU9gRAw6Lbq3wt985cGa5DaVnZneI3C02c3hwHEuAM4DPlinQ
         m8f9sEtkMQLVw3o/ovdw1SZ+NQBJLTsfR/WPpgNGCPsXOiA14kaJZzfnZEn7pp5IufRD
         AQbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794211765; x=1794816565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ckQaOyaCkThttSpAbhrh/L1t7ISpYeASQa0m7BYrxNo=;
        b=BJ69WUk7jDPxEWl0lXJRTZtBt130hlw92q5PXkucNzuWnWVY6TQeEhnmAeOdrnx7cM
         jkfxUNO74APMDMQlSvyKi9nFEdgYlJreOe8mp7Mq3ZsOXwlpHvqZBnxsCxMsD6WYe3mg
         b2QJLuGvgGsK/QwRYTVCavSjEHaRDvNaibPf6qsIdGXbIDtUgt0dymX+UG9H2IGcAayD
         Lf4mRXuH279+2iSI4NowBsHV8ec8TFSkxAQYFybo0/VVEY1rVXMLlWsEUJiOj6Izldoy
         qJlfFWBaRXJps4wMfj4rG6EVuplanRUE/QWila9apEU7Ddkpqz3yRTuqMdp0GOxdnUt/
         ikmw==
X-Forwarded-Encrypted: i=1; AL+hErF99h9V4TsiV49gwvccvw2PZn+MXySzEwzXch0L7e1AaanamL/YN4NHuRIImYe/23pPAy0qSPdxVXlmhA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+dbT0EJaB/u50CBej1gXM1grWFo0IwuCQ6D67kU2LjW7YssE1E
	jNx+sp2/2p9EAljnFHGFLqKeW7Wv+YAfwBEXsQx/gjZxn2JmqaHjbr9Z
X-Gm-Gg: AYBFou30dURzk/n+Zx1vIHIVJ7qFRuVMPRSED/U+7Fr8SGowM++hCuU6TmO77b0mbgq
	OPwxittrV5ABS6H5ggqzYdUSQKLUewnqrBjReVauOjsBujt5diO/a2BduZdK/SA2JwJDkrXYpQa
	yyoGjg0nUE7PBeAurTFNHO2F34D/v7LZWeaZ1/LsPTEDoSBdzx1mpeRuwo3Q3tI3dZXFus1+MlJ
	9dwqlcrN4hPS7hSrY+W1kkpVazVSDuh4pmMvOYJiX62hLiOMdIZLzG7HrKzS+LyQWWZkm6nxiXm
	zuILRXqpLJGaxzemGtnqCaw84WDpxfVUeO8OSl3ZSVERZn2A8Ulzh6VarDXUrmvCvPEXSwW5ZYr
	+jvEH9Ur7h/Ze8LrJklqhW4JmqX1vhypnt4oVG9TGxy1WZCXZkc+dGDXRUWxgw94VlUBj2iojB2
	RZSeYSVfq7L7yzFzb6NrhgygF/LDNx0+g/FmD2AOC1uuPJTTcM+GYMbk6nHaEZuB5GKYVGt74JS
	3rtNJOW9EWTWZDgTdey7c4YtxhYrevmQaUlVGXEjrqkDh/N2JPEYhjs+CVmZ1yL/dOUbz8lb0s9
	C2ry117GW4X4XCnWrMlyyQio0pn2wc3+DoYi7nuiMRtgR7OOk1dHUA==
X-Received: by 2002:a05:693c:87cc:20b0:36f:551:2bd5 with SMTP id 5a478bee46e88-372570dcb8bmr6691661eec.32.1794211764633;
        Mon, 09 Nov 2026 00:09:24 -0800 (PST)
Received: from localhost.localdomain ([117.231.196.12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372667d60absm11954255eec.26.2026.11.09.00.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:09:24 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH] ALSA: core: Fix signedness issue in info read callback
Date: Mon,  9 Nov 2026 08:08:50 +0000
Message-ID: <20261109080850.2726-1-sreekuttan2156239@gmail.com>
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

The read callback returns ssize_t, which allows it to return
either the number of bytes read or a negative error code.

However, snd_info_entry_read() stores the callback result in a
size_t variable. This converts negative error codes into large
unsigned values.

Use a separate ssize_t variable to store the callback result.
This preserves negative error codes and ensures that the file
position is updated only when the callback returns a positive
number of bytes.

This prevents callback errors from being incorrectly reported
as successful reads.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 sound/core/info.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/sound/core/info.c b/sound/core/info.c
index c4d57d0809ad..35aaa8bd6d56 100644
--- a/sound/core/info.c
+++ b/sound/core/info.c
@@ -144,6 +144,7 @@ static ssize_t snd_info_entry_read(struct file *file, char __user *buffer,
 	struct snd_info_private_data *data = file->private_data;
 	struct snd_info_entry *entry = data->entry;
 	size_t size;
+	ssize_t ret;
 	loff_t pos;
 
 	pos = *offset;
@@ -153,11 +154,11 @@ static ssize_t snd_info_entry_read(struct file *file, char __user *buffer,
 		return 0;
 	size = entry->size - pos;
 	size = min(count, size);
-	size = entry->c.ops->read(entry, data->file_private_data,
+	ret = entry->c.ops->read(entry, data->file_private_data,
 				  file, buffer, size, pos);
-	if ((ssize_t) size > 0)
-		*offset = pos + size;
-	return size;
+	if (ret > 0)
+		*offset = pos + ret;
+	return ret;
 }
 
 static ssize_t snd_info_entry_write(struct file *file, const char __user *buffer,
-- 
2.55.0

