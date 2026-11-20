Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174633;
	b=nyA0lmS13Lo3EUsJS8FHcfq8ZVcuKZmfHPoH3HlbYEQ8dE17YhTefae7RemR1oV+wIYp
	 8K9SopClnvh5WKWNDxM5pkoxSBwTEGNUSFypLFOrxde4D+VwP3fSFf9FqrKbVYaj+yo54
	 L3XjaeSu/+v8QS7ZUPHB2vGCyfxhz8zybWOgzEa37hHn8GgRSJF1k2z/xEsSMKDRkM5lB
	 RBl5mkLXlHyGmZ2CWnpcoZhGJxT8iGzHiD4wXrJq+wLEDRd2OjcwhjTaVxf6XUNDbDJD+
	 7H/o02wocqLuMbFr/cOu7FVgl53TKmYgsMS8zYUGxZbqFpWWpIM/e/8o2jnWhaNibpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174633;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=T+MRoJIYchkQ3oCmVwFfC1vPxUbNjMmgS5BbaHmzrQE=;
	b=EKkYHEWCRmHjGmrLqFfmo8hqE6yLODY6GBmqgssVW/3Cfn79IDNM1iTHBFHv0ZIX8Oey
	 DXttxhx90TZNnbgjF10V1hHGJpStiumaCeHgav2gE1K5uFozyLdguEZ3LcCeSAdMVxxOL
	 RDsZCAdS8XrM5l+n5PhekVSj1DmTm4NXbSBeURiUIEWkktUUI1xnHPASZXYR5h0Ik8Ig2
	 iJfxid7t4ovvLSsl0rEzBBxr+lpvyXch2SdpO/Il9XMV2h+X+t1NJ5qE4B34DZl4U82TL
	 Yj9eIUI2SGlaeeLv1jKFWKIORUM8PgSrBZqFDtttbpXLYmhVN96zZ4Azm1C3bdd3IXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nFDuMamj;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83963606A320
	for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 11:37:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83963606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nFDuMamj
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1a3c08d6928so1109034c88.0
        for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 03:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795174633; x=1795779433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T+MRoJIYchkQ3oCmVwFfC1vPxUbNjMmgS5BbaHmzrQE=;
        b=nFDuMamjSMWL/CDdCbD4zTi4BreXTa1+8T7UGi5XYDqmX7AAK7tm65AW/3zsybEMvC
         6Q4bIwYkAALd3v44sOQGMt9rwjn7N1IPBbRmk14jJut6Fy8d1hAETlmSRia+9nVJSO6K
         yPomTLd97CC0a50ov3QgnUsmJ+GIhRhoq6cjxcZ7PRFCiei+8v2I6aAVOO186sS5S4AJ
         CrrWqFSErA5XkBd3HWt0ScFdusOXF+a/9kieovwYH7dZrnnwHN6Y4AbIWdZzEn94tQus
         TeUsEWfTm8rGQ93v4Hz1gMlk2PwYRz/frgLR2hefDYIW7p9xG/POYsjVBULy+T8Md1QG
         T0iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795174633; x=1795779433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T+MRoJIYchkQ3oCmVwFfC1vPxUbNjMmgS5BbaHmzrQE=;
        b=QO2MSFQVZe5GRIYUqWxfwRWa8Oe9mNHs810QEUNYLTqTGQulhLe3rqGlm0lD0JQ37C
         tm6RDqMkop77csq6l2QWBkxh+z5yhLUGlsswR8DADiKIGEpmGsnlU7p6PkbqsZWxwv+j
         eXiHQn7m6RCnZHJ0fVPtJI8jB1utWZCnLJaugLf7FY/ZRE6gQemnnNtCXDO9k3J+WtzM
         KXVKJz42L7FouRLekx7aBcVNdYX4RU0CnvqMkHYscUTL7MS7+xi/MVu+6it68cwvJXBp
         FgprNX33SsHdFepxo2OErID31wuOUtvmTqq0ffqshblWawWoZl1Hm1BVG7bJJx3DFJP5
         btMg==
X-Forwarded-Encrypted: i=1; AL+hErGACGBNMIz2BC1ldOhMb8HJccLa6+E2Z+4of9ceqeYLkAoLu17dZTmiwHIk1OW8y21HQlHG28HEDITKpg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/eL6yxSUZ6lHLTOMwDMYVAQY7LDL5gP3WuA9ASo0ksQlC8IUpG
	pyk2k2F3vkvmC0rvGZrYp45KGLGh5aY09Ca+xVw57c4yu1PhKg1r4u0+
X-Gm-Gg: AYBFou3XG7rg6+9iY38a0EHfeUWZcjg5MGrzUencoCAAGUbZ1n3l6n2bvEGlX0puttL
	768UN3Dj4MIcz20gWuNXf5rXdAn7mJqYMEwAvly52WM38PZm5caex4BzCSAIUGLp1fFps0UKFd+
	F7EfjMxdGcHSsMsWloHpVmjjjDlobjNzCpoBrw1TxszxztMmS6oB0D9bcV7GAfKqX2gMKWZcKwo
	aML0EpkCKSKLgqz3aV/zi89WC5+BJUzjKkLpwapzegajNi+D9C4VPjGPb92IL5GQEqveTUdAXmS
	WE7N/pYS90mVmdUtHtza+ThqBlvoBa9OX9yYofX+ctTizQ4aFvrx2LJcZdwigry/9TajO45upPg
	GICktkmU/ETjErBKgsoFsbIIwVf/Unc1mTnHGa8BWxKfbBiS9M8oiA1zDVqNagaUf6HGP+5r+0f
	2Au8lVRG76F7UZJJBfaR3tPH5VV7aaNLHmxQ7oFUHyWhthxabuf953hlZcaQqFfgq5ngIbmwTYK
	S/bxpIeuSi2pwMo5Ev6IxJMIIMjRKlMf2H1xR5imy7J2j6qRYc1Bz3JQPvd8Ky1RaBVRPrExPok
	sxazR6w+KWwx0Y40o5ywI3Bsuut67uq58WXBrtRCZUMGUK6IeK4=
X-Received: by 2002:a05:701b:455b:10b0:1b3:b833:6565 with SMTP id a92af1059eb24-1b5568a1550mr2404004c88.20.1795174632489;
        Fri, 20 Nov 2026 03:37:12 -0800 (PST)
Received: from localhost.localdomain ([103.179.231.88])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm11664119c88.9.2026.11.20.03.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:37:12 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: perex@perex.cz,
	tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH] ALSA: pcm: Fix incorrect numerator selection in snd_interval_ratden()
Date: Fri, 20 Nov 2026 11:36:32 +0000
Message-ID: <20261120113632.2761-1-sreekuttan2156239@gmail.com>
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

When the calculated numerator is smaller than num_min, the
function incorrectly sets it to num_max instead of num_min.

This can produce an invalid interval by making the calculated
minimum numerator larger than the maximum numerator, even when
a valid range exists.

Set the numerator to num_min when it falls below the minimum
allowed value. This allows the function to calculate the correct
lower bound and prevents valid intervals from being rejected.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 sound/core/pcm_lib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index bb16738bb591..65c7472ef22e 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -966,7 +966,7 @@ static int snd_interval_ratden(struct snd_interval *i,
 		if (num > rats[k].num_max)
 			continue;
 		if (num < rats[k].num_min)
-			num = rats[k].num_max;
+			num = rats[k].num_min;
 		else {
 			unsigned int r;
 			r = (num - rats[k].num_min) % rats[k].num_step;
-- 
2.55.0

