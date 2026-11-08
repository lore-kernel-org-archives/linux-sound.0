Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794142145;
	b=Wx72Tg8jlWcvbD8DLFPwYt9cYwep/y/abOBRukAIr9e0vg4tSBTyS4VI0kc93FD2buNb
	 97DXFIgKT4qKZJTfJdQ1G09X3/R6lzhs4sv93xgGODFLSFZQgF4s4rh5flVMWi6wzRl1c
	 NY4wKwJl+TinE1sQpIJCpBe+RHVmkExKtVCfpk5sNzrKImEu24WXNUD6YwWSHijgUYRfi
	 zpDD7/UgmS/Z9+yRJiZsLSdLARW8GhUoVNbMX+V3Mw8X4gJ3BAodsgw4So8aVaQQx/mPw
	 NWBv8WKAwj9FPF2CBHCxoTaSg+iU9SIWSLM5Z05t1DBTmVQT+mo8DVjyMz2IHG1XnBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794142145;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ioBEFZ6/oMNc/+Y5CF8uSo5P0NOlgMHe/Zvyk/MQsso=;
	b=M0B4Tmte8N9ef338yz4fl8pV44aNZv0aedtCAbdZIiXuzUkzebe6j2nGM35PnnusuhwS
	 A3GtK7JcO5EZwJGaS3U825IysppjCClG745P6OUgkSuohwSul13DmX9oyUDckeR5cM8WF
	 jJfvD9/pwJmMgPdsE3ohR0kSL2gTcAb6jQwuufwlZkeMA+8k9Kfqb0d87gVduwHg1h7ju
	 ZxLwEU3yI2w4PEN4/flbSIxyXDjxTV9Kv2LxjNpqG09JXY/sRnTDJrfOdKkoxQurvQvlf
	 10nATRr39g0btiV6CU/iGWB3ilbhm5qd8mnANkeqerEkGy8QHy0x3V2+2A8faQUbJbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="F/GnyyAp";
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE14606A31C
	for <linux-sound@vger.kernel.org>; Sun,  8 Nov 2026 12:49:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBE14606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F/GnyyAp
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36a315ed211so39781eec.0
        for <linux-sound@vger.kernel.org>; Sun, 08 Nov 2026 04:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794142144; x=1794746944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ioBEFZ6/oMNc/+Y5CF8uSo5P0NOlgMHe/Zvyk/MQsso=;
        b=F/GnyyApRoO10GDbYSp2nCwlsjiU42Ry7MGZ6FP6d3OCb+QemBT8q7Mns7xk3h0/WF
         n16lmhb84ECKt+cqa2lrpTo4xPBuxtEGOG6fBQTaGuMGSaRXxA4Mz8H49kr45Tsy/YBT
         kEovkWomHHnNSAGRPGW58/W7VH61cUw2xGhHwLbUu4bgJpsIIQ1vzOsOVdCCxjo0loIc
         4K4DR/XKtCI98o4i2ZseI4m/Q5v0wwbe3H2WmbYn1bI7g8wl5+BZkYnIaxYCyxS3daJA
         1FUowjkuZlFjCB6A41HS8rSObJZy4ElP0Ks51XFiA41JVBpZzh0hVnJmibsUekvELwZR
         qSmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794142144; x=1794746944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ioBEFZ6/oMNc/+Y5CF8uSo5P0NOlgMHe/Zvyk/MQsso=;
        b=B3cq8Zt9qAupWZyO5SoivXdn1iJTfip2ABfn9iAzJV3qZUhvti1NihF31i1WbkLqsD
         TqoQwbysTpWBv0/VAIdT8ApcynwvvCPaFIfhaBthM4mZ+/YZeqR6d8PZqOt5edxHIqDE
         G463X2lNdkAzW0LiPzLhQb33KGBOWuCHU4HwT5BMgcHMWqpE/Dtgo/AoRMDROpacojIS
         B/Ss5AVphKsPGXDzsSZj0gQ9me9y7BazlHC5BHiv9unzD9+6cU3pQRMdIz86+z/skr44
         CoVzpmgF8vkjQPxMIjsLwZD9iCPEqcFsqBitYDvXUW+NEFpfDb8JIr4ldPIVaBJg/n0K
         wyhw==
X-Forwarded-Encrypted: i=1; AL+hErFiLnmpBeGo+zQqM3G4FzZIVCvO7+656rvledYiNrD1c1C4BC8deWH2z1yLS6VgDe/+111R8G2JKOTr+Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z/3jIUG1CnOxyN3szCDur5pmk86dfUrbPKLnw/6OzPPdoKg9OAh
	dQo86ilfXTFbjlAIwe1FOS55yNRCoYYmXrQUbRyUgW+bIXDZkGDKX7np
X-Gm-Gg: AYBFou25IyfezdVFe5ke2ffIX50TNhcmGpIzzOlhU3/aunqHZUJ8XpTyQlhT+7l1ENQ
	gH6qrNu6y631I2LDifizFCgqSZYIqaqqNWpTfid9HhWcOocPwN/BRitl+7yYJ1pBWnzEOBHPfWc
	W/WfwoarRCpYDpHo9rJx7xQfiMGDhDxaSIEPOsnoifxwbKjkDOMv/BrYKs1wUJ/SsMw7DxI2qa4
	YXVk0flendwGJWYPsbtlXJqLc+S287OeGpqb97FOIjXHy/1Rn44OMVwlt+j2I4DYU71cKBfN2C5
	1hh635EisZxMZDq/TKJS6E2ITBrspmGP7HZ2Sfjh6Cgpp0toZMhHgaBgznOGcgtZncVGr2rYxoN
	LqjkAGjPoAJXJM06dehHHXDJppuyXQeatx1kO7gq7KZ+XtrjcD2I1xabG43LhbL1GICUqQaN36q
	9IY9jl29PK5q1nTNmGohGWQrBG0giTHMOQn5DzG2gzxLZ+0hQI72RN6jsxvoNAmXJfBEDAU0EpQ
	Ea2FAeQgn3qzmCcpKNdUgxoe7+ZiiLFGT9R7+xyXIXbXthkXSbG4HRxyG1K5YZN2IglFvC93Fwl
	n/hm/h4gOvZPOfEgeF0vbmVYCskgAkYeQCLBoRo3kBtnGpgf1hkM8hq0EExFVSDNzcLm3uxe
X-Received: by 2002:a05:7300:51f4:b0:36a:37:1404 with SMTP id 5a478bee46e88-37256decec0mr2836795eec.13.1794142143927;
        Sun, 08 Nov 2026 04:49:03 -0800 (PST)
Received: from localhost.localdomain ([103.177.253.80])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372631df629sm5431728eec.1.2026.11.08.04.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 04:49:03 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com,
	tiwai@suse.com
Subject: [PATCH v3] ALSA: control: Fix parsing of numeric fields
Date: Sun,  8 Nov 2026 12:48:32 +0000
Message-ID: <20261108124832.3058-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87zevjwmrf.wl-tiwai@suse.de>
References: <87zevjwmrf.wl-tiwai@suse.de>
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
v3:
 - No code changes. Retain the v2 implementation after
   comparing the alternative approaches.
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

