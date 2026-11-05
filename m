Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793862576;
	b=pRzFgYbgTN9FBSsRXuxXuRM/fYKpQ6g6E/QZnD37aa90/G44XCL6JKuvpeZIkfye286r
	 uxTb5Vn1Vg/z216B0JvqDW2T9NX2wWQB1dRMxjhoIdxOO2/vbl0u6Sr6mEmACEL2Od9Xj
	 LOZzoA32+UzTa03qjQtbj15aoQja8qh+ORU6yetwKfoAZxzJVmKLghEgINAafMjyH3Xh7
	 hjg/qo1sxDU1o7ZccKaiQvQpTV1NSLkdObo/fmeYs0UwK42sWoFSXQb0rIgP3BYAalDks
	 61dpaOUiGyOxyuWxxFOz6Y4ATGtJEUuMOqTmsaE/Fpt7XYQMcF8vZwsBiurzkus906g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793862576;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yx9qdA7I7keZZm8UafgJgTm1z4N4QlAmh4J6h6T4bZg=;
	b=46XiUt82Y+m2aBevAdhsAEK6iakzRCjybebT+nwDLaLJsSMEqfE4YcFcGjaGf/DfZWm7
	 7vNp8OEslWz3+6YAdS59tFL7qEqgRn1JVnP5Aa9RCgq4vTx3TZQt/kBtJjbIPKHrHXf92
	 eIgE0NhhUacC4GoXZlD8ZBSZ/ES1QN6FiKCrq0+MNr5TFcGpl0TWKmlgHxcTjNepIXfbu
	 3nkQ0sBBW/mBS9G6apo8+flxM8QEXJj+fBA8riUtGsxHhWAyjFFOnT24269jjIEzXt5J3
	 OIqmqo0N84OevNpCiizwxUESwNRwdxGXv8bLJPdyc+B2DOexpFgNJCMSY8Y2gJICiiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oiLL7rug;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6DE606EE9E
	for <linux-sound@vger.kernel.org>; Thu,  5 Nov 2026 07:09:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD6DE606EE9E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oiLL7rug
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3535a54bed9so2050105eec.1
        for <linux-sound@vger.kernel.org>; Wed, 04 Nov 2026 23:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793862575; x=1794467375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yx9qdA7I7keZZm8UafgJgTm1z4N4QlAmh4J6h6T4bZg=;
        b=oiLL7rugBCu6/0+7veAcixdoVtJ8+dAaB0jZJzRuCWtcEAPPSjYnfxnEzQ8gsNHgmB
         LPMSs3udVmjZERUq/VzByNWXLljwOB1vQrmh2xLniv9yIVdZAebzRizSfgRVUJ46XqYV
         6aeo+d1hXqwCi0LruTYRGL32tLAoCQJqpZNv3jFPAsFXGjA7pJq9YFxfS3m0fk2yTRpx
         hamAOQxmK5H8FaKrMjR06/FHvZbYyN3cZz2hd5XBSYHlwWRMxHOXiwoHzsNDa1AOP6Yr
         xlPqMHdqcPnvohGQEhaqFr6YmBpEm50z+LOyYoPk080MbW9bhWbmnLSjG7hv4HHmWPXk
         QvoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793862575; x=1794467375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yx9qdA7I7keZZm8UafgJgTm1z4N4QlAmh4J6h6T4bZg=;
        b=1EMToS32iXbI7onNfqxqX9R0YDvGb++aWyKYj7PmWUFKGV29LDUz6+cgfLBcsEvaXQ
         VXiUp94M2jcw+/9Q+285Lh8SdRRUgV+f1uawD+2NVQ7XvfjGVOfMQl52NzGzBeH5Gktg
         XZacQu3zrNDngE0+1FPAqRCwlliTe6kdRbhU8MD40a405OqCxfpWZLMQkKnqS4BRDZkp
         1djulNumPmbLbCXlWEYPEvKVZ0/TOf6Z7Xaf2Gbamt63B/MRQI2c1ssevmneYHJU+YJ+
         NoiPzG6PZwq8gR82nuWxzSXul1BT4JqPcTl9t2qvUw9FX6WCHkZq5ocmLDCu8DPVJ0zJ
         PV4w==
X-Gm-Message-State: APuU4Z/HiFt0vN3/WTidC4u8NJaLabgePOzKy0lH4eG5EC7RhHqaCNln
	ia3lJUsQkJhszUAWZvCz2T3R/aqI91ZKErpFNxRISJmiu1BExOGJGgOfufPhbQ==
X-Gm-Gg: AYBFou300kS6FK7CVRpdml8KqEiRqxrjkuHrH3PBgX/VeDT0sZJ3bkPhw4rwj8Fo/B2
	sP9vw7Kf0s9PRGBfRr8bgTmOmSi0od5BWQ4+Z4W3mWEi8Q3+I+cGH0T36lQ0FMqZGlhURkYyKyf
	zERhHbaeqdVWMzu0B0/rG/IO7UD1BRjhG1gddI5mxZsNfuwdQtfBk7O9vr4PwjQCDZTPQ5WUjHs
	HnBLBVjqgXGddQz/Gk7SOa7vDQst+n9SnPaoEVEFfPoWn5eaNBH0Y+C+0iS5qqIal68KZ/KduLc
	pnoW6epKEX872xuTjrit4gRfaXTIT0wnuH2rs+lhlXsp6vJmGbzK1fV8JIWJ/17TU776JHOuqDG
	ceQ2nXK4Qt/pIGAY3FDFMWX/Rtpmk+tHXo34/ZMB6pHjIl2BiZ+CtSxxnJG7tb0mvRNj05iv4ap
	T+uUm2mJ6EzkkaUfJaTzfotnk2dbX5BKN4wjPW9zj4XRPUVrrhTg07q03kWsqFNdCLUtWiSNIIn
	YZE66Nayd/xLmQVcZlaMkI2rhshFWATFrVgoBF5xKiT30xB9v4Y4t/XmpKZOAGbCqT1uqqh7Yov
	GEiy1m+3UxbosmgffblSYuIZTPYDgpI+AT6U1cfgvBXOQS1ZPVmAAoV4WEaY6xO8wJT+LUnv5p1
	6A3nsy2m7pIZRnngM4ZZyZNtAIF/q1wMxY5QALMcmD8Ajqrs=
X-Received: by 2002:a05:7300:d80c:b0:36b:c491:93dd with SMTP id 5a478bee46e88-36bc491a788mr11101969eec.18.1793862574798;
        Wed, 04 Nov 2026 23:09:34 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3981ff0sm16812286eec.24.2026.11.04.23.09.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 23:09:34 -0800 (PST)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
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
Subject: [PATCH v17 12/12] docs: describe virtio-sound capture options
Date: Thu,  5 Nov 2026 16:08:45 +0900
Message-ID: <20261105070845.6449-13-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105070845.6449-1-mynameisjune111@gmail.com>
References: <20261105070845.6449-1-mynameisjune111@gmail.com>
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

Document the five opt-in virtio_snd capture module parameters. State
that capture_allow_empty, capture_allow_short, capture_packed_status and
capture_pause_restart require capture_staging, and use the ALSA kernel
parameter restriction tag for each entry.
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
Documentation/admin-guide/kernel-parameters.txt |   29 +++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -8344,6 +8344,35 @@
 
 			Can be used multiple times for multiple devices.
 
+	virtio_snd.capture_allow_empty= [HW,ALSA]
+			Retry a bounded number of empty startup capture replies
+			when virtio_snd.capture_staging=1.
+			Format: <bool>
+			Default: false. Validate with the target device.
+
+	virtio_snd.capture_allow_short= [HW,ALSA]
+			Accept non-empty, frame-aligned short capture replies
+			when virtio_snd.capture_staging=1.
+			Format: <bool>
+			Default: false. Validate with the target device.
+
+	virtio_snd.capture_packed_status= [HW,ALSA]
+			Read status immediately after the returned capture data
+			when virtio_snd.capture_staging=1.
+			Format: <bool>
+			Default: false. Validate with the target device.
+
+	virtio_snd.capture_pause_restart= [HW,ALSA]
+			Release and reprepare capture streams across pause when
+			virtio_snd.capture_staging=1.
+			Format: <bool>
+			Default: false. Validate with the target device.
+
+	virtio_snd.capture_staging= [HW,ALSA]
+			Enable staged capture using request-owned buffers.
+			Format: <bool>
+			Default: false. Validate with the target device.
+
 	vga=		[BOOT,X86-32] Select a particular video mode
 			See Documentation/arch/x86/boot.rst and
 			Documentation/admin-guide/svga.rst.
