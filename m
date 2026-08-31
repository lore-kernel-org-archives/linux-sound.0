Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BDF3911DD
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 20:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788208155; cv=none; b=Rbp/JpF49LvtI7yxdoFT42qYmfdXty81AmNeswvVWvaEuRG4APvL++rAYf7kuhtUZ2t4GZEEjFHeqR2cscYw16Cd07v1DXfm8L6X9TLXRu1y389vnGVen5qJeDLmgxXHuKWT/2RdkuNMfH+5RpGbXKAg2Ts/QBDEVgyZPv1yc1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788208155; c=relaxed/simple;
	bh=K3TTNLTj02sxCFOfmZAWRf9Xh/7adeuGUGZYLg8LKbw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dfYDA5szhGWRHGkmjHmGwecHetjbaaWMhOl8XftS0VuIzUEko7XBi9RjNnEu1sSH3GE9/mrstMGQQr3E3JsYeReXsKy1n1RdSPxgxVt6v5bsnW9pqJPmugk4BfOBHsuumm2MP+X0Lp7BXe2wKf0koAyhfSaXQx8n+QPrRXHlj8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CKwvIIga; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CKwvIIga"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5374D1F000E9;
	Mon, 31 Aug 2026 20:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788208152;
	bh=bZyg8xm640F4fEDpc/ce0SJxh+4jLECxzFDJI4CX60Q=;
	h=From:Subject:Date:To:Cc;
	b=CKwvIIgarPx4FnQz/nfTQpsZUtLl+RqDv7YWsk0G5+VcL1qNSkrY5SYKGRIIwlZN7
	 nMPn/Ds6ya2nOIZlqKKcL6TF1pUI7zYZHs6lQ3tneRd2KyDZBTS91hY6QyuJE8O2Dq
	 uGiJNTcNMBloPXE6a/538Gh1+4yOM7CSQT+lAaKyphlblV6fSSFnRJRpDtwelk0KdL
	 5OXxw4NmwcBpYOt7ZGv4X4JyS6CsocE+9eeOpoAQyfu+Pg3OktfZh7yHbiJsIdjgDH
	 dFptmh1mLI6/xU7u70CmCm7bvuYgRqQdi04sM4uOEB2yVGobcoDGINJYIKDz5lHnH6
	 FhPmu0VqHjuEQ==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH 0/6] ASoC: ab8500: Fix codec reset, routing and DAI setup
Date: Mon, 31 Aug 2026 22:29:05 +0200
Message-Id: <20260831-ab8500-codec-fixes-v1-0-f85024e717e3@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3LQQqAIBBA0avIrBsYLUW6SrQwm2o2GQoRhHdPW
 j4+/4XCWbjAqF7IfEuRdDboTkE8wrkzytoMhowjbyyGxVsijGnliJs8XFAP0VltdO8GgjZemf/
 Qvmmu9QMACUWSZAAAAA==
X-Change-ID: 20260825-ab8500-codec-fixes-14c651213640
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: linux-sound@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

Repair independent correctness problems in the AB8500 codec driver:
reset sequencing, AB8505 digital microphone GPIO setup, the capture
power graph, serial format setup, and TDM slot programming. Remove the
sidetone apply control which became destructive when its coefficient
controls were removed.

Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Linus Walleij (6):
      ASoC: ab8500: Reset the audio block before configuring it
      ASoC: ab8500: Repair the DAPM capture graph
      ASoC: ab8500: Correct digital interface format setup
      ASoC: ab8500: Validate and program TDM slots correctly
      ASoC: ab8500: Remove the nonfunctional sidetone apply control
      ASoC: ab8500: Skip missing DMIC GPIOs on AB8505

 sound/soc/codecs/ab8500-codec.c | 682 ++++++++++++++++------------------------
 1 file changed, 273 insertions(+), 409 deletions(-)
---
base-commit: 73ae59e975966d24e32926247ddb45a537ebe184
change-id: 20260825-ab8500-codec-fixes-14c651213640

Best regards,
-- 
Linus Walleij <linusw@kernel.org>

