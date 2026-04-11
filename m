Received: from r3-78.sinamail.sina.com.cn (r3-78.sinamail.sina.com.cn [202.108.3.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E870B2E414
	for <linux-sound@vger.kernel.org>; Sat, 11 Apr 2026 13:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775914002; cv=none; b=qEJdT2hedZsPp//anM2pVgTxzVsIO++2DQrTLS8CCSTsIfeAnFelV/MMUW5VfyqLJ90RSQ+Q63vltZcdTMloXBxmYoHZsHtF/OB9DKs/BAUeJ4KCIoBUJxtqaOBrUB+5SSaQ4b+pE00ItbVT+iWxns49UzGJ2hKnZW+NG3xbM0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775914002; c=relaxed/simple;
	bh=z41QYriRr0cGr78hdkVAktv0ga8RhabpA4Ogjz6V7IE=;
	h=From:To:Cc:Subject:Date:Message-Id; b=PtAYYZZKiWKjIVeBkbzcb6Vj0evgzk+SakJnx6jc/Scn3QJbtlrsgwZx06ZPiU18MMnsXb16Rvj7cM/PeNbqb7oaB77Le3X7vncozChbRUtrt5N9tJc2I+0fiZ0TyhydDl84fKuXt0O/sRIAEciBy/poq+NwaRbbwCm6WHuIHWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=202.108.3.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([180.154.36.64])
	by sina.net (10.54.253.37) with ESMTP
	id 69DA4C0100000EF7; Sat, 11 Apr 2026 21:26:26 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 52176C945CEB4327B3960750A5D73082
X-SMAIL-UIID: 52176C945CEB4327B3960750A5D73082-20260411-212626
From: Zhang Yi <zhangyi@everest-semi.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	linux-sound@vger.kernel.org
Cc: peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ckeepax@opensource.cirrus.com
Subject: RE: [PATCH CANCEL] 1
Date: Sat, 11 Apr 2026 21:26:22 +0800
Message-Id: <20260411132622.8046-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

Dear maintainers and list,

Please ignore the patch I sent earlier:

  Subject: [PATCH] 1
  Message-ID: <20260411131618.7931-1-zhangyi@everest-semi.com>

That patch is incorrect and should not be applied.

I will send a corrected version shortly if needed.

Sorry for the noise and any confusion caused.

Michael Zhang






