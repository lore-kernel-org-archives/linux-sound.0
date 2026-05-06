Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B57440DFA8
	for <linux-sound@vger.kernel.org>; Wed,  6 May 2026 03:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778037358; cv=none; b=dHZTknfsI+8/jSQnVOTPhoFC2tvJ1tFvV0eG/fsbLjacTA7L3PyOi0OGof2kQKMfzJMxKFW3IXt2rSBo8vCTw/HOj9TXlebng3dh15FjeLBXuBXWEKFOS5Il8Sw4epUgYJ+gBvagRa3+Siva2NmNONbgajeSNgh4IPVQHyapl8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778037358; c=relaxed/simple;
	bh=D4Dm05R02gfMXqFBcn3iEZPk3hEFDGh7B79LWuzYI+Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=aGdiCEXwGZecd59gducvkqUdiwsjGpgS3BK8kg8eLVcqR1p40OezfN0yW5v9K9LnAsmIw/LCpcSRkekE1bITzlBwmVc0MkMTRDtYg5EeQPtyh2bxjK7nzPdEv+x9rdUiww75Ti2T32goaRkfTAQR3nGSKuG+lx+/5po8GaP7EQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DB9HhVSv; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DB9HhVSv"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-130b2295ed0so3903135c88.0
        for <linux-sound@vger.kernel.org>; Tue, 05 May 2026 20:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778037356; x=1778642156; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pP0UnLhxdUXdfJTdwn0EZn17bc3fnvL8TzqCEVSM0Kc=;
        b=DB9HhVSvZgrkBFJV4j156g0IZ2qfL2sVsDl7Ww8PjRCuAaekiGcDk1lCoZQvOJEV6g
         43z7HMbYPxIShLsxkxI1EKxZ9M2wCyhDGlcejEANhgOVTQrSkrw4w0T/vtHWTS2oyVWv
         7SVo4U5E5biIHP4p0ikizQaRgSk6i9oUm6Oyh3LSUWYRxJYbSGFXWwfvjt8F5WMEU4Ts
         T/siXFzLT41sCF6zA5u3PhDmWHek8720goWmE0QSV6+zU+b9JDSCMdoZWhsymWRd8X1R
         YELfmSo/PrsD8QNMPa8zmPO4zg9Wi9mtoukw5TMhqJgY+X9FtqdYBYNB/YAHqxnP+J8Z
         B5pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778037356; x=1778642156;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pP0UnLhxdUXdfJTdwn0EZn17bc3fnvL8TzqCEVSM0Kc=;
        b=AKmEk9CwzRP8cUx4R4Vmdo/o14uu0gFK7zMzmOGOZOajdV5vnJBEQOfopUp+e2WVFf
         vaBInE1Vhk95vJ+cwN19YCr11a+FFj2ahgQ7dBOxbQHwmnqgm34zzYsHUAmV5PC1SaVK
         UBwJzNayJeWBXf+kcAnOb1laUfp/u+vCQ4KKbJmykINPDT4TIvv4+7KfiTDOBORDslBb
         LtvFO8RDIUyanf7U07/+wzxTyGCmdsB/MkAmCpjtg8H7iaxm/5Lx/fSrBkdgTtfmoTp2
         87fI57/tQ49HklEQ8jdNmDY3LNI0hXszw2QlgH3y7w9OuYtKzQjroYwzdqsnSkktIt1Q
         sflA==
X-Gm-Message-State: AOJu0YxDWnnZxTD9+kehf8R0VgGzEKBfGFek69ua+TjaDy8omLl+CyvQ
	i/jhNwhXOLKhNjSK88XOXa0tFWcTg3rszBSYOxWqB3P/39OyMPxbDCE+
X-Gm-Gg: AeBDievMFZ6DNfQwbm+Y7FJd14HrdHBqMwBuS4EdjmPHy5+0MG0vsLC2aPpWrJ1EPSP
	OMx/TVDp6lMd50B3C95MQVY93xIGgvjTdT0FKaG807cGLbCW67P0ZgVvfDxhNx0hWlUOBBEoP0e
	+phHC+UBqb64sTaRUJOqhBevwNq9I8BLAZxdsUfJxbknDx34/a+K7/mPhMGtOd93AbEDXREWR5V
	cWyA6mo4UKTHZUyrsK1aMjDRAqSv69fVyFvWc894Td55uQmQILfZHh7U7O1Ji0NAJs6PUXF2Jkn
	eUMEljfFDmmfTB8wZffcuXLPfKK/Li/Wh0vFC+Y27uGIZGUcKLDvdORuWeiCLbzwYicws4FZ/8q
	2v0h8dALWOJqrZqi67aiMcxXmtcQh9/OzwmPsmqX+P8kZkiTeiVHfyS89ZThHPasuDgO999y4Wr
	j66loiPMnWoYf4iI+IHFMz3/UOG8HcR6WjOhIFTEp12l+h8TeUs34aJ48wlcnv3c1jgobNGrYJ3
	9DrYTQADhVYuMwld63QdSI=
X-Received: by 2002:a05:7022:6b94:b0:12d:f0b0:e32b with SMTP id a92af1059eb24-131852d2ef5mr960167c88.6.1778037356149;
        Tue, 05 May 2026 20:15:56 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-87.user3p.v-tal.net.br. [177.4.161.87])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-131f00196bcsm1957989c88.0.2026.05.05.20.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 20:15:55 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Wed, 06 May 2026 00:15:48 -0300
Subject: [PATCH] ALSA: seq: Fix UMP group 16 filtering
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260506-alsa-seq-ump-group16-filter-v1-1-b75160bf6993@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMMQ6DMAwAwK8gz1hKAsrQr1QdQjBgRCG1CaqE+
 HvTdrzlTlASJoVbdYLQwcrbWmDrCuIU1pGQ+2JwxnnTOodh0YBKL8zPhKNsOVmPAy87Cca+jY0
 NjfGeoAxJaOD3b78//tbczRT3bwnX9QFmoUlxfwAAAA==
X-Change-ID: 20260422-alsa-seq-ump-group16-filter-cd4c31a3066e
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3181;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=D4Dm05R02gfMXqFBcn3iEZPk3hEFDGh7B79LWuzYI+Q=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJm/NmVK1jR8qogQfpL1+mYnb/qqxSWqNl29T1rTDf56P
 zlivM6ko5SFQYyLQVZMkWV10iLLPV0PrtbHrfCAmcPKBDKEgYtTACYitpaR4czBU02/0uN4/5+/
 JRMeFBqfZfVmns/KvsDTW51lm3eWuzD8szu08/bfNzNsbjeuS54clKKdfIvpm0fXU5XF9dF8Tjc
 e8wAA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

The sequencer UAPI defines group_filter as an unsigned int bitmap.
Bit 0 filters groupless messages and bits 1-16 filter UMP groups 1-16.

The internal snd_seq_client storage is only unsigned short, so bit 16
is truncated when userspace sets the filter. The same truncation affects
the automatic UMP client filter used to avoid delivery to inactive
groups, so events for group 16 cannot be filtered.

Store the internal bitmap as unsigned int and keep both userspace-provided
and automatically generated values limited to the defined UAPI bits.

Fixes: d2b706077792 ("ALSA: seq: Add UMP group filter")
Cc: stable@vger.kernel.org
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/core/seq/seq_clientmgr.c  | 2 +-
 sound/core/seq/seq_clientmgr.h  | 5 ++++-
 sound/core/seq/seq_ump_client.c | 2 +-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/sound/core/seq/seq_clientmgr.c b/sound/core/seq/seq_clientmgr.c
index 75a7a2af9d8c..5719637575a9 100644
--- a/sound/core/seq/seq_clientmgr.c
+++ b/sound/core/seq/seq_clientmgr.c
@@ -1253,7 +1253,7 @@ static int snd_seq_ioctl_set_client_info(struct snd_seq_client *client,
 	if (client->user_pversion >= SNDRV_PROTOCOL_VERSION(1, 0, 3))
 		client->midi_version = client_info->midi_version;
 	memcpy(client->event_filter, client_info->event_filter, 32);
-	client->group_filter = client_info->group_filter;
+	client->group_filter = client_info->group_filter & SND_SEQ_GROUP_FILTER_MASK;
 
 	/* notify the change */
 	snd_seq_system_client_ev_client_change(client->number);
diff --git a/sound/core/seq/seq_clientmgr.h b/sound/core/seq/seq_clientmgr.h
index ece02c58db70..feea8bb7d987 100644
--- a/sound/core/seq/seq_clientmgr.h
+++ b/sound/core/seq/seq_clientmgr.h
@@ -14,6 +14,9 @@
 
 /* client manager */
 
+#define SND_SEQ_GROUP_FILTER_MASK	GENMASK(SNDRV_UMP_MAX_GROUPS, 0)
+#define SND_SEQ_GROUP_FILTER_GROUPS	GENMASK(SNDRV_UMP_MAX_GROUPS, 1)
+
 struct snd_seq_user_client {
 	struct file *file;	/* file struct of client */
 	/* ... */
@@ -40,7 +43,7 @@ struct snd_seq_client {
 	int number;		/* client number */
 	unsigned int filter;	/* filter flags */
 	DECLARE_BITMAP(event_filter, 256);
-	unsigned short group_filter;
+	unsigned int group_filter;
 	snd_use_lock_t use_lock;
 	int event_lost;
 	/* ports */
diff --git a/sound/core/seq/seq_ump_client.c b/sound/core/seq/seq_ump_client.c
index fdc76f23e03f..9079ccfdc866 100644
--- a/sound/core/seq/seq_ump_client.c
+++ b/sound/core/seq/seq_ump_client.c
@@ -369,7 +369,7 @@ static void setup_client_group_filter(struct seq_ump_client *client)
 	cptr = snd_seq_kernel_client_get(client->seq_client);
 	if (!cptr)
 		return;
-	filter = ~(1U << 0); /* always allow groupless messages */
+	filter = SND_SEQ_GROUP_FILTER_GROUPS; /* always allow groupless messages */
 	for (p = 0; p < SNDRV_UMP_MAX_GROUPS; p++) {
 		if (client->ump->groups[p].active)
 			filter &= ~(1U << (p + 1));

---
base-commit: 0d672ef050d4e1c3891c9944f72c85769978bbee
change-id: 20260422-alsa-seq-ump-group16-filter-cd4c31a3066e

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

