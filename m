Received: from mx4.sberdevices.ru (mx4.sberdevices.ru [152.89.196.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC75238F946;
	Tue, 20 Jan 2026 16:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=152.89.196.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768926156; cv=none; b=m37QWA++SPIJ1mFGDxPhA/ule6yvtQn6RKM3P/GjfJP7dmDH60xE0l9DlSZqXwSVGJGDbanqUBHdQgpdgZafXpjA+GJINUua5zYs3d2IQHHnRxs2ZPYdP+VBCmvRbRi5XOSj9JFWlga1IBtp/oplrkWOWCNPPIuEYXhSQwV9Wis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768926156; c=relaxed/simple;
	bh=HImc6pzIUVVKPnaTz3XrtyKo5PBw+ZfGfLEGX6137gY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IbRRfpFYyQg6YjTGOpFeaG3AbPsZT09ZNinSQamESAxd+Ufe6Qreb0KEr6hlOagn7xng1T5B0zRhI33HE5WnKQLDwWDA0Vc4U/qVZnwSeK2Y8ZOQSG87kvotINFskJIKzBKqwAhZ8iBcucP8hVz2MhuFmtzowmB3c2viILmryok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com; spf=pass smtp.mailfrom=sberdevices.ru; dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b=LAYH4BrM; arc=none smtp.client-ip=152.89.196.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sberdevices.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="LAYH4BrM"
Received: from p-antispam-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx4.sberdevices.ru (Postfix) with ESMTP id 7F4D340019;
	Tue, 20 Jan 2026 19:12:14 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx4.sberdevices.ru 7F4D340019
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=post; t=1768925534;
	bh=T9vPFd32EVtz2s2FE2MpABSyI8EhiGP6zW1/MnmPmms=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=LAYH4BrMzQrOBgyEezdDd4z8rAklA4QoweCQbYEYyWaFdwAgGmXtvC+dZGRoy2wJe
	 mT3S3j5OT+5RJYR+Re6o3btqHzSu6xCxbAhzSVAt93pjRFHBLQtXKRSVhPyfOHEAZj
	 BbnHH5XiLMjVtdVf/KZJqeeNayUXlfpIqgvQD7lGo1317wC3okzD/BeSQ2LdF47Iia
	 Ywl2SQBACLhDZ5mbs/TkkXwv6nGThvlOQ87L2ls8VWT2roOx1714CLhcnEmZDONfu/
	 GKXVsQeRRGuR5tsTdDNb2fwgsxQq4MeEUsivNgJR7puq9zgU/YAG9WZ+1BoCNMbGR3
	 waXb/Q+fcdkaQ==
Received: from smtp.sberdevices.ru (p-exch-cas-s-m1.sberdevices.ru [172.16.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "sberdevices.ru", Issuer "R12" (verified OK))
	by mx4.sberdevices.ru (Postfix) with ESMTPS;
	Tue, 20 Jan 2026 19:12:12 +0300 (MSK)
From: Ilias Izmaylov <ikizmaylov@salutedevices.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Igor Prusov
	<ivprusov@salutedevices.com>, Chen Ni <nichen@iscas.ac.cn>
CC: <kernel@salutedevices.com>, Ilias Izmaylov <ikizmaylov@salutedevices.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<rulkc@linuxtesting.org>
Subject: [PATCH v1 0/2] Fix snd_soc_component_update_bits return handling
Date: Tue, 20 Jan 2026 19:11:56 +0300
Message-ID: <20260120161200.3590305-1-ikizmaylov@salutedevices.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: p-exch-cas-a-m2.sberdevices.ru (172.24.201.210) To
 p-exch-cas-s-m1.sberdevices.ru (172.16.210.2)
X-KSMG-AntiPhishing: NotDetected
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Envelope-From: ikizmaylov@sberdevices.ru
X-KSMG-AntiSpam-Info: LuaCore: 86 0.3.86 47cb2a3d3f5c7e795bff2d0998e8c196722872ab, {Tracking_smtp_not_equal_from}, {Tracking_from_domain_doesnt_match_to}, smtp.sberdevices.ru:5.0.1,7.1.1;sberdevices.ru:5.0.1,7.1.1;salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, {Tracking_white_helo}, FromAlignment: n
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiSpam-Lua-Profiles: 199675 [Jan 20 2026]
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Version: 6.1.1.20
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.1.8310, bases: 2026/01/20 15:01:00 #28134254
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-LinksScanning: NotDetected
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 5

This patchset fixes the way that snd_soc_component_update_bits
function's return values are handled by codecs ntp8918 and ntp8835.

Currently the return value "0" is considered erroneous when in fact it
isn't and what would correctly indicate an error is a negative return
value.

Ilias Izmaylov (2):
  ASoC: codecs: ntp8918: fix snd_soc_component_update_bits handling
  ASoC: codecs: ntp8835: fix snd_soc_component_update_bits handling

 sound/soc/codecs/ntp8835.c | 17 ++++++++++++-----
 sound/soc/codecs/ntp8918.c | 17 ++++++++++++-----
 2 files changed, 24 insertions(+), 10 deletions(-)

-- 
2.47.3

