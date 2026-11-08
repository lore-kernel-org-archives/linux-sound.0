Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794158800;
	b=CsYHKmdlizhjtJBYLcBNCAG+3leMUyWvzDwlsZtVisj8Bl+6Xu5ybdlL88sf2yU4TmBH
	 wlkY1H12mwU5IjY0aRgho90r2n/kQBk8n6bczvO5lxjA8pUI2Ax6KgNclSH7W+IEnG/py
	 luzHcxX0Cawz0k62N0w7cDpyPV7BJ5BK3ubwzqFhcktq2k4Mz+zKmpenmkEzkpzm6wThq
	 irCfRJ5VAKU5LNGMUTSAKHKWkJJcOKiGD0aqXEVXtoLNN7YMrkmxAVAl2rS3adcmZ46fA
	 Gv+BpZujdklmytCg7xtqAAq6LhpJuZhulF2KoTBXYOBW9ownstxVm6VEeAw3ZF/yj8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794158800;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GimyCLzTK2kHf3bS68Mh0aWkn78dhGyOUtZ1E39mgiE=;
	b=07GLpuKTldOowrhMMIkJXhA6E3CI70KnJPGaumZtPoLKuZldlyiHbBDGz65LFbYs5ZbG
	 fwzcMwUA+BeT4JFCHalDcgxYGQsnftar2JmzScft3ex5J2OUKivrxT1uVTIxKdpiO6Axk
	 dtStO+GXpSYSLI8i9t6VxJoOYMNXpl6S9x2QTE+MgPcCQ0Ax7UPSEohEzKYl+Q+C4U16t
	 4i6ExOnn1WUOkayBurBiyEFAESTMUFcd3K/OZP+ei5l6gGnia8f/ZwSDdAXbxKMsTtObv
	 sQp2RmrCJlgmCUT0nFeJhc3EeiW8pBoaekiqMFUJzo1wKFZH1Y7vFjy2WqbB5988EgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CaKRpWSV;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C5F606A320
	for <linux-sound@vger.kernel.org>; Sun,  8 Nov 2026 17:26:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3C5F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CaKRpWSV
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1a2761c69fbso522328c88.0
        for <linux-sound@vger.kernel.org>; Sun, 08 Nov 2026 09:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794158799; x=1794763599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GimyCLzTK2kHf3bS68Mh0aWkn78dhGyOUtZ1E39mgiE=;
        b=CaKRpWSVvqYPS/l1YHqJM3ApnlGCZYw/EbUdYXjRucRHuair+2CqHlTfji8HgPLM9t
         eGCQsuT2CPMUoVlz6ySCpvfTvUz25Xr/u0vx9ZqCzBRtRrjOOyQPBFJUSkIDXZ6RdNr7
         JTq4m9PmL1Sqf9g7c/sVZfGfk3E+49hh2xEp88hlKTIdnVi1mvtwS6NPNeFUWmQDtwgK
         0Mq8yqCED7nq9/U4TfOM0gB0o0+rJRmbcFkBiL+XG+BFJitAQgZ2VCzT1q3/bZOXKb90
         s8YfznieqLKOx9Rr+5lBXSmtG4MoBhMTFNvnHyp1o8+Znn4nEO3Muu/QQq0aSz/yiwkr
         pt8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794158799; x=1794763599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GimyCLzTK2kHf3bS68Mh0aWkn78dhGyOUtZ1E39mgiE=;
        b=OGXHq8kxAyxf0QKdaeEAEGRZ5I7pIyzfDkwZIwpC0ZhixYTgccjPHoeELebyJ0x4p6
         xQHKYz+bWDIVCNg9jTSR4eWQ8+npxil7HcY6IO9hTYi8cQ/AcAEONv3jUsO3KnIUEb+L
         5NjQ1PSeQ/wE56I7gHKziQZScUky5auysFY0+4ronZNHI53VO/G4Dgj2NYRWkIr7tobF
         qmsn8Q4+xS0v4GDW5Vw0RhlHJxl6PchG1TGUh3cz1uh3IwSu6Pjf+Vxzhu6egSozzkHN
         5OJk62zFAlu0d9FywzULVrq9kqRxD4ysuYLCk5N6iKI4iZabtrQvnRMu18n08mwTMy/0
         JiqQ==
X-Forwarded-Encrypted: i=1; AL+hErGeMQQg7cCfj67But+9EaOI44tHFInIrd0Mws0Ji7s7KgKnLSwv+7Uailhv1avoqDZJ2Q0iXBRfZA61/Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z9Nrv84/w/f0ZRNI+wFKFxixaHqpwWdJJPMIIUkFjgN1h1AXjRd
	Ndc2go2MMOzuW9eZNQ3P/o9/fmwzhvA+9QCKrevUiib6E72V2uYCcxXy
X-Gm-Gg: AYBFou3nosJ9sp+z6RYuMLgrJIysh1azblyQd2NBjYgPnAjIa6po507+JjJUjFoMA3Y
	MVTtHLYakgvCw4NbuSC/EF/wWYExD8ubEm+2mMUzepS1BvgIgUuOe84hkYPXVNwDjBCffXpoXes
	CrvhxjFUAbZ45f36IbbRuPcBDmYbiCn9Zfq0jGubiWaW/uz7K9Bo544NPI+yAKCKzI3UKEJCZVq
	ht/bSYwr0IPaKEmCgV95l3cN50cuPLwETysuUWE0IZAFlMhZ0T8YtVYiVXyzJV0fUEwUpwBWSTm
	1kyeP2clt+AOG/YKNPruA8xmxK8ZDU7cU+TUor9nvHulcYg14/Y9NQ9HibYdTYx+nGEqnKVQ7o5
	GnIDAe0+SMNDkBQ+dGR/6vwKiYe7DvaYMl+K2AxX9ivqXzqZH5RAIbv0BFr1asaGU/LkFLqrwPN
	uWho3IiJ3r/mnVXgBXR33L7ydVqHcw91Hks82zBRnU52YzmvuquiwLJDWVCOM7D7+h1s2KRnIUa
	XdAH0TFozcl4MxYjO5KUak6zFu0URqy1jJZjyEbtWG8N3U42fu/qmEX/zKnMfvQN4sZIXJ9o9Dm
	bnJzp5UwUKOGDzwLmL5CwreeDJ8WtJD9yl/QsCenmFmZ3wpsU1o=
X-Received: by 2002:a05:7022:3b87:b0:177:9a5b:a89 with SMTP id a92af1059eb24-1b39feb70b6mr3229659c88.29.1794158798761;
        Sun, 08 Nov 2026 09:26:38 -0800 (PST)
Received: from localhost.localdomain ([103.177.253.80])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755eb6efsm8095792c88.4.2026.11.08.09.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 09:26:38 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: sreekuttan2156239@gmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	tiwai@suse.de
Subject: [PATCH v3] ALSA: control: Validate element info in compat ioctl
Date: Sun,  8 Nov 2026 17:25:01 +0000
Message-ID: <20261108172501.2887-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261108141219.7655-1-sreekuttan2156239@gmail.com>
References: <20261108141219.7655-1-sreekuttan2156239@gmail.com>
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

The compat ioctl code calls the control's info callback directly
in get_ctl_type() to get the element type and count.

Unlike the normal control info path, it does not validate the
information returned by the callback.

The compat read and write handlers use the returned type and
count to access fixed-size value buffers and calculate copy
sizes. Invalid values could cause these handlers to access
memory outside the expected buffer boundaries.

Use __snd_ctl_elem_info() to get and validate the control
information before using the type and count. This also applies
the same element ID handling and access checks as the normal
control info path.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
v3:
 - Use __snd_ctl_elem_info() instead of duplicating the
   element ID handling, access checks, and validation.
v2:
 - Rebuild the element ID before validation
 - Set the control access flags and respect
   SNDRV_CTL_ELEM_ACCESS_SKIP_CHECK

 sound/core/control_compat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/control_compat.c b/sound/core/control_compat.c
index 87f7ad5ab739..a9ee5ef30c51 100644
--- a/sound/core/control_compat.c
+++ b/sound/core/control_compat.c
@@ -181,7 +181,7 @@ static int get_ctl_type(struct snd_card *card, struct snd_ctl_elem_id *id,
 	if (info == NULL)
 		return -ENOMEM;
 	info->id = *id;
-	err = kctl->info(kctl, info);
+	err = __snd_ctl_elem_info(card, kctl, info, NULL);
 	if (err >= 0) {
 		err = info->type;
 		*countp = info->count;
-- 
2.55.0

