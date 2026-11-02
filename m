Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793630143;
	b=HjQGZ0pylLc1gkj2XtbfbtSR02ocFAjDG2neyIKndwQuHdMUH8dThkZlK217bO2i4jFm
	 pJOTVNTgjrLpXVoa9lgz9h9KarcisJYFE0pZQAgacrGk0HYJjP1NuhpdxqbJur0xpsjLB
	 27dGXga3OAIsFM9nORuf/SaRfjwT+HA0w1UyhCS/U1FFpAWkr9xZHEqcCpn6rOcakaAj4
	 t3idkPLPVBd4bGan98h+aYhnoGp5ZfEFjWV/32cnj4CGES04HsFl0KCL94PWuXsKmDjqj
	 8B1PFXcPqcVemS3lg+3jk4H93w1Q3kUx23/mHZmQTvlHltyylN1tHtdxZPznK3UiIsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793630143;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PQWcuimkt51bqENNt7X0xmz4uvJH/+F/iqbTS3hh2nU=;
	b=tZfOScin+mBA7DjBC4v8oYv56OY8Wg6RwWcAAb7UTaSG/Vfa+IXPvO3ugM5aigZJ1q3m
	 ilPXZAc8YWMULavuaGpg1dNxPLKsfdXEpfWazKvG92ev1qN2Kyid0QVXLi2zgapOYfzW1
	 OrGJmYE/uKjaH2KsJ2C71mdpuBUFpL8lF2WoAUzqIDBbLGa7rWZOI0RLvHCVBwiLeaF1C
	 GPF+Q/5N5XvjY7MFrlBC4W75E7WbMmonoKJ6V4yVALj4SkHVPhZW8kjlF+3I2JH+8gkX8
	 6ZU1eN3JARWKSTvzqj7+EqcV2dJoP2fSznAuQw1Hhb9kLYcLWbn0zX9xDoLO0/MIFpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yVt4hFTN;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CCC606D80F
	for <linux-sound@vger.kernel.org>; Mon,  2 Nov 2026 14:35:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0CCC606D80F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yVt4hFTN
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-15dd124bbe7so3984089c88.1
        for <linux-sound@vger.kernel.org>; Mon, 02 Nov 2026 06:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793630142; x=1794234942; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PQWcuimkt51bqENNt7X0xmz4uvJH/+F/iqbTS3hh2nU=;
        b=yVt4hFTNkBUmNE5EZfmnYBGV5CqUr+QR92A+7vdZRH9xtgCW/Prq8BpXjLn9lkHFHC
         ubtq8ac0BNfwEnq2gMQJSydeFGN5Zk4YgVINwXOWSc5hb4AinmQ+F/IeOtcIz+U5bKKx
         5LjmszP6yOqK91DhGvq/XXJGhJw5+/T9FXBRXrA+a+HwN/6FjjNXEG5yyfmiQJv8Yk56
         w36MUdQV/E2uLt7tO5KVrvdkK900RG75ygS1FulRMAww6MEjX/W5xq03idB6Ig6xGZbD
         Wdyik2SA5LLSfgWc5kvtO4CcSNP1yP7dZYVckcdowGU97zuykbAQgSkdD3iCVtKGWuCj
         kGZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793630142; x=1794234942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PQWcuimkt51bqENNt7X0xmz4uvJH/+F/iqbTS3hh2nU=;
        b=CqYEV7Mk9WCHjk6oN3AzcmAH/9HHGq0js4wwkr9lkVm1Rk48zOKeL6IJft28VWf1+j
         ShwAO9icWQI0VZTdmlDGwrMozP1baFGT+rzAHRva/zdDdMYrOsODmKN9NqYL5aMOUCvF
         nccv0+x/aqrW5msszbEKrbayRRzWH9wY5W9fPkxS/F1eOidMNFE1lzvqcaKGZalnZ+Pj
         xqrkNxZRgpLFFgA28pWwO5R9YGwO2k0felFLB9StKlHkimkj1EdLVch723MTn/K2covh
         w3GImjtKuN9+XvfCBs7UTecHRIgOJhhwkdAO0DqISOykVXGOFSj5+H5q1qGsLSHh/phC
         4qNg==
X-Forwarded-Encrypted: i=1; AKwUvBwnGARHth30Js4BqfDkGqIsV+E4TsgppitvaZt3lyqTaFeke8xDyS4z4/uCrK7hMtr0S6OGZFO8wFa46g==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2wWee6cMXH/1s0sed90EZYZvB/zzoNnL81FrHjoGCPqNLwzzz
	ZlU8wwrqrwaDDftfz7yRBECC/aq9S1o6jrofMMGcrf5YS3zb3dvMGjtg
X-Gm-Gg: AYBFou0AjUJb42WZdPI0DoC86zxnNGOWZX8/VBzUMUdKuTivRvnlfJUZZtf5GNUj2Qt
	LDBZxuixPtMUo8jSMnNSTOqzzRo510H+m4qs6S96XCiYsP6f4xbJNVTbl8ZYhNmHkok/rb8fu7P
	4zt/mgml5YwzJPatTMELA4NSBT8F8bTveoREb1+OjjXOL8JI2taT61cwAi1fabIHeCkBhcnAqAB
	UdyMV++Vq1HClNhyuk3NccEey8+CbPQBuvI+drhoqSl/s9CH8uvBJn9GmOLtjkAMTweU3uzLBbG
	9h+7FmhDCKfHRGvDCMrNgnRNyD1wI3ZQdYwF3SizqXH5WJwpm++9Kt5jQPidO1an8fMW4nOaoyS
	hbJB8+MeQfS2uvMwPOKW9knEbUm90vW83zIBuCCyHNgVqzTAvgHLTzbDGjnIDdhoIaEiard9A+V
	U35COwX2ZIOqroDeuYqTuCuWDLBQQXz/Vng3xkW/iKFnA+4yHf3eJ1w/+7kXCfUXeU2ysAVSpno
	U+xxHCxSCL322fnKznb9k/TkkoYZ2mZE/sUmz/3pLq8bjJJyLpv242ExR5uamI340d4f0DdOS7p
	cvqnymBYQq7Q8ivkwERj0owfqDo05HJoihLoUC7F44fexs141Uc=
X-Received: by 2002:a05:7022:f106:b0:14d:baf5:c419 with SMTP id a92af1059eb24-1ac55b51d6dmr14535952c88.6.1793630141807;
        Mon, 02 Nov 2026 06:35:41 -0800 (PST)
Received: from localhost.localdomain ([103.178.205.93])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1aed79b3dfcsm34385361c88.12.2026.11.02.06.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:35:41 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: rosenp@gmail.com,
	cezary.rojewski@intel.com,
	tim.bird@sony.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH] ALSA: pcm: Fix source frame count calculation
Date: Mon,  2 Nov 2026 14:34:57 +0000
Message-ID: <20261102143457.3438-1-sreekuttan2156239@gmail.com>
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

Pass the updated frame count to the "src_frames()" callback.

When the next plugin handles fewer frames than requested, use the
actual frame count instead of the original requested count.

This ensures the correct number of source frames is calculated.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 sound/core/oss/pcm_plugin.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/oss/pcm_plugin.c b/sound/core/oss/pcm_plugin.c
index acf5ca663ba8..3de713779993 100644
--- a/sound/core/oss/pcm_plugin.c
+++ b/sound/core/oss/pcm_plugin.c
@@ -604,7 +604,7 @@ snd_pcm_sframes_t snd_pcm_plug_write_transfer(struct snd_pcm_substream *plug, st
 			if (err != frames1) {
 				frames = err;
 				if (plugin->src_frames) {
-					frames = plugin->src_frames(plugin, frames1);
+					frames = plugin->src_frames(plugin, err);
 					if (frames <= 0)
 						return frames;
 				}
-- 
2.55.0

