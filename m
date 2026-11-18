Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.250.56.165
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795002344;
	b=WUaMUbI9qi1NoDPCG9lnaQE76LijfJIji5Q45Mu4W8INbmoUOlSldYlmCur9Rc4WtJAU
	 S/h5bFvyBMbNDQ/QMhA3PckHysLn9foAXXsAZ109CVjU0rKnv7VFpz2A4ebhKsyMXQYmv
	 NixhQ3S2lrFvsaOGpMyRNA+L5ZfDXdS8kqEJHgGEHgN9pnnfUj1xfniU9nSQTgS9LvgbM
	 b7jhIKEacNkT5nCEXpYbWGt+F4YhVdP2E+ek0wVYSeQ9Jmzhb2Y4JlpNgYBZ3ULOlUXqi
	 Q/yu6onJRxVFSrygiAbaSwPRaHYnv49ihn5LRW0dbFZrfSmdOZ8vQL8gfTg0to9TaBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795002344;
	h=DMARC-Filter:Received:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Hvj9V4hcwlXC8A/KqGGm0W24l8SneVc7cqjgL854dAA=;
	b=Is0KgdkTN6oQDjgewtFw1BCnOLO0/oAxDo6DhYTxINCKD4HQRq9CU88lW8uhyb5WXf1Y
	 1PvKBMfjsaOV6Qo0j9yOLG+1h2HCxp+kehPf1TZpqeClODjmMXQ7RxvflQ1XUJV79JyLf
	 QtIEgkg5Y8ybCd4/le2aUnDQkgpcoj65kktMcqJ7Hh6MHRIq/ZXNRWdKwJdfqvqrfDuAV
	 ASFn6o5tLGcIk9bjQtXpANs0o/JaLovE3hinb9wZy1X6hnSVHvPtdFqIOjCbRQHUwwq0E
	 JfQhGBsVz1WWO5S/vPdXsGhnwCSCKgmt+fNW9tLKP/dc1TYDwILFKHl2cd78Q+MP1JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideco.ru;
	spf=pass smtp.mailfrom=ideco.ru;
	dkim=pass header.d=ideco.ru header.i=@ideco.ru header.a=rsa-sha256 header.s=ics header.b=PIw959cX;
	arc=none smtp.remote-ip=51.250.56.165
Received: from smtp.ideco.ru (smtp.ideco.ru [51.250.56.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EAC260A2633;
	Wed, 18 Nov 2026 11:45:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EAC260A2633
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ideco.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideco.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ideco.ru header.i=@ideco.ru header.a=rsa-sha256 header.s=ics header.b=PIw959cX
Received: from [169.254.254.254] (localhost [127.0.0.1])
	by smtp.ideco.ru (Postfix) with ESMTP id D92E626BC2;
	Wed, 18 Nov 2026 16:45:41 +0500 (+05)
Received: from laptop-ak.home (unknown [5.189.116.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.ideco.ru (Postfix) with ESMTPSA id A7FF126BC0;
	Wed, 18 Nov 2026 16:45:38 +0500 (+05)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.ideco.ru A7FF126BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ideco.ru; s=ics;
	t=1795002340; bh=Hvj9V4hcwlXC8A/KqGGm0W24l8SneVc7cqjgL854dAA=;
	h=From:To:Cc:Subject:Date;
	b=PIw959cXflA7sg1mUMjgMVJm+8NZLo5Nl20SUJxqd0VYF10QApLhjh2ARt77EPvZs
	 kipAqD57cnqWTCP9TOACxJunqI5DyWtFqJX1HV8wnwY5LQi2nF5MekbtN324+9tV+u
	 NqptM/fI3/hLjQciAphGAe7zWMVOTOH0rXPlMr9Nq9hRfw9iv4uOIB54eIg0sLQhVs
	 Hla+8fgVXmK7UllfjEbel1P9QMDUE+5bbVuUJQbm4J7zd0tqCAi0CJprXc1xG8yau5
	 XoQZbNgit05KVjg/DHmIiWmrhhR3HF7h3FFTPO/uIF/c4ly68OCCVKUrmfQKubxjpl
	 B1NTCoAiBXl0A==
From: Andrey Karelin <a.karelin@ideco.ru>
To: Srinivas Kandagatla <srini@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: Andrey Karelin <a.karelin@ideco.ru>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH RESEND 0/2] ASoC: codecs: propagate sdw_write() errors from bus_config callbacks
Date: Wed, 18 Nov 2026 16:45:07 +0500
Message-ID: <20261118114521.203207-1-a.karelin@ideco.ru>
X-Mailer: git-send-email 2.56.1
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

wsa881x_bus_config() and wcd_bus_config() (shared by the WCD938x and
WCD939x SoundWire drivers) program the clock divider for the next bank
with sdw_write() but ignore its result and always return 0, so a failed
write is never reported to sdw_notify_config(). The other SoundWire
codec drivers that implement bus_config already return the error.

Both patches simply return the result of sdw_write().

Resending the series unchanged, only rebased onto current mainline. The
original posting got no response, probably because it went out
right before the v7.4 merge window:
https://lore.kernel.org/all/20261016143341.417876-1-a.karelin@ideco.ru/

Andrey Karelin (2):
  ASoC: codecs: wsa881x: propagate sdw_write() error from bus_config
  ASoC: codecs: wcd-common: propagate sdw_write() error from bus_config

 sound/soc/codecs/wcd-common.c | 4 +---
 sound/soc/codecs/wsa881x.c    | 6 ++----
 2 files changed, 3 insertions(+), 7 deletions(-)


base-commit: 20eef29b7c8465ac98d7dd6d6f2ac07a8d8056ca
-- 
2.56.1


