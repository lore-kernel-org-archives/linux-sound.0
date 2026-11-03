Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793693349;
	b=saRKTkVen3KVc5DJiGTNPxyH04iz8oWR3cMbvfkBviqC1feiwrZZA5qyUlhMFCDZ3NU0
	 vGr7cv7e53GnpLAHLLrPhpajcBl146Pkb7ZX44a3ddhF5H+t1hxM4D+V8l/ZQaid2UW2R
	 7PN9pdLTw4SIORVoMjCoWgxWKyWBRQCaEGzLPw3H09LKT8DMOjpTWDZp+dTL7bxMNqx5p
	 FPREzoc6j33jHAuD5KiZ1Tz/j++4b/A8gNGypU4LBkYgqC4QtQ6D/thv63pN5S+27plT3
	 XplOj1lQBtLtuPvQaqyzUnQpsTPh8X/8Osv+56HF3XaK5Keb/hZSYcnTgrDGHJPh1lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793693349;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vOwlBcev1S8HKV7nx+URCpkHr4Kt/un4+8T7BIrH814=;
	b=o2nEU62R/BMJdiLVQkr/OaydepLoo/J+h8FLd99YyZ/IUpYTAv7w4OOVzkfXct+L2VTk
	 QGnLrV2AXl16dD5Oez4qZB9AveqWFxvDxqlp8pQmRYfh1YW2L21kOUVt+JHIgEHk2viso
	 rg6cyzDS6BBMz0r+NeXVW+x4J361zAF28QypbXp9CjRoqynQyGkNoGxtg/2/BPokmNDTB
	 zrE1x4W7Zt2WnmAe5Hn0wAnTC8eY7Wuta1eYUjtbYBPICvbWJYksYKV8cLoOvv9NVlLRc
	 pe0ftgzKKBemqiEufsQ7XeS78wFvg5d+m0WLX8NBrJE8wgYxuT2jmuy4Ejhechwm0TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LLAOPlZV;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF57606D832
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 08:09:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CF57606D832
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LLAOPlZV
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3514b90bb89so8045537eec.1
        for <linux-sound@vger.kernel.org>; Tue, 03 Nov 2026 00:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793693348; x=1794298148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vOwlBcev1S8HKV7nx+URCpkHr4Kt/un4+8T7BIrH814=;
        b=LLAOPlZV7KPzNmDYlzDokDkrmFSdi2KAjN1Ua8m1mfIGID1L0l7glCXrdPkRLfmK17
         +Enh7KuaBEptKFeoIsmBzqslqMTte/7pdXJKFIo3QmmkwWPrmVBpQ7xxlJmq8NpkJ9fG
         ybuD76d1YsNxzD+bSmLFksuH9hR59zljUaVZk4Mwf3nlQVyCimPSUnecEqQ1a6mJzc6d
         9hYVk9jjVVgcWLCTDjM2z1ty11jjURy45k3SbalYMFPbEyk/Lg+u6pXmWEfF/ZoyEFgY
         A7pnbenVnSvcgvGldM0rtNfyerhDlf1fMP6/5WelSGG8TKAd+zecMXIDVzCFyOrFkWtw
         vQ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793693348; x=1794298148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vOwlBcev1S8HKV7nx+URCpkHr4Kt/un4+8T7BIrH814=;
        b=WOWfqy/IPDQjAw2/e26vMZBxto21pkYX5elrvfJTnlPDEuRA3lPJrLPLYD5yZKu6vQ
         Gh6qzv42tXr0Z7HkQVgDCQgFZnGLgFsiysA+8LovfVvQv1n1pe8ah3BIo5iFzSoVZCZP
         nOUpFRTqVYaC4b9QwA5KtUcI1F6HMHLPFQ0RXABd+5Zh+X4YABmgscS3h6NKfZV7Mk+L
         2/YaZgOW38knJtEZC2ifW5B5aZJ4N2sD+Mmc+v0Ok4NjAARcFZKsG533k2rtHnD/Jp/9
         sbOc3af/zOzLcqGHkiT+QgLXltS6oqsWOsP8b/uyetu3lfztQBtB8Lrej/+O7cWwrqyX
         W7Cg==
X-Gm-Message-State: APuU4Z9lq13WsI2M3QQo2lZKvibaRNMJ64ge8+TVLVx0QHyhCobR9P19
	It2CjyjoCx/ikeBj9EKuy1/XaawxYx0szlXi6Yg3NsmsiwLSS49tHwS3II0VXg==
X-Gm-Gg: AYBFou2iT+OeWlBfeEhkKt7iiy6WrJpTYWCiKt2f3QEWsihMFsZ9pce1/jcWq9NuWYb
	qn5V7VZPE4MZRJDTjgnyIsXQ771/tMT5puOIqSPHojWOSGX5shwh4NYZ4nPgs5cI78UuyasMjkS
	4r/KMcvCweBopjhepXTUxfaDTOUc1hQ0v2iWpDp9SjTIulF1wm5P4X7XIMz55dMYWjkdvCwmIaD
	7ycBm4RwdmeZhEcrKOOiepg7AG6+Ay+kT7jqq9nDYVV/LXmSwQmRvYWe7Wg8k1fvSeBcbSnWH3n
	2X8LaofuPigT/HTf0EckglKim99T+dOyBR1UdHHNOLEhmSttgjTrqMduF/4XohxRsM6Py6btCT/
	IdF1jPixe5VgcnaKt563MyFse0rCHYCroISLp4qB0lOrf6OkpquOXteCgwNEl7UQBHlPZWqqzCm
	CZnOzSdFLthJCMDy4naUkN+rGaeBh2dzD+SAmUpNKk5iy4BKzmXGF+ViKWjXsWGjn+jrABVJOjh
	J06GZoWMYYPxFeQedlABO6gU6K7g2iBYzDpy4LYSuKUhxfS8xuG7GBAooC3OhE6FPHESp6IAciM
	3UT96IwYjAvHmwPmhj2KxnZoKyyP72UGz0ipJSY/u65CH8ESO+v7JClWai8hD4Fb+WKozLF01Id
	j1LzdYYwvFANhnu9iLqKWEG7sGEdDMN06eoAKNfiZn4u7JHk=
X-Received: by 2002:a05:693c:638e:20b0:369:ef63:ea95 with SMTP id 5a478bee46e88-36a423624c8mr18389092eec.6.1793693348178;
        Tue, 03 Nov 2026 00:09:08 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428fa380sm41468466eec.12.2026.11.03.00.09.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 00:09:07 -0800 (PST)
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
Subject: [PATCH v13 12/12] docs: describe virtio-sound capture options
Date: Tue,  3 Nov 2026 17:08:21 +0900
Message-ID: <20261103080821.16983-13-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261103080821.16983-1-mynameisjune111@gmail.com>
References: <20261103080821.16983-1-mynameisjune111@gmail.com>
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

Document the five opt-in capture module parameters introduced by this
series. All default to false. Describe the startup-empty, short-payload,
packed-status and pause-restart compatibility behavior alongside staging,
and require validation with the target device.

Keep the virtio_snd entries after virtio_mmio in alphabetical order.
Include a diffstat in every mail patch.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
 Documentation/admin-guide/kernel-parameters.txt |   30 +++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -8344,6 +8344,36 @@
 
 			Can be used multiple times for multiple devices.
 
+	virtio_snd.capture_allow_empty= [HW,SOUND]
+			Retry a bounded number of empty startup capture replies.
+			Format: <bool>
+			Default: false. Compatibility option for devices that
+			require staged capture; validate with the target device.
+
+	virtio_snd.capture_allow_short= [HW,SOUND]
+			Accept non-empty, frame-aligned short capture replies.
+			Format: <bool>
+			Default: false. Compatibility option for devices that
+			require staged capture; validate with the target device.
+
+	virtio_snd.capture_packed_status= [HW,SOUND]
+			Read status immediately after the returned capture data.
+			Format: <bool>
+			Default: false. Compatibility option for devices that
+			require staged capture; validate with the target device.
+
+	virtio_snd.capture_pause_restart= [HW,SOUND]
+			Release and reprepare capture streams across pause.
+			Format: <bool>
+			Default: false. Compatibility option for devices that
+			require staged capture; validate with the target device.
+
+	virtio_snd.capture_staging= [HW,SOUND]
+			Use request-owned buffers for capture data.
+			Format: <bool>
+			Default: false. Compatibility option for devices that
+			require staged capture; validate with the target device.
+
 	vga=		[BOOT,X86-32] Select a particular video mode
 			See Documentation/arch/x86/boot.rst and
 			Documentation/admin-guide/svga.rst.
