Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5C4369D72
	for <linux-sound@vger.kernel.org>; Tue,  2 Jun 2026 11:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780399129; cv=none; b=pHtovZ80BPU4gmf/YCxO8pab+Nh45rvDw/zF1HKrktzfSVk1nps7/+hoKsQhjL8fYGtO8HwAajRxMpKuh0oX5IbxAvle08ErEd79N1UJtG8ZxA5ug41DeCE1zSp6DDZ57gV0JPr195UW8hraiAFrIsLw3CrrEnw/p0HjWN3ZWeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780399129; c=relaxed/simple;
	bh=epsJpj7GzgTdJPW98VOURtFXzDyK6zbWQR6U7wLnSlY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=c9tidVnFPW1AuvktHEqJbPXVaywTnaCBGJyqMxy4fA7zcuMinq/mviYiaF06pn745th/1Nw6IKCztwEQyXs03IVRvUbGhndvp9BgFBXwXmwROQldaTzD+X2K0U7oLH5tRkOGF2P0OHu9td+QZdBChiVaYx4P0o26zJzBz3aDO/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dyNDsvue; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dyNDsvue"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1370417c01cso10951462c88.1
        for <linux-sound@vger.kernel.org>; Tue, 02 Jun 2026 04:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780399126; x=1781003926; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jMKcrAgpQ+ax1Gir9FlpnT6Wsgxa8JaPaMdWrx1Uw1w=;
        b=dyNDsvueOmFH8eIpHyDuayZGsh+1z0o4TduuQTi3i1bMtAnO22DzhbkzKbhttRd7IK
         taF8Zt98buqk60BIgjXTkcXH9yRKvwurJ1I7kwVjCpDiZ+SrZO0EdMUCm3tUiMcaSfa7
         a2WRYRwSvRuf1GxDDYrvGqxTbCjcM0D5IxAbPGpa6AyeaPiTiWhgs8DsVq2hpuJeMhgS
         q8sQhr1/QKhTg6WkSRiZcy6nm2g55wZZhLZjVROp8B4ht6Vdso/6H7YbSrHk1X1oEFp2
         PnyiaFFoINGSPT9G7a8XI5LnjNATateRCDtrjhphanZolZWwrXu64vvC6K6cK0cj9/5m
         FsTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780399126; x=1781003926;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jMKcrAgpQ+ax1Gir9FlpnT6Wsgxa8JaPaMdWrx1Uw1w=;
        b=clw2zAVXoET3asOBhkIWT2qV5IFU2bK5AHE01/mwOmZrCBigCdPrNzEjR4jehdPPnS
         bOpHribDPz8rdEf3lz2t4QbcyfY5t8OWVVRR8C+WPq4dbnX5fetmPUIDT4A5V1JOkj3H
         lxNM9SlO+HJR494g8OFfthVuMQV3RV2iQVpSY6M9DvQGPCmfZsTePB2OJfytHMsZ2Uzw
         qMmGBzxjtOv4F2UVsuwqA4xa4Qfv4pnZCXzvw4RYfCxW67nauejDCTgIQUwztYtkfVfe
         al+dbeKN7XYZVnNz/n6kKoq7Y4bxYPIlP0KTWn3jzHzjLgR6gIWWjMKsysE1rad4kxAy
         VPKQ==
X-Gm-Message-State: AOJu0Ywx3q4Gb0RShnRKwPZJQM7zrs+jIYXGOjDUigHL2EDwHD+2vC8e
	Jmvei1WFzM839fPzC9IAnIOFiBklAWlbc5QENEP+emdX8Rs0oS/Cj84zCXXYkw==
X-Gm-Gg: Acq92OFp85JfC9+klmJF4T/yZ44/zD4st4SPS6IMok+wOAV7o7CYTHf6cpeS6SrwzCG
	FLtwiPFKwqcwNY30zyR+63irNOjy1VAXz7jw+mARZXIDX4XNzVdf5/zWucM6u8zhc/ro7b6nUvf
	sdU3zhksxKPi08gsDKCFwd14SH/IHsFUl/9Xf02BUVr5g3PSOgsILeuLXqaVEQOeCLPgfy5P3UO
	+Q2nwgOuOpvU0sS8xkzgaYse3pxcFcfM0g86fQ/WnfEGXswRqsJs3E6et83q5g4/Gw1wqRmargi
	eFVd1YxN4vVVEKkygsiEYUTpd4TSspn6My8xyLQqZ35bVwLK3JJdP4DTJ3McRm5mDh+8rfsp/fK
	dCSvH9jbtGI+a1q85k37UaKjmT+uJnxKBHwmoY4rvjjKafKTSGjrSMmgRBrsbsbebbkGqZH4b5R
	877cP5v/FqNJZuuvIwSVfLBLlf9JMtGj8S7vUdTDecUY3XgiJwPDPdyQLdgPa81dUskOtN8SCZ0
	2/WMoXdCIAm
X-Received: by 2002:a05:7022:ff48:b0:136:b370:64c5 with SMTP id a92af1059eb24-137d426d974mr6121875c88.30.1780399126176;
        Tue, 02 Jun 2026 04:18:46 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-23.user3p.v-tal.net.br. [177.4.161.23])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137b3c7e94asm8963314c88.13.2026.06.02.04.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 04:18:45 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Tue, 02 Jun 2026 08:18:39 -0300
Subject: [PATCH] ALSA: seq: oss: Reject reads that cannot fit the next
 event
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260602-alsa-seq-oss-read-size-check-v1-1-10e59b1742e0@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCQAwF0KuUrA0koxT0KuJiOvNro9LqREUsv
 bujLt/mzeQoBqddM1PB09ymsUJXDaUhjkew5WoKElppRTlePLLjxpM7F8TMbm9wGpDOvJHc9aK
 63galWlwLenv9+v3hb390J6T796Rl+QDJo/1jgAAAAA==
X-Change-ID: 20260601-alsa-seq-oss-read-size-check-40dbf0113921
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 notify@kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1506;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=epsJpj7GzgTdJPW98VOURtFXzDyK6zbWQR6U7wLnSlY=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFlye4S/a/1TdG1RaHsbYBX686vqlwWnJyVZaM5kP8uSz
 f34OMuvjlIWBjEuBlkxRZbVSYss93Q9uFoft8IDZg4rE8gQBi5OAZhI+DeG/z6HZbdnZD7ZE/nv
 jvie29tWHG2d0Mm+S/2KU/fsUw2Jvv6MDLeP/pA7HfwpeJ3tgXcPBNe/jHgZ2+T1JvPopr3tXz5
 862IAAA==
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

snd_seq_oss_read() checks whether the next queued OSS sequencer event
fits in the remaining userspace buffer before removing it from the read
queue.

The check is inverted. It currently stops when the event is smaller than
the remaining buffer, so a normal 4-byte event is not copied for an
8-byte read buffer. Conversely, an 8-byte event can be copied for a
smaller read count.

Break only when the remaining userspace buffer is smaller than the next
event, and report -EINVAL if no complete event has been copied. This
prevents an undersized read from looking like end-of-file while leaving
the event queued for a later read with a large enough buffer.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/core/seq/oss/seq_oss_rw.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/core/seq/oss/seq_oss_rw.c b/sound/core/seq/oss/seq_oss_rw.c
index 111c792bc72c..b7147ac78ee8 100644
--- a/sound/core/seq/oss/seq_oss_rw.c
+++ b/sound/core/seq/oss/seq_oss_rw.c
@@ -57,7 +57,8 @@ snd_seq_oss_read(struct seq_oss_devinfo *dp, char __user *buf, int count)
 			break;
 		}
 		ev_len = ev_length(&rec);
-		if (ev_len < count) {
+		if (count < ev_len) {
+			err = -EINVAL;
 			snd_seq_oss_readq_unlock(readq, flags);
 			break;
 		}

---
base-commit: 96d4780e9ff5168195e891c474a85bb0d510fe9f
change-id: 20260601-alsa-seq-oss-read-size-check-40dbf0113921

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

