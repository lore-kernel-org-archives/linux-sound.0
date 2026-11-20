Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795178806;
	b=nRu9ahqit5R0m5NyOFcJiHf7OUH+YQzTk+f8grKA+UC8tcGRbjErGk0rwjqx8a3UIKUT
	 a4Tzhvj5Gq2LGLJeFiMo50vGoQLvZHoqBal73Mx/xnudsjTrb2cp6iEpTtLytcCEnNQli
	 kmYKMK3AXXVKK44ZmS3RQAROi3tZEw9U9WxCnBLtZxCop5fmsu4SYLXrOWE6xRMacVDZb
	 iIpzEN+gcpqNWq00XUNz0xKY31gpheHKOuu0u/+vADSyhdu8ZjoKTEiRCzMrP7ZTOQPcs
	 2BGqSlImqfxUdqYO/xD89rA5hwOICIhEa5mQlMAokb+Ygtuzzo1TPQBce87Pbp0s0vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795178806;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cGH1JnI2N42c7qdI44e/87ummMnaVGLzf/yoQwalmeE=;
	b=P36pcK4MAPGiYYT1fL8S8oN08iAlO9tRNjakZyPKSwzeq4S6C4QVUEg3raftERMvVK7M
	 p0pjtzWikV5d5ho7HbCQ3RqaYqvtLCDnpqkfscVJncyCHkjxxd7AGgXxvHRRlfyFZ4e7Z
	 EG3sPVchsDqnQBe1U+/UfUkX7VgvqiL1DcyrnkqKpZK1r1UKSwXzOIayxFZZq9cC6W9go
	 tt8qerBoONQBzA+th1zRd44T8e/GIhxfFflXvYLNLGi7Y1mwzqdlHg0wDC+4KFMOFMbYB
	 dUQaCKZNRf1SzaV872NXaO0Ey2Gk0UcLUJJcsPiazVCbm5EIbSzNaQy8eVgEqocCEXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oCgZpz5R;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F729606A325
	for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 12:46:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F729606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oCgZpz5R
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-380c28f9e35so1831553eec.1
        for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 04:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795178805; x=1795783605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cGH1JnI2N42c7qdI44e/87ummMnaVGLzf/yoQwalmeE=;
        b=oCgZpz5R907eoM2HIsbQigiZeLGuNbt6gkNA+BEZ7g32B9Bt5tsdftKlf1fvB2QRaI
         AXyDaTJhXGV/+pW3oJLlhnC3BTKNZ5tez3R8jSib73+TZpT4GLIKibCGNpq1TJunIWEN
         0R579MvQBjeq6cksncn1k8wcf7svlPNPv21ANfBsfmTmKEE3B21j9N6k0P7myHsWceeL
         GVmIqprjo/6P8/78ddd59vzw8VCvLGJAMzpajAPz+nvcTZC5iaZbQU5YjsSepdcvi+Jg
         Js5Ao8DoYPzeBxQ9STn33728oaO30uhfcdRhEbC4m9JNCd6IOhpPBI0eJvGiZ53ufqP/
         PRbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795178805; x=1795783605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cGH1JnI2N42c7qdI44e/87ummMnaVGLzf/yoQwalmeE=;
        b=ZHwuuoDoQwI8nGLAZwHIZBhKP4bWlBPYlhOigE70ONgRV8wJ41iu/Ut1hshuVq7e0Y
         7BVUh/EGISpfy7bd4YMcYPcnQFtx9DHXcqsb0GHE2nR1mlYQw4PEc7uOwf1BSTbDQzwd
         QwYnbHn54UrtpIFVkLY1sgNDymI/lm7pJ8PNhHcWqwys5fm12jB9d0OYqTsA9XfeDQ2k
         WZh6B0dyHKf+bZ1UDXugg7WT7awyLkIPd1EkNbssMiYindkXwQtGvf716Or3Ku0wgj6J
         faglDEjeu4cpjryqwnBt/FQNMqvYnNTACCAVfLLiLlZzh4qve99l1oIjgItn1c/wotjK
         eDqg==
X-Forwarded-Encrypted: i=1; AL+hErHtFC1Z4eGD+Y/CbSnETTE42vmoLm6fqK8d9cdNPy+TAGei7hGDYgssCVKiUoOnGsHwlZwb85kis7HqRg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9zGd5HTiMYBRS/JXYueQgysTtxwi6P2NtgsePllllfrjE+UtvY
	aVmmdj8I4FbpWLWj5ko2jb4etHzi9G+gx8BFKs1Oc6Su218QYlNNoI6k
X-Gm-Gg: AZFdTZeaqHF2ZjiT35tXay7nspB8EmgFm2657b+tYy2jEcPu3lcwSu+c3sWE/6eEya5
	vYcyKBE6Nl/oJ7+9KyEm+EOF7vS2faWSX8QpznQq70lAPTAtg4+TkNXf/BN7xViEmn4gy41jSCs
	cIgl2Kyt+ZkpvNw0iM99T1tIu4lZ6Ouagp9sbkj1Moft71dBjUz6UThowQuNAf2fPANc4h3b0mY
	876/kxrHPJT7kfsG1pIT6zA3dbW7up6HYABdH+CqTRxP1lihhdheYl1lhjHriWWcyq9iuDq38bY
	bj9RG7D6aycYZauyfOx09C6ggHUtgq4udj3++0oCRUAhrbtGPhNur3Y4ZnoS+7Hv4R4wmWsB1vF
	n8qMXZ/nejiMThzn1IiCSdE4AHNrKqgCtXWIeigaoOyqyKxvEUv9vCB+t54zS2ylJBMiXcFqh+z
	ROqIPV/xXsGNN5Xh9rXXzqvwD3pRPEHV2VQvU7rZqAokGIay6Euj/g4a0HKXsWLc6MRFEQzLqX8
	O5uAV9KRkgjpCmZTGkALi/2eNORGBVWjnlPvhi0e7lRrnsSq+NAa9tN0yFBo6+kZH0ToRksuLTo
	tkmOT+mGfLMEshFv5C52ES2yS+YID+e0YWA+VVTEXwWN0Pil9GI=
X-Received: by 2002:a05:7301:182e:b0:386:1901:d994 with SMTP id 5a478bee46e88-3861901db11mr1238177eec.5.1795178805435;
        Fri, 20 Nov 2026 04:46:45 -0800 (PST)
Received: from localhost.localdomain ([103.179.231.88])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd46c5sm10150364eec.11.2026.11.20.04.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 04:46:45 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: perex@perex.cz,
	tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH] ALSA: pcm: Avoid reading beyond ELD monitor name
Date: Fri, 20 Nov 2026 12:46:07 +0000
Message-ID: <20261120124607.2799-1-sreekuttan2156239@gmail.com>
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

snd_parse_eld() checks that mnl bytes are available in the ELD
buffer, but passes mnl + 1 as the source size to strscpy().

When the monitor name is not NUL-terminated and the buffer ends
immediately after the mnl bytes, strscpy() may read beyond the
provided buffer.

Copy exactly mnl bytes and explicitly terminate the destination
to avoid accessing a byte beyond the validated input length.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 sound/core/pcm_drm_eld.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/core/pcm_drm_eld.c b/sound/core/pcm_drm_eld.c
index 1941ee520063..556e5a43710d 100644
--- a/sound/core/pcm_drm_eld.c
+++ b/sound/core/pcm_drm_eld.c
@@ -362,8 +362,10 @@ int snd_parse_eld(struct device *dev, struct snd_parsed_hdmi_eld *e,
 	} else if (ELD_FIXED_BYTES + mnl > size) {
 		dev_info(dev, "HDMI: out of range MNL %d\n", mnl);
 		goto out_fail;
-	} else
-		strscpy(e->monitor_name, buf + ELD_FIXED_BYTES, mnl + 1);
+	} else {
+		memcpy(e->monitor_name, buf + ELD_FIXED_BYTES, mnl);
+		e->monitor_name[mnl] = '\0';
+	}
 
 	for (i = 0; i < e->sad_count; i++) {
 		if (ELD_FIXED_BYTES + mnl + 3 * (i + 1) > size) {
-- 
2.55.0

