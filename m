Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD16B5237AB
	for <linux-sound@vger.kernel.org>; Tue,  8 Sep 2026 11:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788865309; cv=none; b=eJpyLMtcmTCfXHq3dzN3qJEbG/D0iv8TyGLPtOR/a6MoK/8PxmS8S3gHCmJVqrta99VY+oXC4fXd2V4YxuENs7ZOI8NzubjDsB+Pu1UidluFq9adabww8jZIF2AO2OGlZmK7nMGk9ZaAPhkvuHbzRFGyXLvWUfaQbrE8tRWrBKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788865309; c=relaxed/simple;
	bh=JNIxa+Q0uCVgKetLJLxRgWMaDSMh9rMFW0vqnWvekdw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TnGBVDCSj0J4C+qif4G4+5aXxYn9M7xFHzdbc3H//wU/1KU2rBMaLyk1iBvEm/9sS0Ms7BM95qNmSFERMqAeGZhWPlshOu0dJOnSR4azVN35dchUp9MA4m5Q9+NNhxjZ5Vuw/drg2ORWHDIE1CFZdaUpbR/X7nWb0V66vbNWpvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pu8LKYyt; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pu8LKYyt"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-66fc2844f0eso4316522d50.1
        for <linux-sound@vger.kernel.org>; Tue, 08 Sep 2026 04:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788865307; x=1789470107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+dgpGZXxyzJEKTUi5CrmtVo7cbMHzzenxTIN8C/YkDs=;
        b=pu8LKYytw+Cy19gBAmwVuh5SAcXgiaH+lPzurYikE0DbuPDylpDf7olAe39Xg7OPPN
         TUfnincYDHZ7ReQC/VeMXv1KcLCpLkTrpzJh2On+7nlHjuFCI6y/1MLV8EwQ/OW6GNUa
         aCsUnau/4ycpaHtoLkafGygLsxTWHa2ChNAjG5FUukDqMWjlv3yhC0d37WNbrRfuLIkv
         vZidg4gOqBzfh2RBbYUi8JHmy9dxdwhBHcQsK52T3Eio9WQOYA3EnZai9RBGzgrSYDwG
         FRW1LmGvJSyU1S9a+oY2SB0OcvxlZ0+NkudXyGCNhnSye2ip/J0xOFVGgU+3yI7xzStO
         20Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788865307; x=1789470107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+dgpGZXxyzJEKTUi5CrmtVo7cbMHzzenxTIN8C/YkDs=;
        b=A+3AUvdjDK9CCNIf0cyPIqvuU+ihJ6CJ/KkzIfr+v4I3K3Ez8nXDRGAnr2ZUuAaJ9L
         JWnqeuMoj9bBfP1smVrWznnNrVQ/1SFxxjZsNolp8LT7Zs/rX0cQztRfYJGV7IExphgG
         0Dqq2jvGL4FqDiJyQ6ofOmWbyXSlM/xNy67DigRDCEB+OVLZOmgd5BAMCC7Z1D8Dl8eG
         C+cOqyHZ/g/+xIGR4BTo8Y744uHZ3WujPp5oKnumJogoAW8sVH9ySzmGrblb6h9OqUmd
         pbEXaPelOPiSALJ4b3dnP4mTrUSDfW6ViT2TOkOlcLOo0XF/oTCGBvNXg2pRpm49q8Sk
         FxSw==
X-Gm-Message-State: AFuF++khz7O8fFbz52OEGoSBPhwTqd+jphq7NUJovPrl0YqJtYRkW28s
	UFi8tHyMZ5ye2I6rhQFzqG8tPuWUFY8HQeDOwrEWsPr8O4alw2rPXyzad7uWjA==
X-Gm-Gg: AYBFou3kiz9waQ32R92MzCxZjt+ACdFbEOYj+txUnFCryLBKIEwTVrpovkbQC9GDbAH
	YacHJS5q2z7SpAi1RDO6BawS/wMoQbJxftr7hvJ0e4doIGDMLj22CqxYf3QWJuzLidgzWeQewBv
	Bt04+Lo7lVAJUOYzW08NlnfjgFy1ncFplAYnhWUNikX4yYc2IOwFwZcA+ocFKE4p64TESoi17a6
	rU0qNgIuFoo8zD/Mzb0ZtYZk/lXDYmaLZiovu6oOHimfbDHRjE7DVn6YQULYZNH86B4jaMC9M3i
	7QzidOB7iDGZrn7F7d4/qNahb1gBbEEMizj1FJHYMF/07F/gvc1kgi2tK9ilT46EyplEwii0N2x
	Ixo+hpqZO66viJgW7FYW/j9IlyiQE0d/aC7GbNan+A2zwCdLSXWuekEnF6XHaX5R921q6QWWiwp
	Te+zoLnGxFDr1r4207xeJdTV8MXKxPlniQiwE3ef7mxSel94ddKClWQAE2pFGuL+vQxJQ656z7E
	n1AIX+e
X-Received: by 2002:a05:6a20:2586:b0:3d1:8876:fb1e with SMTP id adf61e73a8af0-3da3976ed13mr37575699637.0.1788865272958;
        Tue, 08 Sep 2026 04:01:12 -0700 (PDT)
Received: from hnkz-ubuntu-server ([2404:7a80:860:3300:f22f:74ff:feda:3295])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc455485c25sm5207152a12.26.2026.09.08.04.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 04:01:12 -0700 (PDT)
From: Kazuki Hanai <hnkz.64@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Kazuki Hanai <hnkz.64@gmail.com>
Subject: [PATCH] ALSA: us122l: Prevent write upgrades for read mappings
Date: Tue,  8 Sep 2026 20:00:53 +0900
Message-ID: <20260908110053.2950767-1-hnkz.64@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The hwdep mmap callback rejects read-buffer mappings that are initially
writable, but leaves VM_MAYWRITE set on mappings created with PROT_READ.
A process that can open the hwdep node O_RDWR can later use mprotect() to
make the mapping writable.

The read allocation begins with struct usb_stream. Its read_size member is
used by the fault handler to decide which pages belong to the read buffer.
The read VMA intentionally remains expandable because pcm_usb_stream uses
mremap() after reading that size. Changing read_size first can therefore
map and access pages beyond the allocation. The same member is also
consumed by usb_stream_free(), where changing it can make
free_pages_exact() release pages outside the allocation.

Clear VM_MAYWRITE for read-buffer mappings after rejecting an initially
writable VMA. This keeps the separate output-buffer mapping writable while
preventing later permission upgrades.

Fixes: 030a07e44129 ("ALSA: Add USB US122L driver")
Cc: stable@vger.kernel.org
Signed-off-by: Kazuki Hanai <hnkz.64@gmail.com>
---
 sound/usb/usx2y/us122l.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/usb/usx2y/us122l.c b/sound/usb/usx2y/us122l.c
index f00b53346abd..a5db0d044ef9 100644
--- a/sound/usb/usx2y/us122l.c
+++ b/sound/usb/usx2y/us122l.c
@@ -180,8 +180,11 @@ static int usb_stream_hwdep_mmap(struct snd_hwdep *hw,
 	guard(mutex)(&us122l->mutex);
 	s = us122l->sk.s;
 	read = offset < s->read_size;
-	if (read && area->vm_flags & VM_WRITE)
-		return -EPERM;
+	if (read) {
+		if (area->vm_flags & VM_WRITE)
+			return -EPERM;
+		vm_flags_clear(area, VM_MAYWRITE);
+	}
 	/* if userspace tries to mmap beyond end of our buffer, fail */
 	if (size > PAGE_ALIGN(read ? s->read_size : s->write_size)) {
 		dev_warn(hw->card->dev, "%s: size %lu > %u\n", __func__,
