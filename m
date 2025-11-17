Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCF63161B5
	for <linux-sound@vger.kernel.org>; Mon, 17 Nov 2025 05:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763356643; cv=none; b=ivozxaRlgYmxHu3aBa3l9THIg+dXEer5dgAEJF6KImLcdTV35cAMvb4KRrOOgPh7c0ffOMivR12JfVNauahdi/TBOeAez0uLukYIImGv9cwls1A290kT2OVdO7obLZI/q8s0be94ZNDcs3IWlFOHYBwswvbgoqvlS0GNSrgwH9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763356643; c=relaxed/simple;
	bh=gINThNOrGLTjijqQqroDaSh2hFeE+34Wi4lNap0BlmE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fXc3N5Ab2FxRNFi4u47/dF1x7X6lS312Rt/usbxuSVoFC6t1lK1LnA84t2U8W++2nUieYdkxUTr+YgJUYxBtPNBhSRHX5GbhvpK6EMIJ0BDncpRWSwWPPlgk3ioP2OrjbIPRgNGmTmngUqi9QCpqY+SM+3/8IWoZpf4rnXqZ5AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=XeLZBXZN; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="XeLZBXZN"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8b1b8264c86so404654685a.1
        for <linux-sound@vger.kernel.org>; Sun, 16 Nov 2025 21:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1763356641; x=1763961441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UxTOaSRWk1Y8Lv8b37kvOyS3gwv5qYDX15lhyQsDmUs=;
        b=XeLZBXZNU1UVIGzM7q1IjKiYQzMHrj8XQG4XSUCX7YBkg7IDvsRCJDX3FM58NwJml+
         9Atd2Kp3JXWQGuRCQV2SCo8rxiFqE0R7QKksE9zc6KatEq/tmsE/PDUjpP1zIKBwUDzf
         wY3eCe1hW5uM0XRtbCcVXQTV59dETiUlFtGWtAFcCguf4p5FrnYNRddOYdxjEqcd2sZk
         4qf9rEKKJHCjzRz/l7dMd4W927E4jfL2RhawRV7ynUZ2d+c2NjjIvH0Y9syS20QsuamF
         6rnTAwfI3ctQYlyfEC7C05z3JGzr/EMmGjplD0evcQek0vnpXv4WZw7j6ZoCxW8eVz1f
         tTDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763356641; x=1763961441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UxTOaSRWk1Y8Lv8b37kvOyS3gwv5qYDX15lhyQsDmUs=;
        b=U9R+8IaGwYM+GJwUjF9ayVG5h9KHMHQNdV+vod4yZXNY6yHb55lEYFo0iZ8gUVj+uB
         oaF3WX6DuKrSNQAmi+zFuzjhvcSUgXLZ5GNneAEAzUxP9iQ6UcHLWQ3XbfrCCv3BUPcS
         UyUfUUvL+0RdlB+0PmV2KpXBuQ1VZ8lz8mpu+xxguIu4+pwxLr9rrO8GR/tu92Qyb+SZ
         3GGCzG7xIk0xkBTOKD8Q6LmrqxHpoBmA7SDOYgcOULx5SEfPtU29QIHs/sazBRV/Enjy
         Dy4NdaukF4ouy7HBz+kK3xX1fzjaVjE++V6PWK1KKAOJZWE/e+i1s0gPg20mBgdB29fy
         IRzQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3EPvCnS6z71rT9xqaO1Rw98n13FEVH38+yreCeEXOTepLvosiyOuQty0UaaGWL8ISWGY+Lm9s2r7KXw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWF6E6ul1BjHIpEneIpuOvjp7IiVBTg1aS8+knDPDJBYkVYjav
	E50rsrRJ8CpBm8lspTQIsDhGh18hF8YPYmkmnqv6093lyqB5id3GCg6D8oJmJc9KU9t2B2gdumy
	LRY8R
X-Gm-Gg: ASbGncuWA6OMvy7olK7swOPB6YeNFBsQiohvc+PWv01pTmp01cZ7CUkh6Uk4jeAmj7D
	ijSqSkzla0G5RkB3IIiiDXpX57o5XpQlNBIG2eZEaiaK5vknm/2MbvromEPU+GTalfYdFWYzrU7
	+vHIpHjva6sbI7MyhZw19Rwe5uL+e+oGUCYY50FCe4IQhKDmacd0CRFelekVrxsw3ciAGx6vGoE
	wPZSmAtwXArPz1EzLB3y/t42lLATMkWc8yhid9N2e9VnHVYHKhLDGYhGQ1K8eq/+1YB3b1/5wGJ
	Npr9TfqrMOgRNhFpQ9/NZa1iccRfbCDRgjlcgh2oCubkvzPGXy1eY3PtZRi//CXm8NWcaA0F83v
	34zQLOLL69SRNqv+Yf0HDVroKGSnYw2ZTOBKgxFmLvuj5rOesM5r3i+bCojzb5WfQUdRaCrRSug
	9L5er0zyVUrhgwmgP9Xt/wNl10uuYLqRCuKqsHbGb/E8PAqW2PMm9S07WorZC37BDDuw==
X-Google-Smtp-Source: AGHT+IEHbZL8UncU8JrDK72OvvsWmuYibVs1BeBP7ngCOvXwZMa/qwBfe1aUda5Ed6xs2gFJfjtLTw==
X-Received: by 2002:a05:620a:25ce:b0:8b2:71bb:2b85 with SMTP id af79cd13be357-8b2c3144b35mr1316180785a.4.1763356641023;
        Sun, 16 Nov 2025 21:17:21 -0800 (PST)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b2aef2f936sm906417185a.29.2025.11.16.21.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 21:17:20 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org (open list:QCOM AUDIO (ASoC) DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 8/9] ASoC: codecs: lpass-wsa-macro: remove unused WSA_MACRO_RX_MIX enum
Date: Mon, 17 Nov 2025 00:15:20 -0500
Message-ID: <20251117051523.16462-8-jonathan@marek.ca>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251117051523.16462-1-jonathan@marek.ca>
References: <20251117051523.16462-1-jonathan@marek.ca>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Minor cleanup.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 sound/soc/codecs/lpass-wsa-macro.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index f02153108c275..694ee3ceda986 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -297,8 +297,7 @@ enum {
 enum {
 	WSA_MACRO_RX0 = 0,
 	WSA_MACRO_RX1,
-	WSA_MACRO_RX_MIX,
-	WSA_MACRO_RX_MIX0 = WSA_MACRO_RX_MIX,
+	WSA_MACRO_RX_MIX0,
 	WSA_MACRO_RX_MIX1,
 	WSA_MACRO_RX4,
 	WSA_MACRO_RX5,
-- 
2.51.0

