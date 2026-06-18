Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C1E31715A
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 02:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781751133; cv=none; b=DKIN/uqJ/DuaJ5jeblm0ommvuw9QtyHC+Iiw+AHot2AEcSDmulBd5+iAU2goVCpqJ2cIKhrO6ZQXJ1lCJEKyU1OcsvFSWpJ3Sk/H/0uyy+jSHg4sboA13hlQFAeVAmcDW0eGt2nEKUudh8HiyFAI4+L3u2izqh4P1iE0s265dHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781751133; c=relaxed/simple;
	bh=9d87kPbd9ILqaxDtjD9cZXIH7oxXzFv1v+Mq1LUCt00=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HSTGQnu/SYSIR8DWwC7ykN18EtgeMVY7sTUVxx1xjZWPdzyUXy/vI8H25cywzuKM24Us+O4i/Ve4K3aGUmzNPiRB0M0lV00XwJVzMIpS3IvYraC2HdgB2nkyvsyLhCvot/O6jDOP6wQA1D8iR6sADM3Syq7VUrXmk1tsd1Jvg/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nIU28ucv; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nIU28ucv"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-51780bbc560so13779401cf.0
        for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 19:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781751131; x=1782355931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cq+gYsRx61AKMCk7pvY1nKXQBL/Vg+8iL2ezr8hHFyk=;
        b=nIU28ucv6JN65HY9F1w0r6yGLiejDxvQsvsnXrZPxAjeTn6aCEcTDdCxMm81HaUgqC
         u5rET8tTTkLTr6yYuwxXqkVmv82rM33XsyiEyulkfb5fNkKLUr+kPNqUyJcNqJsgUXRD
         8xk6fI/h6FkkwZJvbhXihxD0O/Sfpl7z9T7NKw6CBWtaOC7fI2ix10rNpBDOP1TPwesf
         5OhAC2b4HSUF2W2LlEKKYTYQoEpO1A2PCQvpdUMp0zfvW+5ws/hRayWzmf8ofXapSbzt
         +Oaq4tLD8cwp0cg8xjKk09QeAY+4BBmRplHPiv0z+BUtmTnRjRqLSylRPfQPxDAx8VjI
         39EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781751131; x=1782355931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cq+gYsRx61AKMCk7pvY1nKXQBL/Vg+8iL2ezr8hHFyk=;
        b=nUjDuWwSYtMaBuCrypl9c9GXu6a/nXXkV8Nyl+3Xtd/N0s+cKFaBfJ5BLwlhi1tHCA
         v6RQfbez+nFwbbs3VnIOtGND7XOgTk9/RFNYyEwqm0xeauzrOVb+VeBh1smOZE6ygtAn
         Q0xLrExFJnnTW+82blbaipHU07iJdOsxAaDgku83q5/ZAAiji14DS/Xlvg4twqWcLYSt
         QqjIbtXVrq2ro8pq8pGUD6PhvJS97KDSkPa2ltSvZP6mjLU8M8O49j5Vgm7uyGubDWiL
         1/YpKa++n23cxpYw3zmoU8Q9cVzRuurA717Hz32djN2HOzQk5VwYvU/jUsanICUJ+vpf
         fAmw==
X-Forwarded-Encrypted: i=1; AFNElJ/lPVlYV0R1mpwK/UD/XUk49ub/avxj7juv4W9nZrjC869GY3w4Wg94LNF7kd7WfVPcce06fvuJmbcRtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3e2YBwTZ6e/aHd1DCeXOU3pQ8XQP50xoExiUnc0cIyuUI1rEP
	2+QSdtqY+8/Xq9vezfNXEtpMJLa1YjThyVEep9nRQJBaj8QTPPUs22ID3YKn+h1gQXA=
X-Gm-Gg: Acq92OEcjcwJ8Or/+0p24ivuyFQdgukSEihzZeRPkx/pGe9armgtEPgXl5Y7XiZJXms
	VZ+ELzMQamo04r6mb3+7ABoq6LvJqQZYmar9fqKhlBImhcjUbetLIwqY4uObi3gjxDZKsf1BDEh
	FOwz++n19W3zNNCxY6CeVnfgmKdpIxW6if8bMj+PE+LDr+jRC91HuGf5u0LzU/Zyp/Qb0tF4/tD
	nOG6IJ3Zdl6a45+mbkNI78FeGGZay5wIeSqOEA6+Nh2cO6gZR2qG3N0egTodKc/dn1YMnYBFole
	ka7//iRp+lNgYuvX4a0rnWDAbTGoD5BVtIAwMIZBy86t/MsDsqFBOQppNHXcrX/Tytxukg/RkxI
	GkVnBST968CrIQuhfqZ+y85motbGxpB1/muBuW55+xbgOGzC+aGXGNqTni6HVbZODTLKrf2Vw8e
	/WR9jUWYhFQk/nz41hf4KxtrQG2hrDtuLwlgkTO3G2lK3MbnV6/1hvl+9Nn7XdIfmrimyUtILGk
	t+p+6bylUdUjIrlbZKXgf91FvTGbQRD30uXN5dfVp4=
X-Received: by 2002:a05:622a:6206:b0:517:c699:3387 with SMTP id d75a77b69052e-519c4f3381cmr29388451cf.37.1781751130898;
        Wed, 17 Jun 2026 19:52:10 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8dc7f9b4b3fsm25333386d6.31.2026.06.17.19.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 19:52:10 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ALSA: usb-audio: qcom: clear opened when stream enable fails
Date: Wed, 17 Jun 2026 22:51:26 -0400
Message-ID: <20260618025126.1862954-3-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260618025126.1862954-1-michael.bommarito@gmail.com>
References: <20260618025126.1862954-1-michael.bommarito@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On enable, subs->opened is set before the service_interval is validated;
an invalid interval jumps to the response label without clearing it, so
the substream is wedged at -EBUSY until a disable or disconnect.

Clear subs->opened on the enable error path.

Fixes: 326bbc348298a ("ALSA: usb-audio: qcom: Introduce QC USB SND offloading support")
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
---
 sound/usb/qcom/qc_audio_offload.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index 852a91e4b8686..221f87791bc94 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -1618,8 +1618,13 @@ static void handle_uaudio_stream_req(struct qmi_handle *handle,
 	if (req_msg->service_interval_valid) {
 		ret = get_data_interval_from_si(subs,
 						req_msg->service_interval);
-		if (ret == -EINVAL)
+		if (ret == -EINVAL) {
+			if (req_msg->enable) {
+				guard(mutex)(&chip->mutex);
+				subs->opened = 0;
+			}
 			goto response;
+		}
 
 		datainterval = ret;
 	}
-- 
2.53.0

