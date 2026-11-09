Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794242161;
	b=ToEDZV92vVHf58z4/Lruc+73sbImCBpVyfVtVG2DXNg+ufMAkV1ym7Kci8Bt9z5BPjD1
	 kZ1jC6DMeovIA0NHzZyDPRg+m931p3hSkbu1asSxEfOYC+9ZdaHrKLDUh+vlXN8AHwP3Q
	 rI3+nHx6jr/szjbrrPm9PFpFeMWYJXQ8cccjN3EHoz/0UGjfSmlcelZnpSoqLg4oIsrbT
	 Mg+rFOQBV6pfGHLHpgo1A5upx3HtK0lgo5UijSlYihtWmJ55w3EeifmI2iTKSR7rynrd8
	 xKF6SYses+hIN16kcnhJzlv7cMs9YXuZ3LmKBIs5X11Q64EarOu0sef5rTFDQ2KNEeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242161;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=p0Ws7ygKY8Vi+DeyhlAGMxrUOJTmSXqSaf5xFSFj0QA=;
	b=tOtZPo1ZhN9OFnuk6kyJAzgPPkg3Euz4CY3mon88qFISAAICxsdyS4H+QJgCjIfuvXB2
	 PnjcYXXbFly7wVfZkoZE4n5lsLBncELnx7MvL4Y+DvQqb3LTL2JSaM8z9ZYej10vn6cby
	 UGK3ShY+6O7r3VjbT4q6/5g5JtXtMGPfplW/HDlM544V1qGqVTesRxsgIWIgtfPFY1Pvk
	 eJVK/pLHb378Voo5o11j6Noe5WUy0hGCOOd/liH59kb5U1EIW/1Vm2jtgj+UXKgzASeTu
	 N/65DvhkmJYoL7AATDezzhI9YwtWPuTUsXL/XkFI6RIRVs74JozwbUelmOExN2NE7/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Xbk/w0/T";
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FE7606A325
	for <linux-sound@vger.kernel.org>; Mon,  9 Nov 2026 16:36:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29FE7606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xbk/w0/T
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3712b6d9843so733918eec.1
        for <linux-sound@vger.kernel.org>; Mon, 09 Nov 2026 08:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794242160; x=1794846960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p0Ws7ygKY8Vi+DeyhlAGMxrUOJTmSXqSaf5xFSFj0QA=;
        b=Xbk/w0/TfVH4/UU2zpWwpxr9jQgez0pNvC/PnpIFSJ3eDHqcLKc+tVpsEdD7wq1768
         mrQP9tdiXn79uZ3nMPLCTA7oP/7ZUdG7iH0l+dmu1HxoweIZvNzQpEc32oUf3D+IkizT
         t3gad/cu6rOOqxnSdLM8dgDmKnnd4G4C38y73NKGDVFzw8AIvBu225d23QidxR6rfWLA
         nIET2u/CO9Ysxwfuyt1RvyiPnQuSEASQZIen2DeW07gpJjE4PuRib8HYWTIi5ajqjDSB
         V5gOxk21Ajt3x7soOx3ZaD63Mt+DvDSBD6nkzsjD1pJTS0jMzz9spMs1x3fEfkbTAWuP
         9JDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794242160; x=1794846960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p0Ws7ygKY8Vi+DeyhlAGMxrUOJTmSXqSaf5xFSFj0QA=;
        b=RRc1FlC8328t/DznvuiI/kC53m//AeUTDdR3aGmlzumNrmSnq01dn+6k19XEUTNbNT
         ln6gpcCzkBtbjoCbtx7RFRQIy7bygmTqSEkBBkQioD1lzD9j/tf/7cuD9lE2c164nYm+
         8RDyy9lYWFm7LTVHsiXv6zXSZ9p2hB0OiS8PyZR3YKisV6+YKPadGpBMHm8nEdTntRTm
         gf7Sra3v011/53fvjo7VKJ1pw3ukqoP48K2iIytJ2Z/FdDdHSrVpYpgC2XXDzlcoXJm+
         q18uABD4pqsXL36NCvwkir4/DKC87jCylwhO+fFqxZShLLHdafhtiFMGoi0YhX2K21IY
         vIEg==
X-Forwarded-Encrypted: i=1; AL+hErFy10LQ6YuzyZW0hCKLw61Jg/PLRFCsovhDhID+pifIlB/3/AokFPecDs60HVEvrNfZ56oGzDdkjoQlgw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+ozcxMifSfUjSiDCU/ijQqRCYoJSFNbwkLesSvtZKdkHwrMvQl
	PvfDSTkSK+NQuQP/vcut6MREVwffZ+JHBIYrA0BSDEXKwdqVKxTLS/Nr
X-Gm-Gg: AYBFou2KJpgJ+L8AkZl3Wj5RV0+FTpUS5TmJJGruiyb1XRCKMa/pWtIx78iJ1yiDSiu
	+1jarQb/Zc+uh3JegvEo//5lSrBtFErukw8nmcKRvVH+8oqq8AeBikY8JLsGsniXkMkmdFHEbZH
	xlWnKyklqPecjrjODxk41YmlJjdi5l0X8+OV4uLrzLy0wrf5TwPv92nlTzjZFXfBs7rcaKCbEJR
	k5hRw1scoe+uJVzMUATA+WuAZ9qpvo1c0KTbpkGIqHYymMgOoKz9sbzrbM0BmmyMG0O02umeDLg
	sLGyvZE2A5MiY/5oGz20YJWZV5dtQZ0KznwYTv8UB6esf83ILXFJ34YT+3Lb16XwroWtNmXm3Px
	2CMELbW1zpvIe6dTzUaCQQWEh0OK3H/ykBActcVlrPx1yqwgVmlfKD/LXSJcbHdUKGXBF6xzJwG
	EHCimZmseoLZyE+1JzX/anqToaiuxISGKjArqJkNA+7lKW0WIXGzKpfmvh5WZi2bDEbDNv/trmV
	EG+JcoAig7or5tmkXsHkR81uDW8o8NjFc8B22ZKiKM0zy/bt+8rN7Zyip9mrszG942P8IcEj0hl
	eSuPs7lIK/D+H1HZM9b4QMBjNjdOlWUeL8wIdV8f1d+lHna4yw==
X-Received: by 2002:a05:693c:88d0:10b0:369:535f:4d12 with SMTP id 5a478bee46e88-37252b4c316mr7879817eec.3.1794242160097;
        Mon, 09 Nov 2026 08:36:00 -0800 (PST)
Received: from localhost.localdomain ([103.170.54.70])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3726561851esm14655931eec.4.2026.11.09.08.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:35:59 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: sreekuttan2156239@gmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	tiwai@suse.de
Subject: [PATCH v5] ALSA: control: Fix parsing of numeric fields
Date: Mon,  9 Nov 2026 16:35:31 +0000
Message-ID: <20261109163531.2639-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261108124832.3058-1-sreekuttan2156239@gmail.com>
References: <20261108124832.3058-1-sreekuttan2156239@gmail.com>
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

Make all parse_*() functions return the end of the current
substring, leaving delimiter handling to set_led_id().
Temporarily terminate the numeric substring in parse_uint()
before calling kstrtouint().

This allows numeric fields to be parsed correctly in
comma-separated input.

Fixes: a135dfb5de15 ("ALSA: led control - add sysfs kcontrol LED marking layer")
Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
v5:
 - Advance past the closing quote in the quoted-string
   branch of parse_string().
 - Ensure parse_string() returns the end of the current
   substring for both quoted and unquoted strings.
v4:
 - Make parse_*() functions consistently return the end of
   the current substring.
 - Let set_led_id() handle comma advancement.
 - Use kstrtouint() after temporarily terminating the
   numeric substring.
v3:
 - No code changes. Retain the v2 implementation after
   comparing the alternative approaches.
v2:
 - Add the Fixes trailer.

 sound/core/control_led.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/sound/core/control_led.c b/sound/core/control_led.c
index 501387287ae6..1aadacfbd3c4 100644
--- a/sound/core/control_led.c
+++ b/sound/core/control_led.c
@@ -447,22 +447,23 @@ static const struct attribute_group *snd_ctl_led_dev_attr_groups[] = {
 	NULL,
 };
 
+/* return the end of substring pointing to either comma or NUL */
 static char *find_eos(char *s)
 {
 	while (*s && *s != ',')
 		s++;
-	if (*s)
-		s++;
 	return s;
 }
 
 static char *parse_uint(char *s, unsigned int *val)
 {
-	unsigned long long res;
-	if (kstrtoull(s, 10, &res))
-		res = 0;
-	*val = res;
-	return find_eos(s);
+	char *end = find_eos(s);
+	char delimiter = *end;
+	*end = '\0';
+	if (kstrtouint(s, 10, val))
+		*val = 0;
+	*end = delimiter;
+	return end;
 }
 
 static char *parse_string(char *s, char *val, size_t val_size)
@@ -477,6 +478,8 @@ static char *parse_string(char *s, char *val, size_t val_size)
 			}
 			s++;
 		}
+		if (*s)
+			s++;
 	} else {
 		while (*s && *s != ',') {
 			if (val_size > 1) {
@@ -487,8 +490,6 @@ static char *parse_string(char *s, char *val, size_t val_size)
 		}
 	}
 	*val = '\0';
-	if (*s)
-		s++;
 	return s;
 }
 
-- 
2.55.0

