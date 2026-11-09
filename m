Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794214804;
	b=ZGx2ElDMbdg43O+577jH4JfYNHdgzA+HmsLeRMmw+r0VDIcFWQ6e45cL38KaWDK2D/Eu
	 J0cosh/fAXdpvUsSZV0Rc4lL2XrACQL2+ruZK6698GQpUO/FJsxqEk0vycpKhjWsnHj8M
	 hrFrMSMZqGtzWPE9bKMP248ucZUYtvFzsaQCm7nx/LmAUSusIgtqLylLgp6vKuAXp3t7i
	 RcMPYkUJ58Fl/0TN67nA6PALKPChztYX/FjTiSoygqV1RUyKm7FdP0NOtbgZS1CQ8VdbZ
	 XbLdODcJj7gui3vm2p8Kbt1RS/RbvNR9nNle0gQaTDq0rFL5qEQgMh2B5cx33NkIESQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794214804;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yQXobzejMRZh3ysr8GTdI+280uHXDw6bGTek6fjRRrM=;
	b=Xq7WpINseD/07+mBV/ga+u4aLGir5JFH3ibeyew5bKHz8imLgYx1ip23t6wm7yMaFr+1
	 gJOqkdkHYsSMES9ePtCpqzCXPZhZ0TMRTr5Cx2HhaN/LPXM3LvxIowpNrb9muEkCkvAGv
	 gw+hZBFqHB3Lfx95mCDFZpiwGL/awrAOVrpQ6BJ843hAq0PqZTEHLQwaHouMDWPcHS4m0
	 8iVnIjhwf2n/Y4BjSRlEifMj+xvZ8toKjrJvD+8qoI5FRJi4bKomGCdFNFdKjR4VsYEMi
	 aZIr2/TZYBlzLQBfM8yDjrIbWnFzLzLrkuzkpVgdu0PGZjAs5r44Zh0oUcOUoY7ZpPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="L/MFGmrB";
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D47B606A323
	for <linux-sound@vger.kernel.org>; Mon,  9 Nov 2026 09:00:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D47B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L/MFGmrB
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so1315294eec.0
        for <linux-sound@vger.kernel.org>; Mon, 09 Nov 2026 01:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794214803; x=1794819603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yQXobzejMRZh3ysr8GTdI+280uHXDw6bGTek6fjRRrM=;
        b=L/MFGmrBWu0zj3v/CU7k0qJAB2PYPLJH5YZsOO3Of2RFrAGJtG1CWi8jKtElpUnIgw
         E24QIUOc3q7KejARiFZULq/nMFfS1ZaqFuUuS01HdyFScbFiSe546wGkPtxqYOEQS/6t
         t9UoqMewi3gNMMWH7o2aQxLrrQWlgxGgV8sJR85DtphSq48u03hIlFCILSFmflt5qYym
         5ZSyQ7eOrYv8iDg4huYO/Gg2ceI1Tw07QoywaM8lmZiDqeqy8R+4s7XSvkRUN7j6t+KT
         vw8/qXMGl/f9S/SrquXikuwAVEALqila0q9cvCce2cZvaI4woFFkBBMwx2BCnvhkjTxi
         wJ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794214803; x=1794819603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yQXobzejMRZh3ysr8GTdI+280uHXDw6bGTek6fjRRrM=;
        b=DMgEZ3TFyiEJs33dp9nY9AlsaJFMgs9MZmXrtJnCLWkHGaDKF8jrcg+qT0EbYf1WuF
         vj2Oohox1lxizBb8CRrHkRKwau6+oAenRZiWi56l5UmROPlo8wOvuS3/cZqdnihV5RUp
         8dYEa3BDMkQFDgmK3zXQ+RKZWKsRNmS8P5RyzsCmOk4LPAnkCINsP/9MJbe/hXCCiWjy
         K/Zu9z56+UD/1Ux4VCO1K9nY4T3d1frT+P3rx/hyZrW2SiNLz1v7HI8ePj9WEZi/uWjB
         s7RZRsrpS5pXjL2kOLrlJQjQTeYxs2z7Nwo5NcRy7zp0bCV3nvN/KlNNraqgXP/qljiI
         /jlA==
X-Forwarded-Encrypted: i=1; AL+hErHj+0HbLBOR8EBvd8s4+FHlnVj5JUyMmhoPhVo6HoQ/6V+G8j15EkeaWVruBSis1pqMh+eTUCLEinyFTA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/asnBp0E6O3x+3ElSxMAWzxflfTOGd5VOvwtnnw7d1J5do9QOs
	yhSdQdJhmLv6O3NybmvUfusoSbn/U8vZPj37SQbg7GKH/j5UiIP4LxrZ0i4QZ6+9
X-Gm-Gg: AYBFou3S3auWpr3KAuKvCv+6PhPhstX8je8amMrOaY7bY4GIs2OOFKYvHn2BFvHBD7C
	r0FjUQmsghPtnVI35mDh5WBQzvFiAjT7cnPh/HJxkJTZRnszLjPUzleh8lq2MiXsW4fWOA7YEl7
	Caf62XcEQ/Dhy1GZ5xe3CoBOl3yFZ1fXRNtju9ksXq7SJgahI52YR+nfpfaoulFTGYR9D2YImlr
	+EZSIJvVGUbbxROkQA03yLaFX1RcPTZqJf1RU06wupn6XOSsRLdBxKsldfDU0n4ZKaZHGpqRkBF
	Zo1VZUAqks7QhLbs6Dl87OV4/H6lorYc4CwvR505KezYFg8fiha6FB+yvGi39DNI4LEHiK4UIwK
	lcOCWURls6IGDFqvQVk2/deF2RLyAQO5SqJ+YGYouPLhWkveBAglDsfBiFDWDH+WsFyu2AAf0Nj
	aM29SF2nO85K43aKcrtSzccBGMO/FK0HgX/9yEgPfDsr/5iYLxlC0yXo4DQLtPqgbPygrkFGyVB
	/Y9Du6+f3ZccW5HuVVn51A41dtmsL7nntJ784yLjhPhmjV4vi73/j5l8AnAoEopX772HRdXv+LP
	10KY56seqc8gfYG0/Jmnk5s8Ful0eexvOAeXsq81Gt6j/eiOpnYD
X-Received: by 2002:a05:7300:8a19:b0:369:1401:c5c2 with SMTP id 5a478bee46e88-372570dabfcmr6174902eec.26.1794214803088;
        Mon, 09 Nov 2026 01:00:03 -0800 (PST)
Received: from localhost.localdomain ([103.178.204.106])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265efd2dcsm11376971eec.17.2026.11.09.01.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 01:00:02 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: sreekuttan2156239@gmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	tiwai@suse.de
Subject: [PATCH v2] ALSA: core: Fix info read handling
Date: Mon,  9 Nov 2026 08:59:22 +0000
Message-ID: <20261109085922.3104-1-sreekuttan2156239@gmail.com>
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

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
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

