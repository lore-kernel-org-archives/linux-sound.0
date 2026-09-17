Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCEE1439349
	for <linux-sound@vger.kernel.org>; Thu, 17 Sep 2026 10:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789642651; cv=none; b=ID/zOuODjG9nLwRYIp5Lb0/C6K/C4ezVe7VhgxThDWUihb9DgWGH+i6TSVVuJsJPF0ZrDxobtbiwKnlh6zX/tJB/TSzCwxnMzHXBUt2vJrC07Y0QmUqIaJfM3/XkPLyWl4qIpxNBqh2shP/sx3X4OX1/S+JJq7I9PtGeB09O7+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789642651; c=relaxed/simple;
	bh=q8YXsS2Mnty1xFmiXZ0wd8c6UDOy/RD/D6nsd15HyW0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y/iWAupxx94F8bBFtvh+NGELAWgfENNqtjNiEmXUL9ebPJUBADqqq7Z7ahD2qqkUpAxAVxkApFhwVytlcaTkaR5tA31OXtbz9r6qQddHG3ZDMkqWoS7L7gg8WM3pwv9IgCuJdt/TXTu2V5mae9NR0H0Z1tl0+i4aefCMmns4ESw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=fjvMlNYu; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="fjvMlNYu"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso8759225e9.2
        for <linux-sound@vger.kernel.org>; Thu, 17 Sep 2026 03:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1789642634; x=1790247434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vBiI+NCmLUKT+8KZgMAIP50JLY8JB1G0uYn55nZbHhQ=;
        b=fjvMlNYu5m7ufVikOMpk21ncFdBgIlRcLQe5SLxtY8URK2O7HmWcOCmbMjT5BL+VbH
         +o0XursZ7FrqKs6qMrJ53nXBeMT8rllB256GUaIj5ZldBZWptG7bApip4c0IbxT+/BIm
         BQra8yFP+ohwUPDCAZLyYrSRcteaqcUDnHOGLtk4epFgSdtPsRC9cQCtS+UZSf8kRE7S
         zUW/Cc2BeSBWG4kU0h55l7U8XnhuIeLW9EarR4y5betJDpH20ukxaXv5x7DDgCbayeIe
         2RGkyNAO1yokUFZihc+VrTmuq6z4FCNCLKP/1AnEQBXvNpBEqg0JPtX5rojkh3sl4Xld
         1s5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789642634; x=1790247434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vBiI+NCmLUKT+8KZgMAIP50JLY8JB1G0uYn55nZbHhQ=;
        b=HyB6jY2KI7I0E0QXICoAUb3QxHI7yENw2Y3ImeiSn/XYnG7e4T4ikTaBiGMPC51Tvh
         jqVdAETlsitO8mRImq1kdAfWK5CbsZu5ZiNaAgwqNg4ddrh4OCwKSs2KWAHMg+QW+1XA
         scoauq4t5OwVoMXIoSLSiGdFZFs071686XdBd0C1/dnfa9xAH+bunUjGrMWqOmYMsBSV
         Xe5Tz5zk1nl7ilkdXc/6V7AlBNbrYRRdSYVvOHXBUK1xNFU561bd2rBvWT+wbCRImofP
         hvufx0F5sqqfhNjSb3h8ibzRSQCpL6WXLt3ZukIdA+jiphEvt/CJMkjfis44UymI56gC
         tWNg==
X-Forwarded-Encrypted: i=1; AKwUvBx78aH3hfp4Mf98in2ArThaV/N+q24tCgiRy0tinlvhxSpkrH4E3JhscyEmirA+Nry2ALz9HuDJUdN58g==@vger.kernel.org
X-Gm-Message-State: AFuF++l6AONIo4vgB30bzUF8sx+OJJjenraBwd5lpY3fQdKadKOC5WPy
	xQbiJ6t+hNwYcfgy8IbsNw5fOWg7mlXfSiXiNG5ugKum93j/bUpCq718ecEsYpBppsY=
X-Gm-Gg: AYBFou1tQSaSruqYyOUVDCWwQPoOssn1RR5eC1sznA552ectYMOrs2KwGlj0ryvL3hU
	nNZMDv2LEINmKU4U8VwlLLJcCz/P9nV2PM/dwJAy31lmC/06kMXniE1a7k1fLXpM5RUJKVV69UM
	CtVkFu6jbPHwSaBda/nMODMOSZEnyLOzSfHF9xd8JDRrI31ZkjJdIEaux5FOE0TGyTMM2tKplwo
	UyF+wCM8vbUYODSfZ5Zy8I8kgocfgQGS4mkitl1Q1CgTkiHJgTk6/jLvVsYvjtWKU54ox75xAIt
	o1GnxONDPNNAhvk1woOd9SAOl0kSKDUM7TW86uM1VnMqF5aU08pd8gMfSzWLKaplWj4rXqcq/U6
	pvcT8Oq1MzKzt0KPD8BfX580s5oMDUgkNr98Chr/XvdJXnvYp5Omqi8q4X4Az/vOhX6JjSYBLTE
	0NMQ732AIu8W1FVNSRoVv5qwXishxa6FF6yI26zZYUlE2jtGXaqENCAiZwEZD8JBYvrewYLZe8S
	bbpUZTl
X-Received: by 2002:a05:600c:8586:b0:49f:bd3c:bc28 with SMTP id 5b1f17b1804b1-49fbd3cbd97mr26974735e9.35.1789642634000;
        Thu, 17 Sep 2026 03:57:14 -0700 (PDT)
Received: from localhost ([85.195.240.20])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4870bf1fe7esm14884635f8f.6.2026.09.17.03.57.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 03:57:12 -0700 (PDT)
From: Bruno Produit <bruno.produit@trailofbits.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Kyle Zeng <kylebot@openai.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dominik Czarnota <dominik.czarnota@trailofbits.com>,
	stable@vger.kernel.org,
	Bruno Produit <bruno.produit@trailofbits.com>
Subject: [PATCH] ALSA: seq: Serialize compat port-info ioctls
Date: Thu, 17 Sep 2026 12:56:43 +0200
Message-ID: <20260917105643.90102-1-bruno.produit@trailofbits.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kyle Zeng <kylebot@openai.com>

The native sequencer ioctl path serializes handler calls with
client->ioctl_mutex, but the translated port-info compat path invokes the
same handlers through snd_seq_kernel_client_ctl() without taking that
mutex.

This lets concurrent compat CREATE_PORT requests pass the port-count
check before any request reaches the serialized insertion. The computed
integer port index can then exceed the address field range and wrap to an
existing index. Subsequent subscriber teardown can resolve the duplicate
address to the wrong port and access a freed subscriber.

Take ioctl_mutex while dispatching converted port-info requests, matching
the native ioctl path. All translated port-info commands share this
helper, so their accesses to the client port state are serialized as
well.

Fixes: b3defb791b26 ("ALSA: seq: Make ioctls race-free")
Cc: stable@vger.kernel.org
Assisted-by: Codex:gpt-5.6-sol gpt-6-astra
Signed-off-by: Kyle Zeng <kylebot@openai.com>
Signed-off-by: Bruno Produit <bruno.produit@trailofbits.com>
---

Trail of Bits has a reproducer for this bug that triggers a
KASAN use-after-free and can it share if needed

 sound/core/seq/seq_compat.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/core/seq/seq_compat.c b/sound/core/seq/seq_compat.c
index 22679dca9..80110501d 100644
--- a/sound/core/seq/seq_compat.c
+++ b/sound/core/seq/seq_compat.c
@@ -44,7 +44,9 @@ static int snd_seq_call_port_info_ioctl(struct snd_seq_client *client, unsigned
 		return -EFAULT;
 	data->kernel = NULL;
 
-	err = snd_seq_kernel_client_ctl(client->number, cmd, data);
+	scoped_guard(mutex, &client->ioctl_mutex) {
+		err = snd_seq_kernel_client_ctl(client->number, cmd, data);
+	}
 	if (err < 0)
 		return err;
 
