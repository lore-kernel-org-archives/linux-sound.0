Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFD6313E24
	for <linux-sound@vger.kernel.org>; Wed, 26 Nov 2025 09:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.48.224.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764149231; cv=none; b=uQ/nrnTMdmIQQddoE8JjNaiw5dpK2/BohY4qHf4uC0ntwujJFRteuedfwPmCePPmKxdNYRYC7oPRfbDL0Bv2q2GxeUHaR/jvX5aZNeW346/pJ4r+PkKxYfL4Tky99IsLHStN2wKGoLrHHH1+MwJIKnt5JlDfIC7N7scbbl2U4uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764149231; c=relaxed/simple;
	bh=QUylbCBRdAtFSE6j74rVLpClvQWfEoeq2wN0tJgbzZk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mxKqFambJMMLxapPaFd+oHzn4lOptr7C1lgsIDoH9IboVdr/g32ZVPJWukS+dE2YHxgUlhErepqStxGkvsoNPwSWh+q0mXFQoiQBpLnubjYNIvFjylp2JqUtH8EwO+oDsVBy2DDaoyV/Z2iQ4s33a18UGJpnlCCOa25Qs6mOOvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz; spf=pass smtp.mailfrom=perex.cz; dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b=JnEhJCx5; arc=none smtp.client-ip=77.48.224.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perex.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b="JnEhJCx5"
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id DE43C36C84;
	Wed, 26 Nov 2025 10:18:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz DE43C36C84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1764148700; bh=euB6j5Q6T2ApNmEPYLQLj1du71laGXVUHwWqAY5Zbl4=;
	h=From:To:Cc:Subject:Date:From;
	b=JnEhJCx5JaHaT6S1jP++99yaVAMyv+cq2eq7Yjg0k3DwS3FQqsaFJgI4VhTZ6oAXB
	 Hs7yRdkBkNHQ35WBI9FrqlGDyaOXLIvMwq1nkNftlT6gVIuxgDOB614hL0JXGs9ht0
	 7FFj4ZMMDe4LG4PuCONf9lAvzcs9DmNipu1Uuha4=
Received: from p1gen7.perex-int.cz (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Wed, 26 Nov 2025 10:18:16 +0100 (CET)
From: Jaroslav Kysela <perex@perex.cz>
To: Linux Sound ML <linux-sound@vger.kernel.org>
Cc: Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 0/2] nau8325 build fixes
Date: Wed, 26 Nov 2025 10:16:33 +0100
Message-ID: <20251126091759.2490019-1-perex@perex.cz>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing build configuration and fix the i2c probe function to follow
latest i2c core interface.

Jaroslav Kysela (2):
  ASoC: nau8325: use simple i2c probe function
  ASoC: nau8325: add missing build config

 sound/soc/codecs/Kconfig   | 5 +++++
 sound/soc/codecs/Makefile  | 2 ++
 sound/soc/codecs/nau8325.c | 3 +--
 3 files changed, 8 insertions(+), 2 deletions(-)

-- 
2.51.1

