Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D022421235
	for <linux-sound@vger.kernel.org>; Fri,  4 Sep 2026 20:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788555542; cv=none; b=O+0cqKKNPWnbOo8Y3dOyxaJ2fc9iyf/pwIVoxDGR1t3A0eAvwKh+RfByovKC0Q/itvPA11Gbm3jUhTesH2MnQJYEpMBffzjmiUb8mtYMLnid1WEgyun4VaEfy9HSz/Qp0ehUUJEkWsahj7aNAi3Rcc1boE0DI9H3dRAL6l7Ki3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788555542; c=relaxed/simple;
	bh=mYlsgrDQw0VP89f1tdnzaO8DqqEdv28FwA5WFWNhrC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=myCsnYdbbid3De5SbEc/fNY0kNmCuKoKfRG7JNmlY1iQWB2KUWcwnRcokLAKnnfXV2dZR57EcK4sw8mdtFp3MH7HBQMBBpfXXb6ZBGcWapWLtjtyijqJo8OR8CZA9YRf03brig57/+qzLfNjaj2vzmk6VDzVB3CJm84OkK4z6yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UEvoXsBU; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UEvoXsBU"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49cd77e0f95so13463235e9.3
        for <linux-sound@vger.kernel.org>; Fri, 04 Sep 2026 13:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788555532; x=1789160332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+GiCJMpso1xWAYxd1379kkeROa3TRTeuMW+d9bTg3hU=;
        b=UEvoXsBUmeXCU+P+1p+ppbdPrtqpOCEGBRxLqIBm9qvmZP3AoY7HhIA+qwmouy3pFr
         uFLuBzN1kCAHh8LxQZ/KMeHxt5/PuwTnurBeS+xoLLp68qG/PTSH4Ivn8RhEwa6p4wEY
         R/U/Bmw9SVd04gzb0tpHw4qA7Q+4u/4jdhavXwu7WM+vKNDEfy7Fo+xUVq7XDo0KZkut
         T1LZ2mgpAJSCfOljHOUA1kDdsxjrou7qS/T/v61woMKacAzsDNfqvBG4bT/4EXb4bWm9
         9JWbCYraDbGWzvJA4VucHe6M1QTg7qE29Di2g9kUFqiwd0C68jCpKqUWK+SvtDpBCGwO
         2YZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788555532; x=1789160332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+GiCJMpso1xWAYxd1379kkeROa3TRTeuMW+d9bTg3hU=;
        b=HFKpViIp3yo8tKkzSYlRfj3z5eUlN9BMV3M5m1P2alFKuYujkeetyjgAmciTXN/4bE
         t6DemP1MJk9kkd+5o2ZLJ7OH27x1ezjUmSW+0m7zow3qsxKmuFfk6BYISXIZGgnk8gCd
         cgcLZwG/+OHSIsabnarRxq9VTOTMK5/N8BkBsWNCIom4XFA7Bl9QT3ZgXOhLzrRjFLoG
         J0vzIGy897vVb0TXoXGHanqWBvg8gu7/Vf/3EfF5Qq+lzrSkYdymDLaw85EAIRjwxOU8
         v0ikiRO9yV4XEx2hGBv7WvQgLwaVQ7qZVujWRm5ca3CY8poRQ2HEU95cEwC/uEfBJ0UD
         N8KQ==
X-Gm-Message-State: AFuF++lNKHMSptf4dQDpQwviO5AoUeKC6EdzXqXstFOWYGLoJQEE1Mcn
	xZauQLER88EL4126N7ryEqmRC9zuci92ECzDi3+7Mt3B5S5nkWQv2rN74/PS
X-Gm-Gg: AYBFou2bBn8wasu3LF2QJbhqmFcdirfepp2d7M1XprTjvlPP+oZE40Su3Bx8AoKwYz2
	FYE3qDPiy+SOUhcdSjPHoVsopawUObueF3MYdWL4Aq1HaJkp8Yg6a5FGHUKtv9diDuuLkshvyCn
	LTP3Smo/7OvsDGyBnTYRYL21x/JZ0H788jehpg+nM1O8BIBy5rGi95bjop3I1rFsUi7DKxMUUKg
	3S+AMuP4/0wz1o+d2pS78fPSthu7iunT4BGpDY4jiMXRJ/myULjHdnBBDeV0HorzXSC2/wd4wXA
	9yvw+jkAUfLssl8VIHKrw/nIZ498gueqM9XKabYoWRjlXVeVEyFOlQ+ZZDg147LWMRLRpnlLu43
	VETgfwYbElUtKPqwnUqXTFeR2Kpq9TPu/hYBwEvFviz3WfLsukBAIUxZRBOIedSAZ0/K2y4ttep
	CIzSp9uIw+Adtt+5N+W3THFvIJ7nw/qg==
X-Received: by 2002:a05:600c:83c4:b0:499:db6d:bc97 with SMTP id 5b1f17b1804b1-49cf7f5058emr97223535e9.0.1788555531716;
        Fri, 04 Sep 2026 13:58:51 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce4761dd1sm153781665e9.0.2026.09.04.13.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 13:58:51 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v2 2/2] ALSA: usbusx2y: validate URB actual_length in interrupt callback
Date: Fri,  4 Sep 2026 20:58:26 +0000
Message-ID: <20260904205826.4071119-2-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260904205826.4071119-1-tristmd@gmail.com>
References: <20260904205826.4071119-1-tristmd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tristan Madani <tristan@talencesecurity.com>

i_usx2y_in04_int() processes the interrupt URB data without checking
urb->actual_length.  A short transfer from a malfunctioning device
would cause the handler to process uninitialized heap data from the
kmalloc-allocated in04_buf, which is then copied to the mmap-accessible
ctl_snapshot[] array.

Fix by using kzalloc() for in04_buf to zero-initialize the buffer,
and adding an actual_length check to skip processing on short
transfers while still resubmitting the URB.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
v2: Use USX2Y_IN04_SIZE constant instead of bare literal
 sound/usb/usx2y/usbusx2y.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/usb/usx2y/usbusx2y.c b/sound/usb/usx2y/usbusx2y.c
index 200b708aacd6d..108f9bddf9aa3 100644
--- a/sound/usb/usx2y/usbusx2y.c
+++ b/sound/usb/usx2y/usbusx2y.c
@@ -189,6 +189,9 @@ static void i_usx2y_in04_int(struct urb *urb)
 		return;
 	}
 
+	if (urb->actual_length < USX2Y_IN04_SIZE)
+		goto resubmit;
+
 	if (us428ctls) {
 		diff = -1;
 		if (us428ctls->ctl_snapshot_last == -2) {
@@ -253,6 +256,7 @@ static void i_usx2y_in04_int(struct urb *urb)
 	if (err)
 		dev_err(&urb->dev->dev, "in04_int() usb_submit_urb err=%i\n", err);
 
+resubmit:
 	urb->dev = usx2y->dev;
 	usb_submit_urb(urb, GFP_ATOMIC);
 }
@@ -305,7 +309,7 @@ int usx2y_in04_init(struct usx2ydev *usx2y)
 		goto error;
 	}
 
-	usx2y->in04_buf = kmalloc(USX2Y_IN04_SIZE, GFP_KERNEL);
+	usx2y->in04_buf = kzalloc(USX2Y_IN04_SIZE, GFP_KERNEL);
 	if (!usx2y->in04_buf) {
 		err = -ENOMEM;
 		goto error;
-- 
2.47.3

