Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB332DE702
	for <linux-sound@vger.kernel.org>; Sat, 12 Sep 2026 10:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789207556; cv=none; b=YyZksz2x2cYSd3QnZf4qu9YEG3DVKbUSvuJoI8xc20FBgrjhyR+0pQS2PGi5fCiU3DeF7vktzikvj0T+eovYWJRLHAhPp4ZJM6JbQ5c0W/GZzXlqNfkvBiuM3SGmyj/F+8krnqG5baBNa1ctbzlAy5LhkOeOLvLoteSwRrNNCU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789207556; c=relaxed/simple;
	bh=LJOPmJrP21LYbzrhFhky3DZI4h+hJ59z5012EB8/nto=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=i7G5683cQlq7g4FK8hol8lNPIGUq9m4zaknuXmWZoOR/6ousyLZx4DYQEFFyTbboBmEf20fQkH4FTk/bi3anIMErWEbC7IT2zRmd3LWPaoBwnu/MUo03cxiwc5rup4FfTJKlbOFfrSxSM2LwIFfRSv841w0fzA8DFFNfyRPqybk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SW6aRQlG; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SW6aRQlG"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e2406so2616365e9.1
        for <linux-sound@vger.kernel.org>; Sat, 12 Sep 2026 03:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789207553; x=1789812353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6vpOBpBX9uNCEBjQ+845hANe2x9rtJ064R+VsEUkujA=;
        b=SW6aRQlGVz1NUoh6rFaIXJE0FQqSkwAyZoCoPbqF3/kCc7BzgzcsD7N7B/5y/B8U+k
         Umr8VDVwoGEOfOD5OhwIXB/k+ih/2/fh2U7QK/RKNnS+eyh+rs9jZzidHBTl+xRoNCGM
         RXqwDfdbw1fzTbO/teV3YcD8N3XavUccrBy5b9luqbw/utQgufeHRKxWamAmjyDtGGeM
         nB8SQu2cbODIPa2VxS0VgG2eVqGORu6kWr9qfzi3JwtIo1IjiWzbtsaLivlwv+4hfZeI
         cDac/ZcAI3loU74r526JUmY/IJhFyi/dqmO+y0D1OoMNy+1hT/mRyQWuYtJgdQiJEMFH
         pqlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789207553; x=1789812353;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6vpOBpBX9uNCEBjQ+845hANe2x9rtJ064R+VsEUkujA=;
        b=lslIxgUNdLM/EqOALPU4kcGO2K1lHrkIk5vW0PKEwFQ4f32ulbA1gyT3Zoib1b2oqa
         Eg81jBLD/QTCG/2hrRbYgf7UIRnkgtbgrCY1QzyeJIf/XROX2D8yMFzJ2V8XcffRBxa3
         1WtBwzFEzNMCHz45O5kW27Il2DS4w+NEWYdGbl+znXBVcOEwD1APIO//VYlwsXB//MUD
         6ejPF/KnZdw3eoPg7/cyDyI1UyUw+YMNW7Ec/97PyisEtNwxJlwaLnSxspAUG50oCi5b
         jntfMfqTF1cY05ivDn8zVTDcWH6Cq1/OS4A9QD2IU0ssv1TYfpVWqa3pr9bdHZNJPbSw
         nleg==
X-Forwarded-Encrypted: i=1; AKwUvBwbzO1tbSeFQMSQJyebpjjauPWfKetbeRyjHDYmPUdBjPKqi8o5r4f5IjhoPIZJU1XIMtFMHhbAsjBxyA==@vger.kernel.org
X-Gm-Message-State: AFuF++n25v/0CtfRO5KwcGm5NCU/iZxyQcuulgdKp0IsYDqaf75yNXmJ
	k6INFGqbEWjRlj0obvPXbEHn50MH8n4rFrYhmlKixhEuFxcljo57f7rT
X-Gm-Gg: AYBFou3qFLI8Vgv5/VOmQnxJ7iVmxopA/CVjwOJk4mICOpkUu1gZyDzAsVn5tEr2mTS
	aDdGmHAbbGscSsQYHq9UqItOcMQQ2/0dcSt6KeRyyPFn7aKfN7/qQCwy9XRZFdT+5l0IlPBsaUH
	FNXBUoFZfSBgRKyF8n+5hqJVw0NSs8d3OOdJp3dlYk2DY4WWst72POfgihdujX/wzFqapVhXgqO
	D0PDZYdt6icQh+Wi5TNudYKOLW80XWTVFIM8XZ2nqqfTcbi751UnTOY5ti3ncNVDppmMV2meEGm
	1giRaO/m4fOy1S3jH3WPCE384bE4nKnvQBCMY/LhfuakYPjXDi27sjjYFmpI+FWJXhXNJ8MmD1t
	5mqtyLPQIK3OBRctLNeoVTwln8onA47qeQ/Irdn2likou0/I/Sr8rVMzy03JbNVmsBrlJivf70r
	d6v2/LrxC2EGkuHSg4eZk155BckJXDBIU+H9ZFPgA1gQSdObrTbEGUTlRYBngDN88S5VwZHYScA
	ReuBxtswlFdVqbStxlCUWoqFaM/uahr53UcLH/AFlyQ+pi8HdJe0SbLSv+SE1E1PBbdmVvE13oY
	YuqYJq4Xa7M44R6KlbsyiSBJnXKsZmZjemO59yokhy/Hc4/74+SUXt/TetUKFDnDfvotAVThJku
	RGA==
X-Received: by 2002:a05:600c:19cb:b0:49e:6581:7baf with SMTP id 5b1f17b1804b1-49e658188e3mr76273105e9.2.1789207553028;
        Sat, 12 Sep 2026 03:05:53 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b260-f201-9983-e8c4-aff5-7a36.310.pool.telefonica.de. [2a02:3100:b260:f201:9983:e8c4:aff5:7a36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26be3e35sm220381015e9.2.2026.09.12.03.05.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 12 Sep 2026 03:05:52 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: control: Fix virtual master creation reference in kernel-doc
Date: Sat, 12 Sep 2026 12:05:48 +0200
Message-Id: <20260912100548.86134-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The snd_ctl_add_follower() comment refers to
snd_ctl_create_virtual_master(), but virtual master controls are created
with snd_ctl_make_virtual_master(). Correct the helper name.

Fixes: 79c7cdd5441f ("ALSA: Add kernel-doc comments to vmaster stuff")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 include/sound/control.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sound/control.h b/include/sound/control.h
index 909db0d0485df11385769367b484daaaf56905f8..37e9c545503e5fda45ed5d9a7fdfba3ad060fd67 100644
--- a/include/sound/control.h
+++ b/include/sound/control.h
@@ -244,7 +244,7 @@ int _snd_ctl_add_follower(struct snd_kcontrol *master,
  * @follower: follower element to add
  *
  * Add a virtual follower control to the given master element created via
- * snd_ctl_create_virtual_master() beforehand.
+ * snd_ctl_make_virtual_master() beforehand.
  *
  * All followers must be the same type (returning the same information
  * via info callback).  The function doesn't check it, so it's your
-- 
2.39.5 (Apple Git-154)

