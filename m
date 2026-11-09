Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216206;
	b=JzunaOd0U+J75sSXjSItZO/MqZZVBZBqgG7jE4J3mpkvcyo/VLl6T5tDh+gawe5ORvlG
	 n7kLqocI4t61EdvxCU0MMyyJ1OfePIniaKUZxLyhgZrERVbuuMrjgEYJwqsRNwNBDpt3k
	 ctgY2x4C/Us4cEIX8mFC8s7cItvNp1wgvona0zDS9Cg5uuNNkbS1uX9EsBkzZTGQ7nLFc
	 9hNOGxfwtdO/NRvp5ZLy6vImcetyFJLO9SKfrIF3gljZQxO6zqyd3OVRIvTlUXg5EqV1I
	 P4xoC4z0vLWBkHwBm6xNhBl8oRRP2Sh9tnqHLBShN1P1DfG/r2dNiyqI5owD8k7+ESw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216206;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=D8TR75PpSImbWX1NY6vplNQswxGOV4SePaeper/l4aE=;
	b=Sud2mmstAKSBCAxrCdPUtX4gY3KTovyu9pWJl4vqQTNxRvCxnMBihPQLlvqV1YZLMIF/
	 z7vsyYZF0LRJ4gnOo83TlV1u3vpWWZS6r8CVSIvpySYhNGpvYaGf+GV8t9CKbIOz8DpDO
	 hyrSDKPf+QlI/5gPsJt6acmwqAgpxZdO/lrMxLDdM8vwaIKzetIvd7icFOsju2tW9LQYV
	 daIfXEP8KI8MX6A5Mj4JbNFIGaobQk6nUnhB9E+mix4pW7Ksze4I5ANhriHmNYcepUi/e
	 7xthnQR0pudfG5hvgyfn/uve0Cqk9dkKAk0d37qsaUgUOLo0WqgAZNxE4Z+W63fMHsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="RkqRnTD/";
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA957606D810
	for <linux-sound@vger.kernel.org>; Mon,  9 Nov 2026 09:23:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA957606D810
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RkqRnTD/
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso1002035c88.1
        for <linux-sound@vger.kernel.org>; Mon, 09 Nov 2026 01:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794216205; x=1794821005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D8TR75PpSImbWX1NY6vplNQswxGOV4SePaeper/l4aE=;
        b=RkqRnTD/Nsp2MqgVQr5mWaCauC4meE5ImDzOH8dT9J+c4YtvHmPYSA1DYDS6YJCrvu
         XSsmOLjrAQdYY4GPk/2vk7oQyCo1joEkF45f0+fDFK8h357MsyLB0RsIqb1ezStrgouH
         lknPwRURx1AkLeoEGdqI623veABN4bzfEWK73/M9c0d6zaJM9cA5tDvEOhwLXtDSEDnD
         M++rO/X+2AZd5iUDKSPF5zcZto27PFk8f71Hb1NkspEEtrBIjzQpUjcy2gYlEhhBirzp
         QP1DlyzHf3eoLcp1mHKcNn1IFTEuShPEFqjXwREb0/l1irp4SweOqxpwoyC0O4xcKUAx
         tfmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794216205; x=1794821005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D8TR75PpSImbWX1NY6vplNQswxGOV4SePaeper/l4aE=;
        b=Z3DO0kxLk+UZfNAeUfRXbuWSYJzWD38vxx7EushZ8pzbTPo4xPTUtAXQHO1l7dNUeH
         1tIYHFrHPnic2nopU9vjGB7f3tICoKtdSxEOYvA2sN5vBvX/8FC1jL+R/AKD4P0pbcGA
         /SimWO/OYo4LjPv+o26ecGoPGtKxhp7wcjG3y0VidK81TtIMnZ2cB0urAK/Fy1QgwDjh
         cAbIxpMOywh6q6TrBXbcKzx/QjvoDSLPzLVQLOYVB9YyuWd7FsX75x/JyYUK8e3llbdx
         NXyDDPcZwAPdokbEXyO8uC+5liAQt8c4pYXGoe540mjATKJxji/+E9B/Bu0u5L9QCoF2
         UpSQ==
X-Forwarded-Encrypted: i=1; AL+hErH16tUN3VMCAlOAm9wzd9Wc+bxZocJnp1jZmfBQG91bVve6qdiljr8lQd66548xSYqvtBMZqrzhoo9Gug==@vger.kernel.org
X-Gm-Message-State: APuU4Z8Hz7+Mkm9hxCRemNDxiRZaYMoKKP/v+FPfBVlFWfjCPytOqw/W
	O6hhplVYbvRBMqwTeyZYT5YITb9TjqjYv6fyL1ZV+9emUrMx3xh1npww
X-Gm-Gg: AYBFou2ajWp1TKSUze6b55FFi1HU6J19qzRk5tsJegPlHaY4Rg0II9QQMKyRDw2EY4N
	pxxVRuehzh0lUlUFj9AlUb1ZPElDlEO9tC6ZIPdIojYV8glWH5crnn7ljLsLRMlZbzKc0lxj8bu
	9zJ1Ly6/dBaZ2tOhtbaqhrBVLQV599f1o4LXRr5VqFl8BHX4E4jjk+3FI/hdliEAvsACULyLs3u
	4Tr/1pdZ3SKJibJGvxO47TeZizTRWOZiE1Ets+JeIcoiTDDm3cL6MKjuIeiB+hxqqdxweV3UIfr
	ojQGbFUinXfZoTPR0tb5f5CBjjdMn+Gz0H121zkxZPjyH+bPGpFOx6OP8k4v+M8Oc0JGtOxvVlF
	cfCgnRQ3PWfXUNPzapi1bnuP5d8JGr/pmZL980+JRfonX1RGoVIDe5Knv7T/e9TZb1jgX9ZWMnB
	YCC6h/PwWp12R/qmfHnwMgt0vsuG2RS4zVeVgikgJIgvyxXmbngO7PiszaqDf1fV279/jDeZO9O
	0/+gGcV21+COaOpnZ3fppGVrQhkICx7o0EKzTMrJchvXQbp5LPlNJC3In82SWGZ2rg+Zb9p/CHz
	Bc0ClFhxjHj9JpWokRdpftuaT4xuWZGfW5zKq3AeUer5phLdm75mOoq8xrZE6Boqf7ulhabUvg=
	=
X-Received: by 2002:a05:701b:450c:10b0:1b2:42db:8a1d with SMTP id a92af1059eb24-1b39fea8bc2mr6054370c88.29.1794216204816;
        Mon, 09 Nov 2026 01:23:24 -0800 (PST)
Received: from localhost.localdomain ([103.178.204.106])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b37561ccabsm11059529c88.12.2026.11.09.01.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 01:23:23 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: sreekuttan2156239@gmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	tiwai@suse.de
Subject: [PATCH v3] ALSA: core: Fix info read handling
Date: Mon,  9 Nov 2026 09:22:49 +0000
Message-ID: <20261109092249.3559-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261109080850.2726-1-sreekuttan2156239@gmail.com>
References: <20261109080850.2726-1-sreekuttan2156239@gmail.com>
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

snd_info_entry_read() may invoke driver read callbacks with a
zero-length read when the requested count is zero.

Some callbacks perform zero-sized allocations, such as
vmalloc(0), which can trigger warnings and cause the read to
fail with -ENOMEM.

Return immediately when count is zero to avoid invoking driver
callbacks unnecessarily.

Also, store the callback result in a separate ssize_t variable
instead of reusing the size_t variable. This makes the signedness
explicit and avoids the unnecessary cast when checking whether
to update the file position.

Update the file position only when the callback returns a
positive number of bytes.

Fixes: d97e1b78239c ("ALSA: info - Check file position validity in common layer")
Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
v3:
 - Add Fixes trailer for the commit that introduced the zero-length
   read issue.
v2:
 - Handle zero-length reads in snd_info_entry_read() by returning
   early without invoking the driver callback.
 - Clarify the commit message to describe the ssize_t change as a
   signedness cleanup rather than claiming it fixes incorrectly
   reported callback errors.

 sound/core/info.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/sound/core/info.c b/sound/core/info.c
index c4d57d0809ad..42312136f76c 100644
--- a/sound/core/info.c
+++ b/sound/core/info.c
@@ -144,6 +144,7 @@ static ssize_t snd_info_entry_read(struct file *file, char __user *buffer,
 	struct snd_info_private_data *data = file->private_data;
 	struct snd_info_entry *entry = data->entry;
 	size_t size;
+	ssize_t ret;
 	loff_t pos;
 
 	pos = *offset;
@@ -151,13 +152,15 @@ static ssize_t snd_info_entry_read(struct file *file, char __user *buffer,
 		return -EIO;
 	if (pos >= entry->size)
 		return 0;
+	if (!count)
+		return 0;
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

