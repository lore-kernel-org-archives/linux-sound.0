Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794267705;
	b=2D9F+AqN0+lIcrhEZ5io15o7XLke+lkqj5cfH5Z4pxNKk7+36HHsmmItxCW5PwW1imXN
	 dsi0PVzBQKPghlkCehLav5ze/HlC+ZtCqfy3tcpxh1FmWjnbfa3I7Jhx4aY7MGKR8zy/h
	 /a2i30WuhQHUVXGXEC/isDtasM7sA51H8rxLIcvlJA17vbBpFG6nMmxlbJpC53LGVsGKw
	 KT5akOJ7k5PxFGAx1lIeZG784770l3RVhg7cnaw6boFzVPWSQ1/ea3ZWUS+8+ogsIJTpJ
	 H/ipQ9rU8I4iS27BB0xD6dJewk+DvaUj0/7F7MI0yh/2AchUlVIwpcYYXU7a5zx5oPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794267705;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GCeNfDJOwvZXuY8dgM3rlag3FgqE7583M6Aa4tPPS8I=;
	b=o+IhFteDjnAS9RuxUTKnqMlisP5KXmNGLdx6EthNdmKexxn6DNL/KhqhuHNf8ARhm9b+
	 rNvqF1764/ouzO/JOBdocAYFoU0daoRCvK5Rheqx0km38rUzrinR/2bDxDfOAsj1VFTrF
	 9+6QUeR/xaKQObexbrBr3CdpIthxsShSqswtSdKYspc3S0K14Wht54VtQBwMpmffEg5qJ
	 jrfg0gX1TzkOTDwtcxKe/gGId2lGVVNgGwSHHl28RHPurgxJHeFINiN9mScXl7EBRMw9N
	 LvpeltoTOeisOOozMDVk3Na5XuJ8nGraVyKredH5TTSAHzef4cQlOtqOAe4uoZR+tiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nmcIAWFw;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A24B60A3828
	for <linux-sound@vger.kernel.org>; Mon,  9 Nov 2026 23:41:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A24B60A3828
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nmcIAWFw
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-33fb4680717so3074649eec.1
        for <linux-sound@vger.kernel.org>; Mon, 09 Nov 2026 15:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794267704; x=1794872504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GCeNfDJOwvZXuY8dgM3rlag3FgqE7583M6Aa4tPPS8I=;
        b=nmcIAWFw/n8RfPX81fr9NsZRJSbTr2HV/ycuyxDSLyPKUO6oC7t7hUcObhwj7MFDSW
         +Kww1rTEKgWwGSJAlpnUvTzhNb8vHyitkojcjY3b/PbO2g4ZB3dLdxF+VL93HL9omZvp
         hyLk5j4Kjm3IGx4dGasCKVLaqhHJCk6dzRm6N2bPTE7zoYVMmE1Eq4iUBZ6spEeZ4vkt
         nJ5LjoemwYG3swyL+b1RlLPVTYMOXRXvuVhNZCSUGG3z73hLIYRRnJ5jm7j653iFVAX5
         ITicfRqhURpO0gpEA7eHOJWSW5z5EWzlohdqi+4DEJgIKC4Xtnw2zVbvsWmXHhKnItPg
         CMsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794267704; x=1794872504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GCeNfDJOwvZXuY8dgM3rlag3FgqE7583M6Aa4tPPS8I=;
        b=d9cWltkkFeQRLvsAwyZgb4tfEzickzorXg4W6NNhmXd01O+wXM0JYFmU8DyJGgJRAG
         MGk1bY02vSRHFp/6eytY+QygXPkjc5eAfp4e3Q5Dci0x+4ibq6f79agkKsAn8YZ6gG3p
         rY5W7ORB9CLrxCa5ylQkgzHUqPCdGN7lDObG8UIMMA0xtBNKipHUiJzFLtjaNzEdJhH6
         GFBWiAQovgUe15yYwrrdgTapcW0M3avhgPvxFo54tprdtzeDH+J/OybYMWu7TUUzszqP
         lrnNxVY+pSEsB0HA/hNbKMGk2WHbGTokvspYH4se84dGqTKHsMUq/ON0lduy53cRxCEQ
         1iqw==
X-Gm-Message-State: APuU4Z8828zj/JqvHcdxwxL0nWmRMnVdVmRfOJhjFLgiGKq7D092avCL
	P1riBvsZFvIioE/m2sKzHFe3pqivAQ3CE8v12kwhwe1yHHs0kQQVFuoAE51CFg==
X-Gm-Gg: AYBFou3Pn1jajWEKtLzqpyadJyko4rZ/uhnPoGsanNeoYskwIQ8SJWqdi+a1ezfGKRX
	qaHAvOIxcrX8tYllSYv8hxjpqT9N7pQE+Qf/mX3wXELICnBMDkCB1gxHFMrUmA6grgS2+rR3xIU
	TlKByMyow0jVkiCAXf309XhbgUYy2hScvQbEDcNtZ8pLns2vDKWWmlOPEbkrYCeWHklOAuS5DzA
	sx1tuqol+9RfzGLpZNImSOAxcoDc3P9TsbGeUYx6i9XuCVtM2fPdJcf5rfc/cOjy1PVAKOdg8rO
	HzZUNxHVhew9oQGCnM9y4OBONc29dWvve20ahr5aL+jWrren5iFeyAyHP1PtG7OgI4bCjdDgf6L
	SiGiZreGNqXbcjkTlYtx2vCWCG7VpuN/EfqUIWFN/6c9WZHAl04YqYp20KkAqRwxdHxIE1WEM+T
	Pwv18nCj8RB97QPyGE72TbPZs8jUsJhItUHNL/EbrYEGG77qNdxcfSdDPexTdc0GwkdmmX0iJMY
	XRLHjj3bC3+gdSV7ov5blcMiKVXrtRBv/hsq843NzelFU9+5Uekhp76gkr/OFKOllBOKdikbfTH
	RbGoN3x/jSdEZqvV6weUORVmmKRfZxDBvAeM9L5elptz6RaYTSp6HkqSyma7mNDp3yHtVP/9tEW
	7HLaCA+o1wm90ykGQyjv7HeY2th1mBzQ1HxnymXBgvhP6v2o=
X-Received: by 2002:a05:7300:d204:b0:370:1652:5ff4 with SMTP id 5a478bee46e88-3751e99347fmr1011593eec.6.1794267704227;
        Mon, 09 Nov 2026 15:41:44 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe2ff5dsm1739049eec.5.2026.11.09.15.41.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 15:41:39 -0800 (PST)
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
Subject: [PATCH v23 14/14] docs: describe virtio-sound capture options
Date: Tue, 10 Nov 2026 08:40:49 +0900
Message-ID: <20261109234049.79534-15-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109234049.79534-1-mynameisjune111@gmail.com>
References: <20261109234049.79534-1-mynameisjune111@gmail.com>
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

Assisted-by: LLM
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
