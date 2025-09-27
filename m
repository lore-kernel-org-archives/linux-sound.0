Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59258202C30
	for <linux-sound@vger.kernel.org>; Sat, 27 Sep 2025 04:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758948213; cv=none; b=ans9caYliqp5ztjrP6i4R5Vt6qg5KBf+95/bbeGAR4BzqeHEiAopRTyIB/FqRVRDGZ7bguI3Q0mdHvlqV2wT9MM8AkhCDI3YBGsa9YJzBKkvGxwbcniqes9FSEL+dvlD3rdUePHzfYlD03DOKYbuyP14Y/1DHtNm1u6yzwQUAs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758948213; c=relaxed/simple;
	bh=e/qEH9tlcTF6ZGczycty+bDdjQIpv409fmI2gPtm0Aw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZiQ0I+4CSqVQZif6q4R+etDF4gZgtvQIKKM28qGO9GaDJheWDDcloHXlQIVU1JaFvTtkDBO3RjV+743Gf64IafAaFkziJF4eWsHQ138oPnkX1eYW2Z0nsVqfPhWVhSTw5KGS/f4p3OygaiL79QqidJYoTrCzgNel1EdEgS7DpHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bdVWnDfT; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bdVWnDfT"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-267f0fe72a1so23284765ad.2
        for <linux-sound@vger.kernel.org>; Fri, 26 Sep 2025 21:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758948211; x=1759553011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dKJeS2CDtsADQhZCOXcT1ATZiZ5XIcTlE4PH32ZdpZQ=;
        b=bdVWnDfTKkwfA3PIY4XJcMdK6xIWH50sbaDzbSlMWc8i2WUfj3GpYC+/KTAV2oKWOE
         32Jmlkxhf2araQqdwzYsIZJHmEPsHucKp88rT04Nfathu9AtyiPSOWmWpIat6U1FTegO
         YWpXuvGbry5Nmf9zJ8KaB13e/eflb5EdVZdbOY2HMP+VpzawwLkB/K5nNy7/56gGd4m0
         M+Nkj7fDHyWhxOTZ5ThqS8Sf9TnZNDBkVu/qOme/s3qao/h/eBHmHRpI0JxiMeik8a13
         OFJRGxAwn5Qm1nIJqiFC3/8sy90iHbpvMpufu+7Oy+2MnbGG+FTJWCeQUzbZYwF/tdsU
         HbFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758948211; x=1759553011;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dKJeS2CDtsADQhZCOXcT1ATZiZ5XIcTlE4PH32ZdpZQ=;
        b=dFhzsubiqIhb7xEyePVUvVO6+Z40gYV4vCWisXXjmcC7AvA8VDouQsJjtVaXJ7EOPk
         g+KvqocfswEYBVcCOCzHksWq+OZ+MUiewJnSRSlCM0F5Ouy4LhPHmBbWrMtctuFseKm5
         ofWnuvoEiCN0aAvULn3y3lWMqRJnLgXXOxoxxHbiuJsMGV+JBvhEe0Fl/5nJr6Ce/zAy
         ANOMHIUF0tl1RRBdD/0YSNIaLuoy7hakTAFYnMdhPoMezAxGZWK0PAiOLy27E77GFmrQ
         2T/KVeyTeWgyGr+611IsAUXOGFEFWhzgS0kfefsJpPdDrw2QkOuzOGhp9y53w7zqcvCs
         Ub4A==
X-Gm-Message-State: AOJu0Yxd6/ItZn6pyLisPtSwd2yUv/m11CaQ5WUBVZOA/8Exkgj1oWB1
	nftjy7VGRxxIijaKb4JLFrXxKPsMYInu5HhkaZ8KDFiy16iL9/qRMH5J
X-Gm-Gg: ASbGncsGj1AqNOcW5s4mcnn7fspJFcMOWxOJCVQLoqXRZqikYB539qTLp8vcYK9NCTM
	KjXt3DmHFeGypuVTnGv3JrvyNKaHAqAsf5Nk0x3ksRaMs+kdYnDwsjRKhkIjMXYaKoqsz0F4TFB
	bdUpxOdxa7qO+vM5q1QLqsaCAQVR5hSIjcQ+nIWydQZjOrAOmWA145IhShDA+pS7h34KNt6TfeB
	r7b2D0TOBRysMUQYC0Z2J8tHP8SnR8V88t8bfQoOpwUCO4uzHeEijTZt1m5NDxatx+RehMLphuA
	36VH/mJ/g1vZAKdqMeZd5FJ7VkcqOUjreQlWzfadwvc/KGd6BBlxOhBO19ka/o9DDS6kUSAqo3a
	NR/hgkuPEwhjd4ITbVZtlzcI6O0lbB+kr3s+pM4RP5iwo8ICNQhgeUdmGuAM6DBFovhVIn0E=
X-Google-Smtp-Source: AGHT+IEY3eTrZUiwTbercFWJQUAUjNTQOGASGgG4KnUUAungvsFhTUVY/HHdH4iilZbaAJZYw6rUQQ==
X-Received: by 2002:a17:903:41cf:b0:266:3098:666 with SMTP id d9443c01a7336-27ed4a2d5bamr96103885ad.32.1758948211465;
        Fri, 26 Sep 2025 21:43:31 -0700 (PDT)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed66f9257sm68318205ad.35.2025.09.26.21.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 21:43:31 -0700 (PDT)
From: Jeongjun Park <aha310510@gmail.com>
To: clemens@ladisch.de,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Jeongjun Park <aha310510@gmail.com>
Subject: [PATCH] ALSA: usb-audio: fix race condition to UAF in snd_usbmidi_free
Date: Sat, 27 Sep 2025 13:41:06 +0900
Message-Id: <20250927044106.849247-1-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The previous commit 0718a78f6a9f ("ALSA: usb-audio: Kill timer properly at
removal") patched a UAF issue caused by the error timer.

However, because the error timer kill added in this patch occurs after the
endpoint delete, a race condition to UAF still occurs, albeit rarely.

Therefore, to prevent this, the error timer must be killed before freeing
the heap memory.

Cc: <stable@vger.kernel.org>
Fixes: 0718a78f6a9f ("ALSA: usb-audio: Kill timer properly at removal")
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
---
 sound/usb/midi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/usb/midi.c b/sound/usb/midi.c
index acb3bf92857c..8d15f1caa92b 100644
--- a/sound/usb/midi.c
+++ b/sound/usb/midi.c
@@ -1522,6 +1522,8 @@ static void snd_usbmidi_free(struct snd_usb_midi *umidi)
 {
 	int i;
 
+	timer_shutdown_sync(&umidi->error_timer);
+
 	for (i = 0; i < MIDI_MAX_ENDPOINTS; ++i) {
 		struct snd_usb_midi_endpoint *ep = &umidi->endpoints[i];
 		if (ep->out)
@@ -1530,7 +1532,6 @@ static void snd_usbmidi_free(struct snd_usb_midi *umidi)
 			snd_usbmidi_in_endpoint_delete(ep->in);
 	}
 	mutex_destroy(&umidi->mutex);
-	timer_shutdown_sync(&umidi->error_timer);
 	kfree(umidi);
 }
 
--
