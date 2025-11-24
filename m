Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4057836D516
	for <linux-sound@vger.kernel.org>; Mon, 24 Nov 2025 06:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763967032; cv=none; b=WO5oXq8tLJXSDjykGOBA53ORJJAfSEgbCS7bITPRx38aj3rnbs3tYyEtpkZQX7/Q2KSiusPoAqPxgDyaJ2kPLVjuXHtU7LaJqVsRxENAfIX1t/nyUEr4NmX+3f9MzAck1SeFB0N7GKyhUqS5PqAxUb5tVdLldMA2NqHIu4PPs3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763967032; c=relaxed/simple;
	bh=y+w5e6c2MgXTXncp0nIxoBYjb2mIvHERbbgy2ayAB34=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aEc5ZfesxF7gkaBy+ty8M33bZfc0qJjlheoJnbqX1gki79q8mtZKe6pTPNS3CQ1Hq8k27yPa7M+x56167K4YJfqa60QvAXCyJwEynVsMe8FGYisJu8XLhxCFj2SIRagjeXq4VML2Np5VwDF5Vcx+L3HqDkfORPw9rsepfQLpC1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=Ns6/PiE5; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="Ns6/PiE5"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8b1bfd4b3deso324586985a.2
        for <linux-sound@vger.kernel.org>; Sun, 23 Nov 2025 22:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1763967030; x=1764571830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cNc5rm4ZQfDfDh2+JFNbnMFh6W80bhd4YB2ckWPITEU=;
        b=Ns6/PiE5fSmX10BmZgz26GEQURqpEjbaikkZbHi5uoxKCMvUHcFbCWDXRFN3xcKteZ
         SZNAybJImA0sk5CJhWRpqtVSZVHh+HmSwLLamULxkk9gRpqUPuO6WdB317whWVrm1+rO
         +yZm7R5RRh7ee8dmjAG0rrXsm1xIh1owbseHPPuniLfVyhsnRX/DvTkfOky0vZD30Skl
         SxFyMtNFrEen0PT78Ac8kh0+YUrLKJvDcu5lUeJ5VjYgG/xvh9G1UCBDkN9xXq7YUmqu
         T2eXvdf0ChAzRyLRakIHkkLdDnug9DhiV0H/nJe/5j850syOS8y6iJZxeC3NfACi8ZYl
         6ttw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763967030; x=1764571830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cNc5rm4ZQfDfDh2+JFNbnMFh6W80bhd4YB2ckWPITEU=;
        b=fGs8zAIV5HDP3f9FZR7z6DnWX9LnQUPh84CWtdGaJhdQCZ1zeGOhbMeU7/XGGDR6md
         rHuvu0v0Q1CKHKpI0O+a8Ybpwwc7leuxhdIG6gZCBfodyXqRB4OByA4lgW+ghnM3mR4K
         e49CjyfxCcJUMG1l5hZ3jGh7wFMpq0nyMIMe0MbIRKBzn413ksYpNgP6fWaEqDrDfEIB
         jFvBV07vqpnHQz1NZR9HRceVnQ+rvSc5qhUdDN7dVkQF4ZHc/1qCdDOPxIFbavWv3pTB
         BHlUk+OR0OP2iI93/vLHy/oUX0K+Lkw30Ih25hFVKANQXG4Xpu04DCy2YqOxtz4HBCWW
         3mwQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9po58TG7MQPdtqd7VDkRzcP0Z2ECmFCz5kjfBOHyrLk7ZvZ0y+o8OQ3yCMMKy8V26cybsBfk0M0gvgg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5a5muBNmOlBtfnO6g106vqAcsBFde2YplfgBdomXwye6veq+S
	9BNpsU2App/NrdCl2xc88YZHQ5ALRbD7ht4+gmlQSHW5GvdlDumrFZNDVul2f60EIYI=
X-Gm-Gg: ASbGncsGmXqHkUBpu0AJoIaV7BK5QX66FjVGfxZPklVUz5oQmHTkXZZCPkMcn31uvS4
	YJzLsxJp8qJmI8jpngxG3/XWRp2vThV+uycV/gwqMhOc8ovOW8lJVrKQvk3RhVCSVs2AQCSkAUD
	lnFAVBFwOqsOwTdI+UYRY4ln0c4Mm2JJW6tehs3bROVB5jY8LjifnOAPLX0fc8D1ckx9a0n/2P9
	zxTaibzW9Hk2Nk2bI04yO6mxjwH7cNfCFfddAKv86bKXEXPKv+W4O0jDbZAKWwbnU6/dtkEBy0x
	N7AX4/h1x+LDirybJzcProPqSkmRjD9F55hHe14OWlpqgVl4ftusGd3BmVBj4lkQ5Jd7Bs9hFTs
	8kI10eOO6xlh5dL0CdMpdVtkKUahL6Z7fIHNRKBCUNeCYWgu94wwj706BtrraBp1oTGme3n0K6N
	smkG+9zCpWD/Y17+9GxF+aTD1tvyEfIYcmxkuJx2J8RTCT/6eqIfSI8eqMlAd04VWr2g==
X-Google-Smtp-Source: AGHT+IGU/FNHTOpS2yw+2Y59vhT9ZGPR417V7So6rHGQ64fdNxkG1gK7Ti5iS3OB77llaVwIvljXOg==
X-Received: by 2002:a05:620a:4549:b0:8a2:6690:2417 with SMTP id af79cd13be357-8b33d46b1e6mr1429722785a.67.1763967029957;
        Sun, 23 Nov 2025 22:50:29 -0800 (PST)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b3295db8b1sm889075185a.40.2025.11.23.22.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 22:50:28 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Cc: Jaroslav Kysela <perex@perex.cz>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-sound@vger.kernel.org (open list:QCOM AUDIO (ASoC) DRIVERS),
	Mark Brown <broonie@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 0/6] wcd938x/wcd939x fixes
Date: Mon, 24 Nov 2025 01:45:53 -0500
Message-ID: <20251124064850.15419-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes for two major issues I encountered
- pop/click
- not being able to enable both left/right channels

And a fix for an issue I noticed in the wsa codecs.

Jonathan Marek (6):
  ASoC: codecs: wsa884x: remove mute_unmute_on_trigger
  ASoC: codecs: wsa883x: remove mute_unmute_on_trigger
  ASoC: codecs: wcd939x: fix headphone pop/click sound
  ASoC: codecs: wcd938x: fix headphone pop/click sound
  ASoC: codecs: wcd939x: fix get_swr_port behavior
  ASoC: codecs: wcd938x: fix get_swr_port behavior

 sound/soc/codecs/wcd938x.c | 85 +++++++++++++++++------------------
 sound/soc/codecs/wcd938x.h |  1 -
 sound/soc/codecs/wcd939x.c | 92 ++++++++++++++++++--------------------
 sound/soc/codecs/wcd939x.h |  1 -
 sound/soc/codecs/wsa883x.c |  1 -
 sound/soc/codecs/wsa884x.c |  1 -
 6 files changed, 84 insertions(+), 97 deletions(-)

-- 
2.51.0

