Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8A214A4F0
	for <linux-sound@vger.kernel.org>; Tue, 19 May 2026 00:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779151798; cv=none; b=P3HXDxuMsE4tuoD4GZRzX+a8Ji4rnlnZpNWvq393dCr7LJ6/NPobKjygd/f4YaH2haco1XqTXhOEI7DlL87UDR/rwAlRlXePuwXw/mLqlzRrmNF7/J+PojZrh27+i25gHJdgVOlavoSXT80HxCG1ge+qRa++6lhLGZcWqfJJVHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779151798; c=relaxed/simple;
	bh=FmkOyThkrGl6lnh8Mje8lSgdK4yxrXuzLn4jSCDBUBM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=baMiOBHVBSemQ6b0PIrcS7VYIHOK81j0fGHuQHCPaBv+EhNJ8vEOFLpyu7uqezcbYMTKTmYdvic6UkjagZCwLvN2Q6PQDHH0S9VEJz6zYEXu1f3U/hdmiPsVB2m4Dx5OZOIbVDZeOI7f3u21IDIfKREkfKtHr/J7mFCY8gaHJeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CTonWlAA; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CTonWlAA"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-50fc496c8baso38090741cf.3
        for <linux-sound@vger.kernel.org>; Mon, 18 May 2026 17:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779151796; x=1779756596; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2Prd+4YAHvUFam2zSodu78Nl9ekYv+HPkYU5UZdRuUE=;
        b=CTonWlAAXgmm3ldvYXRa3b0z65/1MECe+e1u+MFhN4f74FgyxMXapYQG5XVTfQnAEz
         i3tUEwF38ELvYj4gyWFX615dyfpwG3hU0zIrCKLtNC+c9Sb5kiIhAfZafdFZWiAt3GgC
         xcivEwsm4XAzcTuuntW5taQk9XZnZsBm3m+X37vEiWwwVC7TRquYpdiplZjZLGzIMRNP
         hM/aO9sMxYV/K+Gypho1Vn62jPKgTZFVMqXgoFwBQVWNL3Xhem3wgU3L32RcnfkdKEkJ
         3afDRNO1W2Peb8/Grs+GHtX9YYNuTXWs9raNhKCm7t4k5DlGc3JX3I6HzITDEu7LXjku
         EsDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779151796; x=1779756596;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Prd+4YAHvUFam2zSodu78Nl9ekYv+HPkYU5UZdRuUE=;
        b=rjuQglGUfqe8cCe+kbrOAZK+8Y/MDugEdwzKRXv8O+/DYl2GPO9KGh1fQbg8KB/JVu
         3wd35x/B55gFW5ByMzYfW11FrxpM74e6pLERUPz7md4PncyobEan0SFytvTDZO+XqHlk
         C/cFXrKu3l3gn4oY1FrNcICSJihvw4eVY5fNgjPO4+FhfopG8u/fQngcZiRz4DdbVM39
         GQ/2OrSg+7x/7MNs+y8UCb5cSzLbpUN1HksBnBZW0pHjDd9jjYSIgqePwwua1Z7eBFHR
         oLt5/VTbxOxXqWOOEALc8iq63et8W5fL+2eulxMVGpGE+4gpHu7yfuK2oGAsCUislI/5
         3Mrw==
X-Gm-Message-State: AOJu0YxlpLpW8g/mFZL5fW8fFHjRJiTo6hQQEXkE/T2SDoqbEAeLIQuc
	4fGNmTkoDgiygQ5tR6RDOZC/RMlhFXXD5BS3sCll6kuNGrMe00K70UvfqcTyTrVn
X-Gm-Gg: Acq92OFht6OFNDdueeKITmB9oDo58A0OaBW32GbuF/b1oPh3dnoGwQ3mcZdC0jEjSGo
	DAnVJ7wGbcPHcKgWaqPB/3R5p5VMkrHMZ5gaiX1AoxLF+FjI1xr5AhYr2aE6vIbZwYNg5zCgKMJ
	bsH95thLRMPpetW/khg4yI51KWJfRitDtaRvUDNHPSe71YHRH3aKeHdcaQSKql4zN0xlCPz/p1B
	cXel3rn2ZZ+Dq3cxowwRQE6gRupbSEORHihc6LJC6oZbmdNakwQhJuJcvvbE3jWOkY5E+9ihhsC
	jngKieJIDL0X+etBBUNBPkESKntlh+8ZDgqZieF6zl3MQfczLD9rs3W8oVHYi3W4/mODwKp72s2
	oqmVkb+G9bmPks8kil78QlOJAL/a1+2UuXy4cvD/JV2jj8T5G7NdvHXsUjb9iBhn3dEvKaDC1YY
	JCE6ZDp+rYYbaXfC/UJt0V2Ri+hrZLZ1EVhUmiQQLirLQCxIkTHSBpO9PXVdLLaRTd3KVDCrqGn
	P3Z6kfIe1ykkRSvB3WuK0BMj7HkrQCjoQE=
X-Received: by 2002:a05:622a:1a90:b0:50f:c2f8:4075 with SMTP id d75a77b69052e-51659fde983mr227579151cf.1.1779151795948;
        Mon, 18 May 2026 17:49:55 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5164568a275sm148349551cf.5.2026.05.18.17.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 17:49:54 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sound@vger.kernel.org
Cc: "Geoffrey D. Bennett" <g@b4.vu>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ALSA: usb-audio: Use flexible allocation for Scarlett2 packets
Date: Mon, 18 May 2026 17:49:35 -0700
Message-ID: <20260519004935.627797-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allocate Scarlett2 USB packets and request buffers with the flex
allocation helpers for their trailing data arrays.

Keep the computed packet sizes where they are still needed for USB
transfer lengths.

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 sound/usb/mixer_scarlett2.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 7ab3c0dd4755..2bdeb537a983 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -2614,13 +2614,13 @@ static int scarlett2_usb(
 
 	struct scarlett2_usb_packet *req __free(kfree) = NULL;
 	size_t req_buf_size = struct_size(req, data, req_size);
-	req = kmalloc(req_buf_size, GFP_KERNEL);
+	req = kmalloc_flex(*req, data, req_size);
 	if (!req)
 		return -ENOMEM;
 
 	struct scarlett2_usb_packet *resp __free(kfree) = NULL;
 	size_t resp_buf_size = struct_size(resp, data, resp_size);
-	resp = kmalloc(resp_buf_size, GFP_KERNEL);
+	resp = kmalloc_flex(*resp, data, resp_size);
 	if (!resp)
 		return -ENOMEM;
 
@@ -2830,9 +2830,9 @@ static int scarlett2_usb_set_data_buf(
 		u8 data[];
 	} __packed *req;
 	int err;
-	int buf_size = struct_size(req, data, bytes);
+	size_t buf_size = struct_size(req, data, bytes);
 
-	req = kmalloc(buf_size, GFP_KERNEL);
+	req = kmalloc_flex(*req, data, bytes);
 	if (!req)
 		return -ENOMEM;
 
@@ -9646,7 +9646,7 @@ static long scarlett2_hwdep_write(struct snd_hwdep *hw,
 
 	/* Create and send the request */
 	len = struct_size(req, data, count);
-	req = kzalloc(len, GFP_KERNEL);
+	req = kzalloc_flex(*req, data, count);
 	if (!req)
 		return -ENOMEM;
 
-- 
2.54.0

