Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794561164;
	b=yNbGPwWKRpWX5ztFHDl9pPnq5FEJaq0+Xghrkh3PKKgu7VDill35CqhyeE+TdvBD7d5z
	 ixy0u4ysjjo1USL7oSuHCptPToCS9FgtMihwacTGKutPAiduwMphdu3dMUsG9iUsOogHO
	 juNmI0PPxq00B7mz+AxEjr6SB4xMXK+tQxV3C/4UCyIm2VGpJrg20H58bLFCZHkbXbyOT
	 e42RyF7rXXw1ABmLA7jMSJospsLQHXELOvNHzLTDkE1QVHMuHmxxroDQaG7sLmfE88Gvm
	 4RLyL6eg+DrdpzXEIXLpgAM6XMunBDMbfz1rXuj+L6a1/fWjKKo6hMw/Z7dV6QAgfdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794561164;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lF+bnZ6VSVG0AykI2eM+tgI6y1b9uCRh4kbQBnW04V0=;
	b=rYUAEZr2MtNKSpEG+BbmXvdwP1e7T9njLbOujEhSWk7o2erpAHHqzkupIw+uQ6q9Aasy
	 +amJ1peoxsiiFOHf3B8Y0LDC8ePYKukxJMSB9wZNu2SQmp73jBluTBeOKF5Hy0m5ewrE9
	 K5WZg+nBy84JlIXtohIF1irli9iI0dSUqirw9ua84iz6K3i3PTPs6pj4fGB0tt6Z0X5SU
	 Ze4AvmHNROtM+EOUVrsDx8C2tTF+K++T4UyIDxNLPWbaBz2sdVbhpBOl89n3o2zt2NtDy
	 6GGWg9KlIhPBat+/EISzTk4Vx1NhUu6s9yjZmAumliaLe+2kc2fQNG2gtgu5/TQKikQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iKc9w+kO;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891A5606A31C
	for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 09:12:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 891A5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iKc9w+kO
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36dbde64409so1176117eec.0
        for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 01:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794561164; x=1795165964; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lF+bnZ6VSVG0AykI2eM+tgI6y1b9uCRh4kbQBnW04V0=;
        b=iKc9w+kOgcZ6kHWSLJTWyRO28KyLicx5hWqtuPQTZYVk/9U9+dsp7J5yPjzOuEqcQi
         0Zgk5pzt9wES39jIDhru/ZQFiybBB9HZqRcBYzc49BepAO+JB2Q6t9kMctknW1i2YG92
         97kKy5XZTD3bil0XRd+SmRpEtIwhJlqqriE/FND4US96dNspSKPRAGM63pEFzDoT/Pqf
         BTxmGFM7AoOHC8+Zp2W9hie6DVIXPqNcLxfWOUHse9ot18KE/Kg4M64m/pCbSxwk8eAp
         lWUN8P5VcwWvPoBCEaHuTn6mLixLvPz1Vha5HmSZNmol7lEcIfIc5Gvdy8m5NAh0quRJ
         Z7pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794561164; x=1795165964;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lF+bnZ6VSVG0AykI2eM+tgI6y1b9uCRh4kbQBnW04V0=;
        b=sK1SG2UiJOxcNvZ8mgIN4Ku8PsBX8rd0gCnXzNaohklQoEtrMp5ans/2vN65ftQptw
         7aMK5Rkq8fOBtOnbLlioSNPaW4oVsQEGT9lA0xjA2MLYBhiK89HQldtN9Gk7Ownd19UG
         YKw2C6K47jF/b18hu5EgbdeRutpauoJpYcXfI7YAUmM3akyVQmou3VNRthGJ6UxTcgpw
         17cYZ9ob/HIJFtlZQEL14DHTYuR9slzOWJ46dOeqc5NwWilGT28Z8WhQ1fvsN5LqhRBR
         2s+PQFIKHGBYH035tilLrldEzLouS8QcJvyk0Rodmj8kCQYs6toHe2u0vSFTiaiIuh9U
         79fw==
X-Forwarded-Encrypted: i=1; AL+hErHad2foU3u06jyRHQj15qHtYZL3MPIirTUOf9ZaQCLve+GJEm0LkUwFpbLQbuWEOaGe0hSxZsS96zyJ/g==@vger.kernel.org
X-Gm-Message-State: APuU4Z+atiUEmrp092Hyi+oV+edlSv67ZNLTMyN7+SdWph42BPjUG3/o
	72av2tHdhZEDwQ4l6uTzE4EEROFo2Wo8y4Qo/C3jAXZNO3GEwzAeOCWJ7sg+5RdG
X-Gm-Gg: AYBFou1sgNn9CXFtZUq4YoATCJqaILJxAcoGNWpyxmlSFf699ITm1fe/ugdw8e442HW
	HiwxNg1mJlYq9OhK4q+g0McQ9SrxPVNUG2cBdS0oX/nc/z3RYk582X+qXJ08HFCb6hzIaRK55aZ
	uSddZOzYJn9yExz56bSavNY45zAWdYqFfomQ4RMD1NVQyLQvov/2Q7/WZHSSOGR0UWBR8n73ln/
	E5M0VcDPk0eUp+WPJn+CqACPupLOy7jYYT+gFhDuPJ0ses2SZvxhMLBULzRqFOoy2LPbs6FOjaQ
	QEmML+8fVdrqmRq+l20DwQiXEZWl3zuscKiyjknyAT9z8lXqWqLdAOYMQvs69bWyIFr38s5sLGG
	yQ/CGvKrvZ/XIT5zBppc5hgMfLMIM6gER7lXdvX2hkopzz4F6ASaSlVWnkTD0ZsassmMA8yS6D0
	K2YshhN/NebndWuNG/EfmdUdB/Iwu9wmK3gsTxAb0Hbi85bTUW17+wfAvfVFka6NQfGhfkf+AXs
	T6lYj+S6qrDwUtUrq3w5R+dhM7FGMUVckeNq8OrUo5PyaUwhk4R5R+CwAapIK1BFS0UxscEuKqV
	MahLp4uY5pS+akxnRuoWmuywO8Fdn+W2T8Qxt6Y1DM8gy1jjzzY9
X-Received: by 2002:a05:7301:1705:b0:36e:c9e5:33aa with SMTP id 5a478bee46e88-37965f9ea5bmr1635524eec.13.1794561163503;
        Fri, 13 Nov 2026 01:12:43 -0800 (PST)
Received: from localhost.localdomain ([103.149.158.176])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332a77sm5442356eec.4.2026.11.13.01.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 01:12:43 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de,
	perex@perex.cz
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH] ALSA: compress: Set metadata_set only after successful callback
Date: Fri, 13 Nov 2026 09:11:59 +0000
Message-ID: <20261113091159.2954-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Set the metadata_set flag only when the driver's set_metadata()
callback completes successfully.

Previously, the flag was set even when the callback returned an
error. This incorrectly indicated that metadata had been applied
successfully, potentially causing later operations to skip metadata
setup.

Update the flag only when the callback returns zero so that its
state accurately reflects successful metadata submission.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 sound/core/compress_offload.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index 5e5e0f78f26d..9b53282e0192 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -796,8 +796,8 @@ snd_compr_set_metadata(struct snd_compr_stream *stream, unsigned long arg)
 		return -EFAULT;
 
 	retval = stream->ops->set_metadata(stream, &metadata);
-	stream->metadata_set = true;
-
+	if (!retval)
+		stream->metadata_set = true;
 	return retval;
 }
 
-- 
2.55.0

