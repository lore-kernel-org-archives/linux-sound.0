Received: from mail78-63.sinamail.sina.com.cn (mail78-63.sinamail.sina.com.cn [219.142.78.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01A31FFC5F
	for <linux-sound@vger.kernel.org>; Fri, 23 May 2025 02:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=219.142.78.63
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747967817; cv=none; b=Dmn9KXoL6W7WG4ZNn7wcIWeKEWJc80S1b7M9RKS6hEAdVFbgEz6vksmrut5zhdObk1ER6c4D+EgCG6wRn/zGA5VgP46xZ80sbrXZBgEwqnGbHcUv9Ig4Yjy933s+Qvv3WK7Lp+gJpUN9prAybiB77c7r4FFRyPEKu21u8fkbUSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747967817; c=relaxed/simple;
	bh=D8yq86l72M6nD5O9uLQN4hl4smk/KgoafGw+uS/SsMg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=qPYK8lNfSpVwNYebXgspFeYGUJEec/3++n53qWmOtWOqBc03J/Oj0Aac4wlbFKwkh/jdqaKUXt3gddskSS87tVcIMzt8zqAvasDRl33dfS6uAuIrbc9bkKk/IRsKy6d/t8SXdmIFQMzAH/wgYzyEia6TggtN8cGkNZnbp/3Jtp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=219.142.78.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([180.172.39.205])
	by sina.net (10.185.250.32) with ESMTP
	id 682FDF42000051ED; Fri, 23 May 2025 10:36:52 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 3208C6CF4AD64FC68EA887B61F214A7B
X-SMAIL-UIID: 3208C6CF4AD64FC68EA887B61F214A7B-20250523-103652
From: Zhang Yi <zhangyi@everest-semi.com>
To: krzk@kernel.org
Cc: robh@kernel.org,
	tiwai@suse.com,
	devicetree@vger.kernel.org,
	conor+dt@kernel.org,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	krzk+dt@kernel.org,
	amadeuszx.slawinski@linux.intel.com,
	broonie@kernel.org
Subject: RE: [PATCH v1 2/2] ASoC: codecs: add support for ES8375
Date: Fri, 23 May 2025 10:36:49 +0800
Message-Id: <20250523023649.22785-3-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250523023649.22785-1-zhangyi@everest-semi.com>
References: <20250523023649.22785-1-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

> > Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
> > Reported-by: kernel test robot <lkp@intel.com>
> 
> This never happened - robot did not report this driver.
> 
> > Closes: https://lore.kernel.org/oe-kbuild-all/202505221528.nvWwf9kj-lkp@intel.com/
> 
> Please read carefully above email. It explains what to do with the tags.

Okay, thanks.
