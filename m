Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794365872;
	b=XnRJM5FPoBL35h3r543rtm2LdKKv4VJ9xJZQznWUGARAN6nWUrasJW+1r7Z4gRSJSHVa
	 usgn0uBAwZpjZN9TOOwfLTP2oKQHiM3MqF6txD6M+1ByM2+I7RX9A8r42zGsueCbrjsV2
	 nNDW/Tg9SoTnW8pXUDzCB0IeTaJbZWr3/DJ64t3/IW+QNSsYGzLolmcvkdjl1GDJRGU9o
	 rXITVNy+hYh4RCKfxelVgCzUZZbSvv+A6FAnWwuGyzEg2DaEjgcD1LVKh9LjATywlFWVo
	 I+HGYAXhFEZlrIuxi3ZXOS4If7G8Vakl0/SJaltuKlsYUef/DkkUJqQZNU/XlWHHrTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794365872;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Imcpwr06twHG+OjD/ubqaM6iJVR63FkGpgLCF254lbY=;
	b=uXyjE/iGLGfXG0Ar9vXjAitUQzhitctnPLAQSptHkxxTIl03sxLzDHYCUCtK5fx20mUm
	 laFcQZZ6GpDQiDF07nnIP5yi196lYY1p87GYwHmJhEMwJew0OUqJKF7ljnyNZetqYRvHs
	 wM61b2zKWSyZwRoMlxrXPQawb6p2DAKT3AEaNO9ztx4bZOtEY5LaPtcytNxSRjYrg91MM
	 h92Hoemlt93kMz/dryW99wYh4siVQBQsEWF9ct4DveQY2AByjLK0a51PiDMGvULn1az0J
	 XzwzlQvrI4q2X0B7PfZk+xKm1Y3ZE1X6jUC+h93djWf37mJSqDPshrUXZrhlrxHfX5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wCK58krO;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE6160A3833
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 02:57:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAE6160A3833
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wCK58krO
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-33fb4680717so2381646eec.1
        for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 18:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794365871; x=1794970671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Imcpwr06twHG+OjD/ubqaM6iJVR63FkGpgLCF254lbY=;
        b=wCK58krOAI48CojkZN/aXq8C2x/OdbMUHdr11OsZv0JN9Soo3jn3VvhMYrRTtZxdHp
         zQUwyhCX5Nc53aNIhhFGX3IiKCkIgxPHI4WROA2ipTyLrpPGPc9+wLkoO5mCFnwpRsww
         Dh0FAq9sESCBI+VyJAEgZJOZFI3q1Jg7mIbr3Ja1Gd5mgK/Kx9x573keiZYCbHD5hoDu
         deQcpziVRobm8x0O6Y7Sw9+sYBy6ukPbss9Yx3WrbIlx4PtYOMEoBHkRFytqEj4GPlAS
         pY0hHvdnslDVsmuTI6TVYCRs1Aai4/nlRQdNiFMQ3Oij6zLACrzQ4AIF3t10nRkRL+8x
         cMzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794365871; x=1794970671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Imcpwr06twHG+OjD/ubqaM6iJVR63FkGpgLCF254lbY=;
        b=FGCFfxrcNNNggCiU7pnLQd011z+vVefefHj2+fjC4saMipVmbMJIa8eMjf3BT5VViY
         9MAoHfZQ48zTABW0ummWrk1VbittoksUW2oBLcjdYktXOYr/uHMPMLT3dS5asE6XUtjA
         pIui12uhNjqX950ym4KsCyixAjW+CveOMMEXNbH74MPx1BXlJ9cmVSCejxBiG5mAZ2Js
         Y4WxmyXEIH9FvmPPnuQAV8TP3UCVfhu2AjD1/34regiqG7FVKqqlUtNS70YFCmQceT4p
         GXGSzrZCaH4VE4BfO6Ellt9rxI8fkqgb1DbrKi+sheSYCw8srYOeTMF4nU1ahGviIU6D
         jOFg==
X-Gm-Message-State: APuU4Z9I3/RsmmJtjTl5xH7/3Jxh7ZaPGsJ7sAEfHS009hCF1+74JqRx
	P8mSZOaDUS94MlIeI6JQlgB9gbtYvfD8W8kA5ks2MJBLDwL8sieFkEu1zH4ucw==
X-Gm-Gg: AYBFou1RfwMYfB6fXHn436KMOFqhsKJajh8wpXIEymp5wVKsp2e0b+ovfXge/zeTEP4
	WmpNzX5IyLA/QRtDCZdL8J7kxSMqHKFjwIovRBEnOPZeF9XWCyq2CpH9wHCHUF/YCU76HhF9HxI
	FixIDPNI5pxhRrnpQqwWVKnhpGOjQ6AG44PEX/kGsz1F0woAgotkgmGKMR5VOLatCgFw61eL2Pf
	y60KLc/7DfT/BmDeZ+eQUZtqMBNlsTFvCZeXJ7tdbq/UFGrO+Mh2nShJJJH93l0yorewvxAHxYZ
	iObof/KUEvIvc/JjF6WMyrbRiG5H3cQL42efumATdcoZDJd5dyqCzqvTHErgNLV0z/zf5k691Mw
	Jis7qRZ/w/XWXXz16e4pevFqB0ZtRB7LnZxTAhNQ9WM/9QMSiK+E3/V96U+XYgbf6Uh93xNgBGl
	0x/PeadJZulO348npxs0MuRiQ2lHI8pruFzjbM1UG8/UQsDS7YjPKO8IoBXWSQYb+HbDpkNd63f
	/joDHTpqSHUHx89WdxlsYdl/8KggkB8+iVIVecHCp63Il5Qeh9DNveKTZ2MnGCGtfwgqNGl0HAj
	W0IADjKFc7BjHNNrEXaYkXRQt8VE18TRokAuMTCC9CCkahCQDhUBM/ze/t1Fla3smXdocc0hXiJ
	2YgiPmd5yyW2eXMOFRKRaecwE8A3H1u7yhLxRmOL4nvEsCzk=
X-Received: by 2002:a05:7301:5f87:b0:377:678:2309 with SMTP id 5a478bee46e88-37706782738mr104860eec.15.1794365870693;
        Tue, 10 Nov 2026 18:57:50 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm12390018eec.17.2026.11.10.18.57.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 18:57:50 -0800 (PST)
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
Subject: [PATCH v25 14/16] docs: describe virtio-sound capture options
Date: Wed, 11 Nov 2026 11:56:53 +0900
Message-ID: <20261111025655.63951-15-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111025655.63951-1-mynameisjune111@gmail.com>
References: <20261111025655.63951-1-mynameisjune111@gmail.com>
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

Document request-owned capture in the ALSA configuration guide,
including MMU vmalloc page rounding, retained allocation lifetime and
the copy into the ALSA ring.

Describe the two default-off compatibility parameters in the kernel
parameter guide. Native capture pause uses STOP and START. The optional
restart path uses STOP and RELEASE at pause, then PREPARE and START on
resume.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
Documentation/admin-guide/kernel-parameters.txt |   14 ++++++++++++++
 Documentation/sound/alsa-configuration.rst      |   15 +++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -8344,6 +8344,20 @@
 
 			Can be used multiple times for multiple devices.
 
+	virtio_snd.capture_packed_status= [HW,ALSA]
+			Read an explicitly enabled packed status trailer after
+			the returned capture data. The fixed status scatterlist is
+			used by default.
+			Format: <bool>
+			Default: false.
+
+	virtio_snd.capture_pause_restart= [HW,ALSA]
+			Stop and release the stream when pausing capture. On
+			resume, send PREPARE and START. If disabled, pause uses
+			STOP and START while retaining the prepared stream.
+			Format: <bool>
+			Default: false.
+
 	vga=		[BOOT,X86-32] Select a particular video mode
 			See Documentation/arch/x86/boot.rst and
 			Documentation/admin-guide/svga.rst.
diff --git a/Documentation/sound/alsa-configuration.rst b/Documentation/sound/alsa-configuration.rst
--- a/Documentation/sound/alsa-configuration.rst
+++ b/Documentation/sound/alsa-configuration.rst
@@ -2537,6 +2537,21 @@
 
 This module supports multiple cards.
 
+Module virtio-snd
+-----------------
+
+Virtio-sound capture receives data into a separate request buffer for each
+PCM period. The driver validates the responses and appends frame-aligned audio
+to the ALSA ring in request order. Valid short responses are retained. Empty
+responses are accepted only during bounded startup or for requests already in
+flight at STOP or PAUSE.
+
+On MMU systems, the request buffers are vmalloc-backed and page-rounded
+individually. Allocator rounding can make total additional memory exceed the
+ALSA ring size, especially with small periods. The request buffers remain
+allocated from hw_params until hw_free.
+Captured audio is copied from each request buffer into the ALSA ring.
+
 Module snd-virtuoso
 -------------------
 
