Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C63F1DE3DD;
	Mon, 28 Oct 2024 15:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730130221; cv=none; b=f1nXvVKZmdFtC2DlP1vHu+DngiGW6Ncgb1dTNUAcda7QAMzPTtXk2GLhWKQlbcvyZx0eM/TToQRWp7roTigoRMp1C8lNzQiiNhZYMAkIZrBDTplS368M5dRxrq5xOqfyeK8FCkI7PtTMgKWZTOuXZbbdVKPLa+bFNHHLMB/CAtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730130221; c=relaxed/simple;
	bh=hG904Ejk14QzUK5GUCqREAtgpqylEPSsrKPmrN/RinA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HxsWwwtMuoCZO12EewGiowJnTci89JhbJ3DL6M8NXvAbdQdeQnY5t6NsfcO7R+S+SLX5aq/AsdKnvQKYSuIiehSEK1EwDMCf6j7yCMZoB0hqAseCMSmKFkvug2993WFdrPWI3huv8Dhm8BWT1JNvfuobnu8E3OOyP/FNdhOYNWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DsWvbA7u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DsWvbA7u"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D4ACDC4CEC3;
	Mon, 28 Oct 2024 15:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730130220;
	bh=hG904Ejk14QzUK5GUCqREAtgpqylEPSsrKPmrN/RinA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=DsWvbA7uJoQUd2XlRSYQ4LHAZFFtAE9EheIJqV7DZuRjttnxV69Wat+LU03HGpp4q
	 J7+NMtfIGdNTJwuZX+FLsOvAlSedQsi6kopCcLqNtVey0I/UuNcs2aVlKW9y2lFqcj
	 Hfo98zDgWd4On/eBD1XhqpBmUNw92tK8O+na7WF6yrJvidaMLN0QtPgsHJCCRH12bz
	 YdoVU37LDNmJm4uKwFSfaKpEMuv4rwKfyCiHXJS2+fWFd9LqOqtuKVNB/u1gLOPcoA
	 6ASibOa/7lrfptbhSI17cxWZQDbM7ArjIxW9CFb9NuIQtbWBmhrSGeWgx4X06qrj6V
	 2tiLncXvuaUbw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9497D33999;
	Mon, 28 Oct 2024 15:43:40 +0000 (UTC)
From: Nuno Sa via B4 Relay <devnull+nuno.sa.analog.com@kernel.org>
Subject: [PATCH v2 0/4] ASoC: codecs: adau1373: drop platform data
Date: Mon, 28 Oct 2024 16:43:37 +0100
Message-Id: <20241028-adau1373-shutdown-v2-0-647f56bbd182@analog.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIACmxH2cC/x2MuwqAMAwAf0UyWzCpUPRXxKHa1Gap0voC8d8tD
 jfccPdA5iScoa8eSHxKljUWobqCOdi4sBJXHKihFgvKOnugNlrlcOxuvaLqkNiT1zihgdJtib3
 c/3MY3/cDn9cZ2GMAAAA=
To: linux-sound@vger.kernel.org, devicetree@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730130219; l=1126;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=hG904Ejk14QzUK5GUCqREAtgpqylEPSsrKPmrN/RinA=;
 b=Mioo4Du/EgbgNIZY5irudzwOi/1vAN5HzRIrCZc6P+J950jCVzehd6biTY+6nGthqQnSl4z+I
 CtWSydD+XJvDVzKfPFLTsxnnYz1vUAbGTmN8epWRqDX12JFuTZXv06w
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-Endpoint-Received: by B4 Relay for nuno.sa@analog.com/20231116 with
 auth_id=100
X-Original-From: Nuno Sa <nuno.sa@analog.com>
Reply-To: nuno.sa@analog.com

Hi Mark,

Here it goes v2...

v1:
 * https://lore.kernel.org/all/20241021-adau1373-shutdown-v1-0-bec4ff9dfa16@analog.com/ 

v2:
 - Patch 2 (Bindings):
   * Removed extra blank line;
   * Fixed example messed indentation;
   * Added more properties to the example;
   * Add maxItems.
 - Patch 4 (Powerdown gpio):
   * Powerdown the chip when unbound.

---
Nuno Sa (4):
      ASoC: codecs: adau1373: add some kconfig text
      ASoC: dt-bindings: document the adau1373 Codec
      ASoC: codecs: adau1373: drop patform_data
      ASoC: codecs: adau1373: add powerdown gpio

 .../devicetree/bindings/sound/adi,adau1373.yaml    | 111 +++++++++++
 MAINTAINERS                                        |   1 +
 include/sound/adau1373.h                           |  33 ----
 sound/soc/codecs/Kconfig                           |   2 +-
 sound/soc/codecs/adau1373.c                        | 208 ++++++++++++++++-----
 5 files changed, 272 insertions(+), 83 deletions(-)
---
base-commit: e25169fb5a8c37e8f7d1da3d1427dee938f15f07
change-id: 20241024-adau1373-shutdown-912ef2f31b17
--

Thanks!
- Nuno Sá


