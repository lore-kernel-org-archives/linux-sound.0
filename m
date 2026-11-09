Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794240013;
	b=iYCjqeLDHo6iZwKSYTkJIG0IaYxMaOV+C3mUUz+A4zT1oSUWh1NMyEGnMIOij/YLXeAU
	 Jp1KSHmsl5S/gyqSB3RmtG3ahhTFz0RuYfX+OG1fdcBe1n4DF/HpiArrfL1Dsqz4Dvhpk
	 K9x/ToqXM+L4ZW+dFKpdeEcXvMuJkzXbw39B63MhqskVKdP14VfrdRJrQpKeor6d4kQjN
	 8bJY6ibC3k+XMy0honku6z3j3HztSC672wcDwOg3B2GqLKjfac/nMB4VLRlWNTpHNyDgA
	 F0m8tqcXFjvgOMqm2qMwB3z3ola+L6bx0dAFOzBrmni+wx9QhzxH76hbjb4HOQtGdcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794240013;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Vmv9deSXKBZlDRk0lEdU9pqbb74hEbBLfRmRxkNxYuY=;
	b=1J8bHHnyWUctg6kXKDIAJ235T+bsP6O/zOWbU8QaXQHht7Iph0p/zesgH6RUJhzH6Lfl
	 hvRnXQilRZv+rPEJ9BncxmCebABVNsMcEu/QRR4EvFc697P1XXxdxqqpQAYEJbw2gFrnm
	 wXGiAIPyayTCn/kmxopQ4OGcHztbB8EG2rsaZbg1/L5ZVkYtYIWuZTskdKXCeefBUEsJi
	 CKsiBQoe+D09qj+76SRQrPep6Hl53EFcDRqUkwxAdytdD9ytaWQyDPSsAFh0sEJpQ+SFV
	 Q/A1vHf+ZvIEp3mPs6Eos8w8St1kBy64MpdBtj+HaxQ2PyV/Lf+SvxKGTpacu19wBbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Y/MJp8uF";
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BEE66082BC2
	for <linux-sound@vger.kernel.org>; Mon,  9 Nov 2026 16:00:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BEE66082BC2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y/MJp8uF
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36ff9c9da34so1758978eec.1
        for <linux-sound@vger.kernel.org>; Mon, 09 Nov 2026 08:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794240012; x=1794844812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vmv9deSXKBZlDRk0lEdU9pqbb74hEbBLfRmRxkNxYuY=;
        b=Y/MJp8uFrPneKv4tmXU8sXRiFgMTrl9I/DECANgUdi+N1ChonYVjdmp0SLiXH+nI/C
         +h7xgac2eH/iTc7Rg6wDoSYm5GqkfZ+sSgq3sJ3hRSx56PjDnkPn7jf7WrtXO36q13zj
         srkmYiIA99XBc9SjSX0Y68K2QpLP7iIkWq9kPyi6ocjKrPt03zvUkFr4t88ShD4eapTX
         3IharZ/Q0PHgz/CfLT0cRzHTIF3G5z2XZ1fwLOAnwqdabV5KpnNOGWzLjONtbbTUgu/W
         WqzZtboPd+Jcw9qMggCbtvC5tzqCEZk2EmSb4+Uz9j77YMNQMqyxQr5RHrhWq06zrMI3
         xWag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794240012; x=1794844812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vmv9deSXKBZlDRk0lEdU9pqbb74hEbBLfRmRxkNxYuY=;
        b=p6NNx3DBJ1BxBrgcy/Iqy7KP3F1Pocq47+RPF9nIapw6Foyhdun3opC4f2fUgKx9Ko
         wb3WpZSyDcO4MO4ieQi+DqN99l6g6O+VrvHomJKc0Qn+yLolw++iaWk3EM3AJIBZeAQk
         SBSzqI5I6Uo+kxmwPpnmxQ4NQpz2NcM9+DZOv2uzibP8zNaEdXcgc1Lzdnvhst5X1NNC
         A0LjFBMyYZsPB7AyZtewGlrlLrJZ5Mdb1LPUrLoug7sUsJ5T4Na7YgpglpW1KaakXtka
         Wu5//mPRUa1f7LcJox7vmxOBBWkpIuBw6+K39FvCGDALQ9VfM3zN06uExYY7WeiBdBt2
         kg2A==
X-Forwarded-Encrypted: i=1; AL+hErEDW5ndVI34qeaKSjEk5HqjzEG4CbpnLgPRvxr80sIRb5SuGL57EX7EmkHAfwrxdA1k5xfUQT0iUwMdxA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8u2suEilJtUyIlONfMoo5iHBGKxs1Vq+8M9/DXBjos2pqoNxIB
	n4U0FdAW6Mvpx8lPIdNn9YLKg3NN+xUPFqD7VCN6rH3opzldemx5GwqX
X-Gm-Gg: AYBFou2DFoqgpWei/xvRnU5nJVipPwlcDoPRkmxfBxKqcQJiCqgmtHN8uiZCxXMdWSX
	yDCAoS3coZt+wedGesdwPRZ0nxTzU6DiW1laIrBenXVBBYuN18sdtOg/gQPUJFuNTMiAveourec
	uRWWoY9wTJb+o62Y66DiPD2ctpJQgybt7q7bWvhX7hUHzWbQ1lN4lKY/+NFlX5I37LEM4wtxet3
	9qLtiH/6sRINmJvVzpltCSW2X2JOE4++vGJq98D8T1HySNh4NfreK/lCcuNSYtJGN5dm2c2Wcwa
	CXON8iyo2+TQ5JW4lKdj8Z6SMTF7s8iJkXoS4vBkQQp1TTpWXGeN1Gx/zAxderUDuLHlnWb6a64
	IyUhB8QaI9fXvA5rjnDtKsOnqczx+kCnwTQTYHnGvAec3qg1umR7Z6QedBUVzTrIRw42sgb+jo0
	41Ixa387hZCGl4TTpTnRiNhGwtF8PC28+t/pLkoqFTarnOcG2b7/ktWA9wKq5VupmPmKj3gbd3T
	lEF+jfHZxc8OpGWDwVOoygRygzfEVvrD7GthGYyEUskEhLRqN19/ixQr8VDNvDveauYlpiDt3c8
	pS2KnJj4Sb0MNvK5DSmtQSr/U+AMtKGwKNeK4GW8VVQjxZRtMA==
X-Received: by 2002:a05:693c:41c6:20b0:36f:d53:cf2f with SMTP id 5a478bee46e88-37252e3a972mr9279476eec.1.1794240011687;
        Mon, 09 Nov 2026 08:00:11 -0800 (PST)
Received: from localhost.localdomain ([103.170.54.70])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265a16f9csm14715578eec.12.2026.11.09.08.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:00:11 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: sreekuttan2156239@gmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	tiwai@suse.de
Subject: [PATCH v4] ALSA: control: Fix parsing of numeric fields
Date: Mon,  9 Nov 2026 15:59:41 +0000
Message-ID: <20261109155941.5850-1-sreekuttan2156239@gmail.com>
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

 sound/core/control_led.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/sound/core/control_led.c b/sound/core/control_led.c
index 501387287ae6..1b0473b71c3c 100644
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
@@ -487,8 +488,6 @@ static char *parse_string(char *s, char *val, size_t val_size)
 		}
 	}
 	*val = '\0';
-	if (*s)
-		s++;
 	return s;
 }
 
-- 
2.55.0

