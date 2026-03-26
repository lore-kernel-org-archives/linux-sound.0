Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A968439A815
	for <linux-sound@vger.kernel.org>; Thu, 26 Mar 2026 23:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774567601; cv=none; b=IZGuDY1j5JQUzXTsPcsyyi+9SVugoBSckmBvdSCWgeb+8HCFCs0Efmo87S1Kz7Tz/X48csbGLABOHuqjyDS4boXw3RrGwp7vFgmNTti3KaVOxqUycqHQD4aTbKiPI6wl1Pn1wleX+E7YwEsYY1pEiHRFtZoqQVUfAU6/67FnPH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774567601; c=relaxed/simple;
	bh=rpP4p2GAxkkVW3vLB0h9/ZfXbD/uIekPbcVig5tvuCI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oCifMidRehpYx7Nrb6wR0NFxQDjogYGntT2iR2luTRwyDtNJ0NEY+5qrRnZj0+6t3qRG9P0SrDSdgWcEDiF/ZikVwwi1PBnCuMSOqIzrwisGY7C804Z1oUsJHbbtBNFbwn1dyzW+/g6QhrLDbk+ojki+OXES/px1gIjpDlhi+Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UYog+QIG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UYog+QIG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39E1CC116C6;
	Thu, 26 Mar 2026 23:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774567601;
	bh=rpP4p2GAxkkVW3vLB0h9/ZfXbD/uIekPbcVig5tvuCI=;
	h=From:Subject:Date:To:Cc:From;
	b=UYog+QIGXaAGPRYhEqvswKro8yj5W8p3O/UHP2nie/T+11PlWgbEec/ogu0aNBdSz
	 FOWyiv3+6W/32UN8h/lCbw8hyDy+DKpdhXggovqQG7xGlV+0P2PBNRosshbXD9rYsu
	 uAlJk+z+yidGKRkXdIPHVywIvQ2RjtWa6Rp0Z/4DPyQYoqzhzD/e5ucDji13nzfyNd
	 k3kVeONykpnsqc046jaXvUvfbTGMVTMnP74/OFwxtG1EnXlushdvkg1aP4lQw7ENhO
	 btOvAz0upo6IEGtD7zlGTQuLzqr+IRSCfHJPgQPjvmm8wETSg8TsOtmk/depjbI6RG
	 v/HjcaUc4CKTA==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH 0/3] ASoC: Drop some unused GPIO includes
Date: Fri, 27 Mar 2026 00:26:37 +0100
Message-Id: <20260327-asoc-rt1318-v1-0-9fcecf868fda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avIrBMcBY2uEi1Ep5qNhkYE4t2Tl
 m/xf4NKhanCIhoUerhyTgM4CQinTwdJjsOglbbKaCd9zUGWGw3OEolsCBg1ugijuArt/P63dev
 9A/4YpthdAAAA
X-Change-ID: 20260327-asoc-rt1318-1ee6cc1d217d
To: Oder Chiou <oder_chiou@realtek.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

This drops the unnecessary legacy includes from three
more codecs.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Linus Walleij (3):
      ASoC: rt1318: Drop unused include
      ASoC: nau8315: Drop unused include
      ASoC: ts3a227e: Drop unused include

 sound/soc/codecs/nau8315.c  | 1 -
 sound/soc/codecs/rt1318.c   | 1 -
 sound/soc/codecs/ts3a227e.c | 1 -
 3 files changed, 3 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260327-asoc-rt1318-1ee6cc1d217d

Best regards,
-- 
Linus Walleij <linusw@kernel.org>

