Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4AE742A17E
	for <linux-sound@vger.kernel.org>; Tue, 25 Aug 2026 12:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787662675; cv=none; b=dbz1fJ+nrNMJilfbMfQDB3KYvJoIT/KENQeReUJPwq68kFQ6GTtVFPXYDNKyPfwZpCcXZUaBQwOsS4IakAvQ7K2K0Bq+fMhCUA1WgixgJc3QNAm+FlSxxKzRY4WJ4dK+JGmNTAZBWfFmrx77ZmFeeE1nocs8nFKLVmX8f+0Ry2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787662675; c=relaxed/simple;
	bh=QP+3/LI0nxLkgJ/Scbe7OQh/8ApQIaUvT5L3XTK6zFI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fQfFINDdvGKRjqk2Ky3sgdGf7v4mIwbBgHQOWQYORket66em0VUFDeQlM/w5RlAxlDDPcCdGe5Md2N0JaRbjcMZeLU5DEltMQ4+ZB8tuNZFxgl1KgkhmEhUsyh/uzoiiaQTNOCLirSCevdk9APTkdhiCWxI78M6r/ARhVuqf6jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QSPzWO4p; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QSPzWO4p"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-84e27035206so1952467b3a.3
        for <linux-sound@vger.kernel.org>; Tue, 25 Aug 2026 05:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787662673; x=1788267473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mxkwXPN1Bs/FaD68NtnzI5z2SBmRZQo8jCWgYr3x1Zs=;
        b=QSPzWO4pm8QEHbKsMMnapIEnEE1pFB5Vbhf2sRem6thc12XyPny9eSJ5OJbcroWvWH
         NVHOqQ1zjJtvcOH+LoCKrwRW/9YTm7saSa3jclg1/z2ELmzEGy450JYMN7goxV9n72GY
         V3ecp2TlusGLHaA1v9VxnhP0PrQJ6KVk41RYtGbp9HUqtmNYvjIkzR5IczRpSIjSSOTT
         Bm/IEuRgSpMTXg8Obxi6dfsBTvO/2qXlzffNnqbHjQdju/fzUfSTCoDFAXHQLJhwXd5Z
         Ylc4lr+iQQF6hJUdEZUlJ/80oMDtig+IBVnlzGl1ZZgsdYfRpoh2OPvVs4nMwe/Vq5bG
         +ASw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787662673; x=1788267473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mxkwXPN1Bs/FaD68NtnzI5z2SBmRZQo8jCWgYr3x1Zs=;
        b=np7W7KZcic67qH67XE/NNUACCm9EAHdm0pF2u1NyLuxaDmW8FyVdLluTQh2EOkaeY+
         HjPt0ksG2+Nsvf64HpimqYldXNwSFGWYpdnOzaEDNPRjdgiBMApuOawGyCBa7wBEInK1
         MpDgXW1kSNrP1thfQjH/OmyzPVyHuAGlX6hEjg43/OEZUVNWyFIb6Y1yDjbGjEnh9sVW
         RG0GKpJ7RqluoDX64LF/QdOmGaBL/E6jq6GABTWQhCTjXwnHZE89tIm8tUHmF6NeIKLk
         XiWJgXKvNAn/pqswOdmgCvrB3kuMsFh1lgcXj0D16yyVcMhqJ0bH+0jeE7uROttTC9KM
         183A==
X-Gm-Message-State: AFuF++nzCZ3ESObV0h2Zq2AuVqWdSV48ezDs2HwMfOB6fc0lIToZxDIj
	i9hy/O0h9FRjqsioMH4E2HpL62fiPdCMgHfTnqWihWUmzeBq7aM9tMQW
X-Gm-Gg: AR+sD117o66jt6NaA9slDtdn+oFBGFSgct056z6cG2EYRYCFY2lnUbrrLI3BqX8SmAG
	3sxI70ICRbXiEIKi6dn/llI1xjHUv/9fTHXnZasFYXxbvsJTbynnJww3whMa0lvK6FDRcnEOVQj
	SL56lGDH4o/YzlFxHBkduURQQkdSyWE1NEU4fiR7fFds7z0uOidXj1fa5mUy5YY1IaXpS3YI7zF
	4L8kAlBAFcv9F4YRZDsi9o/4nRJPWtjiCSF42ado7NLYgvYIUZmAJMkR4lqxyL9kZ7iB18NaGX/
	iHhZqd7SDh8XcCaft9lVCq+C+GPoh6yFL8J2Y4m8j+lxXxKcpncQgjCWAFQSIkV9yMHUksFZQrf
	rbKM04W64Afz6D4RQKAxPj58xaQMRZtggFM1MfMf91vn8wRQaSt+gJUGzCaiHp+gzRAeYb8JIB3
	ZY0wZSlhUcZmWRVa++lqCX+5Z501GXn4Pa4dxb7v0B173Q48PD9OoDU8Ra34ZG/ivtKA55+V5dz
	wnpSA7+MKsNMdwEZ7RXwMkzbnxhVFBOJij0u7mWPtcQCw6FaZXZGQ==
X-Received: by 2002:a05:6a00:3926:b0:848:4754:28e4 with SMTP id d2e1a72fcca58-851fa060bdfmr53550880b3a.15.1787662672900;
        Tue, 25 Aug 2026 05:57:52 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8520f03b185sm2937367b3a.39.2026.08.25.05.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 05:57:52 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	lars@metafoo.de
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH] ASoC: dapm: Fix off-by-one check on the second enum channel
Date: Tue, 25 Aug 2026 21:57:45 +0900
Message-ID: <20260825125745.932832-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The snd_soc_dapm_put_enum_double() rejects item[0] once it reaches
e->items, but it lets item[1] be equal to it.  Both go on to
snd_soc_enum_item_to_val(), which indexes e->values with no bound of
its own, so an enum with a value table reads one element past the end.

The indexing arrived with the MUX consolidation, which relaxed the
item[1] check in the same hunk.  The value MUX handler it deleted used
>= there, and the snd_soc_put_enum_double() in soc-ops.c still does.

Only adav80x pairs a value table with two shifts, and its second
channel looks accidental, but the control does report two values.
Writing three into it reads off the end of adav80x_mux_values.  The
core catches that only under CONFIG_SND_CTL_INPUT_VALIDATION, which
defaults off.

Fixes: 3727b4968453 ("ASoC: dapm: Consolidate MUXs and value MUXs")
Assisted-by: Claude:claude-opus-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/soc/soc-dapm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index c98e917cc911..06b85313af12 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -3614,7 +3614,7 @@ int snd_soc_dapm_put_enum_double(struct snd_kcontrol *kcontrol,
 	val = snd_soc_enum_item_to_val(e, item[0]) << e->shift_l;
 	mask = e->mask << e->shift_l;
 	if (e->shift_l != e->shift_r) {
-		if (item[1] > e->items)
+		if (item[1] >= e->items)
 			return -EINVAL;
 		val |= snd_soc_enum_item_to_val(e, item[1]) << e->shift_r;
 		mask |= e->mask << e->shift_r;
-- 
2.43.0

