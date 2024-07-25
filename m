Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDB017557C;
	Thu, 25 Jul 2024 09:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721898842; cv=none; b=UlMVbszWxMLtPL0iFrI0CKAjLgYN/fMLiYlrNPuJba6WDS6ps2DTJJKzM/4cf2CN0lsw8wBhRg2jsF9sPalGgsJ5QTQG0eqBOkLndzeE5/M91z89n0Rp06+tTjDz5ueHVPrCiT7hodsekm9RpFAnqc859b+cjlMeL530UcNPIxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721898842; c=relaxed/simple;
	bh=VYIdlkHXfvupXOxZkxAbDIIUevfv/4AwQx6d27AQhCQ=;
	h=From:To:Subject:Date:Message-Id; b=VAaYogtwabBVESWGXCK1IkExL+8bTyHSkun/A2nNBLCcDAGQSn7kOyIp9Gco6eIIyIXAGcI2mz89RbDyendBik2pniU2OeKWnFdpQX/lVM083LBl15VeP+NAAV+9mlkd/idOPRBDDFEZOO5UBy4/z+eKmQThNmSQ0abCaPPbH6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id C5C0B1A0507;
	Thu, 25 Jul 2024 11:13:59 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 8DEAC1A04DF;
	Thu, 25 Jul 2024 11:13:59 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id E6A20181D0FA;
	Thu, 25 Jul 2024 17:13:57 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] ASoC: fsl_micfil: Check the difference for i.MX8 and i.MX9 
Date: Thu, 25 Jul 2024 16:54:52 +0800
Message-Id: <1721897694-6088-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

There are some register difference for i.MX8 and i.MX9
REG_MICFIL_FIFO_CTRL definition is updated.
REG_MICFIL_FSYNC_CTRL, REG_MICFIL_VERID, REG_MICFIL_PARAM are added from
i.MX9

Shengjiu Wang (2):
  ASoC: fsl_micfil: Expand the range of FIFO watermark mask
  ASoC: fsl_micfil: Differentiate register access permission for
    platforms

 sound/soc/fsl/fsl_micfil.c | 20 +++++++++++++++-----
 sound/soc/fsl/fsl_micfil.h |  2 +-
 2 files changed, 16 insertions(+), 6 deletions(-)

-- 
2.34.1

