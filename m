Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795856003;
	b=e93v5jkkc2u9E20fu8rE0aCpj1rfN4W09PvVpAgFOw0HUg/tr9dbyfsUocbupKTN1mQo
	 nTFBP2scza9El4SiC8L/hJry4DAHKBncOiL2GaB/LY1c0n1YKLGuCBNxN27WsnMKwP+Oj
	 DBArLwtoCmUFiXM6NM2A1cPuvVoBcBY5yG5bbOeMtkJ2A19WZp76biYcqKqvoT/vajQ56
	 pmjFWDpHCgoOF070uI9T8RidvLzs7FLGlp3BjU0OQ1gI6SPvA3Ebjenj5a5GR9iw6KFTY
	 g16KxAzAcFxJJjkm5/SYLvNcUOgDsF/M6FtJkiz9hqM4tEdbANUBd8aNcR96zXhCsYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795856003;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pYdZRMDlVtYaaI0y/9/AHPDxXWjl0VbWZbrTCTv4mq8=;
	b=MDzeRPSSeR58zGLUvpaZHrE+GRVi0rTJdpRttuh4Ui/8TVePWZMZ1+Kl4YlBW7KXrKn6
	 7Rn2YPkvO9eMsmoCJWjOnGXt8vvJP8usBawODWVi5kifw6U3mp1ErbP/sW4dE2WCjL2UJ
	 RQA2sApeBinTvJx1zcKsfO8Ul+s/WNNaFunDAm6EpEDVcTByaw4IKrehA7iqgn7XxIk6v
	 Yad9lQx1Sn9Dn8tg0KlYuv1jUdR0D7SaGIkkw2GQNIq7JPAes15Bl4Cp6+MrKrgI8Xvcg
	 lVKVbejf4NwK+UzfahBjgs4AMyTdHzOHTzGfHwhl0AwR4Ff9iGgQr06GsMHxIQ6ECfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="B9QaEyJ/";
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2750606A323
	for <linux-sound@vger.kernel.org>; Sat, 28 Nov 2026 08:53:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2750606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B9QaEyJ/
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-386cf1041cdso6470076eec.0
        for <linux-sound@vger.kernel.org>; Sat, 28 Nov 2026 00:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795856001; x=1796460801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pYdZRMDlVtYaaI0y/9/AHPDxXWjl0VbWZbrTCTv4mq8=;
        b=B9QaEyJ/UNb0DLh6SFOodGgCVwFujZmItQv3OuKj/r59L9+h/AV7FWGRsP1nzGh6J4
         tkb+akswE33jEFf++tlxEGFHj/FCa1C0wy4HLoqLOT05myiodKKbNrL4dQ4amOIbNr8t
         abID9wL9UdWtP2x6Jb35Hu89JDNb6kN4xz1lrFJLR5dCBZm2iIBFZEze+d+y/O4GlMdA
         pxhkDR6qxQ+jnGv983cyZ2q+YQhXLcOc7p2hxLlU2xdLZzKgMb7rHFhq5bRApLw1Ex/W
         thqYQRz5CtQK2iK1Zrc8ae0jaJzUV/FhZG4490A2MVbOC9a4yeKTz4AyE5q3tx4R/Ig+
         KVqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795856001; x=1796460801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pYdZRMDlVtYaaI0y/9/AHPDxXWjl0VbWZbrTCTv4mq8=;
        b=CBLRoW1yiodYSB3m64g98O0cD7q3xCgROPlkSiBnkIvpjsqRnyC9bsdwwJsvzbErUs
         O/5ccefAiki/dRg5yyFNOr8Uw2F3HxLmcfiw5qvAr09FVdXyEOmy30QmxSAYwQU5HJ1/
         HMZv9E/IrcZQQsTQ/vJ5ADmqOEcCt1CzQy7/sWeoPgyZ4GJ8iLcFRIMQnSsoMKap2Rjh
         DcAD2wX33DmXqpwFAKATv+atevi8uuQuC5ekn3UmGCBzuMwezAmFJ2Ja+GWQ4GzEdxdC
         B9arpRlqVH4T9mW+35u5mx1nVRtgIZwQYiNX+TNod9S5C5G60Zuf3neGxyAGQm4btWU+
         uS6Q==
X-Forwarded-Encrypted: i=1; AL+hErHpcrEk9RvWAG8dKP+HARhabOGArBdKv6y3FBKypIG4dqgjl5SMAWJGaF+XXQstEGwfIgqjO76W7TKRkw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZRlEG4ANqKwrRZOz4HQ4bv0eJYERu8cRMYgTJjrkZozMJ/yFR
	HMgoMfZ76cuzoA0TTNqDNo5NfzWsNIgY/w6j/qjRre7NSUNGnTkPwGQ7
X-Gm-Gg: AZFdTZeFOERdTVtBGu/Xe6xgshuKj8RwCrAh5LzVboDlyE2wtTjZjipoSbd/cI5DpsO
	fYYeEs1aCtlsbs9B+ZueTjfT2u4EnsKXp26To1QX2SkCWYRsBkJTaUCyxstkf8iEY6ZQ3od/s4v
	4YC/nRICtJq9hTS8DN6ZM/z2Yiy+DB1NVeLXd/W/9gx3F/FFkX3gnEyyJHrQkiqdB/Q7UOKwN6s
	D0LcimqdMe/ewHFsKTA8J89nKzbvYrQ7ZK9gurl4Wipr63uA2lZ4/4+B5QDahrt705R6jClCzol
	0U6xVJKu9GiUsbA8CihIHFuHt+H/BMDTxWOEbVYoJ+AQ9qMFTrF+tGmNXmd4DEQ2RDyVtlNsYK3
	k2Q3jKjALajgw77r+Dt3Tq+TyfnTPh2MwsA/EZ+va94Ors6a38Np1ZdtxBigoR3rhnusvS2nPAI
	eIGBM9EIHnayileHYtp1neF1bdwxBZD7DYp0cYnGFWg9TVQm3Fai1a6Ibb3iVXJ0bpfK+b7ySvh
	NBrbJiLX2BitQyr89VdZvKga/pWp/REKYFL9Rtg8RaBlAu5BCMrMBCeMcm2U+GnkPPdKYh1gYQL
	p3pQ8ljhIrGui3Pad8aLDUbRMK5pWigEKYfCiT3yOFJ1KLadocpg
X-Received: by 2002:a05:693c:4001:b0:370:d6e4:e8aa with SMTP id 5a478bee46e88-38570b34fecmr28389543eec.41.1795856001579;
        Sat, 28 Nov 2026 00:53:21 -0800 (PST)
Received: from localhost.localdomain ([103.179.230.121])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd46c5sm99952622eec.11.2026.11.28.00.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 00:53:21 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: sreekuttan2156239@gmail.com,
	johannes@sipsolutions.net,
	perex@perex.cz,
	tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] ALSA: aoa: Fix codec unregister handling
Date: Sat, 28 Nov 2026 08:52:35 +0000
Message-ID: <20261128085235.2984-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261128081025.2878-1-sreekuttan2156239@gmail.com>
References: <20261128081025.2878-1-sreekuttan2156239@gmail.com>
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

Fix aoa_codec_unregister() to use the codec's own fabric pointer
when removing a codec.

Previously, the function checked the global fabric pointer instead
of codec->fabric. This could call the fabric's remove_codec()
callback for a codec that was never attached to the fabric.

The function also called module_put() unconditionally, even when
attach_codec_to_fabric() had not acquired a module reference.
This could cause an incorrect module reference count.

Use aoa_fabric_unlink_codec() to detach an attached codec. This
helper calls exit(), remove_codec(), and module_put() and clears
codec->fabric. These operations are now performed only when the
codec is actually attached to a fabric.

This also prevents releasing the module reference a second time
when codec initialization fails and the attach path has already
cleaned up.

Fixes: f3d9478b2ce4 ("[ALSA] snd-aoa: add snd-aoa")
Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
v2:
 - Reuse aoa_fabric_unlink_codec() to detach the codec instead of
   duplicating the cleanup code.
 - Call the helper only when codec->fabric is set.
 - Add Fixes trailer.

 sound/aoa/core/core.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/aoa/core/core.c b/sound/aoa/core/core.c
index 99b032a4081f..09eeadba4277 100644
--- a/sound/aoa/core/core.c
+++ b/sound/aoa/core/core.c
@@ -72,12 +72,9 @@ EXPORT_SYMBOL_GPL(aoa_codec_register);
 void aoa_codec_unregister(struct aoa_codec *codec)
 {
 	list_del(&codec->list);
-	if (codec->fabric && codec->exit)
-		codec->exit(codec);
-	if (fabric && fabric->remove_codec)
-		fabric->remove_codec(codec);
-	codec->fabric = NULL;
-	module_put(codec->owner);
+
+	if (codec->fabric)
+		aoa_fabric_unlink_codec(codec);
 }
 EXPORT_SYMBOL_GPL(aoa_codec_unregister);
 
-- 
2.55.0

