Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8753905F0
	for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 08:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791881952; cv=none; b=sc0a9VkBlyIDbvCWRf6l5srVKf385GKJFhTJPG/ArZn2bjEMR8eSsCrtRVZsK34J5SlTIMTNIn1/WoMXz+XFNEmRC5nbNaM1fI7BaCWlc4n8TBgE8LApc8aiIjeh03lLaVftiFS5KZNw0+Cqkrke9ssCj05h0zDRGgqtsPWXw1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791881952; c=relaxed/simple;
	bh=xoLslMg1TgzRFtaItrr8Q3+veiCkTwzMeUa6OX+fqgM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ARpvuxX1X7XfFHybHqIPQkysrKt2W6oUjREBs2QpJEZW+op5JYNnjupUAbuUk3OX1wF3MzROG8Mx0ulEabVrV/eqgPwkKQjlENi1/STZu3pwOcD5xnWgM7JmpAn6KRw1bps4IbWUykwzdL1aLze1gQalcwXwmq/0E89Tav0XhtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kMXZ2PA+; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kMXZ2PA+"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d6d28aa26cso11746475ad.2
        for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 01:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791881951; x=1792486751; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xoLslMg1TgzRFtaItrr8Q3+veiCkTwzMeUa6OX+fqgM=;
        b=kMXZ2PA+cm4Ej11YTFD2VxdnQ+CGKzRL500u7+M1Gl0nOb971RfLzSLBJVPQ4nM+IG
         oj5MgHf7yWlSPpqMUfOxdzBl+PleWG4vdA14krgOSjZIpocaQieZFsImjOnRtWlk/kjx
         e0OkIVr6MAVrOFi2LezoRQcppVog5rdUcifz3LylBMNKlYD/Julr2mlSuRqnRR2PAK7l
         XJNY96emhcjRX82KyC6wNQVD+QRYkZ+1xotyxKLhj3sRunSyMGCBM+ueMO+RpM9BCwjW
         QD0J6KGz8errV5rYe+RUvvtKRgbmnje/IUPt08K5VcEuRlla6htdYbTWW+c6gKhgAKej
         Qx1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791881951; x=1792486751;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xoLslMg1TgzRFtaItrr8Q3+veiCkTwzMeUa6OX+fqgM=;
        b=X8jeZwIVQov+m9vOJQAbKDx2QC2nKcxIM9GFkrRsaQedMoO5+QgKHVExuCS7OPdgT4
         f3CLbNs75JNcxMPPAI8fgjViHF4hdUlmdbwNNDJ31veMvHwaTa30ERaOztfKmsULnFwA
         wUV6REhdh3CTjLArvdzxI/LrPhgF1HS+OoKe69R32Ab0Yg5Q/+X55NadCDBm2snDnd7T
         2+VoH/ymDMlZHMqFB661VR6cMlrcO+3T7TiN3BCBN68e7c7nsWwwA8jqzrlaE6kPYpLN
         M1zyG9No3Tb3+WawHgPp8Hu21p3fhysoQlHTm4ZEXWPCskKKsWHmQ0RBqp+K4Dg/HDk0
         WLnw==
X-Forwarded-Encrypted: i=1; AKwUvBxKHdVjFSp5tYnUDfTRQlWs4k0qQKgR7ygKbLnwV92jzyjxyTm0AZSQkS1CMOwrauYacBJABZab/mlFyQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLk1FSwYk7DdRBeJTn7miCVW9oeX8Qi4BHkU4a1HJzVKvDLP4Aq
	tsoo2693RdNsaItM2cHUN0sl1MZR4e/KWINlX2/JQGPrP43Of+9i9YXG
X-Gm-Gg: AYBFou3o/Et+odjBw7NoGdzEfbw4xnk7eQVAc+v/HVHwWBTuFdH90g8CG5fXCPWxtG+
	vi7Ycl56EpC90bVaIdZ228iC3+55iuqd58WXnN+SDcxLHkUXUJQ+RbY6RzQtBpns5qlhUbhbjr4
	sA8cJNzaFA11L5l3lCJIHumWs2qdfAI6wQAl1iaT6dM9fR4JAKgs0GlFQ+FVT8x7KtVbXDFT+VN
	DRBDW62hBr2uKVIHKYnfLrjxQyX12ePmHledWiqUqBkpwvDcUzOhRHhisBIC7VL2PoV335nYVzI
	Gtwm1EyF2k+svIpd91UHWTMBmKxDnEOFB4ODBzII3Rzsn3GmI5CUrbYb7pG35NLKv4D/6TLpcWm
	djSNvEANfb8jHKU7F4KHt/p9yeaxoKhPjIoYXT6haCRA/EPh6HNdDQRSHDfpG/0LbABBFYdCJdY
	X1JVz9thMsug6gxlEHDOBjKM+gABe+qxp2Le2ZAHLJevlw36wBKnA25u7/kSNwnzaMoKwRQUL7K
	HOjpnuZWwvpi28lZJdp8yZJ4ZPAhXMS1dTpmbK1X9NB5hqPNQUH83p0LkBJd+DDTDY3YFBovSi2
	5UJxnU3pTq/ihY0H
X-Received: by 2002:a17:903:903:b0:2df:8b09:93bb with SMTP id d9443c01a7336-2e842aaca0emr94933515ad.10.1791881950940;
        Tue, 13 Oct 2026 01:59:10 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e842300d56sm53510185ad.84.2026.10.13.01.59.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Oct 2026 01:59:09 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: sashiko-bot@kernel.org
Cc: virtualization@lists.linux.dev,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Eugenio Perez <eperezma@redhat.com>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 5/5] ALSA: virtio: Keep control payloads alive through DMA completion
Date: Tue, 13 Oct 2026 17:59:03 +0900
Message-ID: <179188181241.52451.7572855613839007151@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <sashiko-outbox-169212@kernel.org>
References: <cover.1791877396.git.mynameisjune111@gmail.com> <sashiko-outbox-169212@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Thanks, this is a real alignment bug. I reproduced UBSan failures for both
the control header and the integer64 response payload with the v2 code.

In v3, the alignment is at least __alignof__(struct virtio_snd_ctl_value),
in addition to dma_get_cache_alignment(), and the initial +1 offset is
removed. Each subsequent region is aligned as well, including when a
preceding region has an odd length.

The ASan/UBSan regression now checks typed header and 64-bit payload
accesses with DMA alignments 1, 2, 4, 8, 32, 64 and 128; v3 passes.

The updated series is in the new [PATCH v3 0/5] thread.

v3 cover Message-ID: <cover.1791881787.git.mynameisjune111@gmail.com>
