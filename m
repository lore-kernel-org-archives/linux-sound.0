Received: from mx-relay47-hz3.antispameurope.com (mx-relay47-hz3.antispameurope.com [94.100.134.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71B833D6C5
	for <linux-sound@vger.kernel.org>; Tue, 16 Dec 2025 10:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.236
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765880604; cv=pass; b=kamZExRnHbWP06+j5ruY2iDbW9mlTRNsxZh5H7xuJE+T1q2n83Ru8ncu7REVQ952aNbNskTe+y4ILBxRHVeiqXuFg/9EbHIu8gTbQTTL0gCNre0fT7qDNV7pzCtgcMuj3wbViaaEFKfBFPS76GOCUKd9w/2FfpqUexnN1Zjcr50=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765880604; c=relaxed/simple;
	bh=dS/MBNVF12P8FVLf2bQOJwobgenh3gnp4kB8X/12dTI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=vBy/AR8BL+zm/XzpBeKzSvOd4MZuk6O2DrqAaQtG8RVnCZT/rliS1zlLwvEVxCuqYtPbo4MJfUSFMnRrst4ILn6I3D+Jn6t8HhaYaTy0fBYJRI37BTWFS7pf55FoWe0/U7SyZEjUTTJo7LPoBVdmx/pGGPI+bZIYLmSPc4xUivE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=gJmrYEPa; arc=pass smtp.client-ip=94.100.134.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="gJmrYEPa"
ARC-Authentication-Results: i=1; mx-gate47-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=WctSvoBhSvz0oJWI2JmOife8oyk7RTrj1YKf1sMtysg=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1765880587;
 b=PNbrz/EK6n5HfF5eK3kg7+u7+ktREPI6OFu53/xt3MdCTQn708hwu1fNEiixYCp9azdJj9vQ
 QTuRyM/QwAmbvLqw2UxKRKgZb7o66RAhvmaFusgpvVSQOv3VmIJXgKzerwSmE5lKXnNaKo8LwMT
 s41wQzDOf/2TEoJLqjaZSJvZk7iasK6TLYn5EGi2rGQRTk6dMegI8jkQruQsIpaV4RGsGTGoU63
 0ICh9Zn7XBjz7F7otXg3XJqFqrn19HvzTWwHTcpCK5EUSyiWS+GXJcVm8rppTwgjqubvzWK/CWy
 8SVh2sVAUxIbOyu1rLWmNkS8aGWreXM7WNDP/w+h00TtA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1765880587;
 b=ZmeSJK9BxKANvm04KOU1O+RSvt8v2Te1hU3mz+e/Ns+i086q1i7GWiEYccj3P6Yes0RIw2YW
 iITEqSPT23mNNGwrmnBSzWWhnbKhXXiIRhA7l3qhH/Yv2Kxs6MDoWG/iZbOYz7OedgRzBMsOs4c
 bdoeqsL0eWurQZUgLts8sTHNgLO4ANFmqU97rmrBet1ZCjlIswgWTY7QDDvZn/NoBI8pBxgm/J7
 OpuzJ1TjyC7tVsx2POQ1OKjHuFxq71TCtwhji+vtZ19tfqYoR8TpGy6oaUjzoCrz0R0V9qW4N/e
 Ykle+fbx4ALJOy5SJCf0Gnmh7qbeoI7IY16MxSgEI/DSA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay47-hz3.antispameurope.com;
 Tue, 16 Dec 2025 11:23:07 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 29A18CC0E8C;
	Tue, 16 Dec 2025 11:22:54 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] ASoC: fsl_sai: Add missing registers to cache default
Date: Tue, 16 Dec 2025 11:22:45 +0100
Message-ID: <20251216102246.676181-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:linux-sound@vger.kernel.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay47-hz3.antispameurope.com with 4dVtKp6DRYz4MYBs
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:0b8e2a2d7f219b50b02a2824fc9faeb1
X-cloud-security:scantime:2.437
DKIM-Signature: a=rsa-sha256;
 bh=WctSvoBhSvz0oJWI2JmOife8oyk7RTrj1YKf1sMtysg=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1765880586; v=1;
 b=gJmrYEPapzilDdQTWV8YCsPbVage0UXHRt7//AG3xXnOLdMksUBFcNt+FHxFk/zbOIBgT6m/
 scl8g69dA8trtOd2pKLjIeLJIXA+J5zAYUyYddGX66IhtkgHbh44v10f+uUIJkMupNNvJ9irMza
 qkVLWsY8mO3oewt/DVA5uUkLHMo4eKvXqLOL/FToPkYtNL9o6HpvNTc9nim0+P0Uuz6iFJWUUF7
 IZ7o8dZ4Xd6gfucxakJvxRdj3NuP4yB6OH+qBBethOtsuAFWFXsmgs4lR6vpj8k9O9fhOfqfSPB
 KiWSCYeLfEcNQKBq2RwA/ktHFmJPwx1K/u695xrNMZAAA==

Drivers does cache sync during runtime resume, setting all writable
registers. Not all writable registers are set in cache default, resulting
in the erorr message:
  fsl-sai 30c30000.sai: using zero-initialized flat cache, this may cause
  unexpected behavior

Fix this by adding missing writable register defaults.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 sound/soc/fsl/fsl_sai.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 86730c2149146..2fa14fbdfe1a8 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1081,6 +1081,7 @@ static const struct reg_default fsl_sai_reg_defaults_ofs0[] = {
 	{FSL_SAI_TDR6, 0},
 	{FSL_SAI_TDR7, 0},
 	{FSL_SAI_TMR, 0},
+	{FSL_SAI_TTCTL, 0},
 	{FSL_SAI_RCR1(0), 0},
 	{FSL_SAI_RCR2(0), 0},
 	{FSL_SAI_RCR3(0), 0},
@@ -1104,12 +1105,14 @@ static const struct reg_default fsl_sai_reg_defaults_ofs8[] = {
 	{FSL_SAI_TDR6, 0},
 	{FSL_SAI_TDR7, 0},
 	{FSL_SAI_TMR, 0},
+	{FSL_SAI_TTCTL, 0},
 	{FSL_SAI_RCR1(8), 0},
 	{FSL_SAI_RCR2(8), 0},
 	{FSL_SAI_RCR3(8), 0},
 	{FSL_SAI_RCR4(8), 0},
 	{FSL_SAI_RCR5(8), 0},
 	{FSL_SAI_RMR, 0},
+	{FSL_SAI_RTCTL, 0},
 	{FSL_SAI_MCTL, 0},
 	{FSL_SAI_MDIV, 0},
 };
-- 
2.43.0

