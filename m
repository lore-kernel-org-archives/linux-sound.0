Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793982281;
	b=38OCdnjnf2G0Hg62e1AZ75uVd1JWT+FRipr4w/TeXzjWbGwf6+ocBrxip1F70iMcz5Lu
	 Hyy82bokODcX2BOpHtbWOKIGJJQGWsppe6g4c+riLcrDK80lNWeuVqAEKzEZxbVgmAKQt
	 a2zTTnWM2CeJ9JLxSuzUEh5OuiaJBqlCxY7qx6XIhvVoPcQieZ55PL/ApXZJmoQHottKQ
	 y9hvvkn0YzZCrp5nckm6TK77P12NZ0bCWyW07v7BSD8FjOdngie6btlb6Qn6bATCPTXSd
	 KxckscsHFe5mauwydcKs0EjJ8SjXW35QeQGy1sPSc1gSPfXfDxAtI2bxitjOsHQCDzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793982281;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VpCSiUu6XD8MhpAaz4Rza2/2cNV1z+gyRKbp0TBqDxA=;
	b=IJSA1EGoUfoRT1XRiZRjJkCuCH2N8drv9bJegPtSBYH/SvC6rK5T7vQTxzqvk/xRyDRD
	 dbW2x884ATquFm+SnOfJLrJOlEnFNZE/YiKzjJummhfpPutzdRGWte76UTgLdEhH70t74
	 kxDfqUmTAy7kZblLm/wpaqKTwpRVu5M19kypJDJMe7uDcwrZczK/4tt/+3y0B8pmrBAsx
	 Ci4XaKRBYbYN5rhjRk9uBRKfdguVxqGQ4/voGkPHb2jSRDS6XF74VrSCrTENielZozk4N
	 4C5Lg9/pR7ElD14aU36yO9/aUgurzI+bO38WT/yn9UqzZTYHGZqL5O3RGiWrIkH+mOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ho7rc495;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FCE606A329
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 16:24:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28FCE606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ho7rc495
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-170135e43c7so1495640c88.0
        for <linux-sound@vger.kernel.org>; Fri, 06 Nov 2026 08:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793982279; x=1794587079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VpCSiUu6XD8MhpAaz4Rza2/2cNV1z+gyRKbp0TBqDxA=;
        b=Ho7rc495MHCfYbk7wHBKEoHA7l1caWmwiri26PQPjAfL/FllBg0xjV/SkONrXq/pjh
         wI6QRDbPYPZvOQb1uapbRLWTSWRdJsNuOB6A4ZFuIvRXRvDEqQgtUYp9J9w/rS9XlOAy
         mlceQsdoxBngN/NavCejH23hxFM9V+9FyTcfRexgiX0s9HNYvobTLqpzFKtZ4kCX3NK+
         T8UyUHvtUl82WNJ098naz201l03upatpYTXL6qCXFUr113dcthiRoil+ewbjOiJjytBD
         /H8vZwXW3yh5PUafAwMUYusSviNTRrS6haIxSsQRs/asvzxqBeBYMFUUBSKU0YnynT+L
         AXVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793982279; x=1794587079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VpCSiUu6XD8MhpAaz4Rza2/2cNV1z+gyRKbp0TBqDxA=;
        b=FrNNqWzcxJ0Ycf6m80os8LV7arkP2o1iXrXnnfQa0mNVPdi0tSK4PfDNlgwVgthW0h
         XnQHLs8p/5m5ACS7H4TXDOIMIfLhcOM5+YbqUTl3VUuNBVQyHBCFCyqb837aAmOM3B8j
         z+mQxpP+qYTqmBKjd9wL+lAdHn4AXXvPJ/yLbasfaRBaVJ0PpK5d4yAMUA2xLBilIjTi
         bW9MddYRR1W8dS9GWfjIiZ4UphqKOoM/dKBlin6guiGSVTtTmrCdvXkxSu0f2QGxmOvk
         lpahAtk7Je/CgdIDPTgw4fatVDgjuUY8uH6YVn9bHwtbfdtBkLoMstWt6D7m6fLUtS1Q
         IKFA==
X-Forwarded-Encrypted: i=1; AKwUvBzva8hgV3nBkqJwXB7G1mkLVXadBUx3lyuN4HKaSS9VFam+/BuALTZCqsOI4oAfSSxlWVTbPdsgSkifDQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+YqI/3s0HRTJIhCanHkbtafTWW/4Cd09MjhatzBDL21bxLr5Qn
	R7+yAZ00Q9UyifmSWda4w3XQWvOCMb1ZT/9KQXEjITCfbqFlnXBRbbBb
X-Gm-Gg: AYBFou0ZFNP/agcilU7UumOYHFagj8W9Y8hnZhG/x4Mo4uwdWlxoZLX4/d3ZKwTrp2v
	V4tXAX1MTSeNKLRxRUBHFaou5pIwcicR5vPjQd7FyO9XfvLkwgLiC3wjscA8/tm0kWVSGnLxc4j
	zcufMPIKLl+rF+MTqjwsPB4KUExlcQfbC1h7Tm10LbbDd6kwptgyQ3r8eTjFlbP+UDTZaDHlbId
	iiVltafw3R7d4Ihw6Id+GTAro2r8W9yOg9gun4O4jiWpcebA5tw5uOnp9e3aa2s5b6S2IYLM1DN
	1soDZcIfYpH1sO31bcPIZBtNPDx/m6RfJjZJVDAqRkA7Hupri3wX7bzQI3+iVIAM0Wz1Y4FG6ny
	zd4ZjxqXuEDG2hhWM8cdxM2t5BdacrMQuuD7IPywvyg/Que9Zn60uavpsB9LH8odhZGLOdsVXl2
	h5X1rZMWvFRncvDOO4xpnPdgW0atVoikU4xm3OfT1SHOrik1riwLds1LzBHGj2A9pPtOwd5zliO
	R/vGhYUi6esD7iUKcLfSaiXXZ5o9mZu25D0/ua3tC+55t6HTk5BYrh3m9rtEYcZpNbTWJM40Gkh
	e/OhVttFARtSksAzaZVICJK0JNm8GUqi9M8B+l9HemQhMK65JlUqkr0/1aogRDbhWu0NFei/ZA=
	=
X-Received: by 2002:a05:7022:1081:b0:1b0:4272:4282 with SMTP id a92af1059eb24-1b25d318451mr3525212c88.17.1793982279059;
        Fri, 06 Nov 2026 08:24:39 -0800 (PST)
Received: from localhost.localdomain ([103.177.253.113])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e407bb5sm7109605c88.1.2026.11.06.08.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 08:24:38 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: sreekuttan2156239@gmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	tiwai@suse.de
Subject: [PATCH v2] ALSA: control: Fix parsing of numeric fields
Date: Fri,  6 Nov 2026 16:23:57 +0000
Message-ID: <20261106162357.3616-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261106154545.2973-1-sreekuttan2156239@gmail.com>
References: <20261106154545.2973-1-sreekuttan2156239@gmail.com>
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

parse_uint() passes the remaining input string to kstrtoull().

When the input contains comma-separated fields, the string
contains both the numeric value and the following fields.

For example, with:

device=1,subdevice=0,name=Master

kstrtoull() receives "1,subdevice=0,name=Master" and fails
to parse the numeric value.

Stop parsing at the next comma and pass only the numeric
field to kstrtouint().

This allows numeric fields to be parsed correctly in
comma-separated input.

Fixes: a135dfb5de15 ("ALSA: led control - add sysfs kcontrol LED marking layer")

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
v2:
 - Add the Fixes trailer.

 sound/core/control_led.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/sound/core/control_led.c b/sound/core/control_led.c
index 501387287ae6..3f54af2cb505 100644
--- a/sound/core/control_led.c
+++ b/sound/core/control_led.c
@@ -458,11 +458,19 @@ static char *find_eos(char *s)
 
 static char *parse_uint(char *s, unsigned int *val)
 {
-	unsigned long long res;
-	if (kstrtoull(s, 10, &res))
-		res = 0;
-	*val = res;
-	return find_eos(s);
+	char *end = s;
+	char delimiter;
+
+	while (*end && *end != ',')
+		end++;
+
+	delimiter = *end;
+	*end = '\0';
+	if (kstrtouint(s, 10, val))
+		*val = 0;
+	*end = delimiter;
+
+	return delimiter ? end + 1 : end;
 }
 
 static char *parse_string(char *s, char *val, size_t val_size)
-- 
2.55.0

