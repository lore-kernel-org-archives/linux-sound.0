Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2C03242B0
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 06:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781762604; cv=none; b=sWhnpJrlsMbErrDRV3esCjsqDefJLhGDzSizZSXNjsfDHzQXDZzhymvJyDyF6IJTIqpAqs1NB18WWOIYZSqLhIWcCkirQNkhN6ICcUV1hdTx65pjUucu+afXXsgxXZv70TNo1E6cxpAw7Fx5XSs8kiIlCcpviw8/s70jTnsx9AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781762604; c=relaxed/simple;
	bh=9hQ+y+2cB15DUeIjOLSE02Hu+4OpuQWzjib/vlo+S1w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UmofQegAwsYlDBFN4a0Lj6/Oc2cBW7ieYA8Z/2rFs6vvsW9OkmHMTRt6uwM9oFLAcD2YFhDBNExS14t0scLYVelYU0qShRBPotJH0JAE2BU6OHULxxJv+8r8mQpzNLBAhc24QqPbEVmDDTHx8+9HbvS1oiAwxFEE689Y0F3mKBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C2bB8ny/; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C2bB8ny/"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2c6bdb8a8bdso3491905ad.1
        for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 23:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781762603; x=1782367403; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q4dlGRcZf924ZYYuth1VpGV6uM41UtMmDO7yTax51U0=;
        b=C2bB8ny/Z4NgwWuErQcy0Cr+4oCUWVdnTUTuydkOEnHPKRctswagQqPJXTnN8X5+LO
         zbSSj/o1IXoiJTDaex509npau3rJ6pOUOf5/CH2F5Sn0JKe0wZ/Ke7891PFXx54ivFXl
         xj/hgoT9beLh18LgmsUCV9/46JdueGfj5ru/gBimcLBTcZaQCkfNzpSK6YQvudWHsr2t
         t1CtKGRcYuMIRXzhm8UbXmzfCgbbCrzUjm67XD22/6UjDnrQUMDUuzrfG5tXNHqlg/6q
         f2CzRq/RBmFtQaWkLJDUUsbSA3rIl0ZXS/NG7R3vhaBSap/j9XQBRgvT65VlSUPAjnDL
         u/8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781762603; x=1782367403;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q4dlGRcZf924ZYYuth1VpGV6uM41UtMmDO7yTax51U0=;
        b=U8X+F/EuvNqdDzdtnCnFgawQXnuLh6JPiTyuMDs0OHppwy/GPjJ4cWtxpbAyza0LEh
         cCFccgszA87olTkwKsp7JLVp/4N4itGl4yRkS67J+QZSYY/waDI9iBpAzXE5POhWJhWf
         XEelAxcVHadJlBHkVlejhOsGr3bCnQBHxZvG2SL+i8UtCI/htZf8UwEv5ax3aIUPyjQB
         cftyK52ujO7RtSfGZS6QT+39eBv8/Qw4vdCfh/orslO+0H2wUPc1WwGqT5uaGKVJ+9uX
         HvPge0x5jLslpXJRNw2MqM8HTjfvqDPoktG7oybfSp0XxCiqHsepBz5zq82roTzti2db
         aerQ==
X-Gm-Message-State: AOJu0YxXwB4C//zmwbRhDDPN+GTaxtcarSSW2ADUQOimxsz15WHIpRED
	vSHMP4zQGb2R0SpPG0mkrUFrveEjqdPQKOt8QAztzWoFfvll4N12HV1X
X-Gm-Gg: AfdE7ckcAns5Y3KH1vwl0TkZf2jLqa61ihafoMA2E1IFQ/NfabrDneyg91gNvZ9GTkx
	2/bLwI+X/F1pWKyW6rO+vqj02ohpUL1c244mvkdfS/QHWIn949adJQFHDrr8CB7MsUUibkDNiwN
	LIav26SdGBD6d7C1Hb31/lhq7FDHoBHEqnrAlsulKnGrlg0ueBgVxi0OX0ZWKce85Nrwv94F3W+
	YQPKvmnav3u5X/yIloHpLcaCzHFamYDI9jOzDwORRkm1Mvxt0ksivfUsMclsyWaCUaR6JQ3ZaCP
	F48IFLYzp2kaLEuxT+pEFmh/ZJ7clWx6ekCM0lQbAXoop9QcGf+OwW0OJbn3hlF2zLoiweeSjkq
	SNZJ0yqi8MCSeFZeDNu6sOsQm8cP7KENxPLE+CYDbwLfCeqLH4BhdoSK8G6SYqYkChlv1XhD+CN
	zmi5OCdJ3z0evksA1gPMTFL1YEKzgHEHm/b8dv5A==
X-Received: by 2002:a17:903:2b03:b0:2c6:afa8:c181 with SMTP id d9443c01a7336-2c6bc0b11a9mr77756305ad.1.1781762602788;
        Wed, 17 Jun 2026 23:03:22 -0700 (PDT)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c6be262b93sm42757485ad.68.2026.06.17.23.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 23:03:21 -0700 (PDT)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Daniel Mack <zonque@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ALSA: caiaq: fix out-of-bounds read in the Traktor
 Kontrol S4 input parser
Date: Thu, 18 Jun 2026 14:03:15 +0800
Message-ID: <178176259547.3343534.2724779296835237429@maoyixie.com>
In-Reply-To: <178176259547.3343534.6658931377288378506@maoyixie.com>
References: <178176259547.3343534.6658931377288378506@maoyixie.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

snd_usb_caiaq_tks4_dispatch() decodes the Traktor Kontrol S4 input
stream in fixed 16-byte (TKS4_MSGBLOCK_SIZE) message blocks. On every
iteration it advances buf and subtracts the block size while looping on
"while (len)".

len is urb->actual_length. That value is supplied by the device and is
not guaranteed to be a multiple of 16. When a final short block leaves
len between 1 and 15, the loop runs once more, reads up to buf[15], and
then does "len -= TKS4_MSGBLOCK_SIZE". As len is unsigned this underflows
to a huge value. The loop then keeps iterating and walking buf far past
the end of the 512-byte ep4_in_buf, reading out of bounds until a bogus
block id happens to be hit.

Iterate only while a full message block is available. This stops the
unsigned underflow and silently drops any trailing partial block, which
carries no complete control value anyway.

The sibling endpoint-4 parsers are not affected. The Traktor Kontrol X1
and Maschine arms in snd_usb_caiaq_ep4_reply_dispatch() floor
urb->actual_length before dispatching.

Fixes: 15c5ab607045 ("ALSA: snd-usb-caiaq: Add support for Traktor Kontrol S4")
Cc: stable@vger.kernel.org
Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
---
 sound/usb/caiaq/input.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/caiaq/input.c b/sound/usb/caiaq/input.c
index 5c70fdf61cc1..2db4d1332df1 100644
--- a/sound/usb/caiaq/input.c
+++ b/sound/usb/caiaq/input.c
@@ -330,7 +330,7 @@ static void snd_usb_caiaq_tks4_dispatch(struct snd_usb_caiaqdev *cdev,
 {
 	struct device *dev = caiaqdev_to_dev(cdev);
 
-	while (len) {
+	while (len >= TKS4_MSGBLOCK_SIZE) {
 		unsigned int i, block_id = (buf[0] << 8) | buf[1];
 
 		switch (block_id) {
-- 
2.34.1

