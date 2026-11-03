Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793664271;
	b=BMjHABjLAlg2a8jYp50MKBKUS5lN7B5SSDGJy+0kLiEkcFi3AsknuJN939mJLDeOdOoP
	 7mVxRGXcC9SqaLE+mzHsmN9t/1ItfqVAxWpOdDmdITnOZpA0A/SsHW7YmGp7z2Tk++wGz
	 xlXxPv4zwnTIEVOz/h/4lAXfCRJX7Q1KoDQoqX8IUkQuw1xvhIIyJAdrGFjwe8QNCRCJC
	 MyX45aNH1UUeRPgUIxK56I36CHq5qAKcPkgA6s85JfXUTQYo/CFYCKk9+QfanPjRS8Nfo
	 LR7d7DqTqlV4UBsRM1i/rBcVotNuPPoHUbyQUmAAe3Fu200GruxOZM4KqvP2DQNQSUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793664271;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xyRi7XDKpXV1gU6ovNhxbTiviMkA7YCbmNrm8NAAe74=;
	b=m5ukJ8HhlmPUSa/NOKFLmq1s+2np8fk+Zy3Qy0j3fVTELlpV2S22ROO2w5V59Xp8QL4t
	 BMvc2M6zu+Y1T+z1sdtenbQZANm1/BFZ0BXNlUHmdN5SCeS8fEpo3BNY0iUKb2SOClLbX
	 Nv84wjKMP1etijnne7UDI4to6U2A5BeKrCjd0ntsVPhgxBpRXZePmBS3unmVnVcGEfaKc
	 m06PVMD2YdnfmRKF7zWoFlE8SXzsxW4/FwkKIyKVGxUCBAZCp/H/swxdZh8DSHbjcJIM8
	 9I+31rLxK3cB4n6wlun/GOpcyQiQxQ4lMSb1Vge+2+mDvYSwBP31kiTqXrfqRS0KgnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wOeKq7m1;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252AE606A33A
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 00:04:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 252AE606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wOeKq7m1
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3a4b3ac8fb7so2156211a91.0
        for <linux-sound@vger.kernel.org>; Mon, 02 Nov 2026 16:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793664269; x=1794269069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xyRi7XDKpXV1gU6ovNhxbTiviMkA7YCbmNrm8NAAe74=;
        b=wOeKq7m1cbAxaY5QEufLB6DkHrsCdHAvNkLj5yF7gMkIpLHlSx/ziMJqqcvu7dxbJM
         Yib3p0Th43UH37324d2EN4Z8KO/1+ZRKtST0NFaxmf2yXYVtbGYvhO4961888jc8Akce
         ZxKclR/HRspBJidN+Yb9O1Sg4d7LjwdvrunsGvgyJ6+Wl2FASE7B0+h3uQJ0THHytn3O
         zH26Ub8GMy5VIcPgSXRIlI6mLV5x0tZBut20+q4MamqL4zzw32kKNW6Avdm6ukGCWc91
         VSLyX2kbKiXonuDlb4uDghjscQ9KhlABU8Zqs85cjRmq1b1iFy5A1ew2PKhT7Vihzcu0
         cTHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793664269; x=1794269069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xyRi7XDKpXV1gU6ovNhxbTiviMkA7YCbmNrm8NAAe74=;
        b=ro3F98hPCT+gnZbW0agWM0oZ++ikruvOx8+Qg2FABbe6kuRQHcEIGtYpXFkcwDwOUG
         asyjcLWuyl17r7tHey5EYKtco4KmktCLXxciqrQgQp1f1cvoG+mvAv8un2myH2rEoVqh
         jiV9esT8lic8fLL71ZDifSgedvv6rbP14fwFYIUhONED5K0rjXUA4Md6YhRllTUUvcFj
         YM/H5SLh7J2IJYeivwylKSf0P9VQgXpcmuy4cz8qxMPRmDL/nkU5FFUjK9T+TMxOWc6I
         YMfZvZpXiYjQtJoEHLRhVspK6Jt6W9hndycWS9KOvOYyPRyIxzIzOjUEMJ+jTkI/pWhX
         Ekmg==
X-Gm-Message-State: APuU4Z8OUeC2WoW6V1VnUnnDN3hKh2n5UewPGQ6OrTJ+SpueOaAHv2Mw
	3FrSyVmR2fuzsvdudUtMwD2pCV/n25tdnmUclainmvjVnmD7dyXb/+uxtyaGww==
X-Gm-Gg: AYBFou3X1cERXB+JKxUxbZRemNQBlO5y41y5eFmYHYKVgedptFOXilkLKU3JReSi68B
	A3rY9mYJbGS+0kmowhAeBJSvlB84PwsyeY2aukxE53gMbgiFPtN5ZJ672GthPG6c4fz3pdr9Ptk
	iTf8KOICzgMlMjKdans2oW/K0kiSV/uLUJu5a9uL5/1ov8/41e7y5NFvFkeY1XD6EnwOPzFagXx
	CU3vt8uh2CMj7mwPG/Zz7UHE1g0i6aR7gN7GhtNJj/j+DjOMyng1QzrklhS1Lc/IQYCUf7604i5
	3LUtqsT57czwFsePc5drtI1fzuLJEO8eb9PRyj8bcoVwax0YtBG19UpvQ7p7twlYqtvEGXJcOSl
	s3zrYPNzMWQsq6GEM8eCfVVBWttI27PI7z4arOZPtxI7bxa+m1jY1IO7WgR+Q+mNbveT00RCe5m
	wR0IjAYdEG/B6XRecF2xGwrxTIcjlx6M/af3hJXN2z2zDIiDuMibZREAnpjQssBzRJC8NhR+UXo
	URhWUSaY5/uNmOCkoIRXL44lacR9WTJI5YQdqZKJW7+VYsAyjmhrqfz89sHSN1I75el1ggjN5wk
	HRKTlbwrt/aT1mTH+eY9usqZTPzDyWp6GS8kyzZHxFU9XsIwlVoH4YwAXqt3K+hybUDbuH4Ps8f
	kiNZqn1AWxPjZSMNuxkQrivqiZtzvGHyUEk0pEQ6yg7ivwh4hcqQpbkAJKapbMUWJ21nt
X-Received: by 2002:a17:90b:2b47:b0:3a2:b16d:928b with SMTP id 98e67ed59e1d1-3ae897a5c58mr9348377a91.46.1793664269378;
        Mon, 02 Nov 2026 16:04:29 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c6b3493sm1339225a91.13.2026.11.02.16.04.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Nov 2026 16:04:28 -0800 (PST)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	perex@perex.cz,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	Joonho Lee <mynameisjune111@gmail.com>
Subject: [PATCH v12 06/12] ALSA: virtio: wait through signals for PCM teardown
Date: Tue,  3 Nov 2026 09:03:57 +0900
Message-ID: <20261103000403.67106-7-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261103000403.67106-1-mynameisjune111@gmail.com>
References: <20261103000403.67106-1-mynameisjune111@gmail.com>
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

A signal can end the interruptible wait while a STOP or RELEASE request is
still pending. A later teardown may then submit another RELEASE before the
first request completes.

Keep both waits non-interruptible and use the existing message timeout.
Other control requests remain interruptible. Device reset still cancels the
pending request and wakes the waiter.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
diff --git a/sound/virtio/virtio_ctl_msg.c b/sound/virtio/virtio_ctl_msg.c
--- a/sound/virtio/virtio_ctl_msg.c
+++ b/sound/virtio/virtio_ctl_msg.c
@@ -314,7 +314,20 @@
 		 */
 		virtsnd_ctl_msg_unref(msg);
 	} else if (!nowait) {
-		rc = wait_for_completion_interruptible_timeout(&msg->notify, js);
+		/*
+		 * Teardown must observe completion even with a pending signal.
+		 * Otherwise a subsequent open can retry RELEASE while the device
+		 * is still processing the previous teardown request.
+		 */
+		switch (le32_to_cpu(request->code)) {
+		case VIRTIO_SND_R_PCM_STOP:
+		case VIRTIO_SND_R_PCM_RELEASE:
+			rc = wait_for_completion_timeout(&msg->notify, js);
+			break;
+		default:
+			rc = wait_for_completion_interruptible_timeout(&msg->notify, js);
+			break;
+		}
 		if (!rc) {
 			dev_err(&vdev->dev,
 				"control message (0x%08x) timeout\n",
diff --git a/sound/virtio/virtio_ctl_msg.h b/sound/virtio/virtio_ctl_msg.h
--- a/sound/virtio/virtio_ctl_msg.h
+++ b/sound/virtio/virtio_ctl_msg.h
@@ -47,6 +47,9 @@
  * The msg_timeout_ms module parameter defines the message completion timeout.
  * If the message is not completed within this time, the function will return an
  * error.
+ * PCM STOP and RELEASE wait through pending signals within this timeout.
+ * Other requests remain interruptible. Device reset cancels and wakes either
+ * kind of waiter.
  *
  * Context: Any context that permits to sleep.
  * Return: 0 on success, -errno on failure.
