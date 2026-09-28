Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112B44B95C3
	for <linux-sound@vger.kernel.org>; Mon, 28 Sep 2026 14:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790604793; cv=none; b=jOgKKGUYdPDUZAU4nnlm/d5svi8MVHQULISsiHOAoUTnsExBxa702Fx89gZ435sIyastQG52KFJ92RkK+rQhjm19bHB/lAOZlnttB99s/rSq5X5Lpx6JpZjaDxrGIlI+svM7r5HAkTe/DQFSCLKJHwnduAHsHQ0UoVIsyg3ryRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790604793; c=relaxed/simple;
	bh=qQ7dIGCpAq01Wjw0rQUnlxh4pLYxYywK5jbLD1vF/VQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BMm421BSUqr+G2r67nVoCzeB7xkcvpAO/+kT1/onj9duZHMHXT2Fg44iSGrVufffuNcGPKSqIsOnzEnMLYatxP45u5qiNmwPIDee7k9QJshR8+7FzvQZzvA2gN5poOcRzWiIhKU9doMWzNTnEKqImnCx68KMws4Y8w9SgHiRBSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=TWry19bH; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="TWry19bH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=qQ
	7dIGCpAq01Wjw0rQUnlxh4pLYxYywK5jbLD1vF/VQ=; b=TWry19bHjBeVp8rHtS
	oY1aO5b1lShqYeo+GpldvFsxUx+Kl+3te3X3VAH80Fw7HoilseTECOG7nIEc42HS
	Z+MeWz6/J+l+bEcZjYzKb4bnaj5FjpJeKhC2aldwVne4vSwyOFde/BMDN5gU8UnQ
	yh8DWd+36UJIYSsQLJGrf0H8M=
Received: from zeyuli-Adol-14-M5451GADOL (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wDn94WwdbpqWDA5BQ--.28420S2;
	Mon, 28 Sep 2026 22:12:04 +0800 (CST)
From: Zeyu Li <13776528859@163.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Kailang Yang <kailang@realtek.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add ALC235 support for headset mode
Date: Mon, 28 Sep 2026 22:12:00 +0800
Message-ID: <20260928141200.20712-1-13776528859@163.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <8733ut5ylq.wl-tiwai@suse.de>
References: <8733ut5ylq.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDn94WwdbpqWDA5BQ--.28420S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUbxhpUUUUU
X-CM-SenderInfo: zprtllawvsmmivz6il2tof0z/xtbC3RXTiGq6dbX+TwAA3y

Hi Takashi,

Thanks for picking this up.

To confirm the test setup: this was verified on an ASUS M5451GA laptop
(codec HDA:10ec0235,10431814). Before the change, plugging in a CTIA
headset was detected by jack sense (mic presence and VREF bias were
set correctly), but the capture stream stayed permanently silent.
After applying the ALC255 coefficient sequence (COEF 0x45=0xd489,
0x1b=0x0c2b), the headset microphone captures audio correctly.

I'm happy to test any alternative coefficient values if Realtek
suggests a different sequence for the ALC235.

Best regards,
Zeyu Li

