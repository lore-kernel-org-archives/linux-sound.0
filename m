Received: from mx-relay87-hz1.antispameurope.com (mx-relay87-hz1.antispameurope.com [94.100.132.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181F4322C63
	for <linux-sound@vger.kernel.org>; Tue, 16 Dec 2025 09:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.132.254
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765878127; cv=pass; b=jR/IDgLLIQ/3dTakhCBfddQFOWOa2SdIdho84TiFlmVHIkq7ZMBg1//+hy60VelH31rBvViCapuq1BVvFPJ5XmIQ4ULdGBEtGpr6elvKgEAlT6F1Gv/jKRju6QSeiA+kKR4mpcfEaJgdsM6LDFX1YkeTLcFB0TOuKV89QhLMy9A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765878127; c=relaxed/simple;
	bh=AFsa+PSYR9llYDaCG9i+HghRnbJe0z1K9seBE+8E3Nw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aUS0FQgzAIdk0h2E00sOP9P3dzr77pYBHr0j0YaV+rQmaIWoevSkBzx3wDLyhU4Tngj28ErHcEpyVTtmJjKcrbVV/wvLNVv6JRd2/nh/yW/JvDUwdxbgGT9LXwD7K4E/gdJU7lsJPOJa9Wl5XgI9WF5710yDgrnPZacwXX4cnP0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=i08G4EKb; arc=pass smtp.client-ip=94.100.132.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="i08G4EKb"
ARC-Authentication-Results: i=1; mx-gate87-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=Pkc/gLz9kLB8qCYf/I6OZ0Fsfo/vuRi3II2eQE+5I88=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1765878059;
 b=K0pHYdACbstLX/Sv7PdfpGMALekQdDabr/vAzoFHIN2fCILCucD1IKtet8ZwIg+9rF5MNkSj
 GfVUNpxdHgQ3kyAVANtYlak9QYbNHqOKkY8fPgNXiFT6/C+n0nC0n83TDbRdGn7+6hAuo/0rTEz
 bjhRMk0MkJPT9qZrsciVj4J3WNZS3IR8/p+szwDxJwnL8TXIDib3xdIw0DO4auCPj5Q3hMIFvxn
 8AOoJxOu9Q+iY/UnUgwL4CO4r3PXpwiYI4HuOTEBCg8pMpGWlkxvo2pzf0j4SjJ2xM2SrcykvJb
 ICfwW2w3c+NorX+jtqmvAXl62bWcedx2Rp3a4B+mSM3ZQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1765878059;
 b=lZ7oO30ZtRpSCSOI6Z5j4lqSOiHsLWcoS0GAdBqGXF05F2I/cELtZT2KKlrZLbv2Qcmvy+Xz
 H+mFOQAh9Q9BniGKJDeLaFk063QASznDochjAfVAJPHBOw9LyRXLA9oxtz+4myxdO+5RFn1L8uV
 aY2uOvXukIXfs7CqDcdHUlwopysvcaHzAL3KI3paazK+sKTfLqxKY7qVfft7qaMleako4h8mwlj
 tzRL7Qh4UzUeR5ZgNuVejnsdLgf03QU0iO8LaEB9o2+8TNFue1bifyNovunEOzmmL0omKSILNlT
 HDwB+JD60jiAxm1bHXq2R2PLjqCdi94yLVY9gWw3GjcjQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay87-hz1.antispameurope.com;
 Tue, 16 Dec 2025 10:40:58 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 6A8BA5A0DF1;
	Tue, 16 Dec 2025 10:40:47 +0100 (CET)
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
Subject: [PATCH 0/2] ASoC: fsl_easrc: Fix duplicate debufs entries
Date: Tue, 16 Dec 2025 10:40:41 +0100
Message-ID: <20251216094045.623184-1-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay87-hz1.antispameurope.com with 4dVsPD0WvRz29h7p
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security:scantime:1.833
DKIM-Signature: a=rsa-sha256;
 bh=Pkc/gLz9kLB8qCYf/I6OZ0Fsfo/vuRi3II2eQE+5I88=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1765878058; v=1;
 b=i08G4EKbXkL5dCt2pqXlg4aQp26q7yl7IqKW5t0VdF1tu2ZF0WPaQsYnjSTrjNrANSlkH0i+
 LZBwmyB/UUOXA0RTvRk5a/FnJrYo7g6L2k5xk1pS3FJLVALRGueveCvDKQlG+BkhCcRS/yECyIT
 GMmlolMPbHOJhBYlXiEkbx8wuYmhKsuocqNauNwqO4WtryJnOpwDQI3ncYaJVOxFj731Q3+F574
 p04pzBBc1BOMR3KpPDQFS++EwQubr2uckxiiTs+Xfi1RPhDjHRMCWsyovPIVKgya8bzdh/FtcL0
 1kaIBoTVLc7FsCl9pDhIfKd3eVkeJnohHofeVJ62alj1g==

Hi,

this series fixes the error regarding duplicate debugfs directory creation on
TQMa8MPxL (imx8mp) when easrc is enabled:
  debugfs: '30c90000.easrc' already exists in 'tqm-tlv320aic32'

This is caused because fsl_easrc adds two components which use the device name
as component name. Debugfs directories for each component is created, resulting
on name conflict. Fix this by adding the debugfs_prefix for both component
drivers.

Before:
$ ls /sys/kernel/debug/asoc/tqm-tlv320aic32/
30c30000.sai  30c90000.easrc  HiFi-ASRC-FE  dapm  dapm_pop_time
dma:30c30000.sai  tlv320aic32x4.1-0018

After:
$ ls /sys/kernel/debug/asoc/tqm-tlv320aic32/
30c30000.sai  HiFi-ASRC-FE  asrc:30c90000.easrc  dapm  dapm_pop_time
dma:30c30000.sai  easrc:30c90000.easrc  tlv320aic32x4.1-0018

Best regards,
Alexander

Alexander Stein (2):
  ASoC: fsl_easrc: fix duplicate debugfs directory error
  ASoC: fsl_asrc_dma: fix duplicate debugfs directory error

 sound/soc/fsl/fsl_asrc_dma.c | 3 +++
 sound/soc/fsl/fsl_easrc.c    | 3 +++
 2 files changed, 6 insertions(+)

-- 
2.43.0

