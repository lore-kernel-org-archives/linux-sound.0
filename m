Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793979987;
	b=pVeVquoWRfL0o8xEDAC0egccAcEnHbdeHxexb8bMEvZZlSU9lKs+g+qMrkvG1dgbEPYh
	 GeTwM9co+62Fkt822Hv2G5FYKcj2afOOW+kGo9wRK/OcTDp0FaFrKLSZyYUeFmxKdzSL3
	 +TXhYM4GoUC8aTpyVsa0JF0nC592njtjFwZQHisWW5cjrQc6XcgdPntU0E7Td7799RsDV
	 MzWdh6LKVxIGdqhNnrlfz/k4M++h8WBZit9xlmHfU8suYdXPB5Sj/mbC3LKQrCl8wGZPo
	 wAg4RPYUQHmPVwv9N732AG54EUxKILQAUbltgA+nVV/Pgv8AOmhAKd3xZCflg17BWFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793979987;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bYwNJYvXIj3H8ABsRXLqczWz0aXSlXMRZfV0GZFVRl8=;
	b=CmT3wu1ZAC07OwXQktTG0QeRYIDdC4aZsfFGgu7D27Lx45cigEsxWnTldyiGLHoEr/QE
	 w1ML0dg+kmd0QJvhXTbeip8W1HCUjJw2IpdBH/UmlacygiztGw6FLNwHt4DP79eEDDbkt
	 DYshQ1PFgvEjNS2FB6a7XF+zlZxMZ1Mj+rcwBnRWQAUDmPDALgpLdF41NIsOCq0aK9d9e
	 mUpXQLU/fJhy+6wa6Xk7NImNfnP32i2h0rwvYRbF8qVit5gX8SbirWm5UJXsz/3rPaSo1
	 Fxr+UckcCo80tKGCFzZxjX+k1TOxg31X9KXbYgFjkT3sB7nTa5niwJdXXO2kg98l9nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AH4lMIqR;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43AA7606A32F
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 15:46:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43AA7606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AH4lMIqR
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso2416328eec.0
        for <linux-sound@vger.kernel.org>; Fri, 06 Nov 2026 07:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793979986; x=1794584786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bYwNJYvXIj3H8ABsRXLqczWz0aXSlXMRZfV0GZFVRl8=;
        b=AH4lMIqRxrK9Yn++ZiOYG1DE1mNzprHV45udIJT55Vcmm6lON0UnsdB+dzhrgv7yIN
         eG4YlbXSMNvbmYqOmTM8gUXlQbU7YRIy6U0KMRJ9fdgJwp05cu61cG65mjrba8x+Ioab
         9TiGsqLfKuTAhAwW8U0Qh36agKSxfrNRd33x6ezr0KKEnnRODRIK8uUeh5FIJZgLO0jo
         5ovRpmwK3G9Fq9KmN0HhGfN0/tVyczwDwsEPO38cBnjBbNt0LCcnimVoVI6FAk6fEr0s
         U8XSZ+oR1qjRLDf0UggeSISoRxe8ImIUEkvzE/fZVygaENJwXXJLwyNK8kIXsRdpus0D
         WSOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793979986; x=1794584786;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bYwNJYvXIj3H8ABsRXLqczWz0aXSlXMRZfV0GZFVRl8=;
        b=ZUW2G96zYFNF3ZlNnm3MjNGInPVBUHjq6KFhjJ7Wy47lFylNsHM6Bguu0JUX6WY7Mk
         q9r5mAFQnnTmDn9CD7ZCjAFyDfJ0PT9VPPTNQkZwhlymV2S8nmIvzX11dCm7sscPa3QO
         yICumOE2BMcgtw1lxT0Vjw+61Mc9ib/LRL1qzWJcc0WF7FI0F4hYketGCRz6nIhVMoTg
         J+46ACZ2uAT+TghBV+9847oceuuxIM0Fm/fyEjoHU4YGphVTUK0qW4i5ccS9TfR8rq0Z
         PuZW+SqehE5wEAzey7kSfKRdOFAR7trvurN52dPdkm0KDpP5X1/1vu6V7wpUN6PBwcB5
         PjKg==
X-Forwarded-Encrypted: i=1; AL+hErE51XglyyCQCF/XbGsc0OgpKe7bN7E4JQBpYgJq2Tcd6qp/dTbr75b/qk+C2OS6A+FHtkYa/VXBKptvkg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8boRW5a5zWya3Y2OrOE1bFN8yObwRUYhAlE5MswLZki0L5DXv6
	vjCnhOTXYECIxsNGIAMDOj//1tZ5Kzgt87tNNKYAX6mlxUGyBmdPF8Hb
X-Gm-Gg: AYBFou0m8ZQz5YlYe/b6bSaFjxBmhCceKsfrkKT3Jrpl8m6C+GbrBLQylh8L8RyyhDF
	gnIlck/qvbN++S4+E3/kkcw10zyNuNU/0QjcDNKS61cwAI0DcP1pI9AZfpg9JfXwhTp1kfL7kW1
	7vY8MQKqz6o882TH/DficVe4P1G8CMsizqN4CujsFIub/SfnIZTsbv5yLeScpK8QARAh/QXZCXa
	JFJ0GL7JfFCD1InxcCET+xOVAszvbrWHAKEbiip1DGwerlbsYgEKfcvnXHUhS4oYRdHBhh+mtPZ
	3j9WEFPTCgo9TLNnc3qRnuD9LgN/N9T61vA2UYX3rKhIVxS6lSWfsP83Y/BOXBAf3CSfbqfF0mj
	WXIiAKx7nXcCt/TLX6VC49adIY4ruvOgQIROAvEsKRwdPbOs3qiWRwK8Yup7NTvsI8jFrH0/eKd
	wM0SF8gDUbXBTwG/NjxaOB6HlET/nnmD0175heP8YxmSN231hBxfeO111EQIlVo6ygjBB0dJRYd
	3IA7/f0JnPUeQLNbnpFIn3vCDjVMgm7ly+YmT02q+CyYPElUNYwHWKkL9OILJxknUzs/D3z/OGp
	RBKhfM9cGhvmkhACyAZfnkoL67mrXIOiRi64pctHRsNGPcJG4jBv
X-Received: by 2002:a05:7301:db84:b0:36a:6ae5:23e2 with SMTP id 5a478bee46e88-36f76425c51mr3566033eec.17.1793979986027;
        Fri, 06 Nov 2026 07:46:26 -0800 (PST)
Received: from localhost.localdomain ([103.177.253.113])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faaa8f1e9sm7029182eec.28.2026.11.06.07.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:46:25 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH] ALSA: control: Fix parsing of numeric fields
Date: Fri,  6 Nov 2026 15:45:45 +0000
Message-ID: <20261106154545.2973-1-sreekuttan2156239@gmail.com>
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

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
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

