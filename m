Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EAB34F48F
	for <linux-sound@vger.kernel.org>; Sun, 21 Jun 2026 15:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782054553; cv=none; b=AxlIzGIATkuNfbvXby8rv+7PD/71G7W6ovJnbQbwKhBtmTuJeO07pm0qvHsuoCfOyYnVOv422Byn+aayrsaNmbS+ZKHv5n0JXYPcX6BcRiPra5bWqYR+7CWH5AjWX6wgF0VTGTD7x4pEVPKylqTCmsEi2XXEw7gY3liW7UylWLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782054553; c=relaxed/simple;
	bh=bGe6auSy2bAcoq3YNv8c9FdmMy0rUqHqUQJP0+7B/4I=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=sAad0l03Pvz5aUlgg8K2A7+WhEZ/vjuSlxCuTuUwxG12TW8ounhfHX6p51JYxvtrBZoGO2pGEAjYZ+9xzD+O91mZZKYyI8V+9E7RIXiUugWG7Z9N3VPZKFHjlBdB/vL2hxasE3HSVnLoFIye319ffBZOvvLfh4NyVCbz365KB5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iymBW88s; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iymBW88s"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84226d0f1d2so2485716b3a.1
        for <linux-sound@vger.kernel.org>; Sun, 21 Jun 2026 08:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782054551; x=1782659351; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=31UQCBSl6VHtaj4HbZ4B9yytESDTf5UVo9IslisOCfo=;
        b=iymBW88s6DFkORO2NjBKYBMyjdgoeAhgh/RIkmiBNJqEfpW/0J5lkS9uEMjJIIHU3S
         S1XmS2IRuUap9pHKxe2yD/Iv/4MzUQ6pBBua2V1DPpV9iaX8cogQKFxXIfpcVFn1isYN
         mjVYpAWalscVvkZEx51eE4vIwpS4zbKu6/ozsoJmzP/rEtgvC2c0GkQhqJl6Cy4aMN4S
         +UbZVx/dcWQ/3Oic026e9O/7byKGdOBURartKX1OcTI+C2NncQv+BhGXG1E703vxBXft
         IxR4tYO9Q64MAUYw0E8hoKd36y1DRkNWpLystu5dNx7DoG6aduClg3crH72FWU22fjjN
         AP+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782054551; x=1782659351;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=31UQCBSl6VHtaj4HbZ4B9yytESDTf5UVo9IslisOCfo=;
        b=QaCHQQnbYcCX/SsOE2a9GNpjptyq6UTz500+M+cguanucwyEYXm8sNAb8K0CVReDaf
         XwbBK+VWWFIf+HFeKBAUGe1xtZ4V6iEIamGEGhgfVS/d9vnrdwu52jI0UMgivVRCd5Bm
         vNfx+SlvlRsQCnXgDxlFX8QlKVs/QiWx9RaCbcHQOvlqjevh6+U83Ja5rHu54mSsEoFO
         1TiLLlQRZztdHc0p/K0k1rOLZsbEsjh1/Jbjbxoy4Wo+WLbL/NB5iFgXKhl3e6E4cQmB
         iN8ErDhrrgZaMG8SnKS+nxxPvqO2RTseJnX/+78rN5c8/9AB93Y4FVSwc40TdKKOoaxq
         OBYA==
X-Forwarded-Encrypted: i=1; AFNElJ9QtaQJPVheIpTdiFSjnEnKtRf4r6PtMkeR89RlX0pjT3M+vMFjGMulL9X4YQBnpxQer3aaQB5J9fyhbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjnDBr2HlrPL4Q0Ia+YAhf3RIzOrx5VGEzEXdwazkPJR3ruFNx
	SeWTEULR+/gZ4h5dM2llkK8Lg8TF6vXkiDY7Y+JoS9dLVbNGFdsYYpLu
X-Gm-Gg: AfdE7ckzrGVqViVU07Myr02YZOHn1XjmneabCkOtTtGJR9cq4i/BvS56g87C6jCFLK4
	V0A2/MY/7X9mZFaFNjJUATDgCKk+S97FMI8XVAzLuud2SV8J7vGS6Q6qeDmKhTZe0DdM3fb4RHR
	t/2GasZmklX88w+YKP2jPyQTjV97XaCp/nMH0xVRFxEDzETUzB0qs5coaQofaEtSWjMQf0d0u7O
	wnAVm8ro+N+xVBEWCSwcsv7DxtOYyf/kJqrv8/kx8mKsqUSe7ilwT4lhWpO3SII3kSKj5tGfsoT
	icnSNmcX1K+vwePbcH2sAk237RMgzA5yO02/+IWLEUz7nhVTCJpYe0b1sz8ILkUHvZtEy/Xn6AQ
	junFiE/WTTOZ8DXMm/gAq9+Vy9PLQuRXUAO0l/m3+fwhmTHL61Avs9oHuJPhc8oN7UvYEcw2/+0
	RvlBY02Is5IlZ2rGyZIHQufRmpSWhO45b3m6rMZw==
X-Received: by 2002:a05:6a00:2294:b0:835:45bf:9660 with SMTP id d2e1a72fcca58-845561b605emr11255355b3a.42.1782054550938;
        Sun, 21 Jun 2026 08:09:10 -0700 (PDT)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564e74727sm4840334b3a.39.2026.06.21.08.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 08:09:10 -0700 (PDT)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Clemens Ladisch <clemens@ladisch.de>,
 Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject:
 [PATCH] ALSA: firewire: isight: bound the sample count to the packet payload
Date: Sun, 21 Jun 2026 23:09:07 +0800
Message-ID: <178205454729.1900991.7807310178296762772@maoyixie.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

isight_packet() takes the frame count from the device iso packet and
checks it only against the device claimed iso length.

	count = be32_to_cpu(payload->sample_count);
	if (likely(count <= (length - 16) / 4))
		isight_samples(isight, payload->samples, count);

length is the iso header data_length. It can be up to 0xffff. So the
gate allows a count up to about 16379. isight_samples() then copies
count frames out of payload->samples into the PCM DMA buffer.

payload->samples holds only 2 * MAX_FRAMES_PER_PACKET values. The
device multiplexes two samples per frame. A count past
MAX_FRAMES_PER_PACKET reads past the payload. A count past the buffer
size writes past runtime->dma_area. The smallest PCM buffer is larger
than MAX_FRAMES_PER_PACKET. Bounding the count to MAX_FRAMES_PER_PACKET
keeps both the read and the write in range.

A malicious or faulty Apple iSight on the FireWire bus reaches this
during a normal capture.

Add the MAX_FRAMES_PER_PACKET bound to the gate.

Fixes: 3a691b28a0ca ("ALSA: add Apple iSight microphone driver")
Suggested-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: stable@vger.kernel.org
Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
---
 sound/firewire/isight.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/firewire/isight.c b/sound/firewire/isight.c
index 2b7f071d593b..33c9dd48b3b0 100644
--- a/sound/firewire/isight.c
+++ b/sound/firewire/isight.c
@@ -179,7 +179,8 @@ static void isight_packet(struct fw_iso_context *context, u32 cycle,
 	if (likely(length >= 16 &&
 		   payload->signature == cpu_to_be32(0x73676874/*"sght"*/))) {
 		count = be32_to_cpu(payload->sample_count);
-		if (likely(count <= (length - 16) / 4)) {
+		if (likely(count <= (length - 16) / 4 &&
+			   count <= MAX_FRAMES_PER_PACKET)) {
 			total = be32_to_cpu(payload->sample_total);
 			if (unlikely(total != isight->total_samples)) {
 				if (!isight->first_packet)
-- 
2.34.1

