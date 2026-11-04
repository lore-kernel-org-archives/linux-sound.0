Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793807579;
	b=RyIy8IckdQt0SOfzCUcTCY8RwTbVDxr684jh5gR1aWni173RgEC+qbx9vIVT42ZSbJwR
	 i6v0e1xWjjFt+LHq+JRssRXgubD0bJRFt6dpFHBJnJZztP2/3KRty7DP1e1JkUZuZkmrw
	 iFyOdqZuEeFn6AQaZfzlnPDR2OH1kne6CfTysJTAui3zVUdKTgFpvy2fKeKlPyCaqXQEB
	 GIofdaJETNXNCssMiKGSLxgl/rPv3mRvKbeIox14aWSpjBj0BKARAjkJhquTOge0HGPYR
	 ToXOrGUjgaDWX6NmtA3kaGwEPwEL/xozMXldbuQrcPuSHwHbTMCgy3M9aZIku2NJiYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793807579;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=aEz5u1FzRvX/+rTDwpChUXMWqF4rHv3r2ZlzMlRlkZQ=;
	b=F/O/RmmXLuyv/SmfytZ5iMTwOBGc0sgmpk9V8ffvKFFJ+lDqPUIx2hCbD6kDa5uP1r+A
	 nua9Y6YqZKxaqWYYT4BG157mhMiK1//2fp7o8tYXM3t5m+nmh6w1PDitIj9qiPNfOEvW6
	 MPyWze4Cw+gDPapk/eQr7SBhVxlTkyRJqwcu+OOU/i142LJxSilTe1hTlLIcz8+sCNoiA
	 aDXvLlPy3D99+Rte1KrZQKrlGhSJkKB7QInlSn8SdR44Wj7RBTHOZ0/SuovK6qa9uV+8c
	 7cpwAheHf7j5WZEkV0OG6J5J6WRBW5ZD5ujt6ZAAF07jhY00RycX9hfo4u7A//EARSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CtcVyquT;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98140606A328
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 15:52:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98140606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CtcVyquT
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36cad25b8b0so1241046eec.1
        for <linux-sound@vger.kernel.org>; Wed, 04 Nov 2026 07:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793807578; x=1794412378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aEz5u1FzRvX/+rTDwpChUXMWqF4rHv3r2ZlzMlRlkZQ=;
        b=CtcVyquTr6+N4YxeNE1icUlUuYpEut71zh0KAiG08MvRYHh/zx7H0AQyGO3ldl9y2L
         sjMk39AQ6lmdSlyRTof8FI/kdkmNkcssQ4e18jjMK/K2JwZh9amyOUfPoh6qyJXXnT1M
         x9SjMbl3R/aWlP3hJZNzx6J6yEe0qXgk2AfYBvYSY8F2pZntcARNWOXNDRZu5VjCP560
         HsR9SsDo3cxyd2W7srhAU11cYP9M1DU6LeA/qRSbW78sq09Ygy9P8JpyVwIYr8ce58Au
         G3bXbagR8ons26Yovp7je3Rsfhsp84q2aBFrxRsJ1rcl8kblC9E15lrTk2pRFB2YhtXN
         z9aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793807578; x=1794412378;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aEz5u1FzRvX/+rTDwpChUXMWqF4rHv3r2ZlzMlRlkZQ=;
        b=nD0J9ofgkewFs46tNCou9A6uYQlAxJfoDiXyn/0ETXWL5jAo9Iw9WGF9x+xL/RS7Hx
         2ZsTbwxWwRazd8pd7gv5rBEin0t6OnQJT6mB9KEcdT8qitsMJf2349UUMMF+On8Lkshp
         axvdvCqzqQOnsBvddTTkPC/N2wFoKYQWrM1Rr0LcMawmD5p5FJqS+tdKYxJudf+ftpx0
         tDUIcDVAIv29z+z3MzLp18MPGtQFYjiBubwkiIyee1iF34slgxk4npODZpTdkEf1sOFs
         rIKzaiOobz9KLCrtCPmhstPIkCRNCy7dMMAm5VT968wYoYZBxbtqOwirI9yL/dJplpHj
         DlPg==
X-Gm-Message-State: APuU4Z9qixS4oTb3ur+RhFsMgWnh3Tx8zSGmFu0PmFKOWPFeTBOS0XIM
	uCqLOf/E0oaLTmIBhdVhTNL2gIUDtW3RqwoKw8wwLIAmnZQAigBhXf3W
X-Gm-Gg: AYBFou1UcpdEb5RYaXY1oA/ZaZTEi7CtribB4u2QGZyjJ+uzU1FbGT0XX0ZOw0ccRcY
	tYDE0fXC1C2oo3FqxLKY6VrLz6VY9OKuM3DiG4mjQZx+49cEQflfRUNWI5+0iYzOMx94Qk6QFAx
	d7Eb4J3ox10ZbCp6I3aSv8WqoM2xGQ+J475GamVkKOW6YkmFOkyQbEjrJS8sEP7wZNa2Ef5H1UX
	BZ5NsS9Proko+ZN/r6JU8Zu8ddJKoZz0LbxXCWNLdIag+HuHtxWx4nMq2uvWsjkMVFHN30fgIkA
	s37oitDQcxAp+b0uNH9090+CZMCXAEj5zSH0UgFEmvzU4GSZEiT1epTCQcfh2xsaAslMY7SCSQU
	hdxdRRLC9Q5zMm2mbUV/fDlxPm0trCiH9tEE6YJNfpqDlkdknABxLj3thXLow2aCwj9uIHK8D4j
	6SOXvLKxkN0NzSybHcuqLw8CPRzpGLOVVlxwqEyDjFVRjT7lj8KRT8FQFtegAYha60cGTfzCNkA
	bGHyPIjBb53eEWpcMWaUoNY8NAhh/9WFjzmphKlR/kgab8TBH2rlGrV8AirJ2vcEuks8iEcMIDV
	7Qu912bzRxegCPltUcZS/LGjEyGyss3JFb3BQ9uhMd8ETxJjsOY=
X-Received: by 2002:a05:7301:786:b0:36c:9fa4:dc5b with SMTP id 5a478bee46e88-36c9fa51d40mr4982176eec.23.1793807577494;
        Wed, 04 Nov 2026 07:52:57 -0800 (PST)
Received: from localhost.localdomain ([103.178.205.89])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3966daasm11038595eec.23.2026.11.04.07.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:52:57 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH] ALSA: core: Validate device type for dynamic minors
Date: Wed,  4 Nov 2026 15:52:05 +0000
Message-ID: <20261104155205.3378-1-sreekuttan2156239@gmail.com>
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

Reject unsupported device types when allocating dynamic minors.

This prevents invalid device types from being registered and
avoids unnecessarily consuming available minor numbers.

Return -EINVAL for unsupported device types.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 sound/core/sound.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/core/sound.c b/sound/core/sound.c
index 24f40763a20c..32637c40df05 100644
--- a/sound/core/sound.c
+++ b/sound/core/sound.c
@@ -184,6 +184,18 @@ static int snd_find_free_minor(int type, struct snd_card *card, int dev)
 	if (type == SNDRV_DEVICE_TYPE_TIMER)
 		return SNDRV_MINOR_TIMER;
 
+	switch (type) {
+	case SNDRV_DEVICE_TYPE_CONTROL:
+	case SNDRV_DEVICE_TYPE_HWDEP:
+	case SNDRV_DEVICE_TYPE_RAWMIDI:
+	case SNDRV_DEVICE_TYPE_PCM_PLAYBACK:
+	case SNDRV_DEVICE_TYPE_PCM_CAPTURE:
+	case SNDRV_DEVICE_TYPE_COMPRESS:
+		break;
+	default:
+		return -EINVAL;
+	}
+
 	for (minor = 0; minor < ARRAY_SIZE(snd_minors); ++minor) {
 		/* skip static minors still used for module auto loading */
 		if (SNDRV_MINOR_DEVICE(minor) == SNDRV_MINOR_CONTROL)
-- 
2.55.0

